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
-- Table structure for table `billinfo`
--

DROP TABLE IF EXISTS `billinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billinfo` (
  `idBill` int unsigned NOT NULL,
  `idProduct` int unsigned NOT NULL,
  `AttributeProduct` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Price` int NOT NULL,
  `QuantityBuy` int NOT NULL,
  `idProAttr` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `idBill` (`idBill`),
  KEY `idProduct` (`idProduct`),
  CONSTRAINT `billinfo_ibfk_1` FOREIGN KEY (`idBill`) REFERENCES `bill` (`idBill`) ON DELETE CASCADE,
  CONSTRAINT `billinfo_ibfk_2` FOREIGN KEY (`idProduct`) REFERENCES `product` (`idProduct`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billinfo`
--

LOCK TABLES `billinfo` WRITE;
/*!40000 ALTER TABLE `billinfo` DISABLE KEYS */;
INSERT INTO `billinfo` VALUES (25,61,'Size: 29',265000,1,210,'2023-11-08 16:33:10','2023-11-08 16:33:10'),(26,68,'Màu sắc: Đen',220000,10,228,'2023-11-08 20:58:27','2023-11-08 20:58:27'),(27,76,'Màu sắc: Xanh Lam',120000,1,274,'2024-05-02 00:54:48','2024-05-02 00:54:48'),(28,60,'Màu sắc: Đen',198000,1,207,'2024-05-07 07:52:11','2024-05-07 07:52:11'),(29,77,'Size: 28',10000,1,277,'2025-02-26 10:03:18','2025-02-26 10:03:18'),(30,77,'Size: 28',10000,1,277,'2025-02-26 10:29:55','2025-02-26 10:29:55'),(30,68,'Màu sắc: Đen',220000,2,228,'2025-02-26 10:29:55','2025-02-26 10:29:55'),(31,77,'Size: 28',10000,1,277,'2025-02-26 10:33:17','2025-02-26 10:33:17'),(32,59,'Màu sắc: Be',202000,1,205,'2025-02-27 03:52:32','2025-02-27 03:52:32'),(32,58,'Màu sắc: Đen',300000,12,201,'2025-02-27 03:52:32','2025-02-27 03:52:32'),(32,77,'Size: 28',10000,2,277,'2025-02-27 03:52:32','2025-02-27 03:52:32'),(33,69,'Màu sắc: Đen',489000,1,233,'2025-02-27 04:04:19','2025-02-27 04:04:19');
/*!40000 ALTER TABLE `billinfo` ENABLE KEYS */;
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
