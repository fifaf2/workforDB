CREATE DATABASE  IF NOT EXISTS `details` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `details`;
-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: details
-- ------------------------------------------------------
-- Server version	9.5.0

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '509053a4-c04f-11f0-a987-02509dffddc6:1-64';

--
-- Table structure for table `j`
--

DROP TABLE IF EXISTS `j`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `j` (
  `num_izdel` varchar(6) NOT NULL,
  `Name` varchar(20) DEFAULT NULL,
  `City` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`num_izdel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j`
--

LOCK TABLES `j` WRITE;
/*!40000 ALTER TABLE `j` DISABLE KEYS */;
INSERT INTO `j` VALUES ('J1','Жесткий диск','Париж'),('J2','Перфоратор','Рим'),('J3','Считыватель','Афины'),('J4','Принтер','Афины'),('J5','Флоппи-диск','Лондон'),('J6','Терминал','Осло'),('J7','Лента','Лондон');
/*!40000 ALTER TABLE `j` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `p`
--

DROP TABLE IF EXISTS `p`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `p` (
  `num_Det` varchar(6) NOT NULL,
  `Name` varchar(20) DEFAULT NULL,
  `Color` varchar(20) DEFAULT NULL,
  `weight` int DEFAULT NULL,
  `City` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`num_Det`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `p`
--

LOCK TABLES `p` WRITE;
/*!40000 ALTER TABLE `p` DISABLE KEYS */;
INSERT INTO `p` VALUES ('P1','Гайка','Красный',12,'Лондон'),('P2','Болт','Зеленый',17,'Париж'),('P3','Винт','Голубой',17,'Рим'),('P4','Винт','Красный',14,'Лондон'),('P5','Кулачок','Голубой',12,'Париж'),('P6','Блюм','Красный',19,'Лондон');
/*!40000 ALTER TABLE `p` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s`
--

DROP TABLE IF EXISTS `s`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `s` (
  `num_post` varchar(6) NOT NULL,
  `Family` varchar(20) DEFAULT NULL,
  `Score` int DEFAULT NULL,
  `City` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`num_post`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s`
--

LOCK TABLES `s` WRITE;
/*!40000 ALTER TABLE `s` DISABLE KEYS */;
INSERT INTO `s` VALUES ('S1','Смит',20,'Лондон'),('S2','Джонс',10,'Париж'),('S3','Блейк',30,'Париж'),('S4','Кларк',20,'Лондон'),('S5','Адамс',30,'Афины');
/*!40000 ALTER TABLE `s` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spj`
--

DROP TABLE IF EXISTS `spj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spj` (
  `num_post` varchar(6) NOT NULL,
  `num_Det` varchar(6) NOT NULL,
  `num_izdel` varchar(6) NOT NULL,
  `Count` int NOT NULL,
  PRIMARY KEY (`num_izdel`,`num_Det`,`num_post`),
  KEY `num_post_idx` (`num_post`),
  KEY `num_det_idx` (`num_Det`),
  CONSTRAINT `num_det` FOREIGN KEY (`num_Det`) REFERENCES `p` (`num_Det`),
  CONSTRAINT `num_izdel` FOREIGN KEY (`num_izdel`) REFERENCES `j` (`num_izdel`),
  CONSTRAINT `num_post` FOREIGN KEY (`num_post`) REFERENCES `s` (`num_post`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spj`
--

LOCK TABLES `spj` WRITE;
/*!40000 ALTER TABLE `spj` DISABLE KEYS */;
INSERT INTO `spj` VALUES ('S1','P1','J1',200),('S2','P3','J1',400),('S3','P3','J1',200),('S5','P2','J2',200),('S2','P3','J2',200),('S3','P4','J2',500),('S2','P5','J2',100),('S5','P6','J2',200),('S2','P3','J3',200),('S4','P6','J3',300),('S1','P1','J4',700),('S5','P1','J4',100),('S5','P2','J4',100),('S2','P3','J4',500),('S5','P3','J4',200),('S5','P4','J4',800),('S5','P5','J4',400),('S5','P6','J4',500),('S2','P3','J5',600),('S5','P5','J5',500),('S2','P3','J6',400),('S2','P3','J7',800),('S5','P5','J7',100),('S4','P6','J7',300);
/*!40000 ALTER TABLE `spj` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-13  8:31:00
