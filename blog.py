from flask import Flask, render_template, request,session,redirect,flash
from flask_sqlalchemy import SQLAlchemy          #its import for the sql dataase connect
from datetime import datetime
import json                           
from flask_mail import Mail
import os
import math
from werkzeug import secure_filename                   #its file security module

ALLOWED_HOSTS = ['*']

with open("config.json",'r')  as c:
    parameter=json.load(c)['parameter']
local_server=True
app = Flask(__name__)
app.secret_key='super-secret-key'
app.config['UPLOAD_FOLDER'] = parameter['upload_location']
app.config.update(
    MAIL_SERVER='smtp.gmail.com',
    MAIL_PORT='465',
    MAIL_USE_SSL=True,
    MAIL_USERNAME=parameter['gmail-user'],                  #gmail-username from the config.json
    MAIL_PASSWORD=parameter['gmail-pass']                   #gmail-password from the config.json
)
mail=Mail(app)
if(local_server):
    app.config['SQLALCHEMY_DATABASE_URI'] = parameter['local_uri']
else:
    app.config['SQLALCHEMY_DATABASE_URI']=parameter['prod_uri']
db = SQLAlchemy(app)


class Contacts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), nullable=False)
    email = db.Column(db.String(20), nullable=False)
    phone = db.Column(db.String(12), nullable=False)
    msg = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12), nullable=True)

class Posts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80), nullable=False)
    slug = db.Column(db.String(21), nullable=False)
    content = db.Column(db.String(300), nullable=False)
    tag_line = db.Column(db.String(300), nullable=False)
    date = db.Column(db.String(12), nullable=True)
    img_file = db.Column(db.String(12), nullable=True)
    

@app.route("/")
def home():
    flash("Submit your details in contact tab for feedback.Thank you","success")
    posts=Posts.query.filter_by().all()                       #this for see all the post
    #[0:parameter['no_of_post']]
    last=math.ceil(len(posts)/int(parameter["no_of_post"]))
    #posts=posts[]
    
    page=request.args.get('page')
    if(not str(page).isnumeric()):
        page=1
    page=int(page)
    posts=posts[(page-1)*int(parameter["no_of_post"]):(page-1)*int(parameter["no_of_post"])+int(parameter["no_of_post"])]

    if(page==1):
        prev="#"
        next="/?page="+str(page+1)
    elif(page==last):
        prev="/?page=" +str(page-1)
        next="#"
    else:
        prev="/?page=" +str(page-1)
        next="/?page="+str(page+1)

    return render_template('index.html',parameter=parameter,posts=posts,prev=prev,next=next)

@app.route("/post/<string:post_slug>",methods=['GET'])
def post_route(post_slug):
    post= Posts.query.filter_by(slug=post_slug).first()
    return render_template('post.html',parameter=parameter,post=post)

@app.route("/about")
def about():
    return render_template('about.html',parameter=parameter)

@app.route("/dashboard",methods=['GET','POST'])
def dashboard():
    if ('user' in session and session['user'] == parameter['admin_user']):
        posts = Posts.query.all()
        flash("You have already loged in ","success")
        return render_template('dashboard.html',parameter=parameter,posts=posts)
        
    if request.method=='POST':
        username = request.form.get('uname')
        userpass = request.form.get('pass')
        if (username == parameter['admin_user'] and userpass == parameter['admin_password']):
            #set the session varaiable
            session['user'] = username
            posts = Posts.query.all()
            flash("Welcome ","success")
            return render_template('dashboard.html',parameter=parameter,posts=posts)
            
    return render_template('login.html',parameter=parameter)


@app.route("/edit/<string:sno>",methods=['GET','POST'])
def edit(sno):
    if ('user' in session and session['user'] == parameter['admin_user']):
        if request.method=='POST':
            box_title = request.form.get('title')
            tline = request.form.get('tline')
            slug = request.form.get('slug')
            content = request.form.get('content')
            img_file = request.form.get('img_file')
            date=datetime.now()

            if sno=="0":
                post=Posts(title=box_title,slug=slug,content=content,tag_line=tline,img_file=img_file,date=datetime.now())
                db.session.add(post)
                db.session.commit()
                flash("Successfully submited your blog.","success")
            else:
                post=Posts.query.filter_by(sno=sno).first()
                post.title=box_title
                post.slug=slug
                post.content=content
                post.tag_line=tline
                post.img_file=img_file
                post.date=date
                db.session.commit()
                
                return redirect("/edit/0"+sno)
        post=Posts.query.filter_by(sno=sno).first() 
        return render_template("edit.html",parameter=parameter,post=post,sno=sno)


@app.route("/uploader", methods = ['GET', 'POST'])
def uploader():
    if ('user' in session and session['user'] == parameter['admin_user']):
        if request.method == 'POST':
            f=request.files['file1']
            f.save(os.path.join(app.config['UPLOAD_FOLDER'],secure_filename(f.filename)))
            return "Uploaded Succesfully.."

@app.route("/delete/<string:sno>",methods=['GET','POST'])
def delete(sno):
    if ('user' in session and session['user'] == parameter['admin_user']):
        post=Posts.query.filter_by(sno=sno).first()
        db.session.delete(post)
        db.session.commit()
    return redirect('/dashboard')


@app.route("/logout")
def logout():
    session.pop('user')
    return redirect('/dashboard')

@app.route("/contact", methods = ['GET', 'POST'])
def contact():
    if request.method=='POST':
        name = request.form.get('name')
        email = request.form.get('email')
        phone = request.form.get('phone')
        message = request.form.get('message')
        entry = Contacts(name=name, phone = phone, msg = message, date= datetime.now(),email = email )
        db.session.add(entry)
        db.session.commit()
        mail.send_message('New message from ' +name,
                            sender=email,
                            recipients=[parameter['gmail-user']],
                            body = message + "\n" + phone)
        
        flash("Thanks for submiting your details.We will get back to you soon.","success")                       
    return render_template('contact.html',parameter=parameter)

app.run(debug=True)