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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (4,'Nấm Tươi','Nấm tươi là một trong các loại thực phẩm ít calo, giảm cholesterol xấu trong máu, giúp cân bằng chế độ ăn kiêng, giữ gìn vóc dáng hiệu quả. Nấm tươi là món ăn có rất nhiều loại vitamin thiết yếu, các khoáng chất quý hiếm, chất đa lượng cần thiết cho cơ thể hoạt động.\r\n\r\nTrong nấm tươi có hàm lượng chất xơ khá cao, thậm chí còn cao hơn một số loại rau, củ và hạt, hoàn toàn thích hợp để ăn mỗi ngày, đặc biệt ăn chay. Bổ sung nấm tươi thường xuyên sẽ còn giúp cơ thể tích tụ được dưỡng chất có lợi, từ đó giúp khỏe mạnh, chống oxy hóa, chậm lão hóa bên trong và trẻ hóa làn da từ bên ngoài hay thậm chí là bảo vệ, ngăn ngừa các vấn đề nghiêm trọng tác động tới cơ thể như ung thư, tim mạch, huyết áp, tiểu đường.\r\n\r\nĂn nấm tươi cũng giúp cơ thể kháng khuẩn và kháng virus ở một số chủng nấm đặc biệt, từ đó giúp cơ thể tăng lớp phòng vệ để bảo vệ được cả bên trong lẫn bên ngoài cơ thể. Bạn cũng hoàn toàn có thể ăn nấm thay thế các loại thịt heo, thịt bò, cá, trứng gà, sữa bò mà vẫn đảm bảo dinh dưỡng tối ưu nhất.\r\n\r\nTrên thế giới có hàng ngàn chủng loại nấm khác nhau, ở Việt Nam người dân thường quan tâm và ăn nhiều nhất là các loại nấm ăn thông dụng trong bữa ăn thường ngày hoặc nấm ăn lẩu, như: Nấm Bào Ngư Xám, Nấm Sò Trắng, Nấm Mối Đen, Nấm Hương (Nấm Đông Cô), Nấm Rơm Búp, Nấm Hoàng Kim, Nấm Đùi Gà, Nấm Nấm Bạch Tuyết (Nấm Hải Sản), Nấm Hầu Thủ (Nấm Đầu Khỉ), Nấm Kim Châm, Nấm Mỡ Trắng và Nấm Mỡ Nâu, Nấm Linh Chi Nâu và Nấm Linh Chi Trắng (tự Nấm Ngọc Tẩm/Nấm Vị Cua/Nấm Thủy Tiên).'),(5,'Nấm Khô','Nấm Khô được sấy từ 100% từ Nấm Tươi, là món ăn với nhiều vitamin, khoáng chất và các axit amin có lợi cần thiết cho cơ thể. Với hàm lượng đạm phong phú giúp cơ thể có thêm nhiều năng lượng vận động.\r\n\r\nLà nấm được nuôi trồng tại Nông Trại Nấm Xanh và đối tác liên kết, đảm bảo vệ sinh ATTP và chất lượng tốt nhất cho người tiêu dùng.\r\n\r\nBổ sung nấm khô mỗi ngày sẽ giúp cơ thể khỏe mạnh, nhiều năng lượng hoạt động, chậm lão hóa cơ thể, trẻ hóa da hay thậm chí là ngăn ngừa bệnh tật. Hoàn toàn có thể ăn thay thế các loại thịt, trứng, sữa mà vẫn đảm bảo dinh dưỡng tối ưu.'),(6,'Phôi Nấm','Phôi tại Nấm Xanh cung cấp bao gồm các loại thông dụng nhất như Phôi Nấm Bào Ngư Xám, Phôi Nấm Linh Chi, Phôi Nấm Hoàng Đế, Phôi Nấm Mối Đen và nhiều loại phôi phù hợp cho các đối tượng thích trồng nấm tại nhà hoặc trồng mô hình nông trại với quy mô vừa và nhỏ.\r\n\r\nPhôi do Nấm Xanh cung cấp bao gồm loại phôi thường đạt tiêu chuẩn ViệtGAP và phôi hữu cơ đạt tiêu chuẩn nuôi trồng hữu cơ. Sản phẩm luôn cam kết đạt tiêu chuẩn chất lượng và nguyên liệu an toàn tiêu dùng, luôn được kiểm tra kỹ trước khi bàn giao cho khách hàng tận tay.\r\n\r\nThành phẩm từ các phôi là các loại nấm ăn đạt tiêu chuẩn về dinh dưỡng, dùng tốt cho sức khỏe và luôn an toàn với trẻ nhỏ. Một sản phẩm làm nên hệ sinh thái xanh cho khu vườn nhà bạn.'),(7,'Chà Bông Nấm','Chà Bông Nấm là một trong những món ăn cực ngon, giàu dinh dưỡng và tiện lợi. Được chế biến từ những chân Nấm Hương khô đạt chất lượng cao, trải qua quá trình chế biến với công thức cực đặc biệt của Nấm Xanh đã cho ra các sản phẩm chà bông nấm chay siêu ngon siêu hấp dẫn.\r\n\r\nThành phần trong chà bông có chứa đến 98% chân Nấm Hương khô và các gia vị chay đặc biệt từ thực vật, đảm bảo cho chế độ chay tịnh của bất kỳ ai đang ăn chay. Cùng với hạn sử dụng lên đến 6 tháng nên bạn hoàn toàn có thể bảo quản sử dụng lâu.'),(8,'Nấm Dược Liệu','Nấm dược liệu là một trong các loại nấm có nhiều thành phần dược tính cao và tốt cho sức khỏe, dược dùng như các loại thực phẩm bổ sung. Nấm dược liệu gồm rất nhiều loại như Nấm Linh Chi Đỏ (Xích Chi, Hồng Chi,…) hay các loại Nấm Đông Trùng Thảo, Bào Tử Nấm Linh Chi, Cao Nấm Linh Chi,…\n\nLoại nấm này không dùng để ăn mà thường dùng để pha nước dùng, giúp cơ thể bồi bổ khí huyết, tăng cường sức đề kháng tự nhiên, chống lão hóa, tốt cho gan, thận, tim mạch, giảm tiểu đường, huyết áp, ngăn ngừa ung thư,… và nhiều tác dụng tuyệt vời khác phù hợp cho người trên 25 tuổi sử dụng.\n\nCác sản phẩm Nấm Dược Liệu tại Nấm Xanh sẽ gồm có Nấm Linh Chi Đỏ Nguyên Tai, Linh Chi Thái Lát, Bào Tử Linh Chi, Đông Trùng Hạ Thảo, Hôp quà Bào Tử, Cao Nấm,…\n\nTất cả sản phẩm được nuôi trồng, sản xuất và thành phẩm tại Nông trại Nấm Xanh, đảm bảo chất lượng loại 1 tốt nhất và đầy đủ điều kiện vệ sinh ATTP, kiểm nghiệm Eurofins. Đảm bảo sẽ mang đến một nguồn sức khỏe tốt và sự an tâm tốt nhất cho người tiêu dùng.'),(9,'Bột Nấm Ăn','Bột nấm ăn với 100% từ nấm khô, để sử dụng chủ yếu thay thế bột ngọt, dùng trong các món canh, cháo vô cùng bổ dưỡng, thậm chí có thể dùng để ướp các loại thịt vô cùng ngon và ngọt thịt tự nhiên.\r\n\r\nLà nấm được nuôi trồng trực tiếp tại nông trại Nấm Xanh và nông trại đối tác liên kết, các loại nấm đều đảm bảo chất lượng tốt nhất, đảm bảo vệ sinh ATTP cho người tiêu dùng.\r\n\r\nVới hàm lượng dinh dưỡng như nấm khô, trong bột nấm có nhiều vitamin và khoáng chất, các axit amin cần thiết cho cơ thể.\r\n\r\nBổ sung bột nấm mỗi ngày sẽ giúp cơ thể khỏe mạnh, chậm lão hóa cơ thể, trẻ hóa da hay thậm chí là ngăn ngừa bệnh tật. Hoàn toàn có thể ăn thay thế các loại thịt, trứng, sữa mà vẫn đảm bảo dinh dưỡng tối ưu.'),(10,'Nấm Quà Tặng','Sản phẩm đi kèm khi mua bất kì sản phẩm nào của hệ thống Nấm Xanh.'),(18,'Xoaif','asdasd'),(19,'Xoaif','asdasd');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-23 17:51:14
