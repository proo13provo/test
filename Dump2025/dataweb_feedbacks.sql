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
-- Table structure for table `feedbacks`
--

DROP TABLE IF EXISTS `feedbacks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedbacks` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `comment` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `id_order_detail` int DEFAULT NULL,
  `rating_rank` int NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_detail` (`id_order_detail`),
  CONSTRAINT `fk_order_detail` FOREIGN KEY (`id_order_detail`) REFERENCES `order_details` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedbacks`
--

LOCK TABLES `feedbacks` WRITE;
/*!40000 ALTER TABLE `feedbacks` DISABLE KEYS */;
INSERT INTO `feedbacks` VALUES (1,'Ngon','2025-03-29',85,5,'Sẽ mua tiếp'),(2,'TUyệt vời','2025-03-29',68,5,'Ngon lắm'),(3,'Khá tệ','2025-03-29',68,5,'Cần cải thiện'),(5,'Dở','2025-03-29',54,3,'Cần làm sạch'),(6,'Lần sau sẽ ủng hộ','2025-04-01',98,5,'Ngon'),(10,'ádasdasd','2025-04-04',107,5,'Mới'),(11,'ádasdasdasd','2025-04-04',103,5,'Mới'),(12,'Ngon','2025-04-04',63,5,'Mới'),(13,'ádkajhsdkjahskdjhas','2025-04-07',37,5,'Mới'),(14,'Ngon nha, lần sau sẽ ủng hộ','2025-04-07',100,3,'Mới'),(15,'Ngon lắm nhaa, mọi người nên mua','2025-04-09',102,4,'Đã sử dụng');
/*!40000 ALTER TABLE `feedbacks` ENABLE KEYS */;
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
