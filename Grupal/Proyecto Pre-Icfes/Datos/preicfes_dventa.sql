-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: preicfes
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `dventa`
--

DROP TABLE IF EXISTS `dventa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dventa` (
  `idVentaFK` int(11) DEFAULT NULL,
  `idProductoFK` int(11) DEFAULT NULL,
  `cantidadDVenta` int(11) NOT NULL,
  `subtotalDVenta` float NOT NULL,
  `estadoDVenta` varchar(10) DEFAULT NULL,
  KEY `Detalle_Venta` (`idVentaFK`),
  KEY `Detalle_Producto` (`idProductoFK`),
  CONSTRAINT `Detalle_Producto` FOREIGN KEY (`idProductoFK`) REFERENCES `producto` (`idProducto`),
  CONSTRAINT `Detalle_Venta` FOREIGN KEY (`idVentaFK`) REFERENCES `venta` (`idVenta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dventa`
--

LOCK TABLES `dventa` WRITE;
/*!40000 ALTER TABLE `dventa` DISABLE KEYS */;
INSERT INTO `dventa` VALUES (27,25,40,400000,'Completado'),(41,6,127,381000,'Completado'),(25,2,72,216000,'En Negocia'),(3,27,24,16800000,'Completado'),(49,5,78,234000,'En Negocia'),(9,8,109,327000,'Completado'),(23,4,101,303000,'En Negocia'),(26,2,101,303000,'Completado'),(5,7,53,159000,'En Negocia'),(10,24,27,270000,'Completado'),(1,11,75,225000,'En Negocia'),(22,23,35,350000,'Completado'),(4,9,54,162000,'Completado'),(11,4,127,381000,'Completado'),(2,6,56,168000,'Completado'),(10,23,28,280000,'Completado'),(13,7,88,264000,'Completado'),(4,27,25,17500000,'Completado'),(14,4,115,345000,'En Negocia'),(20,6,59,177000,'En Negocia'),(27,23,47,470000,'Completado'),(18,26,44,440000,'Completado'),(13,6,74,222000,'Completado'),(30,21,145,1450000,'Completado'),(24,27,22,15400000,'En Negocia'),(6,6,101,303000,'Completado'),(34,27,16,11200000,'Completado'),(20,27,20,14000000,'Completado'),(10,6,93,279000,'En Negocia'),(19,10,99,297000,'En Negocia'),(7,2,145,435000,'Completado'),(10,6,116,348000,'En Negocia'),(15,2,118,354000,'En Negocia'),(33,10,139,417000,'Completado'),(48,27,27,18900000,'En Negocia'),(49,10,127,381000,'Completado'),(16,4,99,297000,'Completado'),(8,2,103,309000,'En Negocia'),(41,24,32,320000,'En Negocia'),(24,4,91,273000,'En Negocia'),(12,27,28,19600000,'En Negocia'),(39,24,30,300000,'En Negocia'),(27,27,21,14700000,'Completado'),(29,1,100,300000,'En Negocia'),(13,11,70,210000,'Completado'),(47,7,137,411000,'Completado'),(33,3,145,435000,'Completado'),(55,9,117,351000,'Completado'),(20,23,31,310000,'Completado'),(19,8,126,378000,'En Negocia'),(24,1,94,282000,'Completado'),(32,6,54,162000,'Completado'),(50,1,63,189000,'Completado'),(21,9,88,264000,'Completado'),(37,6,100,300000,'Completado'),(50,21,106,1060000,'Completado'),(40,1,78,234000,'Completado'),(37,22,53,530000,'Completado'),(44,25,30,300000,'En Negocia'),(26,11,100,300000,'Completado'),(27,25,49,490000,'En Negocia'),(24,24,33,330000,'Completado'),(27,8,61,183000,'Completado'),(36,10,60,180000,'Completado'),(17,22,50,500000,'Completado'),(41,23,41,410000,'Completado'),(29,27,18,12600000,'Completado'),(24,7,84,252000,'En Negocia'),(46,25,44,440000,'En Negocia'),(30,8,126,378000,'Completado'),(53,6,112,336000,'Completado'),(26,6,53,159000,'Completado'),(27,4,128,384000,'Completado'),(49,8,60,180000,'Completado'),(49,26,37,370000,'Completado'),(34,10,134,402000,'En Negocia'),(49,8,50,150000,'En Negocia'),(55,2,57,171000,'Completado'),(37,5,74,222000,'Completado'),(35,6,98,294000,'Completado'),(28,26,45,450000,'Completado'),(55,25,48,480000,'Completado'),(45,26,43,430000,'Completado'),(51,27,22,15400000,'Completado'),(43,1,84,252000,'En Negocia'),(31,9,75,225000,'Completado'),(38,21,140,1400000,'Completado'),(52,23,35,350000,'Completado'),(35,5,59,177000,'Completado'),(55,27,21,14700000,'En Negocia'),(33,27,30,21000000,'Completado'),(49,22,111,1110000,'Completado'),(53,10,150,450000,'En Negocia'),(49,3,88,264000,'Completado'),(44,2,117,351000,'En Negocia'),(42,8,85,255000,'Completado'),(50,1,143,429000,'En Negocia'),(54,22,144,1440000,'Completado'),(41,25,37,370000,'En Negocia'),(57,22,123,1230000,'En Negocia'),(47,21,51,510000,'Completado'),(43,22,74,740000,'En Negocia'),(50,11,139,417000,'Completado'),(52,6,64,192000,'En Negocia'),(51,11,64,192000,'En Negocia'),(52,4,73,219000,'En Negocia'),(54,26,42,420000,'En Negocia'),(54,21,60,600000,'Completado'),(53,4,76,228000,'Completado'),(52,3,122,366000,'Completado'),(52,2,95,285000,'En Negocia'),(53,1,88,264000,'En Negocia'),(56,7,139,417000,'En Negocia'),(55,5,100,300000,'En Negocia'),(57,1,50,150000,'Completado'),(57,9,142,426000,'Completado');
/*!40000 ALTER TABLE `dventa` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-08 13:29:35
