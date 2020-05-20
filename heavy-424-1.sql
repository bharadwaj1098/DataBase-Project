-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: database-spring20-6162-khanderao.cpiky6fynjba.us-east-1.rds.amazonaws.com    Database: Heavy
-- ------------------------------------------------------
-- Server version	5.7.22-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ACCOMODATION_DESTINATION`
--

DROP TABLE IF EXISTS `ACCOMODATION_DESTINATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACCOMODATION_DESTINATION` (
  `Accomodation_Ids` int(11) NOT NULL,
  `Destination_ID` int(11) NOT NULL,
  PRIMARY KEY (`Accomodation_Ids`),
  KEY `destinationid_idx` (`Destination_ID`),
  CONSTRAINT `Accomodation_Ids` FOREIGN KEY (`Accomodation_Ids`) REFERENCES `Accommodation` (`Accomodation_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `destinationid` FOREIGN KEY (`Destination_ID`) REFERENCES `Destination` (`Destination_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACCOMODATION_DESTINATION`
--

LOCK TABLES `ACCOMODATION_DESTINATION` WRITE;
/*!40000 ALTER TABLE `ACCOMODATION_DESTINATION` DISABLE KEYS */;
INSERT INTO `ACCOMODATION_DESTINATION` VALUES (7,1122),(2,1142),(9,1143),(8,1389),(1,1390),(6,1390),(3,2233),(4,2234),(5,2235);
/*!40000 ALTER TABLE `ACCOMODATION_DESTINATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Accommodation`
--

DROP TABLE IF EXISTS `Accommodation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Accommodation` (
  `Accomodation_Id` int(11) NOT NULL,
  `Address_Of_Accommodation` varchar(45) NOT NULL,
  `Accomodation_Type` varchar(45) NOT NULL,
  `CheckInDate` date NOT NULL,
  `CheckOutDate` date NOT NULL,
  `NumberOfGuests` int(11) NOT NULL,
  `DurationOfStay` int(11) GENERATED ALWAYS AS ((to_days(`CheckOutDate`) - to_days(`CheckInDate`))) STORED,
  PRIMARY KEY (`Accomodation_Id`),
  KEY `idx_CheckInDate` (`CheckInDate`,`CheckOutDate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Accommodation`
--

LOCK TABLES `Accommodation` WRITE;
/*!40000 ALTER TABLE `Accommodation` DISABLE KEYS */;
INSERT INTO `Accommodation` (`Accomodation_Id`, `Address_Of_Accommodation`, `Accomodation_Type`, `CheckInDate`, `CheckOutDate`, `NumberOfGuests`) VALUES (1,'1-2-3/hdhjd/kdk','hotel','2019-03-04','2019-03-26',5),(2,'1-2-4/j4tvtvj/i3ej3dl','villa','2019-10-14','2019-10-28',6),(3,'9712 mary alexander road','apartment','2019-02-08','2019-02-18',8),(4,'516, barton creed drive','apartment','2019-03-04','2019-03-25',5),(5,'150 Broad LaneRocky Mount, NC 27804','hotel','2019-12-08','2019-12-09',4),(6,'134 Gulf Ave.Lakeland, FL 33801','villa','2020-01-09','2020-01-19',5),(7,'46 Marlborough LaneLogansport, IN 46947','apartment','2019-10-24','2019-11-14',8),(8,'8626 Fawn StreetWallingford, CT 06492','apartment','2020-04-14','2020-04-26',4),(9,'286 Atlantic StreetRochester, NY 14606','hotel','2019-04-15','2019-05-15',5);
/*!40000 ALTER TABLE `Accommodation` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`adminkhanderao`@`%`*/ /*!50003 TRIGGER Log_AccTableDeletion
AFTER DELETE
   ON   Heavy.Accommodation FOR EACH ROW

BEGIN

   DECLARE vUser varchar(50);
   SELECT USER() INTO vUser;
	
   INSERT INTO DeleteLog
   ( contact_id,
     deleted_date,
     deleted_by,Table_Affected)
   VALUES
   ( contact_id,
     SYSDATE(),
     vUser,'Accommodation' );

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Admin`
--

DROP TABLE IF EXISTS `Admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Admin` (
  `Loginid` int(11) NOT NULL AUTO_INCREMENT,
  `Password` varchar(45) NOT NULL,
  PRIMARY KEY (`Loginid`),
  UNIQUE KEY `Loginid_UNIQUE` (`Loginid`),
  UNIQUE KEY `Password_UNIQUE` (`Password`)
) ENGINE=InnoDB AUTO_INCREMENT=11001 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Admin`
--

LOCK TABLES `Admin` WRITE;
/*!40000 ALTER TABLE `Admin` DISABLE KEYS */;
INSERT INTO `Admin` VALUES (9000,'1@3Qwe'),(10000,'4%6rtY'),(11000,'7*9yUi'),(5678,'rty@rty');
/*!40000 ALTER TABLE `Admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DeleteLog`
--

DROP TABLE IF EXISTS `DeleteLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DeleteLog` (
  `contact_id` int(11) NOT NULL AUTO_INCREMENT,
  `deleted_date` date NOT NULL,
  `deleted_by` varchar(45) DEFAULT NULL,
  `Table_Affected` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`contact_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DeleteLog`
--

LOCK TABLES `DeleteLog` WRITE;
/*!40000 ALTER TABLE `DeleteLog` DISABLE KEYS */;
INSERT INTO `DeleteLog` VALUES (1,'2020-04-23','adminkhanderao@cpe-172-73-70-231.carolina.res','Message'),(2,'2020-04-23','adminkhanderao@cpe-172-73-70-231.carolina.res','User'),(3,'2020-04-23','adminkhanderao@cpe-172-73-70-231.carolina.res','Accommodation'),(4,'2020-04-23','adminkhanderao@cpe-172-73-70-231.carolina.res','User');
/*!40000 ALTER TABLE `DeleteLog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Destination`
--

DROP TABLE IF EXISTS `Destination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Destination` (
  `DestinationName` varchar(45) NOT NULL,
  `Dest_Country` varchar(45) DEFAULT NULL,
  `Destination_ID` int(11) NOT NULL,
  `Dest_State` varchar(45) NOT NULL,
  `MajorAttractions` varchar(45) NOT NULL,
  PRIMARY KEY (`Destination_ID`),
  KEY `idx_Dest_Country` (`Dest_Country`),
  KEY `idx_MajorAttractions` (`MajorAttractions`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Destination`
--

LOCK TABLES `Destination` WRITE;
/*!40000 ALTER TABLE `Destination` DISABLE KEYS */;
INSERT INTO `Destination` VALUES ('',NULL,0,'',''),('charlotte','usa',1122,'North Carolina','uncc urec  ut north  lake by univercity  flyi'),('Norfolk','usa',1142,'Virginia','planitoriums'),('Orlando','usa',1143,'Florida','disney land'),('new york','usa',1389,'New York','china town  broadway  times square  connie is'),('Bakersfield','usa',1390,'California','beaches,vineyards'),('los angeles','usa',2233,'California','hollywood  zuma beach  paramount pictures'),('Rochester','usa',2234,'New York','Rochester university'),('miami','usa',2235,'Florida','beaches beach houses');
/*!40000 ALTER TABLE `Destination` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`adminkhanderao`@`%`*/ /*!50003 TRIGGER Log_DestTableDeletion
AFTER DELETE
   ON   Heavy.Destination FOR EACH ROW

BEGIN

   DECLARE vUser varchar(50);
   SELECT USER() INTO vUser;
	
   INSERT INTO DeleteLog
   ( contact_id,
     deleted_date,
     deleted_by,Table_Affected)
   VALUES
   ( contact_id,
     SYSDATE(),
     vUser,'Destination' );

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Discount`
--

DROP TABLE IF EXISTS `Discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Discount` (
  `Discount_Code` int(11) NOT NULL,
  `Discount_Name` varchar(45) NOT NULL,
  `Discount_Percentage` double NOT NULL,
  `Discount_startDate` date NOT NULL,
  `Discount_EndDate` date NOT NULL,
  PRIMARY KEY (`Discount_Code`),
  KEY `idx_Discount_Name` (`Discount_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Discount`
--

LOCK TABLES `Discount` WRITE;
/*!40000 ALTER TABLE `Discount` DISABLE KEYS */;
INSERT INTO `Discount` VALUES (111,'new year',10,'2020-01-01','2020-01-10'),(400,'summer sale',40,'2021-01-03','2021-01-31'),(500,'winter sale',49,'2021-03-03','2021-03-31'),(800,'independence day sale',25,'2021-05-03','2021-10-31'),(900,'good friday deals',20,'2019-05-20','2019-06-26');
/*!40000 ALTER TABLE `Discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `GetHostInfo`
--

DROP TABLE IF EXISTS `GetHostInfo`;
/*!50001 DROP VIEW IF EXISTS `GetHostInfo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `GetHostInfo` AS SELECT 
 1 AS `Name of Host`,
 1 AS `Email`,
 1 AS `city`,
 1 AS `Accomodation Addres`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Heavy.Payment_total`
--

DROP TABLE IF EXISTS `Heavy.Payment_total`;
/*!50001 DROP VIEW IF EXISTS `Heavy.Payment_total`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Heavy.Payment_total` AS SELECT 
 1 AS `TransactionID`,
 1 AS `Room_Rent`,
 1 AS `Discount Percentage`,
 1 AS `Miscellaneous_charges`,
 1 AS `Month`,
 1 AS `Total Income`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Message`
--

DROP TABLE IF EXISTS `Message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Message` (
  `MessageID` int(11) NOT NULL,
  `SenderMailId` varchar(45) NOT NULL,
  `ReceiverMailID` varchar(45) NOT NULL,
  `Body` varchar(100) NOT NULL,
  `Timestamp` varchar(45) NOT NULL,
  PRIMARY KEY (`MessageID`),
  KEY `idx_senderMailId` (`SenderMailId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Message`
--

LOCK TABLES `Message` WRITE;
/*!40000 ALTER TABLE `Message` DISABLE KEYS */;
INSERT INTO `Message` VALUES (22,'ndhabi@uncc.edu','sarrabel@uncc.edu','hi, hello how r you doing? i\'m looking to crash at your place','2020-03-12T07:00:00-04:00'),(33,'kishore@uncc.edu','ndhabi@uncc.edu','hii hii hii how yoy doing?','2020-03-15T07:00:40-14:00'),(55,'sarrabel@uncc.edu','ndhabi@uncc.edu','hw=ey, hope you are doing great. yes you can crash at my place.','2020-03-14T07:30:00-24:00'),(66,'sarrabel@uncc.edu','kishore@uncc.edu','Contacting you for price details','2020-03-14T07:09:50-06:00'),(67,'Margie @Healy.com','ndhabi@uncc.edu','Good question - I am still trying to figure that out!','2020-03-14T07:09:50-06:00'),(68,'Vinnie@ Melton.com','Joan @Dickerson.com','What would be the cost of the accomodation per night','2020-03-14T07:09:50-06:00'),(69,'Tracey@Rowley.com','Dan @Cameron.com','how many guest are coming','2020-03-14T07:09:50-06:00'),(70,'Ruth@Shields.com','Philip @Forster.com','what is the duration of stay','2020-03-14T07:09:50-06:00'),(71,'Judy@Kouma.com','Philip @Forster.com','any discounts available','2020-03-14T07:09:50-06:00'),(72,'Adam@Campos.com','Margie @Healy.com','please provide feedback to us','2020-03-14T07:09:50-06:00'),(73,'chamanlal@reddy.com','Vinnie@ Melton.com','wanted to check the proices','2020-03-14T07:09:50-06:00'),(74,'Roseanna@Compton.com','kishore@uncc.edu','what are accomodation fecilities','2020-03-14T07:09:50-06:00'),(75,'chamanlal@reddy.com','sarrabel@uncc.edu','is breakfast available','2020-03-14T07:09:50-06:00'),(76,'ndhabi@uncc.edu','Tracey@Rowley.com','is it coveed in the room rent','2020-03-14T07:09:50-06:00'),(77,'Joan @Dickerson.com','Adam@Campos.com','it is much cheaper','2020-03-14T07:09:50-06:00'),(78,'Dan @Cameron.com','Margie @Healy.com','it is too costly','2020-03-14T07:09:50-06:00'),(79,'sarrabel@uncc.edu','Vinnie@ Melton.com','any discounts?','2020-03-14T07:09:50-06:00');
/*!40000 ALTER TABLE `Message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PAYMENT_DISCOUNT`
--

DROP TABLE IF EXISTS `PAYMENT_DISCOUNT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PAYMENT_DISCOUNT` (
  `TransactionID` int(11) NOT NULL,
  `Discount_Code` int(11) NOT NULL,
  PRIMARY KEY (`TransactionID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PAYMENT_DISCOUNT`
--

LOCK TABLES `PAYMENT_DISCOUNT` WRITE;
/*!40000 ALTER TABLE `PAYMENT_DISCOUNT` DISABLE KEYS */;
INSERT INTO `PAYMENT_DISCOUNT` VALUES (315489653,900),(315489656,400),(315489657,500),(315489658,800),(315489659,900),(315489660,500),(315489661,111),(315489662,400),(315489663,500),(315889664,800),(315889665,900),(315889666,800),(315889667,900),(315889669,500),(2147483645,400),(2147483647,900);
/*!40000 ALTER TABLE `PAYMENT_DISCOUNT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Payment`
--

DROP TABLE IF EXISTS `Payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Payment` (
  `TransactionID` int(11) NOT NULL,
  `Payment_card_Type` varchar(45) NOT NULL,
  `Card_Number` varchar(45) NOT NULL,
  `Payment_date` date NOT NULL,
  `Room_Rent` int(11) NOT NULL,
  `Miscellaneous_charges` int(11) DEFAULT NULL,
  PRIMARY KEY (`TransactionID`),
  KEY `idx_Card_Number` (`Card_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Payment`
--

LOCK TABLES `Payment` WRITE;
/*!40000 ALTER TABLE `Payment` DISABLE KEYS */;
INSERT INTO `Payment` VALUES (214748364,'credit','5828897825671230','2019-05-15',1500,500),(214748365,'Debit','5828897825696230','2020-04-01',1700,150),(214748366,'Debit','5828897825721230','2019-03-26',2300,200),(214748367,'Debit','5828897825746230','2019-10-28',1560,500),(214748368,'Debit','5828897825771230','2019-02-18',1780,150),(214748369,'Debit','5828897825796230','2019-03-25',1590,200),(214748370,'Credit','5828897825821230','2019-12-09',1950,800),(214748371,'Debit','5828897825846230','2020-01-19',1811,60),(315489653,'Debit','3265985426578549','2020-01-01',2000,150),(315489656,'Debit','9929112256338960','2019-05-15',1500,500),(315489657,'Credit','9940112256338960','2020-04-01',2600,150),(315489658,'Debit','9951112256338960','2019-03-26',1700,200),(315489659,'Credit','9962112256338960','2019-10-28',2000,500),(315489660,'Credit','9973112256338960','2019-02-18',1650,150),(315489661,'Credit','9984112256338960','2019-03-25',1700,200),(315489662,'Debit','9995112256338960','2019-12-09',2300,800),(315489663,'Debit','9996212256338980','2020-01-19',1560,60),(315889664,'Debit','9997312256339000','2019-11-19',1780,280),(315889665,'Debit','9998412256339020','2020-04-16',1590,90),(315889666,'Debit','9999512256339040','2019-05-17',1950,450),(315889667,'Credit','9999523256339060','2020-03-23',1811,311),(315889668,'Debit','5828897825896230','2020-04-16',10000,90),(315889669,'Credit','9999534256339080','2020-03-30',1750,250),(315889670,'Debit','5828897825946230','2020-03-23',1700,311),(315889671,'Credit','5828897825971230','2020-03-30',2300,250),(2147483645,'Credit','3265985426578458','2020-01-10',10000,2000),(2147483647,'credit','5828897825671236','2019-10-10',1500,500);
/*!40000 ALTER TABLE `Payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `TotalIncome_Generated`
--

DROP TABLE IF EXISTS `TotalIncome_Generated`;
/*!50001 DROP VIEW IF EXISTS `TotalIncome_Generated`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `TotalIncome_Generated` AS SELECT 
 1 AS `Month`,
 1 AS `Total Income`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Total_Discounts_Provided`
--

DROP TABLE IF EXISTS `Total_Discounts_Provided`;
/*!50001 DROP VIEW IF EXISTS `Total_Discounts_Provided`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Total_Discounts_Provided` AS SELECT 
 1 AS `Month`,
 1 AS `Total Discount provided in dollars`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `USER_DESTINATION_CR`
--

DROP TABLE IF EXISTS `USER_DESTINATION_CR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_DESTINATION_CR` (
  `Userid` int(11) NOT NULL,
  `destinationid` int(11) NOT NULL,
  PRIMARY KEY (`Userid`),
  KEY `DESTINATION_IDS_idx` (`destinationid`),
  CONSTRAINT `DESTINATION_IDS` FOREIGN KEY (`destinationid`) REFERENCES `Destination` (`Destination_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `USER_IDS` FOREIGN KEY (`Userid`) REFERENCES `User` (`User_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_DESTINATION_CR`
--

LOCK TABLES `USER_DESTINATION_CR` WRITE;
/*!40000 ALTER TABLE `USER_DESTINATION_CR` DISABLE KEYS */;
INSERT INTO `USER_DESTINATION_CR` VALUES (3,1122),(17,1122),(22,1122),(101,1122),(110,1122),(10,1142),(15,1142),(99,1142),(108,1142),(11,1143),(16,1143),(100,1143),(109,1143),(18,1389),(23,1389),(45,1389),(102,1389),(111,1389),(8,1390),(13,1390),(14,1390),(90,1390),(98,1390),(106,1390),(107,1390),(19,2233),(24,2233),(103,2233),(112,2233),(9,2234),(20,2234),(49,2234),(88,2234),(104,2234),(12,2235),(21,2235),(89,2235),(105,2235);
/*!40000 ALTER TABLE `USER_DESTINATION_CR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_MESSAGE`
--

DROP TABLE IF EXISTS `USER_MESSAGE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_MESSAGE` (
  `User_ID` int(11) NOT NULL,
  `MessageID` int(11) NOT NULL,
  PRIMARY KEY (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_MESSAGE`
--

LOCK TABLES `USER_MESSAGE` WRITE;
/*!40000 ALTER TABLE `USER_MESSAGE` DISABLE KEYS */;
INSERT INTO `USER_MESSAGE` VALUES (3,33),(8,70),(9,74),(10,71),(11,72),(12,73),(22,55),(23,77),(24,78),(88,22),(89,68),(90,69);
/*!40000 ALTER TABLE `USER_MESSAGE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_PAYMENT`
--

DROP TABLE IF EXISTS `USER_PAYMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_PAYMENT` (
  `TransactionID` int(11) NOT NULL,
  `User_ID` varchar(45) NOT NULL,
  PRIMARY KEY (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_PAYMENT`
--

LOCK TABLES `USER_PAYMENT` WRITE;
/*!40000 ALTER TABLE `USER_PAYMENT` DISABLE KEYS */;
INSERT INTO `USER_PAYMENT` VALUES (315489663,'100'),(315889664,'101'),(315889665,'102'),(315889666,'103'),(315889667,'104'),(315889668,'105'),(315889669,'106'),(315889670,'107'),(315889671,'108'),(2147483645,'109'),(2147483647,'110'),(214748365,'12'),(214748366,'13'),(214748367,'14'),(214748368,'15'),(214748369,'16'),(214748370,'17'),(214748371,'18'),(315489653,'19'),(315489656,'20'),(315489657,'21'),(315489658,'23'),(315489659,'24'),(315489660,'49'),(315489661,'88'),(214748364,'9'),(315489662,'99');
/*!40000 ALTER TABLE `USER_PAYMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_USER FEEDBACK_ACCOMMODATION_CR`
--

DROP TABLE IF EXISTS `USER_USER FEEDBACK_ACCOMMODATION_CR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_USER FEEDBACK_ACCOMMODATION_CR` (
  `UserID` int(11) NOT NULL,
  `Feedback_id` int(11) NOT NULL,
  `Accomodation_id_s` int(11) NOT NULL,
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `Feedback_code_UNIQUE` (`Feedback_id`),
  UNIQUE KEY `UserID_UNIQUE` (`UserID`),
  KEY `Accomodation_id_s` (`Accomodation_id_s`),
  CONSTRAINT `Accomodation_id_s` FOREIGN KEY (`Accomodation_id_s`) REFERENCES `Accommodation` (`Accomodation_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `feedbackid` FOREIGN KEY (`Feedback_id`) REFERENCES `User_Feedback` (`Feedback_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `userid` FOREIGN KEY (`UserID`) REFERENCES `User` (`User_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_USER FEEDBACK_ACCOMMODATION_CR`
--

LOCK TABLES `USER_USER FEEDBACK_ACCOMMODATION_CR` WRITE;
/*!40000 ALTER TABLE `USER_USER FEEDBACK_ACCOMMODATION_CR` DISABLE KEYS */;
INSERT INTO `USER_USER FEEDBACK_ACCOMMODATION_CR` VALUES (9,111,1),(12,112,2),(13,113,3),(14,114,4),(15,115,5),(16,116,6),(17,117,7),(18,118,8),(19,119,9),(20,120,1),(21,121,2),(23,122,3),(24,123,4),(49,124,5),(88,125,6),(99,126,7),(100,222,8),(101,223,9),(102,224,1),(103,225,2),(104,226,3),(105,227,4),(106,228,5),(107,333,6),(108,334,7),(109,335,8),(110,336,9),(111,337,1),(112,338,2);
/*!40000 ALTER TABLE `USER_USER FEEDBACK_ACCOMMODATION_CR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User` (
  `User_ID` int(11) NOT NULL,
  `User_First_Name` varchar(45) NOT NULL,
  `User_Middle_Name` varchar(45) NOT NULL,
  `User_Last_Name` varchar(45) NOT NULL,
  `User_type` varchar(45) NOT NULL,
  `User_Address` varchar(45) NOT NULL,
  `User_email` varchar(45) NOT NULL,
  PRIMARY KEY (`User_ID`),
  KEY `idx_name` (`User_First_Name`,`User_Middle_Name`,`User_Last_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (3,'Kishore Sai','venkata','sai','host','2243 ut north, 28262, cgarlotte','venkata@sai.com'),(8,'Ruth','Compton','Shields','host','9151 Sulphur Springs Drive Duluth, GA 30096','Ruth@Shields.com'),(9,'Roseanna','Kouma','Compton','user','229 S. Saxton St. Indianapolis, IN 46201','Roseanna@Compton.com'),(10,'Judy','Campos','Kouma','host','862 Williams Ave. La Crosse, WI 54601','Judy@Kouma.com'),(11,'Adam','Tracey','Campos','host','7202 Greystone Street Sidney, OH 45365','Adam@Campos.com'),(12,'chamanlal','Ruth','reddy','user','6 Devonshire Rd.Clementon, NJ 08021','chamanlal@reddy.com'),(13,'Kayla','Anderson','Bowman','user','229 S. Saxton St. Indianapolis, IN 46201','Kayla@Bowman.com'),(14,'Howard','Quinn','Carroll','user','862 Williams Ave. La Crosse, WI 54601','Howard@Carroll.com'),(15,'Moses','Gibbs','Harrington','user','7202 Greystone Street Sidney, OH 45365','Moses@Harrington.com'),(16,'Constance','Collins','Leonard','user','6 Devonshire Rd.Clementon, NJ 08021','Constance@Leonard.com'),(17,'Eula','Townsend','Johnston','user','229 S. Saxton St. Indianapolis, IN 46201','Eula@Johnston.com'),(18,'Alexander','Barber','Medina','user','862 Williams Ave. La Crosse, WI 54601','Alexander@Medina.com'),(19,'Enrique','Hill','Hernandez','user','7202 Greystone Street Sidney, OH 45365','Enrique@Hernandez.com'),(20,'Anita','Mcdaniel','Little','user','6 Devonshire Rd.Clementon, NJ 08021','Anita@Little.com'),(21,'Brendan','Spencer','Gonzalez','user','229 S. Saxton St. Indianapolis, IN 46201','Brendan@Gonzalez.com'),(22,'sai','bharadwaj','reddy','host','2234 ut north, 28262, cgarlotte','sarrabel@uncc.edu'),(23,'Joan ','Rowley','Dickerson','user','416 Hilltop St.Groton, CT 06340','Joan @Dickerson.com'),(24,'Dan ','Shields','Cameron','user','\n8216 Lakeview Ave.New Windsor, NY 12553','Dan @Cameron.com'),(45,'sai','bharadwaj','reddy','host','2234 ut north, 28262, cgarlotte','sarrabel@uncc.edu'),(49,'Carol','Melinda','Zimmerman','user','913 Brown Avenue Redford, MI 48239','Carol@Zimmerman.com'),(88,'nandani','chamanlal','dabhi','user','9712 mary alexander road','ndhabi@uncc.edu'),(89,'Vinnie','reddy',' Melton','host','117 Poplar Lane Loveland, OH 45140','Vinnie@ Melton.com'),(90,'Tracey','dabhi','Rowley','host','06 Cedar Rd.Carol Stream, IL 60188','Tracey@Rowley.com'),(98,'Philip ','Compton','Forster','host','913 Brown Avenue Redford, MI 48239','Philip @Forster.com'),(99,'Tanya','Austin','Anderson','user','6 Devonshire Rd.Clementon, NJ 08021','Tanya@Anderson.com'),(100,'Margie','Hale','Quinn','user','229 S. Saxton St. Indianapolis, IN 46201','Margie@Quinn.com'),(101,'Janis','Bryant','Gibbs','user','862 Williams Ave. La Crosse, WI 54601','Janis@Gibbs.com'),(102,'Sandy','Zimmerman','Collins','user','7202 Greystone Street Sidney, OH 45365','Sandy@Collins.com'),(103,'Gene','Hardy','Townsend','user','9712 mary alexander road','Gene@Townsend.com'),(104,'Wallace','Morris','Barber','user','862 Williams Ave. La Crosse, WI 54601','Wallace@Barber.com'),(105,'Lucas','Garza','Hill','user','7202 Greystone Street Sidney, OH 45365','Lucas@Hill.com'),(106,'Jermaine','Reynolds','Mcdaniel','user','913 Brown Avenue Redford, MI 48239','Jermaine@Mcdaniel.com'),(107,'Jeff','Copeland','Spencer','user','229 S. Saxton St. Indianapolis, IN 46201','Jeff@Spencer.com'),(108,'Ross','Ford','Gill','user','117 Poplar Lane Loveland, OH 45140','Ross@Gill.com'),(109,'Pauline','Sparks','Logan','user','7202 Greystone Street Sidney, OH 45365','Pauline@Logan.com'),(110,'Lee','Cunningham','Austin','user','9712 mary alexander road','Lee@Austin.com'),(111,'Kathy','Aguilar','Hale','user','416 Hilltop St.Groton, CT 06340','Kathy@Hale.com'),(112,'Lionel','Foster','Bryant','user','229 S. Saxton St. Indianapolis, IN 46201','Lionel@Bryant.com');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`adminkhanderao`@`%`*/ /*!50003 TRIGGER Log_UserTableDeletion
AFTER DELETE
   ON   Heavy.User FOR EACH ROW

BEGIN

   DECLARE vUser varchar(50);
   SELECT USER() INTO vUser;
	
   INSERT INTO DeleteLog
   ( contact_id,
     deleted_date,
     deleted_by,Table_Affected)
   VALUES
   ( contact_id,
     SYSDATE(),
     vUser,'User' );

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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`adminkhanderao`@`%`*/ /*!50003 trigger Archive_user_Info
after delete 
on Heavy.User for each row
insert into User_Archive
set 
User_ID=old.User_ID,
User_First_Name=old.User_First_Name,
User_Middle_Name=old.User_Middle_Name,
User_Last_Name=old.User_Last_Name,
User_type=old.User_type,
User_Address=old.User_Address,
User_email=old.User_email */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `User_Archive`
--

DROP TABLE IF EXISTS `User_Archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User_Archive` (
  `User_ID` int(11) NOT NULL,
  `User_First_Name` varchar(45) NOT NULL,
  `User_Middle_Name` varchar(45) NOT NULL,
  `User_Last_Name` varchar(45) NOT NULL,
  `User_type` varchar(45) NOT NULL,
  `User_Address` varchar(45) NOT NULL,
  `User_email` varchar(45) NOT NULL,
  PRIMARY KEY (`User_ID`),
  KEY `idx_name` (`User_First_Name`,`User_Middle_Name`,`User_Last_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User_Archive`
--

LOCK TABLES `User_Archive` WRITE;
/*!40000 ALTER TABLE `User_Archive` DISABLE KEYS */;
INSERT INTO `User_Archive` VALUES (452,'Rahul','u','Dravid','user','229 S. Saxton St. Indianapolis, IN 46201','Lionel@Bryant.com');
/*!40000 ALTER TABLE `User_Archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User_Feedback`
--

DROP TABLE IF EXISTS `User_Feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User_Feedback` (
  `Feedback_id` int(11) NOT NULL,
  `User_Rating` int(11) DEFAULT NULL,
  `User_Feedback` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Feedback_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User_Feedback`
--

LOCK TABLES `User_Feedback` WRITE;
/*!40000 ALTER TABLE `User_Feedback` DISABLE KEYS */;
INSERT INTO `User_Feedback` VALUES (111,4,'Satisfied'),(112,1,'do not go here'),(113,2,'no complimantaries'),(114,3,'charged more for mediocre service'),(115,5,'worth every penny'),(116,4,'liked it'),(117,2,'untidy'),(118,3,'not for family'),(119,4,'decent'),(120,5,'loved it'),(121,4,'decent'),(122,5,'very good place '),(123,5,'loved this place'),(124,5,'very good serivce'),(125,5,'worth every penny'),(126,5,'really satisfied'),(222,2,'Very bad service'),(223,3,'not on par with cost'),(224,4,'liked the serrvice'),(225,4,'definetly go to this place'),(226,4,'good service'),(227,2,'not coming back'),(228,5,'service is very good'),(333,5,'Very Satisfied'),(334,1,'Very bad service '),(335,2,'not good service'),(336,3,'mediocre'),(337,5,'so good'),(338,4,'Satisfied'),(339,2,'not recomonded');
/*!40000 ALTER TABLE `User_Feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'Heavy'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `Event_For_TotalDiscount_Provided` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'UTC' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`adminkhanderao`@`%`*/ /*!50106 EVENT `Event_For_TotalDiscount_Provided` ON SCHEDULE AT '2020-05-24 18:12:01' ON COMPLETION PRESERVE ENABLE DO drop View if exists Total_Discounts_Provided */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
/*!50106 DROP EVENT IF EXISTS `Event_For_TotalIncome_Generated` */;;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'UTC' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`adminkhanderao`@`%`*/ /*!50106 EVENT `Event_For_TotalIncome_Generated` ON SCHEDULE AT '2020-05-24 18:12:01' ON COMPLETION PRESERVE ENABLE DO drop View if exists TotalIncome_Generated */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'Heavy'
--
/*!50003 DROP PROCEDURE IF EXISTS `AdminView` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminkhanderao`@`%` PROCEDURE `AdminView`(in LoginID  int(11),
in passwords  int(11)
)
Begin
show full tables
where
EXISTS(SELECT * from Admin WHERE Loginid=LoginID and Password = passwords);


end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAccomidationInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminkhanderao`@`%` PROCEDURE `GetAccomidationInfo`(
Destination varchar(45),
Checkindate date,
checkoutdate date,
guests int(11))
Begin
SELECT
	DestinationName as City,Dest_Country as Country,
    Address_Of_Accommodation,
    Accomodation_Type,
	CheckInDate,
    CheckOutDate,
    DurationOfStay,
    NumberOfGuests
     
FROM Accommodation A
left join  ACCOMODATION_DESTINATION ad on ad.Accomodation_Ids = A.Accomodation_Id
left join Destination d on d.Destination_ID=ad.Destination_ID
where CheckInDate = Checkindate	 and
CheckOutDate = checkoutdate and
NumberOfGuests = guests
and  DestinationName = Destination;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Mychats` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adminkhanderao`@`%` PROCEDURE `Mychats`(Mymailid varchar(45))
begin 
SELECT SenderMailId as 'From' ,ReceiverMailID as 'TO', Body as 'Message', Timestamp as "ON" from Message
where SenderMailId = Mymailid or ReceiverMailID = Mymailid;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `GetHostInfo`
--

/*!50001 DROP VIEW IF EXISTS `GetHostInfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`adminkhanderao`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `GetHostInfo` AS select concat(`u`.`User_First_Name`,' ',`u`.`User_Middle_Name`,' ',`u`.`User_Last_Name`) AS `Name of Host`,`u`.`User_email` AS `Email`,`d`.`DestinationName` AS `city`,`a`.`Address_Of_Accommodation` AS `Accomodation Addres` from ((((`User` `u` join `USER_DESTINATION_CR` `ud` on((`ud`.`Userid` = `u`.`User_ID`))) join `Destination` `d` on((`d`.`Destination_ID` = `ud`.`destinationid`))) join `ACCOMODATION_DESTINATION` `ad` on((`ad`.`Destination_ID` = `ud`.`destinationid`))) join `Accommodation` `a` on((`a`.`Accomodation_Id` = `ad`.`Accomodation_Ids`))) where (`u`.`User_type` = 'host') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Heavy.Payment_total`
--

/*!50001 DROP VIEW IF EXISTS `Heavy.Payment_total`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`adminkhanderao`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Heavy.Payment_total` AS select `Payment`.`TransactionID` AS `TransactionID`,`Payment`.`Room_Rent` AS `Room_Rent`,`Discount`.`Discount_Percentage` AS `Discount Percentage`,`Payment`.`Miscellaneous_charges` AS `Miscellaneous_charges`,concat(cast(`Payment`.`Payment_date` as date),'-',year(`Payment`.`Payment_date`)) AS `Month`,sum(((`Payment`.`Room_Rent` + `Payment`.`Miscellaneous_charges`) - ((`Payment`.`Room_Rent` * `Discount`.`Discount_Percentage`) / 100))) AS `Total Income` from ((`Payment` join `PAYMENT_DISCOUNT` on((`Payment`.`TransactionID` = `PAYMENT_DISCOUNT`.`TransactionID`))) join `Discount` on((`PAYMENT_DISCOUNT`.`Discount_Code` = `Discount`.`Discount_Code`))) group by cast(`Payment`.`Payment_date` as date) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `TotalIncome_Generated`
--

/*!50001 DROP VIEW IF EXISTS `TotalIncome_Generated`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`adminkhanderao`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `TotalIncome_Generated` AS select concat(month(`Payment`.`Payment_date`),'-',year(`Payment`.`Payment_date`)) AS `Month`,sum(((`Payment`.`Room_Rent` + `Payment`.`Miscellaneous_charges`) - ((`Payment`.`Room_Rent` * `Discount`.`Discount_Percentage`) / 100))) AS `Total Income` from ((`Payment` join `PAYMENT_DISCOUNT` on((`Payment`.`TransactionID` = `PAYMENT_DISCOUNT`.`TransactionID`))) join `Discount` on((`PAYMENT_DISCOUNT`.`Discount_Code` = `Discount`.`Discount_Code`))) group by month(`Payment`.`Payment_date`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Total_Discounts_Provided`
--

/*!50001 DROP VIEW IF EXISTS `Total_Discounts_Provided`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`adminkhanderao`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Total_Discounts_Provided` AS select concat(month(`Payment`.`Payment_date`),'-',year(`Payment`.`Payment_date`)) AS `Month`,sum(((`Payment`.`Room_Rent` * `Discount`.`Discount_Percentage`) / 100)) AS `Total Discount provided in dollars` from ((`Payment` join `PAYMENT_DISCOUNT` on((`Payment`.`TransactionID` = `PAYMENT_DISCOUNT`.`TransactionID`))) join `Discount` on((`PAYMENT_DISCOUNT`.`Discount_Code` = `Discount`.`Discount_Code`))) group by month(`Payment`.`Payment_date`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-24 15:34:34
