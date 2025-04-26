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
-- Table structure for table `product_descriptions`
--

DROP TABLE IF EXISTS `product_descriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_descriptions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` text COLLATE utf8mb4_general_ci,
  `title` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id_product` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_product` (`id_product`),
  CONSTRAINT `product_descriptions_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_descriptions`
--

LOCK TABLES `product_descriptions` WRITE;
/*!40000 ALTER TABLE `product_descriptions` DISABLE KEYS */;
INSERT INTO `product_descriptions` VALUES (1,'Ngon ','Nấm',88),(2,'sdkjfsldf','Khong',88),(3,'ádasdasd','ádasdadsa',88),(4,'Ngon ','Nấm',88),(5,'sdkjfsldf','Khong',88),(6,'ádasdasd','ádasdadsa',88),(7,'Nấm Mối Trắng Tươi là loại nấm tự nhiên, chưa thể nuôi trồng được nên số lượng giới hạn, nấm chỉ mọc 2-3 tháng nên bạn sẽ bỏ lỡ nếu không nhanh tay.\nTrong Nấm Mối Trắng Tươi có rất nhiều dưỡng chất cần thiết cần thiết, hơn nhiều loại thịt, cá, trứng và sữa.\nCó tác dụng lợi kinh nguyệt cho phụ nữ, tăng tiết sữa cho mẹ bỉm.\nLà thực phẩm ít calo và giúp giảm cholesterol nên cực kỳ thích hợp chế độ ăn kiên, giảm cân, giữ vóc dáng.\nChế biến nấm cùng các món ăn dễ dàng, mùi vị lại cực kỳ tuyệt vời.\n','Nấm Mối Tươi có ưu điểm gì?',87),(8,'Chính xác là Nấm Mối Tươi Tự Nhiên chỉ có duy nhất 1 loại duy nhất, chỉ mọc tự nhiên và nó chính là loại nấm này bạn đang xem. Vì chúng là loại nấm duy nhất tại Việt Nam chưa thể nuôi trồng nông nghiệp được nên vô cùng quý hiếm. Mỗi năm chúng chỉ nở rộ ra đúng 1 đợt và duy trì sự sinh tồn này vỏn vẹn 2-3 tháng từ giữa năm nên sản lượng có giới hạn, muốn ăn phải săn người bán và muốn bán phải săn người mua.\n\nNếu mua Nấm Mối Tươi này để sử dụng, bạn sẽ có 2 lựa chọn về loại nấm, đó là:\n\nNấm Mối Búp sẽ có giá thành cao hơn bởi vị ngọt tinh túy và độ ngon gần như tuyệt đối, dinh dưỡng tối đa, nấm còn nguyên búp ở mũ, chưa hề nở bung ra. Bạn nên chọn Nấm Mối Búp nếu có kinh tế để cảm nhận trọn vẹn tinh hoa đất trời của loại nấm này nhé.\nNấm Mối Nở sẽ có giá thành thấp hơn bởi mũ nấm đã nở xòe ra như cánh dù căng, vị ngọt và độ ngon lúc này dù đã giảm đi một phần nhỏ nhưng ăn vẫn ngon. Nên với tài chính không nhiều, bạn có thể chọn Nấm Mối Nở để dùng cho tiết kiệm nhé.','Nấm Mối Tươi Tự Nhiên có mấy loại?',87),(9,'Nấm quý hiếm và số lượng rất giới hạn, mỗi năm chỉ có thể thưởng thức 1 lần.\nSản phẩm thiên nhiên, mùi vị đặc trưng thơm ngon hơn nhiều loại nấm bạn từng ăn, nhất định phải thưởng thức 1 lần trong đời.\nNấm Xanh cung cấp tới 90% Nấm Mối Búp, đảm vị độ ngon ưng ý nhất cho bạn và gia đình có một bữa ăn hết ý, nhiều dinh dưỡng.\nĐó cũng là lý do bạn có thể an tâm sử dụng Nấm Mối Tươi tại Nông trại Nấm Xanh cung cấp.','Tại sao bạn nên dùng Nấm Mối Tươi?',87),(10,'Trong Nấm Mối Tươi Tự Nhiên có chứa:\n\nNhiều Protein, và các khoáng chất (canxi, sắt, photpho…) cần thiết cho cơ thể.\nGiàu vitamin, đặc biệt nhóm vitamin B tốt cho máu huyết và vitamin D tốt cho xương.\nCó các hoạt chất quan trọng như Polysaccharide giúp hoạt hóa miễn dịch và phát triển tế bào Lympho (B và T)\nLà thực phẩm có nhiều chất xơ và những axit amin hữu ích mà cơ thể không tự tổng hợp được.','Hàm lượng dinh dưỡng trong Nấm Mối Tươi Tự Nhiên',87),(11,'Nấm Mối Trắng Tươi là loại nấm tự nhiên, chưa thể nuôi trồng được nên số lượng giới hạn, nấm chỉ mọc 2-3 tháng nên bạn sẽ bỏ lỡ nếu không nhanh tay.\nTrong Nấm Mối Trắng Tươi có rất nhiều dưỡng chất cần thiết cần thiết, hơn nhiều loại thịt, cá, trứng và sữa.\nCó tác dụng lợi kinh nguyệt cho phụ nữ, tăng tiết sữa cho mẹ bỉm.\nLà thực phẩm ít calo và giúp giảm cholesterol nên cực kỳ thích hợp chế độ ăn kiên, giảm cân, giữ vóc dáng.\nChế biến nấm cùng các món ăn dễ dàng, mùi vị lại cực kỳ tuyệt vời.\n','Nấm Mối Tươi có ưu điểm gì?',87),(12,'Chính xác là Nấm Mối Tươi Tự Nhiên chỉ có duy nhất 1 loại duy nhất, chỉ mọc tự nhiên và nó chính là loại nấm này bạn đang xem. Vì chúng là loại nấm duy nhất tại Việt Nam chưa thể nuôi trồng nông nghiệp được nên vô cùng quý hiếm. Mỗi năm chúng chỉ nở rộ ra đúng 1 đợt và duy trì sự sinh tồn này vỏn vẹn 2-3 tháng từ giữa năm nên sản lượng có giới hạn, muốn ăn phải săn người bán và muốn bán phải săn người mua.\n\nNếu mua Nấm Mối Tươi này để sử dụng, bạn sẽ có 2 lựa chọn về loại nấm, đó là:\n\nNấm Mối Búp sẽ có giá thành cao hơn bởi vị ngọt tinh túy và độ ngon gần như tuyệt đối, dinh dưỡng tối đa, nấm còn nguyên búp ở mũ, chưa hề nở bung ra. Bạn nên chọn Nấm Mối Búp nếu có kinh tế để cảm nhận trọn vẹn tinh hoa đất trời của loại nấm này nhé.\nNấm Mối Nở sẽ có giá thành thấp hơn bởi mũ nấm đã nở xòe ra như cánh dù căng, vị ngọt và độ ngon lúc này dù đã giảm đi một phần nhỏ nhưng ăn vẫn ngon. Nên với tài chính không nhiều, bạn có thể chọn Nấm Mối Nở để dùng cho tiết kiệm nhé.','Nấm Mối Tươi Tự Nhiên có mấy loại?',87),(13,'Nấm quý hiếm và số lượng rất giới hạn, mỗi năm chỉ có thể thưởng thức 1 lần.\nSản phẩm thiên nhiên, mùi vị đặc trưng thơm ngon hơn nhiều loại nấm bạn từng ăn, nhất định phải thưởng thức 1 lần trong đời.\nNấm Xanh cung cấp tới 90% Nấm Mối Búp, đảm vị độ ngon ưng ý nhất cho bạn và gia đình có một bữa ăn hết ý, nhiều dinh dưỡng.\nĐó cũng là lý do bạn có thể an tâm sử dụng Nấm Mối Tươi tại Nông trại Nấm Xanh cung cấp.','Tại sao bạn nên dùng Nấm Mối Tươi?',87),(14,'Trong Nấm Mối Tươi Tự Nhiên có chứa:\n\nNhiều Protein, và các khoáng chất (canxi, sắt, photpho…) cần thiết cho cơ thể.\nGiàu vitamin, đặc biệt nhóm vitamin B tốt cho máu huyết và vitamin D tốt cho xương.\nCó các hoạt chất quan trọng như Polysaccharide giúp hoạt hóa miễn dịch và phát triển tế bào Lympho (B và T)\nLà thực phẩm có nhiều chất xơ và những axit amin hữu ích mà cơ thể không tự tổng hợp được.','Hàm lượng dinh dưỡng trong Nấm Mối Tươi Tự Nhiên',87),(19,'Hương vị đặc biệt, thịt nấm ngon ngọt hơn một số loại nấm thân to khác.\nNhiều tác dụng cho sức khỏe và hỗ trợ hệ tiêu hóa.\nLà thực phẩm ít calo, phù hợp cho chế độ ăn kiên, giảm cân, giữ vóc dáng cơ thể hiệu quả.\nDễ dàng kết hợp với bất kỳ món ăn nào, thực đơn chay hay mặn đều dùng được.','Ưu điểm của Nấm Loa Kèn Tươi',89);
/*!40000 ALTER TABLE `product_descriptions` ENABLE KEYS */;
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
