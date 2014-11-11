-- MySQL dump 10.13  Distrib 5.5.36, for Linux (x86_64)
--
-- Host: localhost    Database: websites
-- ------------------------------------------------------
-- Server version	5.5.36

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
-- Table structure for table `ci_sessions`
--

DROP TABLE IF EXISTS `ci_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ci_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `peopleid` int(11) NOT NULL,
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `user_agent` varchar(50) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `left` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ci_sessions`
--

LOCK TABLES `ci_sessions` WRITE;
/*!40000 ALTER TABLE `ci_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `ci_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `domains`
--

DROP TABLE IF EXISTS `domains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domains` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `url` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `registrar` varchar(100) NOT NULL,
  `dateregd` int(11) NOT NULL DEFAULT '0',
  `cost` float NOT NULL DEFAULT '0',
  `regdfor` int(11) NOT NULL DEFAULT '0',
  `notes` blob NOT NULL,
  `pw` varchar(25) NOT NULL,
  `un` varchar(25) NOT NULL,
  `lastupdate` int(11) NOT NULL DEFAULT '0',
  `submit` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domains`
--

LOCK TABLES `domains` WRITE;
/*!40000 ALTER TABLE `domains` DISABLE KEYS */;
/*!40000 ALTER TABLE `domains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT 'not set',
  `type` enum('test','alert','report') NOT NULL,
  `testid` int(10) NOT NULL,
  `siteid` int(10) NOT NULL,
  `userid` int(10) NOT NULL,
  `reported` int(11) NOT NULL,
  `result` blob NOT NULL,
  `time` int(11) NOT NULL,
  `timetaken` float NOT NULL,
  `isalert` varchar(2) NOT NULL,
  `emailid` int(11) NOT NULL,
  `submit` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=69 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frequencies`
--

DROP TABLE IF EXISTS `frequencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frequencies` (
  `id` int(10) NOT NULL,
  `name` varchar(16) NOT NULL,
  `submit` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frequencies`
--

LOCK TABLES `frequencies` WRITE;
/*!40000 ALTER TABLE `frequencies` DISABLE KEYS */;
/*!40000 ALTER TABLE `frequencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hosts`
--

DROP TABLE IF EXISTS `hosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hosts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cost` float NOT NULL,
  `name` varchar(100) NOT NULL,
  `hosturl` varchar(100) NOT NULL,
  `un` varchar(50) NOT NULL,
  `pw` varchar(50) NOT NULL,
  `ns1url` varchar(36) NOT NULL,
  `ns1ip` varchar(36) NOT NULL,
  `ns2url` varchar(36) NOT NULL,
  `ns2ip` varchar(36) NOT NULL,
  `ftpurl` varchar(100) NOT NULL,
  `ftpserverip` varchar(36) NOT NULL,
  `ftpun` varchar(50) NOT NULL,
  `ftppw` varchar(50) NOT NULL,
  `cpurl` varchar(36) NOT NULL,
  `cpun` varchar(36) NOT NULL,
  `cppw` varchar(36) NOT NULL,
  `pop3server` varchar(36) NOT NULL,
  `servicetel` varchar(50) NOT NULL,
  `servicetel2` varchar(50) NOT NULL,
  `serviceemail` varchar(100) NOT NULL,
  `webroot` varchar(48) NOT NULL,
  `absoluteroot` varchar(48) NOT NULL,
  `cgiroot` varchar(48) NOT NULL,
  `booked` int(11) NOT NULL,
  `duration` int(11) NOT NULL,
  `lastupdate` int(11) NOT NULL DEFAULT '0',
  `submit` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hosts`
--

LOCK TABLES `hosts` WRITE;
/*!40000 ALTER TABLE `hosts` DISABLE KEYS */;
/*!40000 ALTER TABLE `hosts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `people`
--

DROP TABLE IF EXISTS `people`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `people` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(25) NOT NULL,
  `pw` varchar(25) NOT NULL,
  `status` smallint(3) NOT NULL DEFAULT '1',
  `name` varchar(50) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `email` varchar(120) NOT NULL,
  `lastupdate` int(11) NOT NULL DEFAULT '0',
  `submit` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `people`
--

LOCK TABLES `people` WRITE;
/*!40000 ALTER TABLE `people` DISABLE KEYS */;
/*!40000 ALTER TABLE `people` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sites` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `url` varchar(100) NOT NULL,
  `un` varchar(50) NOT NULL,
  `pw` varchar(50) NOT NULL,
  `client1` int(10) NOT NULL DEFAULT '0',
  `client2` int(10) NOT NULL DEFAULT '0',
  `admin1` int(10) NOT NULL DEFAULT '0',
  `admin2` int(10) NOT NULL DEFAULT '0',
  `domainid` int(10) NOT NULL DEFAULT '0',
  `hostid` int(10) NOT NULL DEFAULT '0',
  `webroot` varchar(50) NOT NULL,
  `files` text NOT NULL,
  `filesdate` int(11) NOT NULL DEFAULT '0',
  `lastupdate` int(11) NOT NULL DEFAULT '0',
  `submit` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tests`
--

DROP TABLE IF EXISTS `tests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) NOT NULL DEFAULT '0',
  `name` varchar(250) NOT NULL,
  `type` varchar(25) NOT NULL,
  `url` varchar(120) NOT NULL,
  `regex` varchar(250) NOT NULL,
  `p1` varchar(250) NOT NULL,
  `p2` varchar(250) NOT NULL,
  `p3` varchar(250) NOT NULL,
  `p4` varchar(250) NOT NULL,
  `p5` varchar(250) NOT NULL,
  `p6` varchar(250) NOT NULL,
  `frequency` int(10) NOT NULL DEFAULT '0',
  `lastdone` int(10) NOT NULL DEFAULT '0',
  `isalert` varchar(2) NOT NULL,
  `setup` int(10) NOT NULL DEFAULT '0',
  `lastupdate` int(10) NOT NULL DEFAULT '0',
  `notes` varchar(250) NOT NULL,
  `submit` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests`
--

LOCK TABLES `tests` WRITE;
/*!40000 ALTER TABLE `tests` DISABLE KEYS */;
/*!40000 ALTER TABLE `tests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `types`
--

DROP TABLE IF EXISTS `types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `types` (
  `id` varchar(7) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `types`
--

LOCK TABLES `types` WRITE;
/*!40000 ALTER TABLE `types` DISABLE KEYS */;
/*!40000 ALTER TABLE `types` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-09-07  6:50:39
