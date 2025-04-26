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
-- Table structure for table `transactionhistory`
--

DROP TABLE IF EXISTS `transactionhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactionhistory` (
  `idHistory` int NOT NULL AUTO_INCREMENT,
  `transactionDate` date NOT NULL,
  `totalPrice` float NOT NULL,
  `idOrder` int DEFAULT NULL,
  `idUser` int DEFAULT NULL,
  `paymentMethod` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `shippingAddress` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`idHistory`),
  KEY `idOrder` (`idOrder`),
  KEY `idUser` (`idUser`),
  CONSTRAINT `transactionhistory_ibfk_1` FOREIGN KEY (`idOrder`) REFERENCES `orders` (`id`),
  CONSTRAINT `transactionhistory_ibfk_2` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactionhistory`
--

LOCK TABLES `transactionhistory` WRITE;
/*!40000 ALTER TABLE `transactionhistory` DISABLE KEYS */;
INSERT INTO `transactionhistory` VALUES (11,'2025-01-05',1572000,33,1,'COD-Thanh toán khi nhận hàng','Nguyễn Bùi Hoàng Vũ, 0868032463, hoangvu@gmail.com, 23, Đống Đa, Hà Nội'),(12,'2025-01-05',1031120,34,3,'MOMO-Thanh toán MOMO','Nguyễn Bùi Hoàng Vũ, 0868032463, hoangvu@gmail.com, 23, Ninh Kiều, Cần Thơ'),(13,'2025-01-05',578520,35,2,'COD-Thanh toán khi nhận hàng','Nguyễn Bùi Hoàng Vũ, 0868032463, hoangvu031020400@gmail.com, 32, Liên Chiểu, Đà Nẵng'),(14,'2025-01-05',482760,36,3,'COD-Thanh toán khi nhận hàng','hkjashdkjh, 09898078, hjkhk@gmail.com, 43, Sơn Trà, Đà Nẵng'),(15,'2025-01-05',253440,37,3,'COD-Thanh toán khi nhận hàng','Nguyễn Bùi Honagf Vu, 097898987, hoan@gmail.com, 23, Quận 2, Hồ Chí Minh'),(16,'2025-01-05',403200,38,2,'COD-Thanh toán khi nhận hàng','dsfsdfsdf, 87234923, hh@gmail.com, 23, Quận 2, Hồ Chí Minh'),(17,'2025-01-08',184300,45,1,'BANK-Chuyển khoản ngân hàng','ádasdasd, 0867867654, nmbmn@gmail.com, 34234, Quận 4, Hồ Chí Minh. Notes: Giao chậm'),(18,'2025-01-08',218080,46,1,'BANK-Chuyển khoản ngân hàng','asdasdasd, 0875674574, hjkk@gmail.com, 24, Quận 3, Hồ Chí Minh. Notes: Giao nhanh'),(19,'2025-01-09',15480000,47,2,'COD-Thanh toán khi nhận hàng','Nguyễn Bùi Hoàng Vũ, 0907440304, hoangvu@gmail.com, 199, Quận 1, Hồ Chí Minh. Notes: Che tên'),(20,'2025-01-09',1269730,48,3,'COD-Thanh toán khi nhận hàng','Hoàng Vũ, 09780037978, hoangvu@gmail.com, 24, Quận 3, Hồ Chí Minh. Notes: Giao nhanh'),(21,'2025-01-09',470400,49,3,'COD-Thanh toán khi nhận hàng','Hoangf Vux, 0988779878, hoangvu@gmail.com, 23, Quận 2, Hồ Chí Minh'),(22,'2025-01-10',5383440,50,2,'COD-Thanh toán khi nhận hàng','Hoàng Vũ, 0868032463, hoangvu@gmail.com, 24, Quận 2, Hồ Chí Minh. Notes: Giao nhanh lên nhé'),(23,'2025-01-10',253440,51,3,'COD-Thanh toán khi nhận hàng','NGadas, 908390284, jlkj@gmail.com, 23, Liên Chiểu, Đà Nẵng'),(24,'2025-01-11',253440,52,7,'COD-Thanh toán khi nhận hàng','Nguyen Bui Honagf , 324234, hhh@gmail.com, qưe, Quận 4, Hồ Chí Minh'),(25,'2025-01-16',147840,53,7,'COD-Thanh toán khi nhận hàng','Dung, 0909399199, hoangvu@gmail.com, Khu thảo điền , Quận 2, Hồ Chí Minh. Notes: Giao nhanh nha'),(35,'2025-01-17',491370,63,20,'BANK-Chuyển khoản ngân hàng','Nguyên Bùi Hoàng Vũ, 0868032463, hvunguyen@icloud.com, 1222, Hoàn Kiếm, Hà Nội. Notes: Giao nhanh hộ nha'),(36,'2025-01-18',6602560,64,3,'COD-Thanh toán khi nhận hàng','Nguyên Bùi Hoàng Vũ, 0868032463, hvunguyen@icloud.com, 1222, Hoàn Kiếm, Hà Nội. Notes: Giao nhanh'),(37,'2025-01-19',220800,65,3,'COD-Thanh toán khi nhận hàng','Nguyên Bùi Hoàng Vũ, 0868032463, hvunguyen@icloud.com, 1222, Ba Đình, Hà Nội'),(38,'2025-01-19',114840,66,20,'COD-Thanh toán khi nhận hàng','Nguyên Bùi Hoàng Vũ, 0868032463, hvunguyen@icloud.com, 1222, Ba Đình, Hà Nội'),(39,'2025-01-19',38220,67,20,'MOMO-Thanh toán MOMO','Nguyên Bùi Hoàng Vũ, 0868032463, hvunguyen@icloud.com, 1222, Hoàn Kiếm, Hà Nội'),(40,'2025-01-21',27260,68,23,'COD-Thanh toán khi nhận hàng','Nguyên Bùi Hoàng Vũ, 0868032463, hvunguyen@icloud.com, 1222, Hoàn Kiếm, Hà Nội. Notes: asdasdasd'),(41,'2025-01-21',29100,69,22,'COD-Thanh toán khi nhận hàng','Nguyên Bùi Hoàng Vũ, 0868032463, hvunguyen@icloud.com, 1222, Ba Đình, Hà Nội. Notes: sss'),(42,'2025-01-21',22310,70,22,'COD-Thanh toán khi nhận hàng','Nguyên Bùi Hoàng Vũ, 0868032463, hvunguyen@icloud.com, 1222, Ba Đình, Hà Nội. Notes: s'),(43,'2025-01-21',129100,71,22,'COD-Thanh toán khi nhận hàng','Nguyên Bùi Hoàng Vũ, 0868032463, hvunguyen@icloud.com, 1222, Hoàn Kiếm, Hà Nội'),(44,'2025-01-21',142540,72,22,'COD-Thanh toán khi nhận hàng','Nguyên Bùi Hoàng Vũ, 0868032463, hvunguyen@icloud.com, 1222, Ba Đình, Hà Nội. Notes: àdasf'),(45,'2025-01-21',219022,73,22,'COD-Thanh toán khi nhận hàng','Nguyên Bùi Hoàng Vũ, 0868032463, hvunguyen@icloud.com, 1222, Hoàn Kiếm, Hà Nội'),(46,'2025-03-26',234572,74,26,'COD-Thanh toán khi nhận hàng','Nguyên Bùi Hoàng Vũ, 0868032463, hvunguyen@icloud.com, 1222, Hoàn Kiếm, Hà Nội. Notes: vx'),(47,'2025-03-26',163262,75,26,'COD-Thanh toán khi nhận hàng','Nguyên Bùi Hoàng Vũ, 0868032463, hvunguyen@icloud.com, 1222, Hoàn Kiếm, Hà Nội. Notes: fvxcv'),(48,'2025-03-26',59482,76,26,'COD-Thanh toán khi nhận hàng','Nguyên Bùi Hoàng Vũ, 0868032463, hvunguyen@icloud.com, 1222, Cầu Giấy, Hà Nội. Notes: asdasd'),(49,'2025-03-26',59482,77,26,'MOMO-Thanh toán MOMO','Nguyên Bùi Hoàng Vũ, 0868032463, hvunguyen@icloud.com, 1222, Cầu Giấy, Hà Nội. Notes: asda'),(50,'2025-03-26',37260,78,26,'COD-Thanh toán khi nhận hàng','Nguyên Bùi Hoàng Vũ, 0868032463, hvunguyen@icloud.com, 1222, Đống Đa, Hà Nội'),(51,'2025-03-26',114002,79,26,'COD-Thanh toán khi nhận hàng','Nguyên Bùi Hoàng Vũ, 0868032463, hvunguyen@icloud.com, 1222, Hoàn Kiếm, Hà Nội. Notes: asd'),(52,'2025-03-26',77822,80,27,'BANK-Chuyển khoản ngân hàng','Nguyên Bùi Hoàng Vũ, 0868032463, hvunguyen@icloud.com, 1222, Đống Đa, Hà Nội'),(53,'2025-03-26',349923000,81,27,'BANK-Chuyển khoản ngân hàng','adasd, 0868032463, hao@gmail.com, 123, Ba Đình, Hà Nội. Notes: ádasdasd'),(54,'2025-03-31',225040,82,31,'COD-Thanh toán khi nhận hàng','Nguyên Bùi Hoàng Vũ, 0868032463, hvunguyen@icloud.com, 1222, Hoàn Kiếm, Hà Nội'),(55,'2025-03-31',604302,83,31,'MOMO-Thanh toán MOMO','Nguyên Bùi Hoàng Vũ, 0868032463, hvunguyen@icloud.com, 1222, Đống Đa, Hà Nội'),(56,'2025-04-04',4332970,84,31,'on','Nguyên Bùi Hoàng Vũ, 0868032463, hvunguyen@icloud.com, 1222, 892, 89'),(57,'2025-04-04',122310,85,23,'on','Nguyên Bùi Hoàng Vũ, 0868032463, hvunguyen@icloud.com, 1222, 889, 89'),(58,'2025-04-04',303822,86,31,'on','Nguyên Bùi Hoàng Vũ, 0868032463, hvunguyen@icloud.com, 1222, Huyện Long Điền, Tỉnh Bà Rịa - Vũng Tàu');
/*!40000 ALTER TABLE `transactionhistory` ENABLE KEYS */;
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
