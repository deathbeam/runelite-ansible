-- MySQL dump 10.16  Distrib 10.2.16-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: runelite-cache2
-- ------------------------------------------------------
-- Server version	10.2.16-MariaDB-1:10.2.16+maria~bionic

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
-- Current Database: `runelite-cache2`
--


USE `runelite-cache2`;

--
-- Table structure for table `archive`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `archive` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `archiveId` int(11) NOT NULL,
  `nameHash` int(11) NOT NULL,
  `crc` int(11) NOT NULL,
  `revision` int(11) NOT NULL,
  `hash` binary(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `archive_revision` (`archiveId`,`revision`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=58216 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cache`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `cache` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `revision` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `revision_date` (`revision`,`date`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `file`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `archive` int(11) NOT NULL,
  `fileId` int(11) NOT NULL,
  `nameHash` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `archive_file` (`archive`,`fileId`),
  CONSTRAINT `file_ibfk_1` FOREIGN KEY (`archive`) REFERENCES `archive` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=292779 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `index`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `index` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cache` int(11) NOT NULL,
  `indexId` int(11) NOT NULL,
  `crc` int(11) NOT NULL,
  `revision` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `indexId` (`cache`,`indexId`,`revision`,`crc`) USING BTREE,
  CONSTRAINT `index_ibfk_1` FOREIGN KEY (`cache`) REFERENCES `cache` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `index_archive`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `index_archive` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `index` int(11) NOT NULL,
  `archive` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_index_archive` (`index`,`archive`) USING BTREE,
  KEY `archive` (`archive`) USING BTREE,
  CONSTRAINT `index_archive_ibfk_1` FOREIGN KEY (`index`) REFERENCES `index` (`id`),
  CONSTRAINT `index_archive_ibfk_2` FOREIGN KEY (`archive`) REFERENCES `archive` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58216 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-16 13:29:53
