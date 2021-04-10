-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 10, 2021 at 04:23 PM
-- Server version: 8.0.23-0ubuntu0.20.04.1
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
-- Database: `company`
--

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `dname` varchar(100) DEFAULT NULL,
  `dnumber` int NOT NULL,
  `mgr_ssn` bigint NOT NULL,
  `mgr_start_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`dname`, `dnumber`, `mgr_ssn`, `mgr_start_date`) VALUES
('Headquarters', 1, 888665555, '1981-06-19'),
('Administration', 4, 987654321, '1995-01-01'),
('Research', 5, 333445555, '1988-05-22');

-- --------------------------------------------------------

--
-- Table structure for table `dependent`
--

CREATE TABLE `dependent` (
  `essn` bigint DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `bdate` date DEFAULT NULL,
  `relationship` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `dependent`
--

INSERT INTO `dependent` (`essn`, `name`, `bdate`, `relationship`) VALUES
(333445555, 'Alice', '1986-04-05', 'Daughter'),
(333445555, 'Theodore', '1983-10-25', 'Son'),
(333445555, 'Joy', '1958-05-03', 'Spouse'),
(987654321, 'Abner', '1942-02-28', 'Spouse'),
(123456789, 'Michael', '1988-01-04', 'Son'),
(123456789, 'Alice', '1988-12-30', 'Daughter'),
(123456789, 'Elizabeth', '1967-05-05', 'Spouse');

-- --------------------------------------------------------

--
-- Table structure for table `dept_locations`
--

CREATE TABLE `dept_locations` (
  `dnum` int NOT NULL,
  `dlocation` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `dept_locations`
--

INSERT INTO `dept_locations` (`dnum`, `dlocation`) VALUES
(1, 'Houston'),
(4, 'Stafford'),
(5, 'Bellaire'),
(5, 'Sugarland'),
(5, 'Houston');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `ssn` bigint NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `fname` varchar(100) NOT NULL,
  `minit` varchar(100) DEFAULT '',
  `lname` varchar(100) NOT NULL,
  `bdate` date DEFAULT NULL,
  `address` text,
  `salary` float DEFAULT NULL,
  `super_ssn` bigint DEFAULT NULL,
  `dno` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`ssn`, `name`, `fname`, `minit`, `lname`, `bdate`, `address`, `salary`, `super_ssn`, `dno`) VALUES
(123456789, 'John B Smith', 'John', 'B', 'Smith', '1965-01-09', '731 Fondren, Houston, TX', 30000, 333445555, 5),
(333445555, 'Franklin T Wong', 'Franklin', 'T', 'Wong', '1955-12-08', '638 Voss, Houston, TX', 40000, 888665555, 5),
(453453453, 'Joyce A English', 'Joyce', 'A', 'English', '1972-07-31', '5631 Rice, Houston, TX', 25000, 333445555, 5),
(666884444, 'Ramesh K Narayan', 'Ramesh', 'K', 'Narayan', '1962-09-15', '975 Fire Oak, Humble, TX', 38000, 333445555, 5),
(888665555, 'James E Borg', 'James', 'E', 'Borg', '1937-11-10', '450 Stone, Houston, TX', 55000, 7786101712, 1),
(987654321, 'Jennifer S Wallace', 'Jennifer', 'S', 'Wallace', '1941-06-20', '291 Berry, Bellaire, TX', 43000, 888665555, 4),
(987987987, 'Ahmad V Jabbar', 'Ahmad', 'V', 'Jabbar', '1969-03-29', '980 Dallas, Houston, TX', 25000, 987654321, 4),
(999887777, 'Alicia J Zelaya', 'Alicia', 'J', 'Zelaya', '1968-01-19', '3321 Castle, Spring, TX', 25000, 987654321, 4),
(7786101712, 'Shmasul  Arefin', 'Shmasul', '', 'Arefin', '1993-12-01', 'Building No- B-69/F-9, Motijheel Govt. Colony, Post Office: G.P.O, Post Code: 1000, Thana: Motijheel, District: Dhaka', NULL, 7786101712, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `pnumber` int NOT NULL,
  `pname` varchar(100) NOT NULL,
  `plocation` text NOT NULL,
  `dnum` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`pnumber`, `pname`, `plocation`, `dnum`) VALUES
(1, 'ProductX', 'Bellaire', 5),
(2, 'ProductY', 'Sugarland', 5),
(3, 'ProductZ', 'Houston', 5),
(10, 'Computerization', 'Stafford', 4),
(20, 'Reorganization', 'Houston', 1),
(30, 'Newbenefits', 'Stafford', 4);

-- --------------------------------------------------------

--
-- Table structure for table `works_on`
--

CREATE TABLE `works_on` (
  `essn` bigint DEFAULT NULL,
  `pno` int DEFAULT NULL,
  `hours` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `works_on`
--

INSERT INTO `works_on` (`essn`, `pno`, `hours`) VALUES
(123456789, 1, 32.5),
(123456789, 2, 7.5),
(666884444, 3, 40),
(453453453, 1, 20),
(453453453, 2, 20),
(333445555, 2, 10),
(333445555, 3, 10),
(333445555, 10, 10),
(333445555, 20, 10),
(999887777, 30, 30),
(999887777, 10, 10),
(987987987, 10, 35),
(987987987, 30, 5),
(987654321, 30, 20),
(987654321, 20, 15),
(888665555, 20, 7);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`dnumber`),
  ADD UNIQUE KEY `mgr_ssn` (`mgr_ssn`);

--
-- Indexes for table `dependent`
--
ALTER TABLE `dependent`
  ADD KEY `essn` (`essn`);

--
-- Indexes for table `dept_locations`
--
ALTER TABLE `dept_locations`
  ADD KEY `dnum` (`dnum`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`ssn`),
  ADD KEY `super_ssn` (`super_ssn`),
  ADD KEY `dno` (`dno`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`pnumber`),
  ADD KEY `dnum` (`dnum`);

--
-- Indexes for table `works_on`
--
ALTER TABLE `works_on`
  ADD KEY `pno` (`pno`),
  ADD KEY `essn` (`essn`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `department_ibfk_1` FOREIGN KEY (`mgr_ssn`) REFERENCES `employee` (`ssn`);

--
-- Constraints for table `dependent`
--
ALTER TABLE `dependent`
  ADD CONSTRAINT `dependent_ibfk_1` FOREIGN KEY (`essn`) REFERENCES `employee` (`ssn`);

--
-- Constraints for table `dept_locations`
--
ALTER TABLE `dept_locations`
  ADD CONSTRAINT `dept_locations_ibfk_1` FOREIGN KEY (`dnum`) REFERENCES `department` (`dnumber`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`super_ssn`) REFERENCES `employee` (`ssn`),
  ADD CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`dno`) REFERENCES `department` (`dnumber`);

--
-- Constraints for table `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `project_ibfk_1` FOREIGN KEY (`dnum`) REFERENCES `department` (`dnumber`);

--
-- Constraints for table `works_on`
--
ALTER TABLE `works_on`
  ADD CONSTRAINT `works_on_ibfk_1` FOREIGN KEY (`pno`) REFERENCES `project` (`pnumber`),
  ADD CONSTRAINT `works_on_ibfk_2` FOREIGN KEY (`essn`) REFERENCES `employee` (`ssn`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
