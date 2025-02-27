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
-- Table structure for table `addresscustomer`
--

DROP TABLE IF EXISTS `addresscustomer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresscustomer` (
  `idAddress` int unsigned NOT NULL AUTO_INCREMENT,
  `idCustomer` int unsigned NOT NULL,
  `Address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PhoneNumber` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CustomerName` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idAddress`),
  KEY `idCustomer` (`idCustomer`),
  CONSTRAINT `addresscustomer_ibfk_1` FOREIGN KEY (`idCustomer`) REFERENCES `customer` (`idCustomer`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresscustomer`
--

LOCK TABLES `addresscustomer` WRITE;
/*!40000 ALTER TABLE `addresscustomer` DISABLE KEYS */;
INSERT INTO `addresscustomer` VALUES (4,2,'Bình Thủy, Cần Thơ, Tp. Cần Thơ','0923542101','Nguyễn Trà My','2022-08-06 13:31:12','2022-08-06 13:31:12'),(6,5,'330 XXX, XXX XXXX, XXXX','0924818410','Customer','2023-08-07 10:51:25','2023-08-07 10:51:25'),(7,6,'qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq','0388165329','Chu Văn Duy','2023-11-08 07:16:50','2023-11-08 07:16:50'),(8,6,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx','0123456789','xxxxx','2023-11-08 20:56:41','2023-11-08 20:56:41'),(11,10,'Bac Tu Liem Ha Noi City','0339205335','dinh xuan truong','2025-02-26 09:42:02','2025-02-26 09:42:02');
/*!40000 ALTER TABLE `addresscustomer` ENABLE KEYS */;
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
