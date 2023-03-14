-- MySQL dump 10.13  Distrib 8.0.31, for Linux (x86_64)
--
-- Host: localhost    Database: ejs
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `deploys`
--
drop user if exists 'dbuser_sa'@'%';
CREATE USER 'dbuser_sa'@'%' IDENTIFIED BY 'newpassword5';
GRANT ALL PRIVILEGES ON * TO 'dbuser_sa'@'%'; 
FLUSH PRIVILEGES;

DROP TABLE IF EXISTS `deploys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deploys` (
  `RecordNum` varchar(25) DEFAULT NULL,
  `VerTag` varchar(25) DEFAULT NULL,
  `HostName` varchar(25) DEFAULT NULL,
  `Repo` varchar(25) DEFAULT NULL,
  `DIR` varchar(25) DEFAULT NULL,
  `OSUser` varchar(20) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deploys`
--

LOCK TABLES `deploys` WRITE;
/*!40000 ALTER TABLE `deploys` DISABLE KEYS */;
INSERT INTO `deploys` VALUES ('DEVOPS-55','VERSION_1.2.3.4','APACHE','TAXING','/VOL1','EJ','2018-05-08','11:01:21'),('DEVOPS-55','VERSION_1.2.3.4','APACHE','TAXING','/VOL1','EJ','2018-05-08','13:48:33'),('DEVOPS-55','VERSION_1.2.3.4','APACHE','TAXING','/VOL1','EJ','2018-05-12','23:04:58'),('DEVOPS-1234','TAXING_1.2.3.4','APACHE','TAXING','/VOL1','EJ','2018-05-12','23:05:49'),('DEVOPS-1234','TAXING_1.2.3.4','APACHE','TAXING','/VOL1','EJ','2018-05-12','23:05:51'),('DEVOPS-1234','TAXING_1.2.3.4','APACHE','TAXING','/VOL1','EJ','2018-05-12','23:05:52'),('DEVOPS-1234','TAXING_1.2.3.4','APACHE','TAXING','/VOL1','EJ','2018-05-12','23:05:53'),('DEVOPS-01','ONE_1.0','MYHOST','MYREPO','/MYDIR','EJ','2022-04-01','23:06:00'),('DEVOPS-02','TWO_2.0','MYHOST','MYREPO','/MYDIR','EJ','2022-04-02','22:22:00'),('Devops-40','VERSIONTAG','dbdesmond.auto-deploy.net','desmond','DEVOPS','ROOT','2026-04-22','08:49:22'),('Devops-40','VERSIONTAG','dbdesmond.auto-deploy.net','desmond','DEVOPS','ROOT','2026-04-22','09:09:13'),('Devops-40','VERSIONTAG','dbdesmond.auto-deploy.net','desmond','DEVOPS','ROOT','2026-04-22','09:09:13'),('Devops-40','VERSIONTAG','dbdesmond.auto-deploy.net','desmond','DEVOPS','ROOT','2026-04-22','09:47:11'),('DEVOPS-40','VERSIONTAG','dbdesmond.auto-deploy.net','desmond','DEVOPS','ROOT','2026-04-22','10:24:12'),('DEVOPS-40','VERSIONTAG','dbdesmond.auto-deploy.net','desmond','/DEVOPS','ROOT','2026-04-22','10:38:25'),('DEVOPS-40','VERSIONTAG','dbdesmond.auto-deploy.net','desmond','DEVOPS','ROOT','2026-04-22','14:51:49'),('DEVOPS-40','VERSIONTAG','dbdesmond.auto-deploy.net','desmond','DEVOPS','ROOT','2026-04-22','16:48:01'),('DEVOPS-40','VERSIONTAG','dbdesmond.auto-deploy.net','desmond','DEVOPS','ROOT','2026-04-22','17:24:45'),('DEVOPS-40','VERSIONTAG','dbblue.auto-deploy.net','blue','DEVOPS','ROOT','2027-04-22','06:54:17'),('Devops-40','VERSIONTAG','dbdesmond.auto-deploy.net','desmond','DEVOPS','ROOT','2029-04-22','04:41:30');
/*!40000 ALTER TABLE `deploys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets` (
  `RecordNum` varchar(25) DEFAULT NULL,
  `VerTag` varchar(25) DEFAULT NULL,
  `Platform` varchar(25) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
INSERT INTO `tickets` VALUES ('DEVOPS-1234','TAXING_1.2.3.4','MY TAX TEAM','2018-05-18','14:46:00'),('DEVOPS-55','VERSION_1.2.3.4','VERSIONS','2018-05-14','11:00:00'),('DEVOPS-01','ONE_1.0','MYPLATFORM','2022-04-01','23:06:00'),('DEVOPS-02','TWO_1.0','MYPLATFORM','2022-04-02','22:22:00');
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-05 13:30:02
