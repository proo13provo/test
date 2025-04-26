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
-- Table structure for table `activity_logs`
--

DROP TABLE IF EXISTS `activity_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_logs` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `role` varchar(50) NOT NULL,
  `action_type` varchar(50) NOT NULL,
  `description` text,
  `entity_id` bigint DEFAULT NULL,
  `action_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_logs`
--

LOCK TABLES `activity_logs` WRITE;
/*!40000 ALTER TABLE `activity_logs` DISABLE KEYS */;
INSERT INTO `activity_logs` VALUES (5,'22130305@st.hcmuaf.edu.vn','Admin','LOGIN','Đăng nhập vào hệ thống',NULL,'2025-04-17 13:39:11'),(6,'22130305@st.hcmuaf.edu.vn','Admin','LOGIN','Đăng nhập vào hệ thống',NULL,'2025-04-17 13:39:11'),(7,'22130305@st.hcmuaf.edu.vn','Admin','LOGIN','Đăng nhập vào hệ thống',NULL,'2025-04-17 13:39:22'),(8,'22130305@st.hcmuaf.edu.vn','Admin','LOGIN','Đăng nhập vào hệ thống',NULL,'2025-04-17 13:39:22'),(9,'22130305@st.hcmuaf.edu.vn','Admin','LOGIN','Đăng nhập vào hệ thống',NULL,'2025-04-17 13:44:39'),(10,'22130305@st.hcmuaf.edu.vn','Admin','LOGIN','Đăng nhập vào hệ thống',NULL,'2025-04-17 13:44:39'),(11,'22130305@st.hcmuaf.edu.vn','Admin','VALIDATION_ERROR','Lỗi validate khi sửa sản phẩm: Khối lượng không được để trống',NULL,'2025-04-17 13:44:48'),(12,'22130305@st.hcmuaf.edu.vn','Admin','LOGIN','Đăng nhập vào hệ thống',NULL,'2025-04-17 13:50:05'),(13,'22130305@st.hcmuaf.edu.vn','Admin','LOGIN','Đăng nhập vào hệ thống',NULL,'2025-04-17 13:50:05'),(14,'22130305@st.hcmuaf.edu.vn','Admin','VALIDATION_ERROR','Lỗi validate khi sửa sản phẩm: Khối lượng không được để trống',NULL,'2025-04-17 13:50:15'),(15,'22130305@st.hcmuaf.edu.vn','Admin','VALIDATION_ERROR','Lỗi validate khi sửa sản phẩm: Khối lượng không được để trống',NULL,'2025-04-17 13:50:24'),(16,'22130305@st.hcmuaf.edu.vn','Admin','UPDATE_PRODUCT','Cập nhật sản phẩm ID: 87 - Tên: Sốt Nấm Truffle - Giá: 456.00 - Số lượng: 30 - Danh mục: 4 - Nhà cung cấp: 1',87,'2025-04-17 13:50:45'),(17,'22130305@st.hcmuaf.edu.vn','Admin','UPDATE_PRODUCT','Cập nhật sản phẩm ID: 87 - Tên: Sốt Nấm Truffle - Giá: 456.00 - Số lượng: 30 - Danh mục: 5 - Nhà cung cấp: 1',87,'2025-04-17 13:51:38'),(18,'22130305@st.hcmuaf.edu.vn','Admin','LOGIN','Đăng nhập vào hệ thống',NULL,'2025-04-17 14:03:56'),(19,'22130305@st.hcmuaf.edu.vn','Admin','LOGIN','Đăng nhập vào hệ thống',NULL,'2025-04-17 14:03:56');
/*!40000 ALTER TABLE `activity_logs` ENABLE KEYS */;
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
