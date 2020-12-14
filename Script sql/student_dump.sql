-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parent` int DEFAULT NULL,
  `info` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id_fk_idx` (`parent`),
  CONSTRAINT `parent_id_fk` FOREIGN KEY (`parent`) REFERENCES `department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,NULL,'Организации'),(2,1,'Институты'),(3,2,'Институт № 1 «Авиационная техника»'),(4,2,'Институт № 2 «Авиационные, ракетные двигатели и энергетические установки»'),(5,2,'Институт № 3 «Системы управления, информатика и электроэнергетика»'),(6,2,'Институт № 4 «Радиоэлектроника, инфокоммуникации и информационная безопасность»'),(7,2,'Институт № 5 «Инженерная экономика и гуманитарные науки»'),(8,2,'Институт № 6 «Аэрокосмический»'),(9,2,'Институт № 7 «Робототехнические и интеллектуальные системы»'),(10,2,'Институт № 8 «Информационные технологии и прикладная математика»'),(11,2,'Институт общеинженерной подготовки (Институт № 9)'),(12,2,'Институт № 10 «Иностранных языков»'),(13,2,'Институт «Материаловедение и технологии материалов» (Институт №11)'),(14,2,'Институт «Аэрокосмические наукоёмкие технологии и производства» (Институт №12)'),(15,3,'Кафедра 101 «Проектирование и сертификация авиационной техники» Института № 1 «Авиационная техника»'),(16,3,'Кафедра 102 «Проектирование вертолётов» Института № 1 «Авиационная техника»'),(17,3,'Кафедра 104 «Технологического проектирования и управления качеством» Института № 1 «Авиационная техника»'),(18,3,'Кафедра 105 «Аэродинамика летательных аппаратов» Института № 1 «Авиационная техника»'),(19,3,'Кафедра 106 «Динамика и управление летательных аппаратов» Института № 1 «Авиационная техника»'),(20,4,'Кафедра 201 «Теория воздушно-реактивных двигателей»'),(21,4,'Кафедра 202 «Ракетные двигатели»'),(22,4,'Кафедра 203 «Конструкция и проектирование двигателей»'),(23,4,'Кафедра 204 «Авиационно-космическая теплотехника»'),(24,4,'Кафедра 205 «Технология производства двигателей летательных аппаратов»'),(25,5,'Кафедра 301 «Системы автоматического и интеллектуального управления»'),(26,5,'Кафедра 304 «Вычислительные машины, системы и сети»'),(27,5,'Кафедра 305 «Автоматизированные комплексы систем ориентации и навигации»'),(28,5,'Кафедра 306 «Микроэлектронные электросистемы»'),(29,5,'Кафедра 307 «Цифровые технологии и информационные системы»'),(30,7,'Кафедра 501 «Менеджмент и маркетинг высокотехнологичных отраслей промышленности»'),(31,7,'Кафедра 502 «Экономика промышленности: учет, анализ и аудит»'),(32,7,'Кафедра 505 «Инновационная экономика, финансы и управление проектами»'),(33,7,'Кафедра 507 «Экономическая теория»'),(34,7,'Кафедра 509 «Экономика аэрокосмической промышленности»');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` int unsigned NOT NULL,
  `year` year NOT NULL,
  `specialty` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `specialty_fk_idx` (`specialty`),
  CONSTRAINT `specialty_fk` FOREIGN KEY (`specialty`) REFERENCES `specialty` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group`
--

LOCK TABLES `group` WRITE;
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
INSERT INTO `group` VALUES (1,101,2020,1),(2,107,2020,2),(3,109,2020,2);
/*!40000 ALTER TABLE `group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) DEFAULT NULL COMMENT 'Имя',
  `middle_name` varchar(50) DEFAULT NULL COMMENT 'Отчество',
  `last_name` varchar(50) NOT NULL COMMENT 'Фамилия',
  `is_male` tinyint NOT NULL DEFAULT '1' COMMENT 'Мужчина',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`first_name`,`middle_name`,`last_name`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,'Алексей','Викторович','Вишняков',1),(2,'Егор','Александрович','Елкин',1),(3,'Сергей','Сергеевич','Жеребцов',1),(4,'Полина','Сергеевна','Иошина',0),(5,'Арсений','Павлович','Исаев',1),(6,'Юлия','Игоревна','Источникова',0),(7,'Вера','Андреевна','Кияченко',0),(8,'Александр','Константинович','Кравцов',1),(9,'Роман','Сергеевич','Левченя',1),(10,'Владимир','Антонович','Резников',1),(11,'Виталий','Сергеевич','Репченко',1),(12,'Илья','Олегович','Сатюков',1),(13,'Ева','Александровна','Цынбалова',0),(14,'Даниил','Алексеевич','Чернов',1),(15,'Кирилл','Денисович','Чистофат',1),(16,'Лев','Евгеньевич','Давыденко',1),(17,'Санжар','Джанибекович','Абдилякимов',1),(18,'Артем','Геннадьевич','Асцатурян',1),(19,'Родион','Евгеньевич','Беликов',1),(20,'Артём','Ильич','Борисов',1),(21,'Сергей','Иванович','Валиев',1),(22,'Кирилл','Андреевич','Воропанов',1),(23,'Георгий','Николаевич','Гончаров',1);
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specialty`
--

DROP TABLE IF EXISTS `specialty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `specialty` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(45) NOT NULL,
  `info` varchar(200) DEFAULT NULL,
  `department` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `department_fk_idx` (`department`),
  CONSTRAINT `department_fk` FOREIGN KEY (`department`) REFERENCES `department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specialty`
--

LOCK TABLES `specialty` WRITE;
/*!40000 ALTER TABLE `specialty` DISABLE KEYS */;
INSERT INTO `specialty` VALUES (1,'27.03.04','Управление в технических системах',25),(2,'09.03.01','Информатика и вычислительная техника',26);
/*!40000 ALTER TABLE `specialty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` varchar(20) NOT NULL COMMENT 'Номер студенческого билета',
  `person` int NOT NULL COMMENT 'Персональные данные',
  `is_internally` tinyint NOT NULL COMMENT 'Очное обучение',
  `group` int NOT NULL COMMENT 'Группа',
  PRIMARY KEY (`id`),
  KEY `group_fk_idx` (`group`),
  KEY `person_fk_idx` (`person`),
  CONSTRAINT `group_fk` FOREIGN KEY (`group`) REFERENCES `group` (`id`),
  CONSTRAINT `person_fk` FOREIGN KEY (`person`) REFERENCES `person` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'011-0001',1,1,1),(2,'011-0002',2,1,1),(3,'011-0003',3,1,1),(4,'011-0004',4,1,1),(5,'011-0005',5,1,1),(6,'011-0006',6,1,1),(7,'011-0007',7,1,1),(8,'011-0008',8,1,1),(9,'011-0009',9,1,1),(10,'021-0010',10,1,2),(11,'021-0011',11,1,2),(12,'021-0012',12,1,2),(13,'021-0013',13,1,2),(14,'021-0014',14,1,2),(15,'021-0015',15,1,2),(16,'021-0016',16,1,2),(17,'030-0017',17,0,3),(18,'030-0018',18,0,3),(19,'030-0019',19,0,3),(20,'030-0020',20,0,3),(21,'030-0021',21,0,3),(22,'030-0022',22,0,3),(23,'030-0023',23,0,3);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-13  3:06:07
