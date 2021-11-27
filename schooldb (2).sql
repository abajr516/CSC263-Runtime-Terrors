-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 27, 2021 at 11:49 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `schooldb`
--
DROP DATABASE IF EXISTS `schooldb`;
CREATE DATABASE IF NOT EXISTS `schooldb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `schooldb`;

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
CREATE TABLE `courses` (
  `courseID` int(11) NOT NULL,
  `coursename` varchar(45) NOT NULL,
  `credits` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` VALUES(101521, 'Psychology', '3');
INSERT INTO `courses` VALUES(141330, 'Calculus', '4');
INSERT INTO `courses` VALUES(145443, 'Database', '3');
INSERT INTO `courses` VALUES(270441, 'Programming', '4');

-- --------------------------------------------------------

--
-- Table structure for table `grades`
--

DROP TABLE IF EXISTS `grades`;
CREATE TABLE `grades` (
  `courseID` int(11) NOT NULL,
  `studentID` int(11) NOT NULL,
  `term` varchar(45) NOT NULL,
  `grade` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `grades`
--

INSERT INTO `grades` VALUES(141330, 1002, 'FALL16', 'A');
INSERT INTO `grades` VALUES(101521, 1001, 'FALL17', 'B-');
INSERT INTO `grades` VALUES(270441, 1003, 'FALL18', 'C-');
INSERT INTO `grades` VALUES(145443, 1003, 'FALL19', 'A+');
INSERT INTO `grades` VALUES(145443, 1001, 'FALL20', 'A');
INSERT INTO `grades` VALUES(145443, 1002, 'FALL21', 'B');
INSERT INTO `grades` VALUES(141330, 1003, 'SPR16', 'B+');
INSERT INTO `grades` VALUES(101521, 1002, 'SPR17', 'A-');
INSERT INTO `grades` VALUES(270441, 1004, 'SPR18', 'B+');
INSERT INTO `grades` VALUES(270441, 1002, 'SPR19', 'D');
INSERT INTO `grades` VALUES(145443, 1004, 'SPR20', 'C');
INSERT INTO `grades` VALUES(270441, 1001, 'SPR21', 'A');
INSERT INTO `grades` VALUES(141330, 1004, 'SUM18', 'A+');
INSERT INTO `grades` VALUES(141330, 1001, 'SUM19', 'D');
INSERT INTO `grades` VALUES(101521, 1004, 'SUM20', 'C+');
INSERT INTO `grades` VALUES(101521, 1003, 'SUM21', 'A+');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
CREATE TABLE `students` (
  `studentID` int(11) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `firstname` varchar(45) NOT NULL,
  `dob` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `students`
--

INSERT INTO `students` VALUES(1001, 'Susan', 'Cooper', '1998-08-12');
INSERT INTO `students` VALUES(1002, 'David', 'Greene', '1995-06-15');
INSERT INTO `students` VALUES(1003, 'Jane', 'Doe', '1985-12-15');
INSERT INTO `students` VALUES(1004, 'John', 'Smith', '1975-01-01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`courseID`);

--
-- Indexes for table `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`term`),
  ADD KEY `GRADES_COURSE_FK` (`courseID`),
  ADD KEY `GRADES_STUDENT_FK` (`studentID`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`studentID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `grades`
--
ALTER TABLE `grades`
  ADD CONSTRAINT `GRADES_COURSE_FK` FOREIGN KEY (`courseID`) REFERENCES `courses` (`courseID`),
  ADD CONSTRAINT `GRADES_STUDENT_FK` FOREIGN KEY (`studentID`) REFERENCES `students` (`studentID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
