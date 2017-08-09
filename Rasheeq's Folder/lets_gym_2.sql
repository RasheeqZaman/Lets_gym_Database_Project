-- MySQL dump 10.13  Distrib 5.7.14, for Win64 (x86_64)
--
-- Host: localhost    Database: lets_gym_database
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
-- Table structure for table `all_equipments`
--

DROP TABLE IF EXISTS `all_equipments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `all_equipments` (
  `Equip_id` int(11) NOT NULL AUTO_INCREMENT,
  `Equip_name` varchar(50) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`Equip_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `all_equipments`
--

LOCK TABLES `all_equipments` WRITE;
/*!40000 ALTER TABLE `all_equipments` DISABLE KEYS */;
INSERT INTO `all_equipments` VALUES (1,'Dumb Bells (3kg)',1000,10),(2,'Barbells',2500,8),(3,'Bench Press',10000,5);
/*!40000 ALTER TABLE `all_equipments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branch` (
  `b_id` int(11) NOT NULL AUTO_INCREMENT,
  `b_name` varchar(40) DEFAULT NULL,
  `b_city` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`b_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES (1,'Tejgaon Branch','Dhaka'),(2,'Dhanmondi Branch','Dhaka'),(3,'KUET Branch','Khulna');
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class` (
  `class_id` int(11) NOT NULL,
  `workout_group_list_id` int(11) DEFAULT NULL,
  `schedule_id` int(11) DEFAULT NULL,
  `room_id` int(11) NOT NULL,
  PRIMARY KEY (`class_id`),
  KEY `g_id` (`workout_group_list_id`),
  KEY `shed_id` (`schedule_id`),
  KEY `room_id` (`room_id`),
  CONSTRAINT `class_ibfk_1` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`s_id`),
  CONSTRAINT `class_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`),
  CONSTRAINT `class_ibfk_3` FOREIGN KEY (`workout_group_list_id`) REFERENCES `workout_group_list` (`g_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` VALUES (1,1,2,1),(2,3,1,3),(3,2,3,2),(4,3,2,4),(5,2,5,2);
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Rasheeq Zaman','Dhaka','01734455817','zamanrshq@gmail.com'),(2,'Nahid Pranto','Dhaka','01536262657','nahidpranto@gmail.com'),(3,'Afrina Zahan Mithila','Khulna','01981959534','mithila@gmail.com'),(4,'Amir Hamza','Barishal','01512161756','ahamza@gmail.com'),(5,'Masud Rana','Sylhet','01617312132','masud@gmail.com'),(6,'Hasib Ahmed','Chadpur','01913423923','hahmed@gmail.com'),(7,'Fahim Ahsan Khan','Khulna','01713434523','faahkhan@yahoo.com');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_attends_class`
--

DROP TABLE IF EXISTS `customer_attends_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_attends_class` (
  `customer_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `attents_date` date NOT NULL,
  PRIMARY KEY (`customer_id`,`class_id`,`attents_date`),
  KEY `class_id` (`class_id`),
  CONSTRAINT `customer_attends_class_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`c_id`),
  CONSTRAINT `customer_attends_class_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_attends_class`
--

LOCK TABLES `customer_attends_class` WRITE;
/*!40000 ALTER TABLE `customer_attends_class` DISABLE KEYS */;
INSERT INTO `customer_attends_class` VALUES (1,1,'2017-08-08'),(3,1,'2017-08-08'),(1,2,'2017-08-08'),(2,2,'2017-08-08');
/*!40000 ALTER TABLE `customer_attends_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_owns_membership`
--

DROP TABLE IF EXISTS `customer_owns_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_owns_membership` (
  `com_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `membership_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  PRIMARY KEY (`customer_id`,`membership_id`,`start_date`),
  KEY `customer_id` (`customer_id`),
  KEY `membership_id` (`membership_id`),
  KEY `com_id` (`com_id`),
  CONSTRAINT `customer_owns_membership_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`c_id`),
  CONSTRAINT `customer_owns_membership_ibfk_2` FOREIGN KEY (`membership_id`) REFERENCES `membership` (`m_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_owns_membership`
--

LOCK TABLES `customer_owns_membership` WRITE;
/*!40000 ALTER TABLE `customer_owns_membership` DISABLE KEYS */;
INSERT INTO `customer_owns_membership` VALUES (1,1,2,'2017-02-09'),(2,1,3,'2017-05-01'),(3,1,3,'2017-08-05'),(4,2,1,'2017-08-12'),(5,3,5,'2017-08-07'),(6,6,1,'2017-08-01'),(7,7,3,'2017-08-01');
/*!40000 ALTER TABLE `customer_owns_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_pays_membership`
--

DROP TABLE IF EXISTS `customer_pays_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_pays_membership` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  `owns_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `payment_date` date NOT NULL,
  PRIMARY KEY (`p_id`),
  KEY `p_id` (`p_id`),
  KEY `owns_id` (`owns_id`),
  CONSTRAINT `customer_pays_membership_ibfk_1` FOREIGN KEY (`owns_id`) REFERENCES `customer_owns_membership` (`com_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_pays_membership`
--

LOCK TABLES `customer_pays_membership` WRITE;
/*!40000 ALTER TABLE `customer_pays_membership` DISABLE KEYS */;
INSERT INTO `customer_pays_membership` VALUES (1,2,1000,'2017-08-01'),(2,2,500,'2017-08-11'),(3,4,500,'2017-08-03'),(4,5,300,'2017-07-01'),(5,6,200,'2017-08-01'),(6,6,800,'2017-07-09');
/*!40000 ALTER TABLE `customer_pays_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_rents_equipments`
--

DROP TABLE IF EXISTS `customer_rents_equipments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_rents_equipments` (
  `r_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `equipment_id` int(11) NOT NULL,
  `renting_date` date DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  PRIMARY KEY (`r_id`),
  KEY `equip_id` (`equipment_id`),
  KEY `c_id` (`customer_id`),
  CONSTRAINT `customer_rents_equipments_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`c_id`),
  CONSTRAINT `customer_rents_equipments_ibfk_2` FOREIGN KEY (`equipment_id`) REFERENCES `rentable_equipments` (`all_equip_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_rents_equipments`
--

LOCK TABLES `customer_rents_equipments` WRITE;
/*!40000 ALTER TABLE `customer_rents_equipments` DISABLE KEYS */;
INSERT INTO `customer_rents_equipments` VALUES (1,1,2,'2017-08-03',NULL),(2,1,1,'2017-08-03',NULL),(3,3,2,'2017-08-04',NULL),(4,2,1,'2017-08-12',NULL),(5,2,1,'2017-08-12',NULL);
/*!40000 ALTER TABLE `customer_rents_equipments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exercise`
--

DROP TABLE IF EXISTS `exercise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exercise` (
  `exercise_id` int(11) NOT NULL AUTO_INCREMENT,
  `exercise_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`exercise_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercise`
--

LOCK TABLES `exercise` WRITE;
/*!40000 ALTER TABLE `exercise` DISABLE KEYS */;
INSERT INTO `exercise` VALUES (1,'Squat'),(2,'Push Up'),(3,'Pull Up'),(4,'Barebell bench Press'),(5,'Sit-up'),(6,'Yoga'),(7,'Bent Knee Push up');
/*!40000 ALTER TABLE `exercise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_has_exercise`
--

DROP TABLE IF EXISTS `group_has_exercise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_has_exercise` (
  `group_id` int(11) NOT NULL,
  `exercise_id` int(11) NOT NULL,
  PRIMARY KEY (`group_id`,`exercise_id`),
  KEY `exer_id` (`exercise_id`),
  CONSTRAINT `group_has_exercise_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `workout_group_list` (`g_id`),
  CONSTRAINT `group_has_exercise_ibfk_2` FOREIGN KEY (`exercise_id`) REFERENCES `exercise` (`exercise_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_has_exercise`
--

LOCK TABLES `group_has_exercise` WRITE;
/*!40000 ALTER TABLE `group_has_exercise` DISABLE KEYS */;
INSERT INTO `group_has_exercise` VALUES (1,1),(2,1),(1,2),(1,3),(3,3),(5,6);
/*!40000 ALTER TABLE `group_has_exercise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manager` (
  `staff_id` int(11) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `branch_id` int(11) NOT NULL,
  PRIMARY KEY (`staff_id`),
  KEY `branch_id` (`branch_id`),
  CONSTRAINT `manager_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`s_id`),
  CONSTRAINT `manager_ibfk_2` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`b_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES (5,'nice','321',2),(6,'hello','123',1);
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
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
-- Table structure for table `rentable_equipments`
--

DROP TABLE IF EXISTS `rentable_equipments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rentable_equipments` (
  `all_equip_id` int(11) NOT NULL,
  `rent_fee` int(11) NOT NULL,
  `rent_period` int(11) NOT NULL,
  PRIMARY KEY (`all_equip_id`),
  KEY `all_equip_id` (`all_equip_id`),
  KEY `all_equip_id_2` (`all_equip_id`),
  CONSTRAINT `rentable_equipments_ibfk_1` FOREIGN KEY (`all_equip_id`) REFERENCES `all_equipments` (`Equip_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rentable_equipments`
--

LOCK TABLES `rentable_equipments` WRITE;
/*!40000 ALTER TABLE `rentable_equipments` DISABLE KEYS */;
INSERT INTO `rentable_equipments` VALUES (1,100,7),(2,150,7);
/*!40000 ALTER TABLE `rentable_equipments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room` (
  `room_id` int(11) NOT NULL AUTO_INCREMENT,
  `room_no` int(11) NOT NULL,
  `capacity` int(11) DEFAULT NULL,
  `branch_id` int(11) NOT NULL,
  PRIMARY KEY (`room_no`,`branch_id`),
  UNIQUE KEY `room_id_2` (`room_id`),
  KEY `b_id` (`branch_id`),
  KEY `room_id` (`room_id`),
  CONSTRAINT `room_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`b_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1,101,14,1),(4,101,21,2),(2,102,11,1),(3,103,19,1),(5,201,21,2),(6,201,21,3),(7,202,18,3);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedules`
--

DROP TABLE IF EXISTS `schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedules` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT,
  `day` varchar(15) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time DEFAULT NULL,
  PRIMARY KEY (`day`,`start_time`),
  KEY `s_id` (`s_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedules`
--

LOCK TABLES `schedules` WRITE;
/*!40000 ALTER TABLE `schedules` DISABLE KEYS */;
INSERT INTO `schedules` VALUES (8,'Friday','06:00:00','08:00:00'),(2,'Monday','04:00:00','06:00:00'),(6,'Monday','06:00:00','08:00:00'),(11,'Monday','08:00:00','10:00:00'),(1,'Sunday','04:00:00','06:00:00'),(5,'Sunday','06:00:00','08:00:00'),(10,'Sunday','08:00:00','10:00:00'),(13,'thrusday','08:00:00','10:00:00'),(4,'Thursday','04:00:00','06:00:00'),(9,'thursday','06:00:00','08:00:00'),(12,'Tuesday','08:00:00','10:00:00'),(3,'Wednesday','04:00:00','06:00:00'),(7,'wednesday','06:00:00','08:00:00');
/*!40000 ALTER TABLE `schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT,
  `s_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone_no` varchar(11) NOT NULL,
  `address` varchar(300) NOT NULL,
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'Tom Cruise','tm@gmail.com','01987234354','Dhaka'),(2,'Brad Pitt','bp@yahoo.com','01823454676','Khulna'),(3,'Bruce Wills','bw@gmail.com','01945232676','Khulna'),(4,'Chris Pratt','cp@gmail.com','01712349125','Khulna'),(5,'Shakib Al Hasan','sah@gmail.com','01512312412','Dhaka'),(6,'Tamim Iqbal','ti@gmail.com','01814765765','Dhaka');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainer`
--

DROP TABLE IF EXISTS `trainer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trainer` (
  `t_id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) NOT NULL,
  PRIMARY KEY (`staff_id`),
  KEY `t_id` (`t_id`),
  KEY `staff_id` (`staff_id`),
  CONSTRAINT `trainer_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`s_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainer`
--

LOCK TABLES `trainer` WRITE;
/*!40000 ALTER TABLE `trainer` DISABLE KEYS */;
INSERT INTO `trainer` VALUES (1,2),(2,3),(3,5);
/*!40000 ALTER TABLE `trainer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainer_trains_class`
--

DROP TABLE IF EXISTS `trainer_trains_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trainer_trains_class` (
  `t_id` int(11) NOT NULL AUTO_INCREMENT,
  `class_id` int(11) NOT NULL,
  PRIMARY KEY (`t_id`,`class_id`),
  KEY `class_id` (`class_id`),
  KEY `t_id` (`t_id`),
  KEY `class_id_2` (`class_id`),
  CONSTRAINT `trainer_trains_class_ibfk_1` FOREIGN KEY (`t_id`) REFERENCES `trainer` (`staff_id`),
  CONSTRAINT `trainer_trains_class_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainer_trains_class`
--

LOCK TABLES `trainer_trains_class` WRITE;
/*!40000 ALTER TABLE `trainer_trains_class` DISABLE KEYS */;
INSERT INTO `trainer_trains_class` VALUES (2,1),(5,1),(3,2),(5,4);
/*!40000 ALTER TABLE `trainer_trains_class` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
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

-- Dump completed on 2017-08-09  8:55:37
