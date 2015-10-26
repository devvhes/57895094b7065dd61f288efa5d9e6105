-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 25, 2015 at 07:56 AM
-- Server version: 5.5.44-0+deb8u1
-- PHP Version: 5.6.13-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tsn_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `sys_group`
--

DROP TABLE IF EXISTS `sys_group`;
CREATE TABLE IF NOT EXISTS `sys_group` (
  `iIDGroup` int(10) unsigned NOT NULL,
  `nCode` varchar(45) DEFAULT NULL,
  `nName` varchar(255) DEFAULT NULL,
  `nNote` varchar(255) DEFAULT NULL,
  `dDateCreated` datetime DEFAULT NULL,
  `dDateModified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_group_permissions`
--

DROP TABLE IF EXISTS `sys_group_permissions`;
CREATE TABLE IF NOT EXISTS `sys_group_permissions` (
  `iIDGroup` int(10) unsigned NOT NULL,
  `iIDPermmision` int(10) unsigned NOT NULL,
  `dDateCreated` datetime DEFAULT NULL,
  `dDateModified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_login_attempt`
--

DROP TABLE IF EXISTS `sys_login_attempt`;
CREATE TABLE IF NOT EXISTS `sys_login_attempt` (
  `iIDLoginTemp` int(10) unsigned NOT NULL,
  `iIDUser` int(10) unsigned DEFAULT NULL,
  `nUserName` varchar(100) DEFAULT NULL,
  `dDateCreated` datetime DEFAULT NULL,
  `nIP` varchar(32) DEFAULT NULL,
  `nUser_Agent` varchar(255) DEFAULT NULL,
  `nNote` varchar(255) DEFAULT NULL,
  `nSuccess` tinyint(4) DEFAULT NULL,
  `nOS` varchar(45) DEFAULT NULL,
  `nBrowser` varchar(100) DEFAULT NULL,
  `nDevice` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_permissions`
--

DROP TABLE IF EXISTS `sys_permissions`;
CREATE TABLE IF NOT EXISTS `sys_permissions` (
  `iIDPermmision` int(10) unsigned NOT NULL,
  `nCode` varchar(45) DEFAULT NULL,
  `nPermission` varchar(255) DEFAULT NULL,
  `nNote` varchar(255) DEFAULT NULL,
  `dDateCreated` datetime DEFAULT NULL,
  `dDateModified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_settings`
--

DROP TABLE IF EXISTS `sys_settings`;
CREATE TABLE IF NOT EXISTS `sys_settings` (
  `iID` int(10) unsigned NOT NULL,
  `nName` varchar(128) DEFAULT NULL,
  `nInputType` enum('input','textarea','radio','dropdown','timezones') DEFAULT NULL,
  `tOptions` text,
  `bIsNumeric` tinyint(4) DEFAULT NULL,
  `bIsShowEditor` enum('0','1') DEFAULT NULL,
  `eInputSize` enum('large','medium','small') DEFAULT NULL,
  `nHelpText` varchar(255) DEFAULT NULL,
  `nValidation` varchar(128) DEFAULT NULL,
  `bSortOrder` tinyint(3) DEFAULT NULL,
  `nLabel` varchar(128) DEFAULT NULL,
  `tValue` text,
  `dLastUpdate` datetime DEFAULT NULL,
  `iUpdated_by` int(10) unsigned DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_users`
--

DROP TABLE IF EXISTS `sys_users`;
CREATE TABLE IF NOT EXISTS `sys_users` (
  `iIDUser` int(10) unsigned NOT NULL,
  `nIP` varchar(32) DEFAULT NULL,
  `nUserName` varchar(100) DEFAULT NULL,
  `nPass` varchar(255) DEFAULT NULL,
  `nSalt` varchar(255) DEFAULT NULL,
  `nEmail` varchar(255) DEFAULT NULL,
  `nActiveCode` varchar(45) DEFAULT NULL,
  `nForgotten_Pass` varchar(45) DEFAULT NULL,
  `nForgotten_Time` datetime DEFAULT NULL,
  `nRememberCode` varchar(45) DEFAULT NULL,
  `dDateCreated` datetime DEFAULT NULL,
  `dDateModified` datetime DEFAULT NULL,
  `dLastLogin` datetime DEFAULT NULL,
  `iActive` tinyint(4) DEFAULT NULL,
  `nFirtName` varchar(100) DEFAULT NULL,
  `nLastName` varchar(100) DEFAULT NULL,
  `nCompany` varchar(255) DEFAULT NULL,
  `nPhone` varchar(32) DEFAULT NULL,
  `nAddress` varchar(255) DEFAULT NULL,
  `bIsAdmin` tinyint(4) DEFAULT NULL,
  `dActiveDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_user_group`
--

DROP TABLE IF EXISTS `sys_user_group`;
CREATE TABLE IF NOT EXISTS `sys_user_group` (
  `iIDGroup` int(10) unsigned NOT NULL,
  `iIDUser` int(10) unsigned NOT NULL,
  `dDateCreated` datetime DEFAULT NULL,
  `dDateModified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tsn_bedding`
--

DROP TABLE IF EXISTS `tsn_bedding`;
CREATE TABLE IF NOT EXISTS `tsn_bedding` (
  `iIDBedding` int(10) unsigned NOT NULL,
  `nBedding` varchar(45) DEFAULT NULL,
  `iAudults` int(10) unsigned DEFAULT '0',
  `iChildren` int(10) unsigned DEFAULT '0',
  `iStatus` int(10) unsigned DEFAULT NULL COMMENT '2: da xoa'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tsn_booking_rooms`
--

DROP TABLE IF EXISTS `tsn_booking_rooms`;
CREATE TABLE IF NOT EXISTS `tsn_booking_rooms` (
  `iIDBooking` int(10) unsigned NOT NULL,
  `nBookingCode` varchar(32) DEFAULT NULL,
  `dFromDate` date DEFAULT NULL,
  `dToDate` date DEFAULT NULL,
  `iPriceBooking` int(10) unsigned DEFAULT '0',
  `nTitle` varchar(45) DEFAULT NULL,
  `nLastName` varchar(100) DEFAULT NULL,
  `nFirstName` varchar(100) DEFAULT NULL,
  `nEmail` varchar(255) DEFAULT NULL,
  `nCountry` varchar(100) DEFAULT NULL,
  `nPhone` varchar(45) DEFAULT NULL,
  `nSmokingPreference` varchar(100) DEFAULT NULL,
  `nFlightNumber` varchar(45) DEFAULT NULL,
  `nEstimateArrivalTime` varchar(255) DEFAULT NULL,
  `nOrtherRequest` varchar(500) DEFAULT NULL,
  `nPayMent` varchar(45) DEFAULT NULL,
  `nStatusPayment` varchar(45) DEFAULT NULL,
  `dDateBooking` datetime DEFAULT NULL,
  `nAddress` varchar(255) DEFAULT NULL,
  `nCompany` varchar(255) DEFAULT NULL,
  `iAirPort` int(10) unsigned DEFAULT '0' COMMENT '0: khong co\n1 don tai san bay\n2: dua khach di',
  `iIDCustomer` int(10) unsigned DEFAULT '0',
  `iIDHotel` int(10) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tsn_hotel`
--

DROP TABLE IF EXISTS `tsn_hotel`;
CREATE TABLE IF NOT EXISTS `tsn_hotel` (
  `iIDHotel` int(10) unsigned NOT NULL,
  `nHotel` varchar(100) DEFAULT NULL,
  `nDomain` varchar(100) DEFAULT NULL,
  `iIDUserCreated` int(10) unsigned DEFAULT '0',
  `nAddress` varchar(255) DEFAULT NULL,
  `nEmail` varchar(255) DEFAULT NULL,
  `nPhone1` varchar(45) DEFAULT NULL,
  `nPhone2` varchar(45) DEFAULT NULL,
  `dDateCreated` datetime DEFAULT NULL,
  `dDateModified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tsn_rooms`
--

DROP TABLE IF EXISTS `tsn_rooms`;
CREATE TABLE IF NOT EXISTS `tsn_rooms` (
  `iIDHotel` int(10) unsigned NOT NULL,
  `iIDRooms` int(10) unsigned NOT NULL,
  `iIDBedding` int(10) unsigned NOT NULL,
  `nRoom` varchar(100) DEFAULT NULL,
  `iPriceExtraBeds` int(10) unsigned DEFAULT '0',
  `iNoOfRooms` int(10) unsigned DEFAULT '0',
  `iPrice` int(10) unsigned DEFAULT '0',
  `dDateCreated` datetime DEFAULT NULL,
  `dDateModified` datetime DEFAULT NULL,
  `nNote` varchar(255) DEFAULT NULL,
  `iStatus` int(10) unsigned DEFAULT NULL COMMENT '0: Chua su dung\n1: Su dung',
  `iIDLastUser` int(10) unsigned DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tsn_rooms_allotment`
--

DROP TABLE IF EXISTS `tsn_rooms_allotment`;
CREATE TABLE IF NOT EXISTS `tsn_rooms_allotment` (
  `iIDHotel` int(10) unsigned NOT NULL,
  `iIDRooms` int(10) unsigned NOT NULL,
  `iIDBedding` int(10) unsigned NOT NULL,
  `dDate` date NOT NULL,
  `dDateCreated` datetime DEFAULT NULL,
  `dDateModified` datetime DEFAULT NULL,
  `iAvailable` int(10) unsigned DEFAULT '0',
  `iStopSell` int(10) unsigned DEFAULT '0',
  `iCutOff` int(10) unsigned DEFAULT '0',
  `iMinStay` int(10) unsigned DEFAULT '0',
  `iBreakfast` int(10) unsigned DEFAULT '0',
  `iPrice` int(10) unsigned DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tsn_rooms_booking_detail`
--

DROP TABLE IF EXISTS `tsn_rooms_booking_detail`;
CREATE TABLE IF NOT EXISTS `tsn_rooms_booking_detail` (
  `iIDHotel` int(10) unsigned NOT NULL,
  `iIDRooms` int(10) unsigned NOT NULL,
  `iIDBedding` int(10) unsigned NOT NULL,
  `iIDBooking` int(10) unsigned NOT NULL,
  `iPriceBooking` int(10) unsigned DEFAULT '0',
  `iPromotion` int(10) unsigned DEFAULT '0',
  `iNoOfRooms` int(10) unsigned DEFAULT '0',
  `dFromDate` date DEFAULT NULL,
  `dToDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sys_group`
--
ALTER TABLE `sys_group`
  ADD PRIMARY KEY (`iIDGroup`);

--
-- Indexes for table `sys_group_permissions`
--
ALTER TABLE `sys_group_permissions`
  ADD PRIMARY KEY (`iIDGroup`,`iIDPermmision`);

--
-- Indexes for table `sys_login_attempt`
--
ALTER TABLE `sys_login_attempt`
  ADD PRIMARY KEY (`iIDLoginTemp`);

--
-- Indexes for table `sys_permissions`
--
ALTER TABLE `sys_permissions`
  ADD PRIMARY KEY (`iIDPermmision`);

--
-- Indexes for table `sys_settings`
--
ALTER TABLE `sys_settings`
  ADD PRIMARY KEY (`iID`);

--
-- Indexes for table `sys_users`
--
ALTER TABLE `sys_users`
  ADD PRIMARY KEY (`iIDUser`);

--
-- Indexes for table `sys_user_group`
--
ALTER TABLE `sys_user_group`
  ADD PRIMARY KEY (`iIDGroup`,`iIDUser`);

--
-- Indexes for table `tsn_bedding`
--
ALTER TABLE `tsn_bedding`
  ADD PRIMARY KEY (`iIDBedding`);

--
-- Indexes for table `tsn_booking_rooms`
--
ALTER TABLE `tsn_booking_rooms`
  ADD PRIMARY KEY (`iIDBooking`);

--
-- Indexes for table `tsn_hotel`
--
ALTER TABLE `tsn_hotel`
  ADD PRIMARY KEY (`iIDHotel`);

--
-- Indexes for table `tsn_rooms`
--
ALTER TABLE `tsn_rooms`
  ADD PRIMARY KEY (`iIDHotel`,`iIDRooms`,`iIDBedding`);

--
-- Indexes for table `tsn_rooms_allotment`
--
ALTER TABLE `tsn_rooms_allotment`
  ADD PRIMARY KEY (`iIDHotel`,`iIDRooms`,`iIDBedding`,`dDate`);

--
-- Indexes for table `tsn_rooms_booking_detail`
--
ALTER TABLE `tsn_rooms_booking_detail`
  ADD PRIMARY KEY (`iIDHotel`,`iIDRooms`,`iIDBedding`,`iIDBooking`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sys_group`
--
ALTER TABLE `sys_group`
  MODIFY `iIDGroup` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sys_login_attempt`
--
ALTER TABLE `sys_login_attempt`
  MODIFY `iIDLoginTemp` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sys_permissions`
--
ALTER TABLE `sys_permissions`
  MODIFY `iIDPermmision` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sys_settings`
--
ALTER TABLE `sys_settings`
  MODIFY `iID` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sys_users`
--
ALTER TABLE `sys_users`
  MODIFY `iIDUser` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tsn_bedding`
--
ALTER TABLE `tsn_bedding`
  MODIFY `iIDBedding` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tsn_booking_rooms`
--
ALTER TABLE `tsn_booking_rooms`
  MODIFY `iIDBooking` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tsn_hotel`
--
ALTER TABLE `tsn_hotel`
  MODIFY `iIDHotel` int(10) unsigned NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
