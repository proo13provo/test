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
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idUser` int DEFAULT NULL,
  `totalPrice` double NOT NULL,
  `isPaid` bit(1) DEFAULT b'0',
  `createDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `receiveDate` datetime DEFAULT NULL,
  `receiveAddress` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `isActive` int DEFAULT '1',
  `idShipping` int DEFAULT NULL,
  `idDiscount` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idUser` (`idUser`),
  KEY `fk_orders_discount` (`idDiscount`),
  CONSTRAINT `fk_orders_discount` FOREIGN KEY (`idDiscount`) REFERENCES `discounts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (30,5,1908040,_binary '\0','2024-12-31 19:29:53',NULL,'Nguyễn Bùi Hoàng VU, 09090900, jkjkjk@gmail.com, sadasd, Quận 3, Hồ Chí Minh. Notes: ádasdasdasd',3,1,NULL),(33,1,1572000,_binary '\0','2025-01-01 09:49:51',NULL,'Nguyễn Bùi Hoàng Vũ, 0868032463, hoangvu@gmail.com, 23, Đống Đa, Hà Nội',3,1,NULL),(34,3,1031120,_binary '\0','2025-01-01 09:51:55',NULL,'Nguyễn Bùi Hoàng Vũ, 0868032463, hoangvu@gmail.com, 23, Ninh Kiều, Cần Thơ',3,1,NULL),(35,2,578520,_binary '\0','2025-01-01 09:59:40',NULL,'Nguyễn Bùi Hoàng Vũ, 0868032463, hoangvu031020400@gmail.com, 32, Liên Chiểu, Đà Nẵng',2,1,NULL),(36,3,482760,_binary '\0','2025-01-01 10:09:00',NULL,'hkjashdkjh, 09898078, hjkhk@gmail.com, 43, Sơn Trà, Đà Nẵng',1,1,NULL),(37,3,253440,_binary '\0','2025-01-01 10:32:44',NULL,'Nguyễn Bùi Honagf Vu, 097898987, hoan@gmail.com, 23, Quận 2, Hồ Chí Minh',1,1,NULL),(38,2,403200,_binary '\0','2025-01-01 10:35:51',NULL,'dsfsdfsdf, 87234923, hh@gmail.com, 23, Quận 2, Hồ Chí Minh',0,1,NULL),(45,1,184300,_binary '\0','2025-01-04 08:39:08',NULL,'ádasdasd, 0867867654, nmbmn@gmail.com, 34234, Quận 4, Hồ Chí Minh. Notes: Giao chậm',1,1,NULL),(46,1,218080,_binary '\0','2025-01-04 08:46:45',NULL,'asdasdasd, 0875674574, hjkk@gmail.com, 24, Quận 3, Hồ Chí Minh. Notes: Giao nhanh',0,1,NULL),(47,2,15480000,_binary '\0','2025-01-05 16:12:24',NULL,'Nguyễn Bùi Hoàng Vũ, 0907440304, hoangvu@gmail.com, 199, Quận 1, Hồ Chí Minh. Notes: Che tên',1,1,NULL),(48,3,1269730,_binary '\0','2025-01-05 19:16:43',NULL,'Hoàng Vũ, 09780037978, hoangvu@gmail.com, 24, Quận 3, Hồ Chí Minh. Notes: Giao nhanh',1,1,NULL),(49,3,470400,_binary '\0','2025-01-05 20:55:44',NULL,'Hoangf Vux, 0988779878, hoangvu@gmail.com, 23, Quận 2, Hồ Chí Minh',3,1,NULL),(50,2,5383440,_binary '\0','2025-01-06 08:15:27',NULL,'Hoàng Vũ, 0868032463, hoangvu@gmail.com, 24, Quận 2, Hồ Chí Minh. Notes: Giao nhanh lên nhé',1,1,NULL),(51,3,253440,_binary '\0','2025-01-06 12:28:33',NULL,'NGadas, 908390284, jlkj@gmail.com, 23, Liên Chiểu, Đà Nẵng',1,1,NULL),(52,7,253440,_binary '\0','2025-01-07 17:03:01',NULL,'Nguyen Bui Honagf , 324234, hhh@gmail.com, qưe, Quận 4, Hồ Chí Minh',1,1,NULL),(53,7,147840,_binary '\0','2025-01-12 22:51:24',NULL,'Dung, 0909399199, hoangvu@gmail.com, Khu thảo điền , Quận 2, Hồ Chí Minh. Notes: Giao nhanh nha',1,1,NULL),(54,7,3301280,_binary '\0','2025-01-12 23:40:55',NULL,'Hoàng VŨ, 0909999999, hoangvu@gmail.com, 23, Quận 3, Hồ Chí Minh. Notes: Giao nhanh hộ ',1,1,NULL),(55,7,3301280,_binary '\0','2025-01-12 23:43:26',NULL,'Hoàng Vũ, 0909009009, hoangvu@gmail.com, 23, Sơn Trà, Đà Nẵng',1,1,NULL),(56,7,3301280,_binary '\0','2025-01-12 23:52:36',NULL,'Hoangf , 34234234, oijlWQ@gmail.com, 22, Quận 2, Hồ Chí Minh. Notes: asd',1,1,NULL),(57,7,3301280,_binary '\0','2025-01-12 23:56:07',NULL,'Hoàng , 3434433, hojk@gmail.com, 22, Quận 2, Hồ Chí Minh. Notes: s',1,1,NULL),(58,7,3301280,_binary '\0','2025-01-12 23:57:36',NULL,'Hoo, 09090909, jkkj@gmail.com, 223, Liên Chiểu, Đà Nẵng. Notes: 23',1,1,NULL),(59,7,1470000,_binary '\0','2025-01-13 00:07:00',NULL,'Hoàng Vũ, 0868032463, vufit2004@icloud.com, 23, Ninh Kiều, Cần Thơ. Notes: Giao nhanh nhé',1,1,NULL),(60,7,1470000,_binary '\0','2025-01-13 00:09:25',NULL,'Hoàng , 09090900, hjkjkkjk@gmail.com, 23, Quận 3, Hồ Chí Minh. Notes: ádasdasdasd',1,1,NULL),(61,7,116400,_binary '\0','2025-01-13 00:15:48',NULL,'Hoàng Vu, 0900909090, haiadasd@gmail.com, 32, Quận 3, Hồ Chí Minh. Notes: sédsdsd',1,1,NULL),(62,7,47500,_binary '\0','2025-01-13 00:42:36',NULL,'asdasdas, 2313, jhjh@gmail.com, asdasd, Sơn Trà, Đà Nẵng',1,1,NULL),(63,20,491370,_binary '\0','2025-01-13 14:17:16',NULL,'Nguyên Bùi Hoàng Vũ, 0868032463, hvunguyen@icloud.com, 1222, Hoàn Kiếm, Hà Nội. Notes: Giao nhanh hộ nha',1,1,NULL),(64,3,6602560,_binary '\0','2025-01-14 19:30:09',NULL,'Nguyên Bùi Hoàng Vũ, 0868032463, hvunguyen@icloud.com, 1222, Hoàn Kiếm, Hà Nội. Notes: Giao nhanh',1,1,NULL),(65,3,220800,_binary '\0','2025-01-15 01:06:24',NULL,'Nguyên Bùi Hoàng Vũ, 0868032463, hvunguyen@icloud.com, 1222, Ba Đình, Hà Nội',1,1,NULL),(66,20,114840,_binary '\0','2025-01-15 01:08:55',NULL,'Nguyên Bùi Hoàng Vũ, 0868032463, hvunguyen@icloud.com, 1222, Ba Đình, Hà Nội',1,1,NULL),(67,20,38220,_binary '\0','2025-01-15 01:11:08',NULL,'Nguyên Bùi Hoàng Vũ, 0868032463, hvunguyen@icloud.com, 1222, Hoàn Kiếm, Hà Nội',1,8,NULL),(68,23,27260,_binary '\0','2025-01-17 01:20:07',NULL,'Nguyên Bùi Hoàng Vũ, 0868032463, hvunguyen@icloud.com, 1222, Hoàn Kiếm, Hà Nội. Notes: asdasdasd',1,9,NULL),(69,22,29100,_binary '\0','2025-01-17 01:28:06',NULL,'Nguyên Bùi Hoàng Vũ, 0868032463, hvunguyen@icloud.com, 1222, Ba Đình, Hà Nội. Notes: sss',1,8,NULL),(70,22,22310,_binary '\0','2025-01-17 01:29:24',NULL,'Nguyên Bùi Hoàng Vũ, 0868032463, hvunguyen@icloud.com, 1222, Ba Đình, Hà Nội. Notes: s',1,8,NULL),(71,22,129100,_binary '\0','2025-01-17 01:33:56',NULL,'Nguyên Bùi Hoàng Vũ, 0868032463, hvunguyen@icloud.com, 1222, Hoàn Kiếm, Hà Nội',1,8,NULL),(72,22,142540,_binary '\0','2025-01-17 01:37:28',NULL,'Nguyên Bùi Hoàng Vũ, 0868032463, hvunguyen@icloud.com, 1222, Ba Đình, Hà Nội. Notes: àdasf',1,9,NULL),(73,22,219022,_binary '\0','2025-01-17 09:44:15',NULL,'Nguyên Bùi Hoàng Vũ, 0868032463, hvunguyen@icloud.com, 1222, Hoàn Kiếm, Hà Nội',2,3,NULL),(74,26,234572,_binary '\0','2025-03-22 03:42:38',NULL,'Nguyên Bùi Hoàng Vũ, 0868032463, hvunguyen@icloud.com, 1222, Hoàn Kiếm, Hà Nội. Notes: vx',1,3,NULL),(75,26,163262,_binary '\0','2025-03-22 03:43:33',NULL,'Nguyên Bùi Hoàng Vũ, 0868032463, hvunguyen@icloud.com, 1222, Hoàn Kiếm, Hà Nội. Notes: fvxcv',1,3,NULL),(76,26,59482,_binary '\0','2025-03-22 03:46:37',NULL,'Nguyên Bùi Hoàng Vũ, 0868032463, hvunguyen@icloud.com, 1222, Cầu Giấy, Hà Nội. Notes: asdasd',1,3,NULL),(77,26,59482,_binary '\0','2025-03-22 03:50:28',NULL,'Nguyên Bùi Hoàng Vũ, 0868032463, hvunguyen@icloud.com, 1222, Cầu Giấy, Hà Nội. Notes: asda',1,3,NULL),(78,26,37260,_binary '\0','2025-03-22 03:54:42',NULL,'Nguyên Bùi Hoàng Vũ, 0868032463, hvunguyen@icloud.com, 1222, Đống Đa, Hà Nội',1,9,NULL),(79,26,114002,_binary '\0','2025-03-22 04:08:00',NULL,'Nguyên Bùi Hoàng Vũ, 0868032463, hvunguyen@icloud.com, 1222, Hoàn Kiếm, Hà Nội. Notes: asd',1,3,NULL),(80,27,77822,_binary '\0','2025-03-22 06:46:01',NULL,'Nguyên Bùi Hoàng Vũ, 0868032463, hvunguyen@icloud.com, 1222, Đống Đa, Hà Nội',1,3,NULL),(81,27,349923000,_binary '\0','2025-03-22 10:11:40',NULL,'adasd, 0868032463, hao@gmail.com, 123, Ba Đình, Hà Nội. Notes: ádasdasd',1,13,NULL),(82,31,225040,_binary '\0','2025-03-27 20:16:23',NULL,'Nguyên Bùi Hoàng Vũ, 0868032463, hvunguyen@icloud.com, 1222, Hoàn Kiếm, Hà Nội',1,9,NULL),(83,31,604302,_binary '\0','2025-03-27 23:16:19',NULL,'Nguyên Bùi Hoàng Vũ, 0868032463, hvunguyen@icloud.com, 1222, Đống Đa, Hà Nội',1,3,NULL),(84,31,4332972,_binary '\0','2025-03-31 23:09:50',NULL,'Nguyên Bùi Hoàng Vũ, 0868032463, hvunguyen@icloud.com, 1222, 892, 89',1,3,NULL),(85,23,122310,_binary '\0','2025-03-31 23:15:32',NULL,'Nguyên Bùi Hoàng Vũ, 0868032463, hvunguyen@icloud.com, 1222, 889, 89',1,8,NULL),(86,31,303822,_binary '\0','2025-03-31 23:17:06',NULL,'Nguyên Bùi Hoàng Vũ, 0868032463, hvunguyen@icloud.com, 1222, Huyện Long Điền, Tỉnh Bà Rịa - Vũng Tàu',1,3,NULL),(87,31,237180,_binary '\0','2025-04-07 09:47:51',NULL,'Nguyên Bùi Hoàng Vũ, 0868032463, hvunguyen@icloud.com, 1222, Huyện Châu Đức, Tỉnh Bà Rịa - Vũng Tàu',1,8,NULL),(88,31,237180,_binary '\0','2025-04-07 09:48:14',NULL,'Nguyên Bùi Hoàng Vũ, 0868032463, hvunguyen@icloud.com, 1222, Huyện Châu Đức, Tỉnh Bà Rịa - Vũng Tàu',1,8,NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
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
