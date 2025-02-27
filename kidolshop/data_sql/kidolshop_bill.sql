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
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill` (
  `idBill` int unsigned NOT NULL AUTO_INCREMENT,
  `idCustomer` int unsigned NOT NULL,
  `Payment` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cash',
  `Voucher` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PhoneNumber` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CustomerName` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ReceiveDate` datetime DEFAULT NULL,
  `Status` tinyint NOT NULL DEFAULT '0',
  `TotalBill` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idBill`),
  KEY `idCustomer` (`idCustomer`),
  CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`idCustomer`) REFERENCES `customer` (`idCustomer`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
INSERT INTO `bill` VALUES (10,2,'cash','1-2-300000','Bình Thủy, Cần Thơ, Tp. Cần Thơ','0923542101','Nguyễn Trà My','2022-08-06 20:32:37',2,1329000,'2022-08-06 13:31:22','2022-08-06 13:32:37'),(11,2,'cash',NULL,'Bình Thủy, Cần Thơ, Tp. Cần Thơ','0923542101','Nguyễn Trà My',NULL,99,408000,'2022-08-07 06:32:02','2022-08-08 08:53:24'),(12,2,'cash',NULL,'Bình Thủy, Cần Thơ, Tp. Cần Thơ','0923542101','Nguyễn Trà My','2022-10-04 22:15:01',2,463000,'2022-08-08 09:01:21','2022-10-04 15:15:01'),(22,5,'vnpay','','330 XXX, XXX XXXX, XXXX','0924818410','Customer','2023-11-08 14:19:03',2,2164000,'2023-08-07 11:27:14','2023-11-08 07:19:03'),(23,6,'cash',NULL,'qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq','0388165329','Chu Văn Duy','2025-02-26 14:56:24',2,249000,'2023-11-08 07:16:54','2025-02-26 07:56:24'),(24,6,'cash',NULL,'qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq','0388165329','Chu Văn Duy','2025-02-26 14:57:37',2,249000,'2023-11-08 15:59:56','2025-02-26 07:57:37'),(25,6,'cash',NULL,'qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq','0388165329','Chu Văn Duy',NULL,0,295000,'2023-11-08 16:33:10','2023-11-08 16:33:10'),(26,6,'vnpay','','xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx','0123456789','xxxxx','2025-02-27 11:36:59',2,2200000,'2023-11-08 20:58:27','2025-02-27 04:36:59'),(27,9,'cash',NULL,'Hoài Đức, Hà Nội, Việt Nam','12345678456','Hòng Chóa',NULL,1,150000,'2024-05-02 00:54:48','2025-02-27 05:09:06'),(28,9,'cash',NULL,'Hoài Đức, Hà Nội, Việt Nam','12345678456','Hòng Chóa','2025-02-27 12:08:56',2,228000,'2024-05-07 07:52:11','2025-02-27 05:08:56'),(29,10,'cash',NULL,'Bac Tu Liem Ha Noi City','0339205335','dinh xuan truong',NULL,99,40000,'2025-02-26 10:03:18','2025-02-27 04:47:11'),(30,10,'cash',NULL,'Bac Tu Liem Ha Noi City','0339205335','dinh xuan truong',NULL,2,480000,'2025-02-26 10:29:55','2025-02-27 05:05:19'),(31,10,'vnpay','','Bac Tu Liem Ha Noi City','0339205335','dinh xuan truong',NULL,1,40000,'2025-02-26 10:33:17','2025-02-26 10:33:17'),(32,10,'vnpay','','Bac Tu Liem Ha Noi City','0339205335','dinh xuan truong',NULL,1,3822000,'2025-02-27 03:52:32','2025-02-27 03:52:32'),(33,10,'cash',NULL,'Bac Tu Liem Ha Noi City','0339205335','dinh xuan truong',NULL,2,519000,'2025-02-27 04:04:19','2025-02-27 04:04:19');
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-27 12:11:50
