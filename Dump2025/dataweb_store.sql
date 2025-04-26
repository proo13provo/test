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
-- Table structure for table `store`
--

DROP TABLE IF EXISTS `store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store` (
  `id` int NOT NULL AUTO_INCREMENT,
  `store_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `address` text COLLATE utf8mb4_general_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store`
--

LOCK TABLES `store` WRITE;
/*!40000 ALTER TABLE `store` DISABLE KEYS */;
INSERT INTO `store` VALUES (1,'Cửa Hàng Sài Gòn 1','1 Lê Lợi, Quận 1, TP.HCM','0903000001','2025-03-23 17:00:00'),(2,'Cửa Hàng Sài Gòn 2','2 Nguyễn Huệ, Quận 1, TP.HCM','0903000002','2025-03-23 17:00:00'),(3,'Cửa Hàng Tân Bình','3 Trường Chinh, Quận Tân Bình, TP.HCM','0903000003','2025-03-23 17:00:00'),(4,'Cửa Hàng Gò Vấp','4 Quang Trung, Quận Gò Vấp, TP.HCM','0903000004','2025-03-23 17:00:00'),(5,'Cửa Hàng Quận 3','5 Cách Mạng Tháng 8, Quận 3, TP.HCM','0903000005','2025-03-23 17:00:00'),(6,'Cửa Hàng Quận 7','6 Nguyễn Văn Linh, Quận 7, TP.HCM','0903000006','2025-03-23 17:00:00'),(7,'Cửa Hàng Đà Nẵng 1','7 Lê Duẩn, Quận Hải Châu, Đà Nẵng','0903000007','2025-03-23 17:00:00'),(8,'Cửa Hàng Đà Nẵng 2','8 Nguyễn Văn Thoại, Quận Ngũ Hành Sơn, Đà Nẵng','0903000008','2025-03-23 17:00:00'),(9,'Cửa Hàng Thanh Khê','9 Điện Biên Phủ, Quận Thanh Khê, Đà Nẵng','0903000009','2025-03-23 17:00:00'),(10,'Cửa Hàng Huế','10 Hùng Vương, TP. Huế','0903000010','2025-03-23 17:00:00'),(11,'Cửa Hàng Hoàn Kiếm','11 Trần Phú, Quận Hoàn Kiếm, Hà Nội','0903000011','2025-03-23 17:00:00'),(12,'Cửa Hàng Thanh Xuân','12 Nguyễn Trãi, Quận Thanh Xuân, Hà Nội','0903000012','2025-03-23 17:00:00'),(13,'Cửa Hàng Cầu Giấy','13 Cầu Giấy, Quận Cầu Giấy, Hà Nội','0903000013','2025-03-23 17:00:00'),(14,'Cửa Hàng Xuân Thủy','14 Xuân Thủy, Quận Cầu Giấy, Hà Nội','0903000014','2025-03-23 17:00:00'),(15,'Cửa Hàng Long Biên','15 Nguyễn Văn Cừ, Quận Long Biên, Hà Nội','0903000015','2025-03-23 17:00:00');
/*!40000 ALTER TABLE `store` ENABLE KEYS */;
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
