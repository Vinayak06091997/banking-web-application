-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 09, 2020 at 07:03 AM
-- Server version: 10.4.16-MariaDB
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `stack`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `Account_Number` int(11) NOT NULL,
  `Account_Holder_Name` varchar(20) DEFAULT NULL,
  `Branch_name` varchar(20) DEFAULT NULL,
  `Account_Type` varchar(20) DEFAULT NULL,
  `Branch_Code` varchar(20) DEFAULT NULL,
  `PHONE` varchar(15) NOT NULL,
  `address` varchar(20) NOT NULL,
  `DOB` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`Account_Number`, `Account_Holder_Name`, `Branch_name`, `Account_Type`, `Branch_Code`, `PHONE`, `address`, `DOB`) VALUES
(202012081, 'null', 'null', 'null', 'null', 'null', 'null', 'null'),
(202012082, 'Bob Marley', 'Edison, NJ', 'SB', 'XYZ0001', '7829949093', 'JAVALI BAZAR', '06/09/1997'),
(202012083, 'vinayak Nimbaragi', 'MLP', 'SB', 'mlp1233', '7829949093', 'JAVALI BAZAR', '06/09/1997'),
(202012084, 'null', 'null', 'null', 'null', 'null', 'null', 'null'),
(202012085, 'Bob Marley', 'Edison, NJ', 'CB', 'mlp1233', '7829949093', 'JAVALI BAZAR', '06/09/1997');

-- --------------------------------------------------------

--
-- Table structure for table `balance`
--

CREATE TABLE `balance` (
  `Account_Number` int(11) NOT NULL,
  `Amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `balance`
--

INSERT INTO `balance` (`Account_Number`, `Amount`) VALUES
(202012081, 0),
(202012082, 9900),
(202012083, 1000),
(202012084, 0),
(202012085, 0);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `user` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`user`, `password`) VALUES
('admin', 'secret');

-- --------------------------------------------------------

--
-- Table structure for table `tra`
--

CREATE TABLE `tra` (
  `Account_Number` int(11) DEFAULT NULL,
  `deposit` int(11) DEFAULT NULL,
  `withd` int(11) DEFAULT NULL,
  `R_ID` int(20) NOT NULL,
  `Rate` datetime DEFAULT current_timestamp(),
  `description` varchar(20) DEFAULT NULL,
  `Balance` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tra`
--

INSERT INTO `tra` (`Account_Number`, `deposit`, `withd`, `R_ID`, `Rate`, `description`, `Balance`) VALUES
(202012082, 10000, NULL, 39, '2020-12-09 11:07:51', 'By cash', 10000),
(202012083, 1000, NULL, 40, '2020-12-09 11:08:14', 'By cash', 1000),
(202012082, NULL, 100, 41, '2020-12-09 11:09:14', 'ATM with drawl', 9900);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`Account_Number`);

--
-- Indexes for table `balance`
--
ALTER TABLE `balance`
  ADD KEY `Account_Number` (`Account_Number`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`user`);

--
-- Indexes for table `tra`
--
ALTER TABLE `tra`
  ADD PRIMARY KEY (`R_ID`),
  ADD KEY `Account_Number` (`Account_Number`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `Account_Number` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=202012086;

--
-- AUTO_INCREMENT for table `tra`
--
ALTER TABLE `tra`
  MODIFY `R_ID` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `balance`
--
ALTER TABLE `balance`
  ADD CONSTRAINT `balance_ibfk_1` FOREIGN KEY (`Account_Number`) REFERENCES `account` (`Account_Number`);

--
-- Constraints for table `tra`
--
ALTER TABLE `tra`
  ADD CONSTRAINT `tra_ibfk_1` FOREIGN KEY (`Account_Number`) REFERENCES `account` (`Account_Number`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
