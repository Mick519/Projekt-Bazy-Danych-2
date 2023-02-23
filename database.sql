-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: projektdb
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `akcesoria`
--

DROP TABLE IF EXISTS `akcesoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `akcesoria` (
  `model_akcesorium` varchar(255) NOT NULL,
  `producent` varchar(255) DEFAULT NULL,
  `identyfikator_wewnetrzny_modelu` varchar(255) NOT NULL,
  `ilosc` int DEFAULT NULL,
  PRIMARY KEY (`identyfikator_wewnetrzny_modelu`),
  UNIQUE KEY `model_akcesorium_UNIQUE` (`model_akcesorium`),
  UNIQUE KEY `identyfikator_wewnetrzny_modelu_UNIQUE` (`identyfikator_wewnetrzny_modelu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `akcesoria`
--

LOCK TABLES `akcesoria` WRITE;
/*!40000 ALTER TABLE `akcesoria` DISABLE KEYS */;
INSERT INTO `akcesoria` VALUES ('Słuchawki nauszne','Sony','23454',28),('Słuchawki douszne','Samsung','23455',20),('Myszka przewodowa','Logitech','23456',69),('Klawiatura przewodowa','Logitech','23457',60),('Podkłądka pod myszkę','Steelseries','23458',20),('Adapter 1 USB A do 4 USB A','Logitech','23459',10),('Adapter USB C do USB A','Logitech','23460',0),('Klucz 2FA','Yubico','23461',47),('Ładowarka do laptopa','Dell','23462',23),('Ładowarka do telefonu USB C','Samsung','23463',82),('Kabel hdmi','HP','23564',45);
/*!40000 ALTER TABLE `akcesoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `calkowita_lista_sprzetu`
--

DROP TABLE IF EXISTS `calkowita_lista_sprzetu`;
/*!50001 DROP VIEW IF EXISTS `calkowita_lista_sprzetu`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `calkowita_lista_sprzetu` AS SELECT 
 1 AS `model_sprzetu`,
 1 AS `identyfikator_wewnetrzny_sprzetu`,
 1 AS `adres_mac_ethernet`,
 1 AS `adres_mac_wifi`,
 1 AS `numer_seryjny`,
 1 AS `producent`,
 1 AS `cykl_zycia`,
 1 AS `stan`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `historia_operacji`
--

DROP TABLE IF EXISTS `historia_operacji`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historia_operacji` (
  `operacja` enum('przypisanie','zwrot') NOT NULL,
  `data_operacji` date NOT NULL,
  `identyfikator_wewnetrzny_modelu` varchar(255) NOT NULL,
  `identyfikator_wewnetrzny_uzytkownika` int DEFAULT NULL,
  `rodzaj` enum('sprzet','akcesorium') NOT NULL,
  KEY `historia_identyfikator_wewnetrzny_uzytkownika_idx` (`identyfikator_wewnetrzny_uzytkownika`),
  KEY `historia_identyfikator_wewnetrzny_sprzetu_idx` (`identyfikator_wewnetrzny_modelu`),
  CONSTRAINT `historia_identyfikator_wewnetrzny_uzytkownika` FOREIGN KEY (`identyfikator_wewnetrzny_uzytkownika`) REFERENCES `uzytkownicy` (`identyfikator_wewnetrzny_uzytkownika`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historia_operacji`
--

LOCK TABLES `historia_operacji` WRITE;
/*!40000 ALTER TABLE `historia_operacji` DISABLE KEYS */;
INSERT INTO `historia_operacji` VALUES ('przypisanie','2022-05-15','7800001',123457,'sprzet'),('przypisanie','2022-05-15','7800013',123456,'sprzet'),('przypisanie','2022-05-15','7800014',123458,'sprzet'),('przypisanie','2022-05-15','7800021',123457,'sprzet'),('przypisanie','2022-05-15','7800022',123456,'sprzet'),('zwrot','2022-05-15','7800022',NULL,'sprzet'),('zwrot','2022-05-15','7800014',NULL,'sprzet'),('przypisanie','2022-05-15','23454',123456,'akcesorium'),('przypisanie','2022-05-15','23454',123456,'akcesorium'),('zwrot','2022-05-16','7800013',NULL,'sprzet'),('zwrot','2022-05-16','7800001',NULL,'sprzet'),('przypisanie','2022-05-16','7800001',123456,'sprzet'),('zwrot','2022-05-16','7800001',NULL,'sprzet'),('przypisanie','2022-05-16','7800001',123456,'sprzet'),('zwrot','2022-05-16','7800001',NULL,'sprzet'),('przypisanie','2022-05-16','7800001',123456,'sprzet'),('zwrot','2022-05-16','7800001',NULL,'sprzet'),('przypisanie','2022-05-16','7800001',123456,'sprzet'),('zwrot','2022-05-16','7800001',NULL,'sprzet'),('przypisanie','2022-05-16','7800001',123456,'sprzet'),('zwrot','2022-05-16','7800001',NULL,'sprzet'),('przypisanie','2022-05-16','7800001',123456,'sprzet'),('zwrot','2022-05-16','7800001',NULL,'sprzet'),('przypisanie','2022-05-16','7800001',123456,'sprzet'),('zwrot','2022-05-16','7800001',NULL,'sprzet'),('przypisanie','2022-05-16','7800001',123456,'sprzet'),('zwrot','2022-05-16','7800001',NULL,'sprzet'),('przypisanie','2022-05-16','7800001',123456,'sprzet'),('przypisanie','2022-05-16','7800035',123456,'sprzet'),('przypisanie','2022-05-16','7800003',123457,'sprzet'),('zwrot','2022-11-15','7800035',NULL,'sprzet'),('przypisanie','2022-11-15','7800035',123456,'sprzet'),('zwrot','2022-11-15','7800035',NULL,'sprzet'),('przypisanie','2022-11-15','7800035',123456,'sprzet'),('przypisanie','2022-12-18','7800006',123459,'sprzet'),('zwrot','2022-12-18','7800035',NULL,'sprzet'),('zwrot','2022-12-18','7800006',NULL,'sprzet'),('przypisanie','2022-12-18','7800006',123459,'sprzet'),('zwrot','2022-12-18','7800006',NULL,'sprzet'),('przypisanie','2022-12-18','7800006',123459,'sprzet'),('zwrot','2022-12-18','7800006',NULL,'sprzet'),('przypisanie','2022-12-18','7800006',123459,'sprzet'),('zwrot','2022-12-18','7800006',NULL,'sprzet'),('przypisanie','2023-01-11','7800004',123456,'sprzet'),('zwrot','2023-01-13','7800007',NULL,'sprzet'),('zwrot','2023-01-13','7800007',NULL,'sprzet'),('zwrot','2023-01-13','7800007',NULL,'sprzet'),('przypisanie','2023-01-14','23564',123469,'akcesorium'),('przypisanie','2023-01-14','23564',123469,'akcesorium'),('przypisanie','2023-01-14','23564',123469,'akcesorium'),('przypisanie','2023-01-14','23564',123469,'akcesorium'),('przypisanie','2023-01-14','23564',123469,'akcesorium'),('przypisanie','2023-01-14','23463',123469,'akcesorium'),('przypisanie','2023-01-14','23463',123469,'akcesorium'),('przypisanie','2023-01-14','23463',123469,'akcesorium'),('przypisanie','2023-01-14','23463',123469,'akcesorium'),('przypisanie','2023-01-14','23463',123469,'akcesorium'),('przypisanie','2023-01-14','23463',123469,'akcesorium'),('przypisanie','2023-01-14','23463',123469,'akcesorium'),('przypisanie','2023-01-14','23463',123469,'akcesorium'),('przypisanie','2023-01-14','23457',123469,'akcesorium'),('przypisanie','2023-01-14','23457',123469,'akcesorium'),('przypisanie','2023-01-14','23457',123469,'akcesorium'),('przypisanie','2023-01-14','23457',123469,'akcesorium'),('przypisanie','2023-01-14','23457',123469,'akcesorium'),('przypisanie','2023-01-14','7800020',123469,'sprzet'),('przypisanie','2023-01-14','7800016',123470,'sprzet'),('zwrot','2023-01-14','7800016',NULL,'sprzet'),('przypisanie','2023-01-14','7800016',123470,'sprzet'),('przypisanie','2023-01-14','23463',123470,'akcesorium'),('przypisanie','2023-01-14','23463',123470,'akcesorium'),('przypisanie','2023-01-14','23463',123470,'akcesorium'),('przypisanie','2023-01-14','23463',123470,'akcesorium'),('przypisanie','2023-01-14','23463',123470,'akcesorium'),('przypisanie','2023-01-14','23463',123470,'akcesorium'),('przypisanie','2023-01-14','23463',123470,'akcesorium'),('przypisanie','2023-01-14','23463',123470,'akcesorium'),('przypisanie','2023-01-14','23463',123470,'akcesorium'),('przypisanie','2023-01-14','23463',123470,'akcesorium'),('zwrot','2023-01-14','7800016',NULL,'sprzet');
/*!40000 ALTER TABLE `historia_operacji` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `korelacja_uzytkownika_ze_sprzetem`
--

DROP TABLE IF EXISTS `korelacja_uzytkownika_ze_sprzetem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `korelacja_uzytkownika_ze_sprzetem` (
  `nazwa_hosta` varchar(255) NOT NULL,
  `identyfikator_wewnetrzny_uzytkownika` int NOT NULL,
  `uprawnienia` enum('niskie','średnie','wysokie') DEFAULT 'niskie',
  `identyfikator_wewnetrzny_sprzetu` varchar(255) NOT NULL,
  UNIQUE KEY `nazwa_hosta_UNIQUE` (`nazwa_hosta`),
  UNIQUE KEY `identyfikator_wewnetrzny_sprzetu_UNIQUE` (`identyfikator_wewnetrzny_sprzetu`),
  KEY `identyfikator_wewnetrzny_uzytkownika_idx` (`identyfikator_wewnetrzny_uzytkownika`),
  CONSTRAINT `korelacja_identyfikator_wewnetrzny_sprzetu` FOREIGN KEY (`identyfikator_wewnetrzny_sprzetu`) REFERENCES `sprzet` (`identyfikator_wewnetrzny_sprzetu`),
  CONSTRAINT `korelacja_identyfikator_wewnetrzny_uzytkownika` FOREIGN KEY (`identyfikator_wewnetrzny_uzytkownika`) REFERENCES `uzytkownicy` (`identyfikator_wewnetrzny_uzytkownika`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `korelacja_uzytkownika_ze_sprzetem`
--

LOCK TABLES `korelacja_uzytkownika_ze_sprzetem` WRITE;
/*!40000 ALTER TABLE `korelacja_uzytkownika_ze_sprzetem` DISABLE KEYS */;
INSERT INTO `korelacja_uzytkownika_ze_sprzetem` VALUES ('helenaradziemska1911',123469,'niskie','7800020'),('ivantswigun8891',123457,'niskie','7800003'),('michalwrobel5094',123456,'niskie','7800001'),('michalwrobel6620',123456,'niskie','7800004');
/*!40000 ALTER TABLE `korelacja_uzytkownika_ze_sprzetem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `lista_akcesoriow_w_magazynie`
--

DROP TABLE IF EXISTS `lista_akcesoriow_w_magazynie`;
/*!50001 DROP VIEW IF EXISTS `lista_akcesoriow_w_magazynie`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `lista_akcesoriow_w_magazynie` AS SELECT 
 1 AS `model_akcesorium`,
 1 AS `producent`,
 1 AS `identyfikator_wewnetrzny_modelu`,
 1 AS `ilosc`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `lista_sprzetu_w_magazynie`
--

DROP TABLE IF EXISTS `lista_sprzetu_w_magazynie`;
/*!50001 DROP VIEW IF EXISTS `lista_sprzetu_w_magazynie`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `lista_sprzetu_w_magazynie` AS SELECT 
 1 AS `model_sprzetu`,
 1 AS `identyfikator_wewnetrzny_sprzetu`,
 1 AS `adres_mac_ethernet`,
 1 AS `adres_mac_wifi`,
 1 AS `numer_seryjny`,
 1 AS `producent`,
 1 AS `cykl_zycia`,
 1 AS `stan`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `lista_uzytkownikow`
--

DROP TABLE IF EXISTS `lista_uzytkownikow`;
/*!50001 DROP VIEW IF EXISTS `lista_uzytkownikow`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `lista_uzytkownikow` AS SELECT 
 1 AS `imie`,
 1 AS `nazwisko`,
 1 AS `stanowisko`,
 1 AS `identyfikator_wewnetrzny_uzytkownika`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `przypisane_akcesoria`
--

DROP TABLE IF EXISTS `przypisane_akcesoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `przypisane_akcesoria` (
  `identyfikator_wewnetrzny_modelu` varchar(255) NOT NULL,
  `data_przypisania` date NOT NULL,
  `identyfikator_wewnetrzny_uzytkownika` int NOT NULL,
  `numer_operacji` int NOT NULL,
  UNIQUE KEY `numer_operacji_UNIQUE` (`numer_operacji`),
  KEY `przypisane_identyfikator_wewnetrzny_uzytkownika_idx` (`identyfikator_wewnetrzny_uzytkownika`),
  KEY `przypisane_identyfikator_wewnetrzny_modelu_idx` (`identyfikator_wewnetrzny_modelu`),
  CONSTRAINT `przypisane_identyfikator_wewnetrzny_modelu` FOREIGN KEY (`identyfikator_wewnetrzny_modelu`) REFERENCES `akcesoria` (`identyfikator_wewnetrzny_modelu`),
  CONSTRAINT `przypisane_identyfikator_wewnetrzny_uzytkownika` FOREIGN KEY (`identyfikator_wewnetrzny_uzytkownika`) REFERENCES `uzytkownicy` (`identyfikator_wewnetrzny_uzytkownika`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `przypisane_akcesoria`
--

LOCK TABLES `przypisane_akcesoria` WRITE;
/*!40000 ALTER TABLE `przypisane_akcesoria` DISABLE KEYS */;
INSERT INTO `przypisane_akcesoria` VALUES ('23460','2022-12-18',123460,1),('23460','2022-12-18',123460,2),('23460','2022-12-18',123460,3),('23460','2022-12-18',123460,4),('23456','2022-12-18',123460,6),('23564','2023-01-14',123469,7),('23564','2023-01-14',123469,8),('23564','2023-01-14',123469,9),('23564','2023-01-14',123469,10),('23564','2023-01-14',123469,11),('23463','2023-01-14',123469,12),('23463','2023-01-14',123469,13),('23463','2023-01-14',123469,14),('23463','2023-01-14',123469,15),('23463','2023-01-14',123469,16),('23463','2023-01-14',123469,17),('23463','2023-01-14',123469,18),('23463','2023-01-14',123469,19),('23457','2023-01-14',123469,20),('23457','2023-01-14',123469,21),('23457','2023-01-14',123469,22),('23457','2023-01-14',123469,23),('23457','2023-01-14',123469,24),('23463','2023-01-14',123470,25),('23463','2023-01-14',123470,26),('23463','2023-01-14',123470,27),('23463','2023-01-14',123470,28),('23463','2023-01-14',123470,29),('23463','2023-01-14',123470,30),('23463','2023-01-14',123470,31),('23463','2023-01-14',123470,32),('23463','2023-01-14',123470,33),('23463','2023-01-14',123470,34);
/*!40000 ALTER TABLE `przypisane_akcesoria` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `przypisane_akcesoria_BEFORE_INSERT` BEFORE INSERT ON `przypisane_akcesoria` FOR EACH ROW BEGIN
	IF (SELECT COUNT(uzytkownicy.identyfikator_wewnetrzny_uzytkownika) FROM uzytkownicy WHERE uzytkownicy.identyfikator_wewnetrzny_uzytkownika = new.identyfikator_wewnetrzny_uzytkownika) != 1 THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'identyfikator_wewnetrzny_uzytkownika does not exist';
	END IF;
    
    IF (SELECT COUNT(akcesoria.identyfikator_wewnetrzny_modelu) FROM akcesoria WHERE akcesoria.identyfikator_wewnetrzny_modelu = new.identyfikator_wewnetrzny_modelu) != 1 THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'identyfikator_wewnetrzny_modelu does not exist';
	END IF;
    
    IF (SELECT ilosc FROM akcesoria WHERE akcesoria.identyfikator_wewnetrzny_modelu = new.identyfikator_wewnetrzny_modelu) = 0 THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'selected accessory model is out of stock';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `przypisane_akcesoria_AFTER_INSERT` AFTER INSERT ON `przypisane_akcesoria` FOR EACH ROW BEGIN
	INSERT INTO historia_operacji (operacja, data_operacji, identyfikator_wewnetrzny_modelu, identyfikator_wewnetrzny_uzytkownika, rodzaj)
    VALUES ('przypisanie',  new.data_przypisania, new.identyfikator_wewnetrzny_modelu, new.identyfikator_wewnetrzny_uzytkownika, 'akcesorium');
    
    UPDATE akcesoria
    SET ilosc = (ilosc-1) 
    WHERE new.identyfikator_wewnetrzny_modelu = identyfikator_wewnetrzny_modelu;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `przypisany_sprzet`
--

DROP TABLE IF EXISTS `przypisany_sprzet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `przypisany_sprzet` (
  `identyfikator_wewnetrzny_sprzetu` varchar(255) NOT NULL,
  `data_przypisania` date NOT NULL,
  `identyfikator_wewntrzny_uzytkownika` int NOT NULL,
  UNIQUE KEY `identyfikator_wewnetrzny_sprzetu_UNIQUE` (`identyfikator_wewnetrzny_sprzetu`),
  KEY `identyfikator_wewnętrzny_uzytkownika_idx` (`identyfikator_wewntrzny_uzytkownika`),
  CONSTRAINT `przypisany_identyfikator_wewnetrzny_sprzetu` FOREIGN KEY (`identyfikator_wewnetrzny_sprzetu`) REFERENCES `sprzet` (`identyfikator_wewnetrzny_sprzetu`),
  CONSTRAINT `przypisany_identyfikator_wewnętrzny_uzytkownika` FOREIGN KEY (`identyfikator_wewntrzny_uzytkownika`) REFERENCES `uzytkownicy` (`identyfikator_wewnetrzny_uzytkownika`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `przypisany_sprzet`
--

LOCK TABLES `przypisany_sprzet` WRITE;
/*!40000 ALTER TABLE `przypisany_sprzet` DISABLE KEYS */;
INSERT INTO `przypisany_sprzet` VALUES ('7800001','2022-05-16',123456),('7800003','2022-05-16',123457),('7800004','2023-01-11',123456),('7800020','2023-01-14',123469);
/*!40000 ALTER TABLE `przypisany_sprzet` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `przypisany_sprzet_BEFORE_INSERT` BEFORE INSERT ON `przypisany_sprzet` FOR EACH ROW BEGIN
	IF (SELECT COUNT(sprzet.identyfikator_wewnetrzny_sprzetu) FROM sprzet WHERE sprzet.identyfikator_wewnetrzny_sprzetu = new.identyfikator_wewnetrzny_sprzetu) != 1 THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'identyfikator_wewnetrzny_sprzetu does not exist';
	END IF;
    
    IF (SELECT COUNT(uzytkownicy.identyfikator_wewnetrzny_uzytkownika) FROM uzytkownicy WHERE uzytkownicy.identyfikator_wewnetrzny_uzytkownika = new.identyfikator_wewntrzny_uzytkownika) != 1 THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'identyfikator_wewnetrzny_uzytkownika does not exist';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `przypisany_sprzet_AFTER_INSERT` AFTER INSERT ON `przypisany_sprzet` FOR EACH ROW BEGIN
	INSERT INTO historia_operacji (operacja, data_operacji, identyfikator_wewnetrzny_modelu, identyfikator_wewnetrzny_uzytkownika, rodzaj)
	VALUES ('przypisanie', new.data_przypisania, new.identyfikator_wewnetrzny_sprzetu, new.identyfikator_wewntrzny_uzytkownika, 'sprzet');
    
	UPDATE sprzet
	SET stan = 'przypisany', cykl_zycia = 'uzywany'
	WHERE new.identyfikator_wewnetrzny_sprzetu = identyfikator_wewnetrzny_sprzetu;
    
	IF (SELECT adres_mac_ethernet FROM sprzet WHERE identyfikator_wewnetrzny_sprzetu = new.identyfikator_wewnetrzny_sprzetu) IS NOT NULL THEN
		INSERT INTO korelacja_uzytkownika_ze_sprzetem (nazwa_hosta, identyfikator_wewnetrzny_uzytkownika, uprawnienia, identyfikator_wewnetrzny_sprzetu)
		VALUES (LOWER(CONCAT((SELECT imie FROM uzytkownicy WHERE (identyfikator_wewnetrzny_uzytkownika = new.identyfikator_wewntrzny_uzytkownika)), (SELECT nazwisko FROM uzytkownicy WHERE (identyfikator_wewnetrzny_uzytkownika = new.identyfikator_wewntrzny_uzytkownika)), (SELECT CAST((SELECT FLOOR(RAND()*(10000-1000)+1000)) AS char)))), new.identyfikator_wewntrzny_uzytkownika, 'niskie', new.identyfikator_wewnetrzny_sprzetu);
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `przypisany_sprzet_BEFORE_DELETE` BEFORE DELETE ON `przypisany_sprzet` FOR EACH ROW BEGIN
	UPDATE sprzet
    SET stan = 'w_magazynie', cykl_zycia = 'uzywany'
    WHERE OLD.identyfikator_wewnetrzny_sprzetu = identyfikator_wewnetrzny_sprzetu;
    
    INSERT INTO historia_operacji (operacja, data_operacji, identyfikator_wewnetrzny_modelu, rodzaj)
    VALUES ('zwrot', curdate(), old.identyfikator_wewnetrzny_sprzetu, 'sprzet');
    
	DELETE FROM korelacja_uzytkownika_ze_sprzetem 
    WHERE (OLD.identyfikator_wewnetrzny_sprzetu = identyfikator_wewnetrzny_sprzetu);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `sprzet`
--

DROP TABLE IF EXISTS `sprzet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sprzet` (
  `model_sprzetu` varchar(255) NOT NULL,
  `identyfikator_wewnetrzny_sprzetu` varchar(255) NOT NULL,
  `adres_mac_ethernet` varchar(255) DEFAULT NULL,
  `adres_mac_wifi` varchar(255) DEFAULT NULL,
  `numer_seryjny` varchar(255) DEFAULT NULL,
  `producent` varchar(255) DEFAULT NULL,
  `cykl_zycia` enum('nowy','uzywany') NOT NULL DEFAULT 'nowy',
  `stan` enum('przypisany','w_magazynie') NOT NULL,
  PRIMARY KEY (`identyfikator_wewnetrzny_sprzetu`),
  UNIQUE KEY `identyfikator_wewnetrzny_modelu_UNIQUE` (`identyfikator_wewnetrzny_sprzetu`),
  UNIQUE KEY `adres_mac_UNIQUE` (`adres_mac_ethernet`),
  UNIQUE KEY `adres_mac_wifi_UNIQUE` (`adres_mac_wifi`),
  UNIQUE KEY `numer_seryjny_UNIQUE` (`numer_seryjny`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sprzet`
--

LOCK TABLES `sprzet` WRITE;
/*!40000 ALTER TABLE `sprzet` DISABLE KEYS */;
INSERT INTO `sprzet` VALUES ('Laptop','7800001','00:1B:44:11:3A:D7','08:1B:44:12:3A:B7','QWE31324DE32','Asus','uzywany','przypisany'),('Laptop','7800002','00:1B:45:11:3A:B7','10:1B:44:12:3A:B7','D232DQWD3DD','Asus','nowy','w_magazynie'),('Laptop','7800003','00:1B:44:11:2A:B7','30:1B:44:12:3A:B7','23D23D423DQD','Asus','uzywany','przypisany'),('Laptop','7800004','00:3B:44:11:3A:B7','40:1B:44:12:3A:B7','FD43FWERF355','Asus','uzywany','przypisany'),('Laptop','7800005','00:1B:48:11:3A:B7','05:1B:44:12:3A:B7','344F43FDSF5F5','Asus','nowy','w_magazynie'),('Laptop','7800006','00:1B:44:11:3A:87','06:1B:44:12:3A:B7','G54G6567H7556','Asus','uzywany','w_magazynie'),('Laptop','7800008','00:1B:34:11:3A:B7','22:1B:44:12:3A:B7','BRT4B46654654','Asus','nowy','w_magazynie'),('Laptop','7800009','00:1B:44:11:DA:B7','11:1B:44:12:3A:B7','QWE313245E32','Asus','nowy','w_magazynie'),('Laptop','7800010','10:1B:44:11:3A:B7','13:1B:44:12:3A:B7','QWE61324DE32','Asus','nowy','w_magazynie'),('Laptop','7800011','02:1B:44:11:3A:B7','14:1B:44:12:3A:B7','QWE31334DE32','Asus','nowy','w_magazynie'),('Macbook','7800013','02:01:44:11:3A:B7','02:02:44:11:3A:B7','2D3D232DAWFF','Apple','uzywany','w_magazynie'),('Macbook','7800014','02:03:44:11:3A:B7','02:04:44:11:3A:B7','2DQWDWDSFGD','Apple','uzywany','w_magazynie'),('Macbook','7800015','02:05:44:11:3A:B7','02:06:44:11:3A:B7','453454FRFRF44','Apple','nowy','w_magazynie'),('Macbook','7800016','02:07:44:11:3A:B7','02:08:44:11:3A:B7','SDF3F4344FFFF','Apple','uzywany','w_magazynie'),('Macbook','7800017','02:09:44:11:3A:B7','02:10:44:11:3A:B7','3FRWFR34RF4F','Apple','nowy','w_magazynie'),('Macbook','7800018','02:01:11:11:3A:B7','02:02:12:11:3A:B7','556788798HHHF','Apple','nowy','w_magazynie'),('Macbook','7800019','02:01:13:11:3A:B7','02:02:14:11:3A:B7','43569YHFGG444','Apple','nowy','w_magazynie'),('Macbook','7800020','02:01:15:11:3A:B7','02:02:16:11:3A:B7','4T5GFFSGR5555R','Apple','uzywany','przypisany'),('Monitor','7800021','',NULL,'3FFEWF536G665','LG','uzywany','w_magazynie'),('Monitor','7800022',NULL,NULL,'3F5EWF536G665','LG','uzywany','w_magazynie'),('Monitor','7800023',NULL,NULL,'3FFEWG536G665','LG','nowy','w_magazynie'),('Monitor','7800024',NULL,NULL,'3F4EWF536G665','LG','nowy','w_magazynie'),('Monitor','7800025',NULL,NULL,'3FF7WF536G665','LG','nowy','w_magazynie'),('Monitor','7800026',NULL,NULL,'3FFEWF5369665','LG','nowy','w_magazynie'),('Monitor','7800027',NULL,NULL,'3FFEWF536G865','LG','nowy','w_magazynie'),('Monitor','7800028',NULL,NULL,'3FFEWF436G665','LG','nowy','w_magazynie'),('Monitor','7800029',NULL,NULL,'3FFDWF536G665','LG','nowy','w_magazynie'),('Monitor','7800030',NULL,NULL,'3FFEWR536G665','LG','nowy','w_magazynie'),('Monitor','7800031',NULL,NULL,'3FFEWF336G665','LG','nowy','w_magazynie'),('Monitor','7800032',NULL,NULL,'3FFEWF53RG665','LG','nowy','w_magazynie'),('Monitor','7800033',NULL,NULL,'3FFEWF5S6G665','LG','nowy','w_magazynie'),('Monitor','7800034',NULL,NULL,'3FFEWF526G665','LG','nowy','w_magazynie'),('Monitor','7800035',NULL,NULL,'3FFEWF936G665','LG','uzywany','w_magazynie'),('Monitor','7800036',NULL,NULL,'3FFEWFQQQG665','LG','nowy','w_magazynie'),('Monitor','7800037',NULL,NULL,'D24D2FQ234F2','LG','nowy','w_magazynie'),('Laptop','7800038','AS:23:SD:23:34:45','12:23:78:65:45:23','D2RF4224FD','LG','nowy','w_magazynie');
/*!40000 ALTER TABLE `sprzet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uzytkownicy`
--

DROP TABLE IF EXISTS `uzytkownicy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uzytkownicy` (
  `imie` varchar(255) NOT NULL,
  `nazwisko` varchar(255) NOT NULL,
  `stanowisko` enum('pracownik','manager','dyrektor','inne') DEFAULT NULL,
  `identyfikator_wewnetrzny_uzytkownika` int NOT NULL,
  PRIMARY KEY (`identyfikator_wewnetrzny_uzytkownika`),
  UNIQUE KEY `identyfikator_wewnetrzny_uzytkownika_UNIQUE` (`identyfikator_wewnetrzny_uzytkownika`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uzytkownicy`
--

LOCK TABLES `uzytkownicy` WRITE;
/*!40000 ALTER TABLE `uzytkownicy` DISABLE KEYS */;
INSERT INTO `uzytkownicy` VALUES ('Michal','Wrobel','dyrektor',123456),('Ivan','Tswigun','pracownik',123457),('Jakub','Kraszewski','inne',123459),('Stanisław','Kowalik','pracownik',123461),('Mateusz','Nowak','pracownik',123462),('Grzegorz','Kowalski','pracownik',123463),('Jan','Radek','manager',123464),('Helena','Radziemska','dyrektor',123469),('Kacper','Tomkiewicz','dyrektor',123470);
/*!40000 ALTER TABLE `uzytkownicy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'projektdb'
--

--
-- Dumping routines for database 'projektdb'
--
/*!50003 DROP PROCEDURE IF EXISTS `wyswietl_sprzet_przypisany_do_danego_uzytkownika` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `wyswietl_sprzet_przypisany_do_danego_uzytkownika`(indetyfikator INT)
BEGIN
	SELECT *FROM przypisany_sprzet WHERE (identyfikator_wewntrzny_uzytkownika = indetyfikator);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `calkowita_lista_sprzetu`
--

/*!50001 DROP VIEW IF EXISTS `calkowita_lista_sprzetu`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `calkowita_lista_sprzetu` AS select `sprzet`.`model_sprzetu` AS `model_sprzetu`,`sprzet`.`identyfikator_wewnetrzny_sprzetu` AS `identyfikator_wewnetrzny_sprzetu`,`sprzet`.`adres_mac_ethernet` AS `adres_mac_ethernet`,`sprzet`.`adres_mac_wifi` AS `adres_mac_wifi`,`sprzet`.`numer_seryjny` AS `numer_seryjny`,`sprzet`.`producent` AS `producent`,`sprzet`.`cykl_zycia` AS `cykl_zycia`,`sprzet`.`stan` AS `stan` from `sprzet` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `lista_akcesoriow_w_magazynie`
--

/*!50001 DROP VIEW IF EXISTS `lista_akcesoriow_w_magazynie`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `lista_akcesoriow_w_magazynie` AS select `akcesoria`.`model_akcesorium` AS `model_akcesorium`,`akcesoria`.`producent` AS `producent`,`akcesoria`.`identyfikator_wewnetrzny_modelu` AS `identyfikator_wewnetrzny_modelu`,`akcesoria`.`ilosc` AS `ilosc` from `akcesoria` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `lista_sprzetu_w_magazynie`
--

/*!50001 DROP VIEW IF EXISTS `lista_sprzetu_w_magazynie`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `lista_sprzetu_w_magazynie` AS select `sprzet`.`model_sprzetu` AS `model_sprzetu`,`sprzet`.`identyfikator_wewnetrzny_sprzetu` AS `identyfikator_wewnetrzny_sprzetu`,`sprzet`.`adres_mac_ethernet` AS `adres_mac_ethernet`,`sprzet`.`adres_mac_wifi` AS `adres_mac_wifi`,`sprzet`.`numer_seryjny` AS `numer_seryjny`,`sprzet`.`producent` AS `producent`,`sprzet`.`cykl_zycia` AS `cykl_zycia`,`sprzet`.`stan` AS `stan` from `sprzet` where (`sprzet`.`stan` = 'w_magazynie') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `lista_uzytkownikow`
--

/*!50001 DROP VIEW IF EXISTS `lista_uzytkownikow`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `lista_uzytkownikow` AS select `uzytkownicy`.`imie` AS `imie`,`uzytkownicy`.`nazwisko` AS `nazwisko`,`uzytkownicy`.`stanowisko` AS `stanowisko`,`uzytkownicy`.`identyfikator_wewnetrzny_uzytkownika` AS `identyfikator_wewnetrzny_uzytkownika` from `uzytkownicy` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-14 16:39:55
