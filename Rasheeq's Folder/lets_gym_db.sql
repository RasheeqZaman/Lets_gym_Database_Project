-- MySQL dump 10.13  Distrib 5.7.14, for Win64 (x86_64)
--
-- Host: localhost    Database: lets_gym_db
-- ------------------------------------------------------
-- Server version	5.7.14

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
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branch` (
  `b_id` int(11) NOT NULL,
  `b_name` varchar(40) DEFAULT NULL,
  `b_city` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`b_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_name` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `phone_no` varchar(11) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Rasheeq Zaman','Dhaka','01734455817','zamanrshq@gmail.com'),(2,'Nahid Pranto','Dhaka','01536262657','nahidpranto@gmail.com'),(3,'Afrina Zahan Mithila','Khulna','01981959534','mithila@gmail.com');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipments`
--

DROP TABLE IF EXISTS `equipments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipments` (
  `Equip_id` int(11) NOT NULL,
  `Equip_name` varchar(50) DEFAULT NULL,
  `Equip_type` varchar(50) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `cost` decimal(8,3) DEFAULT NULL,
  PRIMARY KEY (`Equip_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipments`
--

LOCK TABLES `equipments` WRITE;
/*!40000 ALTER TABLE `equipments` DISABLE KEYS */;
/*!40000 ALTER TABLE `equipments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membership`
--

DROP TABLE IF EXISTS `membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `membership` (
  `m_id` int(11) NOT NULL AUTO_INCREMENT,
  `m_name` varchar(50) DEFAULT NULL,
  `m_period` int(3) DEFAULT NULL,
  `m_fee` int(7) DEFAULT NULL,
  PRIMARY KEY (`m_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membership`
--

LOCK TABLES `membership` WRITE;
/*!40000 ALTER TABLE `membership` DISABLE KEYS */;
INSERT INTO `membership` VALUES (1,'Platimum',360,30000),(2,'Gold',180,18000),(3,'Silver',90,10000),(4,'Corporate',90,9000),(5,'Student',60,5000);
/*!40000 ALTER TABLE `membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owns`
--

DROP TABLE IF EXISTS `owns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `owns` (
  `c_id` int(11) NOT NULL,
  `m_id` int(11) NOT NULL,
  `creat_date` date DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `status` char(5) DEFAULT NULL,
  PRIMARY KEY (`c_id`,`m_id`),
  KEY `m_id` (`m_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owns`
--

LOCK TABLES `owns` WRITE;
/*!40000 ALTER TABLE `owns` DISABLE KEYS */;
/*!40000 ALTER TABLE `owns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rents`
--

DROP TABLE IF EXISTS `rents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rents` (
  `c_id` int(11) NOT NULL,
  `equip_id` int(11) NOT NULL,
  `checkout_date` date DEFAULT NULL,
  PRIMARY KEY (`c_id`,`equip_id`),
  KEY `equip_id` (`equip_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rents`
--

LOCK TABLES `rents` WRITE;
/*!40000 ALTER TABLE `rents` DISABLE KEYS */;
/*!40000 ALTER TABLE `rents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workout_group_list`
--

DROP TABLE IF EXISTS `workout_group_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workout_group_list` (
  `g_id` int(11) NOT NULL AUTO_INCREMENT,
  `g_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`g_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workout_group_list`
--

LOCK TABLES `workout_group_list` WRITE;
/*!40000 ALTER TABLE `workout_group_list` DISABLE KEYS */;
INSERT INTO `workout_group_list` VALUES (1,'Weight Loss'),(2,'Weight Gain'),(3,'Body Building'),(4,'General Training'),(5,'Fitness');
/*!40000 ALTER TABLE `workout_group_list` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-06 18:33:55
