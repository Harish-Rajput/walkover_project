/*
SQLyog Community v13.1.9 (64 bit)
MySQL - 5.0.37-community-nt : Database - walkover_project
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`walkover_project` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `walkover_project`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `name` varchar(100) default NULL,
  `username` varchar(80) default NULL,
  `password` varchar(20) default NULL,
  `email` varchar(100) default NULL,
  `contact` varchar(13) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `admin` */

insert  into `admin`(`name`,`username`,`password`,`email`,`contact`) values 
('Admin','admin','admin','admin@gmail.com','9876543210');




CREATE TABLE `users` (
  `email` varchar(50) NOT NULL,
  `password` varchar(15) default NULL,
  `name` varchar(50) default NULL,
  `contact` varchar(13) default NULL,
  `username` varchar(30) default NULL,
  PRIMARY KEY  (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
