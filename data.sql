-- MySQL dump 10.13  Distrib 8.0.35, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: dataBased
-- ------------------------------------------------------
-- Server version	8.0.35

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
  `BillAmount` decimal(10,5) DEFAULT NULL,
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
INSERT INTO `Bill` VALUES (1,1,8.99000),(2,2,5.99000),(3,3,29.97000),(4,4,12.99000),(5,5,10.99000),(6,6,8.99000),(7,7,5.99000),(8,8,8.99000),(9,9,10.99000),(10,10,12.99000),(11,11,10.99000),(12,12,8.99000),(13,13,5.99000),(14,14,22.98000),(15,15,10.99000),(16,16,8.99000),(17,17,5.99000),(18,18,13.98000),(19,19,NULL),(20,20,16.98000),(21,21,23.98000),(22,22,16.98000),(23,23,16.98000),(24,24,28.98000),(25,25,17.98000);
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
INSERT INTO `BillItems` VALUES (1,1,2),(2,2,4),(3,3,3),(3,3,8),(3,3,18),(4,4,1),(5,5,3),(6,6,2),(7,7,4),(8,8,2),(9,9,3),(10,10,1),(11,11,3),(12,12,2),(13,13,4),(14,14,1),(14,14,8),(15,15,3),(16,16,2),(17,17,4),(18,18,2),(18,18,10),(20,20,1),(20,20,15),(21,21,3),(21,21,13),(22,22,2),(22,22,12),(23,23,4),(23,23,14),(24,24,2),(24,24,6),(25,25,3),(25,25,19);
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
  `Phone` decimal(10,0) DEFAULT NULL,
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
INSERT INTO `Customer` VALUES (1,'John Doe',5551234567,'john@example.com',1,'2022-01-01','2022-01-01',5),(2,'Jane Smith',5552345678,'jane@example.com',0,NULL,'2022-01-15',NULL),(3,'Bob Johnson',5553456789,'bob@example.com',1,'2022-02-01','2022-02-01',10),(4,'Alice Brown',5554567890,'alice@example.com',0,NULL,'2022-02-15',NULL),(5,'Charlie Davis',5555678901,'charlie@example.com',1,'2022-03-01','2022-03-01',15),(6,'Eva Miller',5556789012,'eva@example.com',0,NULL,'2022-03-15',NULL),(7,'David Wilson',5557890123,'david@example.com',1,'2022-04-01','2022-04-01',20),(8,'Grace Lee',5558901234,'grace@example.com',0,NULL,'2022-04-15',NULL),(9,'Frank White',5559012345,'frank@example.com',1,'2022-05-01','2022-05-01',25),(10,'Holly Adams',5550123456,'holly@example.com',0,NULL,'2022-05-15',NULL),(11,'Ian Taylor',5551234567,'ian@example.com',1,'2022-06-01','2022-06-01',5),(12,'Jessica Turner',5552345678,'jessica@example.com',0,NULL,'2022-06-15',NULL),(13,'Kevin Garcia',5553456789,'kevin@example.com',1,'2022-07-01','2022-07-01',10),(14,'Linda Martinez',5554567890,'linda@example.com',0,NULL,'2022-07-15',NULL),(15,'Mike Robinson',5555678901,'mike@example.com',1,'2022-08-01','2022-08-01',15),(16,'Nina Hall',5556789012,'nina@example.com',0,NULL,'2022-08-15',NULL),(17,'Oscar Evans',5557890123,'oscar@example.com',1,'2022-09-01','2022-09-01',20),(18,'Pamela Harris',5558901234,'pamela@example.com',0,NULL,'2022-09-15',NULL),(19,'Quentin Allen',5559012345,'quentin@example.com',1,'2022-10-01','2022-10-01',25),(20,'Rachel King',5550123456,'rachel@example.com',0,NULL,'2022-10-15',NULL),(21,'Samuel Scott',5551234567,'samuel@example.com',1,'2022-11-01','2022-11-01',5),(22,'Tina Clark',5552345678,'tina@example.com',0,NULL,'2022-11-15',NULL),(23,'Ulysses Carter',5553456789,'ulysses@example.com',1,'2022-12-01','2022-12-01',10),(24,'Vivian Brown',5554567890,'vivian@example.com',0,NULL,'2022-12-15',NULL),(25,'Walter Davis',5555678901,'walter@example.com',1,'2023-01-01','2023-01-01',15);
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
INSERT INTO `DeliveryPartner` VALUES (1,'Rahul Sharma'),(2,'Priya Patel'),(3,'Amit Singh'),(4,'Neha Gupta'),(5,'Raj Kumar'),(6,'Pooja Mehta'),(7,'Vikas Verma'),(8,'Anjali Mishra'),(9,'Sandeep Yadav'),(10,'Sonia Reddy'),(11,'Manish Kapoor'),(12,'Deepika Das'),(13,'Vishal Jain'),(14,'Ritu Tiwari'),(15,'Ravi Choudhary'),(16,'Aarti Malhotra'),(17,'Arjun Bhatia'),(18,'Nisha Sharma'),(19,'Rajesh Khanna'),(20,'Shweta Singh'),(21,'Vivek Kumar'),(22,'Preeti Singh'),(23,'Rahul Kapoor'),(24,'Alisha Bansal'),(25,'Rajat Sharma');
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
  `Number` bigint DEFAULT NULL,
  `Address` varchar(30) DEFAULT NULL,
  `Salary` decimal(5,0) DEFAULT NULL,
  `Gender` char(1) DEFAULT NULL,
  `DateOfBooking` date DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `Role` varchar(10) DEFAULT NULL,
  `SupervisorID` int DEFAULT NULL,
  `YearsOfExperience` int DEFAULT NULL,
  `Age` int DEFAULT NULL,
  `ResumeLink` varchar(50) DEFAULT NULL,
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
INSERT INTO `Employee` VALUES (1,'John Doe',_binary 'aadhar1',123456789012,'Address 1',50000,'M','2023-01-01','2022-01-01','Manager',NULL,5,30,'resume_link1',2),(2,'Jane Smith',_binary 'aadhar2',987654321098,'Address 2',45000,'F','2023-02-01','2022-02-01','Supervisor',1,4,28,'resume_link2',4),(3,'Bob Johnson',_binary 'aadhar3',555555555555,'Address 3',40000,'M','2023-03-01','2022-03-01','Employee',2,3,25,'resume_link3',5),(4,'Alice Williams',_binary 'aadhar4',111111111111,'Address 4',55000,'F','2023-04-01','2022-04-01','Manager',NULL,6,32,'resume_link4',3),(5,'Charlie Brown',_binary 'aadhar5',222222222222,'Address 5',42000,'M','2023-05-01','2022-05-01','Employee',6,2,23,'resume_link5',1),(6,'Eva Miller',_binary 'aadhar6',333333333333,'Address 6',48000,'F','2023-06-01','2022-06-01','Supervisor',4,5,29,'resume_link6',2),(7,'David Wilson',_binary 'aadhar7',444444444444,'Address 7',51000,'M','2023-07-01','2022-07-01','waiter',6,4,27,'resume_link7',3),(8,'Grace Davis',_binary 'aadhar8',666666666666,'Address 8',49000,'F','2023-08-01','2022-08-01','Employee',6,3,26,'resume_link8',4),(9,'Frank White',_binary 'aadhar9',777777777777,'Address 9',46000,'M','2023-09-01','2022-09-01','Manager',NULL,7,31,'resume_link9',5),(10,'Helen Martinez',_binary 'aadhar10',888888888888,'Address 10',53000,'F','2023-10-01','2022-10-01','waiter',2,2,24,'resume_link10',1),(11,'Jack Taylor',_binary 'aadhar11',999999999999,'Address 11',47000,'M','2023-11-01','2022-11-01','Employee',6,4,28,'resume_link11',2),(12,'Olivia Brown',_binary 'aadhar12',123456789012,'1111222233',52000,'F','2023-12-01','2022-12-01','Supervisor',9,6,30,'resume_link12',3),(13,'Ryan Clark',_binary 'aadhar13',987654321098,'4444333322',49000,'M','2024-01-01','2023-01-01','Chef',12,3,26,'resume_link13',4),(14,'Sophia Adams',_binary 'aadhar14',555555555555,'1234123412',48000,'F','2024-02-01','2023-02-01','Chef',12,2,25,'resume_link14',5),(15,'Michael Turner',_binary 'aadhar15',111122223333,'5678567890',50000,'M','2024-03-01','2023-03-01','Manager',NULL,8,32,'resume_link15',1),(16,'Emma Harris',_binary 'aadhar16',444433332222,'9876543210',46000,'F','2024-04-01','2023-04-01','Employee',12,2,23,'resume_link16',2),(17,'Daniel Turner',_binary 'aadhar17',567856789012,'5555666677',54000,'M','2024-05-01','2023-05-01','waiter',12,4,28,'resume_link17',3),(18,'Olivia Green',_binary 'aadhar18',222233334444,'1234789456',49000,'F','2024-06-01','2023-06-01','Employee',12,3,27,'resume_link18',4),(19,'Liam Robinson',_binary 'aadhar19',123412341234,'9876543211',47000,'M','2024-07-01','2023-07-01','Manager',NULL,9,31,'resume_link19',6),(20,'Ava Lewis',_binary 'aadhar20',555566667777,'1111222233',51000,'F','2024-08-01','2023-08-01','Employee',21,2,24,'resume_link20',1),(21,'Mia Turner',_binary 'aadhar21',444433332211,'4444111122',48000,'F','2024-09-01','2023-09-01','Supervisor',19,5,29,'resume_link21',2),(22,'Ethan Davis',_binary 'aadhar22',555566667788,'9999888877',52000,'M','2024-10-01','2023-10-01','Employee',21,3,26,'resume_link22',3),(23,'Aria Martin',_binary 'aadhar23',444411113333,'8888777766',50000,'F','2024-11-01','2023-11-01','waiter',21,2,25,'resume_link23',4),(24,'Henry White',_binary 'aadhar24',555533334444,'3333222211',47000,'M','2024-12-01','2023-12-01','Manager',NULL,10,32,'resume_link24',7),(25,'Zoe Miller',_binary 'aadhar25',123478945612,'7777666655',54000,'F','2025-01-01','2024-01-01','Chef',19,2,23,'resume_link25',1);
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
  `ItemPrice` decimal(4,2) DEFAULT NULL,
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
INSERT INTO `MenuItem` VALUES (1,'Pizza','Delicious Margherita Pizza',12.99,_binary 'url1'),(2,'Burger','Classic Cheeseburger',8.99,_binary 'url2'),(3,'Pasta','Spaghetti with Marinara Sauce',10.99,_binary 'url3'),(4,'Salad','Fresh Garden Salad',5.99,_binary 'url4'),(5,'Sushi','Assorted Sushi Rolls',15.99,_binary 'url5'),(6,'Steak','Grilled Ribeye Steak',19.99,_binary 'url6'),(7,'Chicken Curry','Spicy Chicken Curry',13.99,_binary 'url7'),(8,'Tacos','Street Style Tacos',9.99,_binary 'url8'),(9,'Shrimp Scampi','Garlic Butter Shrimp Scampi',14.99,_binary 'url9'),(10,'Ice Cream','Vanilla Ice Cream',4.99,_binary 'url10'),(11,'Fish and Chips','Crispy Fish and Chips',11.99,_binary 'url11'),(12,'Caesar Salad','Classic Caesar Salad',7.99,_binary 'url12'),(13,'Pad Thai','Thai Stir-Fried Noodles',12.99,_binary 'url13'),(14,'Burrito','Spicy Chicken Burrito',10.99,_binary 'url14'),(15,'Mango Smoothie','Refreshing Mango Smoothie',3.99,_binary 'url15'),(16,'Lasagna','Homemade Beef Lasagna',14.99,_binary 'url16'),(17,'Pho','Vietnamese Beef Pho',11.99,_binary 'url17'),(18,'Chicken Wings','Hot and Spicy Chicken Wings',8.99,_binary 'url18'),(19,'Cheesecake','New York Style Cheesecake',6.99,_binary 'url19'),(20,'Fried Rice','Vegetable Fried Rice',9.99,_binary 'url20'),(21,'Cobb Salad','Classic Cobb Salad',8.99,_binary 'url21'),(22,'Gyoza','Japanese Dumplings',7.99,_binary 'url22'),(23,'BBQ Ribs','Slow-Cooked BBQ Ribs',16.99,_binary 'url23'),(24,'Caprese Salad','Tomato and Mozzarella Salad',6.99,_binary 'url24'),(25,'Hamburger','Juicy Hamburger',10.99,_binary 'url25'),(26,'Latte','Creamy Latte',3.99,_binary '0x75726C3236'),(27,'Build Bowl','Customizable Build Bowl',9.99,_binary '0x75726C3237');
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
INSERT INTO `MenuOutlet` VALUES (1,1),(2,1),(4,1),(10,1),(14,1),(20,1),(1,2),(2,2),(6,2),(8,2),(12,2),(16,2),(18,2),(22,2),(24,2),(3,3),(5,3),(6,3),(9,3),(11,3),(15,3),(21,3),(25,3),(2,4),(4,4),(7,4),(12,4),(13,4),(17,4),(23,4),(3,5),(5,5),(6,6),(17,6),(24,6),(7,7),(8,7),(19,7),(3,8),(5,8),(8,8),(14,8),(9,9),(10,10),(15,10),(18,10),(11,11),(21,11),(4,12),(12,12),(22,12),(13,13),(21,13),(14,14),(23,14),(13,15),(14,15),(15,15),(20,15),(16,16),(17,17),(3,18),(18,18),(25,18),(19,19),(25,19),(10,20),(20,20),(21,21),(22,22),(7,23),(23,23),(18,24),(24,24),(11,25),(25,25),(22,26),(20,27);
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
INSERT INTO `OrderPartners` VALUES (20,20,15,1),(21,21,13,1),(22,22,12,1),(23,23,14,1),(24,24,6,1),(25,25,19,1),(2,2,4,2),(3,3,8,4),(4,4,1,5),(6,6,2,7),(8,8,2,9),(10,10,1,11),(12,12,2,13),(14,14,1,15),(15,15,3,16),(17,17,4,18),(18,18,10,20);
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
  `dateOfOrder` datetime DEFAULT NULL,
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
INSERT INTO `Orders` VALUES (1,1,1,'preptime',2,'2023-12-02 17:46:00'),(2,2,0,'Cooking',4,NULL),(3,3,1,'Ready',3,'2023-12-03 17:55:03'),(3,3,0,'preptime',8,'2023-12-03 12:17:15'),(3,3,1,'Cooking',18,'2023-12-04 07:41:08'),(4,4,0,'Ready',1,'2023-12-04 01:33:56'),(5,5,1,'preptime',3,'2023-12-05 08:46:18'),(6,6,0,'Cooking',2,'2023-12-05 15:09:39'),(7,7,1,'Ready',4,'2023-12-06 01:29:23'),(8,8,0,'preptime',2,'2023-12-06 09:57:59'),(9,9,1,'Cooking',3,'2023-12-07 21:21:47'),(10,10,0,'Ready',1,'2023-12-07 04:54:57'),(11,11,1,'preptime',3,'2023-12-08 08:29:27'),(12,12,0,'Cooking',2,'2023-12-08 03:42:22'),(13,13,1,'Ready',4,'2023-12-09 17:03:30'),(14,14,0,'preptime',1,'2023-12-09 02:10:24'),(14,14,1,'Cooking',8,'2023-12-10 07:41:30'),(15,15,0,'Ready',3,'2023-12-10 07:56:20'),(16,16,1,'preptime',2,'2023-12-11 16:37:09'),(17,17,0,'Cooking',4,'2023-12-11 11:16:47'),(18,18,1,'Ready',2,'2023-12-12 06:32:26'),(18,18,0,'preptime',10,'2023-12-12 22:51:51'),(20,20,1,'Cooking',1,'2023-12-13 22:41:56'),(20,20,0,'Ready',15,'2023-12-13 20:54:07'),(21,21,1,'preptime',3,'2023-12-14 12:24:47'),(21,21,0,'Cooking',13,'2023-12-14 23:21:34'),(22,22,1,'Ready',2,'2023-12-15 07:33:30'),(22,22,0,'preptime',12,'2023-12-15 15:42:50'),(23,23,1,'Cooking',4,'2023-12-16 07:53:38'),(23,23,0,'Ready',14,'2023-12-16 16:19:43'),(24,24,1,'preptime',2,'2023-12-17 09:57:42'),(24,24,0,'Cooking',6,'2023-12-17 00:49:19'),(25,25,1,'Ready',3,'2023-12-18 22:13:31'),(25,25,0,'preptime',19,'2023-12-18 12:39:40');
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_insert_orders` AFTER INSERT ON `Orders` FOR EACH ROW BEGIN
    DECLARE popular_item_id INT;
    DECLARE popular_item_name VARCHAR(255);
    
    
    SELECT ItemId, ItemName
    INTO popular_item_id, popular_item_name
    FROM (
        SELECT ItemId, ItemName, COUNT(ItemId) AS item_count
        FROM Orders
        JOIN MenuItem ON Orders.ItemId = MenuItem.ItemId
        WHERE Orders.OutletID = NEW.OutletID
        GROUP BY ItemId
        ORDER BY item_count DESC
        LIMIT 1
    ) AS popular_item;
    
    
    UPDATE Outlets
    SET PopularItem = popular_item_name
    WHERE OutletID = NEW.OutletID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
  `Phone` decimal(10,0) DEFAULT NULL,
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
INSERT INTO `Outlet` VALUES (1,'BestBites','123 Main Street',5551234567,5,'Burger',100000,50),(2,'Pizza Palace','456 Oak Avenue',5552345678,4,'Pizza',80000,40),(3,'Sushi Spot','789 Pine Boulevard',5553456789,5,'Sushi',120000,30),(4,'Salad Haven','101 Elm Street',5554567890,4,'Caesar',50000,20),(5,'Taco Town','202 Cedar Lane',5555678901,4,'Tacos',70000,25),(6,'Pasta Paradise','303 Maple Drive',5556789012,5,'Pasta',90000,35),(7,'BBQ Junction','404 Birch Road',5557890123,4,'BBQ Ribs',110000,40),(8,'Curry Corner','505 Fir Street',5558901234,4,'Chicken Curry',95000,30),(9,'Seafood Delight','606 Pine Avenue',5559012345,5,'Shrimp Scampi',130000,35),(10,'Veggie Village','707 Cedar Boulevard',5550123456,4,'Fried Rice',75000,25),(11,'Bakery Bliss','808 Elm Drive',5551234567,5,'Hamburger',60000,20),(12,'Mexican Fiesta','909 Oak Lane',5552345678,4,'Salad',85000,30),(13,'Smoothie Haven','1010 Maple Road',5553456789,5,'Mango Smoothie',55000,15),(14,'Diner Delight','1111 Birch Street',5554567890,4,'Burito',70000,25),(15,'Ice Cream Paradise','1212 Pine Avenue',5555678901,5,'Ice Cream',80000,20),(16,'Mediterranean Delicacies','1313 Cedar Drive',5556789012,5,'Lasagna',95000,30),(17,'Asian Fusion','1414 Fir Lane',5557890123,4,'Steak',120000,35),(18,'Burger Barn','1515 Elm Road',5558901234,4,'Caperse Salad',90000,25),(19,'Indian Spice','1616 Oak Street',5559012345,5,'Chicken Curry',100000,30),(20,'Mongolian Grill','1717 Maple Avenue',5550123456,4,'Build Bowl',80000,25),(21,'Fish and Chips Cove','1818 Cedar Boulevard',5551234567,4,'Fish and Chips',70000,20),(22,'Cafe Latte','1919 Pine Drive',5552345678,5,'Latte',60000,15),(23,'Steakhouse Supreme','2020 Oak Lane',5553456789,5,'BBQ Ribs',110000,40),(24,'Greek Taverna','2121 Birch Road',5554567890,4,'Caprese Salad',85000,30),(25,'Wok Wonders','2222 Elm Street',5555678901,4,'Chicken Wings',95000,25);
/*!40000 ALTER TABLE `Outlet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reservation`
--

DROP TABLE IF EXISTS `Reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Reservation` (
  `DateOfBooking` datetime NOT NULL,
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
INSERT INTO `Reservation` VALUES ('2023-12-02 00:00:00',1,1,'Card'),('2023-12-03 00:00:00',3,3,'Cash'),('2023-12-04 00:00:00',3,3,'Cash'),('2023-12-05 00:00:00',5,5,'Cash'),('2023-12-06 00:00:00',7,7,'Cash'),('2023-12-07 00:00:00',9,9,'Cash'),('2023-12-08 00:00:00',11,11,'Cash'),('2023-12-09 00:00:00',13,13,'Card'),('2023-12-10 00:00:00',14,14,'Online'),('2023-12-11 00:00:00',16,16,'Online'),('2023-12-12 00:00:00',18,18,'Cash'),('2023-12-13 00:00:00',20,20,'Card'),('2023-12-14 00:00:00',21,21,'Cash'),('2023-12-15 00:00:00',22,22,'Card'),('2023-12-16 00:00:00',23,23,'Cash'),('2023-12-17 00:00:00',24,24,'Card'),('2023-12-18 00:00:00',25,25,'Online');
/*!40000 ALTER TABLE `Reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ReservationDetails`
--

DROP TABLE IF EXISTS `ReservationDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ReservationDetails` (
  `DateOfBooking` datetime NOT NULL,
  `Attendee` int NOT NULL,
  PRIMARY KEY (`DateOfBooking`,`Attendee`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ReservationDetails`
--

LOCK TABLES `ReservationDetails` WRITE;
/*!40000 ALTER TABLE `ReservationDetails` DISABLE KEYS */;
INSERT INTO `ReservationDetails` VALUES ('2023-12-02 00:00:00',2),('2023-12-03 00:00:00',3),('2023-12-04 00:00:00',1),('2023-12-05 00:00:00',4),('2023-12-06 00:00:00',4),('2023-12-07 00:00:00',5),('2023-12-08 00:00:00',2),('2023-12-09 00:00:00',5),('2023-12-10 00:00:00',3),('2023-12-11 00:00:00',4),('2023-12-12 00:00:00',3),('2023-12-13 00:00:00',1),('2023-12-14 00:00:00',1),('2023-12-15 00:00:00',2),('2023-12-16 00:00:00',1),('2023-12-17 00:00:00',5),('2023-12-18 00:00:00',3);
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

-- Dump completed on 2023-12-02 22:22:22
