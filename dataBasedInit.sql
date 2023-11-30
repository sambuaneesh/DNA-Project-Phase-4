-- MySQL dump 10.13  Distrib 8.0.35, for Linux (x86_64)
--
-- Host: localhost    Database: cafelaboutique
-- ------------------------------------------------------
-- Server version	8.0.35-0ubuntu0.22.04.1

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
-- Table structure for table `Bill`
--

DROP TABLE IF EXISTS `Bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Bill` (
  `CustomerID` int NOT NULL,
  `OutletID` int NOT NULL,
  `BillAmount` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`,`OutletID`),
  KEY `fk_Bill_Outlet` (`OutletID`),
  CONSTRAINT `fk_Bill_Customer` FOREIGN KEY (`CustomerID`) REFERENCES `Customer` (`CustomerId`),
  CONSTRAINT `fk_Bill_Outlet` FOREIGN KEY (`OutletID`) REFERENCES `Outlet` (`OutletID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bill`
--

LOCK TABLES `Bill` WRITE;
/*!40000 ALTER TABLE `Bill` DISABLE KEYS */;
/*!40000 ALTER TABLE `Bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BillItems`
--

DROP TABLE IF EXISTS `BillItems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BillItems` (
  `CustomerID` int NOT NULL,
  `OutletID` int NOT NULL,
  `OrderedItems` int NOT NULL,
  PRIMARY KEY (`CustomerID`,`OutletID`,`OrderedItems`),
  CONSTRAINT `fk_BillItems_Bill` FOREIGN KEY (`CustomerID`, `OutletID`) REFERENCES `Bill` (`CustomerID`, `OutletID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BillItems`
--

LOCK TABLES `BillItems` WRITE;
/*!40000 ALTER TABLE `BillItems` DISABLE KEYS */;
/*!40000 ALTER TABLE `BillItems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customer` (
  `CustomerId` int NOT NULL,
  `Name` varchar(30) DEFAULT NULL,
  `Phone` int DEFAULT NULL,
  `Email` varchar(20) DEFAULT NULL,
  `Member` tinyint(1) DEFAULT NULL,
  `MemberSince` date DEFAULT NULL,
  `CustomerSince` date DEFAULT NULL,
  `Discount` decimal(3,0) DEFAULT NULL,
  PRIMARY KEY (`CustomerId`),
  CONSTRAINT `CHK_PhoneLength` CHECK ((length(`Phone`) = 10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DeliveryPartner`
--

DROP TABLE IF EXISTS `DeliveryPartner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DeliveryPartner` (
  `PartnerID` int NOT NULL,
  `PartnerName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`PartnerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DeliveryPartner`
--

LOCK TABLES `DeliveryPartner` WRITE;
/*!40000 ALTER TABLE `DeliveryPartner` DISABLE KEYS */;
/*!40000 ALTER TABLE `DeliveryPartner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employee` (
  `EmployeeID` int NOT NULL,
  `Name` varchar(30) DEFAULT NULL,
  `Aadhar` blob,
  `Number` int DEFAULT NULL,
  `Address` varchar(30) DEFAULT NULL,
  `Salary` decimal(5,0) DEFAULT NULL,
  `Gender` char(1) DEFAULT NULL,
  `DateOfBooking` date DEFAULT NULL,
  `DOJ` date DEFAULT NULL,
  `Role` varchar(10) DEFAULT NULL,
  `SupervisorID` int DEFAULT NULL,
  `YearsOfExperience` int DEFAULT NULL,
  `Age` int DEFAULT NULL,
  `ResumeLink` varchar(50) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `OutletID` int DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`),
  KEY `SupervisorID` (`SupervisorID`),
  KEY `OutletID` (`OutletID`),
  CONSTRAINT `Employee_ibfk_1` FOREIGN KEY (`SupervisorID`) REFERENCES `Employee` (`EmployeeID`),
  CONSTRAINT `Employee_ibfk_2` FOREIGN KEY (`OutletID`) REFERENCES `Outlet` (`OutletID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `employee_before_insert` BEFORE INSERT ON `Employee` FOR EACH ROW BEGIN
    IF LENGTH(NEW.Number) != 12 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Number must be of length 12';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `employee_before_update` BEFORE UPDATE ON `Employee` FOR EACH ROW BEGIN
    IF LENGTH(NEW.Number) != 12 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Number must be of length 12';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `MenuItem`
--

DROP TABLE IF EXISTS `MenuItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MenuItem` (
  `ItemId` int NOT NULL,
  `ItemName` varchar(30) DEFAULT NULL,
  `ItemDescription` varchar(50) DEFAULT NULL,
  `ItemPrice` decimal(4,0) DEFAULT NULL,
  `ItemImageURL` blob,
  PRIMARY KEY (`ItemId`),
  UNIQUE KEY `UC_ItemName` (`ItemName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MenuItem`
--

LOCK TABLES `MenuItem` WRITE;
/*!40000 ALTER TABLE `MenuItem` DISABLE KEYS */;
/*!40000 ALTER TABLE `MenuItem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MenuOutlet`
--

DROP TABLE IF EXISTS `MenuOutlet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MenuOutlet` (
  `OutletID` int NOT NULL,
  `ItemId` int NOT NULL,
  PRIMARY KEY (`OutletID`,`ItemId`),
  KEY `fk_MenuOutlet_Item` (`ItemId`),
  CONSTRAINT `fk_MenuOutlet_Item` FOREIGN KEY (`ItemId`) REFERENCES `MenuItem` (`ItemId`),
  CONSTRAINT `fk_MenuOutlet_Outlet` FOREIGN KEY (`OutletID`) REFERENCES `Outlet` (`OutletID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MenuOutlet`
--

LOCK TABLES `MenuOutlet` WRITE;
/*!40000 ALTER TABLE `MenuOutlet` DISABLE KEYS */;
/*!40000 ALTER TABLE `MenuOutlet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderPartners`
--

DROP TABLE IF EXISTS `OrderPartners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OrderPartners` (
  `CustomerID` int NOT NULL,
  `OutletID` int NOT NULL,
  `ItemId` int NOT NULL,
  `PartnerID` int NOT NULL,
  PRIMARY KEY (`CustomerID`,`OutletID`,`ItemId`,`PartnerID`),
  KEY `fk_OrderPartners_Partner` (`PartnerID`),
  CONSTRAINT `fk_OrderPartners_Order` FOREIGN KEY (`CustomerID`, `OutletID`, `ItemId`) REFERENCES `Orders` (`CustomerID`, `OutletID`, `ItemId`),
  CONSTRAINT `fk_OrderPartners_Partner` FOREIGN KEY (`PartnerID`) REFERENCES `DeliveryPartner` (`PartnerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderPartners`
--

LOCK TABLES `OrderPartners` WRITE;
/*!40000 ALTER TABLE `OrderPartners` DISABLE KEYS */;
/*!40000 ALTER TABLE `OrderPartners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderedItems`
--

DROP TABLE IF EXISTS `OrderedItems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OrderedItems` (
  `CustomerID` int NOT NULL,
  `OutletID` int NOT NULL,
  `OrderedItem` int NOT NULL,
  PRIMARY KEY (`CustomerID`,`OutletID`,`OrderedItem`),
  CONSTRAINT `fk_OrderedItems_Bill` FOREIGN KEY (`CustomerID`, `OutletID`) REFERENCES `Bill` (`CustomerID`, `OutletID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderedItems`
--

LOCK TABLES `OrderedItems` WRITE;
/*!40000 ALTER TABLE `OrderedItems` DISABLE KEYS */;
/*!40000 ALTER TABLE `OrderedItems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Orders` (
  `OutletID` int NOT NULL,
  `CustomerID` int NOT NULL,
  `Mode` tinyint(1) DEFAULT NULL,
  `OrderStatus` char(10) DEFAULT NULL,
  `ItemId` int NOT NULL,
  PRIMARY KEY (`CustomerID`,`OutletID`,`ItemId`),
  KEY `fk_Order_Outlet` (`OutletID`),
  KEY `fk_Order_Item` (`ItemId`),
  CONSTRAINT `fk_Order_Customer` FOREIGN KEY (`CustomerID`) REFERENCES `Customer` (`CustomerId`),
  CONSTRAINT `fk_Order_Item` FOREIGN KEY (`ItemId`) REFERENCES `MenuItem` (`ItemId`),
  CONSTRAINT `fk_Order_Outlet` FOREIGN KEY (`OutletID`) REFERENCES `Outlet` (`OutletID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Outlet`
--

DROP TABLE IF EXISTS `Outlet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Outlet` (
  `OutletID` int NOT NULL,
  `OutletName` varchar(30) DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `Phone` int DEFAULT NULL,
  `Rating` decimal(1,0) DEFAULT NULL,
  `PopularItem` varchar(20) DEFAULT NULL,
  `Revenue` decimal(10,0) DEFAULT NULL,
  `OutletCapacity` int DEFAULT NULL,
  PRIMARY KEY (`OutletID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Outlet`
--

LOCK TABLES `Outlet` WRITE;
/*!40000 ALTER TABLE `Outlet` DISABLE KEYS */;
/*!40000 ALTER TABLE `Outlet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reservation`
--

DROP TABLE IF EXISTS `Reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Reservation` (
  `DateOfBooking` date NOT NULL,
  `CustomerID` int NOT NULL,
  `OutletID` int NOT NULL,
  `PaymentMode` char(10) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`,`OutletID`,`DateOfBooking`),
  KEY `fk_Reservation_Outlet` (`OutletID`),
  CONSTRAINT `fk_Reservation_Customer` FOREIGN KEY (`CustomerID`) REFERENCES `Customer` (`CustomerId`),
  CONSTRAINT `fk_Reservation_Outlet` FOREIGN KEY (`OutletID`) REFERENCES `Outlet` (`OutletID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reservation`
--

LOCK TABLES `Reservation` WRITE;
/*!40000 ALTER TABLE `Reservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `Reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ReservationDetails`
--

DROP TABLE IF EXISTS `ReservationDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ReservationDetails` (
  `DateOfBooking` date NOT NULL,
  `Attendee` int NOT NULL,
  PRIMARY KEY (`DateOfBooking`,`Attendee`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ReservationDetails`
--

LOCK TABLES `ReservationDetails` WRITE;
/*!40000 ALTER TABLE `ReservationDetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `ReservationDetails` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-30 20:20:34
