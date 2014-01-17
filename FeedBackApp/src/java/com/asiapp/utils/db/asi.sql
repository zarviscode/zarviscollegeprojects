-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.1.73-community - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             8.2.0.4675
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for feedback_db
DROP DATABASE IF EXISTS `feedback_db`;
CREATE DATABASE IF NOT EXISTS `feedback_db` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `feedback_db`;


-- Dumping structure for table asi_db.appuser
DROP TABLE IF EXISTS `appuser`;
CREATE TABLE IF NOT EXISTS `appuser` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `guid` varchar(255) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `question` varchar(255) DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `userrole` varchar(255) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `createdby` int(10) DEFAULT NULL,
  `modifiedon` datetime DEFAULT NULL,
  `modifiedby` int(10) DEFAULT NULL,
  `active` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table asi_db.appuser: ~1 rows (approximately)
/*!40000 ALTER TABLE `appuser` DISABLE KEYS */;
INSERT INTO `appuser` (`id`, `guid`, `username`, `password`, `question`, `answer`, `userrole`, `createdon`, `createdby`, `modifiedon`, `modifiedby`, `active`) VALUES
	(1, '1f09aefe-545c-438d-a72d-a1232bf54ecb', 'admin', 'admin', 'What is your pet name ?', 'sunny', 'admin', '2013-03-03 16:16:32', 1, '2013-03-03 16:16:32', 1, 1);
/*!40000 ALTER TABLE `appuser` ENABLE KEYS */;


-- Dumping structure for table asi_db.department
DROP TABLE IF EXISTS `department`;
CREATE TABLE IF NOT EXISTS `department` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `guid` varchar(255) NOT NULL,
  `deptname` varchar(255) DEFAULT NULL,
  `deptcode` varchar(255) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `createdby` int(10) DEFAULT NULL,
  `modifiedon` datetime DEFAULT NULL,
  `modifiedby` int(10) DEFAULT NULL,
  `active` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;




-- Dumping structure for table asi_db.faculty
DROP TABLE IF EXISTS `faculty`;
CREATE TABLE IF NOT EXISTS `faculty` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `guid` varchar(255) NOT NULL,
  `facultyName` varchar(255) DEFAULT NULL,
  `departmentName` varchar(255) DEFAULT NULL,
  `departmentCode` varchar(50) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `createdby` int(10) DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `modifiedby` int(10) DEFAULT NULL,
  `active` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table asi_db.faculty: ~0 rows (approximately)
/*!40000 ALTER TABLE `faculty` DISABLE KEYS */;
/*!40000 ALTER TABLE `faculty` ENABLE KEYS */;


-- Dumping structure for table asi_db.facultymap
DROP TABLE IF EXISTS `facultymap`;
CREATE TABLE IF NOT EXISTS `facultymap` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `guid` varchar(255) NOT NULL,
  `subjectName` varchar(255) DEFAULT NULL,
  `subjectCode` varchar(255) DEFAULT NULL,
  `departmentName` varchar(255) DEFAULT NULL,
  `departmentCode` varchar(50) DEFAULT NULL,
  `year` varchar(255) DEFAULT NULL,
  `semister` varchar(255) DEFAULT NULL,
  `facultyname` varchar(255) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `createdby` int(10) DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `modifiedby` int(10) DEFAULT NULL,
  `active` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table asi_db.facultymap: ~0 rows (approximately)
/*!40000 ALTER TABLE `facultymap` DISABLE KEYS */;
/*!40000 ALTER TABLE `facultymap` ENABLE KEYS */;


-- Dumping structure for table asi_db.feedback
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE IF NOT EXISTS `feedback` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `guid` varchar(255) NOT NULL,
  `subjectName` varchar(255) DEFAULT NULL,
  `subjectCode` varchar(255) DEFAULT NULL,
  `departmentName` varchar(255) DEFAULT NULL,
  `departmentCode` varchar(50) DEFAULT NULL,
  `year` varchar(255) DEFAULT NULL,
  `semister` varchar(255) DEFAULT NULL,
  `studentId` varchar(255) DEFAULT NULL,
  `facultyName` varchar(255) DEFAULT NULL,
  `feedBackTotal` varchar(255) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `createdby` int(10) DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `modifiedby` int(10) DEFAULT NULL,
  `active` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table asi_db.feedback: ~0 rows (approximately)
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;


-- Dumping structure for table asi_db.student
DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `guid` varchar(255) NOT NULL,
  `subjectName` varchar(255) DEFAULT NULL,
  `subjectCode` varchar(255) DEFAULT NULL,
  `departmentName` varchar(255) DEFAULT NULL,
  `departmentCode` varchar(50) DEFAULT NULL,
  `year` varchar(255) DEFAULT NULL,
  `semister` varchar(255) DEFAULT NULL,
  `studentId` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `createdby` int(10) DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `modifiedby` int(10) DEFAULT NULL,
  `active` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table asi_db.student: ~0 rows (approximately)
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
/*!40000 ALTER TABLE `student` ENABLE KEYS */;


-- Dumping structure for table asi_db.subject
DROP TABLE IF EXISTS `subject`;
CREATE TABLE IF NOT EXISTS `subject` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `guid` varchar(255) NOT NULL,
  `subjectName` varchar(255) DEFAULT NULL,
  `subjectCode` varchar(255) DEFAULT NULL,
  `departmentName` varchar(255) DEFAULT NULL,
  `departmentCode` varchar(50) DEFAULT NULL,
  `year` varchar(255) DEFAULT NULL,
  `semister` varchar(255) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `createdby` int(10) DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `modifiedby` int(10) DEFAULT NULL,
  `active` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;


/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
