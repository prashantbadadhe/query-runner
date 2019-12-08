-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 08, 2019 at 10:18 PM
-- Server version: 5.6.43-84.3-log
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `askarvhe_hotel_reservation`
--

-- --------------------------------------------------------

--
-- Table structure for table `breakfast`
--

CREATE TABLE `breakfast` (
  `b_type` varchar(255) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `b_price` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `breakfast_review`
--

CREATE TABLE `breakfast_review` (
  `r_id` int(11) NOT NULL,
  `rating` double NOT NULL,
  `rdate` datetime DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `b_type` varchar(255) DEFAULT NULL,
  `hotel_id` int(11) DEFAULT NULL,
  `c_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `credit_card`
--

CREATE TABLE `credit_card` (
  `c_number` varchar(255) NOT NULL,
  `baddress` varchar(255) DEFAULT NULL,
  `c_type` varchar(255) DEFAULT NULL,
  `code` int(11) NOT NULL,
  `exp_date` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `c_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `c_id` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `discount_room`
--

CREATE TABLE `discount_room` (
  `hotel_id` int(11) NOT NULL,
  `room_no` int(11) NOT NULL,
  `discount` double NOT NULL,
  `end_date` varchar(255) DEFAULT NULL,
  `start_date` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hotel`
--

CREATE TABLE `hotel` (
  `hotel_id` int(11) NOT NULL,
  `country` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hotel_service`
--

CREATE TABLE `hotel_service` (
  `hotel_id` int(11) NOT NULL,
  `s_type` varchar(255) NOT NULL,
  `s_price` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hotel_service_review`
--

CREATE TABLE `hotel_service_review` (
  `r_id` int(11) NOT NULL,
  `rating` double NOT NULL,
  `rdate` datetime DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `c_id` int(11) DEFAULT NULL,
  `hotel_id` int(11) DEFAULT NULL,
  `s_type` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `my_query`
--

CREATE TABLE `my_query` (
  `query_id` int(11) NOT NULL,
  `query_key` varchar(255) DEFAULT NULL,
  `query_name` varchar(255) DEFAULT NULL,
  `query_value` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `phone`
--

CREATE TABLE `phone` (
  `hotel_id` int(11) NOT NULL,
  `phone` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `invoice_no` varchar(255) NOT NULL,
  `amount` double NOT NULL,
  `r_date` date DEFAULT NULL,
  `c_number` varchar(255) DEFAULT NULL,
  `c_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `hotel_id` int(11) NOT NULL,
  `room_no` int(11) NOT NULL,
  `capacity` int(11) NOT NULL,
  `floor` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `room_description` varchar(255) DEFAULT NULL,
  `rtype` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `room_reservation`
--

CREATE TABLE `room_reservation` (
  `check_in_date` datetime NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `room_no` int(11) NOT NULL,
  `check_out_date` datetime DEFAULT NULL,
  `invoice_no` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `room_review`
--

CREATE TABLE `room_review` (
  `rid` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `rdate` datetime DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `hotel_id` int(11) DEFAULT NULL,
  `room_no` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rresv_breakfast`
--

CREATE TABLE `rresv_breakfast` (
  `b_type` varchar(255) NOT NULL,
  `check_in_date` datetime NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `room_no` int(11) NOT NULL,
  `no_of_orders` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rresv_service`
--

CREATE TABLE `rresv_service` (
  `check_in_date` datetime NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `room_no` int(11) NOT NULL,
  `hotel_services_hotel_id` int(11) NOT NULL,
  `hotel_services_s_type` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `skill`
--

CREATE TABLE `skill` (
  `skill_id` int(11) NOT NULL,
  `skill_name` varchar(255) DEFAULT NULL,
  `user_user_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_skills`
--

CREATE TABLE `user_skills` (
  `user_user_id` int(11) NOT NULL,
  `skills_skill_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `breakfast`
--
ALTER TABLE `breakfast`
  ADD PRIMARY KEY (`b_type`,`hotel_id`),
  ADD KEY `FK8bbk7d40wv98ulgpoi9n955kk` (`hotel_id`);

--
-- Indexes for table `breakfast_review`
--
ALTER TABLE `breakfast_review`
  ADD PRIMARY KEY (`r_id`),
  ADD KEY `FKh93qk0p8iquwbner3vauld5k4` (`b_type`,`hotel_id`),
  ADD KEY `FKt4ql8pjd2d0jec5jtra57xv3o` (`c_id`);

--
-- Indexes for table `credit_card`
--
ALTER TABLE `credit_card`
  ADD PRIMARY KEY (`c_number`),
  ADD KEY `FKdd2r8q4i6lqdevncdp68clkn5` (`c_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`c_id`);

--
-- Indexes for table `discount_room`
--
ALTER TABLE `discount_room`
  ADD PRIMARY KEY (`hotel_id`,`room_no`);

--
-- Indexes for table `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`hotel_id`);

--
-- Indexes for table `hotel_service`
--
ALTER TABLE `hotel_service`
  ADD PRIMARY KEY (`hotel_id`,`s_type`);

--
-- Indexes for table `hotel_service_review`
--
ALTER TABLE `hotel_service_review`
  ADD PRIMARY KEY (`r_id`),
  ADD KEY `FKixxc9u979rq61onvw31ewbtcf` (`c_id`),
  ADD KEY `FKdmfd0n6f6nkwt98uunkgba1p2` (`hotel_id`,`s_type`);

--
-- Indexes for table `my_query`
--
ALTER TABLE `my_query`
  ADD PRIMARY KEY (`query_id`);

--
-- Indexes for table `phone`
--
ALTER TABLE `phone`
  ADD PRIMARY KEY (`hotel_id`,`phone`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`invoice_no`),
  ADD KEY `FK7sr0sofmrbk38yrub9gk8qp38` (`c_number`),
  ADD KEY `FK90nypn7nr9cy7x6eh5cc0sl2s` (`c_id`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`hotel_id`,`room_no`);

--
-- Indexes for table `room_reservation`
--
ALTER TABLE `room_reservation`
  ADD PRIMARY KEY (`check_in_date`,`hotel_id`,`room_no`),
  ADD KEY `FK8uo97qdm6e1vajvkskjoqiyf3` (`invoice_no`),
  ADD KEY `FKlgmbckmbvgkq1exe331klpvax` (`hotel_id`,`room_no`);

--
-- Indexes for table `room_review`
--
ALTER TABLE `room_review`
  ADD PRIMARY KEY (`rid`),
  ADD KEY `FK8oh43tqsufnruqjgtkqnbtfgk` (`cid`),
  ADD KEY `FKm0bi2sayindur93g52407rbpg` (`hotel_id`,`room_no`);

--
-- Indexes for table `rresv_breakfast`
--
ALTER TABLE `rresv_breakfast`
  ADD PRIMARY KEY (`b_type`,`check_in_date`,`hotel_id`,`room_no`),
  ADD KEY `FK8sxkengcp8me4hn89a3e47t3l` (`b_type`,`hotel_id`),
  ADD KEY `FKre4ixwvboujvq92rcqnrpn2uc` (`check_in_date`,`hotel_id`,`room_no`);

--
-- Indexes for table `rresv_service`
--
ALTER TABLE `rresv_service`
  ADD KEY `FKbvqor1lmaw3r4otw1jdhp2qmi` (`hotel_services_hotel_id`,`hotel_services_s_type`),
  ADD KEY `FKo9380k6wi6c7w5ffm8oqdputt` (`check_in_date`,`hotel_id`,`room_no`);

--
-- Indexes for table `skill`
--
ALTER TABLE `skill`
  ADD PRIMARY KEY (`skill_id`),
  ADD KEY `FKoltqjw3ksh6imscn8fj0005ic` (`user_user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_skills`
--
ALTER TABLE `user_skills`
  ADD UNIQUE KEY `UK_hsptsjmnulm9vbtwuy8gcnavl` (`skills_skill_id`),
  ADD KEY `FKiaw3w6ysslb7vfe7trlo8o6s2` (`user_user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `my_query`
--
ALTER TABLE `my_query`
  MODIFY `query_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `skill`
--
ALTER TABLE `skill`
  MODIFY `skill_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
