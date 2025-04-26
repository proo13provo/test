-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: dataweb
-- ------------------------------------------------------
-- Server version	9.0.1

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
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `productName` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `idCategory` int DEFAULT NULL,
  `idSupplier` int DEFAULT NULL,
  `isActive` bit(1) DEFAULT b'1',
  `image` text COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idCategory` (`idCategory`),
  KEY `idSupplier` (`idSupplier`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`idCategory`) REFERENCES `categories` (`id`),
  CONSTRAINT `products_ibfk_2` FOREIGN KEY (`idSupplier`) REFERENCES `suppliers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (44,'Nấm Bào Ngư Xám Tươi',4,2,_binary '',''),(46,'Nấm Đùi Gà Tươi (L1)',4,2,_binary '',''),(47,'Nấm Hương Tươi – Nấm Đông Cô Tươi',4,4,_binary '',''),(49,'Nấm Rơm Tươi (Búp)',4,4,_binary '',''),(50,'Nấm Mối Đen Tươi (L1)',4,4,_binary '',''),(52,'Nấm Hoàng Kim Tươi',4,6,_binary '',''),(53,'Nấm Mỡ Nâu Tươi',4,6,_binary '',''),(54,'Nấm Đùi Gà Baby Tươi',4,3,_binary '',''),(55,'Nấm Linh Chi Nâu Hàn Quốc Tươi',4,4,_binary '',''),(56,'Nấm Kim Châm Tươi (VN)',4,3,_binary '',''),(57,'Nấm Linh Chi Trắng Hàn Quốc Tươi',4,7,_binary '',''),(58,'Nấm Hầu Thủ Tươi',4,6,_binary '',''),(59,'Nấm Rơm Khô (Búp)',5,3,_binary '',''),(60,'Nấm Hương Khô – Nấm Đông Cô Khô',5,3,_binary '',''),(61,'Đông Trùng Hạ Thảo Khô Sấy Thăng Hoa',8,7,_binary '',''),(62,'Nấm Bụng Dê Khô – Nấm Morel Khô',5,3,_binary '',''),(64,'Chà Bông Nấm Hương Nguyên Vị',7,7,_binary '',''),(68,'Chân Nấm Hương Khô',5,4,_binary '',''),(69,'Nấm Hầu Thủ Khô',5,6,_binary '',''),(70,'Nấm Bào Ngư Xám Khô',5,4,_binary '',''),(71,'Nấm Tuyết Khô (Nguyên Bông)',5,4,_binary '',''),(72,'Nấm Mèo Sợi – Nấm Mộc Nhĩ Thái Sợi',5,7,_binary '',''),(73,'Nấm Mối Đen Sấy Thăng Hoa',5,6,_binary '',''),(74,'Nấm Sò Trắng Khô',5,4,_binary '',''),(75,'Bào Tử Nấm Linh Chi Đỏ',8,4,_binary '',''),(76,'Bột Nấm Mèo – Bột Nấm Mộc Nhĩ',9,7,_binary '',''),(77,'Bột Nấm Rơm',9,7,_binary '',''),(78,'Chà Bông Nấm Hương Cháy Tỏi',7,4,_binary '',''),(79,'Bột Nấm Bào Ngư Xám',9,4,_binary '',''),(80,'Nấm Linh Chi Đỏ Thái Lát',8,7,_binary '',''),(81,'Bột Nấm Linh Chi Đỏ',8,7,_binary '',''),(82,'Nấm Linh Chi Đỏ Nguyên Tai',8,4,_binary '',''),(83,'Nấm Tâm Trúc Khô – Nấm Trúc Sanh Khô',5,4,_binary '',''),(84,'Nấm Mối Khô (Tự Nhiên)',5,6,_binary '',''),(87,'Nấm Mối Tươi Búp Tự Nhiên',4,6,_binary '\0',''),(88,'Nấm Ma',5,2,_binary '\0',''),(89,'Nấm Chân Dài Tươi – Nấm Loa Kèn Tươi',4,6,_binary '','');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-23 17:51:16
