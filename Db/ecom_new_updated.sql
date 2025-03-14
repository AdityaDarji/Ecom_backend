-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 30, 2024 at 04:19 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecom_new`
--

-- --------------------------------------------------------

--
-- Table structure for table `about_us`
--

CREATE TABLE `about_us` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `about_us`
--

INSERT INTO `about_us` (`id`, `title`, `description`) VALUES
(1, 'Components of an About Us page', 'In Shopify’s customer trust research, we found shoppers navigate to an About Us page to learn more about the brand and the people behind the products. According to one study, 59% of consumers surveyed said they would more likely purchase from a brand they trust. That number jumps to 79% of younger Gen Z consumers. Your About Page should address those two curiosities shoppers have to help them with decision making. \r\n');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `email`, `password`) VALUES
(1, 'sarthak@k.com', '12345678');

-- --------------------------------------------------------

--
-- Table structure for table `alldeliveries`
--

CREATE TABLE `alldeliveries` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `seller` varchar(40) DEFAULT NULL,
  `delivery_date` varchar(12) DEFAULT NULL,
  `delivery_service_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `alldeliveries`
--

INSERT INTO `alldeliveries` (`id`, `order_id`, `seller`, `delivery_date`, `delivery_service_id`) VALUES
(1, 53, 'sar1@k.com', '00/00/00', 3),
(2, 53, 'sar1@k.com', '..', 3),
(3, 53, 'sar1@k.com', '00/00/00', -2),
(4, 53, 'sar1@k.com', '00/00/00', -1),
(5, 55, 'sar1@k.com', '..', 1),
(6, 55, 'sar1@k.com', '00/00/00', 3),
(7, 59, 'sar1@k.com', '02/02/2023', 1),
(8, 60, 'sar1@k.com', '31/01/2023', 3),
(9, 60, 'sar1@k.com', '31/01/2023', 3);

-- --------------------------------------------------------

--
-- Table structure for table `alldrivers`
--

CREATE TABLE `alldrivers` (
  `id` int(11) NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `lat` double NOT NULL,
  `lng` double NOT NULL,
  `isRestrict` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(12) DEFAULT NULL,
  `service` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `alldrivers`
--

INSERT INTO `alldrivers` (`id`, `email`, `password`, `lat`, `lng`, `isRestrict`, `phone`, `service`) VALUES
(1, 'driver@k.com', '12345678', 25.4507327, 81.8821777, '0', '1234567890', 'Driver'),
(2, 'driver2@k.com', '12345678', 12.3434, 43.3456, '0', '1234567890', 'Driver');

-- --------------------------------------------------------

--
-- Table structure for table `allsellers`
--

CREATE TABLE `allsellers` (
  `id` int(11) NOT NULL,
  `shop_name` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `lat` double NOT NULL,
  `lng` double NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `delivery_area` varchar(255) DEFAULT NULL,
  `gst` float NOT NULL DEFAULT 18,
  `isRestrict` int(11) NOT NULL,
  `is_third_party` tinyint(1) DEFAULT 0,
  `service_type` varchar(255) DEFAULT NULL,
  `service_locations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`service_locations`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `allsellers`
--

INSERT INTO `allsellers` (`id`, `shop_name`, `email`, `password`, `lat`, `lng`, `address`, `phone`, `delivery_area`, `gst`, `isRestrict`, `is_third_party`, `service_type`, `service_locations`) VALUES
(2, 'SarShop', 'sar1@k.com', '12345678', 25.5941, 85.1376, 'dfsf', '1234567890', 'Prayagraj', 19, 1, 0, NULL, NULL),
(7, 'SarShop2', 'sar2@k.com', 'asdfghjk', 37.4219983, -122.084, '1600 Amphitheatre Pkwy, , Mountain View, 94043, United States', '1234567890', '', 18, 1, 0, NULL, NULL),
(8, 'Sarthak', 'sarthak@l.com', 'asdfghjk', 25.4507468, 81.882379, '4/628, Daraganj, Prayagraj, 211006, India', '0987654321', 'Prayagraj', 19, 0, 0, NULL, NULL),
(9, '', '', '', 0, 0, '', '', '', 50, 0, 0, NULL, NULL),
(10, '', 'abcdef', '', 0, 0, '', '', '', 19, 0, 0, NULL, NULL),
(11, '', 'a', '', 5.5517583, 7.0444817, 'H23V+26X, , Akabo, 461115, Nigeria', '', '', 19, 0, 0, NULL, NULL),
(12, 'qwerty', 'Adam ', '123', 5.5517583, 7.0444817, 'H23V+26X, , Akabo, 461115, Nigeria', '12345678', '', 19, 0, 0, NULL, NULL),
(13, 'ss', 'ss@gmail.com', 'ss@123', 37.4219983, -122.084, '1650 Amphitheatre Pkwy, , Mountain View, 94043, United States', '98767565878', NULL, 18, 0, 1, 'Movers & Packers (Local)', '[{\"lat\": 9.9312328, \"lng\": 76.26730409999999, \"address\": \"Kochchi, Kochchi, Ernakulam, , India\"}]'),
(14, 'ss', 'ss1@gmail.com', 'ss@123', 37.4219983, -122.084, '1650 Amphitheatre Pkwy, , Mountain View, 94043, United States', '98767565878', NULL, 18, 0, 1, 'Movers & Packers (Local)', '[{\"lat\": 9.9312328, \"lng\": 76.26730409999999, \"address\": \"Kochchi, Kochchi, Ernakulam, , India\"}]'),
(15, 'ss', 'ss2@gmail.com', 'ss@123', 37.4219983, -122.084, '1650 Amphitheatre Pkwy, , Mountain View, 94043, United States', '98767565878', NULL, 18, 0, 1, 'Movers & Packers (Local)', '[{\"lat\": 9.9312328, \"lng\": 76.26730409999999, \"address\": \"Kochchi, Kochchi, Ernakulam, , India\"}]'),
(16, 'ss', 'ss3@gmail.com', 'ss@123', 37.4219983, -122.084, '1650 Amphitheatre Pkwy, , Mountain View, 94043, United States', '98767565878', NULL, 18, 0, 1, 'Movers & Packers (Local)', '[{\"lat\": 9.9312328, \"lng\": 76.26730409999999, \"address\": \"Kochchi, Kochchi, Ernakulam, , India\"}]'),
(17, 'Clothes', 'ss4@gmail.com', 'ss@123', 37.4219983, -122.084, '1600 Amphitheatre Pkwy, , Mountain View, 94043, United States', '2345619870', NULL, 123456, 0, 1, 'Courier', '[{\"lat\": 40.7127753, \"lng\": -74.0059728, \"address\": \"New York City Hall, Manhattan, New York, 10007, United States\"}]'),
(18, 'redshop', 'red@gmail.com', '12345', 12.9716, 77.5946, '67/1, Ashok Nagar, Bengaluru, 560002, India', '0129348576', NULL, 129349000, 0, 0, '', NULL),
(19, 'sedbedred', 'redsed@mail.com', '123455', 12.9716, 77.5946, '67/1, Ashok Nagar, Bengaluru, 560002, India', '0129384756', NULL, 129385000000, 0, 1, 'None', '\"NULL\"');

-- --------------------------------------------------------

--
-- Table structure for table `allusers`
--

CREATE TABLE `allusers` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(60) NOT NULL,
  `password` varchar(60) NOT NULL,
  `cart_item` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `ref_wallet` varchar(255) NOT NULL DEFAULT '0',
  `isRestrict` tinyint(1) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `allusers`
--

INSERT INTO `allusers` (`id`, `name`, `email`, `password`, `cart_item`, `code`, `ref_wallet`, `isRestrict`, `phone`, `image_url`) VALUES
(1, 'Amit ', 'example@email.com', '12345678', 'YToxOntpOjA7aToxODt9', 'FC2456', '70', 0, '1234567890', 'https://iili.io/2BVKvEP.png'),
(2, 'Sart', 'sart@gmail.com', '12345678', '', '', '2100', 0, '1234567890', NULL),
(3, 'Sarth', 'sarth@k.com', '12345678', '', '', '2100', 0, '1234567890', NULL),
(5, 'Sarath K', 'sarthak2@gmail.com', '12345678', 'YTowOnt9', '', '2100', 0, '1234567890', NULL),
(6, '', '', '', 'YTozOntpOjA7aToxO2k6MTtpOjE5O2k6MjtpOjA7fQ==', '', '2050', 0, '1234567890', NULL),
(7, 'ss', 'ss@email.com', '12345678', 'YTowOnt9', NULL, '0', 0, '1234567890', NULL),
(8, 'ss1', 'ss1@email.com', '12345678', 'YTo0OntpOjA7aTozMjtpOjE7aToxODtpOjI7aToxODtpOjM7aToxODt9', NULL, '0', 0, '1234567890', NULL),
(9, 'test1', 'test1@gmail.com', '', 'YTowOnt9', NULL, '0', 0, '1234567890', NULL),
(10, 'Rushikesh ', 'rpdiwte@gmail.com ', 'newpassword', 'YTowOnt9', NULL, '0', 0, '1234567890', NULL),
(11, 'sarath', 'sarath@gmail.com', 'sarath', 'YToxOntpOjA7aToyMDt9', NULL, '0', 0, '1234567890', NULL),
(12, 'sarath', 'Sarathj810@gmail.com', 'sarath', 'YTowOnt9', NULL, '0', 0, '1234567890', NULL),
(13, 'helllllll', 'hi@gmail.com', '123456789', 'YTowOnt9', NULL, '0', 0, NULL, NULL),
(14, 'bino', 'bino@bino.com', '123456789', 'YTowOnt9', NULL, '0', 0, '9999999999', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `all_service_users`
--

CREATE TABLE `all_service_users` (
  `id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(60) NOT NULL,
  `lat` double NOT NULL,
  `lng` double NOT NULL,
  `isRestrict` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `all_service_users`
--

INSERT INTO `all_service_users` (`id`, `seller_id`, `service_id`, `name`, `phone`, `email`, `password`, `lat`, `lng`, `isRestrict`) VALUES
(1, 2, 1, 'plumber1', '0987654321', 'plumber1@gmail.com', '12345678', 0, 0, ''),
(2, 2, 2, 'Carpentre1', '9876543210', 'Carpentre1@gmail.com', '12345678', 0, 0, ''),
(3, 2, 1, 'plumber2', '8765432109', 'plumber2@gmail.com', '12345678', 0, 0, ''),
(4, 2, 1, 'plumber3', '8765432109', 'plumber3@gmail.com', '12345678', 0, 0, ''),
(8, 2, 4, 'computer repair', '7654321098', 'computerrepair1@gmail.com', '12345678', 0, 0, ''),
(9, 2, 1, 'plumber4', '4321098765', 'plumber4@gmail.com', '12345678', 0, 0, ''),
(10, 2, 5, 'electrician', '3210987654', 'electrician1@gmail.com', '12345678', 0, 0, ''),
(11, 2, 1, 'plumber5', '1111111111', 'plumber5@gmail.com', '12345678', 0, 0, ''),
(12, 2, 1, 'plumber6', '2143290703', 'plumber6@gmail.com', '12345678', 0, 0, ''),
(13, 2, 2, 'Carpentre2', '3216549870', 'carpentre2@gmail.com', '12345678', 0, 0, ''),
(14, 2, 6, 'Driver1', '6543219870', 'driver1@gmail.com', '12345678', 0, 0, ''),
(15, 2, 3, 'Acmechanic1', '6241359870', 'acmechanic01@gmail.com', '12345678', 0, 0, ''),
(16, 2, 2, 'Carpentre3', '2135648970', 'carpentre3@gmail.com', '12345678', 0, 0, ''),
(17, 2, 3, 'Acmechanic2', '5468792130', 'acmechanic02@gmail.com', '12345678', 0, 0, ''),
(18, 2, 3, 'Acmechanic3', '8975642310', 'acmechanic03@gmail.com', '1234567', 0, 0, ''),
(19, 2, 6, 'example', '1234567890', 'rx@gmail.com', '12345678', 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `boosted_products`
--

CREATE TABLE `boosted_products` (
  `pid` int(11) NOT NULL,
  `boost` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `buy_now_table`
--

CREATE TABLE `buy_now_table` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `product_price` varchar(50) NOT NULL,
  `pd_image_url` text NOT NULL,
  `seller_id` int(11) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `product_description` varchar(5000) NOT NULL,
  `order_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buy_now_table`
--

INSERT INTO `buy_now_table` (`id`, `user_id`, `product_id`, `product_name`, `product_price`, `pd_image_url`, `seller_id`, `user_email`, `product_description`, `order_date`) VALUES
(38, 5, 19, 'Skullcandy headset L325', '8999', 'assets/headphones_2.png', 2, 'example@email.com', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ut labore et dolore magna aliqua. Nec nam aliquam sem et tortor consequat id porta nibh. Orci porta non pulvinar neque laoreet suspendisse. Id nibh tortor id aliquet. Dui sapie', '2024-07-15'),
(39, 5, 33, 'Airdopes 162', '999', 'https://www.boat-lifestyle.com/cdn/shop/products/main_blue_a80b6882-1247-439d-a17b-1c87ed4fa7c8_600x.png?v=1641206192', 2, 'example@email.com', 'Wireless Earbuds with Massive Playback of upto 40 Hours, IPX5 Water & Sweat Resistance, IWP Technology, Type C Interface', '2024-09-07'),
(40, 5, 19, 'Skullcandy headset L325', '8999', 'assets/headphones_2.png', 2, 'example@email.com', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ut labore et dolore magna aliqua. Nec nam aliquam sem et tortor consequat id porta nibh. Orci porta non pulvinar neque laoreet suspendisse. Id nibh tortor id aliquet. Dui sapie', '2024-07-15'),
(42, 5, 18, 'Headphones', '7999', 'assets/headphone_9.png', 2, 'example@email.com', 'Description', '2024-09-10'),
(43, 5, 18, 'Headphones', '7999', 'assets/headphone_9.png', 2, 'example@email.com', 'Description', '2024-09-11'),
(44, 5, 19, 'Skullcandy headset L325', '8999', 'assets/headphones_2.png', 2, 'example@email.com', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ut labore et dolore magna aliqua. Nec nam aliquam sem et tortor consequat id porta nibh. Orci porta non pulvinar neque laoreet suspendisse. Id nibh tortor id aliquet. Dui sapie', '2024-07-15'),
(45, 5, 19, 'Skullcandy headset L325', '8999', 'assets/headphones_2.png', 2, 'example@email.com', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ut labore et dolore magna aliqua. Nec nam aliquam sem et tortor consequat id porta nibh. Orci porta non pulvinar neque laoreet suspendisse. Id nibh tortor id aliquet. Dui sapie', '2024-07-15'),
(46, 5, 19, 'Skullcandy headset L325', '8999', 'assets/headphones_2.png', 2, 'example@email.com', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ut labore et dolore magna aliqua. Nec nam aliquam sem et tortor consequat id porta nibh. Orci porta non pulvinar neque laoreet suspendisse. Id nibh tortor id aliquet. Dui sapie', '2024-07-15'),
(47, 5, 19, 'Skullcandy headset L325', '8999', 'assets/headphones_2.png', 2, 'example@email.com', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ut labore et dolore magna aliqua. Nec nam aliquam sem et tortor consequat id porta nibh. Orci porta non pulvinar neque laoreet suspendisse. Id nibh tortor id aliquet. Dui sapie', '2024-07-15'),
(48, 5, 19, 'Skullcandy headset L325', '8999', 'assets/headphones_2.png', 2, 'example@email.com', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ut labore et dolore magna aliqua. Nec nam aliquam sem et tortor consequat id porta nibh. Orci porta non pulvinar neque laoreet suspendisse. Id nibh tortor id aliquet. Dui sapie', '2024-07-15'),
(49, 5, 19, 'Skullcandy headset L325', '8999', 'assets/headphones_2.png', 2, 'example@email.com', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ut labore et dolore magna aliqua. Nec nam aliquam sem et tortor consequat id porta nibh. Orci porta non pulvinar neque laoreet suspendisse. Id nibh tortor id aliquet. Dui sapie', '2024-07-15'),
(50, 5, 19, 'Skullcandy headset L325', '8999', 'assets/headphones_2.png', 2, 'example@email.com', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ut labore et dolore magna aliqua. Nec nam aliquam sem et tortor consequat id porta nibh. Orci porta non pulvinar neque laoreet suspendisse. Id nibh tortor id aliquet. Dui sapie', '2024-07-15'),
(51, 5, 18, 'Headphones', '7999', 'assets/headphone_9.png', 2, 'example@email.com', 'Description', '2024-09-19'),
(52, 5, 18, 'Headphones', '7999', 'assets/headphone_9.png', 2, 'example@email.com', 'Description', '2024-09-20'),
(53, 5, 18, 'Headphones', '7999', 'assets/headphone_9.png', 2, 'example@email.com', 'Description', '2024-09-21'),
(54, 5, 19, 'Skullcandy headset L325', '8999', 'assets/headphones_2.png', 2, 'example@email.com', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ut labore et dolore magna aliqua. Nec nam aliquam sem et tortor consequat id porta nibh. Orci porta non pulvinar neque laoreet suspendisse. Id nibh tortor id aliquet. Dui sapie', '2024-07-15'),
(55, 5, 19, 'Skullcandy headset L325', '8999', 'assets/headphones_2.png', 2, 'example@email.com', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ut labore et dolore magna aliqua. Nec nam aliquam sem et tortor consequat id porta nibh. Orci porta non pulvinar neque laoreet suspendisse. Id nibh tortor id aliquet. Dui sapie', '2024-07-15'),
(56, 5, 19, 'Skullcandy headset L325', '8999', 'assets/headphones_2.png', 2, 'example@email.com', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ut labore et dolore magna aliqua. Nec nam aliquam sem et tortor consequat id porta nibh. Orci porta non pulvinar neque laoreet suspendisse. Id nibh tortor id aliquet. Dui sapie', '2024-07-15'),
(57, 5, 18, 'Headphones', '7999', 'assets/headphone_9.png', 2, 'example@email.com', 'Description', '2024-09-25'),
(58, 5, 19, 'Skullcandy headset L325', '8999', 'assets/headphones_2.png', 2, 'example@email.com', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ut labore et dolore magna aliqua. Nec nam aliquam sem et tortor consequat id porta nibh. Orci porta non pulvinar neque laoreet suspendisse. Id nibh tortor id aliquet. Dui sapie', '2024-07-15'),
(59, 5, 19, 'Skullcandy headset L325', '8999', 'assets/headphones_2.png', 2, 'example@email.com', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ut labore et dolore magna aliqua. Nec nam aliquam sem et tortor consequat id porta nibh. Orci porta non pulvinar neque laoreet suspendisse. Id nibh tortor id aliquet. Dui sapie', '2024-07-15'),
(60, 5, 19, 'Skullcandy headset L325', '8999', 'assets/headphones_2.png', 2, 'example@email.com', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ut labore et dolore magna aliqua. Nec nam aliquam sem et tortor consequat id porta nibh. Orci porta non pulvinar neque laoreet suspendisse. Id nibh tortor id aliquet. Dui sapie', '2024-07-15'),
(61, 5, 19, 'Skullcandy headset L325', '8999', 'assets/headphones_2.png', 2, 'example@email.com', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ut labore et dolore magna aliqua. Nec nam aliquam sem et tortor consequat id porta nibh. Orci porta non pulvinar neque laoreet suspendisse. Id nibh tortor id aliquet. Dui sapie', '2024-07-15'),
(62, 5, 19, 'Skullcandy headset L325', '8999', 'assets/headphones_2.png', 2, 'example@email.com', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ut labore et dolore magna aliqua. Nec nam aliquam sem et tortor consequat id porta nibh. Orci porta non pulvinar neque laoreet suspendisse. Id nibh tortor id aliquet. Dui sapie', '2024-07-15'),
(63, 5, 35, 'Tshirt', '2500', 'assets/tshirt_2.png', 2, 'example@email.com', 'Tshirt for children', '2024-10-01'),
(64, 5, 18, 'Headphones', '7999', 'assets/headphone_9.png', 2, 'example@email.com', 'Description', '2024-10-02'),
(65, 5, 18, 'Headphones', '7999', 'assets/headphone_9.png', 2, 'example@email.com', 'Description', '2024-10-03'),
(66, 5, 18, 'Headphones', '7999', 'assets/headphone_9.png', 2, 'example@email.com', 'Description', '2024-10-04'),
(67, 5, 18, 'Headphones', '7999', 'assets/headphone_9.png', 2, 'example@email.com', 'Description', '2024-10-05'),
(68, 5, 18, 'Headphones', '7999', 'assets/headphone_9.png', 2, 'example@email.com', 'Description', '2024-10-06'),
(69, 5, 18, 'Headphones', '7999', 'assets/headphone_9.png', 2, 'example@email.com', 'Description', '2024-10-07'),
(70, 5, 18, 'Headphones', '7999', 'assets/headphone_9.png', 2, 'example@email.com', 'Description', '2024-10-08'),
(71, 5, 19, 'Skullcandy headset L325', '8999', 'assets/headphones_2.png', 2, 'example@email.com', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ut labore et dolore magna aliqua. Nec nam aliquam sem et tortor consequat id porta nibh. Orci porta non pulvinar neque laoreet suspendisse. Id nibh tortor id aliquet. Dui sapie', '2024-07-15'),
(72, 5, 19, 'Skullcandy headset L325', '8999', 'assets/headphones_2.png', 2, 'example@email.com', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ut labore et dolore magna aliqua. Nec nam aliquam sem et tortor consequat id porta nibh. Orci porta non pulvinar neque laoreet suspendisse. Id nibh tortor id aliquet. Dui sapie', '2024-07-15'),
(73, 5, 18, 'Headphones', '7999', 'assets/headphone_9.png', 2, 'example@email.com', 'Description', '2024-10-11'),
(74, 5, 18, 'Headphones', '7999', 'assets/headphone_9.png', 2, 'example@email.com', 'Description', '2024-10-12'),
(75, 5, 19, 'Skullcandy headset L325', '8999', 'assets/headphones_2.png', 2, 'example@email.com', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ut labore et dolore magna aliqua. Nec nam aliquam sem et tortor consequat id porta nibh. Orci porta non pulvinar neque laoreet suspendisse. Id nibh tortor id aliquet. Dui sapie', '2024-07-15'),
(76, 5, 18, 'Headphones', '7999', 'assets/headphone_9.png', 2, 'example@email.com', 'Description', '2024-10-14'),
(77, 5, 19, 'Skullcandy headset L325', '8999', 'assets/headphones_2.png', 2, 'example@email.com', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ut labore et dolore magna aliqua. Nec nam aliquam sem et tortor consequat id porta nibh. Orci porta non pulvinar neque laoreet suspendisse. Id nibh tortor id aliquet. Dui sapie', '2024-07-15'),
(78, 5, 19, 'Skullcandy headset L325', '8999', 'assets/headphones_2.png', 2, 'example@email.com', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ut labore et dolore magna aliqua. Nec nam aliquam sem et tortor consequat id porta nibh. Orci porta non pulvinar neque laoreet suspendisse. Id nibh tortor id aliquet. Dui sapie', '2024-07-15'),
(79, 5, 18, 'Headphones', '7999', 'assets/headphone_9.png', 2, 'example@email.com', 'Description', '2024-10-17'),
(80, 5, 18, 'Headphones', '7999', 'assets/headphone_9.png', 2, 'example@email.com', 'Description', '2024-08-27'),
(81, 5, 20, 'Skullcandy headset X24', '4567', 'assets/headphones_3.png', 2, 'example@email.com', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ut labore et dolore magna aliqua. Nec nam aliquam sem et tortor consequat id porta nibh. Orci porta non pulvinar neque laoreet suspendisse. Id nibh tortor id aliquet. Dui sapie', '2024-08-28'),
(82, 5, 18, 'Headphones', '7999', 'assets/headphone_9.png', 2, 'example@email.com', 'Description', '2024-08-28'),
(83, 5, 19, 'Skullcandy headset L325', '8999', 'assets/headphones_2.png', 2, 'example@email.com', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ut labore et dolore magna aliqua. Nec nam aliquam sem et tortor consequat id porta nibh. Orci porta non pulvinar neque laoreet suspendisse. Id nibh tortor id aliquet. Dui sapie', '2024-08-28'),
(84, 5, 18, 'Headphones', '7999', 'assets/headphone_9.png', 2, 'example@email.com', 'Description', '2024-08-28'),
(85, 5, 18, 'Headphones', '7999', 'assets/headphone_9.png', 2, 'example@email.com', 'Description', '2024-08-28'),
(86, 5, 18, 'Headphones', '7999', 'assets/headphone_9.png', 2, 'example@email.com', 'Description', '2024-08-28'),
(87, 5, 18, 'Headphones', '7999', 'assets/headphone_9.png', 2, 'example@email.com', 'Description', '2024-08-28'),
(88, 5, 18, 'Headphones', '7999', 'assets/headphone_9.png', 2, 'example@email.com', 'Description', '2024-08-28'),
(89, 5, 18, 'Headphones', '7999', 'assets/headphone_9.png', 2, 'example@email.com', 'Description', '2024-08-28'),
(90, 5, 18, 'Headphones', '7999', 'assets/headphone_9.png', 2, 'example@email.com', 'Description', '2024-08-28');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `cid` int(11) NOT NULL,
  `category` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`cid`, `category`) VALUES
(1, 'headphone'),
(2, 'clothes'),
(3, 'Watch'),
(4, 'Shoes'),
(5, 'Bag');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `review_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `parent_comment_id` int(11) DEFAULT NULL,
  `comment_text` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `review_id`, `user_id`, `parent_comment_id`, `comment_text`, `created_at`) VALUES
(1, 16, 1, NULL, 'vgghrtg gd hgeru g  fhiuhfwi  fhuig', '2024-12-30 13:27:50'),
(2, 16, 6, 1, 'rgfreg fhhi ht  hct3b thbtbfc3', '2024-12-30 13:28:22');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_services`
--

CREATE TABLE `delivery_services` (
  `id` int(11) NOT NULL,
  `service_name` varchar(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `area` varchar(20) DEFAULT NULL,
  `transport` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `delivery_services`
--

INSERT INTO `delivery_services` (`id`, `service_name`, `email`, `password`, `area`, `transport`) VALUES
(-2, 'App drivers', NULL, NULL, 'India', 'Road Ways'),
(-1, 'Own', NULL, NULL, 'Own Area', 'Road Ways'),
(1, 'Quick delivery', 'delivery@service.com', '12345678', 'South-India', 'Roadways'),
(3, 'Your delivery ', 'your@email.com', '12345678', 'India', 'Airways ');

-- --------------------------------------------------------

--
-- Table structure for table `driver_kyc`
--

CREATE TABLE `driver_kyc` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `city` varchar(100) NOT NULL,
  `area` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `pincode` varchar(20) NOT NULL,
  `price_per_km` decimal(10,2) NOT NULL,
  `pan_card` varchar(50) NOT NULL,
  `aadhaar` varchar(50) NOT NULL,
  `pan_card_image` varchar(255) DEFAULT NULL,
  `aadhaar_image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `verified` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `driver_kyc`
--

INSERT INTO `driver_kyc` (`id`, `email`, `city`, `area`, `state`, `pincode`, `price_per_km`, `pan_card`, `aadhaar`, `pan_card_image`, `aadhaar_image`, `created_at`, `verified`) VALUES
(1, 'driver1@gmail.com', 'mumbai', 'MMR', 'Maharashtra', '401200', 1.23, '1234567', '1234567890', 'assets/bag_1.png', 'assets/bag_2.png', '2024-09-02 08:14:33', 0),
(2, 'driver1@gmail.com', 'mumbai', 'MMR', 'Maharashtra', '401200', 1.23, '1234567', '1234567890', 'assets/bag_1.png', 'assets/bag_2.png', '2024-09-02 08:14:37', 0),
(3, 'driver1@gmail.com', 'mumbai', 'MMR', 'Maharashtra', '401200', 1.23, '1234567', '1234567890', 'assets/bag_1.png', 'assets/bag_2.png', '2024-09-02 08:18:15', 0),
(4, 'driver1@gmail.com', 'Thane', 'Mumbai', 'Maharashtra', '400564', 2.34, '12345654321', '098765434', 'assets/bag_1.png', 'assets/bag_2.png', '2024-09-02 08:22:03', 0),
(5, 'driver1@gmail.com', 'eafesjdsln', 'dsnsjndsk', 'asdsnk', '123456', 2.00, '1234567', '123456790', '', '', '2024-09-10 17:33:50', 0),
(6, 'driver1@gmail.com', 'eafesjdsln', 'dsnsjndsk', 'asdsnk', '123456', 2.00, '1234567', '123456790', '', '', '2024-09-10 17:33:53', 0),
(7, 'driver1@gmail.com', 'eafesjdsln', 'dsnsjndsk', 'asdsnk', '123456', 2.00, '1234567', '123456790', '', '', '2024-09-10 17:33:57', 0),
(8, 'driver1@gmail.com', 'eafesjdsln', 'dsnsjndsk', 'asdsnk', '123456', 2.00, '1234567', '123456790', '', '', '2024-09-10 17:33:58', 0),
(9, 'driver1@gmail.com', 'eafesjdsln', 'dsnsjndsk', 'asdsnk', '123456', 2.00, '1234567', '123456790', '', '', '2024-09-10 17:33:59', 0),
(10, 'driver1@gmail.com', 'eafesjdsln', 'dsnsjndsk', 'asdsnk', '123456', 2.00, '1234567', '123456790', '', '', '2024-09-10 17:33:59', 0),
(11, 'driver1@gmail.com', 'eafesjdsln', 'dsnsjndsk', 'asdsnk', '123456', 2.00, '1234567', '123456790', '', '', '2024-09-10 17:33:59', 0),
(12, 'driver1@gmail.com', 'eafesjdsln', 'dsnsjndsk', 'asdsnk', '123456', 2.00, '1234567', '123456790', '', '', '2024-09-10 17:33:59', 0),
(13, 'driver1@gmail.com', 'eafesjdsln', 'dsnsjndsk', 'asdsnk', '123456', 2.00, '1234567', '123456790', '', '', '2024-09-10 17:34:00', 0),
(14, 'driver1@gmail.com', 'eafesjdsln', 'dsnsjndsk', 'asdsnk', '123456', 2.00, '1234567', '123456790', '', '', '2024-09-10 17:34:00', 0),
(15, 'driver1@gmail.com', 'pkjhgfds', 'aedcfgb', 'sdrftgyhjh', '765432', 12.00, '98765432', '098765432', '', '', '2024-09-10 17:38:14', 0),
(16, 'driver1@gmail.com', 'pkjhgfds', 'aedcfgb', 'sdrftgyhjh', '765432', 12.00, '98765432', '098765432', '', '', '2024-09-10 17:38:15', 0),
(17, 'driver1@gmail.com', 'pkjhgfds', 'aedcfgb', 'sdrftgyhjh', '765432', 12.00, '98765432', '098765432', '', '', '2024-09-10 17:38:15', 0),
(18, 'driver1@gmail.com', 'pkjhgfds', 'aedcfgb', 'sdrftgyhjh', '765432', 12.00, '98765432', '098765432', '', '', '2024-09-10 17:38:15', 0),
(19, 'driver1@gmail.com', 'pkjhgfds', 'aedcfgb', 'sdrftgyhjh', '765432', 12.00, '98765432', '098765432', '', '', '2024-09-10 17:38:15', 0),
(20, 'driver1@gmail.com', 'pkjhgfds', 'aedcfgb', 'sdrftgyhjh', '765432', 12.00, '98765432', '098765432', '', '', '2024-09-10 17:38:16', 0),
(21, 'driver1@gmail.com', 'pkjhgfds', 'aedcfgb', 'sdrftgyhjh', '765432', 12.00, '98765432', '098765432', '', '', '2024-09-10 17:38:16', 0),
(22, 'driver1@gmail.com', 'pkjhgfds', 'aedcfgb', 'sdrftgyhjh', '765432', 12.00, '98765432', '098765432', '', '', '2024-09-10 17:38:16', 0),
(23, 'driver1@gmail.com', 'pkjhgfds', 'aedcfgb', 'sdrftgyhjh', '765432', 12.00, '98765432', '098765432', NULL, NULL, '2024-09-10 17:44:22', 0),
(24, 'driver1@gmail.com', 'pkjhgfds', 'aedcfgb', 'sdrftgyhjh', '765432', 12.00, '98765432', '098765432', NULL, NULL, '2024-09-10 17:44:22', 0),
(25, 'driver1@gmail.com', 'pkjhgfds', 'aedcfgb', 'sdrftgyhjh', '765432', 12.00, '98765432', '098765432', NULL, NULL, '2024-09-10 17:44:23', 0),
(26, 'driver1@gmail.com', 'pkjhgfds', 'aedcfgb', 'sdrftgyhjh', '765432', 12.00, '98765432', '098765432', NULL, NULL, '2024-09-10 17:44:27', 0);

-- --------------------------------------------------------

--
-- Table structure for table `extra_charges`
--

CREATE TABLE `extra_charges` (
  `service_charge` float NOT NULL,
  `gst` float NOT NULL,
  `transaction_fee` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `extra_charges`
--

INSERT INTO `extra_charges` (`service_charge`, `gst`, `transaction_fee`) VALUES
(50, 18, 5);

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` int(11) NOT NULL,
  `imgurl` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `imgurl`) VALUES
(1, 'background.jpg.jpg'),
(2, 'background.png.png');

-- --------------------------------------------------------

--
-- Table structure for table `likedproduct`
--

CREATE TABLE `likedproduct` (
  `lid` int(11) NOT NULL,
  `pid` int(11) DEFAULT NULL,
  `imageurl` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `categoryid` int(11) DEFAULT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `gst` decimal(5,2) DEFAULT NULL,
  `email_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `likedproduct`
--

INSERT INTO `likedproduct` (`lid`, `pid`, `imageurl`, `name`, `description`, `price`, `categoryid`, `seller_id`, `gst`, `email_id`) VALUES
(28, 123, 'assets/myproduct/images.jpg', 'Mport', 'description', 250.00, 123, 123, 123.00, 'example@email.com'),
(29, 18, 'assets/headphone_9.png', 'Headphones', 'Description', 7999.00, 1, 2, 19.00, 'example@email.com'),
(30, 32, 'assets/hairclip.jpg', 'Hairclip', 'aaaa', 219.00, 1, 2, 19.00, 'example@email.com');

-- --------------------------------------------------------

--
-- Table structure for table `marketplace_products`
--

CREATE TABLE `marketplace_products` (
  `id` int(11) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` float NOT NULL,
  `category_id` int(11) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `gst` int(11) NOT NULL DEFAULT 18
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `marketplace_products`
--

INSERT INTO `marketplace_products` (`id`, `image_url`, `name`, `description`, `price`, `category_id`, `user_email`, `gst`) VALUES
(2, 'assets/cap_5.png', 'Caps', 'hshs', 199, 2, 'example@email.com', 18);

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `MessageID` int(11) NOT NULL,
  `SenderID` varchar(255) DEFAULT NULL,
  `ReceiverID` varchar(255) DEFAULT NULL,
  `Body` blob DEFAULT NULL,
  `SentAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`MessageID`, `SenderID`, `ReceiverID`, `Body`, `SentAt`) VALUES
(37, 'example@email.com', 'sarthak@k.com', 0x424d576a2f315a364d30657837674849624a507565413d3d, '2024-09-10 12:55:38'),
(38, 'example@email.com', 'sarthak@k.com', 0x41574b5263774e66357579793775674337562f4375513d3d, '2024-09-10 13:14:43');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `fromEmail` varchar(255) NOT NULL,
  `toEmail` varchar(255) NOT NULL,
  `msg` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`fromEmail`, `toEmail`, `msg`) VALUES
('sarthak@k.com', 'example@email.com', 'Hi'),
('example@email.com', 'sarthak@k.com', 'Hi Admin'),
('sohail@test.com', 'sar1@k.com', 'hello mr seller'),
('sar1@k.com', 'sohail@test.com', 'hi mr Sohail '),
('sarthak@k.com', 'abcdef', 'hi'),
('sarthak@k.com', 'a', ''),
('sarthak@k.com', 'example@email.com', 'Are done?'),
('sar1@k.com', 'sohail@test.com', ''),
('driver@k.com', 'example@email.com', 'Hey, Seller!'),
('example@email.com', 'sarthak@k.com', 'hello '),
('sar1@k.com', 'sohail@test.com', 'fine'),
('example@email.com', 'sarthak@k.com', 'hi'),
('sarthak@k.com', 'example@email.com', 'hello '),
('sarthak@k.com', 'example@email.com', 'Sosa'),
('sarthak@k.com', 'example@email.com', 'Sosa'),
('sarthak@k.com', 'example@email.com', 'test'),
('sarthak@k.com', 'ss3@gmail.com', 'hello'),
('example@email.com', 'sarthak@k.com', 'sarath'),
('sar1@k.com', 'sohail@test.com', 'hello sohail'),
('example@email.com', 'sarthak@k.com', 'sarath'),
('sarthak@k.com', 'ss@email.com', 'hello'),
('sar1@k.com', 'sohail@test.com', 'fflqxn'),
('sar1@k.com', 'sohail@test.com', 'jjqsun'),
('sar1@k.com', 'sohail@test.com', ''),
('sar1@k.com', 'sohail@test.com', 'bignpl'),
('sar1@k.com', 'sohail@test.com', 'pxvltw'),
('sar1@k.com', 'sohail@test.com', ''),
('sar1@k.com', 'sohail@test.com', 'tmjlwj'),
('sarthak@k.com', 'sarthak@l.com', 'hi'),
('sarthak@k.com', 'example@email.com', 'ok'),
('sarthak@k.com', 'example@email.com', 'hi'),
('sarthak@k.com', 'example@email.com', ''),
('', '', ''),
('', '', ''),
('example@email.com', 'sarthak@k.com', 'hi'),
('example@email.com', 'sarthak@k.com', 'heiei'),
('example@email.com', 'sarthak@k.com', 'heiei'),
('example@email.com', 'sarthak@k.com', 'heiei'),
('example@email.com', 'sarthak@k.com', 'hello'),
('sarthak@k.com', 'example@email.com', 'frgg');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `product_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `user` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `seller` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `shop_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `user_phone` varchar(12) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `seller_phone` varchar(12) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `shop_lat` double NOT NULL,
  `shop_lng` double NOT NULL,
  `shop_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `user_lat` double NOT NULL,
  `user_lng` double NOT NULL,
  `user_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `total_amount` float NOT NULL,
  `driver_id` int(11) DEFAULT NULL,
  `driver_status` int(11) DEFAULT 0,
  `order_date` date DEFAULT NULL,
  `delivery_date` datetime DEFAULT NULL,
  `product_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `cash_on_delivery` varchar(5) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `product_name`, `user`, `seller`, `shop_name`, `user_phone`, `seller_phone`, `shop_lat`, `shop_lng`, `shop_address`, `user_lat`, `user_lng`, `user_address`, `total_amount`, `driver_id`, `driver_status`, `order_date`, `delivery_date`, `product_image`, `cash_on_delivery`) VALUES
(83, 'Skullcandy headset L325', 'example@email.com', 'sar1@k.com', 'SarShop', NULL, '1234567890', 25.5941, 85.1376, 'dfsf', 25.7447, 85.0138, '', 11208.8, 1, 1, '2023-09-19', '2023-09-19 21:17:51', 'assets/headphones_2.png', '1'),
(84, 'Airdopes 161', 'example@email.com', 'sar1@k.com', 'SarShop', NULL, '1234567890', 25.5941, 85.1376, 'dfsf', 25.7447, 85.0138, '', 1576.77, 1, 1, '2023-09-19', '2023-09-19 21:22:00', 'https://www.boat-lifestyle.com/cdn/shop/products/main_blue_a80b6882-1247-439d-a17b-1c87ed4fa7c8_600x.png?v=1641206192', '1'),
(85, 'Bag', 'example@email.com', 'sar1@k.com', 'SarShop', NULL, '1234567890', 25.5941, 85.1376, 'dfsf', 25.7447, 85.0138, '', 298, 1, 0, '2023-09-19', NULL, '', '0'),
(86, 'Skullcandy headset L325', 'example@email.com', 'sar2@k.com', 'SarShop', NULL, '1234567890', 25.5941, 85.1376, 'dfsf', 25.7447, 85.0138, '', 11208.8, 1, 1, '2023-09-19', '2023-09-19 21:43:29', 'assets/headphones_2.png', '1'),
(87, 'Headphones', 'example@email.com', 'sar1@k.com', 'SarShop', NULL, '1234567890', 25.5941, 85.1376, 'dfsf', 25.7447, 85.0138, '', 9968.76, 2, 0, '2024-01-08', NULL, 'assets/headphone_9.png', '1'),
(99, 'Headphones LX32', 'example@example.com', 'sar1@k.com', 'SarShop', '9999999999', '1111111111', 98.321, 77.432, 'dfsf', 11.321, 99.325, 'address', 7999.99, 1, 0, '0000-00-00', '0000-00-00 00:00:00', 'assets/headphones1.png', 'no'),
(100, 'Headphones LX32', 'example@example.com', 'sar1@k.com', 'SarShop', '9999999999', '1111111111', 98.321, 77.432, 'dfsf', 11.321, 99.325, 'address', 7999.99, 1, 0, '0000-00-00', '0000-00-00 00:00:00', 'assets/headphones1.png', 'no'),
(101, 'Headphones LX32', 'example@example.com', 'sar1@k.com', 'SarShop', '9999999999', '1111111111', 98.321, 77.432, 'dfsf', 11.321, 99.325, 'address', 7999.99, 1, 0, '0000-00-00', '0000-00-00 00:00:00', 'assets/headphones1.png', 'no'),
(102, 'Headphones LX32', 'example@example.com', 'sar1@k.com', 'SarShop', '9999999999', '1111111111', 98.321, 77.432, 'dfsf', 11.321, 99.325, 'address', 7999.99, 1, 0, '0000-00-00', '0000-00-00 00:00:00', 'assets/headphones1.png', 'no'),
(103, 'Headphones LX32', 'example@example.com', 'sar1@k.com', 'SarShop', '9999999999', '1111111111', 98.321, 77.432, 'dfsf', 11.321, 99.325, 'address', 7999.99, 1, 0, '0000-00-00', '0000-00-00 00:00:00', 'assets/headphones1.png', 'no'),
(104, 'Headphones LX32', 'example@example.com', 'sar1@k.com', 'SarShop', '9999999999', '1111111111', 98.321, 77.432, 'dfsf', 11.321, 99.325, 'address', 7999.99, 1, 0, '0000-00-00', '0000-00-00 00:00:00', 'assets/headphones1.png', 'no'),
(105, 'Headphones LX32', 'example@example.com', 'sar1@k.com', 'SarShop', '9999999999', '1111111111', 98.321, 77.432, 'dfsf', 11.321, 99.325, 'address', 7999.99, 1, 0, '0000-00-00', '0000-00-00 00:00:00', 'assets/headphones1.png', 'no'),
(106, 'Headphones LX32', 'example@example.com', 'sar1@k.com', 'SarShop', '9999999999', '1111111111', 98.321, 77.432, 'dfsf', 11.321, 99.325, 'address', 7999.99, 1, 0, '0000-00-00', '0000-00-00 00:00:00', 'assets/headphones1.png', 'no'),
(107, 'Headphones LX32', 'example@example.com', 'sar1@k.com', 'SarShop', '9999999999', '1111111111', 98.321, 77.432, 'dfsf', 11.321, 99.325, 'address', 7999.99, 1, 0, '0000-00-00', '0000-00-00 00:00:00', 'assets/headphones1.png', 'no'),
(108, 'Headphones LX32', 'example@example.com', 'sar1@k.com', 'SarShop', '9999999999', '1111111111', 98.321, 77.432, 'dfsf', 11.321, 99.325, 'address', 7999.99, 1, 0, '0000-00-00', '0000-00-00 00:00:00', 'assets/headphones1.png', 'no'),
(109, 'Headphones LX32', 'example@example.com', 'sar1@k.com', 'SarShop', '9999999999', '1111111111', 98.321, 77.432, 'dfsf', 11.321, 99.325, 'address', 7999.99, 1, 0, '0000-00-00', '0000-00-00 00:00:00', 'assets/headphones1.png', 'no'),
(110, 'Headphones LX32', 'example@example.com', 'sar1@k.com', 'SarShop', '9999999999', '1111111111', 98.321, 77.432, 'dfsf', 11.321, 99.325, 'address', 7999.99, 1, 0, '0000-00-00', '0000-00-00 00:00:00', 'assets/headphones1.png', 'no'),
(111, 'Headphones LX32', 'example@example.com', 'sar1@k.com', 'SarShop', '9999999999', '1111111111', 98.321, 77.432, 'dfsf', 11.321, 99.325, 'address', 7999.99, 1, 0, '0000-00-00', '0000-00-00 00:00:00', 'assets/headphones1.png', 'no'),
(112, 'Headphones LX33', 'example@example.com', 'sar1@k.com', 'SarShop', '9999999999', '1111111111', 98.321, 77.432, 'dfsf', 11.321, 99.325, 'address', 7999.99, 1, 0, '0000-00-00', '0000-00-00 00:00:00', 'assets/headphones1.png', 'no'),
(113, 'Headphones LX33', 'example@example.com', 'sar1@k.com', 'SarShop', '9999999999', '1111111111', 98.321, 77.432, 'dfsf', 11.321, 99.325, 'address', 7999.99, 1, 0, '0000-00-00', '0000-00-00 00:00:00', 'assets/headphones1.png', 'no'),
(114, 'Skullcandy headset L325', 'example@email.com', '2', 'SarShop', '9999999999', '1111111111', 98.321, 77.432, 'dfsf', 11.321, 99.325, 'address', 8999, 1, 0, '0000-00-00', '0000-00-00 00:00:00', 'assets/headphones1.png', 'no'),
(115, 'Skullcandy headset L325', 'example@email.com', '2', 'SarShop', '9999999999', '1111111111', 98.321, 77.432, 'dfsf', 11.321, 99.325, 'address', 8999, 1, 0, '2024-12-30', '0000-00-00 00:00:00', 'assets/headphones1.png', 'no'),
(116, 'Skullcandy headset X24', 'example@email.com', '2', 'SarShop', '9999999999', '1111111111', 98.321, 77.432, 'dfsf', 11.321, 99.325, 'address', 4567, 1, 0, '2024-12-30', '0000-00-00 00:00:00', 'assets/headphones1.png', 'Choos'),
(117, 'Skullcandy headset X24', 'example@email.com', '2', 'SarShop', '9999999999', '1111111111', 98.321, 77.432, 'dfsf', 11.321, 99.325, 'address', 4567, 1, 0, '2024-12-30', '0000-00-00 00:00:00', 'assets/headphones1.png', 'Offli'),
(118, 'Skullcandy headset X24', 'example@email.com', '2', 'SarShop', '9999999999', '1111111111', 98.321, 77.432, 'dfsf', 11.321, 99.325, 'address', 4567, 1, 0, '2024-12-30', '0000-00-00 00:00:00', 'assets/headphones_3.png', '1'),
(119, 'Headphones', 'example@email.com', '2', 'SarShop', '9999999999', '1111111111', 98.321, 77.432, 'dfsf', 11.321, 99.325, 'address', 7999, 1, 0, '2024-12-30', '2025-01-09 12:04:46', 'assets/headphone_9.png', '1'),
(120, 'Headphones', 'example@email.com', 'sar1@k.com', 'SarShop', '9999999999', '1234567890', 2.33, 2.36, 'dfsf', 11.321, 99.325, '123,Main St\n12345', 23.6, 1, 0, '2024-12-30', '2025-01-09 14:11:50', 'assets/headphone_9.png', '1'),
(121, 'Headphones', 'example@email.com', 'sar1@k.com', 'SarShop', '9999999999', '1234567890', 25.5941, 2.36, 'dfsf', 11.321, 99.325, '123,Main St\n12345', 23.6, 1, 0, '2024-12-30', '2025-01-09 14:12:58', 'assets/headphone_9.png', '1'),
(122, 'Headphones', 'example@email.com', 'sar1@k.com', 'SarShop', '9999999999', '1234567890', 25.5941, 85.1376, 'dfsf', 11.321, 99.325, '123,Main St\n12345', 7999, 1, 0, '2024-12-30', '2025-01-09 14:13:51', 'assets/headphone_9.png', '1'),
(123, 'Headphones', 'example@email.com', 'sar1@k.com', 'SarShop', '9999999999', '1234567890', 25.5941, 85.1376, 'dfsf', 11.321, 99.325, '123,Main St\n12345', 7999, 1, 0, '2024-12-30', '2025-01-09 14:18:10', 'assets/headphone_9.png', '1'),
(124, 'Hairclip', 'example@email.com', 'sar1@k.com', 'SarShop', '9999999999', '1234567890', 25.5941, 85.1376, 'dfsf', 11.321, 99.325, '123,Main St\n12345', 219, 1, 0, '2024-12-30', '2025-01-09 14:18:50', 'assets/hairclip.jpg', '1');

-- --------------------------------------------------------

--
-- Table structure for table `payment_history`
--

CREATE TABLE `payment_history` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `seller` varchar(255) NOT NULL,
  `shop_name` varchar(255) NOT NULL,
  `order_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment_history`
--

INSERT INTO `payment_history` (`id`, `user_id`, `product_name`, `seller`, `shop_name`, `order_date`) VALUES
(1, 1, 'Headphones', 'sar1@k.com', 'SarShop', '0000-00-00'),
(2, 1, 'Headphones', 'sar1@k.com', 'SarShop', '0000-00-00'),
(3, 1, 'Headphones', 'sar1@k.com', 'SarShop', '0000-00-00'),
(4, 1, 'Headphones', 'sar1@k.com', 'SarShop', '0000-00-00'),
(5, 1, 'Skullcandy headset L325', 'sar1@k.com', 'SarShop', '0000-00-00'),
(6, 1, 'Skullcandy headset L325', 'sar1@k.com', 'SarShop', '2024-12-30'),
(7, 1, 'Skullcandy headset X24', 'sar1@k.com', 'SarShop', '2024-12-30'),
(8, 1, 'Skullcandy headset X24', 'sar1@k.com', 'SarShop', '2024-12-30'),
(9, 1, 'Skullcandy headset X24', 'sar1@k.com', 'SarShop', '2024-12-30'),
(10, 1, 'Headphones', 'sar1@k.com', 'SarShop', '2024-12-30'),
(11, 1, 'Headphones', 'sar1@k.com', 'SarShop', '2024-12-30'),
(12, 1, 'Headphones', 'sar1@k.com', 'SarShop', '2024-12-30'),
(13, 1, 'Headphones', 'sar1@k.com', 'SarShop', '2024-12-30'),
(14, 1, 'Headphones', 'sar1@k.com', 'SarShop', '2024-12-30'),
(15, 1, 'Hairclip', 'sar1@k.com', 'SarShop', '2024-12-30');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `pid` int(11) NOT NULL,
  `imgurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `price` float NOT NULL,
  `category_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `gst` float NOT NULL DEFAULT 18,
  `brand` varchar(255) DEFAULT NULL,
  `color_options` varchar(255) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `delivery_paid_by` enum('User','Seller') DEFAULT NULL,
  `available_stock` int(11) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `make` varchar(255) DEFAULT NULL,
  `origin` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`pid`, `imgurl`, `name`, `description`, `price`, `category_id`, `seller_id`, `gst`, `brand`, `color_options`, `weight`, `delivery_paid_by`, `available_stock`, `size`, `make`, `origin`) VALUES
(10, 'assets/bag_1.png', 'Bag', 'Beautiful bag', 49, 5, 2, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''),
(11, 'assets/cap_9.png', 'cwoqqq', 'juvgwg', 700, 2, 2, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''),
(12, 'assets/jeans_1.png', 'Jeans', 'Jeans for you', 1505, 2, 2, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''),
(13, 'assets/womanshoe_3.png', 'Woman Shoes', 'Shoes with special discount', 2399, 4, 2, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''),
(14, 'assets/bag_10.png', 'Bag Express', 'Bag for your shops', 2999, 5, 2, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''),
(15, 'assets/jeans_3.png', 'Jeans', 'Beautiful Jeans', 7300, 2, 2, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''),
(16, 'assets/ring_1.png', 'Silver Ring', 'Description', 3999, 2, 2, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''),
(17, 'assets/shoeman_7.png', 'Shoes', 'Description', 5999, 4, 2, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''),
(18, 'assets/headphone_9.png', 'Headphones', 'Description', 7999, 1, 2, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''),
(19, 'assets/headphones_2.png', 'Skullcandy headset L325', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ut labore et dolore magna aliqua. Nec nam aliquam sem et tortor consequat id porta nibh. Orci porta non pulvinar neque laoreet suspendisse. Id nibh tortor id aliquet. Dui sapie', 8999, 1, 2, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''),
(20, 'assets/headphones_3.png', 'Skullcandy headset X24', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ut labore et dolore magna aliqua. Nec nam aliquam sem et tortor consequat id porta nibh. Orci porta non pulvinar neque laoreet suspendisse. Id nibh tortor id aliquet. Dui sapie', 4567, 1, 2, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''),
(21, 'assets/headphones.png', 'Blackzy PRO hedphones M003', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ut labore et dolore magna aliqua. Nec nam aliquam sem et tortor consequat id porta nibh. Orci porta non pulvinar neque laoreet suspendisse. Id nibh tortor id aliquet. Dui sapie', 11999, 1, 2, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''),
(32, 'assets/hairclip.jpg', 'Hairclip', 'aaaa', 219, 1, 2, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''),
(33, 'https://www.boat-lifestyle.com/cdn/shop/products/main_blue_a80b6882-1247-439d-a17b-1c87ed4fa7c8_600x.png?v=1641206192', 'Airdopes 162', 'Wireless Earbuds with Massive Playback of upto 40 Hours, IPX5 Water & Sweat Resistance, IWP Technology, Type C Interface', 999, 1, 2, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''),
(34, 'assets/watch_1.png', 'Watch', 'Watching Time', 1500, 3, 2, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''),
(35, 'assets/tshirt_2.png', 'Tshirt', 'Tshirt for children above 22', 2500, 2, 2, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `promo_codes`
--

CREATE TABLE `promo_codes` (
  `code` varchar(255) NOT NULL,
  `discount` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `promo_codes`
--

INSERT INTO `promo_codes` (`code`, `discount`) VALUES
('SART10', 10),
('SART20', 20);

-- --------------------------------------------------------

--
-- Table structure for table `ratings_and_reviews`
--

CREATE TABLE `ratings_and_reviews` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `rating` float DEFAULT NULL CHECK (`rating` >= 1.0 and `rating` <= 5.0),
  `review` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `likes` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ratings_and_reviews`
--

INSERT INTO `ratings_and_reviews` (`id`, `product_id`, `user_email`, `rating`, `review`, `created_at`, `updated_at`, `likes`) VALUES
(16, 18, 'example@email.com', 5, 'bghghgfvvxg', '2024-12-30 12:30:12', '2024-12-30 12:30:12', 0),
(17, 18, 'example@email.com', 4, 'svdnfw', '2024-12-30 12:31:25', '2024-12-30 12:31:25', 0),
(18, 18, 'example@email.com', 4, 'svdnfw', '2024-12-30 12:31:26', '2024-12-30 12:31:26', 0),
(19, 18, 'example@email.com', 4, 'svdnfw', '2024-12-30 12:31:28', '2024-12-30 12:31:28', 0),
(20, 18, 'example@email.com', 4, 'svdnfw', '2024-12-30 12:32:23', '2024-12-30 12:32:23', 0);

-- --------------------------------------------------------

--
-- Table structure for table `repair_booking`
--

CREATE TABLE `repair_booking` (
  `id` int(11) NOT NULL,
  `user` varchar(255) NOT NULL,
  `seller` varchar(255) NOT NULL,
  `service` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `issue` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `time` varchar(255) NOT NULL,
  `mechanic_phone` varchar(12) NOT NULL,
  `serviceman_email` varchar(255) NOT NULL,
  `repair_time` datetime DEFAULT NULL,
  `serviceman_status` int(11) DEFAULT 0,
  `feedback` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `repair_booking`
--

INSERT INTO `repair_booking` (`id`, `user`, `seller`, `service`, `address`, `issue`, `date`, `time`, `mechanic_phone`, `serviceman_email`, `repair_time`, `serviceman_status`, `feedback`) VALUES
(9, 'example@email.com', 'sar1@k.com', 'Computer Repair', 'absg', 'Issue 2', '15-08-2022', '10 PM - 12 PM', '1234567890', 'plumber1@gmail.com', NULL, 0, 'Great service!'),
(10, 'example@email.com', 'sar1@k.com', 'Computer Repair', 'A1 ABCD ', 'Computer is not working properly', '18-09-2023', '2 PM - 4 PM', '1234567890', 'plumber2@gmail.com', NULL, 0, 'Quick and efficient.'),
(11, 'example@email.com', 'sar1@k.com', 'Driver', 'test', 'Need a driver', '19-09-2023', '2 PM - 4 PM', '12345677890', 'plumber4@gmail.com', NULL, 0, 'Satisfied with the repair.'),
(12, 'example@email.com', 'sar1@k.com', 'Computer Repair', 'abcd', 'computer issue', '20-09-2023', '2 PM - 4 PM', '0000000000', 'driver1@gmail.com', '2024-08-26 13:10:20', 1, 'Could be better.'),
(13, 'example@email.com', 'sar1@k.com', 'Computer Repair', 'abcd', 'computer issue', '20-09-2023', '2 PM - 4 PM', '1111111111', 'driver1@gmail.com', NULL, 0, 'Excellent job!'),
(14, 'example@email.com', 'sar1@k.com', 'Carpentre', '2500 Open Range Dr', 'I need furniture', '15-10-2023', '4 PM - 6 PM', '2143290703', 'driver1@gmail.com', NULL, 0, 'Not bad.'),
(15, 'example@email.com', 'sar1@k.com', 'Plumber', '1913 Crimson Rosella Trl', 'Plumber Issue 01', '10-16-2023', '12 PM - 2 PM', '0987654321', 'carpentre3@gmail.com', '2023-10-16 00:19:28', 1, 'Service was okay.'),
(16, 'example@email.com', 'sar1@k.com', 'Plumber', 'Hickory Heights Drive', 'Plumber Issue 2', '15-10-2023', '4 PM - 6 PM', '0987654321', 'carpentre3@gmail.com', NULL, 0, 'Very happy with the service.');

-- --------------------------------------------------------

--
-- Table structure for table `repair_request`
--

CREATE TABLE `repair_request` (
  `rid` int(11) NOT NULL,
  `user` varchar(255) NOT NULL,
  `seller` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `locality` varchar(255) NOT NULL,
  `landmark` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `issue` varchar(255) NOT NULL,
  `service` varchar(255) NOT NULL,
  `timeslot` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `repair_request`
--

INSERT INTO `repair_request` (`rid`, `user`, `seller`, `address`, `state`, `city`, `locality`, `landmark`, `phone`, `issue`, `service`, `timeslot`, `date`, `status`) VALUES
(6, 'example@email.com', 'sar@k.com', 'hhggg', 'Uttar Pradesh', 'Prayagraj', 'Daragunj', 'Sai Nath Fab', '1234567890', 'PC not working ', 'Computer Repair', '4 PM - 6 PM', '12-08-2022', 'rejected'),
(9, 'example@email.com', 'sar@k.com', 'sss', 'Uttar Pradesh ', 'Agra', 'Indira nagar ', 'sai temple ', '1234567890', 'AC not working ', 'AC Mechanic', '2 PM - 4 PM', '13-08-2022', 'accepted'),
(11, 'example@email.com', 'sar1@k.com', 'gshsb', 'UP', 'Agra', 'Dara', 'Sai Temple', '1234567890', 'issue 3', 'AC Mechanic', '6 PM - 8 PM', '12-08-2022', 'accepted'),
(12, 'example@email.com', 'sar1@k.com', 'abscs', 'UP', 'Agra', 'Dara', 'Sai Temple', '2345678901', 'issue 4', 'Computer Repair', '10 PM - 12 PM', '13-08-2022', 'rejected'),
(13, 'example@email.com', 'sar1@k.com', 'absv', 'UP', 'Agra', 'Dara', 'Sai Temple', '2345678901', 'issue 2', 'Computer Repair', '10 PM - 12 PM', 'none', 'rejected'),
(14, 'example@email.com', 'sar1@k.com', 'absg', 'UP', 'Agra', 'Dara', 'Sau Temple', '2345678901', 'Issue 2', 'Computer Repair', '10 PM - 12 PM', '15-08-2022', 'accepted'),
(15, 'example@email.com', 'sar1@k.com', 'A1 ABCD ', 'Karnataka', 'Banglore', 'vfdsv', 'vc', '656576786', 'Computer is not working properly', 'Computer Repair', '2 PM - 4 PM', '18-09-2023', 'accepted'),
(16, 'example@email.com', 'sar1@k.com', 'test', 'Karnataka', 'Banglore', 'ABCD', 'ABCD', '78978875764', 'Need a driver', 'Driver', '2 PM - 4 PM', '19-09-2023', 'accepted'),
(17, 'example@email.com', 'sar1@k.com', 'abcd', 'abcd', 'abcd', 'abcd', 'abcd', '9876543210', 'computer issue', 'Computer Repair', '2 PM - 4 PM', '20-09-2023', 'accepted'),
(18, 'example@email.com', 'sar1@k.com', 'abcd', 'abcd', 'abcd', 'abcd', 'abcd', '9876543210', 'computer issue', 'Computer Repair', '2 PM - 4 PM', '20-09-2023', 'accepted'),
(19, 'example@email.com', 'sar1@k.com', '2500 Open Range Dr', 'Texas', 'Fort Worth', 'Furniture', 'Carpenture', '2316458970', 'I need furniture', 'Carpentre', '4 PM - 6 PM', '15-10-2023', 'accepted'),
(20, 'example@email.com', 'sar1@k.com', '1913 Crimson Rosella Trl', 'Texas', 'Austin', 'plumber fan', 'awesome', '2143290703', 'Plumber Issue 01', 'Plumber', '6 PM - 8 PM', '10-15-2023', 'accepted'),
(21, 'example@email.com', 'sar1@k.com', 'Everete Alley', 'Florida', 'Miami', 'Victory', 'Good', '3265421965', 'Plumber Issue 2', 'Plumber', '4 PM - 6 PM', '15-10-2023', 'rejected'),
(22, 'example@email.com', 'sar1@k.com', 'Hickory Heights Drive', 'Massachusetts', 'GreenField', 'Winner', 'Brilliant', '3265194870', 'Plumber Issue 2', 'Plumber', '4 PM - 6 PM', '15-10-2023', 'accepted'),
(23, 'example@email.com', 'sar1@k.com', 'wadha', 'wardha', 'wardha', 'wardh', 'warda', '123456789', 'i1', 'Plumber', '12 PM - 2 PM', '12-01-2024', 'pending'),
(24, 'example@email.com', 'sar1@k.com', 'dfnvgldgnvd', 'Kerela', 'Kochi', 'Ernakulum', 'LuLu Mall', '1234567890', 'laptop', 'Plumber', '2 PM - 4 PM', '', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `saved_address`
--

CREATE TABLE `saved_address` (
  `id` int(11) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `flat_number` varchar(255) NOT NULL,
  `street` varchar(255) NOT NULL,
  `postal_code` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `saved_address`
--

INSERT INTO `saved_address` (`id`, `user_id`, `email`, `flat_number`, `street`, `postal_code`) VALUES
(1, 1, 'example@email.com', 'dre', '145632', '85A'),
(2, 3, 'sarth@k.com', '85A', 'dre', '145632'),
(3, 1, 'example@email.com', ' cd', 'fde', 'ddg'),
(4, 1, 'example@email.com', ' cd', 'fde', 'ddg'),
(5, 1, 'example@email.com', 'dhh', 'gfd', 'gffh'),
(6, 1, 'example@email.com', 'dhh', 'gfd', 'gffh'),
(7, 1, 'example@email.com', 'ffgg', 'gfgh', 'gs'),
(8, 1, 'example@email.com', 'ffgg', 'gfgh', 'gs'),
(9, 1, 'example@email.com', 'ffgg', 'gfgh', 'gs'),
(10, 1, 'example@email.com', '13ff', 'cbbf1345', '1rvccb'),
(11, 1, 'example@email.com', '13ff', 'cbbf1345', '1rvccb'),
(12, 1, 'example@email.com', '13ff', 'cbbf1345', '1rvccb'),
(13, 1, 'example@email.com', '13ff', 'cbbf1345', '1rvccb'),
(14, 1, 'example@email.com', '13ff', 'cbbf1345', '1rvccb'),
(15, 1, 'example@email.com', '13ff', 'cbbf1345', '1rvccb'),
(16, 1, 'example@email.com', '13ff', 'cbbf1345', '1rvccb');

-- --------------------------------------------------------

--
-- Table structure for table `seller_orders`
--

CREATE TABLE `seller_orders` (
  `seller_id` int(11) NOT NULL,
  `total_orders` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `seller_orders`
--

INSERT INTO `seller_orders` (`seller_id`, `total_orders`) VALUES
(2, 208);

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `service` varchar(255) NOT NULL,
  `seller_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `service`, `seller_id`) VALUES
(1, 'Plumber', 2),
(2, 'Carpentre', 2),
(3, 'AC Mechanic', 2),
(4, 'Computer Repair', 2),
(5, 'Electrician', 2),
(6, 'Driver', 2);

-- --------------------------------------------------------

--
-- Table structure for table `terms_policies`
--

CREATE TABLE `terms_policies` (
  `id` int(11) NOT NULL,
  `terms_of_use` text DEFAULT NULL,
  `privacy_policy` text DEFAULT NULL,
  `license` text DEFAULT NULL,
  `seller_policy` text DEFAULT NULL,
  `return_policy` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `terms_policies`
--

INSERT INTO `terms_policies` (`id`, `terms_of_use`, `privacy_policy`, `license`, `seller_policy`, `return_policy`) VALUES
(1, 'Terms of use:\r\nIf you offer a service, explain your business model or how your products are made. If you have a unique way of doing things, show it. This builds credibility with shoppers and helps you stand out against competitors no\n.', 'Privacy Policy:\r\nThe face of your business\r\nFeature photos of the founders or key people on your team. Customers like to see who they are buying from or working with. This can also include behind-the-scenes shots of your work space, studio, or retail store.', 'License:\r\n\r\nPersuasive content\r\nConsider what step you’d like readers to take next. Use additional content and calls to action (CTAs) to move them forward towards that goal. This could include buttons, testimonials, an explainer video, data visualizations, links to blog posts, products, your social media accounts or newsletter.', 'seller_policy\r\n\r\nYour About Us page is going to be about you, but that doesn’t mean you can’t borrow some ideas from others, especially when it comes to structure and design.', 'return Policy\r\n\r\nCustomers like to see who they are buying from or working with. This can also include behind-the-scenes shots of your work space, studio, or retail store. it is active ');

-- --------------------------------------------------------

--
-- Table structure for table `user_contacts`
--

CREATE TABLE `user_contacts` (
  `id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` longtext NOT NULL,
  `phone` longtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `user_contacts`
--

INSERT INTO `user_contacts` (`id`, `email`, `name`, `phone`) VALUES
(25, 'qwecc', '[\"Juillet\",\"IJ\",\"Mummy Goodness\",\"Mum Goodness2\",\"Joshua CHE\",\"Praise 2\",\"Mr Nkwocha\",\"Mrs Lab\",\"MY GLO\",\"Udoka CHE\",\"Rev. Nnadi\",\"Erasmus 2\",\"Engr. Jude NBC\",\"Tobechukwu NBC FUTO\",\"Assumpta\",\"Awah SU\",\"Acc\",\"Aunty Chioma\",\"AYA Acct.\",\"Bro Eric\",\"Bro George Ada\",\"Bro Chidiebere GC.\",\"Bro Izunna\",\"Bro Adah GC.\",\"Benjamin 3L CHE\",\"Brother\",\"Brother Henry\",\"Brother Osy\",\"Bro Stanley 2\",\"Bro Ojistic\",\"Bro Nnamdi\",\"Bro Obum\",\"Bro Obum 2\",\"Chidera NBC IT\",\"Charles Nwoko\",\"Chibyke Choir\",\"Chibueze MBI\",\"Chidera NBC HR\",\"Chidinma Enyi\",\"Chibuike2 NBC FUTO\",\"Charles GC.\",\"CHETA VP CHE\",\"Chigozirim SCH\",\"Chinwendu 2\",\"Chinedu Kelech\",\"CHIEMENA SCH\",\"Chinwendu Sis.\",\"Chinaza Splash\",\"Chijioke Frenc\",\"Chikadibia SU\",\"CINDY\",\"CHRISTIAN CHE\",\"Cj Okereke\",\"Christian 2\",\"Chisom CHE\",\"CHRISTIAN CHE2\",\"Collage MBI\",\"Cynthia\",\"David Cfi\",\"David Diamond\",\"Daddy2\",\"Confidence GC.\",\"David Keys CFI\",\"Ebube CHE 1\",\"Dominion Rev.\",\"Dickson EV.\",\"DIAMOND CENTRE\",\"Debashish\",\"Diamond Okey\",\"Ebuka Ebuk CHE\",\"Ekene 2\",\"EKENE2\",\"Ejiaku SCH\",\"Engr Isah NBC\",\"Ekene Azubine\",\"Edward2 CHE\",\"Egeronu Promis\",\"Ekene bro\",\"Ernest GAS Mbi\",\"ERIC SCH.\",\"Engr. Tunde NBC UT M\",\"ERIC 2 DRUMS\",\"Eric drums\",\"Ewezuga SU\",\"Esther GC.\",\"Gideon\",\"GCICC AC No\",\"Francis Orji\",\"Ezinne Sister\",\"Geoffrey SCH\",\"Francis Edeh\",\"GC. UBA\",\"Harmony Keys\",\"Godwin 2 NBC\",\"Godson EV.\",\"GTB BANK\",\"Great\",\"GPRS Settings\",\"Godwin Stephen NBC\",\"Hear&p1347ce80\",\"Ij2 GC.\",\"Ij GC.\",\"Ifeanyi Forex\",\"Imo Kelechi\",\"Ifeanyi Izuegb\",\"John Kennedy\",\"Joy Choir\",\"Jnr\",\"Julliet2 GC.\",\"John Onyeañu\",\"Justice2 GC.\",\"Kachi Keys\",\"ken&Grace\",\"Kaka SCH\",\"Kennedy Mpc\",\"K.C Imo\",\"Kelechi GC.\",\"Kelechi Imo\",\"Kaka\",\"Michael Mbah\",\"Mich Chukw CHE\",\"Mbah Joshua\",\"Marvellous CHE\",\"Mary\",\"Mr Baruch FUTO\",\"MY 9MOBILE\",\"Musa jacob2\",\"Musa jacobswel\",\"MUMMY GOODNESS\",\"Mr Ugah\",\"My Airtel\",\"MY AIRTEL\",\"MY MTN 4\",\"Ngozie PET\",\"Nelson Keys\",\"My Number\",\"Ndieze Kelechi\",\"Ngozi PET\",\"Neighbour isi nwa\",\"Ogbo Geoffery NBC\",\"Odinaka\",\"Onyekachi SCH\",\"Odinaka OBJ.\",\"Perfect\",\"Oga Ogbonna\",\"Obasi Nnamdi 2\",\"Oliva buiding\",\"Pastor SCH\",\"Oga Ibe NBC\",\"Ogssian Futo\",\"PrinceDrumGuy\",\"Prof. Prince\",\"Pukcard\",\"RHEMA CSC\",\"Praise Obilor\",\"Ransom CHE PRE\",\"RoseMary CHE\",\"SIR ACM\",\"Samuel CHE 2\",\"Samson CHE\",\"RoseMary2 CHE\",\"Soronadi O CHE\",\"Samuel CHE\",\"ThankGod Sch\",\"Uchenna Uzoma2\",\"Thank God Boy\",\"Vianey CHE\",\"Vivan EV.\",\"Victor CHE\",\"Wisdom Evang.\",\"Uwakwe\",\"Uncle Ephriam\",\"Union Account\",\"Mrs. Ahizi\",\"Diamond/Access Bank Account\",\"Ivana Lukec\",\"chymaibeh26@gmail.com\",\"amadikenneth8@gmail.com\",\"St. Darlington\",\"Mr Andrew\",\"Mrs okeke\",\"Mr Zino\",\"De law\",\"Anyalewechi Precious\",\"080-394-85623\",\"Pastor ohi\",\"+2347020693662\",\"Rev agunanne\",\"080-305-01953\",\"080-695-22268\",\"Dr. ehirim\",\"070-643-85621\",\"081-002-30318\",\"070-672-82192\",\"Pastor leo\",\"Rev awugor\",\"070-604-89931\",\"080-668-05245\",\"rev Nbalusi\",\"091-342-47504\",\"080-374-06637\",\"080-321-52544\",\"091-547-46331\",\"Dr. nwake\",\"De. par\",\"Minianano Animation\",\"Facebook Business\",\"Williams Chisom Nwaneri\",\"Prof. (Mrs) Oyoh\",\"***CHE\",\"08094610694 AMARA SKILLUPIMO\",\"1 or 2 or a\",\"__DUMMY CONTACT from runtime permissions sample\",\"A CHE 1L\",\"A\",\"a i Ezinna, eze\",\"A CHE 100 L\",\"abachi Iheanyi\",\"Abais\",\"Abalaka Faith\",\"Abdul Computer\",\"Abdul Computer 2\",\"Abdulrasheed CHE 1L\",\"ABE PRE\",\"Abugwu Pascal\",\"AC NO\",\"Access Daddy\",\"ACCESS BNK CCU\",\"Access Bank WhatsApp\",\"Access Diamond Chimuanya\",\"Acct. Number\",\"Acidity PET PRE\",\"Adaeze\",\"Adaeze CHE 100 L\",\"Adedayo Adegeye\",\"Mr. Adedayo NBC\",\"adinma Keleb\",\"Adizue Favour CHE 2L\",\"Admin\",\"Advictor CHE 1 L\",\"Agozie Unizik\",\"Ahaji Victor\",\"Ahamefula Ikechukwu CHE 1L\",\"Airtel 1GB\",\"Airtel Night\",\"Ajamopor cece\",\"aki Onye\",\"Akuma Amarachi CHE 2L\",\"Akuma Amarachi Grace CHE 2L\",\"akunw Ukarugo\",\"Alex Nuesa\",\"Alex Aptech\",\"Alfred CHE 1L\",\"Ali CHE 2L\",\"Alimaco man. oh\",\"alimiel Brawn\",\"alinor Ephriam\",\"Aliobaji Victor CHE 2L\",\"Alloy CHE 5L\",\"amad Chinwendu\",\"Amadi Chinwebube CHE\",\"Amadi Chima SCH.\",\"Amadi Favour\",\"Mrs. Amadi CHE\",\"amadi Keside\",\"amadi Izunna\",\"amadi Obum\",\"Amaka Maureen CHE\",\"Amaka CHE\",\"Amanze Emmanuel CHE 2L\",\"Amaobi anyanw\",\"Amara Ave\",\"Amara Chimezie Ann, Skillupimo\",\"Amara Nwaimo, 2\",\"Amara Phebe Austin\",\"Amarachi CHE\",\"Amarachi\",\"Amarachi Nwaimo, Skillupimo\",\"Amarachi 2\",\"ami gold bag\",\"Anaele duru\",\"Anayo Ebuka\",\"Anayo Ebuka CHE\",\"Anderson Choco PRE Imo Poly\",\"Andrew Andex AI Python\",\"Anita GC.\",\"Anointed Minstrel Admob\",\"Anosike Victor CHE\",\"anozie Orji\",\"Anthony luman\",\"Anyalewechi Precious PET\",\"anyanw Sabinos\",\"Apc\",\"Apostle Chibunna GC.\",\"Ariba John CHE\",\"Arinze CHE 1L\",\"Arinze ABE 2L\",\"Arinze tec hub\",\"Arinze CHE 1 L\",\"Asindu\"]', '[\"0813 133 8618\",\"0708 987 7097\",\"0703 116 6152\",\"0813 700 0184\",\"0703 031 0903\",\"08068180589\",\"0806 348 5118\",\"0803 361 2151\",\"08159916152\",\"0902 016 2082\",\"08037936024\",\"09017889007\",\"0905 929 2272\",\"0903 598 6160\",\"09079339930\",\"08164002645\",\"*556#\",\"08037651587\",\"7780311455\",\"07031154187\",\"08026127225\",\"08039527977\",\"08036397865\",\"08034503923\",\"09037013612\",\"08030902825\",\"08068594634\",\"08065165036\",\"08136524594\",\"08147583089\",\"08138564909\",\"07035467645\",\"07037453473\",\"08134965960\",\"08173932096\",\"07031121495\",\"09091209078\",\"09036651393\",\"07068367804\",\"07062733169\",\"+2348136041024\",\"08159343522\",\"09036513663\",\"0902 155 2187\",\"08157433550\",\"09094982886\",\"08163890494\",\"08143147472\",\"08081228551\",\"09056399148\",\"07017064759\",\"0813 335 3533\",\"07030280227\",\"09077674477\",\"08067647454\",\"09073787535\",\"07018749708\",\"08168416096\",\"09056924003\",\"0073615009\",\"0813 572 7782\",\"08135202627\",\"08176119747\",\"08144291209\",\"07065342996\",\"09026385484\",\"234127120057\",\"+8801763923789\",\"08035206265\",\"09027895910\",\"08181989337\",\"08171685961\",\"08100243684\",\"07033496513\",\"09031688584\",\"07051202917\",\"08140015183\",\"08154495693\",\"08036693697\",\"08138901852\",\"08151393564\",\"07085163226\",\"08147367226\",\"07035047479\",\"0810 262 8139\",\"08064196620\",\"1343032184\",\"08144257248\",\"+375259391542\",\"08106450564\",\"08060835035\",\"2125693541\",\"09060552439\",\"09156097816\",\"08105628856\",\"*2018*737#\",\"08173389485\",\"3888\",\"09012648251\",NULL,\"08133071596\",\"07089877097\",\"0903 794 3711\",\"0817 350 3215\",\"09060765755\",\"08104342112\",\"08081415562\",\"08028194336\",\"08085857709\",\"08166492081\",\"08107596321\",\"07067590220\",\"0825\",\"09092500931\",\"08118518179\",\"08173503215\",\"08034500654\",\"09073696529\",\"08138481941\",\"08102097187\",\"07065159117\",\"07036653073\",\"0903 313 8988\",\"08140672296\",\"08036211349\",\"08181333228\",\"07067160678\",\"07085791442\",\"08074429792\",\"08033387360\",\"09029335725\",\"09078261743\",\"09030890256\",\"+2349066484299\",\"09072155501\",\"080-386-80961\",\"08137211367\",\"09066484299\",\"08165001673\",\"08147373689\",\"08103216606\",\"08106459361\",\"08144213861\",\"08183043034\",\"07034439412\",\"07054404225\",\"08099092297\",\"07033160313\",\"08030963865\",\"07011207925\",\"07026714226\",\"08165331007\",\"71702642\",\"09033337012\",\"08098170437\",\"08148138357\",\"08085327901\",\"07038718682\",\"09057755896\",\"08035683653\",\"08143458232\",\"08108001800\",\"+234 703 207 0356\",\"08166025333\",\"07086332876\",\"08030969325\",\"09027149011\",\"08146442702\",\"08122762079\",\"08129719318\",\"08069657284\",\"08163381132\",\"0129185076\",\"0813 302 4688\",\"0090897321\",NULL,NULL,NULL,\"+234 806 449 2807\",\"0708 411 4691\",\"0803 711 7728\",\"07035766532\",\"0706 642 1835\",\"+2348131832829\",\"080-394-85623\",\"080-352-65068\",\"+2347020693662\",\"080-358-26378\",\"080-305-01953\",\"080-695-22268\",\"080-370-77898\",\"070-643-85621\",\"081-002-30318\",\"070-672-82192\",\"080-339-82207\",\"080-221-95745\",\"070-604-89931\",\"080-668-05245\",\"080-659-61935\",\"091-342-47504\",\"080-374-06637\",\"080-321-52544\",\"091-547-46331\",\"070-376-21510\",\"081-833-65220\",\"+2348171660091\",\"+447710173736\",\"+2348113158511\",\"08030996031\",\"0817 728 3174\",\"+2348094610694\",\"+91 99039 86853\",NULL,\"0814 441 7165\",\"3080637689\",\"070-655-03446\",\"0701 175 0788\",\"080-639-58833\",\"08133988070\",\"0806 857 3081\",\"0816 092 1372\",\"09036417646\",\"0814 495 5709\",\"08169566146\",\"08063138562\",\"0088150669\",\"0020101704\",\"08036241662\",\"09090901901\",\"0106248334\",\"00 90 897 321\",\"0816 723 0728\",\"08148418129\",\"0903 329 7841\",NULL,\"0905 166 8263\",\"080-682-71358\",\"0816 026 5365\",\"0810 4870 0636\",\"0811 170 8057\",\"0816 533 3211\",\"07066465512\",\"0903 882 0942\",\"*141*2424#\",\"*412#\",\"080-624-76209\",\"080-372-13385\",\"07054743563\",\"09086949678\",\"080-643-19790\",\"07061570458\",\"+234 812 719 8051\",\"0902 493 8896\",\"08136550903\",\"080-377-47324\",\"080-375-88099\",\"080-641-75710\",\"0815 906 6147\",\"0816 039 0323\",\"070-392-27627\",\"0805 855 5996\",\"09068316825\",\"08134769165\",\"0706 501 6576\",\"081-047-90825\",\"080-363-97865\",\"070-206-93662\",\"08167169109\",\"09093625806\",\"0805 412 1613\",\"080-309-32040\",\"0703 772 6436\",\"+234 703 327 8077\",\"+234 901 243 7782\",\"+234 806 939 7553\",\"08101632618\",\"09095624184\",\"+234 806 668 3011\",\"0809 112 2240\",\"+234 803 549 3868\",\"080-330-37005\",\"0815 122 4871\",\"08151224871\",\"0706 460 1611\",\"0706 943 5290\",\"+234 811 493 2723\",\"0701 976 3544\",\"0818 634 3219\",\"070-366-35448\",\"080-752-73692\",\"08028948638\",\"080-922-35836\",\"08064318979\",\"08145810467\",\"0809 204 0930\",\"0817 394 3135\",\"0816 803 2152\",\"07062573851\",\"08101847419\",\"+2348133862128\"]'),
(26, 'asd', '[\"Juillet\",\"IJ\",\"Mummy Goodness\"]', '[\"0813 133 8618\",\"0708 987 7097\",\"0703 116 6152\"]'),
(27, 'abc', '[\"Juillet\",\"IJ\",\"Mummy Goodness\",\"Mum Goodness2\",\"Joshua CHE\",\"Praise 2\",\"Mr Nkwocha\",\"Mrs Lab\",\"MY GLO\",\"Udoka CHE\",\"Rev. Nnadi\",\"Erasmus 2\",\"Engr. Jude NBC\",\"Tobechukwu NBC FUTO\",\"Assumpta\",\"Awah SU\",\"Acc\",\"Aunty Chioma\",\"AYA Acct.\",\"Bro Eric\",\"Bro George Ada\",\"Bro Chidiebere GC.\",\"Bro Izunna\",\"Bro Adah GC.\",\"Benjamin 3L CHE\",\"Brother\",\"Brother Henry\",\"Brother Osy\",\"Bro Stanley 2\",\"Bro Ojistic\",\"Bro Nnamdi\",\"Bro Obum\",\"Bro Obum 2\",\"Chidera NBC IT\",\"Charles Nwoko\",\"Chibyke Choir\",\"Chibueze MBI\",\"Chidera NBC HR\",\"Chidinma Enyi\",\"Chibuike2 NBC FUTO\",\"Charles GC.\",\"CHETA VP CHE\",\"Chigozirim SCH\",\"Chinwendu 2\",\"Chinedu Kelech\",\"CHIEMENA SCH\",\"Chinwendu Sis.\",\"Chinaza Splash\",\"Chijioke Frenc\",\"Chikadibia SU\",\"CINDY\",\"CHRISTIAN CHE\",\"Cj Okereke\",\"Christian 2\",\"Chisom CHE\",\"CHRISTIAN CHE2\",\"Collage MBI\",\"Cynthia\",\"David Cfi\",\"David Diamond\",\"Daddy2\",\"Confidence GC.\",\"David Keys CFI\",\"Ebube CHE 1\",\"Dominion Rev.\",\"Dickson EV.\",\"DIAMOND CENTRE\",\"Debashish\",\"Diamond Okey\",\"Ebuka Ebuk CHE\",\"Ekene 2\",\"EKENE2\",\"Ejiaku SCH\",\"Engr Isah NBC\",\"Ekene Azubine\",\"Edward2 CHE\",\"Egeronu Promis\",\"Ekene bro\",\"Ernest GAS Mbi\",\"ERIC SCH.\",\"Engr. Tunde NBC UT M\",\"ERIC 2 DRUMS\",\"Eric drums\",\"Ewezuga SU\",\"Esther GC.\",\"Gideon\",\"GCICC AC No\",\"Francis Orji\",\"Ezinne Sister\",\"Geoffrey SCH\",\"Francis Edeh\",\"GC. UBA\",\"Harmony Keys\",\"Godwin 2 NBC\",\"Godson EV.\",\"GTB BANK\",\"Great\",\"GPRS Settings\",\"Godwin Stephen NBC\",\"Hear&p1347ce80\"]', '[\"0813 133 8618\",\"0708 987 7097\",\"0703 116 6152\",\"0813 700 0184\",\"0703 031 0903\",\"08068180589\",\"0806 348 5118\",\"0803 361 2151\",\"08159916152\",\"0902 016 2082\",\"08037936024\",\"09017889007\",\"0905 929 2272\",\"0903 598 6160\",\"09079339930\",\"08164002645\",\"*556#\",\"08037651587\",\"7780311455\",\"07031154187\",\"08026127225\",\"08039527977\",\"08036397865\",\"08034503923\",\"09037013612\",\"08030902825\",\"08068594634\",\"08065165036\",\"08136524594\",\"08147583089\",\"08138564909\",\"07035467645\",\"07037453473\",\"08134965960\",\"08173932096\",\"07031121495\",\"09091209078\",\"09036651393\",\"07068367804\",\"07062733169\",\"+2348136041024\",\"08159343522\",\"09036513663\",\"0902 155 2187\",\"08157433550\",\"09094982886\",\"08163890494\",\"08143147472\",\"08081228551\",\"09056399148\",\"07017064759\",\"0813 335 3533\",\"07030280227\",\"09077674477\",\"08067647454\",\"09073787535\",\"07018749708\",\"08168416096\",\"09056924003\",\"0073615009\",\"0813 572 7782\",\"08135202627\",\"08176119747\",\"08144291209\",\"07065342996\",\"09026385484\",\"234127120057\",\"+8801763923789\",\"08035206265\",\"09027895910\",\"08181989337\",\"08171685961\",\"08100243684\",\"07033496513\",\"09031688584\",\"07051202917\",\"08140015183\",\"08154495693\",\"08036693697\",\"08138901852\",\"08151393564\",\"07085163226\",\"08147367226\",\"07035047479\",\"0810 262 8139\",\"08064196620\",\"1343032184\",\"08144257248\",\"+375259391542\",\"08106450564\",\"08060835035\",\"2125693541\",\"09060552439\",\"09156097816\",\"08105628856\",\"*2018*737#\",\"08173389485\",\"3888\",\"09012648251\",NULL]');

-- --------------------------------------------------------

--
-- Table structure for table `user_history`
--

CREATE TABLE `user_history` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `product_price` int(11) NOT NULL,
  `pd_image_url` varchar(100) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `categoryId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_history`
--

INSERT INTO `user_history` (`id`, `user_id`, `product_id`, `product_name`, `product_price`, `pd_image_url`, `seller_id`, `user_email`, `categoryId`) VALUES
(1, 5, 18, 'Headphones', 7999, 'assets/headphone_9.png', 2, 'example@email.com', NULL),
(2, 5, 18, 'Headphones', 7999, 'assets/headphone_9.png', 2, 'example@email.com', NULL),
(3, 5, 18, 'Headphones', 7999, 'assets/headphone_9.png', 2, 'example@email.com', NULL),
(4, 5, 19, 'Skullcandy headset L325', 8999, 'assets/headphones_2.png', 2, 'example@email.com', NULL),
(5, 5, 20, 'Skullcandy headset X24', 4567, 'assets/headphones_3.png', 2, 'example@email.com', NULL),
(6, 5, 18, 'Headphones', 7999, 'assets/headphone_9.png', 2, 'example@email.com', NULL),
(7, 5, 18, 'Headphones', 7999, 'assets/headphone_9.png', 2, 'example@email.com', NULL),
(8, 5, 18, 'Headphones', 7999, 'assets/headphone_9.png', 2, 'example@email.com', NULL),
(9, 5, 18, 'Headphones', 7999, 'assets/headphone_9.png', 2, 'example@email.com', NULL),
(10, 5, 18, 'Headphones', 7999, 'assets/headphone_9.png', 2, 'example@email.com', NULL),
(11, 5, 18, 'Headphones', 7999, 'assets/headphone_9.png', 2, 'example@email.com', NULL),
(12, 5, 18, 'Headphones', 7999, 'assets/headphone_9.png', 2, 'example@email.com', NULL),
(13, 5, 18, 'Headphones', 7999, 'assets/headphone_9.png', 2, 'example@email.com', NULL),
(14, 5, 18, 'Headphones', 7999, 'assets/headphone_9.png', 2, 'example@email.com', NULL),
(15, 5, 19, 'Skullcandy headset L325', 8999, 'assets/headphones_2.png', 2, 'example@email.com', NULL),
(16, 5, 18, 'Headphones', 7999, 'assets/headphone_9.png', 2, 'example@email.com', NULL),
(17, 5, 32, 'Hairclip', 219, 'assets/hairclip.jpg', 2, 'example@email.com', NULL),
(18, 5, 18, 'Headphones', 7999, 'assets/headphone_9.png', 2, 'example@email.com', NULL),
(19, 5, 18, 'Headphones', 7999, 'assets/headphone_9.png', 2, 'example@email.com', NULL),
(20, 5, 18, 'Headphones', 7999, 'assets/headphone_9.png', 2, 'example@email.com', NULL),
(21, 5, 18, 'Headphones', 7999, 'assets/headphone_9.png', 2, 'example@email.com', NULL),
(22, 5, 18, 'Headphones', 7999, 'assets/headphone_9.png', 2, 'example@email.com', NULL),
(23, 5, 18, 'Headphones', 7999, 'assets/headphone_9.png', 2, 'example@email.com', NULL),
(24, 5, 18, 'Headphones', 7999, 'assets/headphone_9.png', 2, 'example@email.com', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_problem`
--

CREATE TABLE `user_problem` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `problem` text NOT NULL,
  `status` enum('pending','resolved') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_problem`
--

INSERT INTO `user_problem` (`id`, `user_id`, `problem`, `status`, `created_at`) VALUES
(1, 12345, 'hello', 'resolved', '2024-09-05 23:27:40'),
(2, 12345, 'estggdf', 'resolved', '2024-09-05 23:49:53'),
(3, 12345, 'ifjsigjdij', 'pending', '2024-09-06 00:25:28'),
(4, 6789, 'abcd', 'resolved', '2024-09-12 18:18:57');

-- --------------------------------------------------------

--
-- Table structure for table `user_problems`
--

CREATE TABLE `user_problems` (
  `id` int(11) NOT NULL,
  `problem_description` text NOT NULL,
  `submission_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('pending','resolved') DEFAULT 'pending',
  `admin_response` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `about_us`
--
ALTER TABLE `about_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `alldeliveries`
--
ALTER TABLE `alldeliveries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `alldrivers`
--
ALTER TABLE `alldrivers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `allsellers`
--
ALTER TABLE `allsellers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `allusers`
--
ALTER TABLE `allusers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `all_service_users`
--
ALTER TABLE `all_service_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seller_id` (`seller_id`),
  ADD KEY `service_id` (`service_id`);

--
-- Indexes for table `boosted_products`
--
ALTER TABLE `boosted_products`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `buy_now_table`
--
ALTER TABLE `buy_now_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `review_id` (`review_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `parent_comment_id` (`parent_comment_id`);

--
-- Indexes for table `delivery_services`
--
ALTER TABLE `delivery_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `driver_kyc`
--
ALTER TABLE `driver_kyc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `likedproduct`
--
ALTER TABLE `likedproduct`
  ADD PRIMARY KEY (`lid`);

--
-- Indexes for table `marketplace_products`
--
ALTER TABLE `marketplace_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoryRelation2` (`category_id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`MessageID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `driver_assigned` (`driver_id`);

--
-- Indexes for table `payment_history`
--
ALTER TABLE `payment_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`pid`),
  ADD KEY `categoryRelation` (`category_id`),
  ADD KEY `sellerRelation` (`seller_id`),
  ADD KEY `imageId` (`imgurl`);

--
-- Indexes for table `ratings_and_reviews`
--
ALTER TABLE `ratings_and_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `repair_booking`
--
ALTER TABLE `repair_booking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `repair_request`
--
ALTER TABLE `repair_request`
  ADD PRIMARY KEY (`rid`);

--
-- Indexes for table `saved_address`
--
ALTER TABLE `saved_address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sellerService` (`seller_id`);

--
-- Indexes for table `terms_policies`
--
ALTER TABLE `terms_policies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_contacts`
--
ALTER TABLE `user_contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_history`
--
ALTER TABLE `user_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_problem`
--
ALTER TABLE `user_problem`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_problems`
--
ALTER TABLE `user_problems`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `alldeliveries`
--
ALTER TABLE `alldeliveries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `alldrivers`
--
ALTER TABLE `alldrivers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `allsellers`
--
ALTER TABLE `allsellers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `allusers`
--
ALTER TABLE `allusers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `all_service_users`
--
ALTER TABLE `all_service_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `buy_now_table`
--
ALTER TABLE `buy_now_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `delivery_services`
--
ALTER TABLE `delivery_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `driver_kyc`
--
ALTER TABLE `driver_kyc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `likedproduct`
--
ALTER TABLE `likedproduct`
  MODIFY `lid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `marketplace_products`
--
ALTER TABLE `marketplace_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `MessageID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT for table `payment_history`
--
ALTER TABLE `payment_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `ratings_and_reviews`
--
ALTER TABLE `ratings_and_reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `repair_booking`
--
ALTER TABLE `repair_booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `repair_request`
--
ALTER TABLE `repair_request`
  MODIFY `rid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `saved_address`
--
ALTER TABLE `saved_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `terms_policies`
--
ALTER TABLE `terms_policies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_contacts`
--
ALTER TABLE `user_contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `user_history`
--
ALTER TABLE `user_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `user_problem`
--
ALTER TABLE `user_problem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_problems`
--
ALTER TABLE `user_problems`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `all_service_users`
--
ALTER TABLE `all_service_users`
  ADD CONSTRAINT `all_service_users_ibfk_1` FOREIGN KEY (`seller_id`) REFERENCES `allsellers` (`id`),
  ADD CONSTRAINT `all_service_users_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`);

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`review_id`) REFERENCES `ratings_and_reviews` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `allusers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_ibfk_3` FOREIGN KEY (`parent_comment_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `marketplace_products`
--
ALTER TABLE `marketplace_products`
  ADD CONSTRAINT `categoryRelation2` FOREIGN KEY (`category_id`) REFERENCES `category` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `driver_assigned` FOREIGN KEY (`driver_id`) REFERENCES `alldrivers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `categoryRelation` FOREIGN KEY (`category_id`) REFERENCES `category` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sellerRelation` FOREIGN KEY (`seller_id`) REFERENCES `allsellers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ratings_and_reviews`
--
ALTER TABLE `ratings_and_reviews`
  ADD CONSTRAINT `ratings_and_reviews_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`pid`);

--
-- Constraints for table `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `sellerService` FOREIGN KEY (`seller_id`) REFERENCES `allsellers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
