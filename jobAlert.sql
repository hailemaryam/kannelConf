-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: localhost    Database: jobAlert
-- ------------------------------------------------------
-- Server version	5.7.27-0ubuntu0.18.04.1

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
-- Table structure for table `jobCategory`
--

DROP TABLE IF EXISTS `jobCategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobCategory` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobCategory`
--

LOCK TABLES `jobCategory` WRITE;
/*!40000 ALTER TABLE `jobCategory` DISABLE KEYS */;
INSERT INTO `jobCategory` VALUES (1,'All','2019-05-23 12:39:25','2019-06-19 12:19:53'),(2,'Health','2019-06-01 19:25:46','2019-09-14 18:14:13'),(3,'Sport','2019-06-01 22:25:22','2019-09-14 18:14:23'),(4,'Sport In Oromifa','2019-06-03 11:17:48','2019-09-14 18:14:56'),(5,'Other','2019-08-14 19:16:09','2019-09-14 18:15:08');
/*!40000 ALTER TABLE `jobCategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sms` varchar(1024) DEFAULT NULL,
  `smsSize` int(11) DEFAULT NULL,
  `JobCategory_id` bigint(20) unsigned NOT NULL,
  `approved` tinyint(1) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `approved_by` bigint(20) unsigned DEFAULT NULL,
  `createdBy` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_jobs_JobCategory1_idx` (`JobCategory_id`),
  KEY `fk_jobs_user1_idx` (`approved_by`),
  KEY `fk_jobs_user2_idx` (`createdBy`),
  CONSTRAINT `fk_jobs_JobCategory1` FOREIGN KEY (`JobCategory_id`) REFERENCES `jobCategory` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_jobs_user1` FOREIGN KEY (`approved_by`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_jobs_user2` FOREIGN KEY (`createdBy`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` VALUES (1,'test',NULL,2,1,'2019-06-01 23:30:07','2019-09-15 19:22:11',2,2),(2,'asdfasdf',NULL,1,1,'2019-06-17 11:37:38','2019-06-26 16:09:35',4,4),(3,'test',NULL,1,1,'2019-09-14 18:09:14',NULL,2,2),(4,'test health',NULL,2,1,'2019-09-14 18:27:06',NULL,2,2),(5,'test',NULL,4,1,'2019-09-15 19:22:39',NULL,2,2),(6,'Testing staff',NULL,2,1,'2019-09-15 19:58:55','2019-09-15 19:59:53',2,4),(7,'test from staff',NULL,3,1,'2019-09-15 19:59:20','2019-09-15 20:00:03',2,4),(8,'testing waiting',NULL,5,1,'2019-09-15 20:05:42','2019-09-15 20:06:15',2,4),(9,'testing null',NULL,4,1,'2019-09-15 20:07:22','2019-09-15 20:07:48',2,4),(10,'test qr',NULL,1,1,'2019-09-15 23:53:16',NULL,2,2),(11,'test q',NULL,1,1,'2019-09-16 00:02:01','2019-09-16 00:02:35',2,2),(12,'test q 2',NULL,2,1,'2019-09-16 00:13:08','2019-09-16 00:13:25',2,2),(13,'dsdfa',NULL,1,1,'2019-09-16 00:21:43','2019-09-16 00:22:11',2,2);
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriber`
--

DROP TABLE IF EXISTS `subscriber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscriber` (
  `phone` varchar(45) NOT NULL,
  `subscriptionStatus` tinyint(1) DEFAULT NULL,
  `smsLimit` int(11) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriber`
--

LOCK TABLES `subscriber` WRITE;
/*!40000 ALTER TABLE `subscriber` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscriber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscribersJobCategory`
--

DROP TABLE IF EXISTS `subscribersJobCategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscribersJobCategory` (
  `subscriber_phone` varchar(45) NOT NULL,
  `JobCategory_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`subscriber_phone`,`JobCategory_id`),
  KEY `fk_subscriber_has_JobCategory_JobCategory1_idx` (`JobCategory_id`),
  KEY `fk_subscriber_has_JobCategory_subscriber_idx` (`subscriber_phone`),
  CONSTRAINT `fk_subscriber_has_JobCategory_JobCategory1` FOREIGN KEY (`JobCategory_id`) REFERENCES `jobCategory` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_subscriber_has_JobCategory_subscriber` FOREIGN KEY (`subscriber_phone`) REFERENCES `subscriber` (`phone`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscribersJobCategory`
--

LOCK TABLES `subscribersJobCategory` WRITE;
/*!40000 ALTER TABLE `subscribersJobCategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscribersJobCategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `password` varchar(1024) CHARACTER SET utf8 NOT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `firstName` varchar(1024) CHARACTER SET utf8 DEFAULT NULL,
  `lastName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(1024) CHARACTER SET utf8 DEFAULT NULL,
  `phoneNumber` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `icon` varchar(1024) CHARACTER SET utf8 DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (2,'admin','$2a$10$9wKJtWyxSYQU8HX5.dtK1uxTkrhxSVMFpYorIbdGn8B4bF0oBoydO',1,'admin','adminf','admin@gmail.com','0921306793',NULL,'2019-05-23 12:39:25','2019-09-15 19:54:27'),(4,'staff','$2a$10$9wKJtWyxSYQU8HX5.dtK1uxTkrhxSVMFpYorIbdGn8B4bF0oBoydO',1,'staff','staffff','staff@gmail.com','0987654321','',NULL,'2019-09-15 19:54:23');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_authority`
--

DROP TABLE IF EXISTS `user_authority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_authority` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `authority` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_authority_user1_idx` (`user_id`),
  CONSTRAINT `fk_user_authority_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_authority`
--

LOCK TABLES `user_authority` WRITE;
/*!40000 ALTER TABLE `user_authority` DISABLE KEYS */;
INSERT INTO `user_authority` VALUES (3,'ADMIN',2),(4,'STAFF',4);
/*!40000 ALTER TABLE `user_authority` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-02 19:32:07
