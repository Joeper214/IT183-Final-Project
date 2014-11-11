-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 08, 2014 at 01:25 PM
-- Server version: 5.5.36
-- PHP Version: 5.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `backup_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `backup_databases`
--

CREATE TABLE IF NOT EXISTS `backup_databases` (
  `db_id` int(11) NOT NULL AUTO_INCREMENT,
  `db_name` varchar(25) NOT NULL,
  `date_restored` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `runtime` varchar(10) NOT NULL,
  `db_type` tinyint(2) NOT NULL,
  PRIMARY KEY (`db_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `backup_databases`
--

INSERT INTO `backup_databases` (`db_id`, `db_name`, `date_restored`, `runtime`, `db_type`) VALUES
(2, 'animalcare', '2014-09-07 00:10:41', '0.5812', 1),
(7, 'aaaa', '2014-09-07 00:35:40', '0.5271', 0),
(8, 'moco', '2014-09-07 00:48:31', '3.9562', 1),
(9, 'Moconew', '2014-09-07 00:52:47', '2.6645', 1),
(10, 'sales_backup', '2014-09-07 01:00:46', '1.2069', 0);

-- --------------------------------------------------------

--
-- Table structure for table `backup_files`
--

CREATE TABLE IF NOT EXISTS `backup_files` (
  `backup_id` int(11) NOT NULL AUTO_INCREMENT,
  `file` varchar(45) NOT NULL,
  `db_name` varchar(45) NOT NULL,
  `backup_type` varchar(10) NOT NULL,
  `tb_name` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`backup_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=65 ;

--
-- Dumping data for table `backup_files`
--

INSERT INTO `backup_files` (`backup_id`, `file`, `db_name`, `backup_type`, `tb_name`) VALUES
(59, 'sales_bk.sql', 'salesdb', 'Database', NULL),
(60, 'MocoBack.sql', 'moco', 'Database', NULL),
(61, '[removed]alert&#40;''bleeh!''&#41;[removed].sql', 'backup_db', 'Database', NULL),
(62, 'tol.sql', 'moco', 'Database', NULL),
(63, 'Watever.sql', 'websites', 'Database', NULL),
(64, 'animalcare.sql', 'animalcare', 'Database', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`) VALUES
(1, 'Jofel', 'bayron'),
(2, 'Albert', 'ocampo'),
(3, 'Kiven', 'suprimo'),
(4, 'joefel', 'chula'),
(5, 'joeper', 'serrano');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
