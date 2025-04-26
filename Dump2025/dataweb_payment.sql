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
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idUser` int DEFAULT NULL,
  `idOrder` int DEFAULT NULL,
  `methodPayment` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idUser` (`idUser`),
  KEY `idOrder` (`idOrder`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`),
  CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`idOrder`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (22,5,30,'COD-Thanh toán khi nhận hàng'),(23,1,33,'COD-Thanh toán khi nhận hàng'),(24,3,34,'MOMO-Thanh toán MOMO'),(25,2,35,'COD-Thanh toán khi nhận hàng'),(26,3,36,'COD-Thanh toán khi nhận hàng'),(27,3,37,'COD-Thanh toán khi nhận hàng'),(28,2,38,'COD-Thanh toán khi nhận hàng'),(29,1,45,'BANK-Chuyển khoản ngân hàng'),(30,1,46,'BANK-Chuyển khoản ngân hàng'),(31,2,47,'COD-Thanh toán khi nhận hàng'),(32,3,48,'COD-Thanh toán khi nhận hàng'),(33,3,49,'COD-Thanh toán khi nhận hàng'),(34,2,50,'COD-Thanh toán khi nhận hàng'),(35,3,51,'COD-Thanh toán khi nhận hàng'),(36,7,52,'COD-Thanh toán khi nhận hàng'),(37,7,53,'COD-Thanh toán khi nhận hàng'),(38,7,54,'BANK-Chuyển khoản ngân hàng'),(39,7,55,'COD-Thanh toán khi nhận hàng'),(40,7,56,'BANK-Chuyển khoản ngân hàng'),(41,7,57,'COD-Thanh toán khi nhận hàng'),(42,7,58,'COD-Thanh toán khi nhận hàng'),(43,7,59,'BANK-Chuyển khoản ngân hàng'),(44,7,60,'MOMO-Thanh toán MOMO'),(45,7,61,'BANK-Chuyển khoản ngân hàng'),(46,7,62,NULL),(47,20,63,'BANK-Chuyển khoản ngân hàng'),(48,3,64,'COD-Thanh toán khi nhận hàng'),(49,3,65,'COD-Thanh toán khi nhận hàng'),(50,20,66,'COD-Thanh toán khi nhận hàng'),(51,20,67,'MOMO-Thanh toán MOMO'),(52,23,68,'COD-Thanh toán khi nhận hàng'),(53,22,69,'COD-Thanh toán khi nhận hàng'),(54,22,70,'COD-Thanh toán khi nhận hàng'),(55,22,71,'COD-Thanh toán khi nhận hàng'),(56,22,72,'COD-Thanh toán khi nhận hàng'),(57,22,73,'COD-Thanh toán khi nhận hàng'),(58,26,74,'COD-Thanh toán khi nhận hàng'),(59,26,75,'COD-Thanh toán khi nhận hàng'),(60,26,76,'COD-Thanh toán khi nhận hàng'),(61,26,77,'MOMO-Thanh toán MOMO'),(62,26,78,'COD-Thanh toán khi nhận hàng'),(63,26,79,'COD-Thanh toán khi nhận hàng'),(64,27,80,'BANK-Chuyển khoản ngân hàng'),(65,27,81,'BANK-Chuyển khoản ngân hàng'),(66,31,82,'COD-Thanh toán khi nhận hàng'),(67,31,83,'MOMO-Thanh toán MOMO'),(68,31,84,'on'),(69,23,85,'on'),(70,31,86,'on'),(71,31,87,NULL),(72,31,88,NULL);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-23 17:51:17
