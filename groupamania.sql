-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: groupomania
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `idComment` int NOT NULL AUTO_INCREMENT,
  `comment` varchar(500) NOT NULL,
  `authorId` int NOT NULL,
  `postId` int NOT NULL,
  PRIMARY KEY (`idComment`),
  KEY `authorId_idx` (`authorId`),
  KEY `postId_idx` (`postId`),
  CONSTRAINT `author` FOREIGN KEY (`authorId`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `postId` FOREIGN KEY (`postId`) REFERENCES `post` (`postId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=210 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (206,'Besoin d\'un coup de main?',96,307),(207,'Toi si je t\'attrappes...',99,310),(208,'Ta pris une cagoule? :)',99,311),(209,'Gomu gomu noooo',100,313);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `like`
--

DROP TABLE IF EXISTS `like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `like` (
  `likeId` int NOT NULL AUTO_INCREMENT,
  `postId` int NOT NULL,
  `userId` int NOT NULL,
  PRIMARY KEY (`likeId`),
  KEY `postId_idx` (`postId`),
  KEY `userIdlike_idx` (`userId`),
  CONSTRAINT `postIdlikes` FOREIGN KEY (`postId`) REFERENCES `post` (`postId`) ON DELETE CASCADE,
  CONSTRAINT `userIdlike` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=446 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `like`
--

LOCK TABLES `like` WRITE;
/*!40000 ALTER TABLE `like` DISABLE KEYS */;
INSERT INTO `like` VALUES (418,305,1),(421,305,95),(422,307,95),(423,309,96),(424,307,96),(425,310,96),(426,305,96),(427,310,97),(428,307,97),(429,305,97),(431,309,97),(432,311,97),(433,313,98),(434,311,98),(435,310,98),(436,307,98),(437,309,98),(438,305,98),(439,307,99),(440,309,99),(441,305,99),(442,313,100),(443,315,101),(444,313,101),(445,307,101);
/*!40000 ALTER TABLE `like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `postId` int NOT NULL AUTO_INCREMENT,
  `text` varchar(300) DEFAULT NULL,
  `imageUrl` varchar(300) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `like` int DEFAULT '0',
  `authorId` int NOT NULL,
  `comment` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`postId`),
  KEY `authorId_idx` (`authorId`),
  CONSTRAINT `authorId` FOREIGN KEY (`authorId`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=316 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (305,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptates, harum! Officia eum neque quibusdam obcaecati at officiis sunt, magni nisi eveniet deleniti fugit repudiandae numquam, recusandae molestiae dolorem dolor et!','','2021-11-28 14:32:49',7,1,0),(307,'Toujours présent pour sauver New York !','http://localhost:3000/images/post/image1638279974394.jpg','2021-11-30 14:46:14',6,95,1),(309,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptates, harum! Officia eum neque quibusdam obcaecati at officiis sunt, magni nisi eveniet deleniti fugit repudiandae numquam, recusandae molestiae dolorem dolor et!','','2021-11-30 14:46:47',4,95,0),(310,'Pas facile ce match de quidditch !','http://localhost:3000/images/post/image1638280203558.jpg','2021-11-30 14:50:03',3,96,1),(311,'Winter is comming...','','2021-11-30 15:15:09',2,97,1),(313,'Quelqu\'un a vu ce mec?','http://localhost:3000/images/post/image1638282937732.jpg','2021-11-30 15:35:37',3,98,1),(314,'J\'aime pas groupomania !','','2021-11-30 15:47:20',0,99,0),(315,'Je suis un gros balèze !','http://localhost:3000/images/post/image1638284627706.jpg','2021-11-30 16:03:47',1,101,0);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `prenom` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(250) NOT NULL,
  `pp` varchar(500) DEFAULT NULL,
  `desc` varchar(45) DEFAULT NULL,
  `admin` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Admin','Mr','admin@admin.com','$2b$10$Ty5oq3O43UiA9.apxeraPOLRUR4P1dZGC78ctEzJcwY/gKHfasfsq','http://localhost:3000/images/profile/image1638021147345.jpg','Admin de Groupomania',1),(95,'Man','Spider','spider@spider.com','$2b$10$TJyAQDjZWSLTO8CpaNgLdufqGlXdb0HSenazldw.iGaSUpKD8Fku6','http://localhost:3000/images/profile/image1638279940320.jpg',NULL,0),(96,'Potter','Harry','harry@potter.com','$2b$10$Vx7ZDxYHVjLum1Qvac9PIOAhd91hEK0BKeuUTVZU9FgslMXxpZs72','http://localhost:3000/images/profile/image1638280176133.jpg',NULL,0),(97,'Stark','Ned','ned@stark.com','$2b$10$xoV9edQfxeHd67iTdRhyYuN8GZttNm/HI3c0zLNVPYfi7/dVNV1Oa','http://localhost:3000/images/profile/image1638281700732.jpg','Roi du nord',0),(98,'Leia','Princesse','princesse@leia.com','$2b$10$Ia//bMIHJ1DK/MTYZz00zuDAyvbatvLUn7QzxOaqEQhdoOCWBDnyO','http://localhost:3000/images/profile/image1638282801975.jpg',NULL,0),(99,'Demort','Vol','vol@demort.com','$2b$10$FGBW6XWD5RZDD1iTDjhXmO9XcuiuY4OJ6F8eAaKYuKrKNW8qYfCUe','http://localhost:3000/images/profile/image1638283162726.png',NULL,0),(100,'Luffy','Monkey D','monkeyd@luffy.com','$2b$10$17L2qmVUQqc3Q54tbtBbf.5kC4SwzSYCaN.Ez/2xvQywbW.EZ6S9y','http://localhost:3000/images/profile/image1638283794738.jpg','Seigneur des pirates',0),(101,'Hulk','Monsieur','mr@hulk.com','$2b$10$8g/BfVYzBZRM/6IcT1KngemJnJ3cXaRRoOwRp3zJDsJZp0/yImbFa','http://localhost:3000/images/profile/image1638283949992.jpg',NULL,0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-30 16:09:41
