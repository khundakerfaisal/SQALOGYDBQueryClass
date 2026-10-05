-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: studentdb
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.27-MariaDB

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
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `studentId` int(11) NOT NULL,
  `subjectCode` varchar(10) NOT NULL,
  PRIMARY KEY (`studentId`,`subjectCode`),
  KEY `subjectCode` (`subjectCode`),
  CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`studentId`) REFERENCES `studentpersonal` (`studentId`) ON DELETE CASCADE,
  CONSTRAINT `courses_ibfk_2` FOREIGN KEY (`subjectCode`) REFERENCES `subjects` (`subjectCode`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'CS201'),(1,'CS202'),(2,'CE201'),(2,'CS203');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `departmentCode` varchar(10) NOT NULL,
  `departmentName` varchar(100) NOT NULL,
  PRIMARY KEY (`departmentCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES ('BT105','Biotechnology'),('CE104','Civil Engineering'),('CS101','Computer Science'),('EE102','Electrical Engineering'),('ME103','Mechanical Engineering');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `paymentId` varchar(100) NOT NULL,
  `studentId` int(11) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `paymentDate` date DEFAULT NULL,
  PRIMARY KEY (`paymentId`),
  KEY `studentId` (`studentId`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`studentId`) REFERENCES `studentpersonal` (`studentId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES ('',NULL,NULL,NULL),('TXN1001',1,500.00,'2024-01-15'),('TXN1002',2,600.00,'2024-01-16'),('TXN1003',3,700.00,'2024-01-17'),('TXN1004',4,800.00,'2024-01-18'),('TXN1005',5,500.00,'2024-01-19'),('TXN1006',6,500.00,'2024-01-20'),('TXN1007',7,600.00,'2024-01-21'),('TXN1008',8,700.00,'2024-01-22'),('TXN1009',9,800.00,'2024-01-23');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentacademic`
--

DROP TABLE IF EXISTS `studentacademic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studentacademic` (
  `studentId` int(11) NOT NULL,
  `departmentCode` varchar(10) DEFAULT NULL,
  `session` varchar(20) DEFAULT NULL,
  `semester` int(11) DEFAULT NULL,
  `totalSemesterFees` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`studentId`),
  KEY `departmentCode` (`departmentCode`),
  CONSTRAINT `studentacademic_ibfk_1` FOREIGN KEY (`studentId`) REFERENCES `studentpersonal` (`studentId`) ON DELETE CASCADE,
  CONSTRAINT `studentacademic_ibfk_2` FOREIGN KEY (`departmentCode`) REFERENCES `departments` (`departmentCode`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentacademic`
--

LOCK TABLES `studentacademic` WRITE;
/*!40000 ALTER TABLE `studentacademic` DISABLE KEYS */;
INSERT INTO `studentacademic` VALUES (1,'CS101','2023-2024',1,1500.00),(2,'EE102','2022-2023',2,1600.00),(3,'ME103','2023-2024',1,1700.00),(4,'CE104','2021-2022',3,1800.00),(5,'CS101','2023-2024',2,1500.00),(6,'CS101','2023-2024',1,1500.00),(7,'EE102','2022-2023',2,1600.00),(8,'ME103','2023-2024',1,1400.00),(9,'CE104','2021-2022',3,2200.00),(10,'EE102','2023-2024',2,1500.00);
/*!40000 ALTER TABLE `studentacademic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentpersonal`
--

DROP TABLE IF EXISTS `studentpersonal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studentpersonal` (
  `studentId` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `fathername` varchar(50) DEFAULT NULL,
  `mothername` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `area` varchar(50) DEFAULT NULL,
  `fulladdress` text DEFAULT NULL,
  `bloodgroup` varchar(10) DEFAULT NULL,
  `religion` varchar(50) DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`studentId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentpersonal`
--

LOCK TABLES `studentpersonal` WRITE;
/*!40000 ALTER TABLE `studentpersonal` DISABLE KEYS */;
INSERT INTO `studentpersonal` VALUES (1,'John','Doe','Michael Doe','Jane Doe','New York','Manhattan','123 5th Avenue, Manhattan, New York, NY 10001','O+','Christian','Male'),(2,'Emily','Smith','Robert Smith','Sarah Smith','Los Angeles','Downtown','456 Sunset Boulevard, Downtown, Los Angeles, CA 90001','A-','Christian','Female'),(3,'Mohammed','Khan','Abdul Khan','Fatima Khan','Houston','Westside','789 Richmond Avenue, Westside, Houston, TX 77042','B+','Muslim','Male'),(4,'Priya','Patel','Raj Patel','Anita Patel','Chicago','Lincoln Park','1010 Fullerton Ave, Lincoln Park, Chicago, IL 60614','AB+','Hindu','Female'),(5,'Chen','Lee','Yuan Lee','Mei Lee','San Francisco','Chinatown','1212 Grant Ave, Chinatown, San Francisco, CA 94133','O-','Buddhist','Male'),(6,'Alice','Green','John Green','Emily Green','Boston','Back Bay','123 Commonwealth Ave, Back Bay, Boston, MA 02116','A+','Christian','Male'),(7,'Ryan','White','David White','Linda White','Seattle','Capitol Hill','456 Broadway E, Capitol Hill, Seattle, WA 98102','O-','Christian','Mmale'),(8,'Ibrahim','Hussain','Muhammad Hussain','Amina Hussain','New York','Oak Lawn','789 Oak Lawn Ave, Oak Lawn, Dallas, TX 75219','B-','Muslim','Male'),(9,'Priya','Rao','Suresh Rao','Lakshmi Rao','San Diego','La Jolla','1010 Prospect St, La Jolla, San Diego, CA 92037','AB+','Hindu','Female'),(10,'Yuki','Tanaka','Kenji Tanaka','Mika Tanaka','Chicago','Japantown','1212 Jackson St, Japantown, San Jose, CA 95112','A-','Buddhist','Male'),(20,'user552','user552','John Clark','Lucy Clark','New York','Brooklyn','456 Bedford Ave, Brooklyn, NY','O+','Christian',NULL);
/*!40000 ALTER TABLE `studentpersonal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subjects` (
  `subjectCode` varchar(10) NOT NULL,
  `subjectTitle` varchar(100) NOT NULL,
  `departmentCode` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`subjectCode`),
  KEY `departmentCode` (`departmentCode`),
  CONSTRAINT `subjects_ibfk_1` FOREIGN KEY (`departmentCode`) REFERENCES `departments` (`departmentCode`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` VALUES ('BT201','Genetics','BT105'),('CE201','Structural Engineering','CE104'),('CE202','Construction Materials','CE104'),('CS201','Introduction to Programming','CS101'),('CS202','Data Structures','CS101'),('CS203','Algorithms','CS101'),('EE201','Circuit Analysis','EE102'),('EE202','Electromagnetics','EE102'),('ME201','Thermodynamics','ME103'),('ME202','Fluid Mechanics','ME103');
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacheracademic`
--

DROP TABLE IF EXISTS `teacheracademic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacheracademic` (
  `teacherId` int(11) NOT NULL,
  `departmentCode` varchar(10) DEFAULT NULL,
  `Designation` varchar(50) DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`teacherId`),
  KEY `departmentCode` (`departmentCode`),
  CONSTRAINT `teacheracademic_ibfk_1` FOREIGN KEY (`teacherId`) REFERENCES `teacherpersonal` (`teacherId`) ON DELETE CASCADE,
  CONSTRAINT `teacheracademic_ibfk_2` FOREIGN KEY (`departmentCode`) REFERENCES `departments` (`departmentCode`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacheracademic`
--

LOCK TABLES `teacheracademic` WRITE;
/*!40000 ALTER TABLE `teacheracademic` DISABLE KEYS */;
INSERT INTO `teacheracademic` VALUES (1,'CS101','Sr. Lecturer',5500.00),(2,'EE102','Sr. Lecturer',5400.00),(3,'ME103','Lecturer',5300.00),(4,'CE104','Lecturer',5100.00),(5,'BT105','Associate Professor',6000.00);
/*!40000 ALTER TABLE `teacheracademic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacherpersonal`
--

DROP TABLE IF EXISTS `teacherpersonal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacherpersonal` (
  `teacherId` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `fathername` varchar(50) DEFAULT NULL,
  `mothername` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `area` varchar(50) DEFAULT NULL,
  `fulladdress` text DEFAULT NULL,
  `bloodgroup` varchar(10) DEFAULT NULL,
  `religion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`teacherId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacherpersonal`
--

LOCK TABLES `teacherpersonal` WRITE;
/*!40000 ALTER TABLE `teacherpersonal` DISABLE KEYS */;
INSERT INTO `teacherpersonal` VALUES (1,'David','Johnson','Mark Johnson','Laura Johnson','New York','Manhattan','123 6th Avenue, Manhattan, New York, NY 10001','O+','Christian'),(2,'Sarah','Brown','Thomas Brown','Nancy Brown','Los Angeles','Hollywood','789 Hollywood Blvd, Los Angeles, CA 90028','A-','Christian'),(3,'Ahmed','Ali','Hassan Ali','Fatima Ali','Houston','Downtown','101 Main St, Downtown, Houston, TX 77002','B+','Muslim'),(4,'Sanjay','Mehta','Rajesh Mehta','Kavita Mehta','Chicago','South Loop','2022 Wabash Ave, South Loop, Chicago, IL 60616','AB+','Hindu'),(5,'Wei','Zhang','Ling Zhang','Xiao Zhang','San Francisco','Chinatown','303 Grant Ave, Chinatown, San Francisco, CA 94108','O-','Buddhist');
/*!40000 ALTER TABLE `teacherpersonal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'studentdb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-09 20:26:07
