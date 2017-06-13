-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 13, 2017 at 01:24 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `user_group`
--

CREATE TABLE `user_group` (
  `id` int(50) NOT NULL,
  `category` varchar(50) NOT NULL,
  `description` varchar(150) NOT NULL,
  `isCustomer` tinyint(1) NOT NULL,
  `date_created` varchar(60) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `user_group`
--

INSERT INTO `user_group` (`id`, `category`, `description`, `isCustomer`, `date_created`, `status`) VALUES
(1, 'مدیریت', 'کاربران مدیر در این گروه قرار می گیرند.', 0, '1497349595', 1),
(2, 'کارمندان', 'کارمندان سایت در این قسمت قرار می گیرند.', 0, '1497349612', 1),
(3, 'کاربران مهمان', 'این قسمت برای کاربران مهمان است.', 0, '1497352634', 1),
(5, 'مشتریان طلایی', 'مشتریان دسته طلایی در این قسمت قرار می گیرند.', 1, '1497350149', 1),
(6, 'مشتریان نقره ای', 'مشتریان نقره ای در این قسمت قرار می گیرند.', 1, '1497350181', 0),
(7, 'مشتریان برنزی', 'مشتریان برنزی در این قسمت قرار می گیرند.', 1, '1497350197', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `user_group`
--
ALTER TABLE `user_group`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user_group`
--
ALTER TABLE `user_group`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
