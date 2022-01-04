-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: ulmen
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Remeras'),(2,'Camisas'),(3,'Zapatillas'),(4,'Pantalones'),(5,'Accesorios'),(6,'Buzos'),(7,'Camperas'),(8,'Medias'),(9,'Shorts');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coleccion`
--

DROP TABLE IF EXISTS `coleccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coleccion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coleccion`
--

LOCK TABLES `coleccion` WRITE;
/*!40000 ALTER TABLE `coleccion` DISABLE KEYS */;
INSERT INTO `coleccion` VALUES (1,'Otoño'),(3,'Primavera'),(4,'Verano'),(5,'Invierno');
/*!40000 ALTER TABLE `coleccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `color`
--

DROP TABLE IF EXISTS `color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `color` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `color`
--

LOCK TABLES `color` WRITE;
/*!40000 ALTER TABLE `color` DISABLE KEYS */;
INSERT INTO `color` VALUES (1,'Rojo'),(2,'Verde'),(3,'Azul'),(4,'Gris'),(5,'Negro'),(6,'Blanco'),(7,'Violeta'),(8,'Rosa'),(9,'Naranja'),(10,'Celeste'),(12,'Marron');
/*!40000 ALTER TABLE `color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genero`
--

DROP TABLE IF EXISTS `genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genero` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genero`
--

LOCK TABLES `genero` WRITE;
/*!40000 ALTER TABLE `genero` DISABLE KEYS */;
INSERT INTO `genero` VALUES (1,'Masculino'),(2,'Femenino'),(3,'No binario'),(4,'Otro');
/*!40000 ALTER TABLE `genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagen`
--

DROP TABLE IF EXISTS `imagen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagen` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `productos_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_productos_idx` (`productos_id`),
  CONSTRAINT `fk_productos` FOREIGN KEY (`productos_id`) REFERENCES `producto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagen`
--

LOCK TABLES `imagen` WRITE;
/*!40000 ALTER TABLE `imagen` DISABLE KEYS */;
/*!40000 ALTER TABLE `imagen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `precio` int NOT NULL,
  `id_colores` int NOT NULL,
  `id_talles` int NOT NULL,
  `id_sexo` int NOT NULL,
  `id_coleccion` int NOT NULL,
  `id_categoria` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_categorias_idx` (`id_categoria`),
  KEY `fk_generos_idx` (`id_sexo`),
  KEY `fk_colores_idx` (`id_colores`),
  KEY `fk_talles_idx` (`id_talles`),
  KEY `fk_coleccion_idx` (`id_coleccion`),
  CONSTRAINT `fk_categorias` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id`),
  CONSTRAINT `fk_coleccion` FOREIGN KEY (`id_coleccion`) REFERENCES `coleccion` (`id`),
  CONSTRAINT `fk_colores` FOREIGN KEY (`id_colores`) REFERENCES `color` (`id`),
  CONSTRAINT `fk_generos` FOREIGN KEY (`id_sexo`) REFERENCES `genero` (`id`),
  CONSTRAINT `fk_talles` FOREIGN KEY (`id_talles`) REFERENCES `talle` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (4,'Remera Lotto Neck Round','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc turpis turpis, faucibus in euismod eu, malesuada id arcu. Praesent placerat dui eu ',5000,1,2,2,1,2),(15,'Short Topper Mix','Lorem ipsum dolor sit amet, consctetur adipiscing elit. Nunc turpis turpis, faucibus in euismod eu, malesuada id arcu. Praesent placerat dui eu ',2000,2,2,1,1,1),(16,'Zapatillas Jordan 1','Lorem ipsum dolor sit amet, consctetur adipiscing elit. Nunc turpis turpis, faucibus in euismod eu, malesuada id arcu. Praesent placerat dui eu ',12000,2,2,1,5,1),(17,'Buzo Champions 2','Lorem ipsum dolor sit amet, consctetur adipiscing elit. Nunc turpis turpis, faucibus in euismod eu, malesuada id arcu. Praesent placerat dui eu ',13000,7,2,1,4,2),(18,'Medias Puma low','Lorem ipsum dolor sit amet, consctetur adipiscing elit. Nunc turpis turpis, faucibus in euismod eu, malesuada id arcu. Praesent placerat dui eu ',600,8,1,1,1,3),(20,'Remera Adidas Originals','Lorem ipsum dolor sit amet, consctetur adipiscing elit. Nunc turpis turpis, faucibus in euismod eu, malesuada id arcu. Praesent placerat dui eu ',7000,6,3,2,3,3),(21,'Bermuda Fila Try','Lorem ipsum dolor sit amet, consctetur adipiscing elit. Nunc turpis turpis, faucibus in euismod eu, malesuada id arcu. Praesent placerat dui eu ',5600,6,3,2,3,1),(22,'Short Puma Independiente','Lorem ipsum dolor sit amet, consctetur adipiscing elit. Nunc turpis turpis, faucibus in euismod eu, malesuada id arcu. Praesent placerat dui eu ',3000,4,3,2,3,1),(23,'Zapatillas Asics Black','Lorem ipsum dolor sit amet, consctetur adipiscing elit. Nunc turpis turpis, faucibus in euismod eu, malesuada id arcu. Praesent placerat dui eu ',20000,1,3,2,3,1),(24,'Zapatillas Reebok White','Lorem ipsum dolor sit amet, consctetur adipiscing elit. Nunc turpis turpis, faucibus in euismod eu, malesuada id arcu. Praesent placerat dui eu ',20000,5,3,2,1,2),(25,'Buzo Hoodie Calvin','Lorem ipsum dolor sit amet, consctetur adipiscing elit. Nunc turpis turpis, faucibus in euismod eu, malesuada id arcu. Praesent placerat dui eu ',8000,5,2,2,1,1),(26,'Campera North Face','Lorem ipsum dolor sit amet, consctetur adipiscing elit. Nunc turpis turpis, faucibus in euismod eu, malesuada id arcu. Praesent placerat dui eu ',60000,2,2,2,1,1),(27,'Camisa Penguin Cuadros','Lorem ipsum dolor sit amet, consctetur adipiscing elit. Nunc turpis turpis, faucibus in euismod eu, malesuada id arcu. Praesent placerat dui eu ',12000,2,4,2,1,2),(29,'Camisa Jordan Off','Lorem ipsum dolor sit amet, consctetur adipiscing elit. Nunc turpis turpis, faucibus in euismod eu, malesuada id arcu. Praesent placerat dui eu ',9000,3,2,2,1,2),(30,'Medias Champs','Lorem ipsum dolor sit amet, consctetur adipiscing elit. Nunc turpis turpis, faucibus in euismod eu, malesuada id arcu. Praesent placerat dui eu ',9000,4,1,4,1,2);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'Administrador'),(2,'Usuario'),(3,'Invitado');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sexo`
--

DROP TABLE IF EXISTS `sexo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sexo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sexo`
--

LOCK TABLES `sexo` WRITE;
/*!40000 ALTER TABLE `sexo` DISABLE KEYS */;
INSERT INTO `sexo` VALUES (1,'Masculino'),(2,'Femenino'),(3,'No binario'),(4,'Otros');
/*!40000 ALTER TABLE `sexo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `talle`
--

DROP TABLE IF EXISTS `talle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `talle` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `talle`
--

LOCK TABLES `talle` WRITE;
/*!40000 ALTER TABLE `talle` DISABLE KEYS */;
INSERT INTO `talle` VALUES (1,'Small'),(2,'Medium'),(3,'Large'),(4,'Extra large'),(5,'XXL'),(6,'XXXL');
/*!40000 ALTER TABLE `talle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `contraseña` varchar(100) NOT NULL,
  `DNI` int NOT NULL,
  `nacimiento` date NOT NULL,
  `id_rol` int NOT NULL,
  `id_genero` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rol_idx` (`id_rol`),
  KEY `fk_sexo_idx` (`id_genero`),
  CONSTRAINT `fk_rol` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id`),
  CONSTRAINT `fk_sexo` FOREIGN KEY (`id_genero`) REFERENCES `sexo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (5,'Juan','Perez','juanperez@gmail.com','12345678',34566234,'1997-12-08',2,3),(6,'Mario','Castro','mariocastro@gmail.com','12345678',34545124,'1987-11-03',1,2),(7,'Ruben','Paz','rubenpaz@gmail.com','12345678',31895124,'1977-07-01',1,1),(8,'Marcos','Gerez','marcosgerez@gmail.com','12345678',23890114,'1991-09-21',1,3),(9,'Pedro','Silva','pedrosilva@gmail.com','12345678',23897761,'1995-11-12',2,1),(10,'Gabriel','Mansilla','gabrielmansilla@gmail.com','123456789',34897764,'1974-03-08',1,1),(11,'Matias','Castro','matiascastro@gmail.com','123456789',40678543,'1995-10-02',2,1),(12,'Jose','Perales','joseperales@gmail.com','123456789',34677643,'1967-12-09',2,3),(13,'Diego','Romano','diegoromano@gmail.com','123456789',23453987,'1990-04-02',3,3),(14,'Elias','Ruiz','eliasruiz@gmail.com','123456789',40421984,'1993-07-12',1,3),(15,'Carlos','Lopez','carloslopez@gmail.com','123456789',37473981,'1984-05-30',2,1),(16,'Ramiro','Martinez','ramiromartinez@gmail.com','123456789',29435982,'1991-07-31',3,1),(17,'Gabriel','Falcon','gabrielfalcon@gmail.com','123456789',46435008,'2001-05-23',1,1),(18,'Pablo','Araujo','pabloaraujo@gmail.com','123456789',23435508,'2000-06-18',2,1),(19,'Roman','Hernandez','romanhernandez@gmail.com','123456789',39876121,'1989-07-12',2,3),(20,'Pedro','Coronel','pedrocoronel@gmail.com','123456789',39847169,'1985-01-03',1,3),(21,'Gonzalo','Rivas','gonzalorivas@gmail.com','123456789',31832164,'1981-04-22',1,2),(22,'Luis','Pasos','luispasos@gmail.com','123456789',21832278,'1976-02-15',2,2),(23,'Diego','Diaz','diegocarlosdiaz5@gmail.com','$2a$10$Fi.oarkpnWBCLIC9sNKog.HNqGUEi5b.et6Geofut6YqoIhg2yMaC',40664184,'2021-12-18',1,2),(24,'Diego','Diaz','diegocarsassdlosdiaz5@gmail.com','$2a$10$PawN8mUv0nsDeEBD81ANXuLC13vvw1X1mKE7k94ft1/9AAt5FAFbG',40664184,'2021-12-17',1,1),(25,'Diego','Diaz','diegocsdsarlosdiaz5@gmail.com','$2a$10$NJbqC8WjXTF3yWNG29nMteNWYncwDLELMXiTLy.SUqGkAlCJ92pfC',40664184,'2021-12-04',1,1),(26,'pedro','hola','pedrooo@gmail.com','$2a$10$qX9bBEoat2nzfqeT8E5i2eZn8lmvPyBPTYgtZVgqlo9smi16rp1Yi',12345678,'2011-07-08',2,1),(27,'Diego','Diaz','djej22@gmail.com','$2a$10$dUoP.t4RA1wBEXP8UHWvxOvkqKlN/6xNr6ezPrXhDopvWZ3MxA.wy',12345678,'2021-12-03',2,1),(28,'Mati','Perwz','pppp@gmail.com','$2a$10$78LWT9Ah.7d./vnXOwSzjemNcmTQeCEmOIswdSk9gKDB8TFEo0a5y',123456789,'2021-12-19',1,2),(29,'Diego','Diaz','aaa@gmail.com','$2a$10$wLmjYyFrlEvA/rsqcowqqux7axbSzL2JUdSFM2Nn7Mdwx8KfjM8/C',40664184,'2021-12-22',1,2),(30,'Diego','Diaz','qqqqq@gmail.com','$2a$10$Y80ydAlz5FKU61OpK6WLPeKkgPnXTo9OYTyYvd.eXvOY2wzVzmhYO',11111111,'2021-12-22',1,2),(31,'Diego','Diaz','diego@gmail.com','$2a$10$k4SXXWWx46.rg.LV6D4FK.k8/ZBxyFUd3tW99ozFLyMUTQgMjorn6',40664184,'2021-12-18',1,1),(32,'Diego','Diaz','weeeee@gmail.com','$2a$10$pWLiikGSITlr/D.LAJiwROSOguUE7rLmLRty10mSEcR1TAqU4VGBW',12345678,'2021-12-11',1,1),(33,'Diego','Diaz','diegocarlosdiaz5@gmail.comsssdsd','$2a$10$VyEv1YdY6aHtzSHX2BdwEeA9G4WsRqjS0XBtyCR2WNZb7lkQ0me6q',40664184,'2021-12-10',1,1),(34,'Diego','Diaz','fgfdgf@gmail.com','$2a$10$VC.wgXBzl9fsgNup9WUD3.PRHMTL2fbTLFiEiokkWp2TnJrYyZ.96',40664184,'2021-12-31',1,1),(35,'Diego','Diaz','uikhjkjh@gmail.com','$2a$10$x0hluBpbRlhRzafD5Evz6e8NtitOQYpo5XfPS/uGxx5CFdEtEG/uq',40664184,'2021-12-11',1,1),(36,'Diego','Diaz','diegocaxcxclosdiaz5@gmail.com','$2a$10$RaPfCvPi3S93VCXisi2eJ.5pu.y5d6fLPfduL2e7G5AnOhXb1xemi',40664184,'2021-12-23',2,1),(37,'Diego','Diaz','sdsds@gmail.com','$2a$10$o7LB/LIjEE7ZYCRkXnyRKuBY1.PbedX/XOq.AcdQuam5TXjx6Sg56',40664184,'2021-12-30',1,1),(38,'mati','pacheco','sesed@gmail.com','$2a$10$Cu/h1Q1hIptTFVuuDr.4sem8PVtMXqLS/JodLAsQoslFo5yhYywZ6',12345678,'2021-12-10',2,2),(39,'Diego','Diaz','diegocarlosdiaz5@gmail.aaa','$2a$10$eT9LyrjM2pVBbnSR9TlvQuUFVPodCOxvy/kcnpnIYeRJZf36pAOF6',40664184,'2021-12-09',1,2);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ulmen'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-30 20:46:43