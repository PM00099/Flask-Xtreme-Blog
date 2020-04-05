-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 26, 2020 at 07:18 AM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 5.6.36

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `xtreme-blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `firstName` varchar(125) NOT NULL,
  `lastName` varchar(125) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` varchar(25) NOT NULL,
  `address` text NOT NULL,
  `password` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `confirmCode` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `firstName`, `lastName`, `email`, `mobile`, `address`, `password`, `type`, `confirmCode`) VALUES
(4, 'Nur', 'Mohsin', 'mohsin@gmail.com', '01677876551', 'Dhaka', '$5$rounds=535000$w/MRBgS3SCDxMfkt$q.6o0T3/bF6wpch9ErkAuvOItlJeWq/hw5zgpEBOiY0', 'manager', '0');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `sno.` int(11) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `msg` text NOT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`sno.`, `name`, `email`, `phone`, `msg`, `date`) VALUES
(1, 'divyen', 'divyenmithaiwala96@gmail.com', '9727671802', 'rfre', '2019-09-19 16:20:35'),
(3, 'Chintan', 'CH@gmail.com', '8523657894', 'ksjdfhks', '2019-09-19 16:25:57'),
(4, 'Priyank Mithaiwala', 'priyankmithaiwala@gmail.com', '9726713598', 'First post', '2019-09-19 16:26:40'),
(5, 'nilaxi', 'nil@gmail.com', '8401856328', 'mom', '2019-09-19 16:29:15'),
(6, 'Asjad Motara', 'Aj@gmail.com', '8469612280', 'Its nice website...', '2019-09-22 21:31:33');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `ofname` text NOT NULL,
  `pid` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `oplace` text NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `dstatus` varchar(10) NOT NULL DEFAULT 'no',
  `odate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ddate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `uid`, `ofname`, `pid`, `quantity`, `oplace`, `mobile`, `dstatus`, `odate`, `ddate`) VALUES
(1, NULL, 'Kashmiri Chador', 1, 2, 'Khilkhet, Dhaka', '01609876543', 'no', '2018-09-21 13:05:07', NULL),
(2, NULL, 'Nur Mohsin', 1, 3, 'Khilkhet, Dhaka', '01609876543', 'no', '2018-09-21 13:08:55', NULL),
(3, NULL, 'Nur Mohsin', 2, 4, 'Dhaka', '09876543123', 'no', '2018-09-21 13:13:04', NULL),
(4, NULL, 'Nur Mohsin', 4, 1, 'Manikganj', '798345', 'no', '2018-09-21 13:18:47', NULL),
(5, NULL, 'Nur Mohsin', 9, 4, 'Dhaka, Bangladesh', '01609876543', 'no', '2018-09-22 02:01:02', NULL),
(6, NULL, 'Nur Mohsin', 2, 1, 'Manikganj', '01609876543', 'no', '2018-09-22 02:09:29', NULL),
(7, 9, 'Nur Mohsin', 2, 1, 'Manikganj', '01609876543', 'no', '2018-09-22 02:10:46', NULL),
(8, 9, 'Nur Mohsin', 1, 1, 'Manikganj', '0994', 'no', '2018-09-22 03:04:13', NULL),
(9, 9, 'Kashmiri Chador', 12, 4, 'Dhaka', '01609876543', 'no', '2018-09-22 03:21:14', '2018-09-29'),
(10, 9, 'Chador', 13, 1, 'Dhaka', '01609876543', 'no', '2018-09-22 03:22:05', '2018-09-29');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(11) NOT NULL,
  `title` text NOT NULL,
  `tag_line` text NOT NULL,
  `slug` varchar(30) NOT NULL,
  `content` text NOT NULL,
  `img_file` varchar(12) NOT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `title`, `tag_line`, `slug`, `content`, `img_file`, `date`) VALUES
(1, 'Python programming', 'Best programming language.', 'python', 'Python is an interpreted, high-level, general-purpose programming language. Created by Guido van Rossum and first released in 1991, Python\'s design philosophy emphasizes code readability with its notable use of significant whitespace. Its language constructs and object-oriented approach aim to help programmers write clear, logical code for small and large-scale projects.\r\n\r\nPython is dynamically typed and garbage-collected. It supports multiple programming paradigms, including procedural, object-oriented, and functional programming. Python is often described as a \"batteries included\" language due to its comprehensive standard library.\r\n\r\nPython was conceived in the late 1980s as a successor to the ABC language. Python 2.0, released 2000, introduced features like list comprehensions and a garbage collection system capable of collecting reference cycles. Python 3.0, released 2008, was a major revision of the language that is not completely backward-compatible, and much Python 2 code does not run unmodified on Python 3. Due to concern about the amount of code written for Python 2, support for Python 2.7 (the last release in the 2.x series) was extended to 2020. Language developer Guido van Rossum shouldered sole responsibility for the project until July 2018 but now shares his leadership as a member of a five-person steering council.\r\n\r\nPython interpreters are available for many operating systems. A global community of programmers develops and maintains CPython, an open source reference implementation. A non-profit organization, the Python Software Foundation, manages and directs resources for Python and CPython development.   ', 'p.jpg', '2019-09-21 18:59:22'),
(2, 'Django framework', 'best ever python framework', 'dj', 'Django is a Python-based free and open-source web framework, which follows the model-template-view (MTV) architectural pattern. It is maintained by the Django Software Foundation (DSF), an independent organization established as a 501 non-profit.\r\n\r\nDjango\'s primary goal is to ease the creation of complex, database-driven websites. The framework emphasizes reusability and \"pluggability\" of components, less code, low coupling, rapid development, and the principle of don\'t repeat yourself.Python is used throughout, even for settings files and data models. Django also provides an optional administrative create, read, update and delete interface that is generated dynamically through introspection and configured via admin models.', 'dj.jpg', '2019-09-19 19:13:23'),
(3, 'Flask microframework', 'Best ever using python framework', 'flask', 'Flask is a micro web framework written in Python. It is classified as a microframework because it does not require particular tools or libraries.It has no database abstraction layer, form validation, or any other components where pre-existing third-party libraries provide common functions. However, Flask supports extensions that can add application features as if they were implemented in Flask itself. Extensions exist for object-relational mappers, form validation, upload handling, various open authentication technologies and several common framework related tools. Extensions are updated far more frequently than the core Flask program.\r\n\r\nApplications that use the Flask framework include Pinterest, LinkedIn, and the community web page for Flask itself.\r\n\r\n', 'f.jpg', '2019-09-19 21:22:56'),
(4, 'jinja2', 'Best python web engine', 'jinja2', 'Jinja, also commonly referred to as \"Jinja2\" to specify the newest release version, is a Python template engine used to create HTML, XML or other markup formats that are returned to the user via an HTTP response.\r\n\r\nhe first recorded public released of Jinja2 was in 2008 with 2.0rc1. Since then the engine has seen numerous updates and remains in active development.\r\n\r\nJinja2 engine certainly wasn\'t the first template engine. In fact, Jinja2\'s syntax is inspired by Django\'s built-in template engine, which was released several years earlier. There were many template systems, such as JavaServer Pages (JSPs), that originated almost a decade before Jinja2. Jinja2 built upon the concepts of other template engines and today is widely used by the Python community.', 'j.png', '2019-09-19 21:26:09'),
(5, 'Bootstrap', 'Best CSS framework', 'bootstrap', 'Bootstrap is a CSS framework that makes it easier to create website and web application user interfaces. Bootstrap is especially useful as a base layer of CSS to build sites with responsive web design.\r\n\r\nBootstrap 3 was out for almost five years before Bootstrap 4 was finally released at the start of 2018. When learning Bootstrap you will likely come across many tutorials that cover Bootstrap 3 but not version 4.\r\n\r\nIf you are completely new to Bootstrap and CSS frameworks in general then I recommend learning Bootstrap 4. If you have already been working with Bootstrap 3 then there is no major rush to upgrade to the latest version. Bootstrap 4 is more complicated than version 3 because it has a lot more features so the learning curve is a bit steeper.\r\n\r\nFull Stack Python is actually built with an early version of Bootstrap 3. However, this site is so heavily customized with my own CSS that I likely will never upgrade to Bootstrap 4 because there are no new features that I feel will be useful in my specific situation.', 'b.jpg', '2019-09-19 21:29:32'),
(6, 'web2py', 'It is one of best python framework.', 'web2py', 'Web2py is an open-source web application framework written in the Python programming language. Web2py allows web developers to program dynamic web content using Python. Web2py is designed to help reduce tedious web development tasks, such as developing web forms from scratch, although a web developer may build a form from scratch if required.[2]\r\n\r\nWeb2py was originally designed as a teaching tool with emphasis on ease of use and deployment. Therefore, it does not have any project-level configuration files. The design of web2py was inspired by the Ruby on Rails and Django frameworks. Like these frameworks, web2py focuses on rapid development, favors convention over configuration approach and follows a model–view–controller (MVC) architectural pattern.', 'w.png', '2019-09-22 01:31:56'),
(7, 'CSS', 'Best designing with css', 'css', 'Cascading Style Sheets (CSS) is a style sheet language used for describing the presentation of a document written in a markup language like HTML.CSS is a cornerstone technology of the World Wide Web, alongside HTML and JavaScript.\r\n\r\nCSS is designed to enable the separation of presentation and content, including layout, colors, and fonts.This separation can improve content accessibility, provide more flexibility and control in the specification of presentation characteristics, enable multiple web pages to share formatting by specifying the relevant CSS in a separate .css file, and reduce complexity and repetition in the structural content.\r\n\r\nSeparation of formatting and content also makes it feasible to present the same markup page in different styles for different rendering methods, such as on-screen, in print, by voice (via speech-based browser or screen reader), and on Braille-based tactile devices. CSS also has rules for alternate formatting if the content is accessed on a mobile device.\r\n\r\nThe name cascading comes from the specified priority scheme to determine which style rule applies if more than one rule matches a particular element. This cascading priority scheme is predictable.', 'css.png', '2019-09-22 23:49:04'),
(8, 'Machine Learning', 'Its Most fabulous robotics programming.', 'machine', 'Machine learning is an application of artificial intelligence (AI) that provides systems the ability to automatically learn and improve from experience without being explicitly programmed. Machine learning focuses on the development of computer programs that can access data and use it learn for themselves.\r\n\r\nThe process of learning begins with observations or data, such as examples, direct experience, or instruction, in order to look for patterns in data and make better decisions in the future based on the examples that we provide. The primary aim is to allow the computers learn automatically without human intervention or assistance and adjust actions accordingly.', 'machine.jpg', '2019-09-29 20:01:31'),
(9, 'Data Science', 'Its Most demanding.', 'data science', 'Data science is a multi-disciplinary field that uses scientific methods, processes, algorithms and systems to extract knowledge and insights from structured and unstructured data.Data science is the same concept as data mining and big data: \"use the most powerful hardware, the most powerful programming systems, and the most efficient algorithms to solve problems\".\r\n\r\nData science is a \"concept to unify statistics, data analysis, machine learning and their related methods\" in order to \"understand and analyze actual phenomena\" with data.It employs techniques and theories drawn from many fields within the context of mathematics, statistics, computer science, and information science. Turing award winner Jim Gray imagined data science as a \"fourth paradigm\" of science (empirical, theoretical, computational and now data-driven) and asserted that \"everything about science is changing because of the impact of information technology\" and the data deluge.In 2015, the American Statistical Association identified database management, statistics and machine learning, and distributed and parallel systems as the three emerging foundational professional communities.\r\n\r\nIn 2012, when Harvard Business Review called it \"The Sexiest Job of the 21st Century\",the term \"data science\" became a buzzword. It is now often used interchangeably with earlier concepts like business analytics,business intelligence, predictive modeling, and statistics. Even the suggestion that data science is sexy was paraphrasing Hans Rosling, featured in a 2011 BBC documentary with the quote, \"Statistics is now the sexiest subject around.\"Nate Silver referred to data science as a sexed up term for statistics.In many cases, earlier approaches and solutions are now simply rebranded as \"data science\" to be more attractive, which can cause the term to become \"dilute[d] beyond usefulness.\"While many university programs now offer a data science degree, there exists no consensus on a definition or suitable curriculum contents.To its discredit, however, many data-science and big-data projects fail to deliver useful results, often as a result of poor management and utilization of resources.', 'DS.jpg', '2019-09-29 20:08:17');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `pName` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  `description` text NOT NULL,
  `available` int(11) NOT NULL,
  `category` varchar(100) NOT NULL,
  `item` varchar(100) NOT NULL,
  `pCode` varchar(20) NOT NULL,
  `picture` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `pName`, `price`, `description`, `available`, `category`, `item`, `pCode`, `picture`, `date`) VALUES
(1, 'T-Shirt', 120, 'T-Shirt', 4, 'tshirt', 't-shirt', 't-007', 'MSTS14738.jpg', '2018-09-20 07:10:40'),
(2, 'Baborry wallet', 6000, 'Baborry-Double-Zipper-Coin-Bag-RFID-Blocking-Men-Wallets-New-Brand-PU-Leather-Wallet-Money-Purses', 3, 'wallet', 'wallet', 'w-004', 'IMG_1212.jpg', '2018-09-20 07:40:28'),
(3, 'Loafer Shoes', 2000, 'Loafer black shoes', 8, 'shoes', 'shoes', 's-001', '8544789_5_.jpg', '2018-09-20 08:33:57'),
(4, 'Artificial Belt', 1200, 'Black artificial belt', 9, 'belt', 'belt', 'b-001', '0283BLT.jpg', '2018-09-20 08:35:44'),
(5, 'Polo T-shirt', 500, 'Polo t-shirt', 10, 'tshirt', 't-shirt', 's-002', 'lp00-2.jpg', '2018-09-20 08:40:06'),
(6, 'T-shirt', 300, 'Polo colorful t-shirt', 12, 'tshirt', 't-shirt', 't-003', 'yellow_2_.jpg', '2018-09-20 08:41:18'),
(7, 'Tshirt', 200, 'Design t-shirt', 10, 'tshirt', 't-shirt', 't-004', 'MSTSV14042.jpg', '2018-09-20 08:42:11'),
(8, 'T-shirt', 200, 'Color t-shirt', 20, 'tshirt', 't-shirt', 't-005', 'MSTS14759.jpg', '2018-09-20 08:45:39'),
(9, 'Men\'s Tshirt', 500, 'Colorful men\'s t-shirt', 20, 'tshirt', 't-shirt', 't-006', 'MSTSV14046.jpg', '2018-09-20 08:57:07'),
(10, 'Sports tshirt', 1000, 'Real madrid t-shirt', 5, 'tshirt', 't-shirt', 't-007', 'MSTSV14039.jpg', '2018-09-20 08:58:38'),
(12, 'T-shirt', 300, 'Design t-shirt', 10, 'tshirt', 't-shirt', 't-010', 'MSTSV14049.jpg', '2018-09-20 09:02:04'),
(13, 'Leather Shoes', 2000, 'Best leather shoes', 10, 'shoes', 'shoes', 's-002', '8546789_5_.jpg', '2018-09-21 10:39:32'),
(14, 'Belt', 2000, 'Nice belt', 20, 'belt', 'belt', 'b-003', 'gbdl18_1.png', '2018-10-01 03:47:08'),
(15, 'Belt', 300, 'Nice one belt', 20, 'belt', 'belt', 'b-004', '101010_1_.jpg', '2018-10-01 03:48:09'),
(16, 'Mens Belt', 300, 'Mens belt', 15, 'belt', 'belt', 'b-005', 'image4_2.jpg', '2018-10-01 03:49:08'),
(17, 'Leather Wallet', 100, 'Leather wallet', 10, 'wallet', 'wallet', 'w-005', 'Baborry-Double-Zipper-Coin-Bag-RFID-Blocking-Men-Wallets-New-Brand-PU-Leather-Wallet-Money-Purses.jpg_640x640.jpg', '2018-10-01 03:51:52'),
(18, 'Wallet', 300, 'Wallet', 20, 'wallet', 'wallet', 'w-007', '1881_G.jpg', '2018-10-01 03:52:43'),
(19, 'Black walllet', 300, 'Black mens wallet', 20, 'wallet', 'wallet', 'w-009', 'image5_1_2.jpg', '2018-10-01 03:53:37'),
(20, 'Men\'s Shoes', 1200, 'Men\'s shoes', 23, 'shoes', 'shoes', 's-003', 'IMG_2429.jpg', '2018-10-01 03:56:41'),
(21, 'Shoes', 2000, 'Formal Shoes', 12, 'shoes', 'shoes', 's-004', 'G51A7054.jpg', '2018-10-01 03:57:24');

-- --------------------------------------------------------

--
-- Table structure for table `product_level`
--

CREATE TABLE `product_level` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `v_shape` varchar(10) NOT NULL DEFAULT 'no',
  `polo` varchar(10) NOT NULL DEFAULT 'no',
  `clean_text` varchar(10) NOT NULL DEFAULT 'no',
  `design` varchar(10) NOT NULL DEFAULT 'no',
  `chain` varchar(10) NOT NULL DEFAULT 'no',
  `leather` varchar(10) NOT NULL DEFAULT 'no',
  `hook` varchar(10) NOT NULL DEFAULT 'no',
  `color` varchar(10) NOT NULL DEFAULT 'no',
  `formal` varchar(10) NOT NULL DEFAULT 'no',
  `converse` varchar(10) NOT NULL DEFAULT 'no',
  `loafer` varchar(10) NOT NULL DEFAULT 'no'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_level`
--

INSERT INTO `product_level` (`id`, `product_id`, `v_shape`, `polo`, `clean_text`, `design`, `chain`, `leather`, `hook`, `color`, `formal`, `converse`, `loafer`) VALUES
(1, 1, 'no', 'no', 'yes', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no'),
(2, 2, 'no', 'no', 'no', 'no', 'yes', 'yes', 'no', 'no', 'no', 'no', 'no'),
(3, 3, 'no', 'no', 'no', 'no', 'no', 'yes', 'no', 'no', 'no', 'no', 'yes'),
(4, 4, 'no', 'no', 'no', 'no', 'no', 'yes', 'yes', 'no', 'no', 'no', 'no'),
(5, 5, 'no', 'yes', 'yes', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no'),
(6, 6, 'no', 'yes', 'yes', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no'),
(7, 7, 'yes', 'no', 'no', 'yes', 'no', 'no', 'no', 'no', 'no', 'no', 'no'),
(8, 8, 'no', 'no', 'yes', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no'),
(9, 9, 'yes', 'no', 'no', 'yes', 'no', 'no', 'no', 'no', 'no', 'no', 'no'),
(10, 10, 'yes', 'no', 'yes', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no'),
(14, 14, 'no', 'no', 'no', 'no', 'no', 'yes', 'yes', 'no', 'no', 'no', 'no'),
(12, 12, 'yes', 'no', 'no', 'yes', 'no', 'no', 'no', 'no', 'no', 'no', 'no'),
(13, 13, 'no', 'no', 'no', 'no', 'no', 'yes', 'no', 'no', 'no', 'no', 'yes'),
(15, 15, 'no', 'no', 'no', 'no', 'no', 'yes', 'no', 'yes', 'no', 'no', 'no'),
(16, 16, 'no', 'no', 'no', 'no', 'no', 'yes', 'yes', 'yes', 'no', 'no', 'no'),
(17, 17, 'no', 'no', 'no', 'no', 'yes', 'yes', 'no', 'no', 'no', 'no', 'no'),
(18, 18, 'no', 'no', 'no', 'no', 'yes', 'yes', 'no', 'no', 'no', 'no', 'no'),
(19, 19, 'no', 'no', 'no', 'yes', 'yes', 'yes', 'no', 'no', 'no', 'no', 'no'),
(20, 20, 'no', 'no', 'no', 'no', 'no', 'yes', 'no', 'no', 'no', 'yes', 'no'),
(21, 21, 'no', 'no', 'no', 'no', 'no', 'yes', 'no', 'no', 'yes', 'no', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `product_view`
--

CREATE TABLE `product_view` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_view`
--

INSERT INTO `product_view` (`id`, `user_id`, `product_id`, `date`) VALUES
(1, 9, 9, '2018-09-22 02:19:30'),
(2, 9, 7, '2018-09-27 02:47:43'),
(3, 9, 12, '2018-09-22 03:20:59'),
(4, 9, 10, '2018-09-29 03:07:11'),
(5, 9, 5, '2018-09-22 03:19:19'),
(6, 9, 8, '2018-09-21 15:57:50'),
(7, 9, 6, '2018-09-22 02:12:54'),
(8, 9, 1, '2018-09-22 03:03:36');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(100) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `reg_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `online` varchar(1) NOT NULL DEFAULT '0',
  `activation` varchar(3) NOT NULL DEFAULT 'yes'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `username`, `password`, `mobile`, `reg_time`, `online`, `activation`) VALUES
(12, 'Mukul', 'mukul@gmail.com', 'mukul', '$5$rounds=535000$6PJhbzFlfJbcQbza$FbrPa3qqk1RJ5MSffRLO6LrQJXbgO8SudFuBpNf.wR7', '', '2018-07-23 14:09:14', '0', 'yes'),
(9, 'Nur Mohsin', 'mohsin@gmail.com', 'mohsin', '$5$rounds=535000$EnLkwqfGWGcWklRL$q9PbYw/TVXSzs.QpgUouZ3.6BzaPG2eLHkTyv.Qx80D', '123456789022', '2018-07-21 06:47:57', '1', 'yes'),
(14, 'Nur Mohsin', 'khan@gmail.com', 'khan', '$5$rounds=535000$wLKTQexvPQHueUsK$aFrFUXBHjrrAH61EFiYgj8cZECaaz8y6S5XS/zkkHw9', '', '2018-09-07 09:02:35', '0', 'yes'),
(13, 'Robin', 'robin@gmail.com', 'robin', '$5$rounds=535000$uiZc/VCwwa3XCTTe$Ec.JOjy4GkjpAXHtAvGt6pSc6KszajHgcyZy8v6Ivk1', '', '2018-07-26 12:36:57', '0', 'yes'),
(15, 'Sujon', 'sujon@yahoo.com', 'sujons', '$5$rounds=535000$aGykDT1yrocgTaDt$p2dDAMDz9g3N6o/Jj7QJY9B6NnMlUot.DCq/LOsCS13', '89345793753', '2018-09-08 13:58:36', '0', 'yes');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`sno.`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_level`
--
ALTER TABLE `product_level`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_view`
--
ALTER TABLE `product_view`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `sno.` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `product_level`
--
ALTER TABLE `product_level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `product_view`
--
ALTER TABLE `product_view`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
