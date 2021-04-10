-- MySQL dump 10.13  Distrib 8.0.23, for Linux (x86_64)
--
-- Host: localhost    Database: company
-- ------------------------------------------------------
-- Server version	8.0.23-0ubuntu0.20.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `dname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `dnumber` int NOT NULL,
  `mgr_ssn` bigint NOT NULL,
  `mgr_start_date` date NOT NULL,
  PRIMARY KEY (`dnumber`),
  UNIQUE KEY `Dnumber` (`dnumber`),
  KEY `mgr_ssn` (`mgr_ssn`),
  CONSTRAINT `department_ibfk_1` FOREIGN KEY (`mgr_ssn`) REFERENCES `employee` (`ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES ('Headquarters',1,888665555,'1981-06-19'),('Administration',4,987654321,'1995-01-01'),('Research',5,333445555,'1988-05-22');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependent`
--

DROP TABLE IF EXISTS `dependent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dependent` (
  `essn` bigint DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `bdate` date DEFAULT NULL,
  `relationship` varchar(100) DEFAULT NULL,
  KEY `essn` (`essn`),
  CONSTRAINT `dependent_ibfk_1` FOREIGN KEY (`essn`) REFERENCES `employee` (`ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependent`
--

LOCK TABLES `dependent` WRITE;
/*!40000 ALTER TABLE `dependent` DISABLE KEYS */;
INSERT INTO `dependent` VALUES (333445555,'Alice','1986-04-05','Daughter'),(333445555,'Theodore','1983-10-25','Son'),(333445555,'Joy','1958-05-03','Spouse'),(987654321,'Abner','1942-02-28','Spouse'),(123456789,'Michael','1988-01-04','Son'),(123456789,'Alice','1988-12-30','Daughter'),(123456789,'Elizabeth','1967-05-05','Spouse');
/*!40000 ALTER TABLE `dependent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dept_locations`
--

DROP TABLE IF EXISTS `dept_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dept_locations` (
  `dnum` int NOT NULL,
  `dlocation` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  KEY `dnum` (`dnum`),
  CONSTRAINT `dept_locations_ibfk_1` FOREIGN KEY (`dnum`) REFERENCES `department` (`dnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dept_locations`
--

LOCK TABLES `dept_locations` WRITE;
/*!40000 ALTER TABLE `dept_locations` DISABLE KEYS */;
INSERT INTO `dept_locations` VALUES (1,'Houston'),(4,'Stafford'),(5,'Bellaire'),(5,'Sugarland'),(5,'Houston');
/*!40000 ALTER TABLE `dept_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `ssn` bigint NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `fname` varchar(100) DEFAULT NULL,
  `minit` varchar(100) DEFAULT NULL,
  `lname` varchar(100) DEFAULT NULL,
  `bdate` date DEFAULT NULL,
  `address` text,
  `salary` float DEFAULT NULL,
  `super_ssn` bigint DEFAULT NULL,
  `dno` int DEFAULT NULL,
  PRIMARY KEY (`ssn`),
  UNIQUE KEY `ssn` (`ssn`),
  UNIQUE KEY `ssn_2` (`ssn`),
  KEY `super_ssn` (`super_ssn`),
  KEY `dno` (`dno`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`super_ssn`) REFERENCES `employee` (`ssn`),
  CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`dno`) REFERENCES `department` (`dnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (123456789,'John B Smith','John','B','Smith','1965-01-09','731 Fondren, Houston, TX',30000,333445555,5),(333445555,'Franklin T Wong','Franklin','T','Wong','1955-12-08','638 Voss, Houston, TX',40000,888665555,5),(453453453,'Joyce A English','Joyce','A','English','1972-07-31','5631 Rice, Houston, TX',25000,333445555,5),(666884444,'Ramesh K Narayan','Ramesh','K','Narayan','1962-09-15','975 Fire Oak, Humble, TX',38000,333445555,5),(888665555,'James E Borg','James','E','Borg','1937-11-10','450 Stone, Houston, TX',55000,7786101712,1),(987654321,'Jennifer S Wallace','Jennifer','S','Wallace','1941-06-20','291 Berry, Bellaire, TX',43000,888665555,4),(987987987,'Ahmad V Jabbar','Ahmad','V','Jabbar','1969-03-29','980 Dallas, Houston, TX',25000,987654321,4),(999887777,'Alicia J Zelaya','Alicia','J','Zelaya','1968-01-19','3321 Castle, Spring, TX',25000,987654321,4),(7786101712,'Shmasul  Arefin','Shmasul','','Arefin','1993-12-01','Building No- B-69/F-9, Motijheel Govt. Colony, Post Office: G.P.O, Post Code: 1000, Thana: Motijheel, District: Dhaka',NULL,7786101712,NULL);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project` (
  `pnumber` int NOT NULL,
  `pname` varchar(100) NOT NULL,
  `plocation` text NOT NULL,
  `dnum` int NOT NULL,
  PRIMARY KEY (`pnumber`),
  KEY `dnum` (`dnum`),
  CONSTRAINT `project_ibfk_1` FOREIGN KEY (`dnum`) REFERENCES `department` (`dnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (1,'ProductX','Bellaire',5),(2,'ProductY','Sugarland',5),(3,'ProductZ','Houston',5),(10,'Computerization','Stafford',4),(20,'Reorganization','Houston',1),(30,'Newbenefits','Stafford',4);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `works_on`
--

DROP TABLE IF EXISTS `works_on`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `works_on` (
  `essn` bigint DEFAULT NULL,
  `pno` int DEFAULT NULL,
  `hours` float DEFAULT NULL,
  KEY `essn` (`essn`),
  KEY `pno` (`pno`),
  CONSTRAINT `works_on_ibfk_1` FOREIGN KEY (`essn`) REFERENCES `employee` (`ssn`),
  CONSTRAINT `works_on_ibfk_2` FOREIGN KEY (`pno`) REFERENCES `project` (`pnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `works_on`
--

LOCK TABLES `works_on` WRITE;
/*!40000 ALTER TABLE `works_on` DISABLE KEYS */;
INSERT INTO `works_on` VALUES (123456789,1,32.5),(123456789,2,7.5),(666884444,3,40),(453453453,1,20),(453453453,2,20),(333445555,2,10),(333445555,3,10),(333445555,10,10),(333445555,20,10),(999887777,30,30),(999887777,10,10),(987987987,10,35),(987987987,30,5),(987654321,30,20),(987654321,20,15),(888665555,20,7);
/*!40000 ALTER TABLE `works_on` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-10  3:10:53
