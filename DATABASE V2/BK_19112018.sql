CREATE DATABASE  IF NOT EXISTS `agroamigos` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `agroamigos`;
-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: agroamigos
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `aux_cotacoes`
--

DROP TABLE IF EXISTS `aux_cotacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `aux_cotacoes` (
  `COD_PRODUTO` int(11) DEFAULT NULL,
  `DC_PRODUTO` varchar(255) NOT NULL,
  `DC_PRECO` varchar(255) NOT NULL,
  `DC_UNIDADE` varchar(255) NOT NULL,
  `DT_DATA` datetime NOT NULL,
  PRIMARY KEY (`DC_PRODUTO`,`DT_DATA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aux_cotacoes`
--

LOCK TABLES `aux_cotacoes` WRITE;
/*!40000 ALTER TABLE `aux_cotacoes` DISABLE KEYS */;
INSERT INTO `aux_cotacoes` VALUES (NULL,'Açúcar - AL','R$ 63,80','sc de 50kg','2018-10-01 00:00:00'),(NULL,'Açúcar - PB','R$ 54,80','sc de 50kg','2018-10-01 00:00:00'),(NULL,'Açúcar - PE','R$ 64,77','sc de 50kg','2018-10-01 00:00:00'),(NULL,'Açúcar - Santos','R$ 67,76','sc de 50kg','2018-11-09 00:00:00'),(NULL,'Açúcar - Santos','R$ 66,50','sc de 50kg','2018-11-16 00:00:00'),(NULL,'Açúcar - SP','R$ 67,96','sc de 50kg','2018-11-09 00:00:00'),(NULL,'Açúcar - SP','R$ 67,11','sc de 50kg','2018-11-16 00:00:00'),(NULL,'Algodão','¢R$ 294,01','lp','2018-11-09 00:00:00'),(NULL,'Algodão','¢R$ 296,53','lp','2018-11-16 00:00:00'),(NULL,'Arroz','R$ 42,46','sc de 50kg','2018-11-09 00:00:00'),(NULL,'Arroz','R$ 41,91','sc de 50kg','2018-11-16 00:00:00'),(NULL,'Bezerro - MS','R$ 1.224,11','cabeça','2018-11-09 00:00:00'),(NULL,'Bezerro - MS','R$ 1.208,19','cabeça','2018-11-16 00:00:00'),(NULL,'Bezerro - SP','R$ 1.213,69','cabeça','2018-11-09 00:00:00'),(NULL,'Bezerro - SP','R$ 1.224,16','cabeça','2018-11-16 00:00:00'),(NULL,'Boi Gordo','R$ 145,45','@','2018-11-09 00:00:00'),(NULL,'Boi Gordo','R$ 146,70','@','2018-11-16 00:00:00'),(NULL,'Café Arábica','R$ 445,33','sc de 60kg','2018-11-09 00:00:00'),(NULL,'Café Arábica','R$ 441,19','sc de 60kg','2018-11-16 00:00:00'),(NULL,'Café Robusta','R$ 333,79','sc de 60kg','2018-11-09 00:00:00'),(NULL,'Café Robusta','R$ 334,33','sc de 60kg','2018-11-16 00:00:00'),(NULL,'Citros','R$ 30,62','cx de 40,8kg','2018-11-09 00:00:00'),(NULL,'Citros','R$ 29,82','cx de 40,8kg','2018-11-16 00:00:00'),(NULL,'Etanol Anidro -  PE','R$ 1,989','litro','2018-10-19 00:00:00'),(NULL,'Etanol Anidro - AL','R$ 1,967','litro','2018-11-09 00:00:00'),(NULL,'Etanol Anidro - MT','R$ 2.194,76','m3','2018-11-09 00:00:00'),(NULL,'Etanol Anidro - MT','R$ 2.168,90','m3','2018-11-16 00:00:00'),(NULL,'Etanol Anidro - SP ','R$ 1,8982','litro','2018-11-09 00:00:00'),(NULL,'Etanol Anidro - SP ','R$ 1,8564','litro','2018-11-16 00:00:00'),(NULL,'Etanol Hidratado - AL','R$ 1,5906','litro','2018-11-09 00:00:00'),(NULL,'Etanol Hidratado - AL','R$ 1,5842','litro','2018-11-16 00:00:00'),(NULL,'Etanol Hidratado - GO','R$ 1,8506','litro','2018-11-09 00:00:00'),(NULL,'Etanol Hidratado - GO','R$ 1,805','litro','2018-11-16 00:00:00'),(NULL,'Etanol Hidratado - MT','R$ 2.578,14','m3','2018-04-06 00:00:00'),(NULL,'Etanol Hidratado - PE','R$ 1,5885','litro','2018-11-09 00:00:00'),(NULL,'Etanol Hidratado - PE','R$ 1,5677','litro','2018-11-16 00:00:00'),(NULL,'Etanol Hidratado - SP ','R$ 1,6738','litro','2018-11-09 00:00:00'),(NULL,'Etanol Hidratado - SP ','R$ 1,6434','litro','2018-11-16 00:00:00'),(NULL,'Frango Congelado ','R$ 4,46','kg','2018-11-09 00:00:00'),(NULL,'Frango Congelado ','R$ 4,51','kg','2018-11-16 00:00:00'),(NULL,'Frango Resfriado','R$ 4,46','kg','2018-11-09 00:00:00'),(NULL,'Frango Resfriado','R$ 4,61','kg','2018-11-16 00:00:00'),(NULL,'Leite','R$ 1,549','litro','2018-10-01 00:00:00'),(NULL,'Mandioca','R$ 433,03','t','2018-11-05 00:00:00'),(NULL,'Mandioca','R$ 414,97','t','2018-11-12 00:00:00'),(NULL,'Milho','R$ 35,98','sc de 60kg','2018-11-09 00:00:00'),(NULL,'Milho','R$ 36,81','sc de 60kg','2018-11-16 00:00:00'),(NULL,'Ovino - CE','R$ 5,90','kg','2018-08-01 00:00:00'),(NULL,'Ovino - MS','R$ 7,63','kg','2018-09-01 00:00:00'),(NULL,'Ovino - MT','R$ 6,50','kg','2018-09-01 00:00:00'),(NULL,'Ovino - PR','R$ 7,78','kg','2018-09-01 00:00:00'),(NULL,'Ovino - RS','R$ 6,70','kg','2018-09-01 00:00:00'),(NULL,'Ovino - SP','R$ 8,62','kg','2018-09-01 00:00:00'),(NULL,'Ovos','R$ 58,69','cx 30 dúzias','2018-11-01 00:00:00'),(NULL,'Ovos','R$ 64,07','cx 30 dúzias','2018-11-09 00:00:00'),(NULL,'Soja - PR','R$ 79,43','sc de 60kg','2018-11-09 00:00:00'),(NULL,'Soja - PR','R$ 78,49','sc de 60kg','2018-11-16 00:00:00'),(NULL,'Soja Paranaguá','R$ 85,28','sc de 60kg','2018-11-09 00:00:00'),(NULL,'Soja Paranaguá','R$ 84,62','sc de 60kg','2018-11-16 00:00:00'),(NULL,'Suíno - carcaça especial','R$ 5,98','kg','2018-11-09 00:00:00'),(NULL,'Suíno - carcaça especial','R$ 6,03','kg','2018-11-16 00:00:00'),(NULL,'Suíno - MG','R$ 3,90','kg','2018-11-09 00:00:00'),(NULL,'Suíno - MG','R$ 3,97','kg','2018-11-16 00:00:00'),(NULL,'Suíno - PR','R$ 3,52','kg','2018-11-09 00:00:00'),(NULL,'Suíno - PR','R$ 3,63','kg','2018-11-16 00:00:00'),(NULL,'Suíno - RS','R$ 3,10','kg','2018-11-09 00:00:00'),(NULL,'Suíno - RS','R$ 3,13','kg','2018-11-16 00:00:00'),(NULL,'Suíno - SC','R$ 3,17','kg','2018-11-09 00:00:00'),(NULL,'Suíno - SC','R$ 3,27','kg','2018-11-16 00:00:00'),(NULL,'Suíno - SP','R$ 3,82','kg','2018-11-09 00:00:00'),(NULL,'Suíno - SP','R$ 3,88','kg','2018-11-16 00:00:00'),(NULL,'Trigo - PR','R$ 808,32','t','2018-11-09 00:00:00'),(NULL,'Trigo - PR','R$ 824,11','t','2018-11-16 00:00:00'),(NULL,'Trigo - RS','R$ 733,35','t','2018-11-09 00:00:00'),(NULL,'Trigo - RS','R$ 742,27','t','2018-11-16 00:00:00');
/*!40000 ALTER TABLE `aux_cotacoes` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `UPDATE_COD_PRODUTO` AFTER INSERT ON `aux_cotacoes` FOR EACH ROW BEGIN
	IF(NEW.DC_PRODUTO = 'Açúcar - AL') THEN INSERT IGNORE INTO COTACOES (`COD_PRODUTO`,`DC_PRODUTO`,`DC_PRECO`,`DC_UNIDADE`,`DT_DATA`) VALUES (1,NEW.`DC_PRODUTO`,NEW.`DC_PRECO`,NEW.`DC_UNIDADE`,NEW.`DT_DATA`); END IF;
    IF(NEW.DC_PRODUTO = 'Açúcar - PB') THEN INSERT IGNORE INTO COTACOES (`COD_PRODUTO`,`DC_PRODUTO`,`DC_PRECO`,`DC_UNIDADE`,`DT_DATA`) VALUES (2,NEW.`DC_PRODUTO`,NEW.`DC_PRECO`,NEW.`DC_UNIDADE`,NEW.`DT_DATA`); END IF;
    IF(NEW.DC_PRODUTO = 'Açúcar - PE') THEN INSERT IGNORE INTO COTACOES (`COD_PRODUTO`,`DC_PRODUTO`,`DC_PRECO`,`DC_UNIDADE`,`DT_DATA`) VALUES (3,NEW.`DC_PRODUTO`,NEW.`DC_PRECO`,NEW.`DC_UNIDADE`,NEW.`DT_DATA`); END IF;
    IF(NEW.DC_PRODUTO = 'Açúcar - Santos') THEN INSERT IGNORE INTO COTACOES (`COD_PRODUTO`,`DC_PRODUTO`,`DC_PRECO`,`DC_UNIDADE`,`DT_DATA`) VALUES (4,NEW.`DC_PRODUTO`,NEW.`DC_PRECO`,NEW.`DC_UNIDADE`,NEW.`DT_DATA`); END IF;
    IF(NEW.DC_PRODUTO = 'Açúcar - SP') THEN INSERT IGNORE INTO COTACOES (`COD_PRODUTO`,`DC_PRODUTO`,`DC_PRECO`,`DC_UNIDADE`,`DT_DATA`) VALUES (5,NEW.`DC_PRODUTO`,NEW.`DC_PRECO`,NEW.`DC_UNIDADE`,NEW.`DT_DATA`); END IF;
    IF(NEW.DC_PRODUTO = 'Algodão') THEN INSERT IGNORE INTO COTACOES (`COD_PRODUTO`,`DC_PRODUTO`,`DC_PRECO`,`DC_UNIDADE`,`DT_DATA`) VALUES (6,NEW.`DC_PRODUTO`,NEW.`DC_PRECO`,NEW.`DC_UNIDADE`,NEW.`DT_DATA`); END IF;
    IF(NEW.DC_PRODUTO = 'Arroz') THEN INSERT IGNORE INTO COTACOES (`COD_PRODUTO`,`DC_PRODUTO`,`DC_PRECO`,`DC_UNIDADE`,`DT_DATA`) VALUES (7,NEW.`DC_PRODUTO`,NEW.`DC_PRECO`,NEW.`DC_UNIDADE`,NEW.`DT_DATA`); END IF;
    IF(NEW.DC_PRODUTO = 'Bezerro - MS') THEN INSERT IGNORE INTO COTACOES (`COD_PRODUTO`,`DC_PRODUTO`,`DC_PRECO`,`DC_UNIDADE`,`DT_DATA`) VALUES (8,NEW.`DC_PRODUTO`,NEW.`DC_PRECO`,NEW.`DC_UNIDADE`,NEW.`DT_DATA`); END IF;
    IF(NEW.DC_PRODUTO = 'Bezerro - SP') THEN INSERT IGNORE INTO COTACOES (`COD_PRODUTO`,`DC_PRODUTO`,`DC_PRECO`,`DC_UNIDADE`,`DT_DATA`) VALUES (9,NEW.`DC_PRODUTO`,NEW.`DC_PRECO`,NEW.`DC_UNIDADE`,NEW.`DT_DATA`); END IF;
    IF(NEW.DC_PRODUTO = 'Boi Gordo') THEN INSERT IGNORE INTO COTACOES (`COD_PRODUTO`,`DC_PRODUTO`,`DC_PRECO`,`DC_UNIDADE`,`DT_DATA`) VALUES (10,NEW.`DC_PRODUTO`,NEW.`DC_PRECO`,NEW.`DC_UNIDADE`,NEW.`DT_DATA`); END IF;
    IF(NEW.DC_PRODUTO = 'Café Arábica') THEN INSERT IGNORE INTO COTACOES (`COD_PRODUTO`,`DC_PRODUTO`,`DC_PRECO`,`DC_UNIDADE`,`DT_DATA`) VALUES (11,NEW.`DC_PRODUTO`,NEW.`DC_PRECO`,NEW.`DC_UNIDADE`,NEW.`DT_DATA`); END IF;
    IF(NEW.DC_PRODUTO = 'Café Robusta') THEN INSERT IGNORE INTO COTACOES (`COD_PRODUTO`,`DC_PRODUTO`,`DC_PRECO`,`DC_UNIDADE`,`DT_DATA`) VALUES (12,NEW.`DC_PRODUTO`,NEW.`DC_PRECO`,NEW.`DC_UNIDADE`,NEW.`DT_DATA`); END IF;
    IF(NEW.DC_PRODUTO = 'Citros') THEN INSERT IGNORE INTO COTACOES (`COD_PRODUTO`,`DC_PRODUTO`,`DC_PRECO`,`DC_UNIDADE`,`DT_DATA`) VALUES (13,NEW.`DC_PRODUTO`,NEW.`DC_PRECO`,NEW.`DC_UNIDADE`,NEW.`DT_DATA`); END IF;
    IF(NEW.DC_PRODUTO = 'Etanol Anidro -  PE') THEN INSERT IGNORE INTO COTACOES (`COD_PRODUTO`,`DC_PRODUTO`,`DC_PRECO`,`DC_UNIDADE`,`DT_DATA`) VALUES (14,NEW.`DC_PRODUTO`,NEW.`DC_PRECO`,NEW.`DC_UNIDADE`,NEW.`DT_DATA`); END IF;
    IF(NEW.DC_PRODUTO = 'Etanol Anidro - AL') THEN INSERT IGNORE INTO COTACOES (`COD_PRODUTO`,`DC_PRODUTO`,`DC_PRECO`,`DC_UNIDADE`,`DT_DATA`) VALUES (15,NEW.`DC_PRODUTO`,NEW.`DC_PRECO`,NEW.`DC_UNIDADE`,NEW.`DT_DATA`); END IF;
    IF(NEW.DC_PRODUTO = 'Etanol Anidro - MT') THEN INSERT IGNORE INTO COTACOES (`COD_PRODUTO`,`DC_PRODUTO`,`DC_PRECO`,`DC_UNIDADE`,`DT_DATA`) VALUES (16,NEW.`DC_PRODUTO`,NEW.`DC_PRECO`,NEW.`DC_UNIDADE`,NEW.`DT_DATA`); END IF;
    IF(NEW.DC_PRODUTO = 'Etanol Anidro - SP ') THEN INSERT IGNORE INTO COTACOES (`COD_PRODUTO`,`DC_PRODUTO`,`DC_PRECO`,`DC_UNIDADE`,`DT_DATA`) VALUES (17,NEW.`DC_PRODUTO`,NEW.`DC_PRECO`,NEW.`DC_UNIDADE`,NEW.`DT_DATA`); END IF;
    IF(NEW.DC_PRODUTO = 'Etanol Hidratado - AL') THEN INSERT IGNORE INTO COTACOES (`COD_PRODUTO`,`DC_PRODUTO`,`DC_PRECO`,`DC_UNIDADE`,`DT_DATA`) VALUES (18,NEW.`DC_PRODUTO`,NEW.`DC_PRECO`,NEW.`DC_UNIDADE`,NEW.`DT_DATA`); END IF;
    IF(NEW.DC_PRODUTO = 'Etanol Hidratado - GO') THEN INSERT IGNORE INTO COTACOES (`COD_PRODUTO`,`DC_PRODUTO`,`DC_PRECO`,`DC_UNIDADE`,`DT_DATA`) VALUES (19,NEW.`DC_PRODUTO`,NEW.`DC_PRECO`,NEW.`DC_UNIDADE`,NEW.`DT_DATA`); END IF;
    IF(NEW.DC_PRODUTO = 'Etanol Hidratado - MT') THEN INSERT IGNORE INTO COTACOES (`COD_PRODUTO`,`DC_PRODUTO`,`DC_PRECO`,`DC_UNIDADE`,`DT_DATA`) VALUES (20,NEW.`DC_PRODUTO`,NEW.`DC_PRECO`,NEW.`DC_UNIDADE`,NEW.`DT_DATA`); END IF;
    IF(NEW.DC_PRODUTO = 'Etanol Hidratado - PE') THEN INSERT IGNORE INTO COTACOES (`COD_PRODUTO`,`DC_PRODUTO`,`DC_PRECO`,`DC_UNIDADE`,`DT_DATA`) VALUES (21,NEW.`DC_PRODUTO`,NEW.`DC_PRECO`,NEW.`DC_UNIDADE`,NEW.`DT_DATA`); END IF;
    IF(NEW.DC_PRODUTO = 'Etanol Hidratado - SP ') THEN INSERT IGNORE INTO COTACOES (`COD_PRODUTO`,`DC_PRODUTO`,`DC_PRECO`,`DC_UNIDADE`,`DT_DATA`) VALUES (22,NEW.`DC_PRODUTO`,NEW.`DC_PRECO`,NEW.`DC_UNIDADE`,NEW.`DT_DATA`); END IF;
    IF(NEW.DC_PRODUTO = 'Frango Congelado ') THEN INSERT IGNORE INTO COTACOES (`COD_PRODUTO`,`DC_PRODUTO`,`DC_PRECO`,`DC_UNIDADE`,`DT_DATA`) VALUES (23,NEW.`DC_PRODUTO`,NEW.`DC_PRECO`,NEW.`DC_UNIDADE`,NEW.`DT_DATA`); END IF;
    IF(NEW.DC_PRODUTO = 'Frango Resfriado') THEN INSERT IGNORE INTO COTACOES (`COD_PRODUTO`,`DC_PRODUTO`,`DC_PRECO`,`DC_UNIDADE`,`DT_DATA`) VALUES (24,NEW.`DC_PRODUTO`,NEW.`DC_PRECO`,NEW.`DC_UNIDADE`,NEW.`DT_DATA`); END IF;
    IF(NEW.DC_PRODUTO = 'Leite') THEN INSERT IGNORE INTO COTACOES (`COD_PRODUTO`,`DC_PRODUTO`,`DC_PRECO`,`DC_UNIDADE`,`DT_DATA`) VALUES (25,NEW.`DC_PRODUTO`,NEW.`DC_PRECO`,NEW.`DC_UNIDADE`,NEW.`DT_DATA`); END IF;
    IF(NEW.DC_PRODUTO = 'Mandioca') THEN INSERT IGNORE INTO COTACOES (`COD_PRODUTO`,`DC_PRODUTO`,`DC_PRECO`,`DC_UNIDADE`,`DT_DATA`) VALUES (26,NEW.`DC_PRODUTO`,NEW.`DC_PRECO`,NEW.`DC_UNIDADE`,NEW.`DT_DATA`); END IF;
    IF(NEW.DC_PRODUTO = 'Milho') THEN INSERT IGNORE INTO COTACOES (`COD_PRODUTO`,`DC_PRODUTO`,`DC_PRECO`,`DC_UNIDADE`,`DT_DATA`) VALUES (27,NEW.`DC_PRODUTO`,NEW.`DC_PRECO`,NEW.`DC_UNIDADE`,NEW.`DT_DATA`); END IF;
    IF(NEW.DC_PRODUTO = 'Ovino - CE') THEN INSERT IGNORE INTO COTACOES (`COD_PRODUTO`,`DC_PRODUTO`,`DC_PRECO`,`DC_UNIDADE`,`DT_DATA`) VALUES (28,NEW.`DC_PRODUTO`,NEW.`DC_PRECO`,NEW.`DC_UNIDADE`,NEW.`DT_DATA`); END IF;
    IF(NEW.DC_PRODUTO = 'Ovino - MS') THEN INSERT IGNORE INTO COTACOES (`COD_PRODUTO`,`DC_PRODUTO`,`DC_PRECO`,`DC_UNIDADE`,`DT_DATA`) VALUES (29,NEW.`DC_PRODUTO`,NEW.`DC_PRECO`,NEW.`DC_UNIDADE`,NEW.`DT_DATA`); END IF;
    IF(NEW.DC_PRODUTO = 'Ovino - MT') THEN INSERT IGNORE INTO COTACOES (`COD_PRODUTO`,`DC_PRODUTO`,`DC_PRECO`,`DC_UNIDADE`,`DT_DATA`) VALUES (30,NEW.`DC_PRODUTO`,NEW.`DC_PRECO`,NEW.`DC_UNIDADE`,NEW.`DT_DATA`); END IF;
    IF(NEW.DC_PRODUTO = 'Ovino - PR') THEN INSERT IGNORE INTO COTACOES (`COD_PRODUTO`,`DC_PRODUTO`,`DC_PRECO`,`DC_UNIDADE`,`DT_DATA`) VALUES (31,NEW.`DC_PRODUTO`,NEW.`DC_PRECO`,NEW.`DC_UNIDADE`,NEW.`DT_DATA`); END IF;
    IF(NEW.DC_PRODUTO = 'Ovino - RS') THEN INSERT IGNORE INTO COTACOES (`COD_PRODUTO`,`DC_PRODUTO`,`DC_PRECO`,`DC_UNIDADE`,`DT_DATA`) VALUES (32,NEW.`DC_PRODUTO`,NEW.`DC_PRECO`,NEW.`DC_UNIDADE`,NEW.`DT_DATA`); END IF;
    IF(NEW.DC_PRODUTO = 'Ovino - SP') THEN INSERT IGNORE INTO COTACOES (`COD_PRODUTO`,`DC_PRODUTO`,`DC_PRECO`,`DC_UNIDADE`,`DT_DATA`) VALUES (33,NEW.`DC_PRODUTO`,NEW.`DC_PRECO`,NEW.`DC_UNIDADE`,NEW.`DT_DATA`); END IF;
    IF(NEW.DC_PRODUTO = 'Ovos') THEN INSERT IGNORE INTO COTACOES (`COD_PRODUTO`,`DC_PRODUTO`,`DC_PRECO`,`DC_UNIDADE`,`DT_DATA`) VALUES (34,NEW.`DC_PRODUTO`,NEW.`DC_PRECO`,NEW.`DC_UNIDADE`,NEW.`DT_DATA`); END IF;
    IF(NEW.DC_PRODUTO = 'Soja - PR') THEN INSERT IGNORE INTO COTACOES (`COD_PRODUTO`,`DC_PRODUTO`,`DC_PRECO`,`DC_UNIDADE`,`DT_DATA`) VALUES (35,NEW.`DC_PRODUTO`,NEW.`DC_PRECO`,NEW.`DC_UNIDADE`,NEW.`DT_DATA`); END IF;
    IF(NEW.DC_PRODUTO = 'Soja Paranaguá') THEN INSERT IGNORE INTO COTACOES (`COD_PRODUTO`,`DC_PRODUTO`,`DC_PRECO`,`DC_UNIDADE`,`DT_DATA`) VALUES (36,NEW.`DC_PRODUTO`,NEW.`DC_PRECO`,NEW.`DC_UNIDADE`,NEW.`DT_DATA`); END IF;
    IF(NEW.DC_PRODUTO = 'Suíno - MG') THEN INSERT IGNORE INTO COTACOES (`COD_PRODUTO`,`DC_PRODUTO`,`DC_PRECO`,`DC_UNIDADE`,`DT_DATA`) VALUES (37,NEW.`DC_PRODUTO`,NEW.`DC_PRECO`,NEW.`DC_UNIDADE`,NEW.`DT_DATA`); END IF;
    IF(NEW.DC_PRODUTO = 'Suíno - PR') THEN INSERT IGNORE INTO COTACOES (`COD_PRODUTO`,`DC_PRODUTO`,`DC_PRECO`,`DC_UNIDADE`,`DT_DATA`) VALUES (38,NEW.`DC_PRODUTO`,NEW.`DC_PRECO`,NEW.`DC_UNIDADE`,NEW.`DT_DATA`); END IF;
    IF(NEW.DC_PRODUTO = 'Suíno - RS') THEN INSERT IGNORE INTO COTACOES (`COD_PRODUTO`,`DC_PRODUTO`,`DC_PRECO`,`DC_UNIDADE`,`DT_DATA`) VALUES (39,NEW.`DC_PRODUTO`,NEW.`DC_PRECO`,NEW.`DC_UNIDADE`,NEW.`DT_DATA`); END IF;
    IF(NEW.DC_PRODUTO = 'Suíno - SC') THEN INSERT IGNORE INTO COTACOES (`COD_PRODUTO`,`DC_PRODUTO`,`DC_PRECO`,`DC_UNIDADE`,`DT_DATA`) VALUES (40,NEW.`DC_PRODUTO`,NEW.`DC_PRECO`,NEW.`DC_UNIDADE`,NEW.`DT_DATA`); END IF;
    IF(NEW.DC_PRODUTO = 'Suíno - SP') THEN INSERT IGNORE INTO COTACOES (`COD_PRODUTO`,`DC_PRODUTO`,`DC_PRECO`,`DC_UNIDADE`,`DT_DATA`) VALUES (41,NEW.`DC_PRODUTO`,NEW.`DC_PRECO`,NEW.`DC_UNIDADE`,NEW.`DT_DATA`); END IF;
    IF(NEW.DC_PRODUTO = 'Suíno - carcaça especial') THEN INSERT IGNORE INTO COTACOES (`COD_PRODUTO`,`DC_PRODUTO`,`DC_PRECO`,`DC_UNIDADE`,`DT_DATA`) VALUES (42,NEW.`DC_PRODUTO`,NEW.`DC_PRECO`,NEW.`DC_UNIDADE`,NEW.`DT_DATA`); END IF;
    IF(NEW.DC_PRODUTO = 'Trigo - PR') THEN INSERT IGNORE INTO COTACOES (`COD_PRODUTO`,`DC_PRODUTO`,`DC_PRECO`,`DC_UNIDADE`,`DT_DATA`) VALUES (43,NEW.`DC_PRODUTO`,NEW.`DC_PRECO`,NEW.`DC_UNIDADE`,NEW.`DT_DATA`); END IF;
    IF(NEW.DC_PRODUTO = 'Trigo - RS') THEN INSERT IGNORE INTO COTACOES (`COD_PRODUTO`,`DC_PRODUTO`,`DC_PRECO`,`DC_UNIDADE`,`DT_DATA`) VALUES (44,NEW.`DC_PRODUTO`,NEW.`DC_PRECO`,NEW.`DC_UNIDADE`,NEW.`DT_DATA`); END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `cotacoes`
--

DROP TABLE IF EXISTS `cotacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cotacoes` (
  `COD_PRODUTO` int(11) DEFAULT NULL,
  `DC_PRODUTO` varchar(255) NOT NULL,
  `DC_PRECO` varchar(255) NOT NULL,
  `DC_UNIDADE` varchar(255) NOT NULL,
  `DT_DATA` datetime NOT NULL,
  PRIMARY KEY (`DC_PRODUTO`,`DT_DATA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cotacoes`
--

LOCK TABLES `cotacoes` WRITE;
/*!40000 ALTER TABLE `cotacoes` DISABLE KEYS */;
INSERT INTO `cotacoes` VALUES (1,'Açúcar - AL','R$ 63,80','sc de 50kg','2018-10-01 00:00:00'),(2,'Açúcar - PB','R$ 54,80','sc de 50kg','2018-10-01 00:00:00'),(3,'Açúcar - PE','R$ 64,77','sc de 50kg','2018-10-01 00:00:00'),(4,'Açúcar - Santos','R$ 66,87','sc de 50kg','2018-11-01 00:00:00'),(4,'Açúcar - Santos','R$ 67,76','sc de 50kg','2018-11-09 00:00:00'),(4,'Açúcar - Santos','R$ 66,50','sc de 50kg','2018-11-16 00:00:00'),(5,'Açúcar - SP','R$ 66,33','sc de 50kg','2018-11-01 00:00:00'),(5,'Açúcar - SP','R$ 67,96','sc de 50kg','2018-11-09 00:00:00'),(5,'Açúcar - SP','R$ 67,11','sc de 50kg','2018-11-16 00:00:00'),(6,'Algodão','¢R$ 293,79','lp','2018-11-01 00:00:00'),(6,'Algodão','¢R$ 294,01','lp','2018-11-09 00:00:00'),(6,'Algodão','¢R$ 296,53','lp','2018-11-16 00:00:00'),(7,'Arroz','R$ 43,18','sc de 50kg','2018-11-01 00:00:00'),(7,'Arroz','R$ 42,46','sc de 50kg','2018-11-09 00:00:00'),(7,'Arroz','R$ 41,91','sc de 50kg','2018-11-16 00:00:00'),(8,'Bezerro - MS','R$ 1.212,73','cabeça','2018-11-01 00:00:00'),(8,'Bezerro - MS','R$ 1.224,11','cabeça','2018-11-09 00:00:00'),(8,'Bezerro - MS','R$ 1.208,19','cabeça','2018-11-16 00:00:00'),(9,'Bezerro - SP','R$ 1.218,61','cabeça','2018-11-01 00:00:00'),(9,'Bezerro - SP','R$ 1.213,69','cabeça','2018-11-09 00:00:00'),(9,'Bezerro - SP','R$ 1.224,16','cabeça','2018-11-16 00:00:00'),(10,'Boi Gordo','R$ 145,10','@','2018-11-01 00:00:00'),(10,'Boi Gordo','R$ 145,45','@','2018-11-09 00:00:00'),(10,'Boi Gordo','R$ 146,70','@','2018-11-16 00:00:00'),(11,'Café Arábica','R$ 446,22','sc de 60kg','2018-11-01 00:00:00'),(11,'Café Arábica','R$ 445,33','sc de 60kg','2018-11-09 00:00:00'),(11,'Café Arábica','R$ 441,19','sc de 60kg','2018-11-16 00:00:00'),(12,'Café Robusta','R$ 333,08','sc de 60kg','2018-11-01 00:00:00'),(12,'Café Robusta','R$ 333,79','sc de 60kg','2018-11-09 00:00:00'),(12,'Café Robusta','R$ 334,33','sc de 60kg','2018-11-16 00:00:00'),(13,'Citros','R$ 31,37','cx de 40,8kg','2018-11-01 00:00:00'),(13,'Citros','R$ 30,62','cx de 40,8kg','2018-11-09 00:00:00'),(13,'Citros','R$ 29,82','cx de 40,8kg','2018-11-16 00:00:00'),(14,'Etanol Anidro -  PE','R$ 1,989','litro','2018-10-19 00:00:00'),(15,'Etanol Anidro - AL','R$ 1,9888','litro','2018-10-26 00:00:00'),(15,'Etanol Anidro - AL','R$ 1,967','litro','2018-11-09 00:00:00'),(16,'Etanol Anidro - MT','R$ 2.258,04','m3','2018-11-01 00:00:00'),(16,'Etanol Anidro - MT','R$ 2.194,76','m3','2018-11-09 00:00:00'),(16,'Etanol Anidro - MT','R$ 2.168,90','m3','2018-11-16 00:00:00'),(17,'Etanol Anidro - SP ','R$ 1,9394','litro','2018-11-01 00:00:00'),(17,'Etanol Anidro - SP ','R$ 1,8982','litro','2018-11-09 00:00:00'),(17,'Etanol Anidro - SP ','R$ 1,8564','litro','2018-11-16 00:00:00'),(18,'Etanol Hidratado - AL','R$ 1,6179','litro','2018-11-01 00:00:00'),(18,'Etanol Hidratado - AL','R$ 1,5906','litro','2018-11-09 00:00:00'),(18,'Etanol Hidratado - AL','R$ 1,5842','litro','2018-11-16 00:00:00'),(19,'Etanol Hidratado - GO','R$ 1,9479','litro','2018-10-19 00:00:00'),(19,'Etanol Hidratado - GO','R$ 1,8506','litro','2018-11-09 00:00:00'),(19,'Etanol Hidratado - GO','R$ 1,805','litro','2018-11-16 00:00:00'),(20,'Etanol Hidratado - MT','R$ 2.578,14','m3','2018-04-06 00:00:00'),(21,'Etanol Hidratado - PE','R$ 1,6159','litro','2018-11-01 00:00:00'),(21,'Etanol Hidratado - PE','R$ 1,5885','litro','2018-11-09 00:00:00'),(21,'Etanol Hidratado - PE','R$ 1,5677','litro','2018-11-16 00:00:00'),(22,'Etanol Hidratado - SP ','R$ 1,7315','litro','2018-11-01 00:00:00'),(22,'Etanol Hidratado - SP ','R$ 1,6738','litro','2018-11-09 00:00:00'),(22,'Etanol Hidratado - SP ','R$ 1,6434','litro','2018-11-16 00:00:00'),(23,'Frango Congelado ','R$ 4,30','kg','2018-11-01 00:00:00'),(23,'Frango Congelado ','R$ 4,46','kg','2018-11-09 00:00:00'),(23,'Frango Congelado ','R$ 4,51','kg','2018-11-16 00:00:00'),(24,'Frango Resfriado','R$ 4,38','kg','2018-11-01 00:00:00'),(24,'Frango Resfriado','R$ 4,46','kg','2018-11-09 00:00:00'),(24,'Frango Resfriado','R$ 4,61','kg','2018-11-16 00:00:00'),(25,'Leite','R$ 1,549','litro','2018-10-01 00:00:00'),(26,'Mandioca','R$ 445,45','t','2018-10-29 00:00:00'),(26,'Mandioca','R$ 433,03','t','2018-11-05 00:00:00'),(26,'Mandioca','R$ 414,97','t','2018-11-12 00:00:00'),(27,'Milho','R$ 34,26','sc de 60kg','2018-11-01 00:00:00'),(27,'Milho','R$ 35,98','sc de 60kg','2018-11-09 00:00:00'),(27,'Milho','R$ 36,81','sc de 60kg','2018-11-16 00:00:00'),(28,'Ovino - CE','R$ 5,90','kg','2018-08-01 00:00:00'),(29,'Ovino - MS','R$ 7,63','kg','2018-09-01 00:00:00'),(30,'Ovino - MT','R$ 6,50','kg','2018-09-01 00:00:00'),(31,'Ovino - PR','R$ 7,78','kg','2018-09-01 00:00:00'),(32,'Ovino - RS','R$ 6,70','kg','2018-09-01 00:00:00'),(33,'Ovino - SP','R$ 8,62','kg','2018-09-01 00:00:00'),(34,'Ovos','R$ 57,66','cx 30 dúzias','2018-10-26 00:00:00'),(34,'Ovos','R$ 58,69','cx 30 dúzias','2018-11-01 00:00:00'),(34,'Ovos','R$ 64,07','cx 30 dúzias','2018-11-09 00:00:00'),(35,'Soja - PR','R$ 79,88','sc de 60kg','2018-11-01 00:00:00'),(35,'Soja - PR','R$ 79,43','sc de 60kg','2018-11-09 00:00:00'),(35,'Soja - PR','R$ 78,49','sc de 60kg','2018-11-16 00:00:00'),(36,'Soja Paranaguá','R$ 85,79','sc de 60kg','2018-11-01 00:00:00'),(36,'Soja Paranaguá','R$ 85,28','sc de 60kg','2018-11-09 00:00:00'),(36,'Soja Paranaguá','R$ 84,62','sc de 60kg','2018-11-16 00:00:00'),(42,'Suíno - carcaça especial','R$ 5,84','kg','2018-11-01 00:00:00'),(42,'Suíno - carcaça especial','R$ 5,98','kg','2018-11-09 00:00:00'),(42,'Suíno - carcaça especial','R$ 6,03','kg','2018-11-16 00:00:00'),(37,'Suíno - MG','R$ 3,95','kg','2018-11-01 00:00:00'),(37,'Suíno - MG','R$ 3,90','kg','2018-11-09 00:00:00'),(37,'Suíno - MG','R$ 3,97','kg','2018-11-16 00:00:00'),(38,'Suíno - PR','R$ 3,49','kg','2018-11-01 00:00:00'),(38,'Suíno - PR','R$ 3,52','kg','2018-11-09 00:00:00'),(38,'Suíno - PR','R$ 3,63','kg','2018-11-16 00:00:00'),(39,'Suíno - RS','R$ 3,06','kg','2018-11-01 00:00:00'),(39,'Suíno - RS','R$ 3,10','kg','2018-11-09 00:00:00'),(39,'Suíno - RS','R$ 3,13','kg','2018-11-16 00:00:00'),(40,'Suíno - SC','R$ 3,15','kg','2018-11-01 00:00:00'),(40,'Suíno - SC','R$ 3,17','kg','2018-11-09 00:00:00'),(40,'Suíno - SC','R$ 3,27','kg','2018-11-16 00:00:00'),(41,'Suíno - SP','R$ 3,84','kg','2018-11-01 00:00:00'),(41,'Suíno - SP','R$ 3,82','kg','2018-11-09 00:00:00'),(41,'Suíno - SP','R$ 3,88','kg','2018-11-16 00:00:00'),(43,'Trigo - PR','R$ 803,86','t','2018-11-01 00:00:00'),(43,'Trigo - PR','R$ 808,32','t','2018-11-09 00:00:00'),(43,'Trigo - PR','R$ 824,11','t','2018-11-16 00:00:00'),(44,'Trigo - RS','R$ 747,79','t','2018-11-01 00:00:00'),(44,'Trigo - RS','R$ 733,35','t','2018-11-09 00:00:00'),(44,'Trigo - RS','R$ 742,27','t','2018-11-16 00:00:00');
/*!40000 ALTER TABLE `cotacoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `produtos` (
  `COD_PRODUTO` int(11) NOT NULL,
  `NM_PRODUTO` varchar(255) NOT NULL,
  PRIMARY KEY (`COD_PRODUTO`,`NM_PRODUTO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES (1,'Açúcar - AL'),(2,'Açúcar - PB'),(3,'Açúcar - PE'),(4,'Açúcar - Santos'),(5,'Açúcar - SP'),(6,'Algodão'),(7,'Arroz'),(8,'Bezerro - MS'),(9,'Bezerro - SP'),(10,'Boi Gordo'),(11,'Café Arábica'),(12,'Café Robusta'),(13,'Citros'),(14,'Etanol Anidro -  PE'),(15,'Etanol Anidro - AL'),(16,'Etanol Anidro - MT'),(17,'Etanol Anidro - SP '),(18,'Etanol Hidratado - AL'),(19,'Etanol Hidratado - GO'),(20,'Etanol Hidratado - MT'),(21,'Etanol Hidratado - PE'),(22,'Etanol Hidratado - SP '),(23,'Frango Congelado '),(24,'Frango Resfriado'),(25,'Leite'),(26,'Mandioca'),(27,'Milho'),(28,'Ovino - CE'),(29,'Ovino - MS'),(30,'Ovino - MT'),(31,'Ovino - PR'),(32,'Ovino - RS'),(33,'Ovino - SP'),(34,'Ovos'),(35,'Soja - PR'),(36,'Soja Paranaguá'),(37,'Suíno - MG'),(38,'Suíno - PR'),(39,'Suíno - RS'),(40,'Suíno - SC'),(41,'Suíno - SP'),(42,'Suíno - carcaça especial'),(43,'Trigo - PR'),(44,'Trigo - RS');
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `ID_USER` int(11) NOT NULL AUTO_INCREMENT,
  `EMAIL` varchar(200) NOT NULL,
  `SENHA` varchar(40) NOT NULL,
  `NOME` varchar(250) NOT NULL,
  `UF` varchar(250) NOT NULL,
  `CIDADE` varchar(100) NOT NULL,
  `TELEFONE` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_USER`,`EMAIL`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'felipe@gmail.com','123456','Felipe Gerolomo','PR','Maringá','(44) 9 99725286'),(2,'jose@gmail.com','12345','Felipe','genesis','saturn','44444444444444'),(3,'ricardo@gmail.com','123456','Ricardo','Paraná','Maringá','11111111111'),(4,'lucas@gmail.com','123456','Lucas Oliveira','Paraná','Maringá','44 9 9972-5286');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_config`
--

DROP TABLE IF EXISTS `user_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_config` (
  `COD_USER` int(11) NOT NULL,
  `COD_PRODUTO` int(11) NOT NULL,
  PRIMARY KEY (`COD_USER`,`COD_PRODUTO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_config`
--

LOCK TABLES `user_config` WRITE;
/*!40000 ALTER TABLE `user_config` DISABLE KEYS */;
INSERT INTO `user_config` VALUES (1,1),(1,6),(1,10),(1,14),(1,20),(2,1),(2,2),(2,3),(2,9),(2,12),(4,1),(4,2),(4,4),(4,5);
/*!40000 ALTER TABLE `user_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'agroamigos'
--

--
-- Dumping routines for database 'agroamigos'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-19  0:08:06
