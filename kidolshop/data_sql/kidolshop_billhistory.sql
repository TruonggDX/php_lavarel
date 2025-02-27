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
-- Table structure for table `billhistory`
--

DROP TABLE IF EXISTS `billhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billhistory` (
  `idBill` int unsigned NOT NULL,
  `AdminName` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Status` tinyint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `idBill` (`idBill`),
  CONSTRAINT `billhistory_ibfk_1` FOREIGN KEY (`idBill`) REFERENCES `bill` (`idBill`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billhistory`
--

LOCK TABLES `billhistory` WRITE;
/*!40000 ALTER TABLE `billhistory` DISABLE KEYS */;
INSERT INTO `billhistory` VALUES (10,'Nguyễn Gia Hy',1,'2022-08-06 13:32:33','2022-08-06 13:32:33'),(11,'Nguyễn Gia Hy',99,'2022-08-08 08:53:23','2022-08-08 08:53:23'),(12,'Nguyễn Gia Hy',1,'2022-08-28 10:24:38','2022-08-28 10:24:38'),(22,'System',1,'2023-08-07 11:27:14','2023-08-07 11:27:14'),(10,'Nguyễn Gia Hy',1,'2022-08-06 13:32:33','2022-08-06 13:32:33'),(11,'Nguyễn Gia Hy',99,'2022-08-08 08:53:23','2022-08-08 08:53:23'),(12,'Nguyễn Gia Hy',1,'2022-08-28 10:24:38','2022-08-28 10:24:38'),(22,'System',1,'2023-08-07 11:27:14','2023-08-07 11:27:14'),(23,'admin',1,'2023-11-08 07:19:07','2023-11-08 07:19:07'),(26,'System',1,'2023-11-08 20:58:27','2023-11-08 20:58:27'),(24,'admin',1,'2025-02-26 07:57:13','2025-02-26 07:57:13'),(31,'System',1,'2025-02-26 10:33:17','2025-02-26 10:33:17'),(32,'System',1,'2025-02-27 03:52:32','2025-02-27 03:52:32'),(29,'admin',99,'2025-02-27 04:47:11','2025-02-27 04:47:11'),(30,'admin',1,'2025-02-27 04:56:12','2025-02-27 04:56:12'),(30,'admin',0,'2025-02-27 05:04:49','2025-02-27 05:04:49'),(30,'admin',2,'2025-02-27 05:05:19','2025-02-27 05:05:19'),(28,'admin',1,'2025-02-27 05:07:06','2025-02-27 05:07:06'),(27,'admin',1,'2025-02-27 05:09:06','2025-02-27 05:09:06');
/*!40000 ALTER TABLE `billhistory` ENABLE KEYS */;
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
