-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 11, 2017 at 08:03 PM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 7.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `php_cms`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(5) NOT NULL,
  `cat_title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(1, 'Python 3.6.1'),
(2, 'JavaEE'),
(3, 'PHP 5.6.1'),
(4, 'C++'),
(14, 'Android');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(3) NOT NULL,
  `comment_post_id` int(3) NOT NULL,
  `comment_author` varchar(255) NOT NULL,
  `comment_email` varchar(255) NOT NULL,
  `comment_content` text NOT NULL,
  `comment_status` varchar(255) NOT NULL,
  `comment_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `comment_post_id`, `comment_author`, `comment_email`, `comment_content`, `comment_status`, `comment_date`) VALUES
(12, 13, 'Ehsaan', 'ehsaan@gmail.com', 'Commneting on 2nd post', 'Approved', '2017-03-19'),
(13, 14, 'Danish', 'danish@gmail.com', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed viverra libero quis posuere rutrum. Etiam vel augue sed lectus porttitor semper. Etiam vitae ullamcorper magna. Sed a commodo dolor, nec venenatis diam. Morbi tristique justo ante, mollis convallis libero aliquam dictum. Nam eleifend lorem a massa rhoncus aliquet. Proin vehicula luctus nisi. Aliquam vitae tortor id elit consectetur molestie. Aenean a gravida tellus. Fusce convallis sagittis scelerisque. Duis eu metus leo. Donec in accumsan tortor, id sodales dolor. Nam nec placerat sapien, vitae tempor urna.', 'Approved', '2017-03-20'),
(14, 14, 'Ehsaan', 'ehsaan@gmail.com', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed viverra libero quis posuere rutrum. Etiam vel augue sed lectus porttitor semper. Etiam vitae ullamcorper magna. Sed a commodo dolor, nec venenatis diam. Morbi tristique justo ante, mollis convallis libero aliquam dictum. Nam eleifend lorem a massa rhoncus aliquet. Proin vehicula luctus nisi. Aliquam vitae tortor id elit consectetur molestie. Aenean a gravida tellus. Fusce convallis sagittis scelerisque. Duis eu metus leo. Donec in accumsan tortor, id sodales dolor. Nam nec placerat sapien, vitae tempor urna.', 'Unapproved', '2017-03-20'),
(15, 12, 'Tassawer', 'tassawer@gmail.com', 'required=""', 'Approved', '2017-03-20');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `post_id` int(3) NOT NULL,
  `post_category_id` int(3) NOT NULL,
  `post_title` varchar(255) NOT NULL,
  `post_author` varchar(255) NOT NULL,
  `post_date` date NOT NULL,
  `post_image` text NOT NULL,
  `post_content` text NOT NULL,
  `post_tags` varchar(255) NOT NULL,
  `post_comment_count` int(11) NOT NULL DEFAULT '0',
  `post_status` varchar(255) NOT NULL DEFAULT 'draft',
  `post_views_count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `post_category_id`, `post_title`, `post_author`, `post_date`, `post_image`, `post_content`, `post_tags`, `post_comment_count`, `post_status`, `post_views_count`) VALUES
(12, 2, 'Custom CMS Written in PHP', 'Tassawer Hussain', '2017-03-20', 'CH-view-900x300.jpg', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut lobortis libero et libero malesuada, non pharetra est rhoncus. Aliquam ac leo congue, iaculis purus blandit, hendrerit massa. Nullam eleifend tempus commodo. Sed ac euismod leo. Pellentesque scelerisque aliquam ornare. Nunc dapibus tempus eros et vehicula. Nunc nibh metus, venenatis vitae volutpat id, condimentum vel justo. Integer ac ornare mi. Mauris fermentum dictum lectus, non laoreet urna elementum et. Aliquam mauris lacus, elementum nec mi consectetur, fringilla dignissim odio. Etiam eget odio sem. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Proin faucibus efficitur sollicitudin. Ut placerat auctor massa. Mauris tincidunt tellus eu diam placerat, et fermentum velit accumsan. Duis porta pulvinar risus, ullamcorper scelerisque ante ullamcorper sed. Donec sagittis mauris id urna porta, et consectetur elit bibendum. Sed mattis semper tempor. Sed maximus placerat dui, vitae condimentum eros ullamcorper et. Aliquam suscipit, metus non venenatis rhoncus, turpis eros elementum nunc, in convallis nibh turpis ac odio. Maecenas diam magna, fringilla eu feugiat maximus, eleifend non urna. Mauris ac viverra eros, eu malesuada libero. Pellentesque congue lectus eu leo pretium commodo. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla dignissim et lectus non congue. Ut at accumsan lacus. Donec interdum maximus massa at tristique. Nullam imperdiet, neque id fringilla iaculis, dolor augue condimentum lectus, a efficitur risus neque nec ipsum. Aliquam egestas aliquet mauris ac ultrices. Phasellus ut sagittis sapien. Duis ornare arcu a eros facilisis dapibus. Aliquam dapibus sem consectetur urna ornare, sit amet porta mi suscipit. Proin cursus est purus, in sagittis risus sagittis id. Curabitur pulvinar quis augue vitae mattis. Sed tempor urna ligula, a efficitur erat auctor vel. Pellentesque vulputate sem et ultrices accumsan. Etiam eget luctus justo, a dignissim tortor. Integer a elit justo. In vestibulum est sit amet ante viverra tincidunt non sit amet nunc. Morbi vitae accumsan tortor, a molestie risus. Nunc sit amet ultrices justo. Nulla facilisi. Curabitur elementum risus id viverra convallis. Ut sit amet semper nibh. Sed vitae ex aliquet, scelerisque mi ultricies, pulvinar massa. Ut risus dolor, finibus non scelerisque nec, laoreet vel elit. Maecenas laoreet sit amet est at accumsan. Etiam sed quam ante. Nunc nec dapibus risus. Vivamus in pretium elit. In consectetur erat tincidunt ligula fermentum, volutpat aliquam est consectetur. Donec quis volutpat tellus. Mauris ultricies eros vitae semper faucibus. Vivamus eget maximus metus. Sed id mi non nunc tempus sagittis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Aliquam gravida, urna mollis dictum finibus, diam elit consectetur quam, non euismod neque neque eget dolor. Nunc dapibus dapibus quam vel viverra.</p>', 'First Post, CMS, Author, Tassawer', 1, 'Publish', 6),
(13, 1, 'Second Post', 'Ehsaan Israr', '2017-03-23', 'thumb-900x300-outnow.jpg', '<p>Ù„ÙˆØ±ÙŠÙ… Ø¥ÙŠØ¨Ø³ÙˆÙ…(Lorem Ipsum) Ù‡Ùˆ Ø¨Ø¨Ø³Ø§Ø·Ø© Ù†Øµ Ø´ÙƒÙ„ÙŠ (Ø¨Ù…Ø¹Ù†Ù‰ Ø£Ù† Ø§Ù„ØºØ§ÙŠØ© Ù‡ÙŠ Ø§Ù„Ø´ÙƒÙ„ ÙˆÙ„ÙŠØ³ Ø§Ù„Ù…Ø­ØªÙˆÙ‰) ÙˆÙŠÙØ³ØªØ®Ø¯Ù… ÙÙŠ ØµÙ†Ø§Ø¹Ø§Øª Ø§Ù„Ù…Ø·Ø§Ø¨Ø¹ ÙˆØ¯ÙˆØ± Ø§Ù„Ù†Ø´Ø±. ÙƒØ§Ù† Ù„ÙˆØ±ÙŠÙ… Ø¥ÙŠØ¨Ø³ÙˆÙ… ÙˆÙ„Ø§ÙŠØ²Ø§Ù„ Ø§Ù„Ù…Ø¹ÙŠØ§Ø± Ù„Ù„Ù†Øµ Ø§Ù„Ø´ÙƒÙ„ÙŠ Ù…Ù†Ø° Ø§Ù„Ù‚Ø±Ù† Ø§Ù„Ø®Ø§Ù…Ø³ Ø¹Ø´Ø± Ø¹Ù†Ø¯Ù…Ø§ Ù‚Ø§Ù…Øª Ù…Ø·Ø¨Ø¹Ø© Ù…Ø¬Ù‡ÙˆÙ„Ø© Ø¨Ø±Øµ Ù…Ø¬Ù…ÙˆØ¹Ø© Ù…Ù† Ø§Ù„Ø£Ø­Ø±Ù Ø¨Ø´ÙƒÙ„ Ø¹Ø´ÙˆØ§Ø¦ÙŠ Ø£Ø®Ø°ØªÙ‡Ø§ Ù…Ù† Ù†ØµØŒ Ù„ØªÙƒÙˆÙ‘Ù† ÙƒØªÙŠÙ‘Ø¨ Ø¨Ù…Ø«Ø§Ø¨Ø© Ø¯Ù„ÙŠÙ„ Ø£Ùˆ Ù…Ø±Ø¬Ø¹ Ø´ÙƒÙ„ÙŠ Ù„Ù‡Ø°Ù‡ Ø§Ù„Ø£Ø­Ø±Ù. Ø®Ù…Ø³Ø© Ù‚Ø±ÙˆÙ† Ù…Ù† Ø§Ù„Ø²Ù…Ù† Ù„Ù… ØªÙ‚Ø¶ÙŠ Ø¹Ù„Ù‰ Ù‡Ø°Ø§ Ø§Ù„Ù†ØµØŒ Ø¨Ù„ Ø§Ù†Ù‡ Ø­ØªÙ‰ ØµØ§Ø± Ù…Ø³ØªØ®Ø¯Ù…Ø§Ù‹ ÙˆØ¨Ø´ÙƒÙ„Ù‡ Ø§Ù„Ø£ØµÙ„ÙŠ ÙÙŠ Ø§Ù„Ø·Ø¨Ø§Ø¹Ø© ÙˆØ§Ù„ØªÙ†Ø¶ÙŠØ¯ Ø§Ù„Ø¥Ù„ÙƒØªØ±ÙˆÙ†ÙŠ. Ø§Ù†ØªØ´Ø± Ø¨Ø´ÙƒÙ„ ÙƒØ¨ÙŠØ± ÙÙŠ Ø³ØªÙŠÙ†ÙŠÙ‘Ø§Øª Ù‡Ø°Ø§ Ø§Ù„Ù‚Ø±Ù† Ù…Ø¹ Ø¥ØµØ¯Ø§Ø± Ø±Ù‚Ø§Ø¦Ù‚ "Ù„ÙŠØªØ±Ø§Ø³ÙŠØª" (Letraset) Ø§Ù„Ø¨Ù„Ø§Ø³ØªÙŠÙƒÙŠØ© ØªØ­ÙˆÙŠ Ù…Ù‚Ø§Ø·Ø¹ Ù…Ù† Ù‡Ø°Ø§ Ø§Ù„Ù†ØµØŒ ÙˆØ¹Ø§Ø¯ Ù„ÙŠÙ†ØªØ´Ø± Ù…Ø±Ø© Ø£Ø®Ø±Ù‰ Ù…Ø¤Ø®Ø±Ø§ÙŽ Ù…Ø¹ Ø¸Ù‡ÙˆØ± Ø¨Ø±Ø§Ù…Ø¬ Ø§Ù„Ù†Ø´Ø± Ø§Ù„Ø¥Ù„ÙƒØªØ±ÙˆÙ†ÙŠ Ù…Ø«Ù„ "Ø£Ù„Ø¯ÙˆØ³ Ø¨Ø§ÙŠØ¬ Ù…Ø§ÙŠÙƒØ±" (Aldus PageMaker) ÙˆØ§Ù„ØªÙŠ Ø­ÙˆØª Ø£ÙŠØ¶Ø§Ù‹ Ø¹Ù„Ù‰ Ù†Ø³Ø® Ù…Ù† Ù†Øµ Ù„ÙˆØ±ÙŠÙ… Ø¥ÙŠØ¨Ø³ÙˆÙ….</p>', '2nd, test', 1, 'Publish', 1),
(14, 14, 'Php custom CMS with status dropdown', 'Tassawer Hussain', '2017-03-20', 'Iceland-900x300.jpg', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed viverra libero quis posuere rutrum. Etiam vel augue sed lectus porttitor semper. Etiam vitae ullamcorper magna. Sed a commodo dolor, nec venenatis diam. Morbi tristique justo ante, mollis convallis libero aliquam dictum. Nam eleifend lorem a massa rhoncus aliquet. Proin vehicula luctus nisi. Aliquam vitae tortor id elit consectetur molestie. Aenean a gravida tellus. Fusce convallis sagittis scelerisque. Duis eu metus leo. Donec in accumsan tortor, id sodales dolor. Nam nec placerat sapien, vitae tempor urna.</p>', 'First Post, CMS, Author, Tassawer', 2, 'Publish', 1),
(15, 4, 'This post is added by TH', 'Tassawer Hussain', '2017-03-20', 'ina-header-900x300.jpg', '<p><span style="font-family: ''Open Sans'', Arial, sans-serif; text-align: justify;">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.</span></p>', 'No tag', 0, 'Publish', 0),
(16, 14, 'Update add post functionalty', 'Tassawer Hussain', '2017-03-20', 'case-study.jpg', '<p><span style="font-family: ''Open Sans'', Arial, sans-serif; text-align: justify;">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don''t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn''t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</span></p>', 'First Post, CMS, Author, Tassawer', 0, 'Publish', 0),
(17, 14, 'Update add post functionalty', 'Tassawer Hussain', '2017-03-23', 'clone_case-study.jpg', '<p><span style="font-family: ''Open Sans'', Arial, sans-serif; text-align: justify;">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don''t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn''t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</span></p>', 'First Post, CMS, Author, Tassawer', 0, 'Publish', 0),
(18, 4, 'This post is added by TH', 'Tassawer Hussain', '2017-03-24', 'clone_ina-header-900x300.jpg', '<p><span style="font-family: ''Open Sans'', Arial, sans-serif; text-align: justify;">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.</span></p>', 'No tag', 0, 'Publish', 0),
(19, 4, 'This post is added by TH', 'Tassawer Hussain', '2017-03-25', 'clone_clone_ina-header-900x300.jpg', '<p><span style="font-family: ''Open Sans'', Arial, sans-serif; text-align: justify;">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.</span></p>', 'No tag', 0, 'Publish', 0),
(20, 14, 'Update add post functionalty', 'Tassawer Hussain', '2017-03-25', 'clone_clone_case-study.jpg', '<p><span style="font-family: ''Open Sans'', Arial, sans-serif; text-align: justify;">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don''t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn''t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</span></p>', 'First Post, CMS, Author, Tassawer', 0, 'Publish', 0),
(21, 14, 'Update add post functionalty', 'Tassawer Hussain', '2017-03-25', 'clone_case-study.jpg', '<p><span style="font-family: ''Open Sans'', Arial, sans-serif; text-align: justify;">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don''t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn''t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</span></p>', 'First Post, CMS, Author, Tassawer', 0, 'Publish', 0),
(22, 4, 'This post is added by TH', 'Tassawer Hussain', '2017-03-25', 'clone_ina-header-900x300.jpg', '<p><span style="font-family: ''Open Sans'', Arial, sans-serif; text-align: justify;">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.</span></p>', 'No tag', 0, 'Publish', 0),
(23, 14, 'Php custom CMS with status dropdown', 'Tassawer Hussain', '2017-03-25', 'clone_Iceland-900x300.jpg', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed viverra libero quis posuere rutrum. Etiam vel augue sed lectus porttitor semper. Etiam vitae ullamcorper magna. Sed a commodo dolor, nec venenatis diam. Morbi tristique justo ante, mollis convallis libero aliquam dictum. Nam eleifend lorem a massa rhoncus aliquet. Proin vehicula luctus nisi. Aliquam vitae tortor id elit consectetur molestie. Aenean a gravida tellus. Fusce convallis sagittis scelerisque. Duis eu metus leo. Donec in accumsan tortor, id sodales dolor. Nam nec placerat sapien, vitae tempor urna.</p>', 'First Post, CMS, Author, Tassawer', 0, 'Publish', 0),
(24, 1, 'Second Post', 'Ehsaan Israr', '2017-03-25', 'clone_thumb-900x300-outnow.jpg', '<p>Ù„ÙˆØ±ÙŠÙ… Ø¥ÙŠØ¨Ø³ÙˆÙ…(Lorem Ipsum) Ù‡Ùˆ Ø¨Ø¨Ø³Ø§Ø·Ø© Ù†Øµ Ø´ÙƒÙ„ÙŠ (Ø¨Ù…Ø¹Ù†Ù‰ Ø£Ù† Ø§Ù„ØºØ§ÙŠØ© Ù‡ÙŠ Ø§Ù„Ø´ÙƒÙ„ ÙˆÙ„ÙŠØ³ Ø§Ù„Ù…Ø­ØªÙˆÙ‰) ÙˆÙŠÙØ³ØªØ®Ø¯Ù… ÙÙŠ ØµÙ†Ø§Ø¹Ø§Øª Ø§Ù„Ù…Ø·Ø§Ø¨Ø¹ ÙˆØ¯ÙˆØ± Ø§Ù„Ù†Ø´Ø±. ÙƒØ§Ù† Ù„ÙˆØ±ÙŠÙ… Ø¥ÙŠØ¨Ø³ÙˆÙ… ÙˆÙ„Ø§ÙŠØ²Ø§Ù„ Ø§Ù„Ù…Ø¹ÙŠØ§Ø± Ù„Ù„Ù†Øµ Ø§Ù„Ø´ÙƒÙ„ÙŠ Ù…Ù†Ø° Ø§Ù„Ù‚Ø±Ù† Ø§Ù„Ø®Ø§Ù…Ø³ Ø¹Ø´Ø± Ø¹Ù†Ø¯Ù…Ø§ Ù‚Ø§Ù…Øª Ù…Ø·Ø¨Ø¹Ø© Ù…Ø¬Ù‡ÙˆÙ„Ø© Ø¨Ø±Øµ Ù…Ø¬Ù…ÙˆØ¹Ø© Ù…Ù† Ø§Ù„Ø£Ø­Ø±Ù Ø¨Ø´ÙƒÙ„ Ø¹Ø´ÙˆØ§Ø¦ÙŠ Ø£Ø®Ø°ØªÙ‡Ø§ Ù…Ù† Ù†ØµØŒ Ù„ØªÙƒÙˆÙ‘Ù† ÙƒØªÙŠÙ‘Ø¨ Ø¨Ù…Ø«Ø§Ø¨Ø© Ø¯Ù„ÙŠÙ„ Ø£Ùˆ Ù…Ø±Ø¬Ø¹ Ø´ÙƒÙ„ÙŠ Ù„Ù‡Ø°Ù‡ Ø§Ù„Ø£Ø­Ø±Ù. Ø®Ù…Ø³Ø© Ù‚Ø±ÙˆÙ† Ù…Ù† Ø§Ù„Ø²Ù…Ù† Ù„Ù… ØªÙ‚Ø¶ÙŠ Ø¹Ù„Ù‰ Ù‡Ø°Ø§ Ø§Ù„Ù†ØµØŒ Ø¨Ù„ Ø§Ù†Ù‡ Ø­ØªÙ‰ ØµØ§Ø± Ù…Ø³ØªØ®Ø¯Ù…Ø§Ù‹ ÙˆØ¨Ø´ÙƒÙ„Ù‡ Ø§Ù„Ø£ØµÙ„ÙŠ ÙÙŠ Ø§Ù„Ø·Ø¨Ø§Ø¹Ø© ÙˆØ§Ù„ØªÙ†Ø¶ÙŠØ¯ Ø§Ù„Ø¥Ù„ÙƒØªØ±ÙˆÙ†ÙŠ. Ø§Ù†ØªØ´Ø± Ø¨Ø´ÙƒÙ„ ÙƒØ¨ÙŠØ± ÙÙŠ Ø³ØªÙŠÙ†ÙŠÙ‘Ø§Øª Ù‡Ø°Ø§ Ø§Ù„Ù‚Ø±Ù† Ù…Ø¹ Ø¥ØµØ¯Ø§Ø± Ø±Ù‚Ø§Ø¦Ù‚ "Ù„ÙŠØªØ±Ø§Ø³ÙŠØª" (Letraset) Ø§Ù„Ø¨Ù„Ø§Ø³ØªÙŠÙƒÙŠØ© ØªØ­ÙˆÙŠ Ù…Ù‚Ø§Ø·Ø¹ Ù…Ù† Ù‡Ø°Ø§ Ø§Ù„Ù†ØµØŒ ÙˆØ¹Ø§Ø¯ Ù„ÙŠÙ†ØªØ´Ø± Ù…Ø±Ø© Ø£Ø®Ø±Ù‰ Ù…Ø¤Ø®Ø±Ø§ÙŽ Ù…Ø¹ Ø¸Ù‡ÙˆØ± Ø¨Ø±Ø§Ù…Ø¬ Ø§Ù„Ù†Ø´Ø± Ø§Ù„Ø¥Ù„ÙƒØªØ±ÙˆÙ†ÙŠ Ù…Ø«Ù„ "Ø£Ù„Ø¯ÙˆØ³ Ø¨Ø§ÙŠØ¬ Ù…Ø§ÙŠÙƒØ±" (Aldus PageMaker) ÙˆØ§Ù„ØªÙŠ Ø­ÙˆØª Ø£ÙŠØ¶Ø§Ù‹ Ø¹Ù„Ù‰ Ù†Ø³Ø® Ù…Ù† Ù†Øµ Ù„ÙˆØ±ÙŠÙ… Ø¥ÙŠØ¨Ø³ÙˆÙ….</p>', '2nd, test', 0, 'Publish', 0),
(25, 2, 'Custom CMS Written in PHP', 'Tassawer Hussain', '2017-03-25', 'clone_CH-view-900x300.jpg', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut lobortis libero et libero malesuada, non pharetra est rhoncus. Aliquam ac leo congue, iaculis purus blandit, hendrerit massa. Nullam eleifend tempus commodo. Sed ac euismod leo. Pellentesque scelerisque aliquam ornare. Nunc dapibus tempus eros et vehicula. Nunc nibh metus, venenatis vitae volutpat id, condimentum vel justo. Integer ac ornare mi. Mauris fermentum dictum lectus, non laoreet urna elementum et. Aliquam mauris lacus, elementum nec mi consectetur, fringilla dignissim odio. Etiam eget odio sem. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Proin faucibus efficitur sollicitudin. Ut placerat auctor massa. Mauris tincidunt tellus eu diam placerat, et fermentum velit accumsan. Duis porta pulvinar risus, ullamcorper scelerisque ante ullamcorper sed. Donec sagittis mauris id urna porta, et consectetur elit bibendum. Sed mattis semper tempor. Sed maximus placerat dui, vitae condimentum eros ullamcorper et. Aliquam suscipit, metus non venenatis rhoncus, turpis eros elementum nunc, in convallis nibh turpis ac odio. Maecenas diam magna, fringilla eu feugiat maximus, eleifend non urna. Mauris ac viverra eros, eu malesuada libero. Pellentesque congue lectus eu leo pretium commodo. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla dignissim et lectus non congue. Ut at accumsan lacus. Donec interdum maximus massa at tristique. Nullam imperdiet, neque id fringilla iaculis, dolor augue condimentum lectus, a efficitur risus neque nec ipsum. Aliquam egestas aliquet mauris ac ultrices. Phasellus ut sagittis sapien. Duis ornare arcu a eros facilisis dapibus. Aliquam dapibus sem consectetur urna ornare, sit amet porta mi suscipit. Proin cursus est purus, in sagittis risus sagittis id. Curabitur pulvinar quis augue vitae mattis. Sed tempor urna ligula, a efficitur erat auctor vel. Pellentesque vulputate sem et ultrices accumsan. Etiam eget luctus justo, a dignissim tortor. Integer a elit justo. In vestibulum est sit amet ante viverra tincidunt non sit amet nunc. Morbi vitae accumsan tortor, a molestie risus. Nunc sit amet ultrices justo. Nulla facilisi. Curabitur elementum risus id viverra convallis. Ut sit amet semper nibh. Sed vitae ex aliquet, scelerisque mi ultricies, pulvinar massa. Ut risus dolor, finibus non scelerisque nec, laoreet vel elit. Maecenas laoreet sit amet est at accumsan. Etiam sed quam ante. Nunc nec dapibus risus. Vivamus in pretium elit. In consectetur erat tincidunt ligula fermentum, volutpat aliquam est consectetur. Donec quis volutpat tellus. Mauris ultricies eros vitae semper faucibus. Vivamus eget maximus metus. Sed id mi non nunc tempus sagittis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Aliquam gravida, urna mollis dictum finibus, diam elit consectetur quam, non euismod neque neque eget dolor. Nunc dapibus dapibus quam vel viverra.</p>', 'First Post, CMS, Author, Tassawer', 0, 'Publish', 0),
(26, 2, 'Custom CMS Written in PHP', 'Tassawer Hussain', '2017-03-25', 'clone_clone_CH-view-900x300.jpg', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut lobortis libero et libero malesuada, non pharetra est rhoncus. Aliquam ac leo congue, iaculis purus blandit, hendrerit massa. Nullam eleifend tempus commodo. Sed ac euismod leo. Pellentesque scelerisque aliquam ornare. Nunc dapibus tempus eros et vehicula. Nunc nibh metus, venenatis vitae volutpat id, condimentum vel justo. Integer ac ornare mi. Mauris fermentum dictum lectus, non laoreet urna elementum et. Aliquam mauris lacus, elementum nec mi consectetur, fringilla dignissim odio. Etiam eget odio sem. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Proin faucibus efficitur sollicitudin. Ut placerat auctor massa. Mauris tincidunt tellus eu diam placerat, et fermentum velit accumsan. Duis porta pulvinar risus, ullamcorper scelerisque ante ullamcorper sed. Donec sagittis mauris id urna porta, et consectetur elit bibendum. Sed mattis semper tempor. Sed maximus placerat dui, vitae condimentum eros ullamcorper et. Aliquam suscipit, metus non venenatis rhoncus, turpis eros elementum nunc, in convallis nibh turpis ac odio. Maecenas diam magna, fringilla eu feugiat maximus, eleifend non urna. Mauris ac viverra eros, eu malesuada libero. Pellentesque congue lectus eu leo pretium commodo. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla dignissim et lectus non congue. Ut at accumsan lacus. Donec interdum maximus massa at tristique. Nullam imperdiet, neque id fringilla iaculis, dolor augue condimentum lectus, a efficitur risus neque nec ipsum. Aliquam egestas aliquet mauris ac ultrices. Phasellus ut sagittis sapien. Duis ornare arcu a eros facilisis dapibus. Aliquam dapibus sem consectetur urna ornare, sit amet porta mi suscipit. Proin cursus est purus, in sagittis risus sagittis id. Curabitur pulvinar quis augue vitae mattis. Sed tempor urna ligula, a efficitur erat auctor vel. Pellentesque vulputate sem et ultrices accumsan. Etiam eget luctus justo, a dignissim tortor. Integer a elit justo. In vestibulum est sit amet ante viverra tincidunt non sit amet nunc. Morbi vitae accumsan tortor, a molestie risus. Nunc sit amet ultrices justo. Nulla facilisi. Curabitur elementum risus id viverra convallis. Ut sit amet semper nibh. Sed vitae ex aliquet, scelerisque mi ultricies, pulvinar massa. Ut risus dolor, finibus non scelerisque nec, laoreet vel elit. Maecenas laoreet sit amet est at accumsan. Etiam sed quam ante. Nunc nec dapibus risus. Vivamus in pretium elit. In consectetur erat tincidunt ligula fermentum, volutpat aliquam est consectetur. Donec quis volutpat tellus. Mauris ultricies eros vitae semper faucibus. Vivamus eget maximus metus. Sed id mi non nunc tempus sagittis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Aliquam gravida, urna mollis dictum finibus, diam elit consectetur quam, non euismod neque neque eget dolor. Nunc dapibus dapibus quam vel viverra.</p>', 'First Post, CMS, Author, Tassawer', 0, 'Publish', 0),
(27, 1, 'Second Post', 'Ehsaan Israr', '2017-03-25', 'clone_clone_thumb-900x300-outnow.jpg', '<p>Ù„ÙˆØ±ÙŠÙ… Ø¥ÙŠØ¨Ø³ÙˆÙ…(Lorem Ipsum) Ù‡Ùˆ Ø¨Ø¨Ø³Ø§Ø·Ø© Ù†Øµ Ø´ÙƒÙ„ÙŠ (Ø¨Ù…Ø¹Ù†Ù‰ Ø£Ù† Ø§Ù„ØºØ§ÙŠØ© Ù‡ÙŠ Ø§Ù„Ø´ÙƒÙ„ ÙˆÙ„ÙŠØ³ Ø§Ù„Ù…Ø­ØªÙˆÙ‰) ÙˆÙŠÙØ³ØªØ®Ø¯Ù… ÙÙŠ ØµÙ†Ø§Ø¹Ø§Øª Ø§Ù„Ù…Ø·Ø§Ø¨Ø¹ ÙˆØ¯ÙˆØ± Ø§Ù„Ù†Ø´Ø±. ÙƒØ§Ù† Ù„ÙˆØ±ÙŠÙ… Ø¥ÙŠØ¨Ø³ÙˆÙ… ÙˆÙ„Ø§ÙŠØ²Ø§Ù„ Ø§Ù„Ù…Ø¹ÙŠØ§Ø± Ù„Ù„Ù†Øµ Ø§Ù„Ø´ÙƒÙ„ÙŠ Ù…Ù†Ø° Ø§Ù„Ù‚Ø±Ù† Ø§Ù„Ø®Ø§Ù…Ø³ Ø¹Ø´Ø± Ø¹Ù†Ø¯Ù…Ø§ Ù‚Ø§Ù…Øª Ù…Ø·Ø¨Ø¹Ø© Ù…Ø¬Ù‡ÙˆÙ„Ø© Ø¨Ø±Øµ Ù…Ø¬Ù…ÙˆØ¹Ø© Ù…Ù† Ø§Ù„Ø£Ø­Ø±Ù Ø¨Ø´ÙƒÙ„ Ø¹Ø´ÙˆØ§Ø¦ÙŠ Ø£Ø®Ø°ØªÙ‡Ø§ Ù…Ù† Ù†ØµØŒ Ù„ØªÙƒÙˆÙ‘Ù† ÙƒØªÙŠÙ‘Ø¨ Ø¨Ù…Ø«Ø§Ø¨Ø© Ø¯Ù„ÙŠÙ„ Ø£Ùˆ Ù…Ø±Ø¬Ø¹ Ø´ÙƒÙ„ÙŠ Ù„Ù‡Ø°Ù‡ Ø§Ù„Ø£Ø­Ø±Ù. Ø®Ù…Ø³Ø© Ù‚Ø±ÙˆÙ† Ù…Ù† Ø§Ù„Ø²Ù…Ù† Ù„Ù… ØªÙ‚Ø¶ÙŠ Ø¹Ù„Ù‰ Ù‡Ø°Ø§ Ø§Ù„Ù†ØµØŒ Ø¨Ù„ Ø§Ù†Ù‡ Ø­ØªÙ‰ ØµØ§Ø± Ù…Ø³ØªØ®Ø¯Ù…Ø§Ù‹ ÙˆØ¨Ø´ÙƒÙ„Ù‡ Ø§Ù„Ø£ØµÙ„ÙŠ ÙÙŠ Ø§Ù„Ø·Ø¨Ø§Ø¹Ø© ÙˆØ§Ù„ØªÙ†Ø¶ÙŠØ¯ Ø§Ù„Ø¥Ù„ÙƒØªØ±ÙˆÙ†ÙŠ. Ø§Ù†ØªØ´Ø± Ø¨Ø´ÙƒÙ„ ÙƒØ¨ÙŠØ± ÙÙŠ Ø³ØªÙŠÙ†ÙŠÙ‘Ø§Øª Ù‡Ø°Ø§ Ø§Ù„Ù‚Ø±Ù† Ù…Ø¹ Ø¥ØµØ¯Ø§Ø± Ø±Ù‚Ø§Ø¦Ù‚ "Ù„ÙŠØªØ±Ø§Ø³ÙŠØª" (Letraset) Ø§Ù„Ø¨Ù„Ø§Ø³ØªÙŠÙƒÙŠØ© ØªØ­ÙˆÙŠ Ù…Ù‚Ø§Ø·Ø¹ Ù…Ù† Ù‡Ø°Ø§ Ø§Ù„Ù†ØµØŒ ÙˆØ¹Ø§Ø¯ Ù„ÙŠÙ†ØªØ´Ø± Ù…Ø±Ø© Ø£Ø®Ø±Ù‰ Ù…Ø¤Ø®Ø±Ø§ÙŽ Ù…Ø¹ Ø¸Ù‡ÙˆØ± Ø¨Ø±Ø§Ù…Ø¬ Ø§Ù„Ù†Ø´Ø± Ø§Ù„Ø¥Ù„ÙƒØªØ±ÙˆÙ†ÙŠ Ù…Ø«Ù„ "Ø£Ù„Ø¯ÙˆØ³ Ø¨Ø§ÙŠØ¬ Ù…Ø§ÙŠÙƒØ±" (Aldus PageMaker) ÙˆØ§Ù„ØªÙŠ Ø­ÙˆØª Ø£ÙŠØ¶Ø§Ù‹ Ø¹Ù„Ù‰ Ù†Ø³Ø® Ù…Ù† Ù†Øµ Ù„ÙˆØ±ÙŠÙ… Ø¥ÙŠØ¨Ø³ÙˆÙ….</p>', '2nd, test', 0, 'Publish', 0),
(28, 14, 'Php custom CMS with status dropdown', 'Tassawer Hussain', '2017-03-25', 'clone_clone_Iceland-900x300.jpg', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed viverra libero quis posuere rutrum. Etiam vel augue sed lectus porttitor semper. Etiam vitae ullamcorper magna. Sed a commodo dolor, nec venenatis diam. Morbi tristique justo ante, mollis convallis libero aliquam dictum. Nam eleifend lorem a massa rhoncus aliquet. Proin vehicula luctus nisi. Aliquam vitae tortor id elit consectetur molestie. Aenean a gravida tellus. Fusce convallis sagittis scelerisque. Duis eu metus leo. Donec in accumsan tortor, id sodales dolor. Nam nec placerat sapien, vitae tempor urna.</p>', 'First Post, CMS, Author, Tassawer', 0, 'Publish', 0),
(29, 4, 'This post is added by TH', 'Tassawer Hussain', '2017-03-25', 'clone_clone_ina-header-900x300.jpg', '<p><span style="font-family: ''Open Sans'', Arial, sans-serif; text-align: justify;">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.</span></p>', 'No tag', 0, 'Publish', 0),
(30, 14, 'Update add post functionalty', 'Tassawer Hussain', '2017-03-25', 'clone_clone_case-study.jpg', '<p><span style="font-family: ''Open Sans'', Arial, sans-serif; text-align: justify;">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don''t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn''t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</span></p>', 'First Post, CMS, Author, Tassawer', 0, 'Publish', 0),
(31, 14, 'Update add post functionalty', 'Tassawer Hussain', '2017-03-25', 'clone_clone_clone_case-study.jpg', '<p><span style="font-family: ''Open Sans'', Arial, sans-serif; text-align: justify;">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don''t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn''t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</span></p>', 'First Post, CMS, Author, Tassawer', 0, 'Publish', 0),
(32, 4, 'This post is added by TH', 'Tassawer Hussain', '2017-03-25', 'clone_clone_clone_ina-header-900x300.jpg', '<p><span style="font-family: ''Open Sans'', Arial, sans-serif; text-align: justify;">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.</span></p>', 'No tag', 0, 'Publish', 0),
(33, 4, 'This post is added by TH', 'Tassawer Hussain', '2017-03-25', 'clone_clone_ina-header-900x300.jpg', '<p><span style="font-family: ''Open Sans'', Arial, sans-serif; text-align: justify;">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.</span></p>', 'No tag', 0, 'Publish', 0),
(34, 14, 'Update add post functionalty', 'Tassawer Hussain', '2017-03-25', 'clone_clone_case-study.jpg', '<p><span style="font-family: ''Open Sans'', Arial, sans-serif; text-align: justify;">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don''t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn''t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</span></p>', 'First Post, CMS, Author, Tassawer', 0, 'Publish', 0),
(35, 14, 'Update add post functionalty', 'Tassawer Hussain', '2017-03-25', 'clone_case-study.jpg', '<p><span style="font-family: ''Open Sans'', Arial, sans-serif; text-align: justify;">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don''t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn''t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</span></p>', 'First Post, CMS, Author, Tassawer', 0, 'Publish', 0),
(36, 4, 'This post is added by TH', 'Tassawer Hussain', '2017-03-25', 'clone_ina-header-900x300.jpg', '<p><span style="font-family: ''Open Sans'', Arial, sans-serif; text-align: justify;">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.</span></p>', 'No tag', 0, 'Publish', 0),
(37, 14, 'Php custom CMS with status dropdown', 'Tassawer Hussain', '2017-03-25', 'clone_Iceland-900x300.jpg', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed viverra libero quis posuere rutrum. Etiam vel augue sed lectus porttitor semper. Etiam vitae ullamcorper magna. Sed a commodo dolor, nec venenatis diam. Morbi tristique justo ante, mollis convallis libero aliquam dictum. Nam eleifend lorem a massa rhoncus aliquet. Proin vehicula luctus nisi. Aliquam vitae tortor id elit consectetur molestie. Aenean a gravida tellus. Fusce convallis sagittis scelerisque. Duis eu metus leo. Donec in accumsan tortor, id sodales dolor. Nam nec placerat sapien, vitae tempor urna.</p>', 'First Post, CMS, Author, Tassawer', 0, 'Publish', 0),
(38, 1, 'Second Post', 'Ehsaan Israr', '2017-03-25', 'clone_thumb-900x300-outnow.jpg', '<p>Ù„ÙˆØ±ÙŠÙ… Ø¥ÙŠØ¨Ø³ÙˆÙ…(Lorem Ipsum) Ù‡Ùˆ Ø¨Ø¨Ø³Ø§Ø·Ø© Ù†Øµ Ø´ÙƒÙ„ÙŠ (Ø¨Ù…Ø¹Ù†Ù‰ Ø£Ù† Ø§Ù„ØºØ§ÙŠØ© Ù‡ÙŠ Ø§Ù„Ø´ÙƒÙ„ ÙˆÙ„ÙŠØ³ Ø§Ù„Ù…Ø­ØªÙˆÙ‰) ÙˆÙŠÙØ³ØªØ®Ø¯Ù… ÙÙŠ ØµÙ†Ø§Ø¹Ø§Øª Ø§Ù„Ù…Ø·Ø§Ø¨Ø¹ ÙˆØ¯ÙˆØ± Ø§Ù„Ù†Ø´Ø±. ÙƒØ§Ù† Ù„ÙˆØ±ÙŠÙ… Ø¥ÙŠØ¨Ø³ÙˆÙ… ÙˆÙ„Ø§ÙŠØ²Ø§Ù„ Ø§Ù„Ù…Ø¹ÙŠØ§Ø± Ù„Ù„Ù†Øµ Ø§Ù„Ø´ÙƒÙ„ÙŠ Ù…Ù†Ø° Ø§Ù„Ù‚Ø±Ù† Ø§Ù„Ø®Ø§Ù…Ø³ Ø¹Ø´Ø± Ø¹Ù†Ø¯Ù…Ø§ Ù‚Ø§Ù…Øª Ù…Ø·Ø¨Ø¹Ø© Ù…Ø¬Ù‡ÙˆÙ„Ø© Ø¨Ø±Øµ Ù…Ø¬Ù…ÙˆØ¹Ø© Ù…Ù† Ø§Ù„Ø£Ø­Ø±Ù Ø¨Ø´ÙƒÙ„ Ø¹Ø´ÙˆØ§Ø¦ÙŠ Ø£Ø®Ø°ØªÙ‡Ø§ Ù…Ù† Ù†ØµØŒ Ù„ØªÙƒÙˆÙ‘Ù† ÙƒØªÙŠÙ‘Ø¨ Ø¨Ù…Ø«Ø§Ø¨Ø© Ø¯Ù„ÙŠÙ„ Ø£Ùˆ Ù…Ø±Ø¬Ø¹ Ø´ÙƒÙ„ÙŠ Ù„Ù‡Ø°Ù‡ Ø§Ù„Ø£Ø­Ø±Ù. Ø®Ù…Ø³Ø© Ù‚Ø±ÙˆÙ† Ù…Ù† Ø§Ù„Ø²Ù…Ù† Ù„Ù… ØªÙ‚Ø¶ÙŠ Ø¹Ù„Ù‰ Ù‡Ø°Ø§ Ø§Ù„Ù†ØµØŒ Ø¨Ù„ Ø§Ù†Ù‡ Ø­ØªÙ‰ ØµØ§Ø± Ù…Ø³ØªØ®Ø¯Ù…Ø§Ù‹ ÙˆØ¨Ø´ÙƒÙ„Ù‡ Ø§Ù„Ø£ØµÙ„ÙŠ ÙÙŠ Ø§Ù„Ø·Ø¨Ø§Ø¹Ø© ÙˆØ§Ù„ØªÙ†Ø¶ÙŠØ¯ Ø§Ù„Ø¥Ù„ÙƒØªØ±ÙˆÙ†ÙŠ. Ø§Ù†ØªØ´Ø± Ø¨Ø´ÙƒÙ„ ÙƒØ¨ÙŠØ± ÙÙŠ Ø³ØªÙŠÙ†ÙŠÙ‘Ø§Øª Ù‡Ø°Ø§ Ø§Ù„Ù‚Ø±Ù† Ù…Ø¹ Ø¥ØµØ¯Ø§Ø± Ø±Ù‚Ø§Ø¦Ù‚ "Ù„ÙŠØªØ±Ø§Ø³ÙŠØª" (Letraset) Ø§Ù„Ø¨Ù„Ø§Ø³ØªÙŠÙƒÙŠØ© ØªØ­ÙˆÙŠ Ù…Ù‚Ø§Ø·Ø¹ Ù…Ù† Ù‡Ø°Ø§ Ø§Ù„Ù†ØµØŒ ÙˆØ¹Ø§Ø¯ Ù„ÙŠÙ†ØªØ´Ø± Ù…Ø±Ø© Ø£Ø®Ø±Ù‰ Ù…Ø¤Ø®Ø±Ø§ÙŽ Ù…Ø¹ Ø¸Ù‡ÙˆØ± Ø¨Ø±Ø§Ù…Ø¬ Ø§Ù„Ù†Ø´Ø± Ø§Ù„Ø¥Ù„ÙƒØªØ±ÙˆÙ†ÙŠ Ù…Ø«Ù„ "Ø£Ù„Ø¯ÙˆØ³ Ø¨Ø§ÙŠØ¬ Ù…Ø§ÙŠÙƒØ±" (Aldus PageMaker) ÙˆØ§Ù„ØªÙŠ Ø­ÙˆØª Ø£ÙŠØ¶Ø§Ù‹ Ø¹Ù„Ù‰ Ù†Ø³Ø® Ù…Ù† Ù†Øµ Ù„ÙˆØ±ÙŠÙ… Ø¥ÙŠØ¨Ø³ÙˆÙ….</p>', '2nd, test', 0, 'Publish', 0),
(39, 2, 'Custom CMS Written in PHP', 'Tassawer Hussain', '2017-03-25', 'clone_CH-view-900x300.jpg', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut lobortis libero et libero malesuada, non pharetra est rhoncus. Aliquam ac leo congue, iaculis purus blandit, hendrerit massa. Nullam eleifend tempus commodo. Sed ac euismod leo. Pellentesque scelerisque aliquam ornare. Nunc dapibus tempus eros et vehicula. Nunc nibh metus, venenatis vitae volutpat id, condimentum vel justo. Integer ac ornare mi. Mauris fermentum dictum lectus, non laoreet urna elementum et. Aliquam mauris lacus, elementum nec mi consectetur, fringilla dignissim odio. Etiam eget odio sem. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Proin faucibus efficitur sollicitudin. Ut placerat auctor massa. Mauris tincidunt tellus eu diam placerat, et fermentum velit accumsan. Duis porta pulvinar risus, ullamcorper scelerisque ante ullamcorper sed. Donec sagittis mauris id urna porta, et consectetur elit bibendum. Sed mattis semper tempor. Sed maximus placerat dui, vitae condimentum eros ullamcorper et. Aliquam suscipit, metus non venenatis rhoncus, turpis eros elementum nunc, in convallis nibh turpis ac odio. Maecenas diam magna, fringilla eu feugiat maximus, eleifend non urna. Mauris ac viverra eros, eu malesuada libero. Pellentesque congue lectus eu leo pretium commodo. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla dignissim et lectus non congue. Ut at accumsan lacus. Donec interdum maximus massa at tristique. Nullam imperdiet, neque id fringilla iaculis, dolor augue condimentum lectus, a efficitur risus neque nec ipsum. Aliquam egestas aliquet mauris ac ultrices. Phasellus ut sagittis sapien. Duis ornare arcu a eros facilisis dapibus. Aliquam dapibus sem consectetur urna ornare, sit amet porta mi suscipit. Proin cursus est purus, in sagittis risus sagittis id. Curabitur pulvinar quis augue vitae mattis. Sed tempor urna ligula, a efficitur erat auctor vel. Pellentesque vulputate sem et ultrices accumsan. Etiam eget luctus justo, a dignissim tortor. Integer a elit justo. In vestibulum est sit amet ante viverra tincidunt non sit amet nunc. Morbi vitae accumsan tortor, a molestie risus. Nunc sit amet ultrices justo. Nulla facilisi. Curabitur elementum risus id viverra convallis. Ut sit amet semper nibh. Sed vitae ex aliquet, scelerisque mi ultricies, pulvinar massa. Ut risus dolor, finibus non scelerisque nec, laoreet vel elit. Maecenas laoreet sit amet est at accumsan. Etiam sed quam ante. Nunc nec dapibus risus. Vivamus in pretium elit. In consectetur erat tincidunt ligula fermentum, volutpat aliquam est consectetur. Donec quis volutpat tellus. Mauris ultricies eros vitae semper faucibus. Vivamus eget maximus metus. Sed id mi non nunc tempus sagittis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Aliquam gravida, urna mollis dictum finibus, diam elit consectetur quam, non euismod neque neque eget dolor. Nunc dapibus dapibus quam vel viverra.</p>', 'First Post, CMS, Author, Tassawer', 0, 'Publish', 0);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `role_id` int(3) NOT NULL,
  `role_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_id`, `role_name`) VALUES
(1, 'Admin'),
(2, 'Author'),
(3, 'Editor'),
(4, 'Reader');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(3) NOT NULL,
  `username` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_firstname` varchar(255) NOT NULL,
  `user_lastname` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_image` text NOT NULL,
  `user_randsalt` varchar(255) NOT NULL,
  `user_status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `user_password`, `user_firstname`, `user_lastname`, `user_email`, `user_image`, `user_randsalt`, `user_status`) VALUES
(1, 'tassawer1991', '$2y$10$iusesomecrazystrings2uU0e6vyuuaJeQyZXbwbZkRnwGxXo6Z0m', 'Tassawer', 'Hussain', 'tassawer1991@gmail.com', 'tassawer1991@gmail.com12961361_1073954949343327_5538787233231229061_o.jpg', '', 'Active'),
(2, 'Aadi', '$2y$10$iusesomecrazystrings2uU0e6vyuuaJeQyZXbwbZkRnwGxXo6Z0m', 'Abdullah', 'Khan', 'abdullah@gmail.com', 'abdullah@gmail.com16864997_1838260633106576_6134964709027580263_n.jpg', '', 'Block'),
(5, 'th', '$2y$12$WM8qu9i.t33mL7dyA74lxenkFvu7b/kwOvt9ge4ACCO.e.tS4CAHe', '', '', 'th@gmail.com', '', '', 'Block');

-- --------------------------------------------------------

--
-- Table structure for table `users_online`
--

CREATE TABLE `users_online` (
  `user_online_id` int(11) NOT NULL,
  `session` varchar(255) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_online`
--

INSERT INTO `users_online` (`user_online_id`, `session`, `time`) VALUES
(1, '2gqornq25mhnf3mpd68q82pl06', 1490469243),
(2, 'vqqfg73ruu0k6tp0ebuu8dkjn2', 1490465670),
(3, 'hghos0q56vjic3aevg6tm7onq2', 1490468805),
(4, '9jn8p60oslmcnqng60s9p7qnj3', 1490485162);

-- --------------------------------------------------------

--
-- Table structure for table `users_role`
--

CREATE TABLE `users_role` (
  `u_r_id` int(5) NOT NULL,
  `u_id` int(3) NOT NULL,
  `r_id` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_role`
--

INSERT INTO `users_role` (`u_r_id`, `u_id`, `r_id`) VALUES
(5, 2, 2),
(7, 1, 1),
(8, 1, 2),
(9, 1, 3),
(10, 1, 4),
(11, 3, 2),
(12, 3, 3),
(13, 3, 4),
(14, 4, 2),
(15, 4, 3),
(16, 4, 4),
(17, 5, 2),
(18, 5, 3),
(19, 5, 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `users_online`
--
ALTER TABLE `users_online`
  ADD PRIMARY KEY (`user_online_id`);

--
-- Indexes for table `users_role`
--
ALTER TABLE `users_role`
  ADD PRIMARY KEY (`u_r_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `users_online`
--
ALTER TABLE `users_online`
  MODIFY `user_online_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `users_role`
--
ALTER TABLE `users_role`
  MODIFY `u_r_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
