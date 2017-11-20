-- MySQL dump 10.16  Distrib 10.1.26-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: auditliveapi
-- ------------------------------------------------------
-- Server version	10.1.26-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `oauth2_access_tokens`
--

DROP TABLE IF EXISTS `oauth2_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth2_access_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expires_at` int(11) DEFAULT NULL,
  `scope` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_D247A21B5F37A13B` (`token`),
  KEY `IDX_D247A21B19EB6921` (`client_id`),
  KEY `IDX_D247A21BA76ED395` (`user_id`),
  CONSTRAINT `FK_D247A21B19EB6921` FOREIGN KEY (`client_id`) REFERENCES `oauth2_clients` (`id`),
  CONSTRAINT `FK_D247A21BA76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_access_tokens`
--

LOCK TABLES `oauth2_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth2_access_tokens` DISABLE KEYS */;
INSERT INTO `oauth2_access_tokens` VALUES (1,1,1,'ZGRhNzJmNzI4OGY1ZjVmYjJhNWZlNjRmNTE2ZGQwOGNmZjMxOTUwODQyMjhiNGVjMDQ0NjYwZDc5OGIxNWY1MQ',1511179335,NULL),(2,1,1,'ODE5Yzc5YzlkY2VmMGQ4YWYwMzc2MTVhZjhlZDBmNzcxMmQyYzlkM2YyOTNiY2YxNzcxYTM3YzIzNzZjZTVlNA',1511179347,NULL),(3,1,1,'NmE0Mzc2OGRkMDY0ZGE4NDc0ODM3MGVlMmJhMTExNTIyZjU5YjMzOGQ0MjZmZDkxZDUxZjg0YmY0ODg5MmFjYw',1511179349,NULL),(4,1,1,'ZjFkYWEzNzUzY2Y0MWQwOWNmMmM0NjExMWIyZDVkMTIxMmUyYjZjNjhhNzJkNGE4NWRkM2FiZWJiOWJmNmU4Yw',1511179426,NULL),(5,1,1,'Y2M2ZTAwNmRkMTcwMTNiNjkyOTBiNDA1NDg2MzczZDE2MzYwMmEzODRmNzYwYTk0NWUzZmI4N2IzNTQyYWE1MQ',1511179493,NULL);
/*!40000 ALTER TABLE `oauth2_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_auth_codes`
--

DROP TABLE IF EXISTS `oauth2_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth2_auth_codes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `redirect_uri` longtext COLLATE utf8_unicode_ci NOT NULL,
  `expires_at` int(11) DEFAULT NULL,
  `scope` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_A018A10D5F37A13B` (`token`),
  KEY `IDX_A018A10D19EB6921` (`client_id`),
  KEY `IDX_A018A10DA76ED395` (`user_id`),
  CONSTRAINT `FK_A018A10D19EB6921` FOREIGN KEY (`client_id`) REFERENCES `oauth2_clients` (`id`),
  CONSTRAINT `FK_A018A10DA76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_auth_codes`
--

LOCK TABLES `oauth2_auth_codes` WRITE;
/*!40000 ALTER TABLE `oauth2_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_auth_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_clients`
--

DROP TABLE IF EXISTS `oauth2_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth2_clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `random_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `redirect_uris` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `secret` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `allowed_grant_types` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_clients`
--

LOCK TABLES `oauth2_clients` WRITE;
/*!40000 ALTER TABLE `oauth2_clients` DISABLE KEYS */;
INSERT INTO `oauth2_clients` VALUES (1,'3bcbxd9e24g0gk4swg0kwgcwg4o8k8g4g888kwc44gcc0gwwk4','a:0:{}','4ok2x70rlfokc8g0wws8c8kwcokw80k44sg48goc0ok4w0so0k','a:1:{i:0;s:8:\"password\";}');
/*!40000 ALTER TABLE `oauth2_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth2_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth2_refresh_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expires_at` int(11) DEFAULT NULL,
  `scope` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_D394478C5F37A13B` (`token`),
  KEY `IDX_D394478C19EB6921` (`client_id`),
  KEY `IDX_D394478CA76ED395` (`user_id`),
  CONSTRAINT `FK_D394478C19EB6921` FOREIGN KEY (`client_id`) REFERENCES `oauth2_clients` (`id`),
  CONSTRAINT `FK_D394478CA76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_refresh_tokens`
--

LOCK TABLES `oauth2_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth2_refresh_tokens` DISABLE KEYS */;
INSERT INTO `oauth2_refresh_tokens` VALUES (1,1,1,'NjA1ZGI2NTljZjZlZGU5ZGI0NzdjZGZlNjVmNWEzODNjZjg0ZTZjMTIzM2RhN2NmZDhjMmM3MTQ2OWRiMmQ5MA',1512385335,NULL),(2,1,1,'NTQ3YTYwY2JmNGQ1MDMxMWVlYzI2MjA3ZTJkY2RmMmNjOWU1NTRhZGU4NmU0ZmY3NWJmMjQwY2EzYmU5ZjY3Mw',1512385347,NULL),(3,1,1,'MmMyODRhOTFhNzIwYTljNDJkMjVhYjFmZDk2ZDJlZmRmNTUxNjk1YjhlYjk2MjQ2MTViODNhMjAzYTI0YTdmNg',1512385349,NULL),(4,1,1,'MjllMmZlOWZkZTFlNDc0Mjc2MDI2OWNjYmE1Y2EyNTdlM2JlMDM1MDcyOWFlODA0YjQ3NGVlNTFlMGMzY2YwYQ',1512385426,NULL),(5,1,1,'YmIxZTdlYmMzYjJhMjc4YjQ3ZTFjMjljYzdkNjZiNTNiMzMxNmVjZTEzYjc0Y2RmODY4YTI1N2ZhZWI5MTk0Ng',1512385493,NULL);
/*!40000 ALTER TABLE `oauth2_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `confirmation_token` varchar(180) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_1483A5E992FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_1483A5E9A0D96FBF` (`email_canonical`),
  UNIQUE KEY `UNIQ_1483A5E9C05FB297` (`confirmation_token`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin','admin@example.com','admin@example.com',1,'eWbKjRUdC3cWGepQRqS1cldxkDZRl7pcZfqqt8M7bvQ','csOXlRepmXyrEMOCrRrBv81s84S4Tacbaife3kW9FtCjxsM9atxzmH6giwniz87/NWQoEaxZSeQd7AWAeyPvLw==',NULL,NULL,NULL,'a:0:{}');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-20 14:16:54
