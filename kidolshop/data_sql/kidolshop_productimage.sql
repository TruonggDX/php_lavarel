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
-- Table structure for table `productimage`
--

DROP TABLE IF EXISTS `productimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productimage` (
  `idImage` int unsigned NOT NULL AUTO_INCREMENT,
  `idProduct` int unsigned NOT NULL,
  `ImageName` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idImage`),
  KEY `idProduct` (`idProduct`),
  CONSTRAINT `productimage_ibfk_1` FOREIGN KEY (`idProduct`) REFERENCES `product` (`idProduct`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productimage`
--

LOCK TABLES `productimage` WRITE;
/*!40000 ALTER TABLE `productimage` DISABLE KEYS */;
INSERT INTO `productimage` VALUES (57,58,'[\"polo258.jpg\",\"polo332.jpg\"]','2023-11-08 16:20:52','2023-11-08 16:20:52'),(58,59,'[\"polo431.jpg\",\"polo578.jpg\",\"polo626.jpg\",\"polo727.jpg\"]','2023-11-08 16:26:12','2023-11-08 16:26:12'),(59,60,'[\"polo864.jpg\",\"polo921.jpg\",\"polo1023.jpg\",\"polo1178.jpg\"]','2023-11-08 16:29:08','2023-11-08 16:29:08'),(60,61,'[\"QuanJeanBoy125.jpg\",\"QuanJeanBoy293.jpg\",\"QuanJeanBoy379.jpg\",\"QuanJeanBoy465.jpg\",\"QuanJeanBoy568.jpg\",\"QuanJeanBoy640.jpg\",\"QuanJeanBoy769.jpg\"]','2023-11-08 16:32:55','2023-11-08 16:32:55'),(61,62,'[\"AoThunBoy125.jpg\",\"AoThunBoy221.jpg\",\"AoThunBoy340.jpg\",\"AoThunBoy484.jpg\",\"AoThunBoy569.jpg\"]','2023-11-08 16:35:10','2023-11-08 16:35:10'),(62,63,'[\"QuanJeanBoy887.jpg\",\"QuanJeanBoy979.jpg\",\"QuanJeanBoy1061.jpg\"]','2023-11-08 16:41:02','2023-11-08 16:41:02'),(63,64,'[\"43b874c9f94fc09866b170a1796485ee76.jpg\",\"noiy182.jpg\",\"noiy268.jpg\",\"noiy354.jpg\"]','2023-11-08 20:24:08','2023-11-08 20:24:08'),(64,65,'[\"vn-11134207-7r98o-lniels5arf1p1071.jpg\",\"vn-11134207-7r98o-lniels51bhiybd48.jpg\",\"vn-11134207-7r98o-lniels5179tmcf30.jpg\"]','2023-11-08 20:26:40','2023-11-08 20:26:40'),(65,66,'[\"3ec8778d19d98de4aa88d297e91b1e6b79.jpg\",\"6154a95a7fec611add63da766993b4e888.jpg\",\"17009e2beae714d84e3d5aa2160e927384.jpg\"]','2023-11-08 20:29:05','2023-11-08 20:29:05'),(66,67,'[\"vn-11134207-7r98o-lnscuwnpuz5mc841.jpg\"]','2023-11-08 20:31:28','2023-11-08 20:31:28'),(67,68,'[\"vn-11134207-7r98o-lnscuwnpnybedd29.jpg\",\"vn-11134207-7r98o-lnscuwnpqrgaeb7.jpg\"]','2023-11-08 20:33:30','2023-11-08 20:33:30'),(68,69,'[\"vn-11134201-7r98o-lnrz9licoebe8f62.jpg\",\"vn-11134201-7r98o-lnrz9lid3unhe724.jpg\",\"vn-11134201-7r98o-lnrz9lua6xrue58.jpg\"]','2023-11-08 20:37:16','2023-11-08 20:37:16'),(69,70,'[\"vn-11134201-7r98o-ln87d829fw378177.jpg\",\"vn-11134201-7r98o-lnij32p7ko6y6641.jpg\",\"vn-11134201-7r98o-lnij32prjv1p7256.jpg\",\"vn-11134201-7r98o-lnij32rfhf965259.jpg\",\"vn-11134201-7r98o-lnku4z34r8bxef18.jpg\"]','2023-11-08 20:39:05','2023-11-08 20:39:05'),(70,71,'[\"28d4371ff8d696e53eb1a966d3974e2b49.jpg\",\"425a64a7defdb1aa52e9e492de690dec42.jpg\",\"vn-11134207-7qukw-lhig6o8vd6kl8d28.jpg\",\"vn-11134207-7qukw-lhig6o8vsmv54549.jpg\",\"vn-11134207-7qukw-lhig6o8w8341b041.jpg\",\"vn-11134207-7r98o-ln6r1jq8tbub6e7.jpg\"]','2023-11-08 20:46:13','2023-11-08 20:46:13'),(71,72,'[\"vn-11134207-7qukw-lk1x5pnl0cuac486.jpg\",\"vn-11134207-7qukw-lk1x5pnl1req5618.jpg\"]','2023-11-08 20:47:55','2023-11-08 20:47:55'),(72,73,'[\"sg-11134201-23020-ltfx6hv8yinvfb45.jpg\",\"vn-11134207-7qukw-lg0po69qlss75742.jpg\",\"vn-11134207-7qukw-lha85xp2bto37039.jpg\",\"vn-11134207-7qukw-lj6gu0c3xmmqe195.jpg\"]','2023-11-08 20:50:37','2023-11-08 20:50:37'),(73,74,'[\"6daf6e562844ec1d070c068a2bad071075.jpg\",\"242e3dd907880273b5e13ee46904a7ab43.jpg\",\"bc4e26f3ae55e8c58026851f863ca66e51.jpg\",\"c7b0189380747242fe27168e60a44e662.jpg\",\"c8e88fe702535fa0a6b3e6248c23438823.jpg\"]','2023-11-08 20:53:04','2023-11-08 20:53:04'),(74,75,'[\"sg-11134201-23020-dhdswarbjgnvcd70.jpg\",\"sg-11134201-23020-webeyazcjgnv9642.jpg\",\"sg-11134201-23020-z7j8o9ybjgnv445.jpg\",\"vn-11134207-7qukw-lg3k80m05i47bb85.jpg\"]','2023-11-08 20:55:10','2023-11-08 20:55:10'),(75,76,'[\"Background71.png\"]','2024-05-02 00:51:10','2024-05-02 00:51:10'),(77,77,'[\"z4567928954410_3809b4e7b9836c82a0b14711785aec6b7.jpg\"]','2025-02-26 07:41:10','2025-02-26 07:41:10');
/*!40000 ALTER TABLE `productimage` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-27 12:11:48
