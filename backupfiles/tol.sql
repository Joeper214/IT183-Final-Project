-- MySQL dump 10.13  Distrib 5.5.36, for Linux (x86_64)
--
-- Host: localhost    Database: moco
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
-- Table structure for table `announcement`
--

DROP TABLE IF EXISTS `announcement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcement` (
  `ann_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ic_id` int(10) unsigned NOT NULL,
  `title` varchar(100) NOT NULL,
  `ann_stmt` text NOT NULL,
  `date_posted` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_edited` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ann_id`),
  KEY `ic_id` (`ic_id`),
  CONSTRAINT `announcement_ibfk_1` FOREIGN KEY (`ic_id`) REFERENCES `instructorcourserecord` (`ic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcement`
--

LOCK TABLES `announcement` WRITE;
/*!40000 ALTER TABLE `announcement` DISABLE KEYS */;
INSERT INTO `announcement` VALUES (1,2,'dasdasd','<p>sdsadassdsd</p>','2014-08-30 02:50:37','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `announcement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ass_submission`
--

DROP TABLE IF EXISTS `ass_submission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ass_submission` (
  `assign_sub_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `scr_id` int(10) unsigned NOT NULL,
  `file_url` varchar(100) NOT NULL,
  `date_submitted` date NOT NULL,
  `rating` float DEFAULT '0',
  `assign_id` int(11) NOT NULL,
  `message` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`assign_sub_id`),
  KEY `scr_id` (`scr_id`),
  CONSTRAINT `ass_submission_ibfk_1` FOREIGN KEY (`scr_id`) REFERENCES `studentcourserecord` (`scr_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ass_submission`
--

LOCK TABLES `ass_submission` WRITE;
/*!40000 ALTER TABLE `ass_submission` DISABLE KEYS */;
INSERT INTO `ass_submission` VALUES (1,2,'Globally Competitive MSU.docx','2014-09-04',0,2,NULL);
/*!40000 ALTER TABLE `ass_submission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assignment`
--

DROP TABLE IF EXISTS `assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assignment` (
  `assign_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ic_id` int(10) unsigned NOT NULL,
  `instruction` text NOT NULL,
  `inst_material` varchar(100) NOT NULL,
  `due_date` date NOT NULL,
  `date_available` date NOT NULL,
  `title` varchar(45) NOT NULL,
  PRIMARY KEY (`assign_id`),
  KEY `ic_id` (`ic_id`),
  CONSTRAINT `assignment_ibfk_1` FOREIGN KEY (`ic_id`) REFERENCES `instructorcourserecord` (`ic_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignment`
--

LOCK TABLES `assignment` WRITE;
/*!40000 ALTER TABLE `assignment` DISABLE KEYS */;
INSERT INTO `assignment` VALUES (1,2,'<p>Sdsa</p>','','2014-09-01','2014-08-31','Sample 1'),(2,2,'<p>asdasdsad</p>','','2014-09-10','2014-09-03','Sawa');
/*!40000 ALTER TABLE `assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chapter`
--

DROP TABLE IF EXISTS `chapter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chapter` (
  `ch_id` int(11) NOT NULL AUTO_INCREMENT,
  `ic_id` int(10) unsigned NOT NULL,
  `title` varchar(100) NOT NULL,
  `seq_no` int(11) NOT NULL,
  PRIMARY KEY (`ch_id`),
  KEY `ic_id` (`ic_id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chapter`
--

LOCK TABLES `chapter` WRITE;
/*!40000 ALTER TABLE `chapter` DISABLE KEYS */;
INSERT INTO `chapter` VALUES (29,2,'sdsadasd',2),(30,2,'sdsadsad',1);
/*!40000 ALTER TABLE `chapter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `course_id` varchar(10) NOT NULL,
  `course_desc` varchar(100) NOT NULL,
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES ('Csc 101x','Solving Machine Problems'),('Csc 121','Data Structures'),('Ko','Solving Machine Problems');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_key`
--

DROP TABLE IF EXISTS `course_key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_key` (
  `ck_id` int(11) NOT NULL AUTO_INCREMENT,
  `ck_key` varchar(5) NOT NULL,
  `ic_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ck_id`),
  KEY `ic_id` (`ic_id`),
  CONSTRAINT `ck_fk1` FOREIGN KEY (`ic_id`) REFERENCES `instructorcourserecord` (`ic_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_key`
--

LOCK TABLES `course_key` WRITE;
/*!40000 ALTER TABLE `course_key` DISABLE KEYS */;
INSERT INTO `course_key` VALUES (1,'vUyHS',2);
/*!40000 ALTER TABLE `course_key` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employees` (
  `IDNUMBER` int(11) NOT NULL,
  `LASTNAME` varchar(50) NOT NULL,
  `FIRSTNAME` varchar(50) NOT NULL,
  `MIDDLENAME` varchar(50) DEFAULT NULL,
  `HOMEADDRESS` varchar(200) DEFAULT NULL,
  `PHONE` varchar(50) DEFAULT NULL,
  `PASS_WORD` varchar(30) DEFAULT NULL,
  `ACTIVESERVICE` int(11) DEFAULT NULL,
  `SIGNATURE` blob,
  `PICTURE` blob,
  `POSITIONRANK` varchar(100) DEFAULT NULL,
  `GENDER` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`IDNUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (10003,'Bayron','Jofel','Butay','Tagum City Davao del Norte','09882832','byrenx',1,NULL,NULL,'Professor','Male');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `identification`
--

DROP TABLE IF EXISTS `identification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `identification` (
  `ident_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(11) unsigned NOT NULL,
  `ans` varchar(100) NOT NULL,
  PRIMARY KEY (`ident_id`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `identification_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `identification`
--

LOCK TABLES `identification` WRITE;
/*!40000 ALTER TABLE `identification` DISABLE KEYS */;
INSERT INTO `identification` VALUES (1,5,'Toshiba'),(2,9,'check');
/*!40000 ALTER TABLE `identification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructorcourserecord`
--

DROP TABLE IF EXISTS `instructorcourserecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instructorcourserecord` (
  `ic_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` varchar(10) NOT NULL,
  `IDNUMBER` int(11) NOT NULL,
  `course_overview` text NOT NULL,
  `course_type` tinyint(4) NOT NULL DEFAULT '1',
  `date_start` date NOT NULL,
  `date_end` date NOT NULL,
  `status` bit(1) NOT NULL,
  PRIMARY KEY (`ic_id`),
  KEY `course_id` (`course_id`),
  KEY `IDNUMBER` (`IDNUMBER`),
  CONSTRAINT `instructorcourserecord_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON UPDATE CASCADE,
  CONSTRAINT `instructorcourserecord_ibfk_2` FOREIGN KEY (`IDNUMBER`) REFERENCES `employees` (`IDNUMBER`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructorcourserecord`
--

LOCK TABLES `instructorcourserecord` WRITE;
/*!40000 ALTER TABLE `instructorcourserecord` DISABLE KEYS */;
INSERT INTO `instructorcourserecord` VALUES (2,'Csc 101x',10003,'This course compose of lecture and laboratory works. For lecture the topics would be different approches and techniques on solving machine problems. In this class we will discuss the different classifications of programming problems and ways to solve them using some several existing algorithms. In this course there will a lot of machine problem solving exercises which comprise the 70% of the students overall grades. For the finals there will be a programming competition for the class.',1,'2014-08-30','2014-10-31','\0'),(3,'Csc 121',10003,'',0,'0000-00-00','0000-00-00','\0'),(4,'Ko',10003,'dfdfdfdf dfdgfdgfgfdg gfdgfdg',2,'0000-00-00','0000-00-00','\0');
/*!40000 ALTER TABLE `instructorcourserecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item` (
  `item_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `test_id` int(10) unsigned NOT NULL,
  `item_type` tinyint(3) unsigned NOT NULL,
  `question` text NOT NULL,
  `points` float DEFAULT '0',
  PRIMARY KEY (`item_id`),
  KEY `test_id` (`test_id`),
  CONSTRAINT `item_ibfk_1` FOREIGN KEY (`test_id`) REFERENCES `test` (`test_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,1,1,'Laptop?',1),(2,1,1,'Netbook?',1),(3,1,2,'Best model is Acer?',1),(4,1,3,'                  Your model is Acer?',1),(5,1,4,'What is the good flashdisk brand?',1),(6,2,1,'1',1),(7,2,2,'True',1),(8,2,3,'                  False',1),(9,2,4,'test',1),(10,2,3,'                  False',1),(11,2,3,'                  False2',1),(12,3,2,'asdasd',1),(13,4,2,'asdsad',31);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `add_item_points` AFTER INSERT ON `item`
 FOR EACH ROW begin     

	UPDATE test    

	SET total_points = total_points + NEW.points,

	    total_items = (total_items + 1)

        WHERE test_id=NEW.test_id;

end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_item_points` AFTER UPDATE ON `item`
 FOR EACH ROW begin 



    UPDATE test



    SET total_points = total_points + NEW.points - OLD.points



    WHERE test_id=NEW.test_id;



end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `del_item_update_points` AFTER DELETE ON `item`
 FOR EACH ROW begin







   UPDATE test



   SET total_items = (total_items - 1),

       total_points = (total_points - OLD.points)



   WHERE test_id=OLD.test_id;







end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `lect_mat`
--

DROP TABLE IF EXISTS `lect_mat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lect_mat` (
  `lectmat_id` int(11) NOT NULL AUTO_INCREMENT,
  `lect_id` int(11) NOT NULL,
  `file_url` varchar(100) NOT NULL,
  `file_type` varchar(45) NOT NULL,
  PRIMARY KEY (`lectmat_id`),
  KEY `lect_id` (`lect_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lect_mat`
--

LOCK TABLES `lect_mat` WRITE;
/*!40000 ALTER TABLE `lect_mat` DISABLE KEYS */;
INSERT INTO `lect_mat` VALUES (16,62,'Moco June 17, 2014.docx','docx');
/*!40000 ALTER TABLE `lect_mat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lecture`
--

DROP TABLE IF EXISTS `lecture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lecture` (
  `lect_id` int(11) NOT NULL AUTO_INCREMENT,
  `ch_id` int(11) NOT NULL,
  `tittle` varchar(100) NOT NULL,
  `seq_no` int(11) NOT NULL,
  PRIMARY KEY (`lect_id`),
  KEY `ch_id` (`ch_id`)
) ENGINE=MyISAM AUTO_INCREMENT=63 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecture`
--

LOCK TABLES `lecture` WRITE;
/*!40000 ALTER TABLE `lecture` DISABLE KEYS */;
INSERT INTO `lecture` VALUES (62,29,'sdsd',0);
/*!40000 ALTER TABLE `lecture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpchoice`
--

DROP TABLE IF EXISTS `mpchoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpchoice` (
  `choice_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(11) unsigned NOT NULL,
  `choice_val` varchar(100) NOT NULL,
  `iscorrect` tinyint(1) NOT NULL,
  `c_no` tinyint(4) NOT NULL,
  PRIMARY KEY (`choice_id`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `mpchoice_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpchoice`
--

LOCK TABLES `mpchoice` WRITE;
/*!40000 ALTER TABLE `mpchoice` DISABLE KEYS */;
INSERT INTO `mpchoice` VALUES (1,1,'Lennovo',1,1),(2,1,'HP',0,2),(3,1,'Apple',0,3),(4,1,'Acer',0,4),(5,2,'Lennovo',0,1),(6,2,'HP',0,2),(7,2,'Apple',0,3),(8,2,'Acer',1,4),(9,6,'1',1,1),(10,6,'2',0,2),(11,6,'3',0,3),(12,6,'4',0,4);
/*!40000 ALTER TABLE `mpchoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_f`
--

DROP TABLE IF EXISTS `mt_f`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mt_f` (
  `mtf_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(11) unsigned NOT NULL,
  `ans` varchar(100) NOT NULL,
  PRIMARY KEY (`mtf_id`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `mt_f_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_f`
--

LOCK TABLES `mt_f` WRITE;
/*!40000 ALTER TABLE `mt_f` DISABLE KEYS */;
INSERT INTO `mt_f` VALUES (1,4,'Lenovo'),(2,8,'false'),(3,10,'false1'),(4,11,'false13');
/*!40000 ALTER TABLE `mt_f` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mtf_ans`
--

DROP TABLE IF EXISTS `mtf_ans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtf_ans` (
  `mtfa_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(11) unsigned NOT NULL,
  `strec_id` int(10) unsigned NOT NULL,
  `ans` varchar(100) NOT NULL,
  PRIMARY KEY (`mtfa_id`),
  KEY `item_id` (`item_id`),
  KEY `strec_id` (`strec_id`),
  CONSTRAINT `mtf_ans_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`) ON UPDATE CASCADE,
  CONSTRAINT `mtf_ans_ibfk_2` FOREIGN KEY (`strec_id`) REFERENCES `studenttestrec` (`strec_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mtf_ans`
--

LOCK TABLES `mtf_ans` WRITE;
/*!40000 ALTER TABLE `mtf_ans` DISABLE KEYS */;
/*!40000 ALTER TABLE `mtf_ans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stud_ident_ans`
--

DROP TABLE IF EXISTS `stud_ident_ans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stud_ident_ans` (
  `sia_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(11) unsigned NOT NULL,
  `strec_id` int(10) unsigned NOT NULL,
  `ans` varchar(100) NOT NULL,
  PRIMARY KEY (`sia_id`),
  KEY `item_id` (`item_id`),
  KEY `strec_id` (`strec_id`),
  CONSTRAINT `stud_ident_ans_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`) ON UPDATE CASCADE,
  CONSTRAINT `stud_ident_ans_ibfk_2` FOREIGN KEY (`strec_id`) REFERENCES `studenttestrec` (`strec_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stud_ident_ans`
--

LOCK TABLES `stud_ident_ans` WRITE;
/*!40000 ALTER TABLE `stud_ident_ans` DISABLE KEYS */;
INSERT INTO `stud_ident_ans` VALUES (1,5,4,''),(2,9,6,''),(3,9,7,'<b>baho ka!</b>');
/*!40000 ALTER TABLE `stud_ident_ans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stud_mpc_ans`
--

DROP TABLE IF EXISTS `stud_mpc_ans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stud_mpc_ans` (
  `stmpca_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `strec_id` int(10) unsigned NOT NULL,
  `item_id` int(11) unsigned NOT NULL,
  `choice_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`stmpca_id`),
  KEY `strec_id` (`strec_id`),
  KEY `item_id` (`item_id`),
  KEY `choice_id` (`choice_id`),
  CONSTRAINT `stud_mpc_ans_ibfk_1` FOREIGN KEY (`strec_id`) REFERENCES `studenttestrec` (`strec_id`) ON UPDATE CASCADE,
  CONSTRAINT `stud_mpc_ans_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`) ON UPDATE CASCADE,
  CONSTRAINT `stud_mpc_ans_ibfk_3` FOREIGN KEY (`choice_id`) REFERENCES `mpchoice` (`choice_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stud_mpc_ans`
--

LOCK TABLES `stud_mpc_ans` WRITE;
/*!40000 ALTER TABLE `stud_mpc_ans` DISABLE KEYS */;
INSERT INTO `stud_mpc_ans` VALUES (1,7,6,10);
/*!40000 ALTER TABLE `stud_mpc_ans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stud_mtf_ans`
--

DROP TABLE IF EXISTS `stud_mtf_ans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stud_mtf_ans` (
  `smtfa_id` int(10) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `strec_id` int(10) NOT NULL,
  `ans` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`smtfa_id`),
  KEY `item_id` (`item_id`),
  KEY `strec_id` (`strec_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stud_mtf_ans`
--

LOCK TABLES `stud_mtf_ans` WRITE;
/*!40000 ALTER TABLE `stud_mtf_ans` DISABLE KEYS */;
INSERT INTO `stud_mtf_ans` VALUES (1,4,4,''),(2,10,6,''),(3,11,6,''),(4,8,6,''),(5,8,7,'True'),(6,10,7,'false'),(7,11,7,'True');
/*!40000 ALTER TABLE `stud_mtf_ans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stud_tf_ans`
--

DROP TABLE IF EXISTS `stud_tf_ans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stud_tf_ans` (
  `stfa_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(11) unsigned NOT NULL,
  `strec_id` int(10) unsigned NOT NULL,
  `ans` tinyint(1) NOT NULL,
  PRIMARY KEY (`stfa_id`),
  KEY `item_id` (`item_id`),
  KEY `strec_id` (`strec_id`),
  CONSTRAINT `stud_tf_ans_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`) ON UPDATE CASCADE,
  CONSTRAINT `stud_tf_ans_ibfk_2` FOREIGN KEY (`strec_id`) REFERENCES `studenttestrec` (`strec_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stud_tf_ans`
--

LOCK TABLES `stud_tf_ans` WRITE;
/*!40000 ALTER TABLE `stud_tf_ans` DISABLE KEYS */;
INSERT INTO `stud_tf_ans` VALUES (1,12,3,1),(2,7,7,0);
/*!40000 ALTER TABLE `stud_tf_ans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentaccounts`
--

DROP TABLE IF EXISTS `studentaccounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studentaccounts` (
  `IDNUMBER` int(11) NOT NULL,
  `PASS_WORD` varchar(50) NOT NULL,
  `DAYSVALID` int(11) NOT NULL,
  `DATECREATED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `STUDENTACCOUNT_UNIQUE` (`IDNUMBER`),
  CONSTRAINT `studentaccounts_ibfk_1` FOREIGN KEY (`IDNUMBER`) REFERENCES `students` (`IDNUMBER`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `studentaccounts_ibfk_2` FOREIGN KEY (`IDNUMBER`) REFERENCES `students` (`IDNUMBER`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentaccounts`
--

LOCK TABLES `studentaccounts` WRITE;
/*!40000 ALTER TABLE `studentaccounts` DISABLE KEYS */;
INSERT INTO `studentaccounts` VALUES (1048064,'352415',365,'0000-00-00 00:00:00'),(1058167,'126063',365,'0000-00-00 00:00:00'),(1059897,'825542',365,'0000-00-00 00:00:00'),(12345678,'boychu',0,'2014-09-04 15:25:47');
/*!40000 ALTER TABLE `studentaccounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentcourserecord`
--

DROP TABLE IF EXISTS `studentcourserecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studentcourserecord` (
  `scr_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `IDNUMBER` int(11) NOT NULL,
  `ic_id` int(10) unsigned NOT NULL,
  `date_joined` date NOT NULL,
  PRIMARY KEY (`scr_id`),
  KEY `IDNUMBER` (`IDNUMBER`),
  KEY `ic_id` (`ic_id`),
  CONSTRAINT `studentcourserecord_ibfk_1` FOREIGN KEY (`IDNUMBER`) REFERENCES `students` (`IDNUMBER`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `studentcourserecord_ibfk_2` FOREIGN KEY (`ic_id`) REFERENCES `instructorcourserecord` (`ic_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentcourserecord`
--

LOCK TABLES `studentcourserecord` WRITE;
/*!40000 ALTER TABLE `studentcourserecord` DISABLE KEYS */;
INSERT INTO `studentcourserecord` VALUES (2,1058167,2,'2014-09-03'),(3,12345678,2,'2014-09-04');
/*!40000 ALTER TABLE `studentcourserecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `students` (
  `IDNUMBER` int(11) NOT NULL,
  `FIRSTNAME` varchar(50) NOT NULL,
  `MIDDLENAME` varchar(30) NOT NULL,
  `LASTNAME` varchar(30) NOT NULL,
  `COURSE` varchar(100) DEFAULT NULL,
  `SEX` varchar(6) DEFAULT 'Female',
  `PICTURE` blob,
  PRIMARY KEY (`IDNUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1048064,'Zenny','Becina','DELA CRUZ','BS Information Technology (Database Systems)','Female','[BINARY]'),(1058167,'Joeper','Pantaleon','SERRANO','BS Information Technology (Database Systems)','Male','[BINARY]'),(1059897,'Jofel','B','BAYRON','BS Information Technology (Database Systems)','Male','[BINARY]'),(12345678,'Alberto','Martinez','Ocampo','BS Physics','Male','����\0JFIF\0\0\0\0\0\0��\0*\0��ICC_PROFILE\0\0\0lcms\0\0mntrRGB XYZ �\0\0\0\0)\09acspAPPL\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\0\0\0\0\0�-lcms\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\ndesc\0\0\0�\0\0\0^cprt\0\0\\\0\0\0wtpt\0\0h\0\0\0bkpt\0\0|\0\0\0rXYZ\0\0�\0\0\0gXYZ\0\0�\0\0\0bXYZ\0\0�\0\0\0rTRC\0\0�\0\0\0@gTRC\0\0�\0\0\0@bTRC\0\0�\0\0\0@desc\0\0\0\0\0\0\0c2\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0text\0\0\0\0FB\0\0XYZ \0\0\0\0\0\0��\0\0\0\0\0�-XYZ \0\0\0\0\0\0\0\03\0\0�XYZ \0\0\0\0\0\0o�\0\08�\0\0�XYZ \0\0\0\0\0\0b�\0\0��\0\0�XYZ \0\0\0\0\0\0$�\0\0�\0\0��curv\0\0\0\0\0\0\0\Z\0\0\0��c�k�?Q4!�)�2;�FQw]�kpz���|�i�}���0����\0C\0		\n\n	\r\r\"##!  %*5-%\'2(  .?/279<<<$-BFA:F5;<9��\0C\n\n\n9& &99999999999999999999999999999999999999999999999999��\0��\0\"\0��\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\0\0\0\0\0\0\0\0\0\0\0\0\0��\0\0\0\0\0\0\0\0\0\0\0\0\0��\0\0\0\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0V�IZż��nР�=L��������������������6�9�J\0\0\0\0�ͧB�x\0\0\0\0\0\0\0\0\0\0\0\0\0�n�����U���˘qd�Ke�4�xzF$��Il��6*l���h�v�,k�s��\0\0\0E������Qtu�$���\012\0��\0\0\0\0\0\0\0\0\r[u%_+�r;�*�)�ô�\\cK��u$����;*{z-N~�E�@��ؤ�V{��!j�dm�\Z��wk�s\"ƺ�:	@\0\0�A>uw���?���:n\nGVq^�(���{��g�~�s<?mʘ_X�G���y�L>�yK�xF��g~u�V\'���X�{>�\0\0\0\0\0j۩*����Ǝ�zʪ����\0�w��}n�G�N������\0� v\\g`m�.}cy6m�zG���l���E�u�t�\0\0 O�>c���VYBY��+5$p�����_ ��stv�G�8�Æ9{Z���O4�\'.�����%$�J��~��I����\0\0\0\0\0j۩*��˛ԫ��b���5I���R.R:�T���jף�z�4����V����T�ZX��Wc�Ň}�9��t�^��c]c��\0\0\n�g��;\r�W)�LNbSnq��8��i�>I�X�?��DC���\r��q�_�|�o�\'�|��(J�M�����9��D8�ۙ%�\0\0\0\0�n��Ϟ��W)d�>���ҕ<��/~]�c�=�J���ԺÙ��9�+���֑�a���=�=�\Z��%\0�����.�^~�8ܠg۟�r�.=y��Խy��v<�E\n�y�e\r���D����o8~㞼��������x������ˎg���\Z:ڽ��Y��Ku�����\0\0\0\0շRU\r��c��q=\\��S�w<,t��W/{���l����,}�P׮�w�d�w�n����R߅��E�u�t��G?2�y\ZT�r�>����w�\\N�� gI�x�f�����a�STY�k.��ss����5;�~�\0��^��yt\\wM�r�\'7��s��{�}�\n\0\0\0V�IV7�=�7�@������$Y��ދ��+z_!�RYY��|�^r��-���;�櫦h;g��c]c��\0\0\n�:��=��w8b�^M���\"��n�=>}gO\\ZUȎ%�o�|S�۪��Zګ7��{Q���\\�K��y�W�1�MC�}}�w<��\0\0\0\r[u%X�kk�*ImwP�U��R�/}>������Z~����M�?99˺Ir�8��f���Vz	5�9�J\0\0\0���N>Lm�����׍������9l{<��׍�p=��9���Ƽ���x-yc�mԹ����&o/qO+S����5�������t�\0\0\0\r[u%X�P��r�%d��)�_u9>g�xG�MW	�M\'��-e�����y�^��` ,k�s��\0\0QnNgw������?Aoog��J�:,��_@k./��:����>z�Y��cc�{��|�x��B�\\5�O25�1�\0\0\0\0j۩*��4�P%�#��͂�\0\0\0\0\0\0$X�X�A(\0\0\0\0\0���P�-�:˥P�Ò�/�\0\0\0\0\0\0\0\0\0\05mԕcy\0\n_k3�ƍ��\0\0\0\0\0\0,k�s��\0\0\0\0\0�jD���Y���7U�˟��wt�M���P\0\0\0��Pu��\0\0\0\0����o \0��ҵ����ۆ���\0\0\0�\"�����5�9�J\0\0\0\0\0 ΂r���{�n+��_�kϏ���Q�{}C������w�?ð����_.e��\0�x���\0\0\0����o \0-�t�oٚ�k3E�\0\0A���K�-�,k�s��\0\0\0\0\0@��7k��A����0�Ǖ�\0�DG�~[�T�\01uLO#ȌE��\n��\0\0\0jۭ*^�����\ZfU�[o�VmO��\"4���������Y���P,#T�cJL^�5�9�J\0�e_W�[���G�`\04o��Ɲ���[24��+Ҁ��2�t�����ڛ`*㞚\\Wj�Ɛ�h\0\0\0\Z�kJ���ǣǣǣ�%��fu��=0�:l�J�o�>��[d3�N��D�ҏ�u�	��:�k��*�C�C����e�����K��~c��\Z��R�:\r\\�Hה��{�Y/(�rk\Z�\07j�\0����_;�\ng�dc����Վ�I���9e�?/ic&��\0\0\Z�k+Y7�YYYbL��I��g[x5���g���|-��{*���5�Y\r���ͪ���\\�y��,�O�j�\'���\"����\\MD�t5�[��J9�)6�CHTVJ	t����h��\0G�E�Ĵ�:����-ѯf�_1��k�G�J��~V�e�\0g�\\ɬ���CC\Z�Ke�3sӌs-�7k�Y�tb��\r������7={�}�m�\nnn�wʋ����+4��g3d7|��r��U�4�\0�͗���؝��;m�k��^�n���+e��եE��ѧ��ʪgm�[��$�IW�����C�$Q��ͤ	��-f��\0>�W)��žփ�\0\00�&��/�6�ҟl�O�Z�ӯI�N\Zn1�����e���&9�\r���S9�%悼�r�{A���y��a��Z�Y�9.���V\Z�|[Zٶr�n����F���9�K�9���q��>��Ĩt�(��bQs�ԧG/N�y���KD����9�Ǘ��\0\01�&��e������O��p��\"�\Z�yn�D�1��b\\o�Yzɦ5�Pcn�\0tV~��,dŕ\0�\0������FeEaY�����O|�מ����� �m�HwUE�U�vtѾ�@��:=�z�r�Ǟ�)��.���ؖ�@������*���^�1�n�3q�n�q�5?D�s��$X�\'Ue�֧�v�M�D��l��oӸ\0\0\0����J\"Y��s��v���uMѼA�ֳ+LY$=rJ�M��#yF��mב&�1�����պQV[U�8F��\Z+-kVV���R�(\0<��K՘�����K�HՄe\"/�z�I]�m4��4W˟A���v5;#������F9�X�,�}g5zHa�\0\0\0մq�.���4,k:��g^ܡ�����U�r�䌣Nm�Y�U��\0v��#�ߦ��Wi�i��w�&�\Z���AN��j��L+p9&9��yA��x��=Y�!�Q��A�奏2�߱:�]|k�;�g;:ji~Y��Ǉ*!\\��ۯ`\0\0\0��Y��%�I���Yr�rt���,�#y6)�N�1,��	z����-��FZ���k����[H�c�,U�r�,�U�Z̏�e����`7�se#}�;�Z̔�Ε��1d1d\\j.u���8��֨�*4#��� ��햘��x�5\n[���[�2\0\0\0��x��-�H�?FQ���U�M�Iw�u�t{wl�9��iצ%��@�������\\��H��Y?�v.+l�Md����^�8:w�s�3�UR��!���=��WG����\0�\Z�������h�]2���~�{Ǯ�h�}�l��\'~xx1�-����\0\0\08�ϐ.y�2#Lt���9\n�&���zJ�^q���8���4����D�ՄKο��^���\nqok�zZ��Տ�X����no��n��\0\nl��mK.�����#Eo�\n1/)Q���|��+���_Q��̪���-���(^�-Z3����e\ZO��==�\0\0\rf�$�g\'������� �q٦#I�wZae�\'���n�f��0�Ǝ��y�j�nGEK\"�+;�b�§�9����n�wԴY@\0\0\0��uZ�Vq�:��u�[��T�z6Ӷp����ͷ9��Z2�T\Z�]�Y��RL<�i]i}�װ\0\0\r|�O[�3�Ψ/,}�j���UgCETu���a^�G���>���=�aS�^�,%ͪ���\n8�\"9�5�!��@\0\0\0\0*-�3��1�l9���J�k�D�턭�����j0-����}�W��67���\0\0\0\0\0\0\0c���\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\09\n��\rvb���s����}�� Ֆb$��\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\03\0\0\0\0\0 !024\"$1#3@PB%5A`pC��\0\0\0�\0�S�r,�Yȳ�g)�E��9r,�Y�s�g\"�E��9r��9�s��\"�S��9r,�Yȳ�bfd�\0���f�]f:��\Z�[�������1,ƹi�[��S��\0N�geń�W�`߫�������U�mU.�ɴx�i�G.��;=��X��8�#(�Z�VUG$=o��`XC;l�J&����VR��Bb�*��~�\r����\\�G��huTSi�gN\\�\n�+ǿ�=���i{����4��jve�ʖ&��y����x�3�t߅��ߚ}�I[wB�`ؗiY��:z�z����է{����MX��l�+E�Y�5���qv��M�e;�m��u\r���eI�c%΋ٮ�\r~E��aR�i�+1`^���E��5.�j�X��s4�殡g�׍R�f�i��j���:�����=v{3Z������%\rm$��bXs]r����s�5�+�>V��u��B��Tj�L���\r*�9�� \r%�٦����o�ԧ{�}Ԣ�b=��߈?�{�hq�]Z��r�#J�(��*�NE9�Z�%�6?_��E\"�E��r�b���.�L�إ��j���ī�Y>��c�gR�ޟ���\0��\0�MMx��W���k���)ص�:�FB��<��X����H��K�:���>�]�vѾ.��;+���zzW��>m]:]A�V#��^�i�ۯ|�\Z�խ����B���\\h&\'�Z�X��*�bV���E���\0 �y��c{��ϩf����118�����s�\0�(Z`i	j+���f��4�\0*�����4��p����9��3��/H�w�\r����F�� ���㇆�����\07L�=�����_;:��]Z#cO�lwkZ�y��)��.��)�t��T���f�?���`��_���^�XZ����\0�k	�]���c^)�\'�l�ʞU��fk?&���;TWJޜ��Jwu�US6�|�F�sL�:��]�UU���T����2e&ML�M�<�횿�\ZOλ;ۥy	���#��_�T�\"޷?���Qzu�z���J��0Z��KA�vR6��5�\'ΫʳOX�C�q��\0������qi�tV�k��\0���ԩw��hw<�\0�V�\\O��f�F����fj4�a��\Zm�=J�Y\n���~�H���֕:�Uw(�u��ߧ�2�QQ&��U�\Zu��T��Y@�T�bji�&�b��zyW|i�~��eM8�a�[Ϥ34�=����\n�N���R�k���ڜ���UM	fX��#6j&�}*�F�R%HZc\Z�;>�S\0#-i���4Ɯv[��y[OMb�\Z�}�U��U��=�??P3��_d�Fu\"`�f#:��@��s\n=���E)�m8���Y��c\"��c�Qs���Әl^]�}a�� (1�EƳ�O�5���d����ެbfeX�m�w���j�f��aj��A��D\'���g���O��͐�^��zdju�����f�,��b����3�f��:����?Ǯ~��i������J���G��?f�K\r0m���%�����~�U�����z)��im�3T�9M�;e\0R��G��oI�I}�z�T�g&&0G�,!a��ڷ[ώ���Z�|�|4�2���J�#eϕWʶ���{uB�vBaz$��߻K����Դϝ�G�ѝ)Ҩ3s,�##����Fi_ө;�{+3����Oefu�7��Q�\Z�7lF�c tO������TǄDF0�^��Ϭ�gi���(�Z.�\n�N��̬񰻟&��\ri�n�k�����i�4�k[�Wq!��֧ͮ�������\0R��Wv/��ө�Yw]�M�\Z�1$V��<��ԯ����(�۬���G�8�����6�x���V��L/����K\'�g�ū�<eh�E���!�,��:�����h�r-\\L�7���m�i�Su��4x���\0SP���o<sLO&jK�_(7�cQ�]���,@uݡ�e�:�/��Gf⣼И�{t�2~�=����Zm�gn��2��˵�<^�\0�b�S�-e���@9���*s�ַ?��|���\0z,~G��\0SR��^7|�L�tD���숒�.��a��f=�Sǯ��4��L�̾{�\"J�6��(��VS�遟L���jN�}f{;/��	���9�|LG�c�5���ݩ�*�[zv���5�U�+\Z<OY���q�����H���������\0#�Q�]����eᴿ��+3�0˙x4�������:��<�z��v��&�+�O��ڊ�����x�Ɩ�M�}/����F�z�f#/�3Ә\n����PE���|�������\0wf�?�غ)�����¨�쑂N�bǛ?C?����ܫ㨦������@�,�7FiK����\"U�: �C\Z��lf��[+Tm�\nk}6�R]f��:�M��zI��<��o>�k>�k.�{�鶲���ڏ��D�:L��{.A�%�U�ǃTWߴ��ˡ�֞6�۴�ӛNQ_N�nJ3i��mj��\0���g��I�.c�cT���@�\0��\0�y��:�<����\0=�	�(��И�����\0�&\'���xm��\\��@����\0�����_qհ.���	��N�d\\��;S���í	İZ��3��|tY�i�\0\"=�\0�d\n�ƕmHį��K�725Kq��[�k��{l���������ⰾ�U8���\0��\0�X.)�2�08C�iȽ.Y%���O֏���d%gP��pzwZQLp���_�g��i\\Ml�W�=f,)����{�\0�k����\0��.�u���n�<��gV�U�^��vx������.����\ruW�8��=��\0��g���Z�\n�Z$���e���a�\'��D��{�\0�k�91�o���Q��=���^]���^�g���22>XL���]�:՛G��g���[�[�ݣ��dM}Hv\Z�N�{�\0�o�c�Dgڤ������hT�n�`_i~V�\Z��5P�J�y`O�h����Yn�$1,h��}7y&}�\\9+�p�G��V�#�FDd�F[�����{o8i���P�\'��vq�3��j��=��\0g$�D`�oݏ�_�~3�-�%%ڒ�#�ڏ��D��\r�F)�������3��<��;k�}OD��1333�k9VY��i4�RF1�γ\0�N�音И����F[4u׿`͋U�vo�,��X�L��@��\"��O����>��\rnF�J���%�����#��FLyN> �P��~L��et-R��S�6\nj�q�9�+�&\\X���zg��F	,ݷ�`�y2r�0���$3���\0�<+=����ض�3~��$WD�5�ۆ�x_���?�C��{�}��y�0 e�ȱ;�^%�N~1��a�ãy�tכ���ߐ�nh�|��%�����v�����\Z�-����L�,G�G��{S���U�,� o�o�Q�Q��\"��2�<���<��P@�Z�0�Ó<�,S�wA��9�be��Hm6��������bvF���E��^��\"�����c�?g�0@���L�m���Dq�!��E\'�EQ.��gڟ~DDV��W.�+�J��W����7YC�遐s1iR�J#t+u�L\"��P�>�_>�W-OOG����\\lU�U����#j���39�{�41��pg�~�F���9%�=�[a�������*��ߏR��}W�ci\'L�/���}��mCS�e\'�/�2glk��`�z����Bkڕe���q��jf�+O��*�i�T�J4���j_J����d���AF���X0t*��_�~�D�a����Id�g,��D�S��X``{{U��\0�@c���Xɲ�X�����`������F�qudp��؟eF��?d8�,�R��I�4誜�\"�Ѵ�%���g�j\"�Yn,I��9�Lw\r66��;�9�p�kfZ��V�g�|g��\n`a%�پL��IdNN��<���4���\Z/IA+�^��<�X��Ŗ+ڄ���5{Ceyy=Y^���mX\Zò5:g�gN���hnu&�d�T�{�-دn�}:0]�M�Q��K>�Q��ڜ;/<��Y����e���+B�E&\r8R�t(|>Ø�dc5�I���@L��D����\0��*ϑ,\ng$�g$�����\0ⵑK�(��mȌ���Z8j��F����,������]�8k[�j�����R���� b�k!��>��D�<�hͣ��`P�y���Q�����7N�˛�>�6�3�U>/d�_��X9Z�3��JGI����V�]K��E�r+%�$�g&p�w�\0���QC-��;�)|V^�������sŚ\\01��Zz�!���5V^��y�\\��T��R,�L,��t�q��J�Gt��v��%zlg-:3����FN�g݃��n���뷟P���6Od��r�ߴE�`3N����ɒҕ��r�Y�o�3��8�b�\0#Q�f�=i��X?9�m�,B�k�!����ߩ* do���[��/�S�Vʹ��k��ݎ.*L������]�F��Leu0��l�~�o�5�%;D�f�A\r���b�\r5�)�*W�ٲ��S\\8����\Z}8!�*6\rP_��v��Nyl�\"���Gw�x���\n�0����sn�Mk=��e����{���왈��`6�NKf.v���9�v��g����\'|/1)�\"���exr�}�Sc`eb�B�{�*D���~kj��O\n���~��Af8?�2��w���+��P\r��9��H�j�WTӆJ�!�����8���g��%�&���a� e�<z�%X81�w�L�.�;U�%܏������=F��2�)~�s��V����.1�y����\0�<b\0~����ڎ��ʍ����[\ZR&�<e�h��s�D�^�K#��6+��*|-m�����TIwD�\\��\\������oOMX�Fyg�f�{�� fVp�T}�;M#������\0�߳�C%��:�K��G�Rۇ�]��ȅ=�5���H���;�tU�:��i\0��L����(�W1Z\'�w@��(1�w�i�@��ŧ�X�k�׵�0y�}:8ԂP���J�޽�av��R�̸��8�(dr���?S�|���x�N�� f0�\"�͟����Kn�3�6�kO��0Z#��,����m��׉�jl&�}��6\Z� ���k�2��ǲ��S��x��5�����Y\'Z��.˳�� ��\'9~{Z\n�(��\\��yR�\'�}\\��\0��(�-���l��.?w�9j�e���\n\\�� V��ŉ�w��Լ�/�[����zD|f�TU�Ǆ%b���S�^���m�RES��/�Z�\r��2$5eLev�Ҵs9�`�5H(�]��,�rA�n���RFP�L�.8��_e��J��]�J���_lnN���*Y\0���>vv��Gۅ;Fi˨�#k�<�[�.�?ѐ]	\"�?mF�M�\0�Zk!�;]l��7�J���ު�bc�!���*&S�n&���j�~3]��6k�Wb��?�Z��#\'\'��!��>��<�](����嫁�I�s�F8&Α���$&��QQ�_۲$I5d�gl��c CCGN�60<����ca���r3���u�};N8\Z�*ќ`H�쑎�:�Ε �\0���D1�E�m�^�3��ܲ�s�r�&��}C����ŗ5��r�<�	�=g@�Zc& ��D7�T�)YpEs���,�wI&%�Y%�O��֮,��Bl]�b*�����W���c���t�N:�q��\0�c�Vpu+�?�m��҆Ӱ��e	ާaOܥ\'ɞ��q�Ht��WE��8�}�Y���;�)��xKW-W��M��ld�7:zz�S�.<��t���t���8yw�Ί���9�X%�h��z��t@Ę���(���d�m;������k�}�� Ie��q6�c:u���v^R�g���\"�1a\08V�l����=C�0�`�A�s[?�K������k����:[*��93�9>aխA�⧤^���E�\0%G3gc\'p�@�!d�.��j�9L9\Zg���c3e�acj7�ؤ&��H�h���dNI�5$]��Xr��\\�1x`+��}��\'�/���RV���G����Ʀ���DH�M)�ˢ=�\r���aL?�\n�p�(��5�_X��RF���b*�0\ra�+�\\���\n����-����A^�=߬w���\'�4�Y7��+I׉����h-��i(�ky��lg0�x5��\n��c`�zh�-[��\\s�\0ua���l��y�֦rE��{�jv�\'���k�.+�<J*�{׀�P33l!���9\'5j����U�*OO���!�_o6/yJ�xS�=���[���Vc��2�>~����ui��\\V�_#�Į�~C��Z�2�}��e!`����\\���¾\\�L�3>Q��Q�{���F\0��V����H)��?�\'�\\�1�tyu�\Z}5�q8xK�o��j�\r��\'8�WQ*RӴX�}X�@)\0��<$���f�L���D��J��\0�J�w��s~\Z�z�>�V��+�ʪ�c�}�`��Ĝ\r:��U׸E���(��1�\0��Ül��V��v��<�p���3�Y��TN&���M�҂HVu�wFȜ���>3���˔���2X��g��Z���Q!φi��+�a�>��n��XÈ!�2�N�1��d�T��W���`F\0|e����X%^a�f�!�0=�rJđAD�k��Y���^\\�Xd�0�;%�)�����Ϧ���e**Љ�.uWƑ^2t�N}!9�n�5��1��oH���uV˖.�|��9�eэ�{�NAg,5����.n��6���,6��r��w^���ޱ,�\Z���V����\0�-�\"��#9�;,UKaA���QP�M�.G�Yݑ��ĝ*���\'e�uu����=N+��3�I��~8ZsK��9�E�u3�1�Ϸ�r�Y�:��t�A�cj׀0P��k�C-�k�+\n�5��{ն�j�]G���qR��SƳ&7ۨ��0/�����\"�L�C\'m灐 R7�Uk��j���p�H �Iwj[q�\0謭2h�\n��J��+����/�tWZ��K`F&��>�S�a��b a�����\0�������\0\"\0\0\0\0\0\0\0\0 01@P!Ap��\0?���/r��^塋�XN3��0AE����.�؊�6��YKֳx-1��R��H����tR~j�\"rx,����:wVc��4R�����Ɋϱ#�\Z�)�g��\\�M��I7Y�(�G�#��[��T�C־bԩ*�<ȍe�t5��k9�Ժ*�̱����\0?2Ԯ��l��R�+6O�jX���<�Az�l{޴E��I��墧���M*c��5?*��������3��\0#\0\0\0\0\0\0\0\0\0\00 !@P1A`��\0?�_����o�~c��p?�p4R�\"�A������R�n�ܭ��p%ͫB�V�W�rO%K���S�l{��k�O\'�/���H��\n�&�R���C��7�*�ԕٸ5��IJ���x�E��vU�͓�X�\rɬuM���^6,o�x����M����ŞE�v�Ȟ��<O�x���;��I;�׶|)�D��6M���I��t�v���,����we�5�u�\0O�IUz��SK����F�Q�t�h�8 �����\0I\0	\0\0!1AQ\"2aq #03BRr��@b����C��4PS�$c���`p5s������\0\0\0?�\0�S53S53S53S53S53S53S53S53S53S53S53S53S53S53S5�\0;;�׺9Un���i�Iǔn�e,����\0&��f����`�6��PG\r����!�U�8@X������rm������=K��M��a��]T��GC��M)� nf�Ԩ�~���q��q��A���f\Z���׊�F#Cy��ϼ��l�[ۜ�L�\0o$t���UO�~��	������達�:F��EbX�L\Z��;g��ht�%�ZP�����1a�᣿KUq���h@�����:Jw\'(�s#��~���&��OhL�XDzd��W3ڔ��Rۅ:�����=�q��w�G�YK�?t�:L9�H�{���M�]`�����Te�p3�T��IU��`�Kk�l_	��D<�5jGA�t^��jg#~�\rV�I�rab:�\'m���Y��<�0Ú����&y��gZ���1-W�\n5�|9Mi/������{z4/휖z�~�ؔ�*�� �=y��*b~�wS�a<��\rJi��UnT���amhG)L��)�)W��|1���,�56�f̗ό.�蟬Z�,#�6��c�h��ʳK���]��𘲗�4�̤ʠ1�ҍ?���V��|Ʌ���J�k�Q��c�O�G�\0�n��D�ݓ:����o�X9ʟZ��� .��xL<����ٟ�K�(ǫS����wV��e6e���ɘ��_����?*p�\Zt�i����%>��T���yB�S/�?���\r*�\r��^�<����E�Z*^�E�=o��c�	O���FY�x.n��	F���T��m\r�(��������^�3R�xJ_���ohE����nm6?���i��x��u\Z�Z��W�J����*t���N/���ͬ��i��2��@S\'��f�Fnf�/p1I��s����4�nu��(�u2����;��Ţ�W�S�o��?�9,z��(&�1�U�:�A��*0J��|bҤn��0�j��t�:��qܾ�����H{9��Q�<f$`D4�5������Hh��+|�d�Ŧ4��(�ҿ��y����~��)�Bv_8�	�(��:7a���T9S�)A�1]����Ak�Qi���R;%m/MʘY���e2Fl�0je�Sg��b�T�����8��z�	�o��g�1��ى�&ѝŁ�<ݝxs���2����ԛC\Z��<%�\"\0N��\0��&Ww3�˦�_�q��26��4Ա<�IS�W����p�X�34�>���K�\n���j�ˇ���H�W�@����$.G�\\ļ��¶�1CZ��:�R�L�j�c�P�=��b��X�ߴ#5:D�����&bc���07���}�z��{\"*�c|��5�:CP[�h���-SQH��N����xE�9VV�H\Z�0�L4�\n��L1\Z^b�E��5W�%:xZ��z��h �V��z��_���������0�3�,�(_��3�c+��z����S\\[9��g���е�l��}/m~���Y�_�����Y��f@�����fs��_NS��\Z	����t�������b9OZ`�z�r��1���݆��,�=�0��@�W)�Lev�\r�i��3���Zb��B���66�uΒ��|��ɖ�0��Jn=1�:\n��\'G����\rShƜD�A��ֿ�-J��rL$��D��W76�*�S$\'�3�O�m)S��;��\"݌����,�^�Hw�f��������L6Cy��IzcQ�p޿���7�3��|;��9n,xB�S���\r�9o��=�T��ݒ�3@��P(�zc�m�X�3��j=��ą�X��\0-�S߄�a3�9��\0\Z	[┾��{J�(��E~\r*�u��Mǽ����u�^��b�ÇuO�p��>��N�h������n�)�[ȧ��NP��N�/#�b59n*�����T�N|��+x�çv��#v��%��ε%0TO���Jv���q��}�����r�sYG��Q@$s�O�^��A͢}����y��eL�v�\r�[���j`�/�\\�����8�h2����^��w��b���(cb)�?Ie|�}���n���N�3��ѓ��U��QIr�=gioq?8���)��)|2�7�b�\\W���\'����wJt]%��{���C὏5��Nf8\Z_r�,\0��9����x�,uGF�1���}&tU3<�\0ź��7�8�4�y4����.#�΢�����!�yS�)�rYOu��_�6�`��Y�eQa������d�v�-�.���!�u*~��T��!dw:�3��󝶞��K�S�?Nw��b\ZC,Y��.ra��߈n�����E�cx͞��-)I>sF�\0�U+�\"/�)��eS��&�O��|<�ݾ��~�J}�7�3�oŏ�G1\Z��?=��\"wg�ϐ[��\0�]��w�휲�2��� aN\\���MO�p_����=��ᱴ�ֿ��M�刮�����R���Sq�v����O��|7�$�q��OT���D*u���������{3��;�b��=���Y�|���~Cӟ\"�--y����V�tu;j>�)c�����*���d,��!��g`}b%Af��|�����\\Y�}��>��?ꝁ�������e,s���\0TF��<�ÅT��տ�S�7k���RgdŸ�g�@5��Ƀ�u��<��r��3�gdž�=�wKa3�f��=T���zs��%���e?��\\i�� ks�ZH>_�y��5���\'ɱ�̻@������~�O�<�ۏ��\rV.����I��If6y�7_yͥ�l�Oy\r਴+<@�n�|P��3�Ҫ�\0+K�Hscyj�K�>�<��e�\rW�:�����a��`e���\0)韬�ڒ{ǜ���:�r9b���ٝ��r:������l���q|e\ZW꺟�/o�w�}��\\�L��y��/�鏗����9���n����{�b���	f����67��/��U>E5��ds@& U�9�TF*GZ|�&$k�AF��8����X�O�kF�����ǔ��M{�\\i��6��[_Qn_f�2#�����Z����.Ҿ\r�Qz�Oy�Y��w�1�sJ�q���*���Y�*&����)���W^ҞST}�\rZ����Ô��e,=Vј��)�t�yL����2Se�2���@ַ�f��\n����B�����6�O�S��9�}���HT�2���)��լ�<�~ST�F���,���U�6nC��[�4M��7=ڋ�č�t8���%Q��C�jUF�n/	R���m�W��\0x�X�;�ͨ���{ٙ���\r��?�ɼ�Z�Q1*r9�+,v��A=B0�*�j�pvߪ�i����K(�����ej�o���>��\'\n�L��GHE�w0�G��V����:�Hi�\"��ܾ�ք}��P{�R���+M53�-�_m�Sf�����4i��{���0��J�g�K�C�q�*W�K�������_0M�~�R�R�[��z:T�s���Uz:��9�`|7g=d6���|\0��ڒLg������]\Z���&}ߦ���h}ᝯ(���\Z�\"͵>�vM��R��H����C�m0E������ag.}ĖaС��P�æ^�����)\rI��e_��X[��ޓ\nt�Ck���bR�:e�$�Zy�5P��Ί��<�#r6�8®n�l}B�rQ��:m��pI�i�o�K��]O~p�Jk��8�S�m�Ü`yx�\0�R>���\'O��M�ޕ�R��n���kS�����!���L�\\|s\r/�\0��\\�}�ͥ#7��C蒞<Hr��:�B��ʎ��L�@�J�P�iQ�*��ؓ��ex�*5�\08	l���U*O+ˈ�2�z��^u7���A�9�O�EZ[1�6g6��}����$k�]{t��J�4�!���`>q���߾[�I�d��X��jgU���/�>^ :�)��E���7�T�mޭ>��/�K���e5����gO�w�=ܢ�h}	�D��z��YT��6���j J��V��#+�lF떑�6��V��V��(��yM}2�CC�ob~�E��>׆涶�ٰ�y���}&!Qj}�Z�й8*W��Px�>cu��~H/:�0AΡ�nJ��k��	�~*����>�(�\0������o�_�]��4��p�}/�Z�l-�6��0�����o�4-�	K0��P��H�|y�C����O���c����g��q����F����	�T��3h�2�A�&��n���6<L��UŞ�w���;o�{i�x�N�1��U�[�ns�?�hm�Z�{���0��6��O;\\ےe:�<fg�a`qi�k2���6�j�鏺.g��Y�v��>&%�ک�-��b-o;I}�:]�����KDW�B������&x����S���2�\\1��E¤�t����#6j��O��\'�[d����RC���Q�L^�,=ѻ�Se��E\n,-�S���XH��[����_�Ns\rJ����M�Dj_��*��. =�\Z��F����w���@\Z���d�M�!�u�Ŏ��g$d2�z�:o�{hyM�Ձ\rPX�ة����������33�H���c�+��*JW�۫�0w��;��$�W�>���`p�6n7���S�=����E�LV\"�A���Ga�@A��T��c?�l\n#s��>�+�e�r�_�XJVbS�	�W�7��\\���{���+e��[����f\Z��A�^�V�ǆ��եX}�*/z�:��R��)�\08_�Z��e9\\Bj�aK��_*�#��[�Yf�拀�R`���ho����	���<�jT�r�v��[f��ߤ�`���[ݘ�7V���ߑ��T�JXT��\\�y�-N�+v�h�۵�8��#�BY�Y\\5:��)�`3�f��q�JTq���c�Re:t�,=�;�(�7�.�����&����c|#2b*���i�t�M�2𘑃�tl��v��<���v����׆�qj\nNFa�N\\\Zy�h�y͘��ʣ�������̶�>\"�����=���Y�\0�m�#������0��5�T��k���\0P�Çb�y��TvUΓ�B���L?��Vs���7L��[U[�q`�LSA��uyu`b�o�3��#�j�=\\�y�^�p<gh(�NgV9��h�Un.���B��3�Sݨ}�M�=&\\�&�L�+��T\0�\"�7��_\09��?8j�h8l_vK�T�G���\r���;=���G�a��B�J�l��n����1���|����xhe�+�V�[��Pb����\Z]�r{�R�J�ҧ�ڈ�x��ôa��XN�!�3R>[��=Tc��2���_	橚���)�ג˙�U��ޗzhl��o���-��)N���xr���L�%��#��(��\r��h.�&�o�=�M\r���f�`;:����g�Ult�\0e�����s>NR�rs<Fr�R�<�|�O�[�)�2���k���T<�/�����<S���%ݙ��r��J���8i�\rm�\nӪUO	rnweR��y�Jӭ��S����O[�\0t���R�?����sֹ𝊍:�%�L�l��dTx	�V��v��\'�Z�6��!�����S�Zl���G	�2�{V�J��y����k?� ��h&�G���bl�^�\Z��\ZE.��2�ϔG�ؔf?x*\"�`��L���XfG���x@�;�bb\0L�7�ף���_�����%�\\��WE�����.����1�$��nBS�����\'�7����\0)K����;\'Xg�n�~/@|�>���1�\0��;�-e�Biq��Lm��gqx�\\9�蘋�b2P��9���h]��U���V<F�YKl\0�]<�2���z>����d�69��w�.���\n�;�*��^:Ý���g:�\\����I<Z�\Z�@��b�c���:\'�������B\Z��Z�0�y�+�9Xr��ot��D�z��\0���X �h�ݫƨ\\��z���zJ����wW�8yO�\'�ã/�0˄B1r`4�f��i��S���.���^7��������(8G˾)��#+y\r�%�2?{�S�,n-�+���:oP�B���1�n\n�N�\\���̧I�660t�5�:�N���/v�����F�Az��k�-�l�P�q)�l�a}��X_�r�o��õ3\\���Jf�w��m�WH��vq��\ZK*֪�d!?��:h���Ҥ<.g���8p��\\K�8I�2Q���R�\r�ʃP���C/�\nv*v�4�:�y�{��2���s�k�,?��k�;%�L�z��^���3���֢������ju���%�G��\'�??��:��s�X��+56�E��/�V ��|�MnfN��:牍S�����|{������ea�e~��ˈ��Ut\'5t�MF�3���W�5\r�r<�5z�II��F����f�gZ���}`�-{w��֙W�J��U�\'�(,o��5f��4�)�,�x�a�K�Fsi(mw��E���Z[��Y~:��m�G<2ݥ���v����{�Z�\'�?��a��(�,��!��[��>����=�|L��tyXZ(>�B��\\\\�s��Ϥ#��f��W\\���\n�S����ic,Q��UlXoq~q�����f�L���\0�lr!�R�vo�[(F�Fy���#��j�T\\��\0Y��Ә��L{`܈��#�K��&5�s0�罣=\\ ����R;JG��M�2��gG8J��e�%Z���hh>F�����a\'�Q�?��m;8�%�)IGg\nC��YgE�Q��?ɩG���9§\"�E��s�����%F�,�/�,��l�%%7�C����wPmoPu��9�sn�M{ �/�Xb#���lV�.��ʘ\Z�����3.�b��w��I��)%2Ʈtۿ�Q;=�����&�lU&�^G�=��s��� ��j�9�n�=g|�ֻm.��T�%�W�7u�����&(��YHԿ�E���b���[�s���u:Y��bsa.\r��Q*`mx�g.�����a����4��y� 5l�h��ΐ�Q��\0�*OZ���3�<x}������*l���rψ�e|�r�\'ި�-fyγg�O7��%�R;���̝\0���\"����XFCp���͝x����WX-���9�G9I[�j��{|�Y� ��>���>2���[+J���F���U�b\ZvH�R�{�O%����.�\0K�P/�o�PV����.\"2TA�����|cS�x���vc�=��M�;I�Z�����u�X*.es�0���f���G�k�a�(���z/����;?��T�΢u�z5k*߶��o������J��*@aS���)U��a�z��=��@\\(3��T\'�s>��(�K�g����v\nF������G�i��\\�1�\Z��2��1i툪�٪�}f\"�\"dnS�-��f��}�8����6v��wW�t�{�j��םM���wT_aF1ِ���B���Ё�X�N�D+�/!�J�TfÄZt�¢�<y�����Yt�#\r�K�=)S�2�ˊ�O:g��Wj���[��Z�:��̶�����/*{��F=�t�fV�b�9�E���� �I�yMGt���\08zZ[::�#�p��2T#��0�/���m�V�R�A:0��P&�q��a��G�>�Kk�����M����hS>q�!ȽZ�\'���0pW�[d�o28W�vG3œש�O��6*U��>�SQ��r�bm��t��S=��yD\\�9p�.v��8X��kenw�i��G,��\'wQ��8�p�qd@AhU���ؑ�@��=3���\Z�\\vaa��B-&bɯ)�����PD�ѝW,,Z�݉f`E!�h�ro�{5?Y�hdaR/l�FM���Ŧ.�=�%κ0�I:��}0w�Z�]�����7F�t^1h+�nOwt\0h<����L:����ǥ�+���IEԠ\'�\0�a�i8J���է�1�KRe\r�¬.8�E=#��a�p��5�x�Su(��.y�q�}�ͪV8�N��7�J�ÂߜR�J�y�bԧH�O�+p𘶊������l�����W����e�z�8�?��ˇ�<\"�.\0\'��}`D�2�!:4�v�iX_D�M)�l���I3�Wu�13�m��j;\\jw7�p\0g����v\\�sH|��>)�|��@vj��\0N�7�U�_�ي�%4�\\z�R���O(�a·9L�B����芝j7�����j�/�n㹂X���׳�8P�ɇ#�[7��\0V��[����Ÿ˻!g>�1k�)�\"+ԥO���9�R�ۮ?X��$�Fu`Q�/~p�hc�5Z�s�Z��X���9���׵Z�,#E�pv0�S�{��_IJ�,����ξ�a���oi����\\b�L�D5��˺X��e�Bm�}����,�r&\"������m�%:�Ip���3�g�Q�9]m�P�Qz5��1(VQ��˫3%~!i�V%4���\r�Р$��c���߭�ڞҦ3|0��	Q,�#-3�{���Uy�S��_�����ф�W	��ɴ�F��^�Tߺ+�NOSq:\'N�h:���E��.�[u\\Q���_��_\"�4�)v��^a���8����gGH�s�sUbN��\0�	j���\n�^�;�@�L)i���{eyN����r�X���/�m�!��6����<6��`^B�\rL<x	�h�c����,��I�+͚��bf�Sިwa��0S5,\0�l=kL:[I���eL��\Z���)c��x�KhѬ����L�ϑ�`~��K`a��� B�}f�d�o	�i��&�Iq�2�z�ӿ�Tt�* Ś�w�S�i�EXi�Vݏ���ja#��>3�W���p�)�b�Z���~��K�ͦ���~�>���yW7<���+P4ղV�e��Q� �������=kJ�jTM�~�U{tu\Z��f�D���i����.-:+u}����WC�%J_5�i�_\0�{��?(���|8�TP2��v�;JĈ���{��wl����&#|LNB��FҚ��u+��:`�x����G�rj�<f�����5�����q�v����\0�\0�\'�m&fT>�w��������9�63&��M5]\0fn�9K��+{e�y�p�Y��Aú\n����^Yz����Ѹ��L�~��<�_�s.nw�.=D�GA�X�; :�����/�\0��,t�~��r��W��Tg�2�\0�����\0�S_�\'IP=�^t�.�c�~�!a�L�������L���0�JK��~�fv��ɴN�0�l��l��T���0Ta�+�	Wf>�Ŀ:�C���\0�N�O�+UUFB܄5�n�[9�^?�lҗ�����)l�G�ҋ��&Ї�{�ZbE��-k�9w���G(�e��Y�u�X�3rp�\0yOg��l���x���X�he�6���}!VS�c\0�%ӚO2�MA�h)�t��y`U�K��M���?�U����L�{�t�윏?N�X�U5R�lb[!����x�[GU�>*��#�4��=�b�Dm��j�Ƚ�׫���N�5$[ל�����\r�[Q�JNi�v���!�����u�\\�D7�-?�\nG\r�&��,��N�$��}*�������p��4�E�-Zgu���e�Q=`=�ƨ���tGݱ�jme�:��/N��^���7�<��Uǜ#!�Fw��тv�YKj�N�*w0�S�oW� ]-��1��R��Ju�F˺^�\Z����6�[�5�\Z�vɽ�!	C�ks����/l���I���:�Vs�[��o3�ﵡ}�ۏG{	C&�4`A�]��\nת-���\"���j�`��,b�=+�3k�_[����3ֹ\"�n���|?yN�ui�����.�I� M���|B{S���cS��\Z���*S�ľ1�[	Ӳ#��MDz�$f\r��X\\*��x���� �^~)�k.��_�CO�T�t���C_l&�>7�E��L-[�q�q�@���Zt����m��\0��Ӝ�M0/v���{I��\0��(����=|�Ki�����fDר��e���!�_�>մaA|A�:F�[�_V0��.�;�|�\\j8^����o�D�~07��rƼ|y\n�O���{���ѭ���홰�E��\"l�4�so�\0->>񙚇�L���s���ڝf�ߊ]i-����������xM�/U+;�����J��Ce1�LS?�z���5o�?D�)���\Z�Rn@�C=5f\Z=�h�^�)������3��&C��XڟV��Ɲ�o��H-�Fӻ��1�o ������8د(hҠ�K���&m3�A�%*�f�g��O�/�-P~��f?�3-Cf�7���櫍�>[���I������_�c��O�yͅI�����Ooا�?������n0��|倰�hza-��c\Z�Jy�Æ��a�M)�fB��t}\Z�k�����q��^���	���|�s3���`��/�-j�\"�2��Q\\\\N���V�w\Z,�d\r�37zLu��9�ت0���s9���\0�۝�4�s�\Z�]��M(�;DU�.��5�:����r�#uǳ���3�����%H�\0��\0��sl��Y�\Z��#;H����<,1�WÌ�\0�D�jR�,�D��1�C��PxG4��V��K��\0�3=*��6���Iz�V05ʸ��Y����4�	�OGTh�bڪ�܇U��]��H�{�\Z4�\n\\\\���z�u�`�\r*�P���S���1t_+弫��,4��VǄ\n4�B�\0����\0,\0\0\0\0!1AQaq���� 0����@�P`p��\0\0\0?!�\0��+��?ҟ�O�����)���\0J�?ҟ�O���S�)���\0J�?֟�O���S�i���\0J�?ҟ�O��!N7�\0��?�jk��B����je�ﶆ������N�SP��D3�]��$��O�G��Me�*tF�TPa��[����X�	�S�V �N��9�����\0��~/#��$���[�#��� ���.�c��Ȩj:�O3����]v���q����]�1�,y�;Cn �z�K�c�x2�E�4�����д�\0}�;^��:�WוAN���0\\�ˁ�]9=~�?��~dY�������\ZcAK�!y�9w|.���%\"�b���(��fڭ�\n6�:��o��U\n�ʑ���H�j˯�_�O��K��^�C�.]jdb+�ds����%bpe��P����L����m��P�)n!��#4�c5���so��^!u3�յJ��s���acr��\\R������Ө��Z\0������ƎĦ�0�M� ���@�B�=��H�O�F�w��\0��~��R�;�\0�\n��RT΢���;F��gT�T���-M[��u����,�ʐ\\��0�:�Ѥ�D�Am������Jb�ER�]^g�~\'h5�/�Ѯ���~鱫�`�d�\r,{�+B,/pju�]|�4-k\Z�Q:oJ�[S�o��c�\0d���v/���!��n+��Y+͉��\0��\Z?����C�)9���\Z/3�8G�JQi�W�T!n�^��篃x_����0e�95��=���|��*ah@/��E�\Z�Џ3Xw{&���F����k=�=��i��VSQd.���o{���^��@mE�s:\\����~\0]�|>��\rdm�	�����HJ������h�\0F��^��;û�D�%�[�ɹ���#�����5u�>��o\0�I]��&dj#P�i\r�JNm��\ZOe�O�s3�?���B��{?M([�3@�����5�)N>�B(U�n�r����\r�|+��x��Z��#����z¼�_�yo��|�ea)�G�����?y��,��cj��X�cev����rR�:���-`	��?�����k����]%D��`.�At�\'�Y�éf�\\�+�,*,�����	@�׾�Uf_���#�5�hoxP���}����k��\ZE03p� VBי6$.��a]��M(\']+��Mh��A���L¹1-0j�ō�Ԏ������.���Q�wy��KM�������jL(��r�|(+ߵ���\'O�c���L���1-�_�е׈�g��B�	���� \ZuFx-��w;�2W�ôf��.�����fF�hzGaUP���j\"�6ņ�\\�j�߬ri�D� �_�{?\0N]���T�5n֋Q��Ѽ!疪ey(�y׷Ix�������L<.�\0a��a��kX#�n��U��f���j2��&Y�R�2�5��Vh��Fd+I����L���-��\0�f���?ڐ�\0A2��)�Ll$�_�Wt�F��j7�u?���ID�����H���n(�\Z�h�Kl�|@��V�x�Vsҋ�֢�\0��W�:N�K/��O?��)D� �G+��Ω^��?��=@�\r�����~к�T0@�`�J\r#XR(T|0+U6&��b+�?���L�\0�b5��6�ɠAg�~�ky��OL���Y�I�?��_�3v|nB�F,So�����u�Dt=�sW3���tO�����ڊ{�lRuNS�0F�����܈�Q�]�Z��BZ{E�Dl�%�ve�4J8�_B��ڛ(�+�R�Ĵ]PF�\0H���H���\0��u��qk1\Z�6��xhJ���C�o��8z�i]]_��}���f�/���\\��I��7�K��k�`P�F�ΐ�������u�pe�,Vc}9���(mW�Krm�<�v���ꘫ:Q5�Z�N��CBzc�Q)���#۾�7=~>���%m�jX#J�1��\Z�\ZL�jM��ǂ�P\'?���c˟���O�X������h��K�i�6�(�5i�β�q�4:Jb�M%\0t��$F�o���M)�=���\n ��q\r�4�`�ޔ�`J�g�@��\\,��m#�\']�!�}��N2���Mk6)��3Ph/����I��Na�8���ĵ�R�0��b��j�@%:�#��\";�on�y�Q��tb�x|G�m�G���c�)�7W�)��%�y�H[v�=��0Y{g_�%,4|��J��\"#H�s�5��T�{��Q��.���ZE��v��;��M�\n�\Ze����fd9>����V���\'Ѽkï��lu2��Ӷ�C����6�y���� V�xT�.���@� ���)2x��;�i������ ���3���X����\r�<�d\n�t�Ӽ�.�)��-���Q��J}��6�t����e����(\n�����?w�b��3~�:��x�v�ɳ=�^�S���3��3.)��xT�dz�������xZ����&s�oB���Y�>�ۏo�]\0�w�>�\0��Ċ6\r����C��J�\0��C�:x�]�,h���>�-�+�\'wˍN�cx�(��gT�\Z�YgJ��s���~�</�Zx��D�Q8�#��^[y_Hj\Z�ƞ�\'���>�|<�_�z�$�/��[�Ajh�O9����T�m�\rʆ���S�A�5�H�rQ��;����56aWտq@�����ＵӤ5�Atc�;뻥,�mN������Y�3.\r�G��}���g����ˀ��H�+u�w�?����5Wi�U�%%j4ΟĬF�7��̐����{(눞\0M���VK,;�x�T�6�s��V>����bҊ�bf\n���V�%�9�A-Ch��9�LCw�ܰfz�y�fXJ�����:O�>�E�{Ke+k�\0�\'���6.�\r�Y����|?t:1�?��T\nn�dB�������V8	�l��ЏdA�TH.D��7���\06�cq��ԴE���?͈�Gr��˴��`����i�,u�˴�Y�����BΦ��-|\0�p�ڑ��/��:>�8�}4J%E�&��\'����i�\0��\\��Mù��=��K���g��\0m�\rkO����e[E����+.\Z�?��*S���~��Y�=	{\Z�s����e�\nQ�������׻H��\0��f�z�죪l����V;?��W��8)���;Jh���c��\0���\0����	��)�Y�S��/�*���`��J�Ta���L���͜��zR���dɢ?z�_\Z}�g��%����SG��U�3�Z^?�|?�Zg��Y��è(�	�u��Hk�;��T�*\n��Q�)=�X�Y���ʶ;�=~�A�r��Ȍ���q�_����ҙ��%�X�	ݽ� ���O���ݖ��=������\0�t��	�,f[c����Ն1��4?7i�l�f��S��;m8�veK����H}L��;,>�{`\n�%e>V.�}]��w����Z�F�8c�}׳��g�m,Xf�֍�Rc�d)q�\Z�b^��1e��`�F�]%�tϤ�J?�j���/W����lu�`Ѩ��UD^w��5r�f>�U��8n��Ǭ����՘��m�/C��R7����h~�@������M�hq��Ͳ�]٘mx6/�Z�\'�n1����8\\��$��#	v����\0�IZ\n�p)��J��\0$��hT�t?��G\r����2���0�Ti��e=Qu�>��Gy�&���]fGJ��s��B�6����=�٤V_��	\"���&�	�J[�hѵ8� ������[M��8���\'�h�����\0��@��rɬ�x:����	����p�0w����N;CvL�z�\0�.���*�1���#��{<oa��|�N��*n��!���g ����^:\Z�x�R�e8��fN��x,�ާA��U�E�L͒9�������DL����Z\r3@>���]����\0�Y�.�J���\'�iy�\rnͰ>��P^��r�&��p���ؾ��\0\n�U�u�[ɑj�� �)�!�g�f�/iZwG>�\ZҺ�N�C����Q����L��Uw����V���,ҷ{�G�I�ב��C�;�Q�%[�5��b3l{��2��k(2�b���ϙ\r��C`ׇ����̟�E�R���b����RhZV�{�\0�����6��\n@]��\0��d�[D�\r;?$�����n�_��0p��FD�WWǖ�%�cg�_��S��ƽ��G��Mfb�K�[<\"��73-ochT�e�~��(\":&IE�Vh��!�����*B�\r��]\0�s�q<U#u��T�!�KL����+[��`Z��&�:u���9��>?\0\nh5�����tN�9�OpH�n�N����)�h��Sh��h5�A7u�����<���)����^��I�c�2Q�\0׼�!B]�q����oy�*�*�����;W�9o�x�X�0�%98g��g�F�;A���w/z�U�E\n��b�gg���hvWQcV���!⃨<Gx��|J����Y�^x�(X�fQx��oJ@�)�08�]x\\����>\'wȼ��R��0\0V����\Zʣ0hl��ߘ�!�xn>C�����{DSb�}�o\0\n\0s��7���L_B;���d�����	�h%~p��uL���=��8�=��]z�g�<T^K��	�hy9�CD��U�B�d�E������/�ʶr��s\n��	���^���j�}���_\Z�*W���Z����\r����&HAf����P\0/BWV/����C;=;��/tְ^�����S��<CK�	�go��Ƿ�׭�sƠ���9�Ｔ;j\r �BA��Y��E�J��+������j겾r�yl=f�J�o&	\\f$�#{�%z~)���[��n�0�(e^A�W_�\'Y	2DPDr:��SO;�|NQ��*]dV����_��ա�z5$\r�\0`\n��;\0�] �����ฬ�Y�<k�r�4���-v9���zf�>�&���[���_��s�X\0�>/��Q��ĺ7\\�y�-e���5Fbͫ��\r��o����\Z�e���-��%5훧Gh�Uȇ\0-�\0�e<�#�b���hbع>g�4��z�;&����������CLG	�ﴪܴ4��4\0����:ڗ�ܹok7���s��� p^����Y��n�&���u1֌�jۓ$ /��^�R�*W�R�%ֿ߄G�p���F�r��\rc\0��%-ݛ%�EW�Az߉����S��Sh�\n���	�X�r�CQ����P��Du�F��8���Q߀i/�mC�W��>�-�\r����\\��5\nF���A[���XH\"Y��JS�䁪k�!�L�pD�)�ɓS#Ħ�m⽲��%����O�=Ï���ap8|�� ���\n��tZVް�\0��D\n���:�/�_;E�$\r��j�!Oe���1��������_b��jh�$��|^F�>{�Y��\Z��ta�0\n�R����A�_d6\r��������ib`�G���`bb1�(w��Db���nW����,�á-]=i_����A���܇�T��`[*.����3Q�аU�@�o���θ-��L���`Qy�3<�p~��aԅ���L��(!���X\nn���z��t>���z~�d��U�D����&���u��s��ڄX���3p6;�t�v\n�2��t�����^Z�:~ep*��y��Wf^��\'���U��d��u3+�]��j��<S]�B�-Ks���a1��t��S����!�%�=-\n�eb�)��5�,�����y\'���ґ �\"��Ƀ��.�$�Z��r�aҴ�K�N(�N��~fFnZ�\'Hy��&i�ܜ	1��1�C��Jۿ���S�΁�:IG�ՎI|L?g�-]B�ې|d�T�$UTWus�r/� 7�)�;?���x{c��?@����\"2n���WM<E���GZ���ih�\0@��i��9�_c�>�.����/����>���^�8���b��􎎷�qa��6�k�`�C.QTH�f�\0k,̹�F�IU���\"�$�y�o��>� �3,lȸ�]a4GdP�;u�M%+� �6�l�Ǭ#�ؓl�9�E\"U��:(�	�?�Ǽ���a�&���G�1\n��:3�DV�/	#�q���?(:��H¡�-�ڴ�/��\Z��7ly�\0%@�&����YY@֏-�hDhQ⯚&�6�v�d�a�@�r�Y��#+5~>ǲ���n�ģ�����Xe��gs/S�3\r|ۓ�ݴ�0|\"K���,6ڝ��<-L��]�\0p�eR7\0��d�͝����W�Z�L	�hϋ�M��K�\rbUX��Z�Z5�q�T���[�b�%L}���\Z�>F���C��\'Y�x8F�n��!żf� ϡ��L�1\\\Zu�em�-���Yx08�*��}���c|�Dow;�_�Z�!�6�Ȋ�k0z-�\Z���,H�1�S��)�6ƿ��oZ����r�%w��� ��q2����\0@����^�k�Ey�P�єF��ͽ#�%ڝ�ض@�\07�������l�hg���k^O��)E�=:Dݮi��t�7E�U�˖s�r�˗�̀������[�x�E7��^l���nTe�\nת�K��\0���.p�����M>GoZ`���rOl�Rgh�Bڰy������[��]Um�q���c[�FHRu�f\n��ϧ�&ӥ\\����C̻B1��<<��#��O����O�kSy�K�++����\'�5*5�^��.�19��qA:+�t\\���y��Rt��KC����Y�:s�u>|̊�n�����8����v;�\Z��2��\0`�\'@�4��=�\\�F� S�XV,����Z�=!�S½��L�#�6I�(���}0��Ն��P&+zjB*B��_9z&0�M1�.t2MN��\"��dֿf5�#�L{&whF��j��MC��H��{��Yh/f���H7�Ѧ8��hz`t�9��`�<���9�B�	A^cݳ��k}	�֮`RE��j�ˇ|E�0q�����`!�=f�{_IdJ]�LV�5����	0�wT��F��+���|�AC�s��.2.<�U�Q��v�����u��]b�a{I��@,聊�/5q�>���$�B�!e�g���R���T�ăWx��Y�-ٝњ��=�,:�r��e���]!`��E�cJ� ��mM}!�ѥӧ�%++�u�K�{r�����A��ɧ�Myv�7\Z��\rR�/OI̫k���]:�|��a,�\r{�V%\'�s5��$tV&��^H�z�C��<s-���۬V5�Y�[6H���/�)U�Eؑ t�!-gX�!�\n9&��}���~Ƨїj��[0<��[?y:�yjR����	� \Z7\\.�lhWXH�t3��-��|����7h��(� ��1�;��-p��8E�!]w�eNNG��sF�4�26-��c�;Ο3&@+Jip	stu_��^O)�\rZ���4bl�E�]vl�Jc{�ۼCz�9�Y	J���)<\r��N!J��g�n�0���Fh^	��:C��O�	H�i�\n��<��F�;�O�˂��䕊]���w8N\'Vˠ�܀P�io�JC(9�N�A���)j��Y%Y��ۇ�A��<��՗�Z��ru ��\n�9���0��kSq�z��C�6�z�SQ\\�[q�`���)�Yl��W؍O\Z�σ):�S䇷^��S;�}�J�9ZE�@o�	�\Z9�05=weHc7cJ���C8�\0G�l��o�q�_�\'��\r\"�-]=�S�W����4�Eim��`V��>\Z��j2Wv	0,O����.d,�]�˺ՀM��|�\0K�\\�\0I�D�W`���b�n��(�Ph�f��r���	;�]��cj��]�e����wr������zٔ7�E�\0�c 2����z?��br��\Z��Ք ,x^L�����a+��F�u�U��Fi\ZԜe�̜��W�����l��IN�!D�o-Jq���DCifXıF6��R\r�%1�}%�n�����&��@�&p����J_0�`:��o�\0�����d���#+�f��E�r!ڝy�	����㕆\Z����u	��j�J�gU�=f��q,�PF_w&�{Q���k��=��������6�Q��]kM\nץ	�W�:s{EE��k�T����\0W�-�N�{\\�O���ְAQi�����C���W5�^b�\n��8�lyvm�.��.C����F��ԎT\r�/��qk\n��6����tlig$��􏇼�<�м:�\"��rnr�/V*��;�N0���ę�i��O�\n�]�,���k:�*0��0�q\Z�[W��G�4i:EzO\'����5��φ`ͧ�4U쌶b�?��<�a��(���d�����J$���A��5�WO��\r/��0����v�E6ì.��-�N�u��u&�\0��*&����T�V�]|��Ҏ�ߤ\Z��?3Pr��\0��G�Dh����Z�&�7\ry�SyB�LR�g�fvu�4V$���ny�g��j\n����j�n�5:��:���r�zMj�Wx1�W��F��d��i�coiK`P4�a\ZB��,���Bn����.�7�I�+��7h8b=�P�\r�\\\'o����n�!Rh�$&����-�\0���8��tp}�C����4-D�\\N[��\0����r ���z�q���V����2_�p��j��q6�V��(�{\\��#��#�J�c����ןp�����)���~�xT�h5�Vk2�C��K�A�\"�\0�N�2������*,x������9?���V�N���/�3<e��&\"����n� ��;���+;َ�U�4�+���Kr��<_�s(� 5�nȆ[�/X���L�N!�r�06f+�i�\0Z��6��+�~g�v��I�3J�Z\"kIǗ���8d�.�PfYm!�s	+�)���Np�^\"�จ͊��lu�n�d�ڼ+�6�Te�V�S��?^#cD�۱���P?�օ��0M�����O���缮�_b�zC����|\"�*��|�U)��(����k���VX|� ����WYe��Q�Ib�-ޥZ�Ӊ%t��xc�	_R�:t�մ\nݷ�\'\r�2�Jrt-;�RǬ�An��B�&���y�6V���Af����s1�o%�1%I~{B<(/����x��S�z���D��E2+�g�/K�_�(m�_�p��c�`��8��h=�GwN��A�yL����մ����M�W̚+�`��H\r���m��r�Hܥ����K��v�}��މo\rW�����J��[k��h�(Nx��Ci+I���i-�R�\nl�N����u�ixތ��Z��޴�Ų��i�k|�:�)/��ł����f�=�ǡ(=Ϸd\rj-Mm�M�����Щox��.3��7ސ����\"�o�V̚g��\\�5\Zz&	V{ʖ�<�oa�*tq�~#��;1U\08!\0�=���h����:�+�\"��c�oC%�	خ���M�����Zk	3Z�s=kS��I`m���\\�s��>���V��R�ۣ����Z��ɬ)��\nʲw����Jgl2����C9�&�\nԀR1�M�֫�c�\"a���/O$�6�\0a;�4l:3wB0��׻a�ꧨ�V�\"����y�\Z�;��c�A0�����Sw5~�+ˣ��j�8\"=M���\Z0m\Z�[��&�nO����9> v�\n�3]�Z�_��+�7���a�PԱ�Jt��ә�%{\rnO���/�������fL\0��r���$��@��l�����-�,\\�\0�s�1��ǝ�!����]W\rP�yMwL~���j�~�m��`����̃q��B8��U�@�����:K��G�L��״#7�G)�ڌZ;��PR��L���|rs�L�\r����K���s����\0<�\0p_�|�\0\n>��k�Aw��v�>#����u�\'9~���<�:$̓��6�\0kaN����K�r5�u�a�خ۰��KS�+.5SQ\\�}!�N\n�b��b��;����nS���݃Q���B�<]�{��U�H�S`���5�N�	OBh8��\00�cV��D|]Z��`+��6��6~���Q[WOf��\r�I��b�<�����n֓62�������R���&}e\nP���5K_�.��)-|�X�J�?R��\04��{��\"+0N���V�j�l��y�*�ɮ�S̉����y|K��i���Ǔ�	�)[�K�aB����f_�P`�~�R.��ߛ:*w�`(h�\Z%#lp�ֽ����3\0 D�����Qzv�E(�x%\Z\n�Qm�̡�p��/��O\\En����)�g���ݫ���|�FΒVa��y�Ia4qz+����Q�p��iy4��j\rJh�32�W�+�H�A����|�q����-��~\'u)MJ�3:#(*�`��#\0��-�(�V���]A6�˄a����t&9�?�G3�g���\Zo�u�m�`������^�!uM�?���bCn�d���,h�<�����Yfa����`�������ַ��� �+���N�X�KG�k6���v¬]vz<�=�^�\"��߲f�p��׳W͹��uQt��\'�� s�;�F��U)�r�=+H���y���xԆRt�9����\rG��q:��Xv�]�u��Ahh�A��-���\n�Z�\'Ǻeg�°&��I�Ε\rعf�m�u���Lz��Z��G����\Z���:w������0E�YO�4!���VU5��\Z�\0�[�\0\Z��x8��(�u.����Wu�����F�\Z�\"�䱪��˱0Z��_Ĺ�a�:��6�1,�%S�/w�U��E��Ih�g�l˪�����P�ڏ�Tt�(t7%���]��]�)��*\'ڳ~Y]A�r�\rd�R�g���>%����F.1�t�2]�G�K�8���\r֖zs�_�@ى���₲�z:��\\��ۢ/1һ�[��:��[�\0�o�9�\r������v���J��IX6���J�pߣ��C��_��e�#�T�����4n���f$�	�կt%[F�Y��;0x��u�c���[$��;���\"���j~fyAc̡��8I@��^}4�����̩���� �h�m\rAq�h\r%�F6� 5���4�u����iMt���as�@<��KLv<�]K��?l��28H&��q~��1�3��=b�G�s0gqݼ`�\r?�q��/^ұiP��4<O{�I����?�Ι�V�C�f�%c8��Eo(�����\\ŰY�`3gDW5<��)� ��P�g�Z_Kg|@\ZR�1�Ay���J:3��ׅ�	\n%�J�q4Zh]� q�FF��+b�㼎^�1r�j��JpJ��S��M�<���-z��RPۤF�C�׬ �&�5`8�����H\Z��J���b�\'�0zE�^��tb�s\"�[>e��{���A`�A�׉���Åg�G�ijQl\raY\nf�&��0�fe����V݌G+�R�6l��MJA3m�:g��m��)�;Ž`����@6.�[�=���V��<\Z�2E���\\�繊��_����Y7w�tGޠ��CM��S�\0�6��N�A(W];?0����\0��K����\0q��\0\0\0\0\0��<��<��<��<�O<��<��<��<��<��<��<��q�s�<��<��<��<�\r<��<��<��<��<��R�aH`$\0H<��<��<�L4�<�O<��<��@��\Z�% (<��(6�e��e�\ZQ�<��<��B��m��0pш<��<eE�ZpQHYQ�<��<��V�{}���e(<��07�x�VM�Z0Ґt��<��B��<�=��4<�+��?+��;����<��|��Pp����<��#r5���;~�]q�+��<��B�*,�z�3|<���Y�D�򌽠�H��<��BfH	�/<�t<���-9I���V��Z���<��BR�;@!<����H�]��,����<��B+ � �<��<��0���<��8��<��B,� � �<��<��\ZI�\rqN<��\0S�<��B!2 �\"m<��<��5�ÛM��>3�<��B �D �.<��<��/`\0\0����O<��p��<��E�k	��<1g���9�x\0�s����<��}��I4����<��`[�~/�\0\0���o<��0�-�U6�x� S˕H����\'\0\0����p<��3�=�wUE%H3�n8�2�Z�\0�*�DQ���a������Y�(-�\08��\'��\n`��?���[���(�yn��\n���\0<��64S,���ԣ(׹$���4}��>|�u��\0<��|L�0�2YK��\"�Y���\n���/������\r<��Ӟf\n������`��c���c|����U�<��<.Ӕ���9,�!��+��2����G2�ٗ�<��<�����࣊p�y�c\Z<��8�HQ	����|��<$��k0�H\"$�����8p�[����S<��1e����x�6��1�<��8����q�AvG<���.�ۀ��Ϭ1�,q�<��<5��}��|��<��<��<��<��<��<��<��<��у��s�<��<��<��<��<��<��<��<��<��<��<��<��<��<��<��<��<��<��\0\"\0\0\0\0\0\0\0\0\0\01 !0@APQq`a��\0?�s+;;)JR����)���JF��F�����}��A.ű�кF�����\Zx���&m�����l�N��n,i�g�y������_p�jLi�.)K��xJ�T ����Yӓ�W�iLl�\Z�:�=DE*��T|����!�Bt4ǣ��ZΜ��Hɳ������4p{��G�~�^ˠ�Z��ƇA:�=��{ZΜ��5�R���Е�c�\"Pm��1.�.o\r�HhF$C\'c��3�t塶f=�!�#��bU�hпcQ	7�>РP:�\n(n�NMTxt��PS���?�����_��bx��_ڞ=<O{����u�*tX�Ľ!FL���G�h��1��P�6��|[\r\rA*.�<i�%�\'�Q��?�Z�S\rRF<i��Hj1昙)��W�[nL�FCN/T��H�\r\r��V���$���Y�1\rC��hl�6{��d�r�qo���e�艟�O�EE�%�N�+~\n^Kʲ��(���Gðj��)p�O����~��5�B�χ�\'�2��Ӓ��������7�vDЦ\"�~�\0�%\r��R�����\0#\0\0\0\0\0\0\0\0\0\0\01 !0@AQaqP`���\0?�\0�DttB\"\"\"\"��[l)JR��.6�VǬi�.��B}�O���[��L�B����mD>�!�J5B3���ձ�҉Ѳ��;r[\ZMa\r:D%Q6���,�#�KJ�$�r��\nn���a�O�c�>	��;r���09\"ga���5T�f|�s�\'cm��:9��SOB]F����AgbO�47t5A\"!D\Z�Z*3vk��B�NkxO�Q��E�Ve�;r�\ZcP���+C�=�n��%bgP@o���ne�4.�(��L �cnI�O�Rj��o�.��$���QE�o){Ƿ�����|[x�	�Io�T@�&���o؟~����ɛco�=\"����N���(1co]�^��2��N�cl��,ӣ�Io�����\"�sl�D�i����J%���	��e�(ע����N;f��\\/���(�8�.���|Ͼ-��ty�$�B��]��8��iбv7���\'P�V]	��t��M���!�m�1�-�����2ò�yok)6_�4=�.�K����;E/��ɢ\Z)W)3����o��2L�٣��1�|k�����S�I$����^ƉHiaƢ*�\Z�vApk)��G����\0,\0\0!1AQaq����0� ��@��P`p��\0\0\0?�\0�ֿ�� (��g���\'���\0���B��	��!���\0��\'���sZ��7�\0\0���U�`s,�����ԅ4����\0-M��jl�E��*�����\n��h*��Ya\0 �\\��\0��O��q�UMۼ��vb�F��� ��@k6��4�6J�W����\0�K�2������?Ë��_M��a�V1j�U� ꛪ{�Ʈ?�\"�UU��3\n�d\n�-gvBe���x�~\'���{C���,��x�,�u�Z��fl������/KEA砃ChO�`�Q):K �3�}7/�4�\0r����i�g���F�ى^�s��J������(g�v�]�YP�;�\0��e+�T��\0U\n�յ�â\'\"���24h:��E��\0�J�������R)~�8-^l<e$j%�h��ƣA��Kp�\n����\"v}nY��������,��*�E:o������E)�@[��P�b&��ꚾل�lE+��\0H2�o4��TI0s�����O5�p���\0�dQj�cƛ4�5@��1��.E������佭Q����MVi��WXw�|]�QS�vÄS;0�}�I���R��>\"p��Z���������x�pt\n̨Pi�_� cQL�a�澚=�����]� dP%��K� ����Ŗ�F4Zߢ��aI�o3	�ײ\'NN}�g���D���G�\"�Q��,/���b�Pd����\"9�\"G�U��N�JT�[me�*�+$��� N��	�6����`�4��B���3M�y=bDM�\'�V�n�>���� �������%V\Z�ty�*�n��X��\0+�����f�k���\0��\n�D�c���	a�<A(.@�\'���_bR�p(�o��?\'8#6�5V���W��E�뛋��T�6>[�A���5pP�K2�k������s��&��6ت|��Y^\n��PQ���+[=�6,\r|��0�\ZK�W��4�<1�+�u��j-V6����\'F!ş��Z�k��o�ȥʔ����T��g~PT87����\r(�OQP��q����C�J���D�%����H��!��\ZXVA��>\n�ZFכj+qfh��LC�DL���&`�E;E��\"	Ig�ĭ�!;�{4�f,�)%�k�=�~��c\Z���\Z� �a���1?e���=�\0f����/�Xltc��Sy_��KLa�,Od�h�)T����\n�hE�Ϙ�%��i�	��X޼���-�ދ�\"ۥz�\Z\0�\r9,���O��Q��c/�PIe\"��)E�p�$���ʨ�I�ڇ�U�Y��Kb[6s2���7DoOԽ�;_���a��@m��E��uV��m�l\0\0�\\N-�x�0��2�ѐ$�6�;~庀��K�����ԏ�)��U��9�h���\"�*~#4��c+e?BZ��:��\\� �~��a,V+��� 8\0�\r�jԨ���\"���V��I�����<�L��\'Ĺp�����K�>%��u�>��b_��\0�\r��s\n���,�a������9[�Q�ET��V�E\0�;Ypc1���Xo_�#\n����ͫ�\0�����E #��#�T�\'8Z�~\'���8����`��O�M��ʮ�V�(\r��^w�/ja��r��%�R�8m�\0�qiX��D�)����Gt�L6Q���{��a����Y����!�\\x%�ӧ� m���wG�ы{��5�#\\^lL�MP1_�!۴�_i�\0s�;��� ����������8;l=f�ܢ�$U�%���9\r�R�\\+T��M� (� q�ɻ��$�!{�ߘ��\"z�b���b��|G��\'�e~�O�=@5�1�?��U��5l�/��$�-�<a�a��W���\r0����X�j˸>�����׼CT�m��P�E������*�\0|����`��*�� U��\0����щ	a���X�e��/�Ќ0.��\ZU�r���W�(��W�ɗ�hW�����ޢ�E\'@T��*�?P�8#[kd���7������^߃,��+\r��1����I�\'��ZeD�%\"(?��t%#����5r�@�I<V*TV0�J�Mg`l�Ss\r�R��}4{C�\rP�֍BX�_�@�U�o8��\\��+G�~�ĸS��:���T������%c�a��ʂ\0�MŴe���AGX���3kq�;\Z�19)���A�ezU���`��h����*`�Ľ\0;5F/৶5\\�S~/gI\0A��ϰ� ��,��,�9m�]����.��b�«�X�H2?��\\D�3�{\\�!��(��\0q�+�mH��B`�P]�t:������!�\0Gm�J B�Z�c�ۀ�\"�E;���~�=�3���=G�t��k���n�V��])B�����@�J�8�]����;5�\0Q=TGԤ�pPl�AɎ2�\0+Gl���Y�ZZ}<���Њ�C\nYM<����VVXE�Fnd�Ec���G�Rŵ��g:�\n\"P�7���-��$�V���h�����)��l=���9\r;���awX{�����ە�@\0]��i�0F�r�jJNDn^��]�jo�@*n�H7\0PKnkB@�`��_�rб\Z���\0p\',R/�lO�XP�������es��C�9����W�/�QX	���x3�}�o\0x�^o���F���x�l1Ww��7�p�s�+�����؉+����a��%X����D�?r����(D-H�+d��/���8�\0�X���M�1���I��<0T�B\0�2� \"��-�1\0*���������jr\Zt�\Z\n~c!���|��M�a�g!�?�h�L�5�-����F4\0m�f��\0H� \n(]K��W[���@�\\���\"o������3�\0���T	�e��ӹs�P6q���\0�����ƣ�A�E�\rT��,�����\0W���Z(�Z��<Ŗv�/�{���%JO��Ϙ*�b/�p��:�0X:^��e�)K�BR�E1���G�	����\0G�7t��o<bu�N��ض��/�\'*��mҰ�k0{�R�>�Z�8��/��Bō˃�8���\rZh��?V���g��CY[��D��� )r.�1���/��۵�\0\r��\n��[X5���)kbv�*�m4��S𽕌-9�����L�e�yb2!����KrQ��L\0�D��i�v��-�Μ�����JaQ�_�RƋ}?LN=�U[�Gڣ6z��\0ӄ����^߂���P8���Z�,�B�[����{`j	˿�嵡����|\n������x����A���Iv�\'�\'�p-@�_vd�jy�8�)�{g/�k�ݖ�e\\��4ɏ�Z\0��[ex��\0��( Xm���cL��BH�BX/�#�c�*9����Ÿ��~o�)@\0�ZQO����Q\r�M�kpa���6�Qy��;}�\0��hN\Zo�v@�\\�u�P�\0��|o�@��PQ�P<W�D6��*��}1.J�W�s��\n���]/���P�:S{��,NH�\0�ߣ|4�si	�-yb�����!��p��Y;k�k\0v���&����k,��X*�8y}�QȂ���+�NWpQ@\0>!���@��2-(�I�ʯ��~O�24�G�>h&���UU۹G�g��E�\0B��=���\0\0\ZLW�C�e&\Z�͌��EO��Ƃ9\0�{b�\"��x��_������_�K�\0�F*�FN�%����qВ��H\r��,K���É�����B)���|�x\0�@dc�W�kFg�+.&���`g\0��\0��E2��::��*B�Q���q�>t4��Ss�}Y��6���enƶ��ԥ�~$\Zp�P����1�E2)�q�\0�R�`1i��Eٸ<#2�Wt�~�<s\n���5P��k�P�:�G����~\'�����&����kvWd��7�\0�Y��$�����͍^�$B@��x�1��ex����~?��tP��qG��\Z\0�\\�Iџ�L1�җ�AR�.^�Dc��@�UF�����`�+����8�*Y�hW����8���\0�G�?����~�^���ct���՜+�4��qwWa���~e#�Q�A�o�a<9��<�\r���\0S���̵ Ep��^��/��X/C��A�\Z#��P0�e�~�Tj`���?3\0��O���1����������D�SR�r�����!a������g��9��VF�9�u���T�g����\"����\n<r\r�\"T��1����\Z��a���\02&Dy�ӈ,C����>\0e�\Z�^��\0Q�G \"�\0W��A7K�M�@�Z�b/C�*q�>@g�h�����wa�.��(&����U�՟�\'�T,��Cʵ>ƭm��F\\���Cc��e��\r�&F))n��R��:}Bt@��}t�2�_�����8ft<���4��YJɈ���zA/�S2�p�ҿ��a��9�H��}�?�D$��Z�xD5��O���p4��T+���ƨ�9D>E#�B�Q����إ���\Z�����M�j |�+&m�[�Gmj�n�ʉE�B�7\n�E�o�0o�!f9���u��27,~bޒV�{�z�+�!�go�F��<R�w�\Z=���h�߼�]n���.x����I�U+����W��=�����;=�����\\�-L���]�by��\0���{Ce��|�/�t؟z1-h���)��zԻ\\5{E~�[UY*��:�Eh\0�tZ�{�0����������Q�n��`�A���g��-@A����K���Q���(` Ud,�����=\r�F���T�6����m����g���j����b褭�9�j���[b��E�B�����eB�ZX��C:��\0C�<�����i�h����u\0\0���|W�G�?�M����g8��ad�\0���R\0ڰ䈭���Dߓ���`�Q�a�n����׳~�SB��	D\'�D��0�uy�\\��Q�mO���\0�.8c vV��_A��$��^`�=��.�AO�P�(\"V����UJo�^�c����Ϸ^�M9S�*|��q?\'���5\ZJ�>��JЅ4���|��<#�-JSlR8;A�_U<8�6��tM����R\"��k��\n�z��\"�	�Y<1S8�R�S��O�>,�}�[\'0�DU�\nQ��d��I��������������ڃX7��j��t{C�ك�w <��	e�C[\rTݒ��\Z��M8���a�\0�����v)�ɑ~�\0��\0��!P\"�\0\0�1D�i���A�3�\"Eh�Q5J�2��1_��<ެ�}+��`I`\r>����[����K:�R���������\r/�p��\0\0L�8G�.!�\0��,�ȶ��xI�R\'\n�T`�*�Ŀ/�Z�0[n�&�fj��-\n\0p�-��Z�t}h��O��\Z�Pv\\�>��}��;�\0�O���<��<�xh�`Y˻�A�U\0P\0�?�p���@tvy\Z~!.\nt����\"4=\'�y��q?_��]��\0�r���\r=5��\0o��KS��O+�ÈUa`��β�m��\0�G�?�-AiW\\�������_!��|QD\'����B�y��eC�y�����*+�2���\0�H�1��z�^)+mB�l{��d�#����q?\'�X�˥=�IȽʵ����V6�@�TՒ�^ޥS�g�\0&�h�@*�,k\0<��|�wR{�5�`�������噪��?@���]Cm��\\.^���M��_�� #a��\\A���:��\ZJ��}4�rDDy�7��QX��TK�U;�5��8����/4I����Ň�]	�����_�~�h���,1h��˃�\0jʘh:�a� C}���惐k>�Q����m|���R���<%�<��c9�CD{*\\�n\0�l�<��3l��w�U(�4-�ȝ?[?��H�������D��§\"�|��E��>��8����Z\"n2��T�A���5�\rmN�7�Q\0@�i�u�)jƃ�h\Z��<Ҿ�\0]��\0�i��%�cԠ5�T/�V�\"��dit:�����h��d�D6��]|�z���:⻡srը}�b���{��\"��bv�౎����|¨I���suqP{�}�E��k�M˕�	�3�xL?��!��L\0�Z%s��@���	�)Am9�GR��D�C�.\r�\0�s��T����l����j0j�BSbh�Q���M�K6_?ɒ�t.�����p�$���\'C��Dh<+���s����XB�?e�K�K��H|K��c��H@�9��\0�U���Cţ6h��}�a^�U�}.������t���j��e26&�h9(z=XUmW�\"�����,U�z��x�\0)7��p���O�A]�<�4\"�&R�*U�a�\0b�u�e�q1�����l�>\'����A��d�5�nyr3Qe9��gJ�-^�Ǹ)z5�j�!�fX�I�u)\\\rX#�*\'���3�c�����L��[/�\r����P�M�W\"n�@�.t�p;��E�cʟi�E�J#������=�a�a��9\Z%\\,Kk�X�s}Y�R�0=�唶x��*j�l�\"pB !^�����Pl\rc����?\'�ȑȠ�\\Q��Ad��.չ�ň���ֲ+�EҼ��!Z,NǒsZ�AG>у�U|,������Sn��Zr�����T uI���Dғ�VZ�̲��@t���~a	�U�X�>�r��Gk3��QP]r3f���f���&�&FQX�p�?�\"Q���������-�����Y�Gz(���pKf�G�v��\\O�ο��	NƎtƄ�E����d��%̩A��*v��-]��<�A�[6E�;�#�?Jnc�&t^KQU�ĺ�[1��vl��y ��Xр��!�\"9�P�V\'+���1G�C�z9cW��Oe�|~`E_\n\Z�D%-\0��9p�̖��T\\Te	�Y	�,n�\nk\'1@Y�z�8`�\0E�X��aKD[�\\��K�\0r�\ZQR�\0^ι|E`G�M���h�T|Xe���\0�#V`��{�e����>�l��^c������|������y�f*!D�������~vW�T�R�.��G�<�w�H�0肂��n�)>d\Z���,F���\r��*m�f;�X�M@�%l�궗]R�X�DgV�h<�#ryޫ�	��y�G\"��_���	�8��*T�����έ��6�]0R4\0u���{;-x�膊[->������R^�a<����>?λiK{#�S\0���1QkAj���66)\0�5p�v�0)�\0U8KYRiIL0��\0K���\n��h��ؑ/��೎ƈkNU�W�c��~��%���wsW�A���##`Rk�_B�|�{L	��1MA@Q�^�/�:���[>&�m��}u^>��<O�J�*T�R�@B�v<aJN��sb�U�$�L.#����@-<���_�\n�w%�i��t��$�;�2����M�e%�Ď�@�뺄A�X#���,U��+�?�R�C�� r��\r��E+*$�L\Z�.�kAa\\f��ۻ�P}�m�[���H�$�[)�<.�exc�r.��V~!��9����6K�{�	7�5�b`�	�$���-\rX�\0��<�vw��0C7�/��챶@�*�g/�E0�9z.�b\n���Ê���G�\'(.<}�>�ȣ���\rwi�M3@=���4�P��M�����ʖ*I���]hv��pF���O=���N��\'��b%J�*T�P3��6�$Y��Y���\Z�i�X�%��������M�ք�p�f���_1V\rdKg��U� ��@�2DY4CK�����i�q�i���[��R�C��\"�\'X����C(��ީɲ\r�gv��.p���UWwMB*\"�j�	Y|T��&!1���A��x�a0-rC��3�\Z�\'�/�u�a���T�9�\0�})��pO;�m�ںV��)`�n^(7(*�U3�\r�\0�=�a\"�V#�Y�(W$�/�pv�++bM}ھX��e3\r\')�-��&�����\n�V~5���������uO >��Z�>��!�d+���wW�������X�\0�_v^�0%�?��0J�\0�R�EZ�_\"��N�������+Fm�� 1��(�*�Gnye�\\�m�m0܅�-�<T�86@[{�Z��a��1P�j$��Ld=X�J�\0��}�j�ExP�,��Z�0� 4/:�����u�X��׸ǹT�E���v}��L��O�e0^�`��k>��(H�W/& �e�e�)!�V�W�2�@����[	r�aZ�Ye�إ�h��\r�Dr��&O0EXW��^\"��,z/�CgaO�0Kv�vۖ ͘=��&y�a�������Σ۱�>�*`�P|�ѩ�]&��M�kB����0CLCW�$���f0q�����!�.��E#��\0Dq�2�+��O�(]�ڹ�n�ZP�V_d3�Hj��C�\r�c�*X�cƨ�8̡{��h�s\077f3���-/\Z�e�\"N�_��&�L�e�l>��r���<d\Z[^�C\0�-�\0�T�PQ��݂P������ZR����\r�3k�*SA5!F��c�K�.���\0�U�f�@�Q\0ݐ/����vȧ�O�ōL6��ӹ�\"�\Z��qWj�b&@[E���\0j�\"�SPRäl�Eh8+��\n1��|��fp�X�K��UjM�6^�XX��J�X>c��AL@�Kǃ�Uz�#@��nX/��ؖ��T�۴����ط)����Ka�<�<�/\\�\\��Ԟ4��z�d\0����3@,���C�d��vKS9 }�\'fo5I�?��Ҿ����*^���aV��#AA(�Qy���O�̎O�C(\0��d� �\0j�҂�B��~�˓�v\r��D�\rw/l�@⢙|\\ \r\r�E}��Д�i��a��Um\\���;aC8�[��-k�	����<���Q��v&�R9_�U;<��E>!Z���p��(|���K䬴=���#z0R�e���A/=X��Va:��F1����,$\'���@:L��˗��J�kl\r!w�/�-�j.(��|@�2�>͗D\0һ�iP�-�{��\0���D���\r�4\n}`�@�5�)�)j)Ѳ}�8G7��2��#ͯ�@q�O*�\0DS�>.�r\n�Q����0�J4ֱ�*T��=��tE�=�MK�$>�`�J��r~�Q@�S ��UV��1	�Vl�wS7mw�i���JĩR�J��Z�.]�����6/	� a6�;�t�]��.;bQ��.I�y%YY7\0+���.B�H�����ȅ��J~���_�\\���g�T\0<���2<0�E̩R�����|�C+�a���#�j�R\n�qX\\�]�b]�m�t��M,An��>�<�K0�F��G\"�n�t�v1W�Mލ��=�������\0#ØNj�P	mE��$lo?��+\r�����)��s`���\Z(k�C���(��R@ܗ�3�_*�C�hB[�W�#��ІT���*P�3�<A0	,\"���̶)�m=����R�b� ��H�����WpZ���ؼ��\0yP���KN���)�6��r��l�<����\0�	�p��Jk��F�g���[�/)�z*!�[�o�q��:�d�\Z���6p��!E��~h��뢔R]�pp\ngJPkyn߷�~RT�R�W������\\�,7���q�^7k�&�����`�kr�g�-#�_�����Fe�_#D�O��`�J �O��[�0Pݖ_�\0�p7\\�����/p>e�T}.m�VeDXz��\0�a+2�AG��A,vw2�E�^��\r�D�H`���KAL����Ѻ�Q����ܲ9P���~�l���(��<���)��@.����.���3yoJܻ�I\0��˒8���n���g`���%d�s���\0�I\\�.6sg��̰)�*M��?�H\0�d�cԷ���\0s8��ZܻR��-%vq�тڕ\nN%-��^P\'Gv��~#T�*5��l��b:�J]���1Z*-[@|��..S�M�[�[�5���jn�8�u+,���~9*��\Z�� ��Q��Y����j�7�/JERP����B� W�l��dP������*T�@��9�bD�WogST_��tF�:����B�	�ح<��;���������1���[���sP��-�����c�s\rf(�E�T2�A!}����(�\0}[\0\0\0<J�*^����F,�(4���T�����)r�jT<-@<��vOG�]\Z�2�\"����BHՁNe��v��nos^���+&���kgqKe�%���F�6�NU�=�2v>\"�,Y��6c�K���v~�]��3\0�[�pD��W��?ֈV�W�T���Z��İ���Px�͔�Jj\n�`��R<��%	��˲Y\0�\06����l����\0\0�<@\0\0���P��_�$@[:�_0+�{k\\\\h!�}QP��d�h\n�[p�h�Z�_0Xhi�@`�\0�$͵���ׯܫ��v+��\0�%J�q�`}]�B�^9F��~����[��$W���d�h�u����M��Q~\\p���4UV͜�͆U���\r|�����Y�J�J��]4@9K�O�r��\r���R�D6Ta\n�S�#��J��sr�S��Xd�Ua�����.\n�Z���S�����\'��%BV,��dšX�K�(If�\ZvE�2d��\0�5(��<�*�G�F�r���.]�Z;��h<7��@����D�\Z��\\�	��Н_�u�z�C�]Q�<G��l�����P�Pgz>�ɦ�=��ւ��\n�F���A����5yM�b�{�@Z��ʾ����EB�-�\r@��\0��{����{��m@��c)K�������{���)~ ��0�\09�7�/�0ri�7���L���c3��N\r�TB[!]�̵ҸV�Yb��$L�vt+�F%4^�J���B0���\"�7e�pN(b�\0p��fPD���dl�dR�t�0��ȱt��$��\"�g\0�4h���F��D3c%-_$h2�r�g��F��M֏ؘ@���\'�\']f����%�@l����fھ�/7U�\\�/��ň��e%%��=ı�e��V��n�Ss5\'.1j�pTj	aR�P��K� �LER����V�b���cV1u�h���5�Cp�m������BY`�����:;�\0z���Qo� �����1)g�	z�+��]�$qPY���/��\0��*T��o\n�c�.y�1\n�����(�^<�\0)Fii��eH�c�H2 9d�����}��)6��\\�q~�ÛRaj��A�鯰���6x��`���V��C+�+3z��r\"�B�G��`�Z���j����\0E�95�*T���)U�6z�PV�����*�iw\0�\n*����ƸAV�\"��\\��lh������B��e�Sj�b7�bE�����g��D���\0�cx�;@��w\\�炤\r��H2�9-��3+!�+\n~T�z���44�H�1Foj�C\\>��Cا��*�^�5�J\0����?R�!P��d/}C{J%�8�Dt�9$.����O�MX%\0k�w_D���8�B�C�3Yb9�UmDK��)��~J*���b��������@Фi�Zn�W6�e��od�\"c:|�P+�`����j�C��vJrSu��;�@h��U�Q����c���]����Auf���ӸSt�)�e��k��\0?����*T��I��\Z�\"מ	a�*Jt�x�?h�ކ-l����u6�=,�llM�-��3:J�/wQ\ZR��g���� �\n+�\0�S!�\n����e��3�C5[A�0���Ch����pW@�i\0���36\n��z})\\O\n�|-�\"�*TJ�N�&W�1S�\"�h\'��Ք����@Pa����1i(=^\0Q\n�c�b.(�US׎�(B\"TU&*�A��4�� *WpO�ȅ�90wQ8\0��8�����V\n\n�8�T62X�,�a\09��GJd�͇�gG&-��Q{�W�XhP�g�*!��Ɖ�Z/�n�[�D|�0.�i������wY�ůI��9�����!�s��A\0���ik#�^F\"�e��ǐ�ˑAJ��0����\'f���h�A[\\���*i��\Z�ɲ\\c�#Y����	����E���;�X�z������T�c��Dh�ɂ�5�c�+�Y}F���E���(5��N�de�v��?T�Q�Lŉ�Lvuں���-�$A@��)��*�Z��O���ю]̫���z����ڢ�`Dr�3yd]4c\rb�nT߻c�h�{�Ɣ�fpDXWa��3�#�W�R������vؾsA|t���{�zl�i`iV�~	p��	rT��\Z7���%�9b\0���\r��^�o앀 vby���`D�ȗ�B�,��(Ma6���ȨX�2�\\��`/����HJ\\�9�ˣAh��\\1�\"(�_�8D\0�]���a�Jy\nC:�:Y�7��a�H�v�<#O��B�<a��U4��)]���pR`�&���~�$���d\n�3��0IK�8�H���σ/b`������2Ca��#���Q�W%�[P���w,�ĵ��H���@�\rf�\n�-���vn��B\Z�v�\0\0?9]2��Z�o�Q}�2�Z�y�2���88�A|�8��B����yn\n�Jԝ+^%J:������ĥʫ��(!wJ�\0��+Po���}�up)\Z���@j\"���\Z�#��Ⱥr.�����SXq�ʹ���̥\nA�$Y�u�Ft�eP���p4ą a��w�J��厂:�#��;;#�� ��/iZ-\\�~B+�T���C=�\n�izp��Ch��6Vk��*5�gD���Ӄ\rl9+E䴔(0B����b�	CJtGd�1jhk�����V��[�A���]�^q\rk�:�i� `B؛�{�̱@�5��`r(\r�Pn���o��r��AP	B����RB��S��\rTۣ����P��F�	O��U�J�L%~��= 1\Z�����DX��]A��eBT2o�|�*e�k�/�a�\Z��1Eb4��u���py��p/R�W�h�\0(���,�k��*�_���?z���H�b���j��\"���i:%O��A��{/�^�\0h�&j-J�\Z�\r�Nqf˩Xr0�!`3L���9��\Z�-Z�,5�\" ��h��w�R�J�*	{�J��\0`Sf����=�̩P	�辅5�A�Y�%\Z%�M˒��1����\nh���A��������_�P���6�����{��yAOIO�J,����Y@r�Q���(\"�b�$40��l�e�i[+��!�F���S\"ڝ�\0%��q���nm�e?x�\0\0�e-�WMTdD��KN��j�\Z%�gV����=*��Y��[\0��\\�j��42ׁ��Q�[l1\r� ]�<!�/+�z.�iW_��7!���4�S��h�u,!E@�Ӕ�KJ�l)m�n5�	��\r	��f�4��b��)���W	Ŝ�%��U@�@x����Ldf�5�@4B���B���.�d�r��ѿ�	�]1��}����X�]�r�x�4�G��&9�l\"�g�\"�$5�]lY!̚\r\r��1���V�\Z :5��]�>��QTȈ�\0�.�wmy5���Pij\r�vs���j�֡�@��f�`\'c(�*T�R�J�*T?�;J)%�\\�zUz�F�P|Syͅ���\ZL�^ez+m+�?$g���?�t��$�~+�`�nax���\rX�\ZC;0��)yDْ����)͜�%C�V���Di�nȱ7f;Xa��hR�+G���.Y�Kh�����\rI�z�H�f݈_\n��\\y�4���Q6-Cb��\0/��A@�T\r/�Mcf-+����%d�+�|Fa4�H���K�V��鐎``�����\0�\n��rU*�P�\\�h��y��\n�İeAv�[y�P�vBl̹�1S�F#}���7!�ؖ��G	N�x�)=Ĭ!�����CV��db%Nx˴�<�V�Ϻ�.RЀ�WJs]]�>�#d���1���}�/�fWcu�,�MWo8�!\0������-�KA�V�D~\n�����\"8�ˡ��!��/R���9B�8\Z.\0��B�h=����z@�9�D	�;W�r��� \r##��1\\wn\"�����T�R�J�*T�R�x������OlR�M��P�e2��ǟ[�1����\0����5-%�H ���Si�T\\�6�_I\ZWv�Z���\"ԡ����Q\0Aw4]��\Z2�	I�{�r��\\�AG�X˗1[��!��\0_a�!��RYu��Kpf���7*i�S� ��T��D�4���(�����Y��PB�W��5TQY}�;9��\'0[�a&�\Z��Rb1�]R��ր��\rՉ�J��X\\�r�����bn⎂���\Zԙ�Q^b�L�\0m�Z6\n��w,J+\\ �)�@�s\r@��i;Ks�EPa�����sõ�5\0��p�;7�(@�b��Ch���KlFd�I�Xw}Ե�	�+<@��+ �\Z\0*�$��14<�H��ӌ�bB�ʇe�\\>b����dj���m��p0 �����8\ZK���ҕд�b�V��X����?�S�m�]ʄ\"6h��ʀ�;`�\n�(|�9\\(�UAy����R�J�*T\'0�$OK���&��\0p�7��F�@�j�\Zn��B�6H@	�������>Sv���T*���~��e9h�Z�%�\0i��մ=¹�J��2�Mn�aX��d�ʆZ��V)M�c�Q�^��~�0�t���\0�+(E��g��,�>�b���[�*ڧE�!ȩ\n��2�D�›S3��Т۞�����/�tv�	S\0�zvACh�D-�Pt���95�B�;��J�P����U�BK��{�F%�a�����@�\\J�t�)�%�S��K.��mM�{�@c%+�Xu��Q�\0J ˀ2 �!͖���OL#,��� ����[ϖ@n������@�rC�!�-v�`:Y��,��	�Ұʜ�8wm?0BԲ&\r�KM�6ۣE������HŲ2�Tx6IpokbcMTEe��[m���f-?aM�ĸ�U%4�W��I����mA~�J��	� �탦U����\r�ޠ}/b�1�c2K\r�,�Ⱥ8���d\\ڻ�	��.��1�i��@��qA��(B�K��-D�\Z�m<2��Rd�u4C�O)��m����\"¢��S��$�Q-JNAgda�C�z{\0ш�eP~fM�y�4�\r��(0t���lۀDt�F�P��V�/�#�ޞ0\\��90X�9cÁO\rئ�e���%,�IMG�/�f��\n�`�⢐�˻�6��[��\r��SH���Z�+\0�u�x�d\0���ٍ�D1Ej)��D0-u֪�0Ÿ&\0��V�@}�&�f����}�\"1.�A���P>�:��	��@���˓,���\'B�~��!`�\0�	k���o$\\4���t�`�(Q�Zm�ޢ��4Sf��1�%/	�����]�e���FLIdyLATë����YS�-�u�#Ais�)#P�B���ωkru��;��i����;h�G��#5[k��`*>�-kɠ�&:���o�I\n�#���@�Qd ,D��f��I6���Oe�j\r��AY\0���sWX}\0ኅP�JӦ>ƙ�`�������\n{��Ej�����rɏҀr�@�et!�MoU�t�8k5Y����l\r��4f\\ˢ�ێ&!e��Nq�#�b�4�3�H4���:�������M9���\r�-KG �2�>�륄��t`YI[��g6�tVHq�WmNV`s.\\ż��v7\\b:�]�y�%��`<��\0@����š:�e�v�,`_^�|P��\n����+@ٮ���a��{��5�����d���\0���m\'�\\,��E�v�!`����̪D�����ԧ	�z�}�[hA���6�\'��%����++�x�*)�v!}�.�M�o;^�0�W�|nQ�WE��Nh&Z�\'�/����(e���4�<��T���K�n(mK�%��(�	JU8�%�����t�y��\Z�6��H�Jj��)N���\r&��J���m�mݱ�P���.G��U���^S��\"�\n�:j�J!���.�h>������q�5�\0_Z�*U}jZaK��/�\\(a}\r�r� �%��!v1����.hh}����r��A��A����\n��P�)iZ>�G]�=�����D)\rSB�1�%!%���P�Xm�H��T��0��\'h8�>�,\r����`�wMJ�U�y��@�7A�����\\���S4K(6*����0B�\n�o�_1�ϸ��V���EV���	��pE���¸\"\r�ݰ	xJ��Xm�\0p�Z��+@9�2z4Xt��0L�5�b{c�?R(���3�^w\r##j�W����-�\\�G���/�_����a%T�I[\nV��M��\Z|��fT�\nB�J#ȝ@���C{����������l``��q������R� 8B���a����}��qS��Ӝפ!�P���7P����[�Y��8�^*,��18����, ]/L6��:�y�/�i����<@U)ce��k�����ƠNʗ&2�|����|M\'��Q�\0����q�qF\0�勮(�E@��^e����$��`�NH�/!��@8���1D�#q�[\0��!z��&�K�1d�Jf�Ĥ����������Mb�h+�]6�N�4/:o����\"RC�1�J��x�2�g�W/�h	\r#�F� #��8Y�_1���&����ip-r��G0J!��@REЈ?zK�\0�`�1E��0��B��P!dS���h_���T刱ʽ�\0\n�\"*���\rS�?1gp):+�06�e��]-ܬR��b�����+�_���;~�2�6��ae��ѧw6\rT��/v������L��FaF���@�bv���5�Q�WV�\'�Q�ZQt�\0E�FQЦ���0oF�>�M�Y�^�s�$K%#e�]f �̠e;�ܙ�H�4�;�q��Ӿ��Ɗ��mՉz2�J��K [n��6��2��Z q�6�Up��\\��,kkCtP/\0�i¨�p���r�,V�zk�Z��bV��~c&Cl��KsZX��M�#��).�0�$Q\ZB�<�	�Z�ր��\Z�h��W�Ѿ&��z��rjV0/[�SQ�7T)(��Q�#g\n&l��h���%��Po;+�GL}�`�h�#R�*����i�c={9+��n2d�E����\r���6� �04��]��`���&�!0^`�	�*Xd��P`�c��i�A�[�.\n�v�*|\r6��ж&Ă��\04*����TsN�y�M��RU��	rس����.�`r,�Ϊ�����& ��8&*⛪|��¹��@4Sf�IeY䃜ɔV�;f��E�7C���M���}���D�(�\r�\0�k�!a�(��7�k��D�V����5e�5�J�9*T�Wd����U�{e�u�/ 팎B*��1z��j0����r�*�F����@0�? y[�ڻ��\nXҘSbzf�P\n���gľ��qJ��dO�T8Bn�X�!�kk��HB�T1hQ�DH��\Z�C�����(�c�ŰQk��H~�pHSIMZy̹˺G��\n\"@`\n�\Z\0����1u��_ұO�����A�����]s�1���4\0����f\"�.�s��>�u�[�%:Y�*���wE�@*~ut]f�L	6\\���H���s&ᮠ��k�QH��p�0�R�4a���]��ǉn,&=��\0?��˨`�*\r�f�G��C׉H#[\n(��7����Z�KԱ\0���\Z�%d������̳�����\Z��Y���VNw1r�<��+*�!fƬU�h�*\0\0<\Z�\r�v�g��01��\0\n�#�a���<1���4�C�%�{��C6��(��W�X�mK�i�W.\n��S�\0FX����M0�2J�N��:t�=����ݚ0��!�M�1�>���\r\0��YM:�;�\08�\0i�	�f�g��P�ѕ�m!U�a��WR�^��{�֬(�\r�oq��-\Z�fE��堲�s\0��,g�@�\0;�a�?���,2�\")�5b����I E��}�N`�@q�6z]��vA����\nRP���!��FbJ�28!i\Z�P\0f�V��l�0�mIt��s��҆,ӕ�n�2��fy䍔F�.�0x9�4T ���m�\0ɗ�@G�\0�c��ёĕe���K��Z�	yy�I ��&tp�0��`\Z��.���TjX\Z.���P\n��V!��Tmt�3h��\Z�,�T6��Ȼ-<661c�����V*M�V�\ZQVE�mW��� \n�J,-�������Gy���t�bR������h�� � �*e��(y���1u�<���\Z�2\rn�S�j�\'dIvh!d�o�\0���h�*	4`j����\Z\0`�EMc\09V\"=#�*`�\0_�}@L�>�����E��\0f:W0��\0��	 Tq:���Pbd�U�B+ej�� T2�1�\0\rZ�{k��6����\n\0\n\0���\n�V�I@�\Z&�IDA�)ܦ�tP+�\0�����֦^��Oqr��(��`W�\0���');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studenttestrec`
--

DROP TABLE IF EXISTS `studenttestrec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studenttestrec` (
  `strec_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `test_id` int(10) unsigned NOT NULL,
  `scr_id` int(10) unsigned NOT NULL,
  `score` float DEFAULT '0',
  `date_taken` date NOT NULL,
  PRIMARY KEY (`strec_id`),
  KEY `test_id` (`test_id`),
  KEY `scr_id` (`scr_id`),
  CONSTRAINT `studenttestrec_ibfk_1` FOREIGN KEY (`test_id`) REFERENCES `test` (`test_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `studenttestrec_ibfk_2` FOREIGN KEY (`scr_id`) REFERENCES `studentcourserecord` (`scr_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studenttestrec`
--

LOCK TABLES `studenttestrec` WRITE;
/*!40000 ALTER TABLE `studenttestrec` DISABLE KEYS */;
INSERT INTO `studenttestrec` VALUES (3,3,2,1,'2014-09-03'),(4,1,2,NULL,'2014-09-04'),(5,4,2,NULL,'2014-09-04'),(6,2,2,NULL,'2014-09-04'),(7,2,3,NULL,'2014-09-04');
/*!40000 ALTER TABLE `studenttestrec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_f`
--

DROP TABLE IF EXISTS `t_f`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_f` (
  `tf_id` int(10) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `ans` tinyint(1) NOT NULL,
  PRIMARY KEY (`tf_id`),
  KEY `item_id` (`item_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_f`
--

LOCK TABLES `t_f` WRITE;
/*!40000 ALTER TABLE `t_f` DISABLE KEYS */;
INSERT INTO `t_f` VALUES (8,3,0),(9,7,1),(10,12,1),(11,13,1);
/*!40000 ALTER TABLE `t_f` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test` (
  `test_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ic_id` int(10) unsigned NOT NULL,
  `test_type` tinyint(1) NOT NULL,
  `due_date` date NOT NULL,
  `test_date` date NOT NULL,
  `total_items` int(10) unsigned NOT NULL,
  `total_points` float NOT NULL,
  `title` varchar(100) NOT NULL,
  `duration` tinyint(4) NOT NULL,
  PRIMARY KEY (`test_id`),
  KEY `ic_id` (`ic_id`),
  CONSTRAINT `test_ibfk_1` FOREIGN KEY (`ic_id`) REFERENCES `instructorcourserecord` (`ic_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` VALUES (1,2,0,'2014-09-30','2014-09-02',5,5,'Suka',1),(2,2,1,'2014-09-23','2014-09-02',6,6,'Exam 1',1),(3,2,0,'2014-09-30','2014-09-03',1,1,'quiz 2',1),(4,2,1,'2014-09-25','2014-09-03',1,31,'Exam 2',1);
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-09-05 16:24:40
