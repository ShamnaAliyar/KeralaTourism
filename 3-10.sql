-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.0.45-community-nt - MySQL Community Edition (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for db_tourism
CREATE DATABASE IF NOT EXISTS `db_tourism` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `db_tourism`;

-- Dumping structure for table db_tourism.tbl_district
CREATE TABLE IF NOT EXISTS `tbl_district` (
  `district_id` int(11) NOT NULL auto_increment,
  `district_name` varchar(50) default NULL,
  PRIMARY KEY  (`district_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table db_tourism.tbl_district: ~2 rows (approximately)
DELETE FROM `tbl_district`;
/*!40000 ALTER TABLE `tbl_district` DISABLE KEYS */;
INSERT INTO `tbl_district` (`district_id`, `district_name`) VALUES
	(4, 'Ernakulam'),
	(5, 'Idukki');
/*!40000 ALTER TABLE `tbl_district` ENABLE KEYS */;

-- Dumping structure for table db_tourism.tbl_hotel
CREATE TABLE IF NOT EXISTS `tbl_hotel` (
  `hotel_id` int(11) NOT NULL auto_increment,
  `hotel_name` varchar(50) default NULL,
  `location_id` int(11) default NULL,
  `hoteltype_id` int(11) default NULL,
  `hotel_address` varchar(50) default NULL,
  `hotel_phnno` varchar(50) default NULL,
  `hotel_emailid` varchar(50) default NULL,
  PRIMARY KEY  (`hotel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table db_tourism.tbl_hotel: ~1 rows (approximately)
DELETE FROM `tbl_hotel`;
/*!40000 ALTER TABLE `tbl_hotel` DISABLE KEYS */;
INSERT INTO `tbl_hotel` (`hotel_id`, `hotel_name`, `location_id`, `hoteltype_id`, `hotel_address`, `hotel_phnno`, `hotel_emailid`) VALUES
	(2, 'Prince', 14, 3, 'Adimaly p.o', '9947622151', 'prince123@gmail.com'),
	(3, 'Merin ', 14, 3, 'Adimaly p.o', '9947622341', 'merin123@gmail.com'),
	(5, 'achu', 13, 4, 'MUNNAR PO', '9886574565', 'achu@gmail.com'),
	(6, 'AMMU', 13, 4, 'Munnar p.o', '7559865671', 'ammu@gmail.com');
/*!40000 ALTER TABLE `tbl_hotel` ENABLE KEYS */;

-- Dumping structure for table db_tourism.tbl_hotelrate
CREATE TABLE IF NOT EXISTS `tbl_hotelrate` (
  `hotelrate_id` int(11) NOT NULL auto_increment,
  `hotel_id` int(11) default NULL,
  `rmtype_id` int(11) default NULL,
  `hotelrate_amount` int(11) default NULL,
  PRIMARY KEY  (`hotelrate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table db_tourism.tbl_hotelrate: ~0 rows (approximately)
DELETE FROM `tbl_hotelrate`;
/*!40000 ALTER TABLE `tbl_hotelrate` DISABLE KEYS */;
INSERT INTO `tbl_hotelrate` (`hotelrate_id`, `hotel_id`, `rmtype_id`, `hotelrate_amount`) VALUES
	(4, 5, 1, 2000);
/*!40000 ALTER TABLE `tbl_hotelrate` ENABLE KEYS */;

-- Dumping structure for table db_tourism.tbl_hoteltype
CREATE TABLE IF NOT EXISTS `tbl_hoteltype` (
  `hoteltype_id` int(11) NOT NULL auto_increment,
  `hoteltype_name` varchar(50) default NULL,
  PRIMARY KEY  (`hoteltype_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table db_tourism.tbl_hoteltype: ~2 rows (approximately)
DELETE FROM `tbl_hoteltype`;
/*!40000 ALTER TABLE `tbl_hoteltype` DISABLE KEYS */;
INSERT INTO `tbl_hoteltype` (`hoteltype_id`, `hoteltype_name`) VALUES
	(3, 'FIVE ****'),
	(4, '3 star');
/*!40000 ALTER TABLE `tbl_hoteltype` ENABLE KEYS */;

-- Dumping structure for table db_tourism.tbl_location
CREATE TABLE IF NOT EXISTS `tbl_location` (
  `location_id` int(11) NOT NULL auto_increment,
  `location_name` varchar(50) default NULL,
  `district_id` int(11) default NULL,
  PRIMARY KEY  (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- Dumping data for table db_tourism.tbl_location: ~2 rows (approximately)
DELETE FROM `tbl_location`;
/*!40000 ALTER TABLE `tbl_location` DISABLE KEYS */;
INSERT INTO `tbl_location` (`location_id`, `location_name`, `district_id`) VALUES
	(13, 'Munnar', 5),
	(14, 'Adimaly', 5);
/*!40000 ALTER TABLE `tbl_location` ENABLE KEYS */;

-- Dumping structure for table db_tourism.tbl_locationgallery
CREATE TABLE IF NOT EXISTS `tbl_locationgallery` (
  `locgal_id` int(11) NOT NULL auto_increment,
  `locgal_caption` varchar(500) default NULL,
  `location_id` int(11) default NULL,
  `locgal_filename` varchar(500) default NULL,
  PRIMARY KEY  (`locgal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table db_tourism.tbl_locationgallery: ~0 rows (approximately)
DELETE FROM `tbl_locationgallery`;
/*!40000 ALTER TABLE `tbl_locationgallery` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_locationgallery` ENABLE KEYS */;

-- Dumping structure for table db_tourism.tbl_login
CREATE TABLE IF NOT EXISTS `tbl_login` (
  `login_password` varchar(50) default NULL,
  `login_id` int(11) NOT NULL auto_increment,
  `login_username` varchar(50) NOT NULL default '0',
  PRIMARY KEY  (`login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table db_tourism.tbl_login: ~1 rows (approximately)
DELETE FROM `tbl_login`;
/*!40000 ALTER TABLE `tbl_login` DISABLE KEYS */;
INSERT INTO `tbl_login` (`login_password`, `login_id`, `login_username`) VALUES
	('admin', 1, 'admin');
/*!40000 ALTER TABLE `tbl_login` ENABLE KEYS */;

-- Dumping structure for table db_tourism.tbl_package
CREATE TABLE IF NOT EXISTS `tbl_package` (
  `package_id` int(11) NOT NULL auto_increment,
  `packagetype_id` int(11) default NULL,
  `package_name` varchar(50) default NULL,
  `package_no_days` int(11) default NULL,
  `package_rate` int(11) default NULL,
  PRIMARY KEY  (`package_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table db_tourism.tbl_package: ~2 rows (approximately)
DELETE FROM `tbl_package`;
/*!40000 ALTER TABLE `tbl_package` DISABLE KEYS */;
INSERT INTO `tbl_package` (`package_id`, `packagetype_id`, `package_name`, `package_no_days`, `package_rate`) VALUES
	(1, 1, '', 2, 14),
	(2, 2, 'Gold', 5, 2500);
/*!40000 ALTER TABLE `tbl_package` ENABLE KEYS */;

-- Dumping structure for table db_tourism.tbl_packagelocation
CREATE TABLE IF NOT EXISTS `tbl_packagelocation` (
  `packagelocation_id` int(11) NOT NULL auto_increment,
  `package_id` int(11) default NULL,
  `location_id` int(11) default NULL,
  `packagelocation_day` int(11) default NULL,
  PRIMARY KEY  (`packagelocation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table db_tourism.tbl_packagelocation: ~0 rows (approximately)
DELETE FROM `tbl_packagelocation`;
/*!40000 ALTER TABLE `tbl_packagelocation` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_packagelocation` ENABLE KEYS */;

-- Dumping structure for table db_tourism.tbl_packageplace
CREATE TABLE IF NOT EXISTS `tbl_packageplace` (
  `packageplace_id` int(11) NOT NULL auto_increment,
  `packagelocation_id` int(11) default NULL,
  `touristplace_id` int(11) default NULL,
  PRIMARY KEY  (`packageplace_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table db_tourism.tbl_packageplace: ~0 rows (approximately)
DELETE FROM `tbl_packageplace`;
/*!40000 ALTER TABLE `tbl_packageplace` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_packageplace` ENABLE KEYS */;

-- Dumping structure for table db_tourism.tbl_packagetype
CREATE TABLE IF NOT EXISTS `tbl_packagetype` (
  `packagetype_id` int(11) NOT NULL auto_increment,
  `packagetype_name` varchar(50) default NULL,
  PRIMARY KEY  (`packagetype_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table db_tourism.tbl_packagetype: ~2 rows (approximately)
DELETE FROM `tbl_packagetype`;
/*!40000 ALTER TABLE `tbl_packagetype` DISABLE KEYS */;
INSERT INTO `tbl_packagetype` (`packagetype_id`, `packagetype_name`) VALUES
	(2, 'Family'),
	(3, 'College');
/*!40000 ALTER TABLE `tbl_packagetype` ENABLE KEYS */;

-- Dumping structure for table db_tourism.tbl_roomtype
CREATE TABLE IF NOT EXISTS `tbl_roomtype` (
  `rmtype_id` int(11) NOT NULL auto_increment,
  `rmtype_name` varchar(50) default NULL,
  PRIMARY KEY  (`rmtype_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table db_tourism.tbl_roomtype: ~1 rows (approximately)
DELETE FROM `tbl_roomtype`;
/*!40000 ALTER TABLE `tbl_roomtype` DISABLE KEYS */;
INSERT INTO `tbl_roomtype` (`rmtype_id`, `rmtype_name`) VALUES
	(1, 'AC');
/*!40000 ALTER TABLE `tbl_roomtype` ENABLE KEYS */;

-- Dumping structure for table db_tourism.tbl_touristplace
CREATE TABLE IF NOT EXISTS `tbl_touristplace` (
  `touristplace_id` int(11) NOT NULL auto_increment,
  `location_id` int(11) default NULL,
  `touristplace_name` varchar(50) default NULL,
  PRIMARY KEY  (`touristplace_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table db_tourism.tbl_touristplace: ~3 rows (approximately)
DELETE FROM `tbl_touristplace`;
/*!40000 ALTER TABLE `tbl_touristplace` DISABLE KEYS */;
INSERT INTO `tbl_touristplace` (`touristplace_id`, `location_id`, `touristplace_name`) VALUES
	(1, 13, 'Rajamala'),
	(2, 13, 'Mattupetty'),
	(3, 13, 'EcoPoint');
/*!40000 ALTER TABLE `tbl_touristplace` ENABLE KEYS */;

-- Dumping structure for table db_tourism.tbl_vehicle
CREATE TABLE IF NOT EXISTS `tbl_vehicle` (
  `vehicle_id` int(11) NOT NULL auto_increment,
  `vehicle_name` varchar(50) default NULL,
  `vehicletype_id` int(11) default NULL,
  `vehicle_no_seats` int(11) default NULL,
  PRIMARY KEY  (`vehicle_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- Dumping data for table db_tourism.tbl_vehicle: ~7 rows (approximately)
DELETE FROM `tbl_vehicle`;
/*!40000 ALTER TABLE `tbl_vehicle` DISABLE KEYS */;
INSERT INTO `tbl_vehicle` (`vehicle_id`, `vehicle_name`, `vehicletype_id`, `vehicle_no_seats`) VALUES
	(1, '1', 3, 2),
	(2, '1', 3, 3),
	(3, 'retrfyer', 4, 3),
	(4, 'werewqr', 4, 4),
	(5, 'asdf', 4, 3),
	(8, 'SwiftDesire', 7, 5),
	(9, 'Duster', 7, 10);
/*!40000 ALTER TABLE `tbl_vehicle` ENABLE KEYS */;

-- Dumping structure for table db_tourism.tbl_vehicletype
CREATE TABLE IF NOT EXISTS `tbl_vehicletype` (
  `vehicletype_id` int(11) NOT NULL auto_increment,
  `vehicletype_name` varchar(50) default NULL,
  PRIMARY KEY  (`vehicletype_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumping data for table db_tourism.tbl_vehicletype: ~3 rows (approximately)
DELETE FROM `tbl_vehicletype`;
/*!40000 ALTER TABLE `tbl_vehicletype` DISABLE KEYS */;
INSERT INTO `tbl_vehicletype` (`vehicletype_id`, `vehicletype_name`) VALUES
	(5, 'Traveller'),
	(6, 'Bus'),
	(7, 'Car');
/*!40000 ALTER TABLE `tbl_vehicletype` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
