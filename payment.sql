-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 06, 2020 at 10:44 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `paf`
--

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment` (
  `P_PaymentID` int(11) NOT NULL,
  `P_Amount` decimal(5,2) NOT NULL,
  `P_NameOnCard` varchar(30) NOT NULL,
  `P_CVC` varchar(4) NOT NULL,
  `P_ExpiringDate` date NOT NULL,
  `P_CardNumber` varchar(16) NOT NULL,
  `P_AppointmentID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`P_PaymentID`, `P_Amount`, `P_NameOnCard`, `P_CVC`, `P_ExpiringDate`, `P_CardNumber`, `P_AppointmentID`) VALUES
(56, '900.00', 'Melani', '333', '2020-02-09', '42224333', 7),
(58, '600.00', 'Shan', '333', '2020-02-09', '42558833', 2),
(60, '400.00', 'Janitha', '222', '2020-03-10', '12547859', 4),
(63, '300.00', 'mahela', '555', '2020-07-06', '125478963', 6);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`P_PaymentID`),
  ADD KEY `fk_appointmentid` (`P_AppointmentID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `P_PaymentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
