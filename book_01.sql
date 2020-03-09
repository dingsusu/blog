-- MySQL dump 10.13  Distrib 5.7.29, for Linux (x86_64)
--
-- Host: localhost    Database: book_01
-- ------------------------------------------------------
-- Server version	5.7.29-0ubuntu0.18.04.1

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
-- Table structure for table `alembic_version`
--

DROP TABLE IF EXISTS `alembic_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL,
  PRIMARY KEY (`version_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alembic_version`
--

LOCK TABLES `alembic_version` WRITE;
/*!40000 ALTER TABLE `alembic_version` DISABLE KEYS */;
INSERT INTO `alembic_version` VALUES ('9fbbe78fac60');
/*!40000 ALTER TABLE `alembic_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `content` varchar(10000) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `hits` int(11) DEFAULT NULL,
  `comments` int(11) DEFAULT NULL,
  `picture` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`aid`),
  KEY `cid` (`cid`),
  CONSTRAINT `article_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (1,'留胡子邋遢？看看白宇肖战的胡须造型','说到最适合留胡子的男明星，白宇必须拥有姓名。他的胡须造型曾在《镇魂》中迷倒万千少女，还被无数“镇魂女孩”调侃：“那不是胡子，是性感的玫瑰花刺儿”。日常喜欢留胡须的他，无论穿起什么造型，都给人雅痞帅气的既视感。','2020-03-01 00:00:00',NULL,1,NULL,NULL,'img/xiaobai.jpg'),(2,'治愈系甜剧《蓬莱间》，白宇英俊帅气，网友：颜值太高','作为亚太区最帅气面孔之一的他，在很多的影视作品当中，也可以说是各种颜值轮着来，真的是在娱乐圈叱咤风云，时而酷帅男神，时而高冷大叔，画面感简直不要太好，但是在这部剧中他的人设简直不要太完美，今天小编就带大家一起去看看！','2020-03-01 00:00:00',NULL,1,NULL,NULL,'img/xiaobai.jpg'),(3,'伴郎男团哪家强？当看到李现和白宇的时候，妈妈，我恋爱了！','白宇呢我是从《镇魂》开始知道他的，剧里痞帅痞帅的感觉，是多少少女喜欢的大叔型啊。既有一个神仙颜，又有一个有趣的灵魂，哪个女孩子不喜欢他啊。','2020-03-01 00:00:00',NULL,1,NULL,NULL,'img/xiaobai.jpg'),(4,'留胡子邋遢？看看白宇肖战的胡须造型','说到最适合留胡子的男明星，白宇必须拥有姓名。他的胡须造型曾在《镇魂》中迷倒万千少女，还被无数“镇魂女孩”调侃：“那不是胡子，是性感的玫瑰花刺儿”。日常喜欢留胡须的他，无论穿起什么造型，都给人雅痞帅气的既视感。','2020-03-01 00:00:00',NULL,NULL,NULL,NULL,NULL),(5,'伴郎男团哪家强？当看到李现和白宇的时候，妈妈，我恋爱了！','白宇呢我是从《镇魂》开始知道他的，剧里痞帅痞帅的感觉，是多少少女喜欢的大叔型啊。既有一个神仙颜，又有一个有趣的灵魂，哪个女孩子不喜欢他啊。','2020-03-01 00:00:00',NULL,1,NULL,NULL,'img/xiaobai.jpg'),(6,'治愈系甜剧《蓬莱间》，白宇英俊帅气，网友：颜值太高','作为亚太区最帅气面孔之一的他，在很多的影视作品当中，也可以说是各种颜值轮着来，真的是在娱乐圈叱咤风云，时而酷帅男神，时而高冷大叔，画面感简直不要太好，但是在这部剧中他的人设简直不要太完美，今天小编就带大家一起去看看！','2020-03-01 00:00:00',NULL,1,NULL,NULL,'img/xiaobai.jpg'),(7,'伴郎男团哪家强？当看到李现和白宇的时候，妈妈，我恋爱了！','白宇呢我是从《镇魂》开始知道他的，剧里痞帅痞帅的感觉，是多少少女喜欢的大叔型啊。既有一个神仙颜，又有一个有趣的灵魂，哪个女孩子不喜欢他啊。','2020-03-01 00:00:00',NULL,1,NULL,NULL,'img/xiaobai.jpg'),(8,'治愈系甜剧《蓬莱间》，白宇英俊帅气，网友：颜值太高','作为亚太区最帅气面孔之一的他，在很多的影视作品当中，也可以说是各种颜值轮着来，真的是在娱乐圈叱咤风云，时而酷帅男神，时而高冷大叔，画面感简直不要太好，但是在这部剧中他的人设简直不要太完美，今天小编就带大家一起去看看！','2020-03-01 00:00:00',NULL,1,NULL,NULL,'img/xiaobai.jpg');
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `num` int(11) DEFAULT NULL,
  PRIMARY KEY (`cid`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'白宇',0),(2,'flask',0),(3,'pycharm',0),(5,'html',0),(6,'css',0),(7,'js',0);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mark`
--

DROP TABLE IF EXISTS `mark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mark` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `contetnt` varchar(1000) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`mid`),
  KEY `uid` (`uid`),
  CONSTRAINT `mark_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mark`
--

LOCK TABLES `mark` WRITE;
/*!40000 ALTER TABLE `mark` DISABLE KEYS */;
INSERT INTO `mark` VALUES (1,'白宇太帅了','2020-03-08 05:48:44',1),(2,'成老师太帅了','2020-03-08 05:50:47',1),(3,'python太难了','2020-03-08 05:51:13',1);
/*!40000 ALTER TABLE `mark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `aid` int(11) DEFAULT NULL,
  PRIMARY KEY (`tid`),
  KEY `aid` (`aid`),
  CONSTRAINT `tag_ibfk_1` FOREIGN KEY (`aid`) REFERENCES `article` (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (1,'python',1),(2,'白宇',2),(3,'mysql',3),(4,'java',NULL),(5,'千锋',NULL);
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(128) NOT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `portrait` varchar(300) DEFAULT NULL,
  `regtime` datetime DEFAULT NULL,
  `isforbid` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'lilei','123',NULL,NULL,NULL,NULL,NULL);
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

-- Dump completed on 2020-03-09  0:38:31
