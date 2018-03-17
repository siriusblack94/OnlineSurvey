/*
SQLyog Ultimate v11.33 (64 bit)
MySQL - 5.7.11 : Database - surveys
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`surveys` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `surveys`;

/*Table structure for table `t_admin` */

DROP TABLE IF EXISTS `t_admin`;

CREATE TABLE `t_admin` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) DEFAULT NULL,
  `PASS` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `t_admin` */

insert  into `t_admin`(`ID`,`NAME`,`PASS`) values (1,'admin','admin');

/*Table structure for table `t_answer` */

DROP TABLE IF EXISTS `t_answer`;

CREATE TABLE `t_answer` (
  `AID` int(11) NOT NULL AUTO_INCREMENT,
  `UID` int(11) DEFAULT NULL,
  `SID` int(11) DEFAULT NULL,
  `QID` int(11) DEFAULT NULL,
  `RESULT` varchar(255) DEFAULT NULL,
  `NUMBER` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AID`),
  KEY `FK2AAFEA09D39ECA02` (`UID`),
  KEY `FK2AAFEA09D7ECBF99` (`QID`),
  KEY `FK2AAFEA095D2CA04F` (`SID`),
  CONSTRAINT `FK2AAFEA095D2CA04F` FOREIGN KEY (`SID`) REFERENCES `t_survey` (`SID`) ON DELETE CASCADE,
  CONSTRAINT `FK2AAFEA09D39ECA02` FOREIGN KEY (`UID`) REFERENCES `t_user` (`UID`) ON DELETE CASCADE,
  CONSTRAINT `FK2AAFEA09D7ECBF99` FOREIGN KEY (`QID`) REFERENCES `t_question` (`QID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

/*Data for the table `t_answer` */

insert  into `t_answer`(`AID`,`UID`,`SID`,`QID`,`RESULT`,`NUMBER`) values (2,6,31,11,'A',1),(3,6,31,12,'B',1),(4,6,31,13,'AAA',1),(5,6,31,11,'A',2),(6,6,31,12,'BC',2),(7,6,31,13,'QWE',2),(8,6,31,11,'A',3),(9,6,31,12,'CD',3),(10,6,31,13,'QAZ',3),(11,6,31,11,'A',4),(12,6,31,12,'A',4),(13,6,31,13,'uiu',4),(14,6,31,11,'B',5),(15,6,31,12,'A',5),(16,6,31,13,'uiu',5),(19,6,31,11,'A',6),(20,6,31,12,'A',6),(21,6,31,13,'AAA',6),(22,6,31,11,'B',7),(23,6,31,12,'CD',7),(24,6,31,13,'111',7),(25,6,31,11,'B',8),(26,6,31,12,'ABC',8),(27,6,31,13,'ASD',8),(28,6,31,11,'A',9),(29,6,31,12,'AB',9),(30,6,31,13,'QWE',9),(31,6,32,14,'D',10),(32,6,32,15,'BC',10),(33,6,32,16,'QWE',10),(34,6,32,14,'B',11),(35,6,32,15,'ABC',11),(36,6,32,16,'不断电，装空调',11),(37,6,32,14,'B',12),(38,6,32,15,'ABC',12),(39,6,32,16,'q\'a\'s\'da\'s\'d',12),(40,6,31,11,'A',13),(41,6,31,12,'B',13),(42,6,31,13,'吃喝玩乐',13),(43,6,33,17,'A',14),(44,6,33,18,'ABCD',14),(45,6,33,19,'高大上',14),(46,6,33,17,'B',15),(47,6,33,18,'BC',15),(48,6,33,19,'指纹解锁，NFC。',15),(49,6,33,17,'A',16),(50,6,33,18,'ABCD',16),(51,6,33,19,'高大上',16),(52,6,34,20,'A',17),(53,6,34,21,'ABC',17);

/*Table structure for table `t_question` */

DROP TABLE IF EXISTS `t_question`;

CREATE TABLE `t_question` (
  `QID` int(11) NOT NULL AUTO_INCREMENT,
  `TYPE` varchar(255) DEFAULT NULL,
  `TITLE` varchar(255) DEFAULT NULL,
  `SID` int(11) DEFAULT NULL,
  `A` varchar(255) DEFAULT NULL,
  `B` varchar(255) DEFAULT NULL,
  `C` varchar(255) DEFAULT NULL,
  `D` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`QID`),
  KEY `FK16A67B715D2CA04F` (`SID`),
  CONSTRAINT `FK16A67B715D2CA04F` FOREIGN KEY (`SID`) REFERENCES `t_survey` (`SID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

/*Data for the table `t_question` */

insert  into `t_question`(`QID`,`TYPE`,`TITLE`,`SID`,`A`,`B`,`C`,`D`) values (11,'danxuan','您的性别？',31,'男','女','',''),(12,'danxuan','您的年龄?',31,'18岁以下','18-24岁','25-39岁','40以上'),(13,'jianda','您觉得怎样才能算是一个幸福的人？',31,'','','',''),(14,'danxuan','您的年级是：',32,'大一','大二','大三','大四'),(15,'duoxuan',' 您现在的住宿方式是？',32,'住校','走读','在外租房',''),(16,'jianda','如果您是住校，你希望对学校宿舍有和改进?   ',32,'','','',''),(17,'danxuan','您目前使用的手机品牌是什么',33,'三星','小米','苹果','其他'),(18,'duoxuan','您的手机具有如下哪些功能和特性？',33,'快速充电、无线充电','指纹解锁、指纹支付','金属边框、金属机身','近场通讯NFC'),(19,'jianda','您觉得手机应该具有哪些功能和特性？',33,'','','',''),(20,'danxuan','您的性别？',34,'男','女','',''),(21,'duoxuan','你选择网络购物的主要原因是？',34,'方便快捷，节省时间','价格便宜','网购时间不受限制','其他');

/*Table structure for table `t_survey` */

DROP TABLE IF EXISTS `t_survey`;

CREATE TABLE `t_survey` (
  `SID` int(11) NOT NULL AUTO_INCREMENT,
  `SURVEY_NAME` varchar(255) DEFAULT NULL,
  `CREATE_TIME` datetime NOT NULL,
  `STATE` varchar(255) NOT NULL,
  `UID` int(11) NOT NULL,
  PRIMARY KEY (`SID`),
  KEY `FK49C951A5D39ECA02` (`UID`),
  CONSTRAINT `FK49C951A5D39ECA02` FOREIGN KEY (`UID`) REFERENCES `t_user` (`UID`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

/*Data for the table `t_survey` */

insert  into `t_survey`(`SID`,`SURVEY_NAME`,`CREATE_TIME`,`STATE`,`UID`) values (31,'民众幸福感调查问卷','2016-06-04 15:14:19','已发布',6),(32,' 关于学生住宿情况调查','2016-06-07 22:10:17','已发布',6),(33,'手机市场需求调查','2016-06-07 22:16:52','已发布',6),(34,'大学生网购调查问卷','2016-06-12 08:57:32','已发布',6);

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `UID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_NAME` varchar(255) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `CREATE_TIME` datetime NOT NULL,
  `NICK_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`UID`),
  UNIQUE KEY `USER_NAME` (`USER_NAME`),
  UNIQUE KEY `EMAIL` (`EMAIL`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `t_user` */

insert  into `t_user`(`UID`,`USER_NAME`,`PASSWORD`,`EMAIL`,`CREATE_TIME`,`NICK_NAME`) values (5,'qqqqqq','qweqweqwe','163@qq.com','2016-06-02 23:32:52','123'),(6,'aaaadd','qweqwe',NULL,'2016-06-03 08:07:14','nick'),(7,'aqqqqqq','qqqqqq','','2016-06-03 10:04:51',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
