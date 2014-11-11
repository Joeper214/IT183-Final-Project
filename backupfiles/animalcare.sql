-- MySQL dump 10.13  Distrib 5.6.20, for Linux (x86_64)
--
-- Host: localhost    Database: animalcare
-- ------------------------------------------------------
-- Server version	5.6.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `pet`
--

DROP TABLE IF EXISTS `pet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pet` (
  `PetNumber` int(11) NOT NULL,
  `PetName` varchar(15) NOT NULL,
  `PetType` varchar(15) NOT NULL,
  `OwnerID` int(11) DEFAULT NULL,
  PRIMARY KEY (`PetNumber`),
  KEY `OwnerID` (`OwnerID`),
  CONSTRAINT `fk_owner` FOREIGN KEY (`OwnerID`) REFERENCES `petowner` (`OwnerID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pet`
--

LOCK TABLES `pet` WRITE;
/*!40000 ALTER TABLE `pet` DISABLE KEYS */;
/*!40000 ALTER TABLE `pet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `petowner`
--

DROP TABLE IF EXISTS `petowner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `petowner` (
  `OwnerID` int(11) NOT NULL,
  `OwnerName` varchar(15) NOT NULL,
  `TownAddress` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`OwnerID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `petowner`
--

LOCK TABLES `petowner` WRITE;
/*!40000 ALTER TABLE `petowner` DISABLE KEYS */;
INSERT INTO `petowner` VALUES (100,'John','First Street'),(101,'Stacy',NULL),(102,'Adonis','Third Street'),(103,'Tanya','Central Ave'),(104,'Jerico',NULL),(105,'Juvie',NULL),(106,'Edong',NULL),(107,'Joeper',NULL),(108,'David',NULL);
/*!40000 ALTER TABLE `petowner` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-10-09 15:33:56
