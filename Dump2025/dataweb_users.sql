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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `userPassword` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `userName` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `phoneNumber` char(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `birthDate` date DEFAULT NULL,
  `companyName` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `point` int DEFAULT '0',
  `idFavoriteProduct` int DEFAULT NULL,
  `idRole` int DEFAULT '0',
  `createDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `isActive` bit(1) DEFAULT b'1',
  `isGoogle` bit(1) NOT NULL,
  `idRank` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idRole` (`idRole`),
  KEY `fk_adds` (`idRank`),
  CONSTRAINT `fk_adds` FOREIGN KEY (`idRank`) REFERENCES `user_ranks` (`id`) ON DELETE SET NULL,
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`idRole`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'john.doe@example.com','password123','hoangvu','0123456789','1990-01-01','Company A','123 Main St','john_doe.jpg',100,1,2,'2024-12-21 01:16:30',_binary '\0',_binary '\0',NULL),(2,'jane.doe@example.com','password456','Jane Doe','0987654321','1992-02-02','Company B','456 Oak St','jane_doe.jpg',200,2,2,'2024-12-21 01:16:30',_binary '',_binary '\0',NULL),(3,'22130329@st.hcmuaf.edu.vn','fb0ed7c719baaf10b9836b0de5ad78f61121b6617ac2b7dd0376d80d4eace603','Vũ Nguyễn','0909090909','2004-10-03','Company C','24 QL80 Quận Ninh Kiều Tp.Cần thơ','Geometrie_carre.png',150,3,1,'2024-12-21 01:16:30',_binary '',_binary '\0',NULL),(4,'hoangvu@gmail.com','$2a$10$a1kyFEFPE5oW1bJTGBHp0em/jvyTOWTw9v8GMPQyxV5gRAHk.F/72','Vũ','086832463',NULL,NULL,NULL,NULL,0,NULL,2,'2024-12-22 12:57:42',_binary '',_binary '\0',NULL),(5,'hoangvu123@gmail.com','$2a$10$XWE.CerlkFkgmrAeuZqUuO0o4fGPzL.yztDkE.4XxFYa2KtG3slE6','hoangvu','09090900',NULL,NULL,NULL,NULL,0,NULL,2,'2024-12-22 13:28:36',_binary '',_binary '\0',NULL),(7,'ducluong0876@gmail.com','27b6e896f9358c97de1b4df790e440bd835b5afc4e197cde6ac3b69c0e5f5b74','Hoàng Vũ','0868032463','2025-01-03',NULL,'24 Tp.Cần thơ','1355096.jpeg',0,NULL,NULL,'2025-01-07 14:20:52',_binary '',_binary '\0',NULL),(8,'vufit2003@icloud.com','25862f05ba944f12fa0d5a087495075418de2c0825247ffcb50dd03346b16fae','Hoàng Vũ','0868032463','2025-01-02',NULL,'ádasd','Ảnh màn hình 2025-01-09 lúc 23.06.35.png',0,NULL,NULL,'2025-01-09 23:36:45',_binary '',_binary '\0',NULL),(20,'best@gmail.com','fb0ed7c719baaf10b9836b0de5ad78f61121b6617ac2b7dd0376d80d4eace603','Vũ','0909399199','2004-10-03',NULL,'24 QL 80 Quận Ninh Kiều Tp,Cần thơ','shipping-and-logistics.jpg',0,NULL,2,'2025-01-13 13:32:27',_binary '',_binary '\0',NULL),(22,'user@gmail.com','fb0ed7c719baaf10b9836b0de5ad78f61121b6617ac2b7dd0376d80d4eace603','Nguyên Bùi Hoàng Vũ','0868032463','2004-10-03',NULL,'24 QL80 Quận Ninh Kiều Tp.Cần thơ','sudoku-solution-example.webp',0,NULL,2,'2025-01-17 00:50:31',_binary '',_binary '\0',NULL),(23,'admin@gmail.com','fb0ed7c719baaf10b9836b0de5ad78f61121b6617ac2b7dd0376d80d4eace603','Nguyên Bùi Hoàng Vũ','0868032463','2004-10-03',NULL,'199 Nguyễn Đình Chính, P11 Quận Phú Nhuận, Tp.HCM','Geometrie_carre.png',0,NULL,1,'2025-01-17 01:00:19',_binary '',_binary '\0',NULL),(24,'hvunguyensss@icloud.com','fb0ed7c719baaf10b9836b0de5ad78f61121b6617ac2b7dd0376d80d4eace603','Nguyên Bùi Hoàng Vũ','0868032463',NULL,NULL,NULL,NULL,0,NULL,2,'2025-01-17 09:03:13',_binary '',_binary '\0',NULL),(25,'hao@gmail.com','fb0ed7c719baaf10b9836b0de5ad78f61121b6617ac2b7dd0376d80d4eace603','hoanga','0868032463',NULL,NULL,NULL,NULL,0,NULL,2,'2025-01-27 15:02:46',_binary '\0',_binary '\0',NULL),(26,'hoangvu03102004@gmail.com','6ef6d251573efbaaa03c371967a5199c4b76e92a7ca1a87024f864db8a8d63cb','Nguyên Bùi Hoàng Vũ','0868032463','2025-03-15',NULL,'1222','1355096.jpeg',0,NULL,2,'2025-03-21 15:15:09',_binary '',_binary '\0',NULL),(27,'22130328@st.hcmuaf.edu.vn','90651c901348b5e70af8859077fe270f007c2685bf409f34b7fb9923238caa95','Nguyên Bùi Hoàng Vũ','0868032463','2025-03-09',NULL,'1222','Outlast 2-74508.jpg',0,NULL,1,'2025-03-22 06:40:07',_binary '',_binary '',NULL),(28,'vufit2004@icloud.com','6ef6d251573efbaaa03c371967a5199c4b76e92a7ca1a87024f864db8a8d63cb','Hoàng Vũ','0868032463',NULL,NULL,NULL,NULL,0,NULL,2,'2025-03-22 17:17:49',_binary '\0',_binary '\0',NULL),(31,'hvunguyen@icloud.com',NULL,'Hoàng Vũ','0868032463','2025-03-01',NULL,'1222','https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=3715900748708113&height=200&width=200&ext=1745670854&hash=AbYoFBYbswav12NIHEJSmcos',0,NULL,2,'2025-03-27 19:34:14',_binary '',_binary '\0',2),(32,'vue@gmail.com','6ef6d251573efbaaa03c371967a5199c4b76e92a7ca1a87024f864db8a8d63cb','Nguyên Bùi Hoàng Vũ','0868032463',NULL,NULL,NULL,NULL,0,NULL,2,'2025-04-04 08:05:37',_binary '\0',_binary '\0',NULL),(33,'hy@gmail.com','6ef6d251573efbaaa03c371967a5199c4b76e92a7ca1a87024f864db8a8d63cb','Nguyên Bùi Hoàng Vũ','0868032463',NULL,NULL,NULL,NULL,0,NULL,2,'2025-04-04 18:45:00',_binary '\0',_binary '\0',NULL),(34,'hy1@gmail.com','6ef6d251573efbaaa03c371967a5199c4b76e92a7ca1a87024f864db8a8d63cb','Nguyên Bùi Hoàng Vũ','0868032463',NULL,NULL,NULL,NULL,0,NULL,2,'2025-04-04 18:46:54',_binary '\0',_binary '\0',NULL),(35,'hvunguyen1@icloud.com','6ef6d251573efbaaa03c371967a5199c4b76e92a7ca1a87024f864db8a8d63cb','Nguyên Bùi Hoàng Vũ','0868032463',NULL,NULL,NULL,NULL,0,NULL,2,'2025-04-04 18:51:43',_binary '\0',_binary '\0',NULL),(36,'hvunguyen12@icloud.com','6ef6d251573efbaaa03c371967a5199c4b76e92a7ca1a87024f864db8a8d63cb','Nguyên Bùi Hoàng Vũ','0868032463',NULL,NULL,NULL,NULL,0,NULL,2,'2025-04-04 18:52:06',_binary '\0',_binary '\0',NULL),(37,'22130305@st.hcmuaf.edu.vn','6ef6d251573efbaaa03c371967a5199c4b76e92a7ca1a87024f864db8a8d63cb','Hà Cao Tấn Trường','0398322109','2004-01-07',NULL,'38/1','sốt-nấm-cục.png',0,NULL,1,'2025-04-09 13:23:29',_binary '',_binary '\0',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
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
