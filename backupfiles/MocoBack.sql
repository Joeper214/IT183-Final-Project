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
INSERT INTO `ass_submission` VALUES (1,1,'AssemblyMachineProblem.docx','2014-08-31',0,1,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignment`
--

LOCK TABLES `assignment` WRITE;
/*!40000 ALTER TABLE `assignment` DISABLE KEYS */;
INSERT INTO `assignment` VALUES (1,2,'<p>Sdsa</p>','','2014-09-01','2014-08-31','Sample 1');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `identification`
--

LOCK TABLES `identification` WRITE;
/*!40000 ALTER TABLE `identification` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpchoice`
--

LOCK TABLES `mpchoice` WRITE;
/*!40000 ALTER TABLE `mpchoice` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_f`
--

LOCK TABLES `mt_f` WRITE;
/*!40000 ALTER TABLE `mt_f` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stud_ident_ans`
--

LOCK TABLES `stud_ident_ans` WRITE;
/*!40000 ALTER TABLE `stud_ident_ans` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stud_mpc_ans`
--

LOCK TABLES `stud_mpc_ans` WRITE;
/*!40000 ALTER TABLE `stud_mpc_ans` DISABLE KEYS */;
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stud_mtf_ans`
--

LOCK TABLES `stud_mtf_ans` WRITE;
/*!40000 ALTER TABLE `stud_mtf_ans` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stud_tf_ans`
--

LOCK TABLES `stud_tf_ans` WRITE;
/*!40000 ALTER TABLE `stud_tf_ans` DISABLE KEYS */;
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
INSERT INTO `studentaccounts` VALUES (1048064,'352415',365,'0000-00-00 00:00:00'),(1058167,'126063',365,'0000-00-00 00:00:00'),(1059897,'825542',365,'0000-00-00 00:00:00');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentcourserecord`
--

LOCK TABLES `studentcourserecord` WRITE;
/*!40000 ALTER TABLE `studentcourserecord` DISABLE KEYS */;
INSERT INTO `studentcourserecord` VALUES (1,1058167,2,'2014-08-30');
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
INSERT INTO `students` VALUES (1048064,'Zenny','Becina','DELA CRUZ','BS Information Technology (Database Systems)','Female','[BINARY]'),(1058167,'Joeper','Pantaleon','SERRANO','BS Information Technology (Database Systems)','Male','[BINARY]'),(1059897,'Jofel','B','BAYRON','BS Information Technology (Database Systems)','Male','[BINARY]');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studenttestrec`
--

LOCK TABLES `studenttestrec` WRITE;
/*!40000 ALTER TABLE `studenttestrec` DISABLE KEYS */;
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
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_f`
--

LOCK TABLES `t_f` WRITE;
/*!40000 ALTER TABLE `t_f` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
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

-- Dump completed on 2014-08-31 22:45:15
