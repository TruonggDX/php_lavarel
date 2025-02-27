-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: kidolshop
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `product_attribute`
--

DROP TABLE IF EXISTS `product_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_attribute` (
  `idProAttr` int unsigned NOT NULL AUTO_INCREMENT,
  `idProduct` int unsigned NOT NULL,
  `idAttrValue` int unsigned NOT NULL DEFAULT '11',
  `Quantity` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idProAttr`),
  KEY `idProduct` (`idProduct`,`idAttrValue`),
  KEY `idAttrValue` (`idAttrValue`),
  CONSTRAINT `product_attribute_ibfk_1` FOREIGN KEY (`idAttrValue`) REFERENCES `attribute_value` (`idAttrValue`) ON DELETE CASCADE,
  CONSTRAINT `product_attribute_ibfk_2` FOREIGN KEY (`idProduct`) REFERENCES `product` (`idProduct`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=278 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_attribute`
--

LOCK TABLES `product_attribute` WRITE;
/*!40000 ALTER TABLE `product_attribute` DISABLE KEYS */;
INSERT INTO `product_attribute` VALUES (201,58,18,88,'2023-11-08 16:21:54','2023-11-08 16:21:54'),(202,58,19,100,'2023-11-08 16:21:54','2023-11-08 16:21:54'),(203,58,33,100,'2023-11-08 16:21:54','2023-11-08 16:21:54'),(204,59,18,100,'2023-11-08 16:26:12','2023-11-08 16:26:12'),(205,59,19,99,'2023-11-08 16:26:12','2023-11-08 16:26:12'),(206,59,33,100,'2023-11-08 16:26:12','2023-11-08 16:26:12'),(207,60,18,99,'2023-11-08 16:29:08','2023-11-08 16:29:08'),(208,60,19,100,'2023-11-08 16:29:08','2023-11-08 16:29:08'),(209,60,33,100,'2023-11-08 16:29:08','2023-11-08 16:29:08'),(210,61,24,99,'2023-11-08 16:32:55','2023-11-08 16:32:55'),(211,61,25,100,'2023-11-08 16:32:55','2023-11-08 16:32:55'),(212,61,26,100,'2023-11-08 16:32:55','2023-11-08 16:32:55'),(213,61,27,99,'2023-11-08 16:32:55','2023-11-08 16:32:55'),(214,62,18,100,'2023-11-08 16:35:10','2023-11-08 16:35:10'),(215,62,19,100,'2023-11-08 16:35:10','2023-11-08 16:35:10'),(216,62,33,100,'2023-11-08 16:35:10','2023-11-08 16:35:10'),(217,63,11,200,'2023-11-08 16:41:02','2023-11-08 16:41:02'),(218,64,25,100,'2023-11-08 20:24:08','2023-11-08 20:24:08'),(219,64,26,100,'2023-11-08 20:24:08','2023-11-08 20:24:08'),(220,64,27,100,'2023-11-08 20:24:08','2023-11-08 20:24:08'),(221,65,25,100,'2023-11-08 20:26:40','2023-11-08 20:26:40'),(222,65,26,100,'2023-11-08 20:26:40','2023-11-08 20:26:40'),(223,65,27,100,'2023-11-08 20:26:40','2023-11-08 20:26:40'),(224,66,24,100,'2023-11-08 20:29:05','2023-11-08 20:29:05'),(225,66,25,100,'2023-11-08 20:29:05','2023-11-08 20:29:05'),(226,66,28,110,'2023-11-08 20:29:05','2023-11-08 20:29:05'),(227,67,18,120,'2023-11-08 20:31:28','2023-11-08 20:31:28'),(228,68,18,108,'2023-11-08 20:33:30','2023-11-08 20:33:30'),(229,68,19,110,'2023-11-08 20:33:30','2023-11-08 20:33:30'),(230,68,31,100,'2023-11-08 20:33:30','2023-11-08 20:33:30'),(231,68,32,140,'2023-11-08 20:33:30','2023-11-08 20:33:30'),(232,68,33,123,'2023-11-08 20:33:30','2023-11-08 20:33:30'),(233,69,18,101,'2023-11-08 20:37:16','2023-11-08 20:37:16'),(234,69,19,111,'2023-11-08 20:37:16','2023-11-08 20:37:16'),(235,69,29,104,'2023-11-08 20:37:16','2023-11-08 20:37:16'),(236,69,33,105,'2023-11-08 20:37:16','2023-11-08 20:37:16'),(237,70,16,100,'2023-11-08 20:39:05','2023-11-08 20:39:05'),(238,70,18,100,'2023-11-08 20:39:05','2023-11-08 20:39:05'),(239,70,19,100,'2023-11-08 20:39:05','2023-11-08 20:39:05'),(240,70,29,100,'2023-11-08 20:39:05','2023-11-08 20:39:05'),(241,70,30,100,'2023-11-08 20:39:05','2023-11-08 20:39:05'),(242,70,31,100,'2023-11-08 20:39:05','2023-11-08 20:39:05'),(243,70,32,100,'2023-11-08 20:39:05','2023-11-08 20:39:05'),(244,70,33,100,'2023-11-08 20:39:05','2023-11-08 20:39:05'),(245,71,34,100,'2023-11-08 20:46:13','2023-11-08 20:46:13'),(246,71,35,100,'2023-11-08 20:46:13','2023-11-08 20:46:13'),(247,71,36,100,'2023-11-08 20:46:13','2023-11-08 20:46:13'),(248,72,18,100,'2023-11-08 20:47:55','2023-11-08 20:47:55'),(249,72,19,50,'2023-11-08 20:47:55','2023-11-08 20:47:55'),(250,72,33,50,'2023-11-08 20:47:55','2023-11-08 20:47:55'),(251,73,18,120,'2023-11-08 20:50:37','2023-11-08 20:50:37'),(252,73,19,123,'2023-11-08 20:50:37','2023-11-08 20:50:37'),(253,73,29,474,'2023-11-08 20:50:37','2023-11-08 20:50:37'),(254,73,31,854,'2023-11-08 20:50:37','2023-11-08 20:50:37'),(255,73,32,745,'2023-11-08 20:50:37','2023-11-08 20:50:37'),(256,73,33,100,'2023-11-08 20:50:37','2023-11-08 20:50:37'),(257,74,39,100,'2023-11-08 20:53:04','2023-11-08 20:53:04'),(258,74,40,100,'2023-11-08 20:53:04','2023-11-08 20:53:04'),(259,74,41,100,'2023-11-08 20:53:04','2023-11-08 20:53:04'),(260,74,42,100,'2023-11-08 20:53:04','2023-11-08 20:53:04'),(261,74,43,100,'2023-11-08 20:53:04','2023-11-08 20:53:04'),(262,74,44,100,'2023-11-08 20:53:04','2023-11-08 20:53:04'),(263,74,45,100,'2023-11-08 20:53:04','2023-11-08 20:53:04'),(264,74,46,100,'2023-11-08 20:53:04','2023-11-08 20:53:04'),(265,74,47,100,'2023-11-08 20:53:04','2023-11-08 20:53:04'),(266,74,48,100,'2023-11-08 20:53:04','2023-11-08 20:53:04'),(267,74,49,100,'2023-11-08 20:53:04','2023-11-08 20:53:04'),(268,75,48,100,'2023-11-08 20:55:10','2023-11-08 20:55:10'),(269,75,49,100,'2023-11-08 20:55:10','2023-11-08 20:55:10'),(270,75,50,100,'2023-11-08 20:55:10','2023-11-08 20:55:10'),(271,75,51,100,'2023-11-08 20:55:10','2023-11-08 20:55:10'),(272,75,52,100,'2023-11-08 20:55:10','2023-11-08 20:55:10'),(273,75,53,99,'2023-11-08 20:55:10','2023-11-08 20:55:10'),(274,76,30,3,'2024-05-02 00:51:10','2024-05-02 00:51:10'),(275,76,31,5,'2024-05-02 00:51:10','2024-05-02 00:51:10'),(277,77,28,5,'2025-02-26 07:41:10','2025-02-26 07:41:10');
/*!40000 ALTER TABLE `product_attribute` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-27 12:11:49
