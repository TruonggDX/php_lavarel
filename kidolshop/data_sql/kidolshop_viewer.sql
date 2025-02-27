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
-- Table structure for table `viewer`
--

DROP TABLE IF EXISTS `viewer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `viewer` (
  `idView` int NOT NULL AUTO_INCREMENT,
  `idCustomer` int unsigned NOT NULL,
  `idProduct` int unsigned NOT NULL,
  `Rating` int DEFAULT NULL,
  `Comment` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idView`),
  KEY `idCustomer` (`idCustomer`),
  KEY `idProduct` (`idProduct`),
  CONSTRAINT `viewer_ibfk_1` FOREIGN KEY (`idCustomer`) REFERENCES `customer` (`idCustomer`) ON DELETE CASCADE,
  CONSTRAINT `viewer_ibfk_2` FOREIGN KEY (`idProduct`) REFERENCES `product` (`idProduct`) ON DELETE CASCADE,
  CONSTRAINT `viewer_chk_1` CHECK ((`Rating` between 1 and 5))
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viewer`
--

LOCK TABLES `viewer` WRITE;
/*!40000 ALTER TABLE `viewer` DISABLE KEYS */;
INSERT INTO `viewer` VALUES (7,2,59,4,'fake bu bu bu contnet','2025-02-26 11:09:37','2025-02-27 02:42:28'),(8,3,60,3,'Sản phẩm bình thường, không như mong đợi.','2025-02-26 11:09:37','2025-02-26 11:09:37'),(10,5,58,5,'Hàng bị lỗi, cần đổi trả.','2025-02-26 11:09:37','2025-02-27 03:29:04'),(11,6,77,5,'Pro vip','2025-02-26 11:19:12','2025-02-26 15:21:35'),(13,3,63,3,'Sản phẩm bình thường, không như mong đợi.','2025-02-26 11:19:12','2025-02-26 11:19:12'),(14,4,60,5,'Rất hài lòng, sẽ mua thêm!','2025-02-26 11:19:12','2025-02-26 11:19:12'),(15,5,58,2,'Hàng bị lỗi, cần đổi trả.','2025-02-26 11:19:12','2025-02-26 11:19:12'),(35,10,59,3,'truongdx','2025-02-27 03:34:18','2025-02-27 03:34:18'),(39,10,69,5,'goood one','2025-02-27 04:05:16','2025-02-27 04:10:58');
/*!40000 ALTER TABLE `viewer` ENABLE KEYS */;
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
