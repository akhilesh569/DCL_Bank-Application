-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
CREATE DATABASE IF NOT EXISTS dcl_bank;
use dcl_bank;
-- Host: localhost    Database: dcl_bank
-- ------------------------------------------------------
-- Server version	8.0.44

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts` (
  `acc_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `branch_id` int NOT NULL,
  `acc_no` bigint NOT NULL,
  `acc_type` varchar(30) NOT NULL,
  `balance` decimal(10,2) DEFAULT '0.00',
  `status` varchar(30) DEFAULT 'pending',
  `created_at` date NOT NULL,
  PRIMARY KEY (`acc_id`),
  UNIQUE KEY `acc_no` (`acc_no`),
  KEY `user_id` (`user_id`),
  KEY `branch_id` (`branch_id`),
  CONSTRAINT `accounts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `accounts_ibfk_2` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,5,1,101000000001,'savings',19500.00,'active','2026-06-24'),(3,7,3,103000000001,'savings',70500.00,'active','2026-06-24'),(4,7,3,103000000002,'current',0.00,'active','2026-06-24'),(5,4,1,101000000002,'savings',85000.00,'active','2026-07-03'),(6,4,3,103000000003,'current',45000.00,'active','2026-07-03'),(7,8,5,105000000001,'savings',31000.00,'active','2026-07-03'),(8,9,6,106000000001,'current',68000.00,'active','2026-07-03'),(9,10,7,107000000001,'savings',28000.00,'active','2026-07-03'),(10,10,8,108000000001,'current',52000.00,'active','2026-07-03'),(11,11,9,109000000001,'savings',41000.00,'active','2026-07-03'),(16,7,1,101000000003,'salary',0.00,'active','2026-07-03');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch` (
  `branch_id` int NOT NULL AUTO_INCREMENT,
  `branch_name` varchar(30) NOT NULL,
  `location` varchar(30) NOT NULL,
  `city` varchar(30) NOT NULL,
  `state` varchar(30) NOT NULL,
  `ifsc_code` varchar(30) NOT NULL,
  PRIMARY KEY (`branch_id`),
  UNIQUE KEY `ifsc_code` (`ifsc_code`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES (1,'Bengaluru Main Branch','MG Road','Bengaluru','Karnataka','DCLB0001001'),(3,'Mangaluru Branch','HampanKatta','Surathkal','Karnataka','DCLB0001002'),(5,'Mysore City Branch','vijayanagar','Mysore','Karnataka','DCLB0001004'),(6,'Hubli Main Branch','Vidya Nagar','Hubli','Karnataka','DCLB0001005'),(7,'Belgaum Central Branch','Tilakwadi','Belgaum','Karnataka','DCLB0001006'),(8,'Shivamogga Main Branch','Durgigudi','Shivamogga','Karnataka','DCLB0001007'),(9,'Davanagere City Branch','PJ Extension','Davanagere','Karnataka','DCLB0001008'),(10,'Yelhanka branch','Yelhanka New Town','Bengaluru','Karnataka','DCLB0001009');
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transcations`
--

DROP TABLE IF EXISTS `transcations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transcations` (
  `trans_id` int NOT NULL AUTO_INCREMENT,
  `transcation_date` date NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` varchar(30) NOT NULL,
  `trans_type` varchar(30) NOT NULL,
  `from_acc_id` int DEFAULT NULL,
  `to_acc_id` int DEFAULT NULL,
  `transcation_time` time NOT NULL,
  `mode_of_transcation` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`trans_id`),
  KEY `from_acc_id` (`from_acc_id`),
  KEY `to_acc_id` (`to_acc_id`),
  CONSTRAINT `transcations_ibfk_1` FOREIGN KEY (`from_acc_id`) REFERENCES `accounts` (`acc_id`),
  CONSTRAINT `transcations_ibfk_2` FOREIGN KEY (`to_acc_id`) REFERENCES `accounts` (`acc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transcations`
--

LOCK TABLES `transcations` WRITE;
/*!40000 ALTER TABLE `transcations` DISABLE KEYS */;
INSERT INTO `transcations` VALUES (39,'2026-06-24',25000.00,'success','deposit',NULL,1,'10:00:00','Net Banking'),(40,'2026-06-25',3000.00,'success','withdrawl',1,NULL,'11:30:00','ATM'),(41,'2026-06-26',2500.00,'success','transfer',1,3,'14:10:00','upi'),(42,'2026-06-27',4000.00,'failed','transfer',1,7,'15:20:30','upi'),(43,'2026-06-24',70000.00,'success','deposit',NULL,3,'09:20:00','Net Banking'),(44,'2026-06-25',1500.00,'failed','withdrawl',3,NULL,'10:10:00','Cards'),(45,'2026-06-27',2000.00,'success','withdrawl',3,NULL,'12:00:00','ATM'),(46,'2026-06-26',35000.00,'success','deposit',NULL,7,'11:30:45','Net Banking'),(47,'2026-06-27',3000.00,'success','withdrawl',7,NULL,'14:20:10','ATM'),(48,'2026-07-02',2000.00,'failed','transfer',7,10,'18:15:50','upi'),(49,'2026-06-28',60000.00,'success','deposit',NULL,8,'09:45:20','Net Banking'),(50,'2026-06-30',10000.00,'success','transfer',10,8,'12:25:40','rtgs'),(51,'2026-07-01',2000.00,'success','withdrawl',8,NULL,'16:30:00','ATM'),(52,'2026-06-29',30000.00,'success','deposit',NULL,9,'10:15:00','Cards'),(53,'2026-07-01',2500.00,'success','withdrawl',9,NULL,'17:40:00','ATM'),(54,'2026-07-01',7000.00,'failed','transfer',9,11,'11:25:35','neft'),(55,'2026-06-29',65000.00,'success','deposit',NULL,10,'11:00:00','Net Banking'),(56,'2026-07-01',10000.00,'success','transfer',10,8,'12:25:40','rtgs'),(57,'2026-07-01',3000.00,'success','withdrawl',10,NULL,'13:15:00','ATM'),(58,'2026-07-02',2500.00,'failed','withdrawl',10,NULL,'16:45:20','Cards'),(59,'2026-07-03',45000.00,'success','deposit',NULL,11,'10:05:15','Net Banking'),(60,'2026-07-04',4000.00,'success','withdrawl',11,NULL,'15:20:00','ATM'),(61,'2026-07-04',6000.00,'failed','transfer',11,3,'18:10:50','rtgs'),(62,'2026-07-05',500.00,'success','deposit',NULL,9,'14:42:15','Net Banking'),(63,'2026-07-05',500.00,'success','withdrawl',7,NULL,'15:23:21','ATM'),(64,'2026-07-05',500.00,'success','transfer',7,3,'16:01:46','upi'),(65,'2026-07-07',500.00,'success','withdrawl',3,NULL,'16:43:19','Cash');
/*!40000 ALTER TABLE `transcations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `phone` bigint NOT NULL,
  `password` varchar(30) NOT NULL,
  `role` varchar(30) NOT NULL,
  `registered_at` date NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (4,'gourish','gourish@gmail.com',1114522890,'gouri','Manager','2026-06-23'),(5,'shivu','shivu@gmail.com',1114523390,'shivu@123','Customer','2026-06-23'),(7,'vishnu','vishnu@gmail.com',1194523390,'1234','Customer','2026-06-24'),(8,'darshan','darshan@gmail.com',8088623000,'123456','Customer','2026-07-02'),(9,'akhliesh','ak@gmail.com',2323232323,'ak123','Customer','2026-07-03'),(10,'manikant','mani@gmail.com',2323136793,'mani123','Customer','2026-07-03'),(11,'srajan','srajan@gmail.com',9878987549,'srajan123','Customer','2026-07-03');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-09 12:03:03
