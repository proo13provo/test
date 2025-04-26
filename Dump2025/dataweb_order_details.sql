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
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idOrder` int DEFAULT NULL,
  `idProduct` int DEFAULT NULL,
  `quantity` int NOT NULL,
  `price` int NOT NULL,
  `nameProduct` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `weight` double NOT NULL,
  `isRated` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idOrder` (`idOrder`),
  KEY `idProduct` (`idProduct`),
  CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`idOrder`) REFERENCES `orders` (`id`),
  CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`idProduct`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (37,30,46,6,39000,'Nấm Đùi Gà Tươi (L1)',0,1),(38,30,56,32,29000,'Nấm Kim Châm Tươi (VN)',0,0),(39,30,57,24,35000,'Nấm Linh Chi Trắng Hàn Quốc Tươi',0,0),(40,33,44,24,22000,'Nấm Bào Ngư Xám Tươi',0,0),(41,33,46,4,89000,'Nấm Đùi Gà Tươi (L1)',0,0),(42,33,47,6,58000,'Nấm Hương Tươi – Nấm Đông Cô Tươi',0,0),(43,33,57,12,35000,'Nấm Linh Chi Trắng Hàn Quốc Tươi',0,0),(44,34,52,10,19000,'Nấm Hoàng Kim Tươi',0,0),(45,34,50,13,50000,'Nấm Mối Đen Tươi (L1)',0,0),(46,34,46,6,39000,'Nấm Đùi Gà Tươi (L1)',0,0),(47,35,46,6,39000,'Nấm Đùi Gà Tươi (L1)',0,0),(48,35,54,12,30000,'Nấm Đùi Gà Baby Tươi',0,0),(49,36,44,12,22000,'Nấm Bào Ngư Xám Tươi',0,0),(50,36,46,6,39000,'Nấm Đùi Gà Tươi (L1)',0,0),(51,37,44,12,22000,'Nấm Bào Ngư Xám Tươi',0,0),(52,38,57,12,35000,'Nấm Linh Chi Trắng Hàn Quốc Tươi',0,0),(53,45,52,10,19000,'Nấm Hoàng Kim Tươi',0,0),(54,46,56,8,29000,'Nấm Kim Châm Tươi (VN)',0,0),(55,47,61,5,3440000,'Đông Trùng Hạ Thảo Khô Sấy Thăng Hoa',0,0),(56,48,54,12,30000,'Nấm Đùi Gà Baby Tươi',0,0),(57,48,54,13,73000,'Nấm Đùi Gà Baby Tươi',0,0),(58,49,58,6,80000,'Nấm Hầu Thủ Tươi',0,0),(59,50,44,12,22000,'Nấm Bào Ngư Xám Tươi',0,0),(60,50,59,5,1080000,'Nấm Rơm Khô (Búp)',0,0),(61,51,44,12,22000,'Nấm Bào Ngư Xám Tươi',0,1),(62,52,44,12,22000,'Nấm Bào Ngư Xám Tươi',0,0),(63,53,44,7,22000,'Nấm Bào Ngư Xám Tươi',0,0),(64,54,62,2,1756000,'Nấm Bụng Dê Khô – Nấm Morel Khô',0,0),(65,55,62,2,1756000,'Nấm Bụng Dê Khô – Nấm Morel Khô',0,0),(66,56,62,2,1756000,'Nấm Bụng Dê Khô – Nấm Morel Khô',0,0),(67,57,62,2,1756000,'Nấm Bụng Dê Khô – Nấm Morel Khô',0,0),(68,58,62,2,1756000,'Nấm Bụng Dê Khô – Nấm Morel Khô',0,0),(69,59,64,3,500000,'Chà Bông Nấm Hương Nguyên Vị',0,0),(70,60,64,3,500000,'Chà Bông Nấm Hương Nguyên Vị',0,0),(71,61,55,1,120000,'Nấm Linh Chi Nâu Hàn Quốc Tươi',0,0),(72,62,50,1,50000,'Nấm Mối Đen Tươi (L1)',0,0),(73,63,44,1,22000,'Nấm Bào Ngư Xám Tươi',0,0),(74,63,46,3,165000,'Nấm Đùi Gà Tươi (L1)',0,0),(75,64,62,4,1756000,'Nấm Bụng Dê Khô – Nấm Morel Khô',0,0),(76,65,59,1,230000,'Nấm Rơm Khô (Búp)',0,0),(77,66,60,1,116000,'Nấm Hương Khô – Nấm Đông Cô Khô',0,0),(78,67,46,1,39000,'Nấm Đùi Gà Tươi (L1)',0,0),(79,68,56,1,29000,'Nấm Kim Châm Tươi (VN)',0,0),(80,69,54,1,30000,'Nấm Đùi Gà Baby Tươi',0,0),(81,70,44,1,23000,'Nấm Bào Ngư Xám Tươi',0,0),(82,71,54,1,30000,'Nấm Đùi Gà Baby Tươi',0,0),(83,72,57,1,35000,'Nấm Linh Chi Trắng Hàn Quốc Tươi',0,0),(84,72,57,1,102000,'Nấm Linh Chi Trắng Hàn Quốc Tươi',0,0),(85,73,44,1,23000,'Nấm Bào Ngư Xám Tươi',0,0),(86,73,44,1,85000,'Nấm Bào Ngư Xám Tươi',500,0),(87,73,46,1,89000,'Nấm Đùi Gà Tươi (L1)',0,0),(88,74,44,1,48000,'Nấm Bào Ngư Xám Tươi',0,0),(89,74,46,1,165000,'Nấm Đùi Gà Tươi (L1)',0,0),(90,75,44,1,48000,'Nấm Bào Ngư Xám Tươi',0,0),(91,75,46,1,89000,'Nấm Đùi Gà Tươi (L1)',0,0),(92,76,56,1,29000,'Nấm Kim Châm Tươi (VN)',0,0),(93,77,56,1,29000,'Nấm Kim Châm Tươi (VN)',0,0),(94,78,56,1,29000,'Nấm Kim Châm Tươi (VN)',0,0),(95,79,56,3,29000,'Nấm Kim Châm Tươi (VN)',0,0),(96,80,44,1,48000,'Nấm Bào Ngư Xám Tươi',0,0),(97,81,75,1,6000000,'Bào Tử Nấm Linh Chi Đỏ',0,0),(98,82,46,1,89000,'Nấm Đùi Gà Tươi (L1)',0,0),(99,82,47,1,135000,'Nấm Hương Tươi – Nấm Đông Cô Tươi',0,0),(100,83,46,2,89000,'Nấm Đùi Gà Tươi (L1)',0,1),(101,83,60,1,280000,'Nấm Hương Khô – Nấm Đông Cô Khô',0,0),(102,83,47,1,135000,'Nấm Hương Tươi – Nấm Đông Cô Tươi',0,1),(103,84,44,1,48000,'Nấm Bào Ngư Xám Tươi',0,0),(104,84,46,1,165000,'Nấm Đùi Gà Tươi (L1)',0,0),(105,84,62,1,4360000,'Nấm Bụng Dê Khô – Nấm Morel Khô',0,0),(106,85,44,1,23000,'Nấm Bào Ngư Xám Tươi',0,0),(107,86,60,1,280000,'Nấm Hương Khô – Nấm Đông Cô Khô',500,1);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-23 17:51:15
