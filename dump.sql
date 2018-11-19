-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: electric_iot
-- ------------------------------------------------------
-- Server version	5.7.16-log

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
-- Dumping data for table `bind_user_department_role`
--

LOCK TABLES `bind_user_department_role` WRITE;
/*!40000 ALTER TABLE `bind_user_department_role` DISABLE KEYS */;
INSERT INTO `bind_user_department_role` VALUES (1,1,1,NULL),(2,2,1,NULL),(3,3,1,NULL),(4,4,3,NULL),(5,5,2,NULL),(6,6,5,NULL),(7,7,4,NULL),(8,8,6,NULL),(9,9,7,NULL),(10,10,8,NULL);
/*!40000 ALTER TABLE `bind_user_department_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'苏州工业园区服务外包职业学院',0,'2018-11-18 22:26:56',0,0),(2,'人工智能学院',1,'2018-11-18 22:27:36',0,1),(3,'信息工程学院',1,'2018-11-18 22:27:47',0,1),(4,'纳米科技学院',1,'2018-11-18 22:27:53',0,1),(5,'人文艺术学院',1,'2018-11-18 22:28:02',0,1),(6,'商学院',1,'2018-11-18 22:28:33',0,1),(7,'机器人工程系',2,'2018-11-18 22:28:55',0,2),(8,'智能工程系',2,'2018-11-18 22:29:02',0,2),(9,'智能芯片系',2,'2018-11-18 22:29:12',0,2),(10,'软件技术系',2,'2018-11-18 22:29:31',0,3);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `department_device_relation`
--

LOCK TABLES `department_device_relation` WRITE;
/*!40000 ALTER TABLE `department_device_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `department_device_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `device`
--

LOCK TABLES `device` WRITE;
/*!40000 ALTER TABLE `device` DISABLE KEYS */;
/*!40000 ALTER TABLE `device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `device_cmd`
--

LOCK TABLES `device_cmd` WRITE;
/*!40000 ALTER TABLE `device_cmd` DISABLE KEYS */;
/*!40000 ALTER TABLE `device_cmd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `device_location`
--

LOCK TABLES `device_location` WRITE;
/*!40000 ALTER TABLE `device_location` DISABLE KEYS */;
/*!40000 ALTER TABLE `device_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `right`
--

LOCK TABLES `right` WRITE;
/*!40000 ALTER TABLE `right` DISABLE KEYS */;
/*!40000 ALTER TABLE `right` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `role_right_relation`
--

LOCK TABLES `role_right_relation` WRITE;
/*!40000 ALTER TABLE `role_right_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_right_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
/*!40000 ALTER TABLE `type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','admin','admin','2018-11-18 22:26:10',NULL,NULL,0),(2,'siso','siso','siso','2018-11-18 22:26:20',NULL,NULL,0),(3,'test','test','test','2018-11-18 22:26:30',NULL,NULL,0),(4,'liuz','liuz','liuz','2018-11-18 22:30:05',NULL,NULL,0),(5,'tangl','tangl','tangl','2018-11-18 22:30:17',NULL,NULL,0),(6,'zhaoq','zhaoq','zhaoq','2018-11-18 22:30:26',NULL,NULL,0),(7,'zhangy','zhangy','zhangy','2018-11-18 22:30:36',NULL,NULL,0),(8,'lirl','lirl','lirl','2018-11-18 22:30:46',NULL,NULL,0),(9,'taowy','taowy','taowy','2018-11-18 22:31:13',NULL,NULL,0),(10,'liuh','liuh','liuh','2018-11-19 22:36:56',NULL,NULL,0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `user_right_relation`
--

LOCK TABLES `user_right_relation` WRITE;
/*!40000 ALTER TABLE `user_right_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_right_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'electric_iot'
--

--
-- Dumping routines for database 'electric_iot'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-19 22:39:06
