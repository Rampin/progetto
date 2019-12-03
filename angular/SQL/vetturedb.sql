-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: vetturedb
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marca` (
  `ID_MARCA` decimal(38,0) DEFAULT NULL,
  `NOME` varchar(100) DEFAULT NULL,
  `FONDAZIONE` smallint(6) DEFAULT NULL,
  `WEBSITE` varchar(300) DEFAULT NULL,
  UNIQUE KEY `MARCA` (`ID_MARCA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` VALUES (1,'Ferrari',1947,'http://www.ferrari.com/'),(2,'Lamborghini',1963,'http://www.lamborghini.com/'),(3,'Maserati',1914,'http://www.maserati.com/'),(4,'Alfa Romeo',1910,'http://www.alfaromeo.com/'),(7,'Aston Martin',1913,'http://www.astonmartin.com/'),(5,'BMW',1917,'http://www.bmwgroup.com/'),(6,'Porsche',1931,'http://www.porsche.de/'),(8,'Mercedes-Benz',1926,'http://www.mercedes-benz.com/'),(9,'Bugatti',1909,'http://bugatti.com/'),(10,'FIAT',1899,'http://www.fiat.com/'),(11,'Abarth',1949,'http://www.abarth.it/'),(12,'Opel',1862,'http://www.opel.com/'),(13,'Audi',1909,'http://www.audi.com/'),(14,'Alfred',1234,'http://www.google.com');
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modello`
--

DROP TABLE IF EXISTS `modello`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modello` (
  `ID_MODELLO` decimal(38,0) DEFAULT NULL,
  `NOME` varchar(100) DEFAULT NULL,
  `CILINDRATA` int(11) DEFAULT NULL,
  `POTENZA` smallint(6) DEFAULT NULL,
  `ID_MARCA` decimal(38,0) DEFAULT NULL,
  UNIQUE KEY `Modello` (`ID_MODELLO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modello`
--

LOCK TABLES `modello` WRITE;
/*!40000 ALTER TABLE `modello` DISABLE KEYS */;
INSERT INTO `modello` VALUES (1,'350 GT',3500,280,2),(2,'400 GT',4000,320,2),(5,'Islero',4000,350,2),(3,'Miura',4000,350,2),(4,'Espada',4000,350,2),(6,'Jarama',4000,365,2),(7,'Urraco',3000,260,2),(8,'Countach',5100,455,2),(9,'Silhouette',3000,260,2),(10,'Jalpa',3500,247,2),(11,'LM002',5100,450,2),(12,'Diablo',6000,595,2),(13,'Murciélago',6500,670,2),(14,'Gallardo',5200,570,2),(15,'Aventador',6500,770,2),(16,'Huracán',5200,640,2),(17,'Urus',4000,650,2),(18,'166 Inter',2000,90,1),(19,'195 Inter',2400,90,1),(20,'195 Inter',2500,170,1),(21,'342 America',4100,200,1),(22,'250 Europa',3000,220,1),(23,'375 America',4500,300,1);
/*!40000 ALTER TABLE `modello` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-03 15:17:40
