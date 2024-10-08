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
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `idProducto` int(11) NOT NULL AUTO_INCREMENT,
  `tipoProducto` varchar(15) NOT NULL,
  `nombreProducto` varchar(20) NOT NULL,
  `precioProducto` float NOT NULL,
  `anioProducto` year(4) NOT NULL,
  `estadoProducto` tinyint(1) NOT NULL,
  PRIMARY KEY (`idProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'MP','Martes de prueba 1',3000,2024,1),(2,'MP','Martes de prueba 2',3000,2024,1),(3,'MP','Martes de prueba 3',3000,2024,1),(4,'MP','Martes de prueba 4',3000,2024,1),(5,'MP','Martes de prueba 5',3000,2024,1),(6,'MP','Martes de prueba 6',3000,2024,1),(7,'MP','Martes de prueba 7',3000,2024,1),(8,'MP','Martes de prueba 8',3000,2024,1),(9,'MP','Martes de prueba 9',3000,2024,1),(10,'MP','Martes de prueba 10',3000,2024,1),(11,'MP','Martes de prueba 11',3000,2024,1),(12,'MP','Martes de prueba 1',3000,2023,0),(13,'MP','Martes de prueba 2',3000,2023,0),(14,'MP','Martes de prueba 3',3000,2023,0),(15,'MP','Martes de prueba 4',3000,2023,0),(16,'MP','Martes de prueba 5',3000,2023,0),(17,'MP','Martes de prueba 6',3000,2023,0),(18,'MP','Martes de prueba 7',3000,2023,0),(19,'MP','Martes de prueba 8',3000,2023,0),(20,'MP','Martes de prueba 9',3000,2023,0),(21,'MP','Martes de prueba 10',3000,2023,1),(22,'MP','Martes de prueba 11',3000,2023,1),(23,'Pensar','Pensar 1',10000,2024,1),(24,'Pensar','Pensar 2',10000,2024,1),(25,'Pensar','Pensar 3',10000,2024,1),(26,'Pensar','Pensar 4',10000,2024,1),(27,'Pre-Icfes','Preicfes',700000,2024,1);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
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
