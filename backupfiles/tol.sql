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
INSERT INTO `students` VALUES (1048064,'Zenny','Becina','DELA CRUZ','BS Information Technology (Database Systems)','Female','[BINARY]'),(1058167,'Joeper','Pantaleon','SERRANO','BS Information Technology (Database Systems)','Male','[BINARY]'),(1059897,'Jofel','B','BAYRON','BS Information Technology (Database Systems)','Male','[BINARY]'),(12345678,'Alberto','Martinez','Ocampo','BS Physics','Male','ÿØÿà\0JFIF\0\0\0\0\0\0ÿş\0*\0ÿâICC_PROFILE\0\0\0lcms\0\0mntrRGB XYZ Ü\0\0\0\0)\09acspAPPL\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0öÖ\0\0\0\0\0Ó-lcms\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\ndesc\0\0\0ü\0\0\0^cprt\0\0\\\0\0\0wtpt\0\0h\0\0\0bkpt\0\0|\0\0\0rXYZ\0\0\0\0\0gXYZ\0\0¤\0\0\0bXYZ\0\0¸\0\0\0rTRC\0\0Ì\0\0\0@gTRC\0\0Ì\0\0\0@bTRC\0\0Ì\0\0\0@desc\0\0\0\0\0\0\0c2\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0text\0\0\0\0FB\0\0XYZ \0\0\0\0\0\0öÖ\0\0\0\0\0Ó-XYZ \0\0\0\0\0\0\0\03\0\0¤XYZ \0\0\0\0\0\0o¢\0\08õ\0\0XYZ \0\0\0\0\0\0b™\0\0·…\0\0ÚXYZ \0\0\0\0\0\0$ \0\0„\0\0¶Ïcurv\0\0\0\0\0\0\0\Z\0\0\0ËÉc’kö?Q4!ñ)2;’FQw]íkpz‰±š|¬i¿}ÓÃé0ÿÿÿÛ\0C\0		\n\n	\r\r\"##!  %*5-%\'2(  .?/279<<<$-BFA:F5;<9ÿÛ\0C\n\n\n9& &99999999999999999999999999999999999999999999999999ÿÂ\0ï¼\0\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÚ\0\0\0\0\0î\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0VİIZÅ¼ä¦ÅnĞ Œ=L˜Œ˜Œ˜Œ˜Œ˜Œ˜Œ˜Œ˜Œ˜Œ˜‰6Ö9ĞJ\0\0\0\0ÀÍ§Bƒx\0\0\0\0\0\0\0\0\0\0\0\0\0«n¤«óÖóUìÜ¯Ë˜qd×Keò4xzF$¢ÊIl§´6*lÌĞôhËv’,k¬s ”\0\0\0E¾“…±´˜Qtu–$·€\012\0ÃĞ\0\0\0\0\0\0\0\0\r[u%_+Õr;‘*î)¥Ã´Ñ\\cKŸÑu$³¡ İ;*{z-N~öE¿@ùÕØ¤ê£V{ !jƒdmÛ\ZÌéwkÙs\"ÆºÇ:	@\0\0æA>uwÊô§?»²¬:n\nGVq^î(µúÇ{ó—úgÊ~ªs<?mÊ˜_XòGÓëèy’L>öyKŸxFìşg~uÜV\'Ğù«X›{>è”\0\0\0\0\0jÛ©*ù»ÔÆî‰zÊªÜæ»ÿ\0ŸwÉó}n—G¬Nò†ûŸ²î†ÿ\0— v\\g`mäº.}cy6m³zG°¯ël¸²Eut€\0\0 O¯>cĞĞŞVYBYç+5$p·—Ì«ê_ úêstvõGÑ8şÃ†9{Z‰ëõO4Ñ\'.¶èÙÏö%$×Jºù~›–Iı”À\0\0\0\0\0jÛ©*øŞË›Ô«¬èb®›©5IÍØÙR.R:ÚTª®ëj×£çzŠ4­¯±éV‚«èŠTÜZXœ­Wc‚Å‡}¡9ÛÜt^Íì‘c]c \0\0\nëgÊí;\rÅW)ôLNbSnq³ú8ÇÚi°>IõXÓ?›úDC˜£ú\r™ÎqŸ_Œ|ŸoÒ\'”|çÑ(JëMö¥¶´å9¯¥D8«Û™%È\0\0\0\0«n¤«Ïª‹W)d·>×ğ‡Ò•<‘ô/~]ôcŸ=JÙòşÔºÃ™æ¨9Ü+¢÷æÖ‘Üa¯¡=ñ=‹\Zëè%\0¬¢·.ú^~ı8Ü gÛŸĞrÇ.=yº©Ô½yõ—v<÷E\nyıe\r÷œõDª¸êo8~ã¼æº¤¡ùÓîøñxô¡ÑŞÜúËg¥åÓ\Z:Ú½æÙYåÏKuÀ÷˜Şá\0\0\0\0Õ·RU\rçŞc§Ôq=\\­ËSÂw<,t°÷W/{»’élà»Ş¿Š,}P×®×w±d¥wónŒ™ÍßRß…‚Eut€ÏG?2Ğy\ZTârÇ>üş•wš\\N¸ê gIxÎf³§ºùçaSTYÖk.ë…éssåçÀ°5;Î~ÿ\0‹ç½^Í÷yt\\wMrı\'7ÔÙs®ş{}ç°\n\0\0\0VİIV7Ÿ=æ7¯@“ˆí¸™®ë“ï$YòëŞ‹‡—+z_!ŞRYYÄö|Ï^r³ê-¯¯æ;Ôæ«¦h;g ‘c]c \0\0\nË:´ã‰=ùÆw8bñ^M…¼çƒ\"æÎnî=>}gO\\ZUÈ%çoÑ|SéÛªºZÚ«7¤{Q›Îõ\\¯K©ÎyÛWÇ1ïMC©}}Ãw<öĞ\0\0\0\r[u%XŞkkú*ImwPßUÚñRı/}>‹›ÏÎZ~——î—œ³å¬M?99ËºIrï8²Êf¡Vz	5Ö9ĞJ\0\0\0ªµªN>Lmıù÷ÃÏ×¬´«ïÉë­9l{<ñ®Î×Öp=Ôé9®÷ƒÆ¼ìùñx-yc¼mÔ¹–ŸÎÎ&o/qO+S«°ùí¾5ÔğÒêìŸÚótĞ\0\0\0\r[u%XŞP¦ør%düê)ô_u9>géxGÚMW	×M\'«»-e—¤á¼î‹ÂyŞ^³»` ,k¬s ”\0\0QnNgwæóèÆø¸?Aoogç¹ĞJæ:,ùî_@k./µó:ãúÜı>zúYùïccì­{×Ï|úxùçŸB\\5O25í1°\0\0\0\0jÛ©*Æò4÷P%ß#˜èÍ‚À\0\0\0\0\0\0$X×XçA(\0\0\0\0\0ª¼µPï-Õ:Ë¥PµÃ’´/ä\0\0\0\0\0\0\0\0\0\05mÔ•cy\0\n_k3«ÆúÈ\0\0\0\0\0\0,k¬s ”\0\0\0\0\0ŠjD©½ñ¶Y¾ÚÍ7U±ËŸÑşwtMµâéP\0\0\0—Puªû\0\0\0\0­º’¬o \0£¼ÒµÖÜÜÜÛ†­ºÈ\0\0\0º\"òœ·¢É5Ö9ĞJ\0\0\0\0\0 Î‚røûî{å«n+Ÿô_kÏø¶Qó„{}CéŞÎù•Šwî?Ã°ßÊİÀ_.e®Â\0êxş”–\0\0\0­º’¬o \0-ºtŒoÙšãk3E€\0\0A“ŠÓK›-’,k¬s ”\0\0\0\0\0@Ÿå7k—A¿ÁÊô0µÇ•ø\0ÎDGì~[ôT¾\01uLO#ÈŒE•ª\nöÀ\0\0\0jÛ­*^·Ÿ\ZfUÍ[oÂVmO—Ñ\"4äö´‘™™ÖYÅòÉP,#TcJL^‰5Ö9ĞJ\0†e_W®[¹Ô¨G‘`\04oÀä¦ÆÈò¡³[24‹+Ò€ï–å‡2ğtÜÌäú†Ú›`*ãš\\WjôÆúh\0\0\0\ZökJ·­çÇ£Ç£Ç£È%²™fu¿ß=0ç:lJĞoÂ>Åİ[d3ÃNıçD¨Ò“uŒ	ùÖ:£k–Ë*»CÎCªçåÓe¬¶«ºKšË~c§ƒ\Zš¸Rè:\r\\¨H×”Şè{ÉY/(örk\Zà\07jğ\0óÑØö_;ú\ng¯dcè¹ş€ÕıI¯œé9eú?/ic&†ø\0\0\Zök+Y7œYYYbL®‹I‘åg[x5ùöÍg˜ã Ã|-„‰{*õÓ5î¬Y\r³àÎÍª²®ö\\¬yü,ŸOjæ\'’×å\"¦ÉÛà\\MDÏt5—[£¡J9½)6ÛCHTVJ	t›íĞêhâ \0G¿EâºÄ´ƒ:¬çîê-Ñ¯f³_1ÓókÒGJ“º~Vıe€\0g\\É¬â÷ÓCC\ZÛKe·3sÓŒs-è7kÃY“tb¾ş\r§•¶•©7={Œ}ôm›\nnnwÊ‹Š£ê+4æıg3d7|òÛr—üU4ÿ\0Í—µåôØ„Ş;mkÚ^Ñnêî+eåğ½Õ¥EÖíÑ§·Êªgmˆ[ïæ$§IW¶°ÕõC«$QÚğÍ¤	èÇ-fíÿ\0>½W)ÕóÅ¾Öƒ¥\0\00Ï&³‹/Å6ÒÒŸl´OÏZìÓ¯I³N\Zn1Î¦›˜e’±Ñ&9Â\r‹ßS9‘%æ‚¼ôr‘{AÊÂíyø“aËúZĞYÈ9.“‹ÛV\Zê|[ZÙ¶rónŸÔåİFÕä½ê°9‡K¥9õğ¡İq¨Ó>®ĞÄ¨tû(åÙbQs–Ô§G/Näyî¼¯KD·¼õå9ĞÇ—¤¿\0\01Ë&§‘eÖÆÍúÈÇO†ÜpÄÏ\"›\Zùyn·D­1±Êb\\o¥YzÉ¦5öPcnÿ\0tV~ÇÆ,dÅ•\0 \0óÑÈÂî¹¸®óFeEaY¦µœÔñO|ƒ×¼±¤í ùmºHwUE·UÆvtÑ¾Ì@³­:=¾zŒrÀÇè)Öú.ÚâØØ–¡@ç¾¬òæ«*éÒç£^¼1ÖnÑ3qËnİq—5?Dûsƒ$Xö\'Ue»Ö§•v±M˜DôÆl‘ÒoÓ¸\0\0\0¨åûşJ\"YóÓs«œvéÆêuMÑ¼AóÖ³+LY$=rJ©M§²#yF•¨m×‘&•1³«åæÌÕºQV[U8F½\Z+-kVV›ÍRÈ(\0<÷ÃKÕ˜ù˜æóèKÌHÕ„e\"/¦zúI]¦m4³©4WËŸA²¶¢v5;#¥Ê³™F9é·XĞ,â•}g5zHa˜\0\0\0Õ´qÛ.ùë¤ö4,k:ëšİg^Ü¡ÜÛÑáÑUØráäŒ£Nm˜Y×Uÿ\0våê#Çß¦¾‡WiÉi¢ñwç¾&–\ZÍüçAN³ë¬j–L+p9&9éÑyAãÒxô¾=Y‹!QãÑA§å¥2ì¼ß±:“]|k“;g;:ji~YõâÇ‡*!\\ºó¦Û¯`\0\0\0œ§YÎÅ%¬IøŞúYrrtš½ã,²#y6)»N™1,·Ô	zöæî¦-°÷FZ·Âèk¥åú[H’cÉ,Uòr«,ÒU¥ZÌ–e¬¨µÇ`7Òse#}ô;ÆZÌ”ĞÎ•èñ‘1d1d\\j.uœşİ8æûÖ¨Û*4#ÙŞÌ Øáí–˜µÔxû5\n[­æî[§2\0\0\0‰íx²Æ-¤H?FQŒŠ©U¯MIwÉuÜt{wlˆ9íği×¦%ÁÆ@ö·Ãïæ»ëé”\\õ…H•§Y?ßv.+l“MdÊõ°ó^ó8:ws‡3ÓURöÈ!ô¬Ç=ĞÖWGî¸ê¦Ğ\0 \Z«§”ºµãµhÂ]2½Ë~í{Ç®Ûh–}¹l‰¶\'~xx1Š-¹ş¨\0\0\08şÏ.y¹2#Ltµ…º9\næ&ú¸äzJâ^q°†¸8™Âİ4¯³“…D´Õ„KÎ¿ºß^Š·‹\nqokÌzZ¥ÕÕ™Xœµ”ùno­ŒnÏ€\0\nl–ßmK.ş·–éÓ#Eo×\n1/)QŠÖ|ù”+øâä_Q‘åÌªåÒË-²ùé·(^-Z3¬õèÖe\ZO§==Ğ\0\0\rfÅ$²g\'ì•¸¬¸Û åqÙ¦#I‹wZae¦\'ÁßÏn½fè˜Ë0ÂÆ¬µyäjÇnGEK\"¨+;Úb¶Â§­9›¸ÒÌnëwÔ´Y@\0\0\0êuZò–Vqò:ºÌu¦[ªæTÍz6Ó¶p•°ÛÎÍ·9ŸZ2ÇT\Z“]¯YîèRL<Ëi]i}´×°\0\0\r|¿O[“3°Î¨/,}Öjãß×UgCETuÕ¦a^ÜGÍğú>ƒæö=ÕaS¿^£,%ÍªÉ×Û\n8ı\"9Ë5‹!ç Ï@\0\0\0\0*-Ç3Æ1­l9È÷°JùkªDŠí„­µù–¹Ôj0-àÄÌÙ}‘Wí”â67‘÷ê´\0\0\0\0\0\0\0cóĞ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\09\nÌì\rvb¢»¨s°ÜÓ}ÀÇ Õ–b$ŒÀ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\03\0\0\0\0\0 !024\"$1#3@PB%5A`pCÿÚ\0\0\0ÿ\0óSör,äYÈ³‘g)ÎEœ‹9r,äYÊs‘g\"ÎEœ‹9rœå9Ês”ç\"ÎSœ§9r,äYÈ³‘bfdÿ\0î™ììf£]f:ŠŠ\Zé[»ã‹üè÷úÓ1,Æ¹i†[®©S¡ÿ\0NÏgeÅ„£W‘`ß«¿ù‘ïõ¯ÕU€mU.É´x±iØG.—ı;=X¶Ñ8ş#(¡ZÌVUG$=o´`XC;lßJ&® §“VR«€Bbû*¯~»\r×ƒú•\\ƒG¿ÖhuTSiàgN\\±\n„+Ç¿ı=™­Ái{•æù·4›åjveÎÊ–&³µy÷¢³x·3Ştß…­Ïßš}ÙI[wB¿`Ø—iY¤Ÿ:z“z¶èùÜÕ§{´ôşò„‡MX©l¤+EÛY­5€ş«qv²M e;ßm°Ûu\r—¥ºeI£c%Î‹Ù®‘\r~E‹µaRi‘+1`^º÷ìºEÍÓ5.±j÷X¾«s4ëæ®¡gº×Räf“i–•jõ ³:¼Ñí¹Ö=v{3ZşíåşÎı%\rm$¸´bXs]r‰¦És5+—>V™ğu¯“Bš¬TjåL´ş¥\r*¼9ÚÂ \r%øÙ¦Øè£÷šoÍÔ§{Ú}Ô¢¸b=ş¥ßˆ?½{ähqÇ]ZÀ˜r½#J¬(¯­*¢NE9£Zë%ß6?_òE\"ûE¢¢råb¨íÔ.³LìØ¥¦©jª¬¬Ä«¿Y>¬æc£gRµŞŸŸñÿ\0Ûÿ\0¿MMx¦¡WøìÍkû´Ÿ)Øµª:õFBš<®ÆXşü‰ÚH¤ËKø:ÏÊÒ>­]ŞvÑ¾.±ñ;+÷ÙÂzzWÎÔ>m]:]AÓV#ßê^øiÛ¯|š\ZÕ­»¯ÚÖBåù®\\h&\'¡Z¹XÊÎ*î´bVÃÌäEùùÿ\0 ³yˆÒc{ı–Ï©fßÆÓŞ118Úòºßñïsÿ\0¼(Z`i	j+úìöf³ò4ÿ\0*Ñú›‹Ó4óápŠ¹×Ò9ˆÍ3àë/HøwÛ\r·úÍ·F´ß øõ™ã‡†¤üÛÿ\07Lø=ˆ÷ú—ş_;:ôş]Z#cOÓlwkZòyŸ¨)ŠÖ.¤“)Ñt—¬Tè·ıòf‰?šó`›”_íƒª^¬XZ¸ôİÿ\0ık	é]¦‰³c^)Ğ\'îlîÊUÀÏfk?&¯•ù;TWJŞœÎñJwuç¹US6©|ÖFôsLø:¿Í]ÓUU„°õTôœ¦±2e&ML«MÓ<ííš¿Ú\ZOÎ»;Û¥y	¬²†#ßê_øTæ\"Ş·?¡üQzu°zŸ£¼J0ZäíKAùvR6õŸ5È\'Î«Ê³OX²CÚq¥ÿ\0éÆ²‰Û£qiºtVÍkçÿ\0ÇãíÔ©wÀÓhw<ÿ\0V†\\O÷‘fÄFç²ç®Ïfj4ßaê¢ñ¬\Zm˜=J©Y\n”í×~¥Hº‹®Ö•:£Uw(Øu˜¤ß§ı2ÖQQ&¶£Uïµ\Zu©šT†¶Y@ÙTé–bjiœ&ıb´ºzyW|iÏ~™ÚeM8Ñaº[Ï¤34â=ş¡˜Å\n¢Nª‡’R´k©ÓôÚœ»…¼UM	fX¦‹#6j&Î}*F•R%HZc\Z…;>S\0#-i‹²Ú4Æœv[¦«y[OMb\Z®}¦UÓÕU»=??P3¨Ô_dÌFu\"`²f#:@ÏÖs\n=ş‹õE)—m8›ªƒYä¾õc\"Óæc³QsîôüÓ˜l^]¶}a¸ñ (1ÍEÆ³ïOÍ5äÈì¿dÅİéùŞ¬bfeXûm—w§æœÓjòf¨ŒajœAø­D\' ‡Õg³µÖO¬ûÍ¯^Òİzdju›”†ŸfÛ,ó”âbµ¨ó3“fÉ:ºÑùæ‰?Ç®~”²iª‹ÅúœíJ€ò¹àG¿Ğ?fšK\r0mšô­%îş¬Ü~³UşüÒªÓz)ıöimÜ3Tù9M;e\0RÃìGôŞoIšI}ÙzÇTòg&&0G‘,!aê³ÙÚ·[ÏğôÓZª|°|42°½ÌJÚ#eÏ•WÊ¶´¸á¢{uBåvBaz$ıúß»Kù¹«ÎÔ´ÏàG¿Ñ)Ò¨3s,ù##İš¤şFi_Ó©;›{+3¤ìÔşOefuª7ŠûQı\Z£7lFòc tO…›ìéÖÊTÇ„DF0ƒ^”ªÏ¬Ïgi¬„°(ÍZ.ü\n¶N±®Ì¬ñ°»Ÿ&¾İ\riŸnŒk¸¹¶êøiú4ík[÷Wq!¨ÔÍ®Ö§ñô¨Ş÷ÿ\0RìíWv/©†Ó©ÆYw]™M½\Z˜1$VÑĞ<ÓÛÔ¯¨ü®Í(şÛ¬êØíGô8ú ìß6†x–¥÷VÄŞL/¿×ÅÚK\'×g³Å«ü<eh±Eµ©Í!Ü,Úó²:«Ìãİh„r-\\L7µ¯í¦±m•ièSu¹û4xŞçÿ\0SPŸÅño<sLO&jKç_(7§cQù]•Ñ,@uİ¡¹e:¥/ìÕGfâ£¼Ğ˜Ú{të2~»=šÆğZmÂgn±ñ2¿ÇËµ‚Â‘<^ÿ\0îbS£-eš±ñ§@9ÜÔã•*sÆÖ·?“¦|ÜÖÿ\0z,~Gÿ\0SRø¹^7|ÖLçtDåÀØìˆ’”.©Úa¡Óf=SÇ¯Šû4¥îLşÌ¾{ö\"JÕ6‘Í(¾ÇVS³éŸL°®ƒjNÖ}f{;/×ï	¬£æ9¬|LGôcŠ5‡›Ïİ©‡*š[zvõ²Í5‹U‹+\Z<OYìéqù¹­ûôHûü÷úš—ÅÊÿ\0#³Qù]›í’ÃÎeá´¿Àì +3û0Ë™x4ÂÚÂí»²Ë:¯¢<­zÌövÙ‘&ß+¬OâáÚŠµş¬Œ»x¬Æ–®MÎ}/õ—ŸŞF—zÒf#/—3Ó˜\nµßêæ²PE¢íÈ|÷úš—ÅÄÿ\0wf£?•Øº)€ŠˆŒî¨Â¨™ì‘‚NÛbÇ›?C?¾ÊÙÜ«ã¨¦•¦ù™ä@Æ,İ7FiKõÙìí¸\"U€: ®C\Z°İlf©å[+Tm‰\nk}6ÖR]féÖ:¿MµšzIğ´ë<¾o>›k>›k.Ô{³é¶²¦à³Ú©©DÊ:LÅõ{.A®%”UÎÇƒTWß´äòË¡ÆÖ6‹Û´æÓ›NQ_N¾nJ3iÏ×mj†é\0¬Ïg€’IÁ.c¼cT¶à×@ÿ\0ÿ\0úyˆœ:É<Š¨‰ÿ\0=	ˆ(û”Ğ˜ßü¨÷ÿ\0²&\'ıÌöxm‡Ù\\ŠË@¹ùïÿ\0€÷†²_qÕ°.Á¯ê	ŒN¬d\\ƒ‰;S¶‘Ã­	Ä°Z¿ö3Ùâ|tYËiÿ\0\"=ÿ\0ã¹d\nõÆ•mHÄ¯¥”Kê725Kq“ª[œkÚì{lôï–ôÙ¬êê³Ùâ°¾ U8ÅÌÿ\0‘ÿ\0ñX.)¸2ë‚08CÈiÈ½.Y%½¨OÖó´ûád%gP’àpzwZQLp¤şñ_Ôg³Çi\\Ml’Wî=f,)±ŒÄ{ÿ\0Åkúöûÿ\0øÈ.‹uÊûn<®ÙgVÆUÕ^œ§vxİƒ·œíï.µ‹ï‡\ruWÃ8ƒ¯=Şÿ\0¨Ïg¡ÔZ›\nµZ$£ê¦eÄñïa\'éæDîÄ{ÿ\0Åkô91›o•£¼Q˜ã=•¦^]²¬^ÔgÕíå22>XLğ‘÷»]:Õ›G¦Ïg¡¨î[Ÿ[§İ£ÓıdM}Hv\Z³NÄ{ÿ\0ÅoÉc¾DgÚ¤ôíê«éŞôhT›n¹`_i~Vü\Z“¥5P¸J²y`OÒhôÙìôYn²$1,h‹ }7y&}\\9+pìG¿üV¢#‰FDdÌF[¯†Îô¢{o8i£õˆPü\'©©vqå3åŒjş›=ƒ\0g$ÅD`Œoİ¨_~3ê-³%%Ú’Û#õÚ®D¾Æ\r¦F) Ññ»ú¶Üâ3õ…<±ñ;kŸ}ODÌó1333šk9VYÁ‡i4£RF1ƒÎ³\0öN©éŸ³Ğ˜‚…ÁÆF[4u×¿`Í‹Uvo¬,ÁÓX‚L÷Ã@±ˆ\"‘íO¿Äöô…> é\rnF”J‘“ê%Õø§Î#ÊÄFLyN> ƒPû´~LÌÏet-RÛS­6\nj™q©9Ş+¯&\\XåôîzgìôF	,İ·€` y2r«0Œî$3†Àÿ\0¼<+=©÷äÎØ¶ƒ3~ÛÖ$WDÍ5ûÛ†àx_‚”Ç?C‘Ş{Õ}âÕyÇ0 eÂÈ±;è^%ŸN~1ûÇaÎÃ£y†t×›ÀäŒÌß‹nh¥|®Á%‚åúìôvüÁÁğó\Z§-æÃ‹¸Lç,GÚGƒò{SïËŞU¬,‹ oÆoÓQ¦QÆá\"Øà2Æ<†ñ<™ÛP@—Zã0åÃ“<î‹,î‘ƒSwAÎê9İbeñÇHm6ª¿§¦—ğÄïbvFØE¶^ŸÊ\"ë¿õ”§§cĞ?g£0@ÑÁğLám¹€ÉDq!ÁE\'ÓEQ.ˆgÚŸ~DDVÙÑW.Ë+şJ¬ëWº†ƒî7YC‚és1iRòJ#t+uÆL\"áäPß>Ÿ_>›W-OOGŒ¥–œ\\lUUòïÄÒ#j…’39«{—41 Ôpg ~ßFÁï³9%“=†[aûÛ×ê„å­Ù*ö«ßRäÍ}Wİci\'L¾/Ÿ•§}ª±mCS»e\'¦/ø2glk¸Ê`íz‰¯à²ØBkÚ•eÒ©‰q¤à«jf«+O‹÷*¡i¸T•J4İûj_J©öÄdÆù«AF³ÊÂX0t*³«_Æ~ßDäaÑ›äÎIdÏg,ıáDÈSïÀX``{{UîÆ\0°@c–´ôXÉ²åX§«­™È`û½ûÊê×F°qudpäöØŸeF¦?d8Ç,RìæIÔ4èªœ\"ÅÑ´Ì%™´ÕgÔj\"ªYn,Iîâ9«Lw\r66¥Ù;í9ªpìkfZ…VÑgğ|gíô\n`a%üÙ¾LäÎIdNNóŸ á<¶‘4»ª»\Z/IA+µ^ï¢<«X–Å–+Ú„ÊØ„5{Ceyy=Y^»Û¿mX\ZÃ²5:gƒgN™‡£hnu&ÄdØTå{‚-Ø¯nÜ}:0]¦MêQöK> Q“¨Úœ;/<™ßY®èŠñe¢ÓÒ+BÁE&\r8Rít(|>Ã˜Údc5şIòÃş@L”¯DŸáñŸ·Ç\0ÇÙ*Ï‘,\ng$²g$¾Óı™ÿ\0âµ‘KÖ(·ŞmÈŒö»ÙZ8jıŞF‰ô´ı, š©£÷˜]Î8k[ÆjÅÊàˆ†Rˆ¤ÂÖ bòk!âİ>ÂòD‡<³hÍ£Ñ™`P²yôáëQ¯ÔÎÍ7N—Ë›ˆ>¨6ê3ÉU>/dç_îX9Zœ3ŞÂJGIˆƒñ—·ÀVë]K±‘EÍr+%Ë$²g&p¦wÿ\0Ã÷ŠQC-õë…;û)|V^Æë¯æîÕû¼sÅš\\01°ÈZzğ­!Ààé5V^‘ßyÅ\\°¬T³¾R,ßL,îÚtçq¥…JŒGt¡·vÓã%zlg-:3¼ÒúŒFN§gİƒÏßn¥çë·ŸPîÇã¦6Odí“ÆrĞß´E«`3Nçñ—ë¶É’Ò•Š–rÎY¾oÙ3åú8bÿ\0#QßfÀ=iü‰X?9Ÿm²,BÅkÃ!¦İèß©* doœ±ò³[—Ò/ñSªVÍ´‚«k™©İ.*LÈÖÔñ×ı]›Fó“õLeu0²Œlß~»oí5ü%;DùfñA\r˜ÔÒbæ\r5ù)÷*WÓÙ²€ÚS\\8Ûíı·\Z}8!ï*6\rP_Ÿ§vœNylÁ\"—®à¦Gw§xŞÌî¥\n¬0®¶¯£snàMk=æïeÍû¨ü{Ñüúì™ˆÂÚ`6NKf.v§ı9ıv‡ßgòì“Û\'|/1)Ë\"ŠËÕexrô†}·Sc`eb€BŸ{œ*D—ÚÂ„½~kj¡¢O\nø¦€~ÊAf8?¼2¤çwªŠË+•áP\r»Ò9…õH•jıWTÓ†J!†¢¨çÓ8úÕÓg…Á%«&ãæÔa® e‘<z€%X81şwƒLµ.»;U%ÜãíŸÜÆø¿=FÀó2ß)~üsúí³V‚´’.1Êyı»ùÿ\0á<b\0~ôÈ¼ÚäâÊˆ¥ê[\ZR&­<eÛhˆ¤sáDğ¬^ÍK#ûõ6+Ùï*|-mÁ¡çÓTIwD²\\ºà\\·Åà‡ìÂ™ÈoOMXÀFygœfØ{õò fVp¬T}²;M#»šÂÿ\0Âß³ÀC%‹:Kœ¶GRÛ‡]¥ÂÈ…=£5À¸‡Hçšåà;ÏtU³:ºÙi\0§ÇLƒ©–µ(ÇW1Z\'©w@÷Á(1ìwõià@šåÅ§X¹k†×µê0y…}:8Ô‚PïÙJâŞ½®avØçRµÌ¸–Ğ8˜(drÓÇÊ?SÃ|ÀxäNìÛ f0¶\"ÛÍŸ°ÈÍKnâ3ü6¹kO¦µ0Z#Ãó,õÌ¿mãŸ×‰Ìjl&¡}ĞÑ6\Z« ¥ƒ¡k¶2º¸Ç²ÉØSÄñxéÅ5íê¨ê×ÓY\'Z´ñ.Ë³•Æ ¥®\'9~{Z\n˜(ôß\\–yRÔ\'Ê}\\ï—¢ÀŒ\0ûÏ(²-¦¸ôlÎı.?wÆ9jÈeƒÆµ\n\\¸ VÀÅ‰wñáÔ¼óˆ/§[²Ïô°zD|fóTUÚÇ„%b‘§ñ¼S›^ €mªRESïÅ/Z¯\r«£2$5eLevÃÒ´s9Û`£5H(¯]œœ,œrAà®n®±€RFPÅL”.8æş_eÇä³J±Â]®JÆßÆ_lnN‘ãÉ*Y\0‘¥ì”>vv’åGÛ…;FiË¨ã#k°<­[ó.Ë?Ñ]	\"µ?mFµM…\0­Zk!•;]lÔë7»J¸İĞŞª¢bcÔ!‚¨„*&SÙn&•ùjè~3]öá6k­Wbºê?­ZÌÁ#\'\'²ª!Ëâ>¦«<ò´](…ş²Òå«…IŒs”F8&Î‘ä“äÖ$&ˆ˜QQé_Û²$I5dë¾gl’œc CCGN®60<®Ùşâca®’…r3«êuÁ};N8\Zİ*Ñœ`Húì‘ğ“:ËÎ• â\0­ÑàD1ÍEÈm¤^š3²ìÜ²ês‚r³&ºÚ}CÂŞéÑÅ—5ú„rÛ<	¯=g@Zc& ¢ÄD7Tƒ)YpEsèÒæ,ÖwI&%Y%ÎOî¥Ö®,êïBl]êb*¸†²Äï¨Wƒ–Úcû¹†tìN:¬qÏÿ\0«cóVpu+?ã„m³ûÒ†Ó°µñe	Ş§aOÜ¥\'É‰ğq¾HtÎWEÑÅ8´}ÖY Â®;ñ)ÂíxKW-WˆóM¾ŸldŸ7:zzÑS¿.<å­ÄtÈôğtøÑ8yw’ÎŠ—Ö9ûX%çŸhÂãzüºt@Ä˜’¡(±Æ‡dâm;ˆ´©ÎğœkÔ}“— Ie¼†q6Õc:u·şıv^RÆg¼·µ\"¥1a\08V¦l¡Ÿ‘§=Cé0á`ÆAás[?K¬ ÙÅÔ“kÀ³§Ë:[*ºÑ93…9>aÕ­Aİâ§¤^ÚßûEÿ\0%G3gc\'pû@À!dÆ.¸ªjî9L9\Zg‘‘Äc3e¢acj7òØ¤&¤ÖHh‚ÁdNIô5$]æÙXré\\ 1x`+ï•}ÖÓ\'“/˜ ¼RV¨°ŞGõØúÄÆ¦ÂÙDHÓM)Ë¢=Ù\råı¡aL?›\n¶pË(‘‘5Ü_Xˆ¢RF¹ƒb*Ñ0\ra+¤\\¸°\nœ™í™É-±ü»²A^š=ß¬w±‡Ç\'ì4‘Y7×ã+I×‰ºÅÉÚh-Œèi(›ky¨ã–lg0®x5—¸\n’c`ºzhÄ-[ı°\\s©\0ua¯¶êl¢îº˜áyÃÖ¦rE…¿{«jvÄ\'±Ê£kú.+œ<J*´{×€¦P33l!•ú…9\'5jŸâ©ôºU—*OO‰šª!_o6/yJåxS“=¼¾î[œù„VcËÓ2€>~¨˜è´Ìui±ç\\V¨_#ƒÄ®Á~C¯ÏZÙ2È}Œæe!`»„†ü\\ÖÒÂ¾\\íLÃ3>Q¼îQ¥{ŒÆİF\0’áV×¶‹¤H)´­?ª\'ë\\ò¯1¾tyuû\Z}5Õq8xK¬o–‹jñ²“\ršŠ\'8†WQ*RÓ´X}Xë@)\0õ©<$§¶Èfç¾LùÄìD‹»Jˆî”\0ıJ¾wºüs~\ZÉzŒ>£V¤+ŒÊªŠc»}õ`˜©Äœ\r:ËîU×¸E˜“¯(“ş1\0ÉãÃœl«V©œvÉó<³p ‰î3ŒYòËTN&¼ŸÔMÂÒ‚HVuówFÈœÌú—>3­¿©Ë”¯âÓ2XÎ÷g†ëZÑ±£Q!Ï†iÕÊ+¾añ>šˆn«°XÃˆ!œ2ÇNø1¹òdñ€T­™W¼à­ö`F\0|eÄ×¤X%^ağ·fª!É0=—rJÄ‘ADá¹kƒµY¸ª^\\ÖXdº0š;%½)’…¥Ï¦´†Åe**Ğ‰–.uWÆ‘^2tÕN}!9ô„nª5•Û1¿ùoHÊ°çuVË–.×|Îı9×eÑÁ{äNAg,5©„Øê.nÍò6Œ’É,6ùÉrŞw^ùüÕŞ±,\Z´šÀV‰Œ®ˆ\0µ-–\"¢Õ#9Æ;,UKaAÕÓ÷QPØMû.G’Yİ‘•Ä*¥¿\'eçuu‰ö=N+Ÿë3ŸIÙÒ~8ZsK¬¶9˜E¶u3«1€Ï·rÎYË:‘tÎA³cj×€0P¯ºkµC-¢k®+\n«5¯ü{Õ¶šj¥]GØÚÉqRãÉSÆ³&7Û¨³ä0/‚™‘ˆ\"ŞL¹C\'mç R7‰Uk²İj‘•áp¡H íIwj[qÿ\0è¬­2h¯\n—ÖJªñ+”Åø/îtWZÜšK`F&˜³>›SŸa€°b aÊêàŒÿ\0ôı¿ıÇÿÄ\0\"\0\0\0\0\0\0\0\0 01@P!ApÿÚ\0?û«æ/rÔğ^å¡‹îXN3Šø0AE£œÙö.‰ØŠ™6‘¢YKÖ³x-1¿ËRÇÙHû³èÁtR~j‹\"rx,¸ßü:wVcè¤â4Rô¡ŠË‚ÉŠÏ±#‹\Z³)·g†ä§\\’M¦ÒI7Yñ·(³G¡#ˆ”[‰ÄTëCÖ¾bÔ©*¦<Èe©t5ùèk9²Ôº*ïÌ±¬¤ÿ\0?2Ô®²‚lüËRÍ+6O¡jX«Îä‚<°Az£l{Ş´EšùIå¢§òçßM*c³ú5?*Š «ú·õ§ş3ÿÄ\0#\0\0\0\0\0\0\0\0\0\00 !@P1A`ÿÚ\0?÷_˜üÇà¬oÌ~cß¥p?¤p4R”\"”AıŠ¾Š’RŒnëÜ­¥‰p%Í«BøVŠW¥rO%K’£œS…l{—Ûk›O\'Ô/‡Ñğ­H¾•\n´&™Rç±îC²ø7´*¦Ô•Ù¸5¡ò‡IJ‚§Îx´EŞıvUÍ“ƒXœ\rÉ¬uMµšÇ^6,oÌx§®ÄğMŸ„Ä÷ÅEÖv›ÈÇá<OÂxŸ„ñ;ÎêI;–×¶|)ÅD÷Ö6M“´ÚI´Ùtvˆèºë,”­‘weá5uÿ\0OÓIUz—üSKšë×F¦Qüt½hÛ8 ÷ßÿÄ\0I\0	\0\0!1AQ\"2aq #03BRr‘@b‚¡±ÁCÑá4PSğ$c’¢ñ`p5sƒ“£²ÿÚ\0\0\0?ÿ\0ãS53S53S53S53S53S53S53S53S53S53S53S53S53S53S5ÿ\0;;Ù×º9Un­µ”iá¿IÇ”n‹e,€Ú÷ÿ\0&ÌÚfëõƒ¤`·6«ÕPG\rÔèÊõ!ÍU¼8@XüæËÓÖÇrm•­¤¯œ=KåşMŠ¡a€¡]TšŒGC¦§M)ôƒ nfÔÔ¨Ò~½®ñqª«q§ùAŞ¸äf\ZºŞ×Š×F#Cy‹£Ï¼ÂÎl¢[ÛœÅLÿ\0o$t†ó«UOÏ~Ûò	…øÂíÙ¶é”Ü:FµàEbX÷L\ZÍá;gş˜htû%íˆZP¥Œá¤×ñˆ1aÂá£¿KUq›­h@âÇü î¤:Jw\'(ç¿s#›²~ ì&àãOhLXDzd÷‰W3Ú”ïÆRÛ…:†ôÏå§=Õq²äwî›Gä½YKÆ?té:L9ÛH‰{áôõMˆ]`óïõ”ğTeºp3ÖTúÌIU¯Ş`ÚKk˜l_	ÑµD<š5jGA¯t^©jg#~›\rV¿IÏrab:Ü\'m¾²éY‡ç<õ0Ãšë©º&y¹ÑgZ©’å1-WÆ\n5û|9Mi/¬õƒş˜®{z4/íœ–zĞ~–Ø”ë*ªÖ å=yŒ•*b~ÀwSøa<Ï\rJi…–UnTÌ‹ĞamhG)LıÁ))Wâ”â|1‹¶,š56ÕfÌ—ÏŒ.ÂèŸ¬Zª,#ã6…çc»hî©Ê³KŞ÷Ò]§«ğ˜²—Á4öÌ¤Ê 1ÖÒ?õŸ”V·œ|É…ı¤ÌJék†Q»¢c×OÌGÿ\0în§ñD¦İ“:®ëùÌoÄX9ÊŸZÕÜä .ÔæxL<áö©´ÙŸŞKî(Ç«Sõ—…ÉwV¯Äe6e§ˆŒÉ˜©ñ_°Ôş´?*pÎ\Zt›i´ÖîÀ%>ì÷TøàyBÇS/Ã?‡¼â\r*ø\røø^Ñ<«ã¡¨EøZ*^øE½=o„Êc›	Oà†ŸFY¯x.nÍù	F˜ìªÂTïÊm\rÀ(œ¨´«ŠÜâÕ^İ3R×xJ_„î¤üohEõ”÷Õnm6?€ş³i¥ÌxÂ£u\Z§Z—ÊWùJŸ–‘*tÎª¸N/°ÉğÍ¬ıÉiŸÎ2ÓÉ@S\'¡fĞFnfğ/p1Iã¦êsğÁñì4ĞnuäÑ(u2©ï‡Ü;¶¼Å¢øWÆSûo€Ê?ˆ9,z¢ı(&Ğ1ì·U¥:ÃA‘*0J‹–|bÒ¤n«™0–jŒ‚tÊ:¯qÜ¾‡‰Ÿ„î§H{9ÉQ»<f$`D4é°5—¨º±´¥Hh”í+|£dùÅ¦4ãá(Ò¿€•y”¾ö¹~µŸ)üBv_8Ô	ë(´·:7a‡»ŒT9S»)Aù1]ÔçáĞAkûQi®­”R;%m/MÊ˜YÉâe2Fl÷0je¾Sg§ÉbøTıè¨äâĞ8Ğúzß	”oï‰øgâ1‡²Ù‰ü&ÑÅç<İxsö‚2ö·ŞşÔ›C\Z›ê±<%ñ\"\0N™Ë\0‹Ş&Ww3£Ë¦í_¾q…‡26ùÌ4Ô±<§IS­Wô‡á±ïp¶Xå˜34¤>ô¯ğKË\nÏõ–j¬Ë‡ØìHÖW¦@»ÚÙÅ$.Gœ\\Ä¼âÔÂ¶â1CZ¸:RÉLËjç´cÔP¶=ñ¨°ñb²¿X´ß´#5:D­µ®Ş&bcŠ§é07Èò–Â}àzæä{\"*†c|âÔ5·:CP[íh¬®Æ-SQHŸ¤N±¼õ©xE½9VVãH\Z­0ÄL4×\në©L1\Z^bèEÆü5W%:xZÖİz´ñh éVöÒz¯Î_£¿‰–¦Š¾¼å0Ş3Ô,²(_¹ª3¸c+ÅÏzô—êòS\\[9íıg·õ˜ĞµílşÀ}/m~³¶¿YÛ_®ìÈ¶¿Y‘Âf@ñµúÎÚıfs¶¿_NS¾Ñ\Z	³¦Êàt¢÷‰ˆ«¥ó´b9OZ`ó§z„r§­1‹µóİ†›Ø,¹=Ğ0Ğî@ŒW)ëLev»\røiµ¬3´ÏZb©›B„õ¦66¹uÎ’Ô×|ËÉ–¨0÷ÌJn=1ò:\n§è\'Gêë±´\rShÆœDªAÎÓÖ¿Ö-J„årL$±ÁDÔÊW76ã*üS$\'å3˜O°m)Sùîª;åã\"İŒ§Š‘¶,å^ùHwúf¶¶…ŞÖÏæÇL6CyŒÛIzcQÃpŞ¿çø£7Í3ìé¸|;ğ9n,xBçS¾ŸÃ\rµ9o¨¿=ØTõóİ’“3@£P(Ğzcäm¶X´3¦Ñj=‡„Ä…ùX˜ÿ\0-ÔSß„¿a3·9…Ğ\0\Z	[â”¾¯µ{J¿(ıÙE~\r*¯uåœMÇ½„§éñu°^ıò‰´b¶Ã‡uO‡pñŞ>ÏñNŒh»Õş»¿õnè)[È§ğÅNP©…N¢/#”b59n*“ –‰‹TŸN|º+xÀÃ§væï#vÇá%ùÎµ%0TO¤­ñJvÓ”éqíÎ}¦üÌÙr„sYGÀÁQ@$s‰O£^±´AÍ¢}Š§†àyêÚeLÌv·\rÕ[òÜj`Ü/Ú\\¡ğŞéË8Äh2òáüÌ^ìãwçäb‘¥÷(cb)Ú?Ie|ù}€ùˆn¤—³Nµ3òİÑ“ÕÖUø QIr—=gioq?8™ƒî‘)÷å)|27ìbÔ\\Wòïö\'òğğ×wJt]%ø®{€àÙCá½5¶äNf8\Z_r,\0ÜÕ9å¹Áxé,uGFç1¡ôç}&tU3<ÿ\0ÅºŸÂ7‹8Ì4¦y4©ñ­®.#¹Î¢éİ÷¥!ßySë)½rYOuãò_±6ê`ó™ÓYê„eQa¼©Šœ¥Œdå»vê-ï.ö©Ë!Çu*~êîT¸Ê!dw:ò3¬¹ó¶±¡KŞS·?Nw÷®b\ZC,Yƒß.ra“ıßˆn§ğÕèEæcxÍ¨à-)I>sFÂ\0•U+ò\"/Á)î¥àeSİö&İOâŞ|<Œİ¾³¶~¾J}Ğ7¯3œoÅ’G1\Z–Œ?=ìü\"wgéÏ[ØÖ\0×]‡ë¸w¶íœ²Ü2ÎÃÌ aN\\ãÔáMO×p_¹”¿®=Ñ‹á±´ºÖ¿ˆİM¿åˆ®æÂÓÖşR‰íåSqÂv—ëöİOâŞ|7®$»q¨OT°D*uğó–Š¼Ìğ‡Ç{3‹;œb ‚=ÊÓŞY×|ÂÜÕ~CÓŸ\"¦--yæñÙûVÖtu;j>±)c‹„õô›*œ·d,¾ñ†!Ãêg`}b%Afğ Ã|³õ˜\\Y¯}ÆÈ>³°?êõõ”°§e,sÿ\0TF¨ƒ<şÃ…T›Õ¿ÒSº7k–ú–RgdÅ¸Ègä­@5ÈÎÉƒªuÜö<âärÎÙ3²gdÅ¾§=ÄwKa3²f›Á=Tç¨Èzsäß%áİşe?û–\\i»Î ksZH>_çy‰5—×ì\'É±ĞÌ»@åşûàÃØ~²Oó<Û•Ò\rV.À«ÖïI¯ùIf6yŠ7_yÍ¥ëlıOy\rà¨´+<@n‘|PÎÓ3ÍÒªÿ\0+Ká§Hscyj»KÖ>í<„é¶e³\rWŞ:ƒöÓåâaã÷`eõñÿ\0)éŸ¬ Ú’{Çœ¸¨Ş:±r9bş³¤Ù–‹r:ëÌõ€ü§l”ó•¾q|e\ZWêºŸ¬/oøwí}ÃÎ\\L””y«á/ßé—÷†“¡9©ÓÂnÒşäî{¦bŠ…–	fÎãô•67ÎÃ/ÔÛU>E5æÂds@& Uâ9ÌTF*GZ|¼&$kúAF™ó•8òàÙĞX‰OÅkFş”ú¯×Ç”…ÉM{Ö\\iéË6‘º[_Qn_f·2#“ÅÉİœZáÏÂ.Ò¾\räQzò¥Oy·Yüâwë1ÓsJ·q±şó*´ŸâY*&ª¾)şÇ±W^ÒST}ç\rZ¾¶¦½Ã”Ëïe,=VÑ˜ø½)ôtäyLøö—¾2SeË2¯ì÷@Ö·¤fÖÂ\n¾ÒÜÊB­ÂŞâò°6ËO³SøÄ9ß}øƒê½HTê2ŞïÄ)·“Õ¬ß<ç°~STúFÛö·,©Ø³Uí6nC—”[ù4M—ï7=Ú‹ıÄ¨t8Öææ%QíúCèjUFÂn/	R–ÎŞmÔWìÿ\0xXµ;ÚÍ¨ô—å{Ù™³Õ÷\rŒ÷?³É¼‹ZáQ1*r9ú+,vŒ¥A=B0ç*j’pvßª±i¿™úK(ÊùáÏêejõo—‡¤>„–\'\nŒL¼çGHE³w0’G¥Vë©ú÷ú:ŸHi\"äÂÜ¾ÌÖ„}ãäP{ûR“óô+M53ø-Ÿ_m¦Sf­ş¢ùù4iğ¦¸ş{ïƒş£0úÃîŒ”J€gËKúCèqâ*WÚK¢Üëá»…ô_0Mï~¡R¤Rö[€òz:Tñµ®sµ¡§Uz:ƒ‡9Õ`|7g=d6ñ—¬|\0ÔËÚ’Lgœ£—¼†â]\Zş¼&}ß¦şøh}á¯(Ôïô\ZÌ\"Íµ>¿vMÉİRŸµHô‹ûÀÃCäm0E²µµèÁ·ag.}Ä–aĞ¡ö¦P°Ã¦^ú†ÄÕ)\rIËÈe_¤·X[šé½Ş“\nt—Ck–”êbRóœ¥:eˆ$ÜZy5P›úÎŠ°ó£<´#r6Œ8Â®nèl}BìrQÎ¢:m§‹pI‹i®oÈKĞÚ]O~pûJkÉÄ8úS®möÃœ`yxÿ\0æR>‚úí\'OùŞMÉŞ•šR‡¸n¾ÈÚkS±ëæ¼åê!¦ıùLë\\|s\r/ÿ\0šŞ\\}÷Í¥#7ÔúCè’<Hrˆòº:½B¼øÊ†ëLö@ÔJPôiQ±*òØ“›Üexõ*5Ï\08	líÌÌU*O+Ëˆ¾2§zƒå^u7‡õAë9ÁO¸EZ[1Ï6g6¹—}˜Ûîµæ$kÁ]{t³ùJÊ4¾!óòó`>q¼êøß¾[¦I•dúÌX”jgU•Øè/¬>^ :Ü)Ÿ“E£Í7í¼™TómŞ­>’Ã/„K‡ïe5ğë·şgOÒwô=Ü¢ºh}	ôD®˜zİŞYTÙÛ6£‰˜j J‡V÷Ä#+ lFë–‘6ÂÇVî”Vö(¿„yM}2¼CCªob~ìE¤¶>×†æ¶¶”Ù°õy”ËŞ}&!Qj}ËZòĞ¹8*W˜´Pxõ>cuÌÂ„Õ~H/:›0AÎ¡nJ³k¯ù	ş~*“ÔìÊ>Í(ÿ\0úç©ÙÏáŸá¶oÎ_ø]œø4¨¸pá}/¤Zïl-é6…â0¼¾ê‡î˜ç›oí4-ù	K0ÖàP·±HÙ|yî«Cë¯ïèO¢…ÎcËˆ˜­gµ±q–”ïùF¬ÃªÜ	ÒTõ•3h¾2­AÙ&ÃÊn–İœ6<L°ÒUÅ¼wâè×;oÚ{iŒx‰N§1ÛÔUí[Øns¬?ÖhmÚZ£{·Ëé0ìÛ6æÙO;\\Û’e:¨<fgºa`qi„k2Øòï6j”éº.gœ¯Y¾v™©>&%¼Ú©â-†§b-o;I}“:]‘±§»ÄKDWßB²™û»ªü&x¶ü¾S³‹â2Ÿ\\1îĞEÂ¤Ùt•µ›‡#6jıøOô\'Ñ[dàßè‡ÊRÂŒCˆãÊQ¥L^ö,=Ñ»¢Se³ûE\n,-åSºŒßXH¨ë„[« §Œ_¬Ns\rJƒ¦¾MÜDj_é¹*¨. =ã\Zš§Fœœé˜âwöı@\Zßığd•MÎ!Îu­Å§Èg$d2z¦:o˜{hyM­Õ\rPXØ©µŒ³´ë¯òì33«HöÊcÚ+õø*JWÖÛ«ü0w“¿;Ëà$ÊWÂ>èáÂ`pá6n7ÃÜÊS¨=¡è¢óE…LV\"ÙAô€ñÌGa¨@Aï”ñœTïÒc?¤l\n#sº·>–+‰eİr¸_ŞXJVbSª	åWê7½Â\\Ôê{œö+eø£[¶¹©äf\ZôÅAÎ^V Ç†“ÍÕ¥X}ó”*/zç:¸©Rğ)²\08_ÉZ¡ˆe9\\BjÒaKƒÛ_*¥#ˆ½[…Yfıæ‹€å²R`¨¯ˆho»ª¤ø	•ùå<íjTşrõv’[fÙïß¤°`ƒîÅ[İ˜Ú7V±‰óß‘´ëTúJXTö»\\÷yŠ-N®+v¿h´Ûµ‡8£‘#ĞBY²Y\\5:™ø)¼`3èfƒ·qŸJTq”¤Ëc‡Re:tì,=®;Ë(½7¶.ã©¸·¡&ç«ÖñŠæc|#2b*ìè›iœtÂMÙ2ğ˜‘ƒÈtl¡ÙvŒª<ûÄèv¬àÑ×†£qj\nNFaéN\\\ZyÊhâyÍ˜”Ê£Óù™ÔÛÏÌÌ¶ä>\"‹£ôşó=º˜ğYÿ\0Ômà#œ£ô—é0öÄ5¤TÃ¦k´´ÿ\0PøÃ‡bÖyÔéTvUÎ“©B‚ş•L?´ëVsó™›øÏ7LøÌ[U[Ÿq`ÁLSAíuyu`b¸oÂ3¶Š#Öj„=\\ÙyÊ^íp<gh(İNgV9ÃİhªUn.Œº¬Bı¢3•Sİ¨}ôMë=&\\Ô&„L¸+ïÎT\0Ÿ\"â7Œ´_\09Ÿ?8j·h8l_vKôT†G™‚ê\r¼‡¦;=¡óôGøa“²BûJål…ànÕúˆÕ1”ªÍ|¥«€¿xhe˜+ˆV[§»Pbêì×\Z]‡r{ÚR­J’Ò§ÜÚˆØxŒàÃ´a©ÅXNÎ!İ3R>[ôô=TcòªŞ2õö…_	æ©š­ÌË)è×’Ë™ÒU¥ËŞ—zhl£ßoéƒõ-‰)N‡³ÛxrÓò”¾úL¬%ı#¸·(Ó¦\rğÉh.â&Õoõ=òM\r›ÁÚfÒ`;:–àÀõgüUltµ\0eœº‹·¼s>NRßrs<Fr›R¶<Æ|¥Oâ[Î)È2õˆékéåT<”/¤±†®Î<SëÓ%İ™”rĞÃJ²²Ë8iâ\rmã\nÓªUO	rnweRã‘ÎyÊJÓ­³şS”õß÷O[ÿ\0tõÖüRı?ıÓ×şsÖ¹ğŠ:»%üLêlÔÖdTx	V™ïvŒù\'‘Z©6Ûä!îï”ÇİûS²ZlÀáøG	•2ê{VÔJ˜«yÂà÷å»k?Ğ ”íh&üG™ôŠbl‚^ğ\ZÏâ\ZE.£®2ÃÏ”G¨Ø”f?x*\"ß`óLòÎ¿XfGˆŸx@ª;÷bb\0L¸7Œ×£š“×_ßÈë­Çæ%±\\±áWEñ–ÀÏÕê.¢©¥Ñ1¶$’÷nBS·ˆ‹üÖ\'Â7ŞÒÂÿ\0)K³òÏë¸;\'XgˆnÚ~/@|Œ>ÓÇË1ñ\0°µ;ß-eºBiqÊÕLm˜›gqxÇ\\9¬è˜‹Ób2PêÒ9ô‡öŠh]…­UïäV<F¸YKl\0™]<´2šó€÷z>šˆÎıdÔ69Œ§wí.ø¹ç\n‡; *âÄ^:Ãµô™g:´\\ü§œ©I<Zó\Zõ@÷Âbèc’ë:\'¤´ªÚèÉûB\ZµÙZÄ0Êyë+è9Xrùï«otÄøD¾zŒÿ\0¬ó’ĞX ²h±İ«Æ¨\\ôªzàî¯ñzJäöØwWÄ8yO¤\'“Ã£/ˆ0Ë„B1r`4íf˜Ôi˜‰S³ì–å.ı®É^7¶‚®‹şõ„(8GË¾)§Ø#+y\r‹%ª2?{”Sİ,n-˜+¨‚:oPBğÓ1én\nœN‹\\ÉáşÌ§I«660t´5»:“N¶˜/v¨îô´«F Az¨ kß-´l«Péq)†lóa}°ÚX_–rçoúÅÃµ3\\çÔĞJfw¨®m‰WH´ºvqíá\ZK*Öªüd!?ÀÑ:hÒôéÒ¤<.g¬Î8p©•\\K”8I2Q©‰õRÃ\ræÊƒPßù›C/¿\nv*v„4ê:œy{ªü2˜ûºs‹k•,?Ùòkå;%¼LÕz´ô^Š‚Ã3šğ€Ö¢µ­í®»«¿éju´±³%úGç»æ\'Ì??¨Õ:©–s¶Xµá+56óEíá/ÆV ‘|ÃMnfN‚¶:ç‰SİÏÇÂ¶|{çğì×â‡Èea”e~±¥Ëˆ‚«Ut\'5t•MF»3ö¹ÁWù5\rœr<ı5z½IIó¸ÔF¢Ìê­ØfàgZ™Çù}`¼-{wÆ™Ö™WëJ€äUÉ\'Ÿ(,o‹„5fÎÅ4…)Û,ìxÀaùKFsi(mw°´EïÆZ[†ŸY~:üæmúG<2İ¥›˜•v“ü±…{ÚZ÷\'ó?±aŸç(ä,À¦!¡İ[á‰á¤>Ğùøù=€|LÀìtyXZ(>ÖBÁÓ\\\\Ës‘ÅÏ¤#˜ƒf¤„W\\³øÈ\nÔS£œˆ•ic,QíˆÆUlXoq~q¨¡ó‚ÆĞfÅL¯‰\0Ùlr!¯Rävo¬[(F·FyÃçá#àjÖT\\Âÿ\0YÑĞÓ˜ı§L{`Üˆ£#ùKÁı&5Õs0Ğç½£=\\ ±ü£ÑR;JGíÍM´2ŸgG8J·¥eæ%ZÀ°ãhh>F·ı·Ôa\'¯Q»?Ş³m;8Ÿ%„)IGg\nCçíŸYgEµQèê?É©G€ğ9Â§\"ûE§†sôÒæ½%Fõ,/é,¹Ôl–%%7¥C¼òüwPmoPu‡î9î­sn¬M{ ‘/ÁXb#ÚŞÏlVá.“ûÊ˜\ZìƒÃªæó›3.¼bõ±wó—æIôõ)%2Æ®tÛ¿¾Q;=šª“ŒéŠ&ÓlU& ^G”=¹¨s·³ß ²ˆjâ9çn¡=g|­Ö»m.ö˜Tõ%‹WŞ7u…£ì¯ò˜€ë&(¡YHÔ¿ïE½³ÄbŠ¹…[ªsï–¦Š¾öu:YÎbsa.\rÁô‹Q*`mx—g.Ìğ„›aŞƒ»4ø¿yä 5lÄh¾ÊÎÛQÿ\0¬*OZ˜Ïö3¥<x}ÙÑö‡µİ*l•úÅrÏˆçe|ìr›\'Ş¨Í-fyÎ³gÈO7³œ%öR;Äì¹Ì\0ãßş\" ÎßÊXFCp·µùÍxâ¹çóİWX-°ƒ¤9ºG9I[´jİç{|¿YÓ øÇ>ùŠã>2¡Îù[+J”ÔûFİÓÑUÃb\ZvHRø{ÌO%©àê¾.ÿ\0KÕP/Èo©PVèĞõ›.\"2TA‚¸º¶¬|cS¶x³ñ†ÔvcÒ=¡œM¥;I¬Zƒ±Ù™uïX*.esñ0Ğîéf§ò”ğ§GÀkäa¯(¡êáz/‡ã¥;?ğéTêÎ¢uÕz5k*ß¶ ŒoŠ¥úäñœ¹÷J„®*@aSÌı­)Uîäa¦zŒ¹=ı˜@\\(3¹ãT\'¨s>ğã(íKàgşŸàÇv\nFÖíÔà±Š”Gşií¿ôƒ\\ó1º\Z®ˆ2¶·1iíˆªíÙª¹}f\"½\"dnS¤-ªfÍÏ}²8¾ıã6v¦¼wW¿t¥{ŸjüÙ×MíòıwT_aF1Ù’œ¥B·ê½æĞ‡XÎNÈD+Ã/!¯JôTfÃ„ZtìÂ¢õ<yÀŒ›¥ÀYtÒ#\røK=)S˜2¦ËŠÏO:g»„Wj…±·[¸îZê:şÌ¶ªâ§/*{ºøF=’tÂfVÌb¦9÷EªÖû  õI÷yMGtªùŞ\08zZ[::ç#îpàÑ2T#Ùç0‚/÷µ˜mV¶RÃA:0·¿P&×qşaìÅGá>ÃKkÃå¬£ûM„ñÂÑhS>q¿!È½ZÚ\'ùã0pW¾[dÙo28WÚvG3Å“×©ûOàê6*U›Ú>ÉSQ¤Îr´bmŸÂt‡µS=ÕîyD\\ô9p›.vëÌ8Xõ­kenwŒiö¸G,¢×\'wQ®–8ŒpÅqd@AhUšÁêØ‘À@ôğ=3“ŸÎ\Z”\\vaaûùB-&bÉ¯)Š† ¦ÛPDÙÑW,,Z¥İ‰f`E!é“h÷roÈ{5?YŸhdaR/lçFMø¯„Å¦.©=ü%Îº0‹I:Õ³}0wÃZ£]ø¹•ª²7Fït^1h+nOwt\0h<š•ÕÏL:ÀğŠÜÇ¥Û+ûƒ£IEÔ \'ê\0½a‡i8J•ı‘Õ§á1°KRe\rÄÂ¬.8ˆE=#­Òa¤p¿ú5¸xµSu(ÄÒ.y¡qœ}©ÍªV8¸N7«JÖÃ‚ßœRÍJy®bÔ§H½Oõ+pğ˜¶Š†§İáôlíüµıáW°¾–àe¬zÄ8Ë?¡–Ë‡´<\"Ó.\0\'¬Ú}`Dª2Ë!:4©våiX_DM)„lèÂêI3ÍWu›13Úmğ¤Õj;\\jw7Ãp\0gÂıòäv\\™sH|²•>)÷|Šô@vj‰Õ\0NÁ7×UÔ_”ÙŠ£%4¸\\z¶R™îŞO(aÂ·9L¥Bõõ³áèŠj7ëÓĞş‘jû/Õnã¹‚X½üÄ×³8P¹É‡#Î[7ªÿ\0Vë[‚ğÔêœÅ¸Ë»!g>è1käº)±\"+Ô¥O¢Ğá9úRÇÛ®?X‹ï£$¤Fu`Qß/~p£hcÔ5Z¯s´ZÈØX¨—9“ ç×µZ‡,#E•pv0‰S©{½ƒ_IJ•,ÙÓÚÌÎ¾ÕaÉÓ¯oi³‹„Ò\\béLêD5›ŸËºX«Ée†Bmˆ}ÀĞç,‡r&\"˜‰÷„¸¦mÜ%:áIpÖÃÎ3×g§Qò9]mÊPéQz5öÓ1(VQ˜Ë«3%~!iëV%4¨¥‹\rÏĞ $ÖcŒÖß­‹ÚÒ¦3|0ƒ«	Q,½#-3´{¼¦Uy€S¨¹_ˆŒô±©Ñ„ W	¥˜É´˜Fê´É^‰Tßº+ŠNOSq:\'Nh:åÚôE‚.Ò[u\\Q©Å_ÈÂ_\"™4é)vĞÜ^a¦˜€8•‹ÜgGHâsÛsUbN¸ÿ\0ß	j¤¶á\n€^ü;¹@éL)i§–ë{eyN¡‘èÌr¦Xµ‡ò/”m !»Ÿ6œ ÅÚ<6Ğü`^B \rL<x	‹h¹c¥ò—‹Ã,æÒIÓ+ÍšşÕbfÑSŞ¨waÔˆ0S5,\0°l=kL:[I¥ûÖeLù¶\Z¶¸§)c´Èx¼KhÑ¬˜óìÁLáÏ‘‡`~ïéK`aí Ëæ B}f¦d«o	‰iŒˆ&ÃIq˜2©ï‚¢zÄÓ¿ºTtÚ* Åšòw©SâiÔEXiŸVİéş‘ja#…²>3¯WÎûÀpå)•b¸Zç¾‹§~ú§KŒÍ¦ƒ® ~³>ÓÔ¹yW7<€ÔÀ+P4Õ²V¼eÃÔQÖ ç‘õ‰±Ñê =kJˆjTM±~U{tu\Z‘‰f§DêïÚi•’‡.-:+u}œ¥­‰WCÊ%J_5ái_\0Ã{Ë¯?(¾«Ü|8ÄTP2ô›vÎ;JÄˆ¾ÍÔ{Æ«wlğŒÌè&#|LNB®æ­FÒšä£Æu+åî‘:`xÒŸ«ñG¨rjœ<fÀœ‰¿Ò5õéõ†qËvü„êŒÿ\0‘\0¶\'çm&fT>Õw°ğŠ¼…¢“ª9Ó63&¸•M5]\0fn›9KòÎ+{e®y‹p•Y›ÙAÃº\n”ú…µ^Yz¿òÉêŸÑ¸¡ÔLÉ~Ïİ<¥_s.nwà¨.=D¯GA‘Xõ; :â¿ƒ¥¤Ê/‡\0×É,tÖ~ÑĞr¢WˆİTg¦2ç\0µ´„ÿ\0ŸS_º\'IP=´^t¬.ï˜§Ác¥~¶!aÉL©³µğş‡úLòìå0¹JKˆ®~ÌfvÄç»É´Nø0ël¾lÉãTòô…˜Ø0Ta…+‹	Wf>ÉÄ¿:µCìŒÌÿ\0‰NÑOë+UUFBÜ„5n§[9^?ÖlÒ—ëõ˜Ûå)lã±G¬Ò‹Ÿõ&Ğ‡Ù{ÌZbEîç-k 9w÷ÂøG(ØeìÌYåuñXª3rpÿ\0yOg¥šlâèùxã¨ï™æXÀheã6–ûÀ}!VSÂc\0½%ÓšO2êMA™h)”t°åy`UÄK±ÀM•½¤?ÒUÙö×L‰{åt«ìœ?NæX‰U5Rêlb[!‹÷ŞÎxÂ[GUÒ>*Ô#ª4¶ç=ĞbÑDm®®j†È½ğ×«Ãõ…N†5$[×œ©ş²ŸÒ\r [QÄJNiœvÖİò¦!«´Äï´»u·\\÷D7ƒ-?¬\nG\rµ&çŸ¡,ÆÀN¶$ÊÌ}*‘†À°¿¹˜p·ñ4ÛEÎ-ZguËÀòeÃQ=`=«Æ¨ı¶ÎtGİ±jmeÈ:‹ƒ/Nªø^Òşñ7ï<£íUÇœ#!ûFwí¹ÄÑ‚v¿YKj¾N¸*w0SÛoWı ]-ÏÙ1¨éRÙúJu¬FËº^ö\Zßİïğ•6×[•5å\Z£vÉ½á!	CÂks­ıïï/lÏë¾I­é:÷Vs[Ùâo3¹ïµ¡}˜ÛG{	C&é4`AÒ]é‹ó\n×ª-‰¼\"šÜËjÌ`ÈÂ,bŒ=+Ç3kÎ_[”÷‡3Ö¹\"ùnèğõ|?yN‹ui·ÊòÔÔ.æ¦Iâ M¢¢ô|B{S¨½cS­…\Z–½ãœ*SƒÄ¾1Ÿ[	Ó²#«°MDz$f\rğó…X\\*‹Ãxù‰Šö Ø^~)×k.ÏÎ_¤COÆTÚt´İÎC_l&…>7íE€ôL-[¤q÷qŸ@©÷‡Zt«‚Şôm…ÿ\0™§ÓœÁM0/v›´{IÁÿ\0¼é(±¥´§=|§Ki‹¹¾àfD×¨«âe©Òş!_Ş>Õ´aA|A‹:F¡[¢_V0ëß.¯;‹|á\\j8^ñÃùÊo•D¾~07­¤rÆ¼|y\nôO•‰Ç{ÅôòÑ­˜Óí™°±EÌİ\"lê4¨soé\0->>ñ™š‡ñL¨üsÖÕçÚfªßŠ]i-ùœ÷Øı—¡Âä¸öxMæ«/U+;û×ÒËüJ©ÕCe1ôLS?ÚzŠ³ü5oÊ?D¨)¯œ\ZÅRn@òC=5f\Z=áh”^“)¹á¸Ø÷åß3ïı&CÛ·XÚŸVŸŒÆ£o¨‰H-úFÓ»ŒÄ1÷o ²ˆ©ĞÌ8Ø¯(hÒ ©KŞçÆ&m3ÓA»%*f£g×ŞOé/ü-P~æöf?ş3-CfÇ7‚¦Òæ«²>[ºÊõIô—ÖşÔÙ_¡c¨öOÊyÍ…I÷¨µ¡ÅOoØ§ü?şø½ç€ín0¤š|å€°ûhza-†İc\Z™JyßÃ†ñaíM)ıfBŸÖt}\Z“köæ¤„üq¨à^‹¸ß	„çÆ|ís3äë¼`Ôä/¤-j–\"Ü2—§Q\\\\NŠ‰ÅVÖw\Z,şd\r²37zLuÃÆ9¤Øª0í±¼ó†ìs9ßüÿ\0¥Ûæ4¤sŞ\Z¢]„­M(­;DUâ.Œë5¯:‡ŒéØr„#uÇ³¡â²ê3™ğÎ›Å%Hÿ\0Ìÿ\0»Ásl­Yƒ\Z³°#;Hµº<,1«WÃŒä\0ÑDéjRÓ,¯Dá1µC†ıPxG4õ¶V‡‘K…ÿ\0ö3=*†›6¼ŒÄIz‡V05Ê¸ö—Y£šŒ4¿	‰OGThâbÚªšÜ‡U©µ]œöHÕ{¦\Z4Í\n\\\\ëò‡øzÍuó`®\r*ÃP¾¦ÚS½‘1t_+å¼«‹ƒ,4ƒ¬VÇ„\n4ûBÿ\0üãÿÄ\0,\0\0\0\0!1AQaq‘¡± 0ÁÑğñ@áP`pÿÚ\0\0\0?!ÿ\0ù®+Ò¥?ÒŸéOô§úÓı)ş”ÿ\0J¥?ÒŸëOô§úSı)ş”ÿ\0J­?ÖŸëOõ§úSıiş´ÿ\0J¥?ÒŸéOô¥!N7ÿ\0íû?¬jkŒûB–ÚüÀjeÒï¶†×ÇüßßÓNæSP¶´D3³]›§$¢å¾OşG³ñMeÌ*tFàTPa‰¢[ş‡ïåX†	©S¼V ¹N³Õ9„€íÿ\0Èö~/#„î$ÑôØ[–#¨áÚ ÎÛÉ.±cªÄÈ¨j:÷O3×Ã¾]v·šçq‡Š¼Ã]»1ô,y¢;Cn ­zÑKåcÌx2ÓEâ4¹ ›‰¢Ğ´ÿ\0}û;^ßÈ:ÌW×•AN€¬0\\çË—]9=~¡?êö~dY¡™’¢å™«†\ZcAKÊ!yè9w|.’øä%\"¶b£¶(™½fÚ­£\n6«:ÎÇo‚ÀU\nåÊ‘À®÷H«jË¯†_îOã—òKÀò…^¹Cà.]jdb+¶dsáğıÛ%bpe¦ë‘P•†ñL½ËÃôm‘äPı)n!¶#4Ìc5´Ğê—so™Ã^!u3‰ÕµJôõs¶´ôacrà\\RİÂ±³’Ó¨‡¼Z\0ûû”‚ê’æ§ÆÄ¦‡0ÆM– ¹Š™@§B®=‚HÍO°FàwŞÿ\0àö~õóRÂ;ÿ\0Ë\n§RTÎ¢éÌÇ;FüÆgTŒTÛÅé-M[ùÏuüÃŞ,ÜÊ\\¤Ö0¦:ËÑ¤áDöAm‚†£Œ÷¼JbëºER®]^g»~\'h5±/ÇÑ®Ëğø~é±«–`édÀ\r,{Ä+B,/pju]|¥4-k\Z¦Q:oJÉ[Sá²oÄÇcÿ\0dÒíàv/–éÎ!™în+¦Y+Í‰Ùÿ\0Øø\Z?€›ÁŞC²)9ÂÊé\Z/3©8GİJQi£WˆT!nà^Âñç¯ƒx_úŸÚæ0e 95Šø=Ÿ‡½|ÁÔ*ah@/¬ÃEİ\ZĞ3Xw{&£ÅÈFªÎñ‹Ëk=û=¯æiÀ¨VSQd.ÁÄÕo{„«Ã^òƒÈ@mEÑs:\\ÈÇçÃ~\0ï•¾]î|>ºÑ\rdmè	¦êù‰ÛHJ¬óŒºÁ‰hÎ\0F€^ú§;Ã»£Dø%†[ÉÉ¹êôŠß#ÀÅô¼á5uš>êßo\0õI]ˆñ&dj#Pài\rºJNm·°\ZOeùOës3Í?¹•àBïğ{?M([¢3@µ •„Õ5…)N>äB(U–nôr‚Ëå…Æ\r®|+ƒ¬xÒZ÷‚#¨©Ì×zÂ¼Õ_ĞyoçÁ|Ğea)ıG¯æøü?y‚„,å…cj‡ğXşcev¹°èÂrRô:–‹±-`	Òñ?£¬Òáükáìóø]%DçÀ`.Atğ\'¬YØÃ©fƒ\\ë+¯,*,‚«š¿	@á×¾óUf_ …„#ú5hoxPºşø}Ÿ¾½k’\ZE03pï VB×™6$.™îša]®ÊM(\']+ÃçMh›¶Aâ”›LÂ¹1-0j›Å®ÔàòÖĞôí.ûŠ„QãwyşÛKM¦Ë×Ãáû¬jL(¢Érè|(+ßµ—¶Ö\'Oãc¯š LŒ§›1-á_á¼Ğµ×ˆÓg©ÌB‡	øÂÊ \ZuFx-ôw;«2WµÃ´fúˆ.§±ø¯™fF¬hzGaUPşµ¤j\"ğ¦6Å†\\¨j€ß¬ri«D¥ ”_ğ{?\0N]íñòTä5nÖ‹Q„„Ñ¼!ç–ªey(Œy×·Ix·‹¾üøL<.˜\0a•ŠaŒ®kX#Ìn¼‰U†f‡›±j2Çø&YüR”2¡5µ‹VhŸãFd+I¿‡Ã÷L‘©á‰-¬â\0¡f¸Æ¼?Ú¤\0A2ø‘)·Ll$Ğ_ÀWtÀF‚‚j7­u?³—IDª£ÀŠìHş’œn(ğ\Z²h”KlÁ|@™«V³xVsÒ‹÷Ö¢ÿ\0àöW”:Nñ³K/¹áO?‰æ)DÙ ¶G+àó¬Î©^™Õ?Çø=@¨\rÖĞïÒø~Ğºæ‡T0@Ü`¯J\r#XR(T|0+U6&ƒÁb+µ?´·L¿\0µb5»ª6­É Ag†~ákyı¤OL±éâY§I»?´_¦3v|nBšF,Soƒ…ªÇÕu°Dt=‚sW3­ğÉtO½ìşƒ×ÚŠ{×lRuNS0F»–Š¬Üˆ†Qš]³ZŠ°BZ{EªDl•%áve÷4J8š_BÅÖÚ›(¡+RµÄ´]PFÿ\0HêıÙH›Êï\0–¹uˆ×qk1\ZŠ6¬÷xhJµ“Cèoäé8z£i]]_½•}Ááf¹/ÙğÓ\\×¿IíŸº7ñ£K–ïk¢`PêF×Î ¯½ìş‡uÓpeî,Vc}9ÈŞÃ(mW±Krmå<«v¡°ê˜«:Q5ŠZóN×ê‚CBzc¿Q)®õí#Û¾7=~>Ÿ‡í%mÖjX#J€1àÕ\ZÚ\ZLÇjM…ƒÇ‚°P\'?¾Å×cËŸÃøOÊXŒ¹íâèÏhø•KƒiÖ6¸(ï5išÎ²¢qç4:JbÍM%\0t‰›$FĞoÙıØM)¤=°Ï\n ™q\rÊ4‘`¢Ş”—`JÔgº@€„\\,¿‚m#Ø\']–!õ}ÙÕN2­á øMk6)µü3Ph/ÓğıÖIá‹NaÈ8Äü†Äµ¦Rü0êbª«jå‚@%:®#×Â˜¯\";í¼onêyÃQ·ñtb§x|Gí‡m§GçòÒcº)†7WÆ)±ª%¢y¥H[vø=Ÿ0Y{g_¦%,4|·”Jü‹\"#HßsØ5ìÇTÀ{åßQêÀ.ô¸ËZE÷‚v“å;¤ÇMª\nº\ZeÖÁ±…fd9>Ÿ‡îÑVøñÇ\'Ñ¼kÃ¯…€lu2ØêÓ¶şC¾ï´öï6òy¶ğÇí¼ VúxT£.‰Ö@ ºèõ)2xüË;…i¹÷ıŸü ñé3ïÑñXœ˜èÍ\rË<Êd\nætÌÓ¼Õ.±)•“-ıåQ©ÇJ}ˆ£6¯tÊõ„àe€Îî¾È(\nµÃëôü?wİbÄÙ3~Š:èÒx™v”É³=á^‚SÍøí3¶»3.) ùxTúdzøÚçò¹ï¾Á¯xZªÁ¦&s¼oB‡œÏY–>†ÛoÁ]\0Œwô>ÿ\0³ñÄŠ6\rùŠ½C§”JË\0×ÃC™:xû]³,hûô>É-†+ş\'wËNcxŸ(¢µgTÔ\Z¼YgJßïséø~ïº</‡ZxŠí¼D„Q8Ú#ò³ı^[y_Hj\Z³Æò\'¹üø>¨|<ß_îz™$š/áà [‰AjhìO9¾ûÙıT­mÉ\rÊ†Âö÷SàAî5ğHºrQ‡ôƒ;İîˆá’ô56aWÕ¿q@ÀÉŞ©ï¼µÓ¤5Atc¼;ë»¥,õmNÛ’£†Yœ3.\rßGÃ÷}ÑàégÇÀğË€ÎÓH£+ušw›?À…‹¡5WiñU¶%%j4ÎŸÄ¬Fƒ7êñÌ ½âÜ{(ëˆ\0M »ŠVK,;ÁxŞTÄ6­s—ÃV>ıìşbÒŠÔbf\nãÑÖV¶%¼9üA-Ch×Ø9ºLCwï†Ü°fzá£yşfXJ½£‘‰¶:Oñ³>ÃEÎ{Ke+kÿ\0ä\'øÙş6.Ë\rÃYşÅå£ô|?t:1Ñ?ĞÁT\nnñdBÂƒ÷¯³Óé©V8	şlªà¦ĞdAÌTH.D×â7®ë´ÿ\06›cqçáÔ´EŠÂñ?ÍˆêGrƒ»Ë´¨¡`ûşÏèi±,uâË´ãYîïú•æBÎ¦§÷-|\0ôpÚ‘Óş/‡ş:>º8”}4J%E&äÔ\'”©ÓÚiÿ\0³ú\\é‚MÃ¹Üì=Æ“KĞçşgÃÿ\0m¥\rkOıŞÏêe[Eµªçî+.\Z®?šÊ*S³‡ù~ù¹Y­=	{\ZÁsúï‰¦Àşeª\nQü–Òáı–ğ×»Hòÿ\0ØŞfÈzŸì£ªl–¸»ÊV;?íöWÇÉ8)ªù®;Jhô—Ûcøÿ\0—áÿ\0‚ÓÙ	«é)õY‚S˜Í/„*ÙÓê`¤ıJ¯TaÕßèLáé˜Íœáì”zRÀƒ˜dÉ¢?zà«_\Z}ïgõè%åêäóƒSG¯ùU»3¶Z^?ò|?òZg€ó‡„Y¡èÃ¨(ó	u¾ŸHké;ı“T®*\n©“QÖ)=äX÷YëÕúÊ¶;ò=~åA¿r††ÈŒœ¾qä_»ìşÂÒ™¥·%ßXÂ	İ½İ €–‹O¿§“İ–ÂÊ=Šñíãğÿ\0Çt“	Ÿ,f[cı—ãÕ†1·î4?7i…lıf…S†Ñ;m8­veKô–¹ÌH}LÒÑ;,>Ó{`\n¾%e>V.¥}]ºƒw»÷¶‹Z½F“8cì}×³ûÛgÌm,Xf ÖÇRc„d)q¨\Z¡b^‰÷1e™®`éF]%ãtÏ¤J?üjƒŸÉ/W²Öüælu’`Ñ¨‡âUD^wÃó5r¿f>¨Uåâ8n÷ãÇ¬ÁÔã¼Õ˜‘mš/CÚáR7»¾ Öh~Ş@º¾¬Á‡MæhqìşÍ²é–]Ù˜mx6/¬Z‹\'¼n1ãí¨ ¶8Â’\\ØÅ$Àö#	v‡‹áÿ\0IZ\nÀp)øüJ…ÿ\0$§“hTÌt?™G\rçöŠ»2ô¸ï0‚Ti—Äe=Qu«>ùGyš&¼»ø]fGJ°„s½ÜB®6àîÉ÷=ŸÙ¤V_ÃÚ	\"»Å&¬	”J[ÄhÑµ8… ˆ‰öšƒ[M®8©¦æ\'‡hªÅ‹áÿ\0ù@†°rÉ¬ğ°x:ÎÚôâ	„ªÔpÜ0wŸ—ûöN;CvLÌzÿ\0¬.¡Ä*Ì1Óğı#¼„{<oaİô|‚N—¬*n†×!ÇÜög ô¼’ë§^:\ZüxùRÍe8ŠÒfNx,ÚŞ§AóúU†EõLÍ’9¸òó­†¼DLöƒ¬ŸZ\r3@>‡ì]ÒÜûæ\0×Y¬.áJ½\'Øiyâ\rnÍ°>…âP^‡är¦&¢–püüÁØ¾çØ\0\nšU‚u[É‘jîø ù)ô!ÃgĞf/iZwG>‘\ZÒº»NŞC—¼É×Qî½½áLºUwû×ì™VÃÁª,Ò·{øG€Iµ×‘¼ÍCê°;§Q%[Ò5Ób3l{Åú2Ûék(2¸bßò—ÀÏ™\rüüC`×‡èøşºÌŸ©EŞRˆÅÄbéë¸RhZVä{“\0´ÑÙßë6œ•\n@]ëÿ\0ÒÇdÚ[DÑ\r;?$°¹ƒğé©nß_ËÊ0pŸåFD«WWÇ–Ÿ%cgÄ_Ÿ¡S¥…Æ½™ÉG¢ıMfbœK¢[<\"õ€73-ochTÑe½~çµû(\":&IE£Vhü!àØÒË*B\r«’]\0sÍq<U#uÅÎT½!ÜKLÀı˜¦+[˜È`ZÛ–&ğ:u¯œ¸9ùú>?\0\nh5©†¶€tN¾9úOpHônäNà„«å)ˆh›Shæòh5ÜA7uöÇ×îİ< ÒÃ)×ÎåŞ^ú¸IßcÚ2Qÿ\0×¼Ò!B]Óqú…oyÖ*•*¶®«ô¢;W¬9o¢xôXº0Ç%98gùg™F¸;AêèºÛw/zU°E\nƒÎb•ggÙö¿hvWQcVÀü!âƒ¨<Gxàœ|JÅİÔéY^xÒ(XÓfQxÏÀoJ@ï)¦08Ë]x\\Ëúµú>\'wÈ¼ÁëR«ñ0\0V»­ø\ZÊ£0hlµóß˜!¼xn>C¶ó™¯¨À{DSb…}¯o\0\n\0sáÉ7úÈğL_B;÷š¯d²ÂÖæö	Àh%~p­”uLıê=¡­8ä=¥î]zÇg¬<T^KÓî	hy9„CD¿ùUğBædñE¢Şõš¡Ó/¨Ê¶rèès\nÖú	ßäÒ^¥®³j±}Ûìû_\Z•*WĞè™î£Zâ ¾\r´ñ…&HAfšº½áP\0/BWV/²¢ŠÕC;=;€í/tÖ°^Øš»ùğ©Sàğ»<CK©	€goÎşÇ·Š×­¯sÆ ôƒøé9Ğï¼´;j\r ä·BAòŞY’İEØJÒâ+é¬ô–ëë¬Ñjê²¾r¿yl=f¥J²o&	\\f$ò#{£%z~)–Õå[š‡nê0É(e^A¬W_¾\'Y	2DPDr:ı«SO;¬|NQ ø*]dV›—âÔ_•åÕ¡äz5$\r†\0`\n†¬;\0¯] í´ã³í¾Õà¸¬½Y™<kôr±4–Óí-v9±ªzfë>Ë&¨¨î[óÛÁ_”’sX\0ú>/ÄÉQ¹ŸÄº7\\Æy–-e¹êï5FbÍ«Ÿ§\r‚¯oÔÛ÷ä\Zşe£Ôİ-÷®%5í›§Gh±UÈ‡\0-Ò\0‘e<ò¹#êbŸ×hbØ¹>gĞ4»ÄzÜ;&òâ†‘ÀÌŞáîCLG	¿ï´ªÜ´4÷ë4\0Œ”„:Ú—Ü¹ok7ßÁ×sÆèñ p^Ä¼ÌâY¡÷nÍ&õøˆu1ÖŒôjÛ“$ /Øö^áR¼*W†RĞ%Ö¿ß„Gèp²•“FŞrî€„ ğ\rc\0¸Œ%-İ›%‹EWÃAzß‰ìö•áSáğSh•\n™¬	àX™rœCQÉ¨Û¿PÀ“DuğF…º8ü’àQß€i/ÇmCˆW„Å>‘-Â\rßõÈ\\Àä5\nF¾…µA[úÂ×XH\"YŸ¡JS°äªkæ¶!áLĞpDœ)ğÉ“S#Ä¦¶mâ½²®%œ±ŠO©=ÃÊº¤ap8|‰¯ ºËş\nõŒtZVŞ°ô\0£ÁD\nƒ¤Ò:¿/Ú_;EŒ$\r¹Ãjâ!Oe¦¯ó1Á¬²åüçØö_b¢jhá$à„|^F³>{ªY²„\ZštaÛ0\nîƒR¡Öü¾AÚ_d6\r¬òòğÔÈib`ŸGÃôá`bb1î(w‡ÈDbö‚±nW’äÓ,…Ã¡-]=i_ÃéşA¢ÛÎÜ‡²Tµæ`[*. ¨éÌ3QĞ°UÏ@”o‘ŸÄÎ¸-ŸÜL¶®Ø`QyŸ3< p~¦¡aÔ…•ÁæL…è(!¼ÜX\nnˆº‡zòÊt>ÚÒ‚z~ûdİÆUÙDª˜±Ğ&†µÖu°ìs²ÊÚ„XªÃ¡3p6;tüv\nÇ2¦±t½„éÙ^Z¶:~ep*ĞyÉWf^—ö\'°úğUµŞdô¸u3+°]‡ÚjÄä<S]B²-Ks˜†Ûa1ÒÉt´ÑS°”¢…!è%Í=-\nÄeb´)Ãñ5”,²ééâ¡y\'ñ•ıÒ‘ Ø\"íÉƒœï.‚$òZÔër£aÒ´KÔN(ÏNĞä§~fFnZ\'Hyèø&i²Üœ	1óß1C¤²JÛ¿Ä÷ëSÈÎé:IG§ÕI|L?g-]BºÛ|dğTœ$UTWus´r/æ 7†)Ø;?´–ãx{c´¢?@Ğõ–Å\"2nÙó–ËWM<EšäÃGZÌøËih©\0@ÓÕiÄ¯9_cí>—.šÓÄ/­şùà²>‡¾¦^Ï8ø†±b¢Ñô·´qa·©6•kÂ`ØC.QTHÀfú\0k,Ì¹©FŞIUŠÁô\"‡$ÂyÖoèø>À ê3,lÈ¸å]a4GdP©;uM%+Ë ò6›lÀÇ¬#‹Ø“l¤9üE\"UÕğ¬:(¼	½?¹Ç¼¿‰—aë& ¨èGò1\n÷©:3šDV¯/	#£qÕÌÖ?(:ÙHÂ¡˜-ˆÚ´¯/­\ZÁÁ7lyÀ\0%@è¶&ÌñƒæâYY@Ö-ÇhDhQâ¯š&×6‹vÚdèa—@°rÇY†Ë#+5~>Ç²úâén‚Ä£•½ÍåñXe…gs/Sç¹3\r|Û“ƒİ´‚0|\"K»÷,6Úˆı<-LŸ’]ü\0pôeR7\0éôdªÍ¡ªõWŸZ¶L	¢hÏ‹íM€—K²\rbUX‘ÕZÌZ5Úq›TĞä”â®[Ÿb%L}…ŒÄ\Z«>FòÂŞC¨Ä\'Yƒx8F¼nÍö!Å¼f€ Ï¡Ûè†LÛ1\\\ZuòemÈ-ƒ«ŸYx08Œ*’û}¥åác|¾Dow;ø_Z¯!6ÍÈŠ»k0z-®\ZÜ÷ˆ,Hô1Sªé¹)”6Æ¿é•oZ·—¡¢rö%w¢…§ üÍq2×ĞŞÿ\0@©á’ã¸^ÑkçEyÈPäÑ”FËçÍ½#Ğ%Ú¾Ø¶@¶\07®²…˜á¬ë¤lšhgŸğÊk^OÃó)E¯=:Dİ®i¾¥t7EĞUÙË–sáråË—à¼Í€®„ËÍëÖ[¤xèE7Âò^l­­«nTe¨\n×ª–Kş³\0¤·“.pñØ×ø¥M>GoZ`¶¹ĞrOlñ¨RghÅBÚ°yÊÉ’éêó[‚Ï]UmÅqÃíßc[èFHRuèf\nš–Ï§†&Ó¥\\Á¹¶âCÌ»B1ï£Ğ×<<¦˜#¾Oı•ÚéOêškSyêK¶++çƒøœŞ\'Ô5*5ê^öÏ.‘19øqA:+èt\\ü£êyÙØRt•öKCºó¡ÜY‘:s÷u>|ÌŠõnÅëÜá¼8š„³¦v;ï\Z’Š2ŠÅ\0`‡\'@‚4ìÛ=\\ÁFš S¯XV,Ã÷íÔZá=!¢SÂ½˜­L§#á6Iß(±İí}0¬¢Õ†îÁP&+zjB*B†Ã_9z&0½M1í.t2MN¼÷\"œ–dÖ¿f5‚#şL{&whF³­j’ôMC©ÄH—è¼{¬³Yh/fùÃĞH7Ñ¦8ñæhz`tİ9„`<ÛÄÊ9ÚBÜ	A^cİ³Óìk}	âÖ®`REİÍjîË‡|Eà0q¬ÒäÙë†`!©=f­{_IdJ]ğLVÜ5ƒ¿§	0wT—ëF§æ+ÀĞê|±ACåsçÄ.2.<©UøQï‰‚ˆv›ŸÜıŠu¦¾]bÀa{Iµ¬@,èŠ /5q”>êŞê$ÀB‹!e½g‰¦ÀRšú¶TíÄƒWxÁŠY¯-ÙÑš‹»=î,:ĞråÆeûÔåƒ]!`õğE°cJÖ ¦ØmM}!¶Ñ¥Ó§¾%++àuüK˜{r–¯ó§A¥É§´MyvÑ7\Zú\rR/OIÌ«kĞşæ]:¦|Ïîa,¸\r{“V%\'Ós5şŸ$tV&§^H¤zØC³<s-‘–øÛ¬V5ØY¦[6Hêø¸/¡)UªEØ‘ tŠ!-gXê!ó\n9&ª³}¥› ~Æ§Ñ—jÂæ[0<ÂÇ[?y:ãyjRÒÔ×ó	 \Z7\\.lhWXHÕt3¼Â-İè|Å¤á¯ê7hü¶(å àë1Ú;¿Õ-p–½8EÜ!]wó„eNNG–sFæ¿4 26-Íıc„;ÎŸ3&@+Jip	stu_‰º^O)©\rZšÇİ4blËEï]vlôJc{ÜÛ¼Cz£9ÚY	Jè»çá)<\r„ÇN!J¡¡g‰n¦0¢Îä½Fh^	»µ:CãøOé	HÁiå\n†ø<°ûFĞ;ÓOÔË‚™¿ä•Š]Á«w8N\'VË äÜ€Pªio—JC(9ıN–A¦óå)jÕæY%YÅëÛ‡æAàø<€²Õ—ŞZ¡¨ru ªÇ\n¦9¨êø0ã—kSqÜzÄÁCå6¼z˜SQ\\Å[q`‰¼Ü)ãYlšîƒWØO\ZğÏƒ):†Sä‡·^‘S;é}ÅJÃ9ZEå@o¤	¯\Z9ó05=weHc7cJàÅC8ÿ\0G¬lä°’oºq¿_ı\'í¶İ\r\"¦-]=‡SÖW…Åá Ü4üEimÜÄ`VĞÔ>\Z…èj2Wv	0,O¸–ˆ¼.d,æ]ÄËºÕ€M¯¤|ÿ\0KÇ\\ÿ\0IDÄW`ü²ÆbçnĞ(‡PhôfîÍrÀ£¶	;ñ]ÉÉcjØî‰]Ôeš•èĞwr§æ†ŸˆÅzÙ”7ÇEÔ\0µc 2«„z?†‹brúÆ\ZÃµÕ” ,x^L±¾•Úöa+¸•F½uÂU‡”Fi\ZÔœeøÌœšÇW¿…®ßÁlÎIN‚!Dío-JqÑù‚DCifXÄ±F6õó‹R\r™%1î}%ƒnöÓÅÓí&«ê@¿&põ³Ò¯J_0ô`:™Šoÿ\0©œ´ëdÂĞé¼#+ğf‡ãEƒr!Úy‘	°±éá”ã•†\ZúÚèu	«°jºJŒgU=f‹åq,¨PF_w&{Q »Àk£=ƒƒˆš¡‚û 6ƒQ©]kM\n×¥	¡W€:s{EEÖêkëT©®—ÿ\0Wå-NÚ{\\‹Oªˆ±Ö°AQi£û†æ¤×C–ÜW5§^b\n›”8‚lyvmç.â•.C¥ñˆÄF—šÔT\r/¢íqk\näï6Œİü¥tlig$íåô‡¼ø<¡Ğ¼:‘\"ŠËrnrí/V*ÁÊ;ÆN0¤ÔèÄ™ÖiÕñO \n€]Ÿ,ªÈÓk:*0æË0Ëq\Zß[W‚´Gî‚4i:EzO\'ø‚Ş5ëøÏ†`Í§Â4UìŒ¶bÜ?Øú<½aŒ´(î†“d”õ·àûJ$¨ÔÜA¶÷5…WOñà³\r/½×0´£îávïE6Ã¬.«¼-âNäuëœu&ğ\0À*&ü§×ŞTàV¤]|ù˜ÒçŸß¤\Z‡¡?3Pr¼ÿ\0ğÍGµDh‹ŒÕëZÆ&Î7\ryöSyBÏLRŠgšfvuï4V$³£‰nyÏg—âj\n¿Şğéjæn¨5:œ:¨¼òr¶zMj·Wx1ÆW¤ØFÕödéÒicoiK`P4²a\ZBæÒ,ÔÛÃBnÈ¸äšÑ.½7ŒIã+’à7h8b=¦Pº\r„\\\'o¡œ¶…nş!Rh™$&®Á»ë-ÿ\0¡‚8•útp}êC·İş 4-DØ\\N[æÿ\0ìÊ§”r «±äzq¸çâVî¼â´2_„pŠ±j»œq6‡V½á’(­{\\ÍŠ#ğŸ‘#‡JŞc”©¯»×Ÿp¸œÆƒ¼)àÀò~¦xTÌh5©Vk2€C¥†K…Aµ\"ÿ\0NĞ2íƒèô˜„ç*,x™¸¢·şÇ9?±ŸV†N¶…„/æ3<e°º&\"»ÀÅún• âĞ;´ò–¨ú+;ÙUõ4€+ŒôšKr×å<_ès(Û 5ÄnÈ†[¦/X×¢·L§N!Ÿr„06f+Öi‚\0ZÔã»6¬+Ê~gÚv´‘IÖ3JóZ\"kIÇ—£¹ô8dù.PfYm!‡s	+Î)”«ÓNpş^\"à¸ˆÍŠ¢ïlun€d¬Ú¼+ì6‘TeV©Sâô?^#cDÛ±­»³P?Ö…£è•0M­ÖçàƒO¹¿Óç¼®Û_bzCº•ô|\"´*…|âU)…”(Ù¢çí¸kªòòVX|İ Â™”Œ®WYeÕÓQ³Ibú-Ş¥Z´Ó‰%tªxcï	_R¯:tœÕ´\nİ·”\'\râ2ŞJrt-;²RÇ¬ÉAnÎóB…&´Ÿ‡y¦6VÃß÷Af·›ïÏs1ò‚¦o%ï1%I~{B<(/¸áéï–xªÌS†zšÌDæ°éE2+Ÿg£/K»_Ì(mö_ÂpÓŞcÅ`¬8º‡h=·GwN’İAœyLÃ”ô¸Õ´¸·íÌMõWÌš+Ú`®¯H\rËêím®Şr‘HÜ¥¶÷­ÊK†ªvó¼}¶øŞ‰o\rWˆ´öŠ”J²¯[k‡íhÛ(NxÇCi+Iæşæi-ôR€\nlÔN²‹ª¤uä§ixŞŒê»×ZªóŞ´ØÅ² §iîk|Ã:€)/¥ÑÅ‚¸ú¨¹f»=ÌÇ¡(=Ï·d\rj-MmòMµ˜³ŞĞ©oxÎı.3Èâ7Ş¶«Í„\"ªoŞVÌšg—Ö\\¥5\Zz&	V{Ê–”<‚oaŞ*tqŒ~#´ù;1U\08!\0Ù=Âà¢Ôh×ı˜š:Æ+™\"¤€cÎoC%é	Ø®€˜ïM¢š–ÓÚZk	3Z“s=kSÃÌI`mÎèÉ\\Ùsúñ>ıŠÚV´¡RüÛ£–‰¹§Z×†É¬)¢\nÊ²w™ı«ôJgl2ÃÔı§C9ı&¯\nÔ€R1ëMÈÖ«•c¶\"a´¥§/O$Ò6ÿ\0a; 4l:3wB0ÑÌ×»aÓê§¨àV\"Ë·‡‰yÕ\ZÀ;¹cA0öüğŞ­Sw5~å+Ë£û–jì8\"=MÆÇñ\Z0m\Z¯[ô–&·nO¼ËîÂ9> vĞ\n·3]İZ®_§ª+£7ÖêáaÓPÔ±ôJtûŒÓ™÷%{\rnOÕ¡/ìˆ·ÙààğfL\0¬¯rµ„§$¾@®˜l±ã¼ƒÒ-ã,\\ÿ\0âsç1 †Ç£!›¬‰Ÿ]W\rP²yMwL~¿ˆç’j­~Èm¹„`¶í áÌƒqÄB8ÒáU@èÃÔÜü:KßGºL†À×´#7ÂG)ØÚŒZ;ØİPR— LÅ÷ˆ|rsúLô‚\r–¼‰K¡óÛs±ÚËÿ\0<ÿ\0p_Á|Ó\0\n>Íñk‰AwÚØv¾>#ÒêÃæ‹u—\'9~—‚Ö<ç¥:$Ì“âË6ÿ\0kaNÊÙö–Kºr5èuùaáØ®Û°©ÙKS¯+.5SQ\\ó}!§N\n×bº¾b®·;³û†ônS´­íºİƒQàõ©B<]Š{¸šUİHÙS`³ˆ5”N·	OBh8îÀ\00ûcV­¦D|]ZÒã`+õê6€ú6~ˆ€ÄQ[WOf“Å\rÌI¾İbõ<ÃÖÁnÖ“62§½íÒ©ë´Rºã&}e\nPôèæ5K_’.±’)-|êXJœ?R†å\04ó{ğ¹\"+0Nà’„VjÂl£²yâ*øÉ®‡SÌ‰èõ¿÷y|KìõiëòİÇ“Ñ	¹)[ÆKáaBòË€Çf_»P`£~ÑR.¥Åß›:*wè`(hå\Z%#lpàÖ½ùûìá3\0 DÈèÄâºôQzv•E(°x%\Z\nÛQm®Ì¡™pùê/Ÿ‘O\\En¡¤Ñ)—gŸşÌİ«¡Àè|ÂFÎ’Va·ÕyËIa4qz+¾•³QÓpşÖiï„«y4™ªj\rJh¦32»W€+ˆH¸Aşõ™ã|q¨œ±ç-Îî~\'u)MJ±3:#(*¾`êû#\0¬«-š(¤VŞ‹•]A6Ë„aŞø€ˆt&9°?ÜG3Ùg€ø•\Zo˜u”m–`Úø–ƒ®¹^!uM®?öçbCnçd»÷,hú<ø‰¡§°Yfa‚™¯æ`‚ÑĞù‘èÊÖ·‰¿é ö+¶²åNĞX¾KGˆk6½³§vÂ¬]vz<Å=È^ä³\"£ ß²fÁpÖÆ×³WÍ¹­ıuQt´×\'‰œ sù;úFÀ›U)ÇrÈ=+H·¦í°y¶ŸÔxÔ†Rt¡9Š·˜\rG—Íq:üÃXvÊ]¼uûµAhh”A–Ä-£¼á•\nçZ¹\'ÇºegïÂ°&¹·IÎÎ•\rØ¹fŠmœu­ûøLzƒ´Z¡ G½ÛÊß\Z‘üÄ:w­ÁœŒ0E™YOÅ4!¦º°VU5£—\Zë\0©[\0\Z x8ö—(šu.¥˜˜±WuúŠËãîFŒ\Zò\"Áä±ªœçŒË±0Z°Ğ_Ä¹ıaÄ:‚ 6û1,«%Sò/wâU«¤Eå´ÄIh¥g¤lËª“İä‡÷ŞPËÚÇTt­(t7%ìÄì ]öÆ]è)úæ±*\'Ú³~Y]A»rë\rd¬Rçgä™˜ş>%©ÑÁäF.1²t‘2]¦G­K§8‚«£\rÖ–zsÖ_–@Ù‰Ôâ‚²ô‡z:œŞ\\¹–Û¢/1Ò» [×Ä:À‰[ÿ\0Ço¦9‚\ró­·­ãævüŠ“J§šIX6—¾ŠJºpß£ò¹Cò_˜¯eÃ#üT»Åå–ñÂ4nÉÄÉf$¶	ÃÕ¯t%[F¯YÔğ;0xºÄußcÖÆÇ[$ºÄ;ïÊş\"¡‚»j~fyAcÌ¡Ôß8I@Ûí^}4ÔÄÒÕëÌ©ÎßÎ ‘hìm\rAq³h\r%ÁF6ğ 5æù4¯uø™©­iMtï’ŞìasÑ@<ŒËKLv<Ğ]K™¯?l§Ï28H&û±q~æı1À3“â=bøGÍs0gqİ¼`Ğ\r?íqœû/^Ò±iP³í4<O{ÓIşãõØ?©Î™àVœCÙfİ%c8–İEo(Ú÷›Õ\\Å°Y`3gDW5<ïñ)¶ üÊP­gŞZ_Kg|@\ZR•1‡Ay²ÈàJ:3¨À×…é	\n%ŞJÃq4Zh] q—FFùæ+bëã¼^“1r§jØşJpJ¯şSÛñM†< áË-zø™RPÛ¤FÄCË×¬ Ê&œ5`8œ–»àßH\Z±áªJ¼£Şb¦\'®0zEì^ØÈtb•s\"£[>eìê{¸üA`½AÌ×‰§ÊÃ…g¹GæijQl\raY\nfâ¦&¸Û0…feÁÄÊÆVİŒG+¡Rò6l›­MJA3m«:gş‚m€Ø)Í;Å½`ºàà›@6.È[ó =ÌÎñV£³<\Z·2Eš®\\Õç¹Š›î_üÒÚÅY7wåtGŞ ƒ÷CMŞÖSÊ\0ğ6ºá†NA(W];?0‘  ÿ\0ñµãKÀ¾ßÿ\0qÿÚ\0\0\0\0\0óÏ<óÏ<óÏ<óÏ<óO<óÏ<óÏ<óÏ<óÏ<óÏ<óÏ<óÅqÓsÏ<óÏ<óÆ<óÏ<ã\r<óÏ<óÏ<óÏ<óÏ<óÅR£aH`$\0H<óÏ<ãÏ<ãL4ó<óO<óÏ<óÅ@ƒ\Zß% (<óÏ(6’e¤e•\ZQÜ<óÏ<óÅB“ëm°ı0pÑˆ<óÏ<eE’ZpQHYQØ<óÏ<óÅV¢{}¶Ïe(<óÎ07›xğVMöZ0ÒtóÏ<óÅB•Î<°=º¼4<ò+æÔ?+Ê¸;ÃúóÏ<óÅ|…ËPpşø½Ü<óË#r5„ËÇ;~¿]qË+óÏ<óÅB€*,°zÉ3|<óÏáYD¾òŒ½ ½HóÏ<óÅBfH	Ä/<÷t<óÏğ-9IúóÓV€ZÁóÏ<óÅBRã;@!<óÏÔËHñ]Şê®,îÌóÏ<óÅB+ ‚ ‚<óÏ<óÎ0ÃÓÏ<óÏ8ÓÏ<óÅB,Š ‚ ‚<óÏ<óÊ\ZI”\rqN<óÎ\0SÏ<óÅB!2 ‚\"m<óÏ<óÏ5ò•Ã›MÓË>3Ï<óÅB ¦D ‚.<óÏ<óÊ/`\0\0óÀïëO<óÄpÓÏ<ÅñEÊk	ğ<1gœóÏ9ıx\0†s‚’©<óÀ}÷ßI4Êûôü<ö»`[Â~/À\0\0ˆ·‹o<óÅ0Ã-ŒU6¹xÀ SË•Hœ¶ù\'\0\0§ˆÇøp<óÊ3ë=¼wUE%H3n8ß2ÁZ©\0÷*“DQÄÃÈa¼óËù–ßY–(-ÿ\08÷¨\'€\n`÷?É Ã[ì¼óÊ(•yn±Ï\n¼Éÿ\0<óÏ64S,±€á¶Ô£(×¹$üóÊ4}×ı>|çuıÿ\0<óË|L…0é2YK‚ƒ\"×Y§üó\n†Éé/¶¬û½ĞÅ\r<óÏÓf\n¦†±…¬ò`÷êc´âÍc|«³ìU—<óÏ<.Ó”²ª9,Ğ!³Ú+´Ó2óìóËG2í¤Ù—<óÏ<ÂĞôË„à£Šp—yåœc\Z<µ8ĞHQ	™±ÅÒ|óÏ<$š³k0èH\"$°‚Ã°Ç8pù[Ûò©õ…S<óÊ1eº°¦ˆxí6úå¢1Ï<óÏ8°Àßq¬AvG<óÉÆ.ÎÛ€ÁÏ¬1Ç,qÏ<óÏ<5ÅÇ}µÙ|“Ï<óÏ<óÏ<óÏ<óÏ<óÏ<óÏ<óÏ<óÏÑƒ’ÏsÏ<óÏ<óÏ<óÏ<óÏ<óÏ<óÏ<óÏ<óÏ<óÏ<óÏ<óÏ<óÏ<óÏ<óÏ<óÏ<óÏ<óÏ<ÿÄ\0\"\0\0\0\0\0\0\0\0\0\01 !0@APQq`aÿÚ\0?üs+;;)JR••”¥)§ºñJFø¥FˆÈÈñ§ºò}¡¸A.Å±ÇĞºFû£àìë\Zxæ¾&m÷•±lĞN±ğn,iägÁyŞµ°šÆÒ_p¢jLiá¼.)K›áxJT ã± —YÓ“ÑWĞiLlİ\Zª:ô=DE*ÆÃT|ô£ù¼!³Bt4Ç£á£è”ZÎœ„HÉ³ „œ§ÈØ4p{ƒÄGĞ~Ä^Ë ’Zæñ¥Æ‡A:ˆ=Áì{ZÎœ´½5ÂRÁºÎĞ•cÖ\"PmÉô1.Ê.o\rğHhF$C\'c”‚3ætå¡¶f=ô!±#èßbUØhĞ¿cQ	7„>Ğ P:¼\n(nãNMTxtí“PSô¢„?²«ì¿Ù_å¿bxô÷_Ú=<O{ôÓàĞuÍ*tXÓÄ½!FL‘ÎGÅhıâ1§‹P„6ËÑ|[\r\rA*.„<iÂ%²\'®Q¹?ã¶Z¢S\rRF<i”£Hj1æ˜™)ÛøWß[nLûFCN/TÙûH‘\r\rŠÇVÅ¸¿$Ä“ìYÓ1\rC²„hlø6{ÅÌdrqoŠÍÍe¢è‰ŸÖOè„EEæ¹%ÎNš+~\n^KÊ²™„(½ŸGÃ°j¾¥)p¸O˜…¡¬~´à¸5ãBŞÏ‡à\'2®úÓ’ÆíêÂşš…ø7ÉvDĞ¦\"ı~ÿ\0œ%\r×ìR—ı÷ÿÄ\0#\0\0\0\0\0\0\0\0\0\0\01 !0@AQaqP`ÑÿÚ\0?ÿ\0¶DttB\"\"\"\"Ûİ[l)JR”¥.6÷VÇ¬i›.³B}ŸO¸Ûİ[±³L½BØ÷•¼mî­D>š!ôJ5B3»½Õ±âÂ‰Ò‰Ñ²•—;r[\ZMa\r:D%Q6ˆ”ƒ,ë#ğKJø$r³ô\nn¹­á‰aôO³cî>	Áï;rìĞõ09\"ga«¢5T†f|s¢\'cmïšŞ:9‡²SOB]F‡ÜíËAgbOÁ47t5A\"!D\ZŒZ*3vk³¤B—NkxO£Qì£ìEèVe÷;rİ\ZcP½Ğ+Cö=¨n’„%bgP@oÁı™ne¼4.™(Õ˜L ‚cnIÇOãRjğæ¨oø.¥ş$ÂıŸQEo){Ç·º·Áôé|[xœ	ßIo‚T@ß&áÙãoØŸ~’ßÉÉ›coÙ=\"ßû„ÔNÁö(1co]ˆ^Šß2œ¸N¡cl³¼,Ó£¯Ioœ’§È\"›sl¢DÂiëÑûâJ%³ü	ÜÂeö(×¢·‹ƒñN;f¥\\/§÷•(¾8¾.‰„Á|Ï¾-÷ˆty¥$ë¡Bìî]‰¶8£ÁiĞ±v7£Åú\'PüV]	˜Ét†à»M”Œ¡!ºmé1ï-ãşèúáˆ2Ã²è‚yok)6_4=.‘K‡‹ùá;E/÷É¢\Z)W)3ªëşo²2L·Ù£­Œ1Ñ|k–‡¡¯ŠS¢I$—†á¢Ü^Æ‰HiaÆ¢*ô\Z£vApk)™çGûûÿÄ\0,\0\0!1AQaq‘¡±0Á Ñğ@ñáP`pÿÚ\0\0\0?ÿ\0ıÖ¿ş× (Š“gù„\'‰â½ÿ\0æ„áB˜Ç	Œ„!Š¶ÿ\0ı®\'äç£sZØİ7ª\0\0­éŠÌUÁ`s,Ñ¨ª–«Ô…4³§“ÿ\0-MĞşjlóEú¸* …®Â\n¦æh*ŒÀYa\0 °\\úÿ\0øüOÉÎqæ‚UMÛ¼õ¨vb„FÂèÈ ÔÏ@k6­Ä4¶6JÉW™Ïçÿ\0ŸK£2åËúßøş?Ã‹âú_MĞşa–V1j÷UÛ ê›ª{ªÆ®?š\"¸UUëÄ3\nÃd\n…-gvBe»şÜxü~\'äá¨Ö{C÷Ø‹,äÄxÑ, uZ®ûfl’ê»°¾á/KEAç ƒChO¨`æQ):K ù3¤}7/ğ4ÿ\0rù®›ƒi•gû”–FŠÙ‰^·såœJ•‚õÀø‰(gÀvñ]ÂYPŠ;å\0÷˜e+™Tî¡ÿ\0U\nĞÕµ¬Ã¢\'\"×Íâ24h:ÈÊEÑÿ\0ˆJÂ£ãé£ÚÌR)~à8-^l<e$j%«hõ˜Æ£AĞÜKp¹\nªÚû€\"v}nY“¯¢”Ÿü¤,Éş*°E:oéùøŸ“œE)@[«÷PÒb&¨Êêš¾Ù„¢lE+äÔ\0H2×o4›ŒTI0s‡‡©ÀÓO5‰p¨áÿ\0³dQjˆcÆ›4âŸ5@‚¤1ˆø.Eµ–…ı¦øä½­Q´‡›‡MViÉWXw|]ÆQSµvÃ„S;0}ÌI½ÜÜRö¦>\"pçˆÍZ£äÙû„¦ëéà¿xğ‘pt\nÌ¨PiÖ_î cQLşa°æ¾š=¡ü˜¬­]Æ dP%æüKÄ ´Î Å–¾F4Zß¢‰ŠaI±o3	÷×²\'NN}ƒg–û†D†À¾Gş\"ıQÀ¯,/„ÉîbÑPdêŞø€\"9³\"Gà²U¨¡N•JT¨[meó*ñ+$•ÙÄ N¿Ù	ª6´û„Ò`Ü4áôBô²ò3MÎy=bDM¬\'æV€n¶>ûù– ÊÁ¤ãö”¼%V\Zªty€*ËnšXŠ©\0+¶æÁÃfŞk ·ÿ\0²Ó\n©DcöˆÅ	a<A(.@ƒ\'ˆ•…_bRŸp(ïoóñ?\'8#6Ú5V ô¬W¨–E¹ë›‹ü™TÀ6>[ˆA…¶…5pP¨K2©kû•Ğ–îósóšÔ&îı6Øª|ËÑY^\nÓóPQî†şĞ+[=£6,\r|¨Ş0ã\ZKâW¥–4ù<1ˆ+åu·Şj-V6¬¿Û\'F!ÅŸ¨™ZÀkıÇo¸È¥Ê”¯˜—Täåg~PT87‰œ®\r(ªOQPâ”òqôÑíäC¬J»ÄÁDœ%‡€ÁH©Ü!äî\ZXVAÒî>\n´ZF×›j+qfhä€LCãDL‰¡é&`„E;E¿¶\"	IgïÄ­¸!;å{4Ëf,Ø)%–kÃ=â~õ£c\Z‚ğñ\Z” †a‹ºá1?eËì°=Á\0f­ èî/òXltc½ÎSy_³˜KLa¥,Od¬h¦)TĞ¶­€\n±hEà²Ï˜´%ì¿iö	ÜÌXŞ¼òü¶-¿Ş‹ë\"Û¥z†\Z\0à\r9,óüüOÍÃQˆc/ˆPIe\"æå‡)EŸpÓ$¥µæÊ¨ÀI°Ú‡áU™Y””Kb[6s2¿ş£7DoOÔ½Ã;_òòÅa×î@m»ïE¶ƒuVÄò°»m¯l\0\0Î\\N-²x²0’æ2²Ñ$à6Á;~åº€ÍËKÇÄ€Òé™Ô–)®àUƒ¬9úhö‡ò\"”*~#4ˆëc+e?BZŠ¨:¶³\\ç û~ÙÀa,V+óÌ€ 8\0”\r—jÔ¨†Æø\"ÊèÛV‘ç©I¿ÀŸó<®L«î\'Ä¹p¢º°ˆ¥K®>%ö÷uà>Ÿ‡b_ÚÈ\0à\rƒŞs\nØåÒ,şa¨€µ ÍÆ9[QìETíÃVÔE\0Å;Ypc1¼î’Xo_˜#\n¢…½¶Í«ÿ\0ï¿ÏùÀE #¦œ#·Tç\'8Zş~\'æá¨Ô8Ã÷±`·„OÜM¥€Ê®‚Và(\r…Ó^w¸/ja·Ërª‡%ÀR 8mº\0ÌqiXÛÔD•)à‡¨¡GtƒL6Q™Èë{îÙa›¢ü°Yµü±Õ!à\\x%ÓÓ§æ m¡·£wG”Ñ‹{·í5Ã#\\^lL®MP1_‰!Û´ª_iÿ\0s¦;¼õø ¯‘ùúèö‡òØê8;l=föÜ¢è$Uö%Ò 9\rÅRü\\+Tä Mù (­ qÉ»†µ$º!{­ß˜Êƒ\"zÅbûõ„b¡¿|GŠÅ\'îe~ÒOù=@5Ç1Õ?àÓU· 5lö/÷â$Ó-¬<aøa’WõóÃ\r0ÑÎÀˆX¦jË¸>ùËíÜÕ×¼CT†mƒïPâE¥ÀÚù×Ì*…\0|âØÕà`×Æ*¥¢ Uôÿ\0ÁÄüßÑ‰	a¬ÁÀXóe›ï/ÒĞŒ0.ß÷\ZUĞrŠ×ÂWÚ(íª°‰WîÉ— hW’Èğö×Ş¢ŠE\'@T­ü*Ñ?Pİ8#[kdû³‰7¢¼ ˜î‡ğ^ßƒ,®˜+\r‡Ï1‰º“§I¦\'˜¶ZeDŸ%\"(?üÌt%#›¸¤ö5rİ@»I<V*TV0JŸMg`l¶Ss\ríR¨ö}4{Cù\rPªÖBX¹_˜@ÉU¼o8îŞ\\ó’ï+GÜ~ò±Ä¸SÀãº:€åûT‘ÅùÃè%cÇaàûÊ‚\0üMÅ´e‡–¶AGX«„ò3kqÀ;\Zå19)‡ÏA¨ezU³ˆœ`æ«h‚Ö‚÷*`ùÄ½\0;5F/à§¶5\\ S~/gI\0A–ĞÏ°Ô À¬,¾ô,Ñ9m]°‚Á».ßÔböÂ«¨X¶H2?‡â\\D…3Œ{\\ú!œâ(Îÿ\0q„+€mHıØB`£P]ì¾t:ïùøŸ›ú!’\0Gmã½J B™Z­cÚÛ€Ğ\"â¼E;®¨É~Â=ˆ3ìÖù=GŞt÷Èk‘çÌnV¡å])B¼ƒóŒ—@«J8œ]ğÅÂË;5ÿ\0Q=TGÔ¤…pPlıAÉ2Ñ\0+Gl¼±ÎY¦ZZ}<’ÒÊĞŠ…C\nYM<¥àVVXEÙFnd•Ec•…İG™RÅµµÄg:Û\n\"PŞ7¯¤¶-Öæ$ÚVßî’hÉôÑíâ²)¨Ël=ØÂ”à9\r;ÏÌÎawX{Š”–Û•@\0]ÏÁiˆ0FÇr®jJNDn^Ë…]éjo‰@*nî¬H7\0PKnkB@ì²`ßŞ_ÜrĞ±\Z£¢ÿ\0p\',R/·lOˆXPŠ’‚±¶esÇáCæ·9ƒœ€ W÷/â¥QX	Äøx3ª}è–o\0x¬^o›äFª¯şxl1Ww€Ì7òp•sñ+í¡ø”ÕØ‰+â°ùˆ…aÕâ%Xá”ÒĞ«Dğ?r©¤Íê(D-H‘+dËı/Üäü8\0´XüÂÉMë1åû I¥°<0T³B\0¿2Ù \"à£-˜1\0*¿ã£ÚÁû†«ıä¾jr\Zt»\Z\n~c!‚ö |Ç˜MˆaŠg!œ?ÔhÔLò5Á-™¶ŒüF4\0mÎfêÿ\0Hò \n(]K„ÒW[õ©@³\\†¢\"oÒù…¬¨ı3ÿ\0şT	€eëÏÓ¹søP6qğ™ÿ\0ãé’à½¤Æ£­A‹Eõ\rTª†,³™òßñ¨‡\0W‰óªZ(¨Zøå<Å–vŒ/–{„Ëù%JO•şÏ˜*Õb/òp„Ç:æ¡0X:^õe‹)KöBRE1‡÷âG´	Ïÿ\0GÌ7t„Áo<bu¤N†ŞØ¶„”/¦\'*€«mÒ°Œk0{æ­R¢>éZÆ8å˜à¬/šüBÅËƒñ8©â\rZh¼?VŸ ¢g¸©CY[€D •® )r.í1óˆŒ/úŠÛµÿ\0\rĞş\n°ª[X5ù‹)kbvè¨*Ëm4äæ¥Sğ½•Œ-9–¤Ãıñ£LĞeñyb2!úúÁå„KrQÖL\0ò°D‚­iµvÌó-ÑÎœ¯‡÷ôJaQÖ_£RÆ‹}?LN=üU[¾GÚ£6z˜ÿ\0Ó„¼”¶œ^ß‚š–šP8±ıÅZÇ,¹B”[Ñê{`j	Ë¿¨åµ¡ÜÅÁ|\nÕÃüÏçùxŸ“‡ĞA˜ÈğIvÍ\'ê\'¬p-@ş_vd¹jyÏ8‰)Æ{g/™kê“İ–şe\\«³4É©Z\0ˆ¬[exå\0–Ğ( Xm²ÁcLà„BHŠBX/†#„c¬*9‹´éüÅ¸¯é·~oñ)@\0ZQO¼ñïıQ\rçMñˆkpaÀÂ6–Qy·Ú;}ÿ\0†hN\Zo¹v@Ü\\ÚuâPª\0±š|oğ@¨¥PQëP<W¸D6…€*èı}1.JşWé s±Ö\n™æÍ]/ı÷õP:S{ø€,NHÄ\0ıß£|4ò„si	†-ybœö××ñ!¯øp™Y;kñk\0vš†­&®È÷³k,ü„X*´8y}†QÈ‚¾Ñˆ+‘NWpQ@\0>!¸ìş@ñî2-(à±Ià¼Ê¯åâ~Oü24G¸>h&‘§¤UUÛ¹Gègœ³Eñ\0BïÄ=„»É\0\0\ZLWŒCñœe&\ZıÍŒ»¦EO‚àÆ‚9\0«{b¥\"ò¿xöÊ_¼—ˆ°§È_ˆK®\0úF*ùFN…%‚ƒ†ãqĞ’ÒÈH\r‹Ş,K…–Ã‰ç¿ğÑíäB)±ğÍ|Ïx\0İ@dcÚWÎkFgâ+.&¯ıÎ`g\0³\0ˆÙE2ªå–::òÆ*B™Q³ïğ˜qÆ>t4ı¿SsÑ}YÒĞ6üËÀenÆ¶ßÔ¥ú~$\Zp½PÖÆø1øE2)´qÿ\0éRç`1iŸÔEÙ¸<#2ÑWtŠ~à±<s\n­’…5PËÑkıPÓ:…G¢öúş~\'äáô° &‚ĞçâkvWdüı7ÿ\0ÖY·Ô$ áàÆÍ^½$B@ÊŸx›1¥ exÀ“¢~?ªŠtP×ÄqG÷µ\Z\0ê\\àIÑŸÌL1ùÒ—óARô.^©Dcş¡@´UFîÜú‹À`°+¸¡¤Ë8„*YÇhWê»µŸ8şá®ÿ\0ÃG´?Öé~œ^Š—ÁctùúÕœ+¸4«ûqwWa´Ëğ~e#³Q·Aöoâa<9˜Ò<Î\r—õó\0SµŸ§Ìµ Ep²¾^Ö×/¸€X/C€A \Z#§ÔP0ãe‹~ĞTj`¢É÷?3\0£äO÷ı±1°°õ«úûÄìà†DÙSRá„r„ù‚­Í!aÒËÄüœ g–¾9¨İVFÉ9µu“¿­T—gª¹ø\"“µø‚\n<r\r\"TØ×1³¥·à\ZŠİa¬¥\02&DyŒÓˆ,C³‹ˆ±>\0e™\Z‹^…ÿ\0QŒG \"è\0W§ÜA7KëMá@÷Z†b/Cö*q”>@gøhö‡òÌîwaä.Ëæ(&šªş¡UƒÕŸ¦\'€T,ú±CÊµ>Æ­mûÊF\\±Ãá´Cc°şeŒª\rô&F))n›´Rüî:}Bt@¬ı}tŒ2¹_ƒï§ıÛ8ft<ƒú¨4€ÆYJÉˆäï¸ûzA/S2÷p“Ò¿¨ƒaßí9HÎÔ}³?ùD$«ÈZÜxD5ü¼OÉËúp4ÒéT+–®¼Æ¨²9D>E#İB«Q°ÃóôØ¥™¿Ô\ZóşŸ£ƒM¯j |©+&m­[ıGmj¯nöÊ‰E‡B¿7\n EÚo¼0oÔ!f9©´ÕuªÖ27,~bŞ’Vì{Àz×+”!©goöFô¡<RŒwş\Z=¡ü…háß¼î]n°Ÿ£.xÊşş¬I„U+„ˆŠ“Wƒó=¯ş’ÆÕ;=ÍùŠ“â\\ú-LÒøú]ñbyÊÿ\0 Ÿğ{Ceğ|Î/œtØŸz1-h°êĞ)³ï–zÔ»\\5{E~Ù[UY*»ö:–Eh\0µtZ®{Î0¤˜àïù¸Ÿ“‡ĞQ¤nÍÇ`‹A¦«gË‚-@Aºü„•K¢µ€QŸÜü(` Ud,½Ã“Åˆ=\rÙF•ÑÔTˆ6° Âãm¨ªó¸g£ûj‘şãÑbè¤­9æjª÷â[bÁ­Eâ½B€ä³Ÿü†eBœZXş C:¶Ê\0Cï<¿ìÊĞøi”h¤€Ğêu\0\0µÑæ|W×G´?‘MŸçèÎg8Éôadÿ\0·ûúR\0Ú°äˆ­‘Å÷Dß“û–§`ÀQˆa£næ´ü”ı×³~ÉSB¨­	D\'ÑDîÆ0­uyü\\¢QªmOËôÿ\0±.8c vV Õ_AıÅ$´°^`Ø=İ.×AO÷Pˆ(\"VÇû£UJoæ^İcô¦Ï·^§M9Sƒ*|×óq?\'«äÚ5\ZJû>¡èJĞ…4ˆñÍ|ŠÀ<#ğ—¤-JSlR8;AÀ_U<8Š6‡¸tM×Ş³R\"¬©k·ñ\nÃz½æ\"¨	“Y<1S8R£Sæ´ŠO”>,¬}â”[\'0­DUµ\nQÖçdå„ŞI€«‚£°ïÜçÏãı’«ÚƒX7š‹jòıt{CøÙƒÁw <Äö	eÛC[\rTİ’ßò\ZıåM8²‹›a¶\0¦ŸğûÅv)œÉ‘~ÿ\0‰ÿ\0ÔÆ!P\"ó˜\0\0 1D±i÷ŒÃAª3í\"EhãQ5J¾2âõ1_¹•<Ş¬ü}+¬ş`I`\r>ÍáÂ[Ê‘Š¨K:›R“Ğæûâª€àó\r/òp×Ô\0\0L€8GÙ.!¦\0æ…Í,¾È¶›ßxIÚR\'\nîT`›*ÄÄ¿/ŞZÜ0[n&”fj¸ó-\n\0pş-ĞşZ”t}hèûOö€\ZüPv\\ğ>ÓÀ}¾ˆ;´\0ĞOöí<Ûü<Úxh `YË»ÀA¥U\0P\0Ğ?òp×ø×@tvy\Z~!.\nt ·°ö\"4=\'³yÃÍq?_×ş]Ğÿ\0×r”›ª\r=5§ÿ\0oòåKS°äO+ğÃˆUa`í¼ÑÎ²İmÓÿ\0—G´?ñ-AiW\\ı÷‡€’³ó_!²ê|QD\'êâ¼åBÅy·eCäy²âüä±¿*+í2öÚ\0ŒHà1çÚz^)+mB¸l{ƒàdù#‡ùÖòq?\'şX¦Ë¥=IÈ½Êµ¦²šáV6@ĞTÕ’°^Ş¥Sœgÿ\0&hâ@*Ñ,k\0<‡õ|ÆwR{ë5å` œ÷ø—•Úå™ªÉÈ?@ï—ıÆ]Cmçİ\\.^®â–M­€_…’ #a¬î \\A€–¿:ù›\ZJ•Ø}4ç¸rDDyˆ7ü‹QX¢TK¬U;Ü5çù8Ÿ“‡ù/4IÖè€èÅ‡€]	›Œ¡™È_Ê~òhö‡ş,1hÀºËƒ÷\0jÊ˜h:Éaı C}İêãæƒk>áQ÷†¬›m|ª´Ršğá<%€<©«c9ªCD{*\\ùn\0ªlÂ<‘•3l»ñw¯U(´4-È?[?‚ÉH¼€Ùş«£ÊD±äÂ§\"»|ÊéEó±‡ß>“ù8Ÿ“‡ùZ\"n2¢ÔTäšA€âÖ5ƒ\rmN§7ÊQ\0@Òişuè)jÆƒå©h\Z‘‡<Ò¾ÿ\0]Ğÿ\0ÄiÄ¨%ÚcÔ 5šT/³Vß\"µîdit:ëıˆóåhøÂdøD6óğ]|Çz¯§¸:â»¡srÕ¨}¡b’Á¤{‚Ë\"ñÎbvÊà±ŠöŒé¸|Â¨I¥ÜsuqP{¼}¥E‚økèMË•û	‹3¤xL?äĞ!‘L\0åZ%sœ–@ÑĞó	¶)Am9ÏGR»âD‹C«.\rÿ\0òsóTØå˜l¶ªğÃj0j£BSbhÖQÔ¤¨MŠK6_?É’à£t.¥Øáà“pš$Á¦ø\'CœÁDh<+ÏÇîsôÑíüXBÃ?eıKÙKĞõH|KĞßcıH@¼9ü¥\0ÛUş¤üCÅ£6h¿Ì} a^ÀUı}.³€»­³¥t›‚ƒjú¡e26&Èh9(z=XUmWÎ\"„²Ò¥•,U§záå¸xÿ\0)7¿p×øìOúA]è<Ë4\"§&R€*U°aó\0b×uÁe€q1ú°éäølş>\'äçÁAƒÉdì5Œnyr3Qe9øŠgJ…-^ÆÇ¸)z5üjÀ!ˆfX‘I÷u)\\\rX#ö*\'´Ä©3êcíôÑíüLãñ[/ó\rœö‚¯PêM”W\"n†@Ñ.t”p;ˆ¥E cÊŸi€EøJ#õ¿óÆ—À=¿a–a¼à9\Z%\\,Kkñ¹X„s}Yè¶Rí0=‹å”¶xñæ*j˜l\"pB !^†– ĞÀPl\rcÕßññ?\'àÈ‘È ¥\\Q·Ad¨ã.Õ¹Åˆøë˜èÖ²+åEÒ¼º²!Z,NÇ’sZ‡AG>ÑƒĞU|,î§ Êû„Sn¢¼Zr«õÑíüT uI™DÒ“ŞVZûÌ²¥µ@tÛÒÑ~a	¨U±X¥>çrÁ¸Gk3òşQP]r3fˆ”Éf¿ˆÑ&œ&FQXÖp´?â\"Qóù°ÌßÌçæ- ’Ğ÷Y„Gz(îïÄpKfÀGáv¡ü\\OÉÎ¿‚¡	NÆtÆ„©E’ãÂdÇÄ%Ì©Aäñ*v±ä-]¥<ŞA–[6EÅ;Ÿ#ë?Jnc²&t^KQU§ÄºØ[1õ¨vläy àúXÑ€í°!š\"9ÏP‡V\'+ë£Úæ1GÉCŸz9cWŒOe€|~`E_\n\ZÂD%-\0‰Ò9p¾Ì–T\\Te	¥Y	î,n \nk\'1@Y–zò8`\0EÜX©²aKD[Å\\ş§Kÿ\0rà­\ZQRÏ\0^Î¹|E`G­M«ßÑhÀT|Xe›Şÿ\0Ã#V`“‘{¨e‡Ôö²>ÉlÛƒ^c‚¾­§´|‘…ŒØÈúyƒf*!DÒóıÀ¯ââ~vWøT©R¡.ÄÌG¨<©w™H·0è‚‚“‚nì)>d\ZÇæ€,FÄ÷Ó\ró¨*mËf;„XöM@¯%l‚ê¶—]RßXŒDgVàh<â#ryŞ«¿	Ãôy…G\"Øö_¡Àœ	š8³õ*T©«ÚäØÎ­íà6¼]0R4\0u·›•{;-x·è†Š[->Èü¿ÃåR^Îa<ŒÛ ù>?Î»iK{#˜S\0¶©Ç1QkAjõÉâ66)\05p•vü0)¥\0U8KYRiIL0»\0Kßä\n€•h«ÀØ‘/êÛà³ÆˆkNUœWĞc‘§~®ş%ˆš‹wsWšAöú­##`Rk†_Bî|­{L	Şø1MA@Q¼^Ü/æ:‚†ğ[>&êmËÁ}u^>—ü<OÎJ•*T©R¥@BĞv<aJNŠÏsbâUÂ$‘L.#ÉçÚ€@-<š´ª_È\n w%i• tæâ$Ú;€2ªÊõˆM¹e%®ÄÔ@Òëº„AÈX#¦ªë,UüÂ‘Ó+…?¹R¥C‡´ r¥ \r±úE+*$ˆL\Z÷.âkAa\\f¶Û»óP}…m²[âøH‡$è[)İ<.’excœr.ƒöV~!„§9şÇóş6KÜ{ƒ	7²5¾b`Å	Ë$€ïŞ-\rX÷\0ã–ğ<åvw¾’0C7«/¶Êì±¶@¶*ùg/âE0å9z.£b\nªíÃŠØñÜG«\'(.<}Ä>€È£¶†\rwiºM3@=ö™4×P¾­Më‰íí†˜Ê–*I­½æ]hvŒ•pFÉùİO=ÊòØNÄá\'ğşb%J•*T©P3âá6$Y¶Yö‡ø\ZÒi¨X¤%ƒå¦°šßÒ´MìÖ„‹p f‡¥Û_1V\rdKg‚±UÄ Ñ@ğ2DY4CK‚ù„Š–iĞq§iëşâ±[ıñR¥C´\"ô\'Xèø«C(ÑŞ©É²\rËgvƒİ.pÂåÚUWwMB*\"¨jä	Y|Tûø&!1›¢AÈõxîa0-rCŠò3ğ\Z‚\'÷/£u½aòŠõµT–9Í\0µ})‚ÍpO;¡mŠÚºVŒ˜)`Ñn^(7(*²U3Ú\rÛ\0¡=°a\"¹V#½Yñ(W$Õ/Ûpv++bM}Ú¾XŒËe3\r\')Â-ÍÔ&²‰òÂÂ\n¥V~5‡¤¿ïè ë¬¡uO >£ÀZÛ>»â!Àd+—ŞçwW¹„şÕÁäXŒ\0³_v^º0%Ò?‡ó0Jÿ\0©R£EZ°_\"²¥N Á ’‰¨+Fmº— 1Š¶(„*—Gnye°\\…m×m0Ü…¬-¥<Tæ86@[{ÄZ“”a…À1Pá°j$‡Ld=XûJÿ\0çÔ}¡j•ExPí,ÍÁZ 0¢ 4/:²ìü™Ìu¼X×¸Ç¹T‚EÍÖ×v}ïL®Oäe0^´`¸k>¼Ê(HöW/& ©e‰eë)!VƒWØ2û@’øÏİ[	rçaZíYe€Ø¥„héó\r¥Dr¨Ø&O0EXW‡•^\"å¬Ú,z/ÌCgaOÚ0Kv±vÛ– Í˜=ˆî&yŒa¹‹‚‹‹‹†Î£Û±×>·*`ÀP|œÑ©Ê]&áìMµkB²ãØı0CLCWˆ$²œ±f0q§ê¤º!Ó. ¡E#†ÿ\0Dq‹2˜+ûÌOÊ(]¥Ú¹Ìn¢ZPºV_d3ÕHjšèCñ\rå cø*X±cÆ¨³8Ì¡{‚‚h†s\077f3ÌìÔ-/\Z¹e°\"NÓ_˜ù&ÎLšeàl>ÛÌr¬ÍÀ<d\Z[^†C\0 -ÿ\0®T©PQö„İ‚PŒŞÔ„„ğ¥ZRŠêåí\rª3k*SA5!FÂèc¿K«.®¹ÿ\0½UÅf›@ºQ\0İ/İö˜”vÈ§ÁOµÅL6¨ØÓ¹À\"¢\ZÉ×qWj¾b&@[E¡Ëÿ\0jÀ\"²SPRÃ¤lÁEh8+µş\n1—Ë|€õfpÀXÉKÓ UjMó6^ØXXõÈJïX>c¡å™AL@üKÇƒşUz#@µônX/òÏØ–­£T¹Û´ª¸³°Ø·)ËÏÒéKa<Æ</\\ì\\¿ˆÔ4æİzd\0±”ìîª3@,áéóCêdÑÃvKS9 }Ë\'fo5I÷?ƒóÒ¾Šú•õ*^ÓÁaV±˜#AA(‚Qy™’å·OŒÌOóC(\0ö¢dÑ à\0j¾Ò‚‚B¿‹~ğË“–v\rÍüDÓ\rw/l©@Â–â¢™|\\ \r\r¿E}·Ğ”¸iááaŒUm\\«Ë–;aC8Û[…-kˆ	Åüù‚<§íæQ±v&¢R9_æU;<®ŞE>!Z³–¸p’(|ªÅûKä¬´=’Ÿ±#z0Re“ÑèA/=XİüVa:„šF1‹¡Ì,$\'¥ßŞ@:L’üË—‡ÉJékl\r!w„/-Ìj.(¢Ú|@é2°>Í—D\0Ò»ñiPÛ-æ¸{†Ş\0Á¿—DÚÍé\r¦4\n}`Ü@¬5„)ç)j)Ñ²}è¸8G7„ê‡2Ù#Í¯ğ–@qO*ÿ\0DSË>.”r\nÀQú¡©0…J4Ö±Ü*T°×=¾¥tE–=MK“$>Û`‚J„ r~ÕQ@õS ƒàUVùœ1	ÂVlİwS7mwÅiùşÉJÄ©R¥J•èZä.]æƒàÔæ“6/	† a6æ;Ìtº]Õø.;bQğ.IÛy%YY7\0+÷Ïâ.B¬H€ºİß«È…İáJ~èê¬Ë_©\\¨¼Ûg†T\0<¤ˆ£2<0±EÌ©R ÇÛêô|¤C+Ëa¦øê#ŸjŞR\nóqX\\¼]´b]„m–t—ÕM,An½ò>æ<K0FŸˆG\"Àn¸t³v1W®MŞà³=Á°³«¯ˆ–\0#Ã˜Nj›P	mEÕ£$lo?˜à+\rûÙ¤ˆù)–Ìs`Óñ\Z(kªCù€’(‚ÎR@Ü—¡3€_*ıCœhB[éW‚#„ Ğ†T¼Å¡*P¸3ˆ<A0	,\"·öŞÌ¶)İm=’ªÓåR°bŞ ™ñHûâ·Ùò×WpZ©ŠˆØ¼¯Û\0yPò¯õäKN—“í)†6¥ÙrÁØl“<µíÑÿ\0ì	pÕùJk‹¨F”gÁıê[Ç/)šz*!’[Æoêq ¸:¨d…\Z‹¨ë 6pÁê!E¾„~hĞë¢”R]Âpp\ngJPkynß·ğ~RT©R¢WÑĞ€ª»Õ\\”,7²Ööq©^7k¬&ÜÔ¦¾ğ`¾kr¾gš-#€_´µ•ˆêFeì„_#D­O’ş`íJ ·O‹‹[0Pİ–_¸\0Êp7\\Áº—€/p>e«T}.m¦VeDXzÉØ\0ña+2¥AGÛüA,vw2ˆEò^í«¨…\rD•H`ó›ÍKAL•ØæåÑº˜Qî»ÛÜ²9P¾û¹~÷l……·(Èù<²¢ä)­­@.€†Ä.©¨Ü3yoJÜ»ÃI\0”·Ë’8±nü¸¸g`ƒ¹%dŞs”ïÿ\0¨I\\õ.6sg¿Ì°)ë¡*M—?ùH\0İdğcÔ·ˆåÿ\0s8ÄóZÜ»RòÀ-%vqâÑ‚Ú•\nN%-’ı^P\'Gvîì~#T˜*5ïŠ„l•íb:ĞJ]ıÎÏ1Z*-[@|‹¥..SùMŒ[ [Ä5º‡…jnÄ8ñu+,ºı•~9*±õ\ZŸ’ šŠQ¯µY¡€îájÍ7â/JERPæÃöñB– W l† dPİÛü•*T«@Êè9„bD WogST_…ä¹tF’:®Ì”ÄB°	‰Ø­<İÌ;óƒŸ™‘€ëş1©¶Æ[§ú€sP¸-õŒ‚ÛÄc»s\rf(¾EòT2ÑA!}‘‹—š(Ì\0}[\0\0\0<J•*^¥ˆÖèF,Ø(4ìÇŞT¯ £íş)rjT<-@<œÆvOGŠ]\Zë2à\"‘´áí²¼BHÕNeö„v ¦nos^†˜î+&ÄÈøkgqKe¨%¶—úF6µNUæ=›2v>\"¸,YÉ¼6c¬K´õÓv~]£ú3\0ò[pD€íWÄäŒ?ÖˆVàWâTœØZ‚›Ä°œÑPx¸Í”ÀJj\nÎ`êâR<şÑ%	»üË²Y\0©\06±–ˆ³lÛãï\0\0 <@\0\0ƒ€ P¥­_æ$@[:ì_0+¶{k\\\\h!ğ}QPÚ¯d¡h\nË[pâh”Z¾_0Xhi@`ä\0ª$Íµš‰¥×¯Ü«€ v+ıÿ\0ç%J•q‹`}]üBæ^9FÆ÷~ Îïî[¼Ï$W˜­æd¥h…u‚ŞâÁMà”Q~\\p¨Œ4UVÍœè–Í†U®‘\r|ªåˆÂÁYÀJùJ£É]4@9KO¹r†Ú\r®™R¥D6Ta\nùSâ#¤´J‚ªsr¦S¨ìXdŒUaØóğˆñ.\nZ²“S˜Šè±Í\'Ãû%BV,®ëdÅ¡X›Kó(Ifæ»\ZvEø2dáÿ\0ó5(¼—<*×G¹Fè¹råû—.]ÀZ;”h<7Ùú@Õûª×DÅ\ZÑæ\\Ä	¦»Ğ_Ôu¬zCê]Qñ—<G’l—‘Úé×PÒPgz>®É¦ø=ÊÄÖ‚ŞÌ\náF½›åŒA ¦†É5yMúb»{€@Z®­Ê¾ßÁø¥EB‰-ƒ\r@õ¶\0Ê¿{‚’İÅ{–Äm@ò…şc)K›×œ‹Ëî{´£)~ ¨â0¬\09 7î/ª0riğ7ñ‚öLéÁîc3ĞáN\r¿TB[!]¦ÌµÒ¸Vî¶YbÁ˜$L‹vt+ƒF%4^åJıËİB0ûªş\" 7eßpN(bŞ\0pˆfPDÁ—Ãdl¥dR¡tí0‹ÍÈ±tùş$¿´\"³g\0¤4hôÑÈF D3c%-_$h2€r·g›‰FºÃMÖØ˜@ÀÜú\'ˆ\']f¶ìê%ä‹@l¡ùŠ–fÚ¾¥/7Uæ\\Ğ/İÅˆ””e%%õØ=Ä± e¿ˆVö¶nÑSs5\'.1jŞpTj	aRİPµÍK¢ ™LERš•ª£V–b£ÓcV1u©h£ƒÎ5CpàmëÏ×Ğõ´BY`ÃáıÄá:;Ü\0z¯©ºQoÆ –ÉûŠŒ1)gı	zÊ+¨³]Å$qPY ñ¦Ì/Õÿ\0Ÿ…*Tâîo\nåcÀ.y¨1\n±ö•óê(Û^<Æ\0)Fii¿õeHÕcßH2 9dºŒ«ŞÄ}å“…)6‹Í\\©q~Ã›Rajš¡Aµé¯°„ÑÀ6x÷ˆ`­ø³Và…C+Á+3zÍÜr\"‡B»G€Ã`»Z©½µjÁ¡÷\0E˜95ñ*T¯Äğ)U¤6z™PVîòÀ•µ*šiw\0Ö\n*ªµ–¶Æ¸AV…\"²Ì\\Óülh•”»®‹ûB¤¨eèSj¥b7°bEâÜĞş‹gÉïD¢ÀÖ\0öcx¢;@š€w\\Ãç‚¤\rÑàH2‹9-¸®3+!Ü+\n~TÃz«†í44¾H¬1FojÑC\\>â˜…CØ§ÉÂ*â^Ó5ŒJ\0¬«¼ì?R”!P°Àd/}C{J%–8ÏDtœ9$.Š½¸„O¨MX%\0kÄw_Dä¸8›B¾C3Yb9œUmDK­”)Ù~J*Öí¨bàˆ­“«³¨ê@Ğ¤iÍZn˜W6òe”İod¨\"c:|ıP+±`¥ùŒêj‹Cô—vJrSu¼œ;á•@hƒêU‚QÓç¨äÔc™]ŞàìíAuf‚­óÓ¸Stá´)í—e÷™kúŸ\0?¿àËÕ*T©ßIš¶\Zõ\"×	a£*Jtµx†?h‹Ş†-lµ’ößu6“=,‹llM¸-—ï3:Jè/wQ\ZRšÕg’¬Šì ø\n+ê\0èS!É\n‘¨Ûõe¬ó3îC5[A0‘ÈìChÀ¬—™pW@§i\0·›§36\nÎŸz})\\O\nø|-\"·*TJÕNƒ&W†1S’\"¿h\'–ÂÕ”àÚú¬@Pa¥‚¿É1i(=^\0Q\nİcùb.(é‚US×®(B\"TU&*«A®Â4ÕÀ *WpOÊÈ…ƒ90wQ8\0’8‰ˆ£…îV\n\nî8ŞT62Xñ,„a\09ÜÂGJdàÍ‡†gG&-–¶Q{ˆW‘XhP×gİ*!æñÆ‰İZ/ŠnÀ[”D|À0.Ái•ü ¡¬wY¾Å¯I°ö9Ãù˜‚!€s–¾A\0¨­Šik#Ö^F\"ìeò–ÒÇ™Ë‘AJôŠ“0¯Šû\'f‘ğÄhØA[\\™º¡*i•Ü\Z§É²\\cì#Yƒ’†	½Òı‘E¹³Ü;…Xœzôø“ÌÊï«Tìcœ¯Dh•É‚´5Şcğ+˜Y}Fá‡”äEôÄÛ(5µ¸Nædevëø?T©QLÅ‰—LvuÚºœ¬-$A@Ê³)Ùø*òZûÄOš¦ŸÑ]Ì«üš—zŒ„òêÚ¢¢`DrÓ3yd]4c\rbé¨nTß»cäŒhÕ{ÂÆ”œfpDXWaã‡æ3š#àWİR”€à†ÂÓvØ¾sA|t¾Ç€{Âzlõi`iV†~	p§	rT¨Ê\Z7Æˆ%Ï9b\0€ĞÍ\rÛØ^ oì•€ vbyÀú§`D£È—¤B›,©À(Ma6ÒÖêÈ¨X§2¸\\£`/°µÀñHJ\\9ıË£Ah…•\\1™\"(Í_Ş8D\0†] ä»âa¨Jy\nC:”:Y 7‘øaëHÃvÛ<#OšÅB®<aàÌU4»¢)]ÕüÀpR`Ê&Úù¸~È$±ºäd\ná3Ó0IKé8šH””†Ïƒ/b`Ø«½šÌ2Ca½¬#Éü½Q W%ä[PùŒ¤w,ùÄµæóHòóó@Š\rf—\nÀ-±ÉÄvnıÄB\ZÅv¬\0\0?9]2†¨ZŒoÀQ}Íï¡£2ŠZ€yš2„À´88ëA|»8€¶B·–Ñyn\nô‰JÔ+^%J:ªÏ½ë«Ä¥Ê«ÓÌ(!wJÿ\0ùş+Poéø¥}ªup)\Z·ˆá@j\"´ìò\Z¨#Á¥Èºr.¹©÷ŒSXq¨Ê¹¶ö«Ì¥\nAà$YÑuFt˜eP¼ñp4Ä… a€ÏwŒJÜ©å‚:÷#™À;;#èØ ¾²/iZ-\\¼~B+ØTôüC=Û\n·izp‰ĞChƒÔ6Vk¤ú*5­gDø¼ˆÓƒ\rl9+Eä´”(0BöÖæøb÷	CJtGd¨1jhkñ±‘®èVèä[¨AØÒÒ]˜^q\rk¤:iä `BØ›å{óÌ±@¸5µä`r(\rºPnğÔÀoŒÄrüÔAP	B‚¸¢¦RB—¡S´´\rTÛ£™ìéŒ÷PšF	O²ÀU¸JñL%~‚”= 1\Z¿³‰ˆDXü»]AÛÙeBT2o©|Å*e£kÈ/Üa\Z£å1Eb4íªùu‚Š‚pyóÜp/RåWãh‘\0(Ã´œ,°k€²*ğ_ˆ£€?z…Õâ¸H¨b‹×öj¸œ\"ş†”i:%O™¯A£ä{/©^‡\0hê&j-JÅ\Z¼\rËNqfË©Xr0¤!`3L´ ‹9Î\Z-Zï,5ş\" ”°hÏÓw©R¥J•*	{İJ¿ÿ\0`Sf¸¢²Ú=¨Ì©P	Æè¾…5ØA¬Y¾%\Z%şMË’—Â1Çöğ¼ê\nhİÚá¬AÙÍĞäôãæ—_ÀPııà¸6©¡øø{— yAOIOÄJ,•¢‹Y@rÚQÜÊÈ(\"Œb‡$40ÍÙláe£i[+€!ÏFı’ıS\"Úÿ\0%‚Òq¸†™nm“e?xÿ\0\0Èe-ÚWMTdD‚ÕKN‚Àj£\Z%€gV’³Á=*İïYñæ[\0²ù\\ŸjÍÃ42×ØëQ¤[l1\r³ ]Õ<!Ë/+ìz.ÎiW_˜å7!¶¿Ô4õSäïhÈu,!E@®Ó”ñKJ¢l)m›n5­	µ”\r	¼âf¡4‡b·Â)¿¥òW	Åœ†%§šU@ë@x”ÏíæLdf‡5Ô@4Bïˆæ°B‘´·.êdËrÀ„Ñ¿Ó	¢]1‚Ü}ª’Æ·X­]ßrëxú4ºG­&9¤l\"Ég¶\"Š$5À]lY!Ìš\r\rÏ1û¶¨Vù\Z :5°¤]¯>åÜQTÈˆÿ\0ƒ.ßwmy5’‚ŠPij\rÅvs±¾†jîÖ¡¿@üÃf—`\'c(•*T©R¥J•*T?ê;J)%Ë\\ªzUzˆF°P|SyÍ…ù–\ZLß^ez+m+Š?$g¨·±?Ôtà÷$É~+º`Ånaxƒãó\rXˆ\ZC;0â£æ‘)yDÙ’¯¤¶£)ÍœÇ%CÈV£ıñ¸Di„nÈ±7f;XaˆúhRâ+G€‹á.YğKhóü¶”í\rI“z¸Hñ¤fİˆ_\n‰³\\y¨4Š¢µQ6-CbÓİ\0/˜€A@ÀT\r/àMcf-+³·©€%dİ+ò|Fa4˜H¯„üKíV¯Ëé``Àª‰\0¯\nÌrU*’Pì\\¥h„ıyîÕ\nÃÄ°eAvñ[yÔP…vBlÌ¹¶1S„F#}œà’7!ÉØ––G	N¯xğ)=Ä¬!¡òñ CVƒ«db%NxË´½<•VÖÏºÖ.RĞ€¿WJs]]Ä>Û#dËíö1˜”Ã}Ç/ÅfWcuñ,ñMWo8å®!\0å¢ØóÔ-‚KAÛV·D~\n²™ÈŞ­\"8‚Ë¡°®!ôö/Rƒ³’9B¨8\Z.\0«‘Bóh=ñ©ùz@¾9ç“D	¹;Wñr¶‹™ \r##ìê1\\wn\"éÜƒ€¢T©R¥J•*T©R¥x†©±¿–OlR€MšöPíe2—ÇŸ[°1¦ö´²\0ÌÚí5-%¹H ĞİüSióT\\6Ş_I\ZWvÔZ‚òÖ\"Ô¡«€²÷Q\0Aw4]åÁ\Z2	Iµ{à·róÁ\\ÛAG¹XË—1[‘â!”Ü\0_a¸!†ÄRYuü Kpf„åï7*i¡S ±ÄT¢»D²4ÚØÜ(ê€­ÛÎà¼Yş¢PB€WÉà¤5TQY}”;9å\'0[Êa&‰\Z‚€Rb1Ù]R¥ñ¨¢Ö€Á‹\rÕ‰ôJÁ€X\\ªr¶¯˜š¤bnâ‚óòÛ\ZÔ™Q^bœLÎ\0mæZ6\n‚œw,J+\\ ›)Ğ@òs\r@ñ­i;KsİEPaıÁŒ¬sÃµø5\0€ºpĞ;7§(@§b€üChı„äKlFd¦IÔXw}Ôµ¬	”+<@—ñ+ •\Z\0*ê$Ó•14<ÔH…°ÓŒ±bB¦Ê‡e‰\\>b¯ÚÆèdjİêÆm¨Îp0 ´À¬  8\ZK…ı•Ò•Ğ´µb‹V£²XÑâŠà?¸S«mˆ]Ê„\"6h¶¼Ê€š;`¡\n…(|Ç9\\(ØUAy·˜ÏÑR¥J•*T\'0Â$OK´Êî’‡Î&”Ş\0pŸ7˜Fı@ôjù\ZnğØBˆ6H@	Àƒ¸ˆ£€§>SvààT*¶Üà~Á®e9hìZê%‚\0iÀÃÕ´=Â¹–J«2çMnñaX›ªdûÊ†ZÇéV)M‡cïQ…^çÁ~¿0Át³¼ÿ\0Ğ+(E˜Ñgíˆ,à²>èb²ïä½[À*Ú§E®!È©\nšŞ2´D‘â€ºS3˜µĞ¢Û÷„É¢«/¤tv¸	S\0¢zvAChÜD-°Pt³­±95ŞB®;³ÅJP©£”¸U°BKêÍ{•F%Ÿa¼´ˆšÑ@¢\\JÄt–)¤%ìSÊöK.•ÅmMá{Í@c%+ÖXuÔQ„\0J Ë€2 Å!Í–µ•åOL#,¢Áğ• Šşı”[Ï–@nôçÌæÂ@¥rC“!¡-v¾`:Y¹ˆ,é’ß	ÔÒ°Êœ»8wm?0BÔ²&\rßKM”6Û£E˜­¿¹ƒ°HÅ²2¾Tx6IpokbcMTEe·Õ[m³ºÑf-?aMÄÄ¸óU%4«WÌØIş˜ÕmA~ßJ…Õ	 Ñíƒ¦UªŠ\ršŞ }/bĞ1²c2K\rº,ÚÈº8ëçd\\Ú»ú	•Â.°œ1üi  @«®qA˜(BÇK‡ğ-D\ZÁm<2‰´RdŞu4C€O)‡™mäƒ‘é\"Â¢˜äS¥Ÿ$ºQ-JNAgda±C–z{\0Ñˆ‰eP~fM¨y”4«\ršª(0t¡Š§lÛ€DtØFÂ©PÍäVı/˜#ŒŞ0\\•¢90X˜9cÃO\rØ¦êe®’í%,»IMG»/Äf¦¨\n`µâ¢ñË»6ë˜[ô¾\rüÆSHˆ•í¶Zò+\0¶uĞxàd\0áà§ÙÌD1Ej)æ¡ÀD0-uÖªõ0Å¸&\0ıËVáº@}Ö&¢f‘¤êø}Ç\"1.˜AïñæP>„:¶½	«æ@€ÕÓË“,æïÄ\'B×~Ã³!`ÿ\0º	kÀŠğªœo$\\4•ÉtÅ`¢(Q¸Zm©Ş¢¥é4Sf“Í1Ó%/	œû™«¸]…e…²ÎFLIdyLATÃ«â÷”İYS¬-øuÜ#Ais„)#PBˆˆ€Ï‰kru‰‘;ƒiê Á÷;hG‰ã¦#5[k‚‚`*>¢-kÉ ğ&:”¦—oÌI\n¼#Ÿ†Ÿ@üQd ,D´Òf»I6è‚ìÃOeój\r»ƒAY\0Š¥¨sWX}\0áŠ…PáJÓ¦>Æ™¨`›øÔÒìÁ\n{ºŠEj´©â°áƒárÉÒ€rÂ@áet!“MoUÍt8k5Yù…¢™l\rù¸4f\\Ë¢ùÛ&!e³ÚNqí#†bë4Ö3™H4 ƒ•:†±¤°––ÎM9µåŒù\rÅ-KG ç2“>Úë¥„ó®ãt`YI[à—g6ÌtVHq¬WmNV`s.\\Å¼Ìõv7\\b:¡]“y²% Î`<ÒÔ\0@º©ßñ¥Å¡:…eçv,`_^¬|P÷Ö\nü½—â+@Ù®¢½·aØò{Î¯5ˆ™àœÄd´¨ÿ\0 ­©m\'Ş\\,¡EÕvÀ!`Æã´ËúÌªD¤¤¯€²Ô§	ázÅ}¡[hAƒ ñ6¦\'ûÇ%ª¢Á“++İxˆ*)Òv!}á.ÑM¯o;^×0¬Wº|nQ•WE‚üNh&ZÁ\'ƒ/™©ĞÍ(eûËü4¯<îTëøóKÖn(mKã¼%¿(Î	JU8ì%¹ìÉÍÁtëy±\Z€6–ÖH÷Jj“Î)N‚ÂÀ\r&š¾J•İmämİ±âPÍ×É.G’ÆU Î^S­\"…\n¤:jüJ!ü‹ .¸h>ª…ÀˆˆìqÄ5€\0_Z•*U}jZaKÕÙ/Ó\\(a}\rÍrÉ Ú%ŞÏ!v1¾ˆÍ.hh}°õô¹rİƒA˜¸A¯‰—\n›ÇPù)iZ>•G]Ç=‚°—»D)\rSB¶1¾%!%¹İÖPìXmŸHÂåT¥­0¾§\'h8±>Â,\r–€–²`ûwMJ´U¸yĞ˜@µ7A¹Õö˜€\\©ÀÚS4K(6*Ò£Š‹0B’\nÇo™_1•Ï¸­ÌVÂè½EV­ ø	û™pE„·ÅÂ¸\"\rˆİ°	xJŞò«Xm€\0pàZú¯+@9œ2z4Xt¡¯0L 5»b{cæ?R(ä„è‚Ù3^w\r##jûW—©Ÿ-¨\\üG²åã¢/ö_¡¨ºa%TäI[\nVšM–Æ\Z|ùfTß\nBšJ#È@¼«™C{µ…ÉåºÏ¡£ª€l``æ÷q”¥¦€¯ƒRÖ 8Bû‚aŠİÖÕ}¥ÌqS¥€Óœ×¤!P‚Ğø7P§©úœ[²Y¨¹8Å^*,òÂ18ª¡¼ô, ]/L6Ó:®y©/ÎiõÀ…°<@U)ce«ƒk•°İÅíÆ NÊ—&2°|˜›òœ|M\'ÈäQ\0²±¦Æq“qF\0¤å‹®(°E@İÚ^eßò©¨½$ ƒ`šNH‡/!¾ú@8€×Ú1D·#qÔ[\0ÊÔ!z¯&ëK«1dJfõÄ¤¦¶²ùÁûÀÈôMb›h+Ë]6•NÏ4/:o°°í\"RCò1ÉJ¬©xê2 gÓW/˜h	\r#¡Fº #…Ä8Yİ_1˜àÜ&Â€ªó›¡ip-r¼ÊG0J!—Ô@REĞˆ?zK¤\0’`Ä1E™¯0ÑçB®÷P!dSÀĞÕh_´£·Tåˆ±Ê½ÿ\0\nà\"*Œ°¾\rSë?1gp):+â06—e±Ø]-Ü¬RÄĞbÕñ™„¡+Æ_¶àÈ;~è2§6áÓaeí‚è‹Ñ§w6\rTæÃ/v¬À ²‡…Lª«FaFÑÓû@bv­†Ç5ãQ©WVÛ\'×QíZQt÷\0E˜FQĞ¦Üäã0oFË>ÑM¼Y­^ùsä$K%#eÑ]f ÓÌ e;ÎÜ™˜H‘4¬;æq„¡Ó¾ÂÂÆŠ–§mÕ‰z2°îŠ‹JãK [nşÊ6Ï2ˆ¸Z q­6ÔUp²Œ\\Õã¯,kkCtP/\0¨iÂ¨ØpàÁÄr¯,VûzkÔZ„¡bV‹Ë~c&ClÆ×KsZX‚¯M¸#ŠŒ).Ğ0Ş$Q\ZBÙ<Â	‚ZòÖ€Æğ\Z‰h–°WŞÑ¾&°ËzùŠrjV0/[şSQ‚7T)(¢Q #g\n&l¢ŸhÂôÛ%ùÔPo;+¸GL}ƒ`šhß#RÊ*‹€°¦i®c={9+´å›n2dÂEÒŠÆô\r«´å6 04¦¾]À¢`°ØÍ&Î!0^`…	Å*Xd¹P`ùc—ÀiA[®.\n„v‚*|\r6¢şĞ¶&Ä‚ÚÂ\04*Ü€¤îTsN yÄM€‡RUç	rØ³Ååú².‘`r,ßÎªå‚Âæ‰Ä& ¢©8&*â›ª|Â¹ê¥@4Sf±IeYäƒœÉ”V§;f³ˆE7CóÙ“M‰ßÄ} ¥´DÖ(Û\rà»\0kŸ!aË(‚š7Àk–˜D÷Vö¼çÄ5e¬5ÁJ9*T“Wd”óˆÀÀUÖ{eæuä/ íŒB*µ¤1z¨j0† á€Ñr¦*FğÒëÔ@0„? y[‘Ú»¨™\nXÒ˜Sbzf¯P\n†âgÄ¾„ÀqJ¦ïdOÁT8Bn¸X!ÀkkèŒèHB„T1hQËDH—À\Z¼CÁîƒ¢ (ØcÅ°Qk÷–H~ÏpHSIMZyÌ¹ËºGÒÌ\n\"@`\n’\Z\0€à€¼1uŸª_Ò±Oòßæ„ÙA¼Ëğ…Ü]só1ÉĞâ4\0¿¼´æf\"Ñ.Ësˆˆ>¨u[¾%:Y®*®„¸wE¢@*~ut]fâL	6\\üÂîH£¹s&á® ·Ék†QH¡¯pÇ0¶R‡4aº»©]˜ëÇ‰n,&=ÈÛ\0?´®Ë¨`Ô*\røfÙGæÄC×‰H#[\n(ºã7€ÉÁåZ·KÔ±\0’¾â\Zè%dº‹¬ù¨Ì³œÙŞÃÄ\ZüY˜ˆÒVNw1rñ¥<Œ¯+*ğ«!fÆ¬Uh‚*\0\0<\Z\r¥vËg¨ 01Ğñ\0\nª#øa…âà<1èÁ’4ùCò%è{ÓÉC6†°(¢ôWæXÜmKùi©W.\nßØS¶\0FX£ı‰ÖM0Ç2J£NÈÀ:t˜=‘Ìé›Ãİš0‘ª!áMŸ1á>»Õå\r\0ˆÜYM:Ô;Ş\08ÿ\0i 	ÅfØgÌÀPĞÑ•m!Uå‹a’ğWRÈ^Æá{¡Ö¬(»\rØÂŒoq¦‰-\ZîfE÷¬å ²æs\0Òä,gÍ@Ü\0;øaÖ?°§ó,2‡\")ñ5bö¶êI E·…}æN`†@qÔ6z]Ÿ¸vAğéûÀ\nRPÀğ!÷ŠFbJ÷28!i\Z‘P\0fŞVö l³0šmIt s¹…Ò†,Ó•›n¯2ûìfyä”FÄ.‹0x9õ4T ¨´½mÿ\0É—ú@Gÿ\0ÊcÜÈÑ‘Ä•eœÔ¥Kêç‚Zë	yy‰I ªÙ&tp¥0Ùì`\Z§•.ÜÁ TjX\Z.âªåP\n°ÍV!²ÅTmt÷3h§Ñ\Z©,ÄT6ª–È»-<661c²Çö€V*M÷VÆ\ZQVE†mW˜Áà \nøJ,-°Âı¢ÁªGyÍÀì’t£bR‰ÌñÊåhê ­ ƒ*e†Ğ(yºÛç1uğ< ¼¸\Z½2\rn²Söjê\'dIvh!d¾oÿ\0ğ¥ÊÛhÛ*	4`j˜²¯˜\Z\0`ĞEMc\09V\"=#Ø*`½\0_–}@LÛ>Çï¹ÀùEËÿ\0f:W0‡ÿ\0€ñ	 Tq:—¸±Pbd¾UòB+ejÄ T2º1€\0\rZ­{kˆ”6ˆ–¢\n\0\n\0¢º•\náV“I@Ğ\Z&£IDA±)Ü¦†tP+ÿ\0ğÕô¬ßÖ¦^¥©Oqr˜”(°è`Wÿ\0÷ÿÙ');
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
