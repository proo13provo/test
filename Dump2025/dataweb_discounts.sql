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
-- Table structure for table `discounts`
--

DROP TABLE IF EXISTS `discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discounts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `discountCode` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Mã giảm giá',
  `discountPercentage` float DEFAULT '0' COMMENT 'Phần trăm giảm giá',
  `discountAmount` float DEFAULT '0' COMMENT 'Số tiền giảm giá (nếu có)',
  `startDate` datetime NOT NULL COMMENT 'Ngày bắt đầu có hiệu lực',
  `endDate` datetime NOT NULL COMMENT 'Ngày kết thúc',
  `isActive` bit(1) DEFAULT b'1' COMMENT 'Trạng thái hoạt động của mã giảm giá',
  `minOrderAmount` float DEFAULT '0' COMMENT 'Số tiền tối thiểu áp dụng giảm giá',
  PRIMARY KEY (`id`),
  UNIQUE KEY `discountCode` (`discountCode`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discounts`
--

LOCK TABLES `discounts` WRITE;
/*!40000 ALTER TABLE `discounts` DISABLE KEYS */;
INSERT INTO `discounts` VALUES (1,'SUMMER10',10,0,'2025-04-01 00:00:00','2025-06-30 23:59:59',_binary '',200000),(2,'FREESHIP50',0,50000,'2025-04-01 00:00:00','2025-04-30 23:59:59',_binary '',100000),(3,'WELCOME15',15,0,'2025-03-01 00:00:00','2025-12-31 23:59:59',_binary '',500000),(4,'VIP20',20,0,'2025-05-01 00:00:00','2025-07-01 23:59:59',_binary '',1000000),(5,'SALE30',30,0,'2025-08-01 00:00:00','2025-08-31 23:59:59',_binary '',300000),(6,'NEWYEAR50',50,0,'2025-12-25 00:00:00','2026-01-05 23:59:59',_binary '',500000),(7,'BACK2SCHOOL',10,0,'2025-09-01 00:00:00','2025-09-15 23:59:59',_binary '',200000),(8,'BLACKFRIDAY',40,0,'2025-04-01 00:00:00','2025-11-29 23:59:59',_binary '',400000),(9,'CYBERMONDAY',35,0,'2025-12-01 00:00:00','2025-12-02 23:59:59',_binary '',250000),(10,'FLASHSALE100',0,100000,'2025-07-10 00:00:00','2025-07-11 23:59:59',_binary '',500000);
/*!40000 ALTER TABLE `discounts` ENABLE KEYS */;
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
