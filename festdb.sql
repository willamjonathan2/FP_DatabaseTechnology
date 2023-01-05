-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 05, 2023 at 03:55 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `festdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `ac`
--

CREATE TABLE `ac` (
  `cID` int(11) NOT NULL,
  `cName` varchar(255) DEFAULT NULL,
  `cGender` varchar(255) DEFAULT NULL,
  `cAge` int(11) DEFAULT NULL,
  `cEmail` varchar(255) DEFAULT NULL,
  `cPass` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ac`
--

INSERT INTO `ac` (`cID`, `cName`, `cGender`, `cAge`, `cEmail`, `cPass`) VALUES
(0, 'William', 'Male', 20, 'will@gmail.com', '123'),
(1, 'Rian', 'Male', 20, 'rian@gmail.co', '234'),
(2, 'Alya', 'Female', 18, 'alya@gmail.com', '345'),
(3, 'Ananda', 'Female', 20, 'ananda@gmail.com', '456'),
(4, 'Agus', 'Male', 28, 'agus@gmail.com', '567'),
(5, 'alif', 'Male', 22, 'alive@gmail.com', '1234'),
(6, 'yoyo', 'Female', 19, 'yoyo@gmail.com', '567');

-- --------------------------------------------------------

--
-- Table structure for table `cmf`
--

CREATE TABLE `cmf` (
  `mID` int(11) NOT NULL,
  `mName` varchar(255) DEFAULT NULL,
  `mD` varchar(255) DEFAULT NULL,
  `lID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cmf`
--

INSERT INTO `cmf` (`mID`, `mName`, `mD`, `lID`) VALUES
(1, 'Bernyanyi Bersama', '28 December 2022', 2),
(2, 'Berdendang Bergoyang', '26 December 2022', 0),
(3, 'Pasar Musik', '11 December 2022', 1);

-- --------------------------------------------------------

--
-- Table structure for table `lt`
--

CREATE TABLE `lt` (
  `lID` int(11) NOT NULL,
  `bName` varchar(255) DEFAULT NULL,
  `loc` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lt`
--

INSERT INTO `lt` (`lID`, `bName`, `loc`) VALUES
(0, 'GBK', 'Jl. Jenderal Sudirman,'),
(1, 'Jiexpo', 'Arena JIExpo Kemayoran'),
(2, 'Lapanhgan Pusenif', 'Jalan Pajajaran 1');

-- --------------------------------------------------------

--
-- Table structure for table `td`
--

CREATE TABLE `td` (
  `dID` int(11) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `dP` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `td`
--

INSERT INTO `td` (`dID`, `status`, `dP`) VALUES
(0, 'VIP', '1-Day'),
(1, 'VIP', '3-Day'),
(2, 'Regular', '1-Day'),
(3, 'Regular', '3-Day');

-- --------------------------------------------------------

--
-- Table structure for table `tt`
--

CREATE TABLE `tt` (
  `tID` int(11) NOT NULL,
  `lID` int(11) DEFAULT NULL,
  `mID` int(11) DEFAULT NULL,
  `dID` int(11) DEFAULT NULL,
  `amt` int(11) DEFAULT NULL,
  `cID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tt`
--

INSERT INTO `tt` (`tID`, `lID`, `mID`, `dID`, `amt`, `cID`) VALUES
(1, 1, 3, 1, 2, 1),
(2, 0, 2, 2, 3, 2),
(3, 1, 3, 3, 1, 4),
(4, 1, 3, 2, 3, 3),
(5, 0, 2, 1, 2, 3),
(6, 0, 2, 1, 3, 0),
(7, 1, 3, 1, 1, 0),
(8, 0, 2, 1, 3, 6);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ac`
--
ALTER TABLE `ac`
  ADD PRIMARY KEY (`cID`);

--
-- Indexes for table `cmf`
--
ALTER TABLE `cmf`
  ADD PRIMARY KEY (`mID`),
  ADD KEY `cmf_ibfk_1` (`lID`);

--
-- Indexes for table `lt`
--
ALTER TABLE `lt`
  ADD PRIMARY KEY (`lID`);

--
-- Indexes for table `td`
--
ALTER TABLE `td`
  ADD PRIMARY KEY (`dID`);

--
-- Indexes for table `tt`
--
ALTER TABLE `tt`
  ADD PRIMARY KEY (`tID`),
  ADD KEY `cID` (`cID`),
  ADD KEY `tt_ibfk_1` (`mID`),
  ADD KEY `tt_ibfk_4` (`lID`),
  ADD KEY `tt_ibfk_2` (`dID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cmf`
--
ALTER TABLE `cmf`
  ADD CONSTRAINT `cmf_ibfk_1` FOREIGN KEY (`lID`) REFERENCES `lt` (`lID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tt`
--
ALTER TABLE `tt`
  ADD CONSTRAINT `tt_ibfk_1` FOREIGN KEY (`mID`) REFERENCES `cmf` (`mID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tt_ibfk_2` FOREIGN KEY (`dID`) REFERENCES `td` (`dID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tt_ibfk_3` FOREIGN KEY (`cID`) REFERENCES `ac` (`cID`),
  ADD CONSTRAINT `tt_ibfk_4` FOREIGN KEY (`lID`) REFERENCES `lt` (`lID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
