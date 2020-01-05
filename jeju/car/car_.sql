/*
SQLyog Community v13.1.2 (64 bit)
MySQL - 8.0.17 : Database - parking
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`parking` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `parking`;

/*Table structure for table `car` */

DROP TABLE IF EXISTS `car`;

CREATE TABLE `car` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `car_num` varchar(10) NOT NULL COMMENT '차량 번호',
  `name` varchar(10) NOT NULL COMMENT '차주 이름',
  `enroll` char(1) DEFAULT NULL COMMENT '등록 여부',
  `type` char(5) DEFAULT NULL COMMENT '차종(분류)',
  `parking` char(1) DEFAULT NULL COMMENT '주차 여부',
  `in_time` datetime DEFAULT NULL COMMENT '들어온시간',
  `out_time` datetime DEFAULT NULL COMMENT '나간시간',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `car` */

insert  into `car`(`id`,`car_num`,`name`,`enroll`,`type`,`parking`,`in_time`,`out_time`) values 
(1,'00가0000','김철수','O','중형','O','2019-08-08 13:30:00',NULL),
(2,'01가0001','이상형','O','중형','O','2019-08-08 13:30:00',NULL),
(3,'03가0003','김반차','X','준중형','O','2019-08-04 15:20:45',NULL),
(4,'04가0004','내차키','X','대형','X','2018-06-06 07:45:30','2018-06-06 12:50:34'),
(5,'00가1004','김천사','O','소형','O','1004-10-04 00:10:04',NULL),
(6,'02가0002','내월차','X','소형','X','2012-02-20 02:02:20','2012-03-30 03:03:03'),
(7,'81오6247','이현명','O','대형','X','2015-11-21 01:05:00','2020-01-04 17:09:18'),
(10,'18야1818','흠하하','X','소형',NULL,'2818-08-18 08:28:18','2828-08-18 08:28:18'),
(11,'00g0000','김동현','X','',NULL,NULL,NULL);

/* Procedure structure for procedure `car_delete` */

/*!50003 DROP PROCEDURE IF EXISTS  `car_delete` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `car_delete`(in searchname varchar(10))
BEGIN
		delete from car where name=searchname;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `car_insert` */

/*!50003 DROP PROCEDURE IF EXISTS  `car_insert` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `car_insert`(
    /*LANGUAGE SQL
    | [NOT] DETERMINISTIC
    | { CONTAINS SQL | NO SQL | READS SQL DATA | MODIFIES SQL DATA }
    | SQL SECURITY { DEFINER | INVOKER }
    | COMMENT 'string'*/
    in newcar varchar(10),
    in newname varchar(10),
    in newenroll char(1),
    in newtype char(5))
BEGIN
	
	
	insert into car(car_num, name, enroll, type) values(newcar, newname, newenroll, newtype);
	END */$$
DELIMITER ;

/* Procedure structure for procedure `car_select` */

/*!50003 DROP PROCEDURE IF EXISTS  `car_select` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `car_select`()
BEGIN
		select * from car;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `car_updatetime` */

/*!50003 DROP PROCEDURE IF EXISTS  `car_updatetime` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `car_updatetime`(
    /*LANGUAGE SQL
    | [NOT] DETERMINISTIC
    | { CONTAINS SQL | NO SQL | READS SQL DATA | MODIFIES SQL DATA }
    | SQL SECURITY { DEFINER | INVOKER }
    | COMMENT 'string'*/
    in searchname varchar(10), in newin_time datetime, in newout_time datetime)
BEGIN
		update car set in_time=newin_time, out_time=newout_time where name=searchname;
	END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
