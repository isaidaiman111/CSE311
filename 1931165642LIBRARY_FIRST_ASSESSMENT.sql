1931165642

-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 28, 2021 at 07:50 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `LIBRARY_MID`
--

-- --------------------------------------------------------

--
-- Table structure for table `Book`
--

CREATE TABLE `Book` (
  `Book_id` int(11) NOT NULL,
  `Title` varchar(50) DEFAULT NULL,
  `Pub_Year` varchar(20) DEFAULT NULL,
  `Pub_Name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Book`
--

INSERT INTO `Book` (`Book_id`, `Title`, `Pub_Year`, `Pub_Name`) VALUES
(1, 'Database Management', 'JAN-2017', 'MCGRAW-HILL'),
(2, 'ADBMS', 'JUN-2016', 'MCGRAW-HILL'),
(3, 'CN', 'SEP-2016', 'PEARSON'),
(4, 'CG', 'SEP-2015', 'GRUPO PLANETA');

-- --------------------------------------------------------

--
-- Stand-in structure for view `books`
-- (See below for the actual view)
--
CREATE TABLE `books` (
`BOOK_ID` int(11)
,`TITLE` varchar(50)
,`NO_OF_COPIES` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `Book_Authors`
--

CREATE TABLE `Book_Authors` (
  `Author_Name` varchar(25) NOT NULL,
  `Book_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Book_Authors`
--

INSERT INTO `Book_Authors` (`Author_Name`, `Book_id`) VALUES
('NAVATHE', 1),
('NAVATHE', 2),
('TANENBAUM', 3),
('EDWARD ANGEL', 4);

-- --------------------------------------------------------

--
-- Table structure for table `Book_Copies`
--

CREATE TABLE `Book_Copies` (
  `No_of_Copies` int(11) DEFAULT NULL,
  `Book_id` int(11) NOT NULL,
  `Branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Book_Copies`
--

INSERT INTO `Book_Copies` (`No_of_Copies`, `Book_id`, `Branch_id`) VALUES
(10, 1, 10),
(5, 1, 11),
(2, 2, 12),
(5, 2, 13),
(7, 3, 14),
(3, 4, 11);

-- --------------------------------------------------------

--
-- Table structure for table `Book_Lending`
--

CREATE TABLE `Book_Lending` (
  `Due_date` date DEFAULT NULL,
  `Date_out` date DEFAULT NULL,
  `Book_id` int(11) NOT NULL,
  `Branch_id` int(11) NOT NULL,
  `Card_No` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Book_Lending`
--

INSERT INTO `Book_Lending` (`Due_date`, `Date_out`, `Book_id`, `Branch_id`, `Card_No`) VALUES
('2017-01-01', '2017-06-01', 1, 10, 101),
('2017-04-12', '2017-05-12', 1, 11, 104),
('2017-02-21', '2017-04-21', 2, 13, 101),
('2017-01-11', '2017-03-11', 3, 14, 101),
('2017-03-15', '2017-01-15', 4, 11, 101);

-- --------------------------------------------------------

--
-- Table structure for table `Card`
--

CREATE TABLE `Card` (
  `Card_No` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Card`
--

INSERT INTO `Card` (`Card_No`) VALUES
(100),
(101),
(102),
(103),
(104);

-- --------------------------------------------------------

--
-- Table structure for table `Library_Branch`
--

CREATE TABLE `Library_Branch` (
  `Branch_id` int(11) NOT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `Branch_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Library_Branch`
--

INSERT INTO `Library_Branch` (`Branch_id`, `Address`, `Branch_name`) VALUES
(10, 'RR NAGAR', 'BANGALORE'),
(11, 'RNSIT', 'BANGALORE'),
(12, 'RAJAJI NAGAR', 'BANGALORE'),
(13, 'NITTE', 'MANGALORE'),
(14, 'MANIPAL', 'UDUPI');

-- --------------------------------------------------------

--
-- Table structure for table `Publisher`
--

CREATE TABLE `Publisher` (
  `Name` varchar(25) NOT NULL,
  `Phone_no` varchar(50) DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Publisher`
--

INSERT INTO `Publisher` (`Name`, `Phone_no`, `Address`) VALUES
('GRUPO PLANETA', '7756120238', 'BANGALORE'),
('HACHETTE LIVRE', '8970862340', 'CHENAI'),
('MCGRAW-HILL', '9989076587', 'BANGALORE'),
('PEARSON', '9889076565', 'NEWDELHI'),
('RANDOM HOUSE', '7455679345', 'HYDRABAD');

-- --------------------------------------------------------

--
-- Structure for view `books`
--
DROP TABLE IF EXISTS `books`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `library_mid`.`books`  AS SELECT `a`.`Book_id` AS `BOOK_ID`, `a`.`Title` AS `TITLE`, `b`.`No_of_Copies` AS `NO_OF_COPIES` FROM ((`library_mid`.`book` `a` join `library_mid`.`book_copies` `b`) join `library_mid`.`library_branch` `c`) WHERE `a`.`Book_id` = `b`.`Book_id` AND `b`.`Branch_id` = `c`.`Branch_id` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Book`
--
ALTER TABLE `Book`
  ADD PRIMARY KEY (`Book_id`),
  ADD KEY `Pub_Name` (`Pub_Name`);

--
-- Indexes for table `Book_Authors`
--
ALTER TABLE `Book_Authors`
  ADD PRIMARY KEY (`Book_id`,`Author_Name`);

--
-- Indexes for table `Book_Copies`
--
ALTER TABLE `Book_Copies`
  ADD PRIMARY KEY (`Book_id`,`Branch_id`),
  ADD KEY `Branch_id` (`Branch_id`);

--
-- Indexes for table `Book_Lending`
--
ALTER TABLE `Book_Lending`
  ADD PRIMARY KEY (`Book_id`,`Branch_id`,`Card_No`),
  ADD KEY `Branch_id` (`Branch_id`),
  ADD KEY `Card_No` (`Card_No`);

--
-- Indexes for table `Card`
--
ALTER TABLE `Card`
  ADD PRIMARY KEY (`Card_No`);

--
-- Indexes for table `Library_Branch`
--
ALTER TABLE `Library_Branch`
  ADD PRIMARY KEY (`Branch_id`);

--
-- Indexes for table `Publisher`
--
ALTER TABLE `Publisher`
  ADD PRIMARY KEY (`Name`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Book`
--
ALTER TABLE `Book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`Pub_Name`) REFERENCES `Publisher` (`Name`) ON DELETE CASCADE;

--
-- Constraints for table `Book_Authors`
--
ALTER TABLE `Book_Authors`
  ADD CONSTRAINT `book_authors_ibfk_1` FOREIGN KEY (`Book_id`) REFERENCES `Book` (`Book_id`) ON DELETE CASCADE;

--
-- Constraints for table `Book_Copies`
--
ALTER TABLE `Book_Copies`
  ADD CONSTRAINT `book_copies_ibfk_1` FOREIGN KEY (`Book_id`) REFERENCES `Book` (`Book_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `book_copies_ibfk_2` FOREIGN KEY (`Branch_id`) REFERENCES `Library_Branch` (`Branch_id`) ON DELETE CASCADE;

--
-- Constraints for table `Book_Lending`
--
ALTER TABLE `Book_Lending`
  ADD CONSTRAINT `book_lending_ibfk_1` FOREIGN KEY (`Book_id`) REFERENCES `Book` (`Book_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `book_lending_ibfk_2` FOREIGN KEY (`Branch_id`) REFERENCES `Library_Branch` (`Branch_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `book_lending_ibfk_3` FOREIGN KEY (`Card_No`) REFERENCES `Card` (`Card_No`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
