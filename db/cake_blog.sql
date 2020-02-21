-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 21, 2020 at 09:14 AM
-- Server version: 8.0.18
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cake_blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `category_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `title`, `body`, `category_id`, `created`, `modified`) VALUES
(1, 'The title', 'This is the article body.', 1, '2020-02-21 13:09:47', NULL),
(2, 'A title once again', 'And the article body follows.', 1, '2020-02-21 13:09:47', NULL),
(3, 'Title strikes back', 'This is really exciting! Not.', 1, '2020-02-21 13:09:47', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `lft` varchar(255) NOT NULL,
  `rght` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `lft`, `rght`, `name`, `description`, `created`, `modified`) VALUES
(11, NULL, '1', 4, 'root', 'add', '2020-02-21 08:50:52', '2020-02-21 08:50:52'),
(12, 11, '2', 3, 'child', 'add1 ', '2020-02-21 08:53:02', '2020-02-21 08:53:02');

-- --------------------------------------------------------

--
-- Table structure for table `phinxlog`
--

CREATE TABLE `phinxlog` (
  `version` bigint(20) NOT NULL,
  `migration_name` varchar(100) DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `breakpoint` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `phinxlog`
--

INSERT INTO `phinxlog` (`version`, `migration_name`, `start_time`, `end_time`, `breakpoint`) VALUES
(20200219101455, 'CreateArticles', '2020-02-21 02:02:37', '2020-02-21 02:02:38', 0),
(20200219102100, 'CreateCategories', '2020-02-21 02:02:38', '2020-02-21 02:02:39', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phinxlog`
--
ALTER TABLE `phinxlog`
  ADD PRIMARY KEY (`version`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
