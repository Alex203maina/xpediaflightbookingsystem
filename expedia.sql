/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 8.0.42 : Database - expedia
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`expedia` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `expedia`;

/*Table structure for table `airlines` */

DROP TABLE IF EXISTS `airlines`;

CREATE TABLE `airlines` (
  `airlineid` int NOT NULL AUTO_INCREMENT,
  `airlinename` varchar(45) DEFAULT NULL,
  `airlinelogo` varchar(45) DEFAULT NULL,
  `homecountryid` int DEFAULT NULL,
  PRIMARY KEY (`airlineid`),
  KEY `homecountryid` (`homecountryid`),
  CONSTRAINT `airlines_ibfk_1` FOREIGN KEY (`homecountryid`) REFERENCES `countries` (`countryid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `airlines` */

insert  into `airlines`(`airlineid`,`airlinename`,`airlinelogo`,`homecountryid`) values 
(1,'Delta Airlines','delta-logo.png',5),
(2,'Kenya Airways','kq.png',8),
(3,'Ethiopian airline','ethiopian-airline.png',9),
(4,'Alaska Airlines','al.jpg',5),
(5,'Jambo Jet','jambo.png',8),
(6,'Fly 540','fly.png',8),
(7,'Safari Link','safari.png',8),
(8,'Skyward Express','Skyward.png',8),
(9,'Air Tanzania','airtanzania.png',4);

/*Table structure for table `airports` */

DROP TABLE IF EXISTS `airports`;

CREATE TABLE `airports` (
  `airportid` int NOT NULL AUTO_INCREMENT,
  `airportname` varchar(45) DEFAULT NULL,
  `airportcode` varchar(45) DEFAULT NULL,
  `cityid` int DEFAULT NULL,
  PRIMARY KEY (`airportid`),
  KEY `cityid_idx` (`cityid`),
  CONSTRAINT `airports_ibfk_1` FOREIGN KEY (`cityid`) REFERENCES `cities` (`cityid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `airports` */

insert  into `airports`(`airportid`,`airportname`,`airportcode`,`cityid`) values 
(1,'John F. Kennedy International','JFK',2),
(2,'Jomo Kenya International Airport','NBO',1),
(7,'Moi International Airport','MBA',1),
(8,'Kisumu International Airport','KIS',1),
(9,'Wilson airport','WIL',1),
(10,'LaGuardia Airport','LGA',2),
(11,'Newark Liberty International Airport ','EWR',2);

/*Table structure for table `bookingclasses` */

DROP TABLE IF EXISTS `bookingclasses`;

CREATE TABLE `bookingclasses` (
  `classid` int NOT NULL AUTO_INCREMENT,
  `classname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`classid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `bookingclasses` */

insert  into `bookingclasses`(`classid`,`classname`) values 
(1,'Economy'),
(2,'Business'),
(3,'First Class');

/*Table structure for table `bookingtypes` */

DROP TABLE IF EXISTS `bookingtypes`;

CREATE TABLE `bookingtypes` (
  `typeid` int NOT NULL AUTO_INCREMENT,
  `typename` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`typeid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `bookingtypes` */

insert  into `bookingtypes`(`typeid`,`typename`) values 
(4,'One-way'),
(5,'Round-trip'),
(6,'Multi-city');

/*Table structure for table `cities` */

DROP TABLE IF EXISTS `cities`;

CREATE TABLE `cities` (
  `cityid` int NOT NULL AUTO_INCREMENT,
  `cityname` varchar(45) NOT NULL,
  `countryid` int DEFAULT NULL,
  PRIMARY KEY (`cityid`),
  KEY `countryid_idx` (`countryid`),
  CONSTRAINT `cities_ibfk_1` FOREIGN KEY (`countryid`) REFERENCES `countries` (`countryid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `cities` */

insert  into `cities`(`cityid`,`cityname`,`countryid`) values 
(1,'Nairobi',8),
(2,'New york',5),
(3,'Kigali',7),
(4,'Dodoma',4),
(5,'Eldoret',8),
(6,'Kisumu',8),
(7,'Arusha',4);

/*Table structure for table `countries` */

DROP TABLE IF EXISTS `countries`;

CREATE TABLE `countries` (
  `countryid` int NOT NULL AUTO_INCREMENT,
  `countryname` varchar(45) NOT NULL,
  PRIMARY KEY (`countryid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `countries` */

insert  into `countries`(`countryid`,`countryname`) values 
(1,'Sudan'),
(3,'London'),
(4,'Tanzania'),
(5,'USA'),
(6,'Uganda'),
(7,'rwanda'),
(8,'Kenya'),
(9,'Ethiopia');

/*Table structure for table `currencies` */

DROP TABLE IF EXISTS `currencies`;

CREATE TABLE `currencies` (
  `currencyid` int NOT NULL AUTO_INCREMENT,
  `currencyname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`currencyid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `currencies` */

insert  into `currencies`(`currencyid`,`currencyname`) values 
(1,'KES'),
(2,'USD'),
(3,'EUR');

/*Table structure for table `flightbookingclasses` */

DROP TABLE IF EXISTS `flightbookingclasses`;

CREATE TABLE `flightbookingclasses` (
  `flightbookingclassid` int NOT NULL AUTO_INCREMENT,
  `flightid` int DEFAULT NULL,
  `flightbookingid` int DEFAULT NULL,
  `bookingclassid` int DEFAULT NULL,
  `noofseats` int DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `currencyid` int DEFAULT NULL,
  PRIMARY KEY (`flightbookingclassid`),
  KEY `fk_bookingclassid_idx` (`bookingclassid`),
  KEY `fk_flight_id_idx` (`flightid`),
  KEY `fk_flightbookingid_idx` (`flightbookingid`),
  KEY `fk_currencyid_idx` (`currencyid`),
  CONSTRAINT `flightbookingclasses_ibfk_1` FOREIGN KEY (`bookingclassid`) REFERENCES `bookingclasses` (`classid`),
  CONSTRAINT `flightbookingclasses_ibfk_2` FOREIGN KEY (`currencyid`) REFERENCES `currencies` (`currencyid`),
  CONSTRAINT `flightbookingclasses_ibfk_3` FOREIGN KEY (`flightid`) REFERENCES `flights` (`flightid`),
  CONSTRAINT `flightbookingclasses_ibfk_4` FOREIGN KEY (`flightbookingid`) REFERENCES `flightbookings` (`flightbookingid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `flightbookingclasses` */

insert  into `flightbookingclasses`(`flightbookingclassid`,`flightid`,`flightbookingid`,`bookingclassid`,`noofseats`,`price`,`currencyid`) values 
(1,3,3,3,10,450.00,2);

/*Table structure for table `flightbookingpassangers` */

DROP TABLE IF EXISTS `flightbookingpassangers`;

CREATE TABLE `flightbookingpassangers` (
  `passengerid` int NOT NULL AUTO_INCREMENT,
  `bookingclassid` int DEFAULT NULL,
  `documentid` int DEFAULT NULL,
  `travelertypeid` int DEFAULT NULL,
  `iddocumentno` int DEFAULT NULL,
  `firstname` varchar(45) DEFAULT NULL,
  `middlename` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `dateofbirth` date DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `nationality` varchar(45) DEFAULT NULL,
  `flightbookingclassid` int DEFAULT NULL,
  PRIMARY KEY (`passengerid`),
  KEY `fk_travelid_idx` (`travelertypeid`),
  KEY `fk_documentid_idx` (`documentid`),
  KEY `fk_bookingclass_idx` (`bookingclassid`),
  KEY `flightbookingclassid` (`flightbookingclassid`),
  CONSTRAINT `flightbookingpassangers_ibfk_1` FOREIGN KEY (`documentid`) REFERENCES `traveldocuments` (`documentid`),
  CONSTRAINT `flightbookingpassangers_ibfk_2` FOREIGN KEY (`flightbookingclassid`) REFERENCES `flightbookingclasses` (`flightbookingclassid`),
  CONSTRAINT `flightbookingpassangers_ibfk_3` FOREIGN KEY (`travelertypeid`) REFERENCES `travelers` (`travelertypeid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `flightbookingpassangers` */

insert  into `flightbookingpassangers`(`passengerid`,`bookingclassid`,`documentid`,`travelertypeid`,`iddocumentno`,`firstname`,`middlename`,`lastname`,`dateofbirth`,`gender`,`nationality`,`flightbookingclassid`) values 
(1,2,1,1,123456789,'John','Michael','Doe','1990-05-15','Male','USA',1);

/*Table structure for table `flightbookings` */

DROP TABLE IF EXISTS `flightbookings`;

CREATE TABLE `flightbookings` (
  `flightbookingid` int NOT NULL AUTO_INCREMENT,
  `flightid` int DEFAULT NULL,
  `paymentmethodid` int DEFAULT NULL,
  `bookingdate` datetime DEFAULT NULL,
  `bookingtypeid` int DEFAULT NULL,
  PRIMARY KEY (`flightbookingid`),
  KEY `fk_paymentmethodid_idx` (`paymentmethodid`),
  KEY `fk_flightid_idx` (`flightid`),
  KEY `fk_bookingtypeid_idx` (`bookingtypeid`),
  CONSTRAINT `fk_bookingtypeid` FOREIGN KEY (`bookingtypeid`) REFERENCES `bookingtypes` (`typeid`),
  CONSTRAINT `flightbookings_ibfk_1` FOREIGN KEY (`paymentmethodid`) REFERENCES `payments` (`paymentid`),
  CONSTRAINT `flightbookings_ibfk_2` FOREIGN KEY (`flightid`) REFERENCES `flights` (`flightid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `flightbookings` */

insert  into `flightbookings`(`flightbookingid`,`flightid`,`paymentmethodid`,`bookingdate`,`bookingtypeid`) values 
(3,3,2,'2025-08-19 14:30:00',4);

/*Table structure for table `flightclasses` */

DROP TABLE IF EXISTS `flightclasses`;

CREATE TABLE `flightclasses` (
  `flightclassid` int NOT NULL AUTO_INCREMENT,
  `flightid` int DEFAULT NULL,
  `bookingclassid` int DEFAULT NULL,
  `noofseats` int DEFAULT NULL,
  `unitprice` decimal(10,2) DEFAULT NULL,
  `currencyid` int DEFAULT NULL,
  PRIMARY KEY (`flightclassid`),
  KEY `fk_bookingclassid_idx` (`bookingclassid`),
  KEY `fk_currency_idx` (`currencyid`),
  KEY `fk_flights_idx` (`flightid`),
  KEY `flight_id_idx` (`flightid`),
  KEY `classid_idx` (`bookingclassid`),
  KEY `curency_idx` (`currencyid`),
  CONSTRAINT `flightclasses_ibfk_1` FOREIGN KEY (`bookingclassid`) REFERENCES `bookingclasses` (`classid`),
  CONSTRAINT `flightclasses_ibfk_2` FOREIGN KEY (`currencyid`) REFERENCES `currencies` (`currencyid`),
  CONSTRAINT `flightclasses_ibfk_3` FOREIGN KEY (`flightid`) REFERENCES `flights` (`flightid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `flightclasses` */

insert  into `flightclasses`(`flightclassid`,`flightid`,`bookingclassid`,`noofseats`,`unitprice`,`currencyid`) values 
(1,3,1,100,150.00,2),
(2,3,2,10,150.00,2),
(4,3,3,10,15.00,2);

/*Table structure for table `flights` */

DROP TABLE IF EXISTS `flights`;

CREATE TABLE `flights` (
  `flightid` int NOT NULL AUTO_INCREMENT,
  `flightno` varchar(45) DEFAULT NULL,
  `airlineid` int DEFAULT NULL,
  `departurecityid` int DEFAULT NULL,
  `departureairportid` int DEFAULT NULL,
  `destinationcityid` int DEFAULT NULL,
  `destinationairportid` int DEFAULT NULL,
  `departuretime` datetime DEFAULT NULL,
  `durationofflight` time DEFAULT NULL,
  PRIMARY KEY (`flightid`),
  KEY `airlineid_idx` (`airlineid`),
  KEY `cityid_idx` (`departurecityid`,`destinationcityid`),
  KEY `fk_departureairportid_idx` (`departureairportid`),
  KEY `fk_destinationairportid_idx` (`destinationairportid`),
  KEY `destinationcityid` (`destinationcityid`),
  CONSTRAINT `fk_departurecityid` FOREIGN KEY (`departurecityid`) REFERENCES `cities` (`cityid`),
  CONSTRAINT `flights_ibfk_1` FOREIGN KEY (`destinationcityid`) REFERENCES `cities` (`cityid`),
  CONSTRAINT `flights_ibfk_2` FOREIGN KEY (`airlineid`) REFERENCES `airlines` (`airlineid`),
  CONSTRAINT `flights_ibfk_3` FOREIGN KEY (`departureairportid`) REFERENCES `airports` (`airportid`),
  CONSTRAINT `flights_ibfk_4` FOREIGN KEY (`destinationairportid`) REFERENCES `airports` (`airportid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `flights` */

insert  into `flights`(`flightid`,`flightno`,`airlineid`,`departurecityid`,`departureairportid`,`destinationcityid`,`destinationairportid`,`departuretime`,`durationofflight`) values 
(3,'UA123',2,1,2,2,1,'2025-12-15 08:00:00','02:30:00'),
(4,'KQ123',2,1,2,2,1,'2025-12-12 08:00:00','02:30:00');

/*Table structure for table `payments` */

DROP TABLE IF EXISTS `payments`;

CREATE TABLE `payments` (
  `paymentid` int NOT NULL AUTO_INCREMENT,
  `methodname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`paymentid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `payments` */

insert  into `payments`(`paymentid`,`methodname`) values 
(1,'Mpesa'),
(2,'PayPal'),
(3,'Credit Card');

/*Table structure for table `traveldocuments` */

DROP TABLE IF EXISTS `traveldocuments`;

CREATE TABLE `traveldocuments` (
  `documentid` int NOT NULL AUTO_INCREMENT,
  `documenttype` varchar(45) DEFAULT NULL,
  `documentexpires` date DEFAULT NULL,
  PRIMARY KEY (`documentid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `traveldocuments` */

insert  into `traveldocuments`(`documentid`,`documenttype`,`documentexpires`) values 
(1,'Passport','2030-05-15');

/*Table structure for table `travelers` */

DROP TABLE IF EXISTS `travelers`;

CREATE TABLE `travelers` (
  `travelertypeid` int NOT NULL AUTO_INCREMENT,
  `typename` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`travelertypeid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `travelers` */

insert  into `travelers`(`travelertypeid`,`typename`) values 
(1,'Adult'),
(2,'Child'),
(3,'Infant');

/* Procedure structure for procedure `sp_airlinedetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_airlinedetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_airlinedetails`($airlineid int)
begin
		select a.*, countryname
		from `airlines` a
		join `countries` c on c.countryid = a.homecountryid
		where a.airlineid= $airlineid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_checkairline` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_checkairline` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkairline`(
    IN p_airlineid INT,
    IN p_airlinename VARCHAR(200)
)
BEGIN
    SELECT * 
    FROM airlines
    WHERE airlineid != p_airlineid 
      AND airlinename = p_airlinename;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_checkairport` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_checkairport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkairport`(
    IN $airportid INT, 
    IN $airportname VARCHAR(200), 
    IN $airportcode VARCHAR(200)
)
BEGIN
    SELECT * 
    FROM `airports`
    WHERE `airportid` != $airportid 
      AND (`airportname` = $airportname OR `airportcode` = $airportcode);
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_checkbookingclasses` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_checkbookingclasses` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkbookingclasses`($classid int, $classname varchar(200))
BEGIN
		select * from
		`bookingclasses`
		where `classid` != $classid and `classname` = $classname;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_checkbookingtype` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_checkbookingtype` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkbookingtype`(
    $typeid INT, 
    $typename VARCHAR(200)
)
BEGIN
    -- Check if typename exists for a different typeid (for duplicate checking)
    SELECT * FROM `bookingtypes`
    WHERE  `typeid` != $typeid AND `typename` = $typename;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_checkcity` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_checkcity` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkcity`($cityid int,$cityname varchar(200))
BEGIN
		select * from `cities`
		where `cityid` != $cityid and `cityname` = $cityname;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_checkcountry` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_checkcountry` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkcountry`($countryid int, $countryname varchar(200))
BEGIN
		select * from `countries`
		where `countryid` != $countryid and `countryname`= $countryname;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_checkflight` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_checkflight` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkflight`(
    IN $flightno VARCHAR(50),
    IN $airlineid INT,
    IN $departurecityid INT,
    IN $destinationcityid INT,
    IN $departuretime DATETIME
)
BEGIN
    SELECT * 
    FROM Flights
    WHERE flightno = $flightno
      AND airlineid = $airlineid
      AND departurecityid = $departurecityid
      AND destinationcityid = $destinationcityid
      AND departuretime = $departuretime;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_checkflights` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_checkflights` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkflights`(
    IN `$flightno` VARCHAR(45),
    IN `$departurecity` VARCHAR(200),
    IN `$destinationcity` VARCHAR(200)
)
BEGIN
    -- Handle empty or null inputs
    IF `$flightno` = '' THEN
        SET `$flightno` = '%';
    END IF;
    
    IF `$departurecity` = '' THEN
        SET `$departurecity` = '%';
    END IF;
    
    IF `$destinationcity` = '' THEN
        SET `$destinationcity` = '%';
    END IF;

    -- Select flights with joined city information
    SELECT f.flightid, f.flightno, f.departuretime, dc.cityname AS depcityname, ac.cityname AS arrcityname
    FROM `flights` f
    JOIN `airports` da ON f.departureairportid = da.airportid
    JOIN `cities` dc ON da.cityid = dc.cityid
    JOIN `airports` aa ON f.destinationairportid = aa.airportid
    JOIN `cities` ac ON aa.cityid = ac.cityid
    WHERE f.flightno LIKE CONCAT('%', `$flightno`, '%')
      AND dc.cityname LIKE CONCAT('%', `$departurecity`, '%')
      AND ac.cityname LIKE CONCAT('%', `$destinationcity`, '%')
    ORDER BY dc.cityname, ac.cityname;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deleteairline` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deleteairline` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteairline`($airlineid int)
BEGIN
		delete from `airlines`
		where `airlineid` = $airlineid;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deleteairport` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deleteairport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteairport`($airportid int)
BEGIN
		DELETE FROM `airports`
		WHERE `airportid`= $airportid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deletebookingclass` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deletebookingclass` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deletebookingclass`($classid int)
BEGIN
		delete from `bookingclasses`
		where `classid`= $classid;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deletebookingtypes` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deletebookingtypes` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deletebookingtypes`($typeid int)
BEGIN
		delete from `bookingtypes`
		where `typeid`= $typeid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deletecity` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deletecity` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deletecity`($cityid int)
BEGIN
		select * from `cities`
		where `cityid` = $cityid;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deletecountry` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deletecountry` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deletecountry`($countryid int)
BEGIN
		delete from `countries`
		where `countryid` = $countryid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deletecurrency` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deletecurrency` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deletecurrency`($currencyid int)
BEGIN
		delete from `currencies` where
		`currencyid` = $currencyid;
	

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deleteflight` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deleteflight` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteflight`($flightid int)
BEGIN
		delete from `flights` where
		`flightid` = $flightid;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deleteflightbooking` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deleteflightbooking` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteflightbooking`($flightbookingid int)
BEGIN
	delete from `flightbookings`
	where `flightbookingid` = $flightbookingid;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deleteflightbookingpassenger` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deleteflightbookingpassenger` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteflightbookingpassenger`($passengerid int)
BEGIN
		delete from `flightbookingpassangers`
		where `passengerid` = $passengerid;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deleteflightclasses` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deleteflightclasses` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteflightclasses`($flightclassid int)
BEGIN
		delete from `flightclasses` where 
		`flightclassid`= $flightclassid;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deletepayment` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deletepayment` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deletepayment`($paymentid int)
BEGIN
		delete from `payments`
		where `paymentid`= $paymentid;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deletetraveldocument` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deletetraveldocument` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deletetraveldocument`($documentid int)
BEGIN
		delete from `traveldocuments`
		where `documentid` = $documentid;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deletetravelers` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deletetravelers` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deletetravelers`($travelertypeid int)
BEGIN
		delete from `travelers`
		where `travelertypeid` = $travelertypeid;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_filterairlines` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_filterairlines` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_filterairlines`(
    IN `$airlinename` VARCHAR(200), 
    IN `$countryname` VARCHAR(200)
)
BEGIN
    -- Handle empty parameters by setting them to NULL
    IF `$airlinename` = '' THEN
        SET `$airlinename` = NULL;
    END IF;
    
    IF `$countryname` = '' THEN
        SET `$countryname` = NULL;
    END IF;
    
    SELECT 
        a.*, 
        c.countryname
    FROM `airlines` a
    JOIN `countries` c ON c.countryid = a.homecountryid  -- Fixed JOIN syntax
    WHERE 
        (`$airlinename` IS NULL OR a.airlinename LIKE CONCAT('%', `$airlinename`, '%'))
        AND (`$countryname` IS NULL OR c.countryname LIKE CONCAT('%', `$countryname`, '%'))
    ORDER BY a.airlinename;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_filterairport` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_filterairport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_filterairport`(
    IN $cityname VARCHAR(200), 
    IN $airportname VARCHAR(100),
    in $airportcode varchar(200),
    in $countryname varchar(200)
)
BEGIN
	IF $cityname = '' THEN
		SET $cityname = '@@@@';
	END IF;

	IF $airportname = '' THEN
		SET $airportname = '@@@@';
	END IF;
	if $airportcode = '' then
		SET $airportcode = '@@@@';
	end if;
	if $countryname = '' then
		set $countryname = '@@@@';
	end if;

		
    SELECT a.*, c.cityname, ct.countryname
    FROM `airports` a
    JOIN `cities` c ON c.cityid = a.cityid
    join `countries` ct ON c.countryid = ct.countryid
    WHERE c.cityname LIKE CONCAT('%', $cityname, '%')
       OR a.airportname LIKE CONCAT('%', $airportname, '%')
       or a.airportcode like concat ('%', $airportcode, '%')
       or ct.countryname like concat ('%', $countryname, '%')
    ORDER BY c.cityname, a.airportname,a.airportcode, ct.countryname;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_filterbookingpassengers` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_filterbookingpassengers` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_filterbookingpassengers`(
    IN `$passengerid` INT,
    IN `$flightbookingclassid` INT,
    IN `$bookingclassid` INT,
    IN `$firstname` VARCHAR(100),
    IN `$lastname` VARCHAR(100),
    IN `$dob` DATE,
    IN `$gender` VARCHAR(10),
    IN `$nationality` VARCHAR(50),
    IN `$iddocumentno` INT,
    IN `$flightno` VARCHAR(20),
    IN `$travelertypeid` INT  -- Added this parameter
)
BEGIN
    SELECT 
        p.passengerid,
        p.bookingclassid,
        bc.classname AS booking_class,
        p.documentid,
        p.firstname,
        COALESCE(p.middlename, '') AS middlename,
        p.lastname,
        p.dateofbirth,
        p.gender,
        p.nationality,
        p.iddocumentno,
        -- Booking details
        f.flightno,
        f.departuretime,
        al.airlinename,
        dep.airportcode AS departure_airport,
        arr.airportcode AS arrival_airport,
        -- Document details
        d.documenttype,
        d.documentid,
        d.documentexpires AS documentexpires,
        -- travel type details
        t.travelertypeid,
        t.typename
        
    FROM `flightbookingpassangers` p
    LEFT JOIN bookingclasses bc ON p.bookingclassid = bc.classid
    LEFT JOIN flightbookingclasses fb ON p.flightbookingclassid = fb.flightbookingclassid
    LEFT JOIN flights f ON fb.flightid = f.flightid
    LEFT JOIN airlines al ON f.airlineid = al.airlineid
    LEFT JOIN airports dep ON f.departureairportid = dep.airportid
    LEFT JOIN airports arr ON f.destinationairportid = arr.airportid
    LEFT JOIN traveldocuments d ON p.documentid = d.documentid
    LEFT JOIN travelers t ON p.travelertypeid = t.travelertypeid  -- Changed table name
    
    WHERE 1=1
    AND (`$passengerid` IS NULL OR p.passengerid = `$passengerid`)
    AND (`$flightbookingclassid` IS NULL OR p.flightbookingclassid = `$flightbookingclassid`)
    AND (`$bookingclassid` IS NULL OR p.bookingclassid = `$bookingclassid`)
    AND (`$firstname` IS NULL OR p.firstname LIKE CONCAT('%', `$firstname`, '%'))
    AND (`$lastname` IS NULL OR p.lastname LIKE CONCAT('%', `$lastname`, '%'))
    AND (`$dob` IS NULL OR p.dateofbirth = `$dob`)
    AND (`$gender` IS NULL OR p.gender = `$gender`)
    AND (`$nationality` IS NULL OR p.nationality LIKE CONCAT('%', `$nationality`, '%'))
    AND (`$iddocumentno` IS NULL OR p.iddocumentno = `$iddocumentno`)  -- Changed to exact match for INT
    AND (`$flightno` IS NULL OR f.flightno LIKE CONCAT('%', `$flightno`, '%'))
    AND (`$travelertypeid` IS NULL OR p.travelertypeid = `$travelertypeid`)
    
    ORDER BY p.lastname, p.firstname DESC;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_filtercities` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_filtercities` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_filtercities`(
    IN `$countryname` VARCHAR(200),
    IN `$cityname` VARCHAR(200)
)
BEGIN
    -- Handle empty or null inputs
    IF `$countryname` = '' THEN
        SET `$countryname` = '%';
    END IF;
    
    IF `$cityname` = '' THEN
        SET `$cityname` = '%';
    END IF;

    -- Select cities with joined country information
    SELECT c.*, o.countryname
    FROM `cities` c
    JOIN `countries` o ON o.countryid = c.countryid
    WHERE (`$countryname` IS NULL OR o.countryname LIKE CONCAT('%', `$countryname`, '%'))
      AND (`$cityname` IS NULL OR c.cityname LIKE CONCAT('%', `$cityname`, '%'))
    ORDER BY o.countryname, c.cityname;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_filterflightbookingclasses` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_filterflightbookingclasses` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_filterflightbookingclasses`($flightbookingid INT)
BEGIN
	 -- Get booking header information
    SELECT 
        fb.flightbookingid,
        fb.bookingdate,
        f.flightno,
        f.departuretime,
        al.airlinename,
        dep.airportcode AS departure_airport,
        arr.airportcode AS arrival_airport,
        pm.methodname AS payment_method,
        bt.typename AS booking_type,
        COUNT(fbc.flightbookingclassid) AS number_of_classes,
        SUM(fbc.noofseats) AS total_passengers,
        SUM(fbc.noofseats * fbc.price) AS total_amount
    FROM flightbookings fb
    JOIN flights f ON fb.flightid = f.flightid
    JOIN airlines al ON f.airlineid = al.airlineid
    JOIN airports dep ON f.departureairportid = dep.airportid
    JOIN airports arr ON f.destinationairportid = arr.airportid
    JOIN payments pm ON fb.paymentmethodid = pm.paymentid
    JOIN bookingtypes bt ON fb.bookingtypeid = bt.typeid
    LEFT JOIN flightbookingclasses fbc ON fb.flightbookingid = fbc.flightbookingid
    WHERE fb.flightbookingid = `$flightbookingid`
    GROUP BY fb.flightbookingid;
    
    -- Get detailed class information for this booking
    SELECT 
        fbc.flightbookingclassid,
        bc.classname AS booking_class,
        fbc.noofseats,
        fbc.price AS price_per_seat,
        curr.currencyname,
        (fbc.noofseats * fbc.price) AS subtotal
    FROM flightbookingclasses fbc
    JOIN bookingclasses bc ON fbc.bookingclassid = bc.classid
    JOIN currencies curr ON fbc.currencyid = curr.currencyid
    WHERE fbc.flightbookingid = `$flightbookingid`
    ORDER BY bc.classname;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_filterflightbookings` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_filterflightbookings` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_filterflightbookings`(
    IN `$flightbookingid` INT,
    IN `$flightno` VARCHAR(200),
    IN `$departuretime` DATETIME,
    IN `$bookingdate` DATETIME,
    IN `$paymentmethodname` VARCHAR(200),
    IN `$typename` VARCHAR(200),
    IN `$airlinename` VARCHAR(200)
)
BEGIN
    SELECT
        fb.flightbookingid,
        fb.bookingdate,
        f.flightno,
        f.departuretime,
        al.airlinename,
        dep.airportcode AS departureairport,
        arr.airportcode AS arrivalairport,
        pm.methodname,
        bt.typename AS bookingtypename,
        fc.bookingclassid,
        bc.classname AS bookingclassname,
        curr.currencyname
    FROM `flightbookings` fb
    JOIN `flights` f ON fb.flightid = f.flightid
    JOIN `airlines` al ON f.airlineid = al.airlineid
    JOIN `airports` dep ON f.departureairportid = dep.airportid
    JOIN `airports` arr ON f.destinationairportid = arr.airportid  
    JOIN `payments` pm ON fb.paymentmethodid = pm.paymentid
    JOIN `bookingtypes` bt ON fb.bookingtypeid = bt.typeid
    JOIN `flightclasses` fc ON f.flightid = fc.flightid
    JOIN `bookingclasses` bc ON fc.bookingclassid = bc.classid
    JOIN `currencies` curr ON fc.currencyid = curr.currencyid
    
    WHERE 1=1
    AND (`$flightbookingid` IS NULL OR fb.flightbookingid = `$flightbookingid`)
    AND (`$flightno` IS NULL OR f.flightno LIKE CONCAT('%', `$flightno`, '%'))
    AND (`$departuretime` IS NULL OR DATE(f.departuretime) = DATE(`$departuretime`))
    AND (`$bookingdate` IS NULL OR DATE(fb.bookingdate) = DATE(`$bookingdate`))
    AND (`$paymentmethodname` IS NULL OR pm.methodname = `$paymentmethodname`)  -- FIXED: Changed $methodname to $paymentmethodname
    AND (`$typename` IS NULL OR bt.typename = `$typename`)
    AND (`$airlinename` IS NULL OR al.airlinename LIKE CONCAT('%', `$airlinename`, '%'))
    ORDER BY fb.bookingdate DESC, f.departuretime; 
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_filterflightclasses` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_filterflightclasses` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_filterflightclasses`($flightid int)
BEGIN
		select fc.`flightclassid`,
		fc.`flightid`,
		f.flightno as flightno,
		bc.classname as classname,
		fc.noofseats,
		fc.unitprice,
		fc.currencyid,
		cu.currencyname
		from `flightclasses` fc
		inner join flights f on fc.flightid = f.flightid
		inner join `bookingclasses` bc on fc.`bookingclassid`= bc.`classid`
		inner join `currencies` cu on fc.currencyid = cu.`currencyid`
		where (`$flightid` is null or fc.flightid = `$flightid`)
		order by f.flightno, bc.classname;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_flightdetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_flightdetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_flightdetails`(
    IN `$airportname` VARCHAR(255),
    IN `$cityname` VARCHAR(200),
    IN `$departurecountryname` VARCHAR(100),
    IN `$destinationcountryname` VARCHAR(100)
)
BEGIN
    -- Set default values if parameters are empty
    IF `$airportname` = '' THEN
        SET `$airportname` = '%';
    END IF;
    
    IF `$cityname` = '' THEN
        SET `$cityname` = '%';
    END IF;
    
    IF `$departurecountryname` = '' THEN
        SET `$departurecountryname` = '%';
    END IF;
    
    IF `$destinationcountryname` = '' THEN
        SET `$destinationcountryname` = '%';
    END IF;

    SELECT f.flightid,
        f.flightno,
        
        -- Departure information
        dep_city.cityname AS departure_cityname,
        dep_country.countryname AS departure_countryname,
        dep_airport.airportname AS departure_airportname,
        dep_airport.airportcode AS departure_airport_code,
        
        -- Destination information
        dest_city.cityname AS destination_cityname,
        dest_country.countryname AS destination_countryname,
        dest_airport.airportname AS destination_airportname,
        dest_airport.airportcode AS destination_airport_code,
        
        -- Airline information
        al.airlinename
        
    FROM `flights` f
    JOIN `airlines` al ON f.airlineid = al.airlineid
    JOIN `airports` dep_airport ON f.departureairportid = dep_airport.airportid
    JOIN `cities` dep_city ON dep_airport.cityid = dep_city.cityid
    JOIN `countries` dep_country ON dep_city.countryid = dep_country.countryid
    JOIN `airports` dest_airport ON f.destinationairportid = dest_airport.airportid
    JOIN `cities` dest_city ON dest_airport.cityid = dest_city.cityid
    JOIN `countries` dest_country ON dest_city.countryid = dest_country.countryid
    WHERE 
        (dep_airport.airportname LIKE CONCAT('%', `$airportname`, '%') OR 
         dest_airport.airportname LIKE CONCAT('%', `$airportname`, '%') OR
         dep_airport.airportcode LIKE CONCAT('%', `$airportname`, '%') OR 
         dest_airport.airportcode LIKE CONCAT('%', `$airportname`, '%'))
        AND (dep_city.cityname LIKE CONCAT('%', `$cityname`, '%') OR 
             dest_city.cityname LIKE CONCAT('%', `$cityname`, '%'))
        AND (dep_country.countryname LIKE CONCAT('%', `$departurecountryname`, '%'))
        AND (dest_country.countryname LIKE CONCAT('%', `$destinationcountryname`, '%'))
    ORDER BY dep_city.cityname, dest_city.cityname;

END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getairlines` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getairlines` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getairlines`()
BEGIN
	select * from `airlines`
	order by `airlinename`;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getairport` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getairport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getairport`()
BEGIN
		select * from `airports`
		ORDER BY `airportname`;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getairportdetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getairportdetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getairportdetails`($airportid int)
BEGIN
		select a.*, c.cityname, n.countryname
		from `airports` a
		join `cities` c on c.cityid = a.cityid
		join `countries` n on n.countryid= c.countryid
		where a.airportid= $airportid;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getbookingclass` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getbookingclass` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getbookingclass`()
BEGIN
		select * from `bookingclasses`
		order by `classname`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getbookingclassdetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getbookingclassdetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getbookingclassdetails`($classid int)
BEGIN
		SELECT * FROM `bookingclasses`
		WHERE `classid` = $classid;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getbookingdetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getbookingdetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getbookingdetails`($typeid int)
BEGIN
		SELECT * FROM `bookingtypes`
		WHERE `typeid`= $typeid;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getbookingtypes` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getbookingtypes` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getbookingtypes`()
BEGIN
		select * from `bookingtypes`
		order by `typename`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getcities` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getcities` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getcities`()
BEGIN
		select * from `cities`
		order by `cityname`;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getcitydetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getcitydetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getcitydetails`($cityid INT)
BEGIN
		select * from `cities`
		where `cityid`= $cityid;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getcountries` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getcountries` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getcountries`()
BEGIN
		SELECT * from `countries`
		order by `countryname`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getcountrydetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getcountrydetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getcountrydetails`( $countryid int)
BEGIN
		select * from `countries`
		where `countryid`= $countryid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getcurrency` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getcurrency` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getcurrency`($currencyid int)
BEGIN
		select * from `currencies` where
		`currencyid` = $currencyid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getflight` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getflight` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getflight`($flightid int)
BEGIN
		select * from `flights`
		where `flightid`= $flightid;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getflightbookingclass` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getflightbookingclass` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getflightbookingclass`($flightbookingclassid int)
BEGIN
	select * from `flightbookingclasses`
	where `flightbookingclassid` = $flightbookingclassid;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getflightbookingpassengers` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getflightbookingpassengers` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getflightbookingpassengers`($passengerid int)
BEGIN
	SELECT * FROM `flightbookingpassangers`
	WHERE `passengerid` = $passengerid;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getflightbookings` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getflightbookings` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getflightbookings`($flightbookingid int)
BEGIN
		select * from `flightbookings` 
		where `flightbookingid`= $flightbookingid;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getflightclasses` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getflightclasses` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getflightclasses`($flightclassid int)
BEGIN
		select * from `flightclasses`
		where `flightclassid` = $flightclassid;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getflightdetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getflightdetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getflightdetails`($flightid int)
BEGIN
		select * from `flights`
		where `flightid`= $flightid;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getflights` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getflights` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getflights`()
BEGIN
		select * from `flights`
		order by `flightno`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getpayment` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getpayment` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getpayment`($paymentid int)
BEGIN
		select * from `payments` where
		`paymentid` = $paymentid;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_gettraveldocuments` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_gettraveldocuments` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_gettraveldocuments`($documentid int)
BEGIN
		select * from `traveldocuments`
		where `documentid` = $documentid;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_gettravelers` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_gettravelers` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_gettravelers`($travelertypeid int)
BEGIN
		select * from `travelers`
		where `travelertypeid` = $travelertypeid;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_saveairport` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_saveairport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_saveairport`(
    IN $airportid INT,
    IN $airportname VARCHAR(255),
    IN $airportcode VARCHAR(255),
    IN $cityid INT
)
BEGIN
    IF $airportid = 0 THEN
        IF NOT EXISTS (SELECT * FROM `airports` WHERE `airportcode` = $airportcode or `airportname`= $airportname ) THEN
            INSERT INTO `airports`(`airportname`, `airportcode`, `cityid`)
            VALUES ($airportname, $airportcode, $cityid);
        END IF;
    ELSE
        IF NOT EXISTS(SELECT * FROM `airports`
        WHERE `airportid` != $airportid AND (`airportcode` = $airportcode or `airportname`= $airportname)) THEN
            UPDATE `airports`
            SET `airportname` = $airportname, 
                `airportcode` = $airportcode, 
                `cityid` = $cityid
            WHERE `airportid` = $airportid;
        END IF;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_savebookingclasses` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_savebookingclasses` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_savebookingclasses`(
    IN $classid INT,
    IN $classname VARCHAR(200)
)
BEGIN
    IF $classid = 0 THEN
        IF NOT EXISTS (SELECT * FROM `bookingclasses` WHERE `classname` = $classname) THEN
            INSERT INTO `bookingclasses`(`classname`)
            VALUES($classname);
        END IF;
    ELSE
        UPDATE `bookingclasses`
        SET `classname` = $classname
        WHERE `classid` = $classid;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_savebookingtypes` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_savebookingtypes` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_savebookingtypes`(
IN $typeid INT,
IN $typename VARCHAR(45)
)
BEGIN
	if $typeid=0 THEN
		IF NOT EXISTs (select * FROM `bookingtypes` WHERE `typename`= $typename) THEN 
		INSERT INTO `bookingtypes`(`typename`)
		VALUES($typename);
		END IF;
	ELSE
		UPDATE `bookingtypes`
		SET `typename` = $typename
		WHERE `typeid` = $typeid;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_savecity` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_savecity` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_savecity`(
    IN $cityid INT,
    IN $cityname VARCHAR(255),
    IN $countryid INT
)
BEGIN
    IF $cityid = 0 THEN
        IF NOT EXISTS (SELECT * FROM `cities` WHERE `cityname` = $cityname AND `countryid` = $countryid) THEN
            INSERT INTO `cities`(`cityname`, `countryid`)
            VALUES ($cityname, $countryid);
        END IF;
    ELSE
        UPDATE `cities`
        SET `cityname` = $cityname,
            `countryid` = $countryid
        WHERE `cityid` = $cityid;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_savecountry` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_savecountry` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_savecountry`(
    IN $countryid INT,
    IN $countryname VARCHAR(45)
)
BEGIN
    IF $countryid = 0 THEN
        -- Insert if not exists
        IF NOT EXISTS (SELECT * FROM `countries` WHERE `countryname` = $countryname) THEN
            INSERT INTO `countries`(`countryname`)
            VALUES($countryname);
        END IF;
    ELSE
        -- Update existing record
        UPDATE `countries`
        SET `countryname` = $countryname
        WHERE `countryid` = $countryid;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_savecurrency` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_savecurrency` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_savecurrency`(
    IN $currencyid INT,
    IN $currencyname VARCHAR(200)
)
BEGIN
    IF $currencyid = 0 THEN
        IF NOT EXISTS (SELECT * FROM `currencies` WHERE `currencyname` = $currencyname) THEN
            INSERT INTO `currencies`(`currencyname`)
            VALUES($currencyname);
        END IF;
    ELSE
        UPDATE `currencies`
        SET `currencyname` = $currencyname
        WHERE `currencyid` = $currencyid;
    END IF;
    
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_saveflightbookingclasses` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_saveflightbookingclasses` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_saveflightbookingclasses`( $flightbookingclassid int, $flightid int, $flightbookingid int, 
$bookingclassid int, $noofseats int, $price decimal(10,2), $currencyid int)
BEGIN
	if $flightbookingclassid = 0 then
		if not exists(select * from `flightbookingclasses` where `flightid` = $flightid and `flightbookingid` = $flightbookingid AND `bookingclassid`= $bookingclassid AND
		`noofseats`= $noofseats AND `price`= $price AND`currencyid`= $currencyid) then
			insert into `flightbookingclasses`(`flightid`,`flightbookingid`,`bookingclassid`,`noofseats`,`price`,`currencyid`)
			values($flightid, $flightbookingid, $bookingclassid, $noofseats, $price, $currencyid);
		end if;
	else
		update `flightbookingclasses`
		set `flightid` = $flightid, `flightbookingid` = $flightbookingid,`bookingclassid`=$bookingclassid,`noofseats`=$noofseats,
		`price`=$price, `currencyid`=$currencyid
		where `flightbookingclassid` = $flightbookingclassid;
	end if;

end */$$
DELIMITER ;

/* Procedure structure for procedure `sp_saveflightbookingpassangers` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_saveflightbookingpassangers` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_saveflightbookingpassangers`($passangerid int, $bookingclassid int, $documentid int, $travelertypeid int,
    $iddocumentno int, $firstname varchar(200), $middlename varchar(200), $lastname varchar(200), $dateofbirth date, $gender varchar(200),
    $nationality varchar(200), $flightbookingclassid int)
BEGIN
		if $passangerid = 0 then
			if not exists (select * from `flightbookingpassangers` where `bookingclassid` = $bookingclassid and
				`documentid` = $documentid and `travelertypeid`= $travelertypeid and `iddocumentno` = $iddocumentno and
				`firstname`= $firstname and `middlename` = $middlename and `lastname` = $lastname and `dateofbirth`= $dateofbirth
				and `gender`= $gender and `nationality`= $nationality and `flightbookingclassid` = $flightbookingclassid)THEN
				insert into `flightbookingpassangers`(`bookingclassid`,`documentid`,`travelertypeid`,`iddocumentno`,`firstname`,
				`middlename`,`lastname`,`dateofbirth`,`gender`,`nationality`,`flightbookingclassid`)
				values($bookingclassid, $documentid, $travelertypeid, $iddocumentno, $firstname, $middlename, $lastname,
				 $dateofbirth, $gender,$nationality,$flightbookingclassid);
			end if;
		else
			update `flightbookingpassangers`
			set `bookingclassid`= $bookingclassid, `documentid`=$documentid, `travelertypeid`= $travelertypeid, `iddocumentno`= $iddocumentno,
			`firstname`= $firstname, `middlename` = $middlename, `lastname`= $lastname, `dateofbirth`= $dateofbirth,
			`gender` = $gender, `nationality`= $nationality, `flightbookingclassid` = $flightbookingclassid
			where `passangerid` = $passangerid;
		end if;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_saveflightbookings` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_saveflightbookings` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_saveflightbookings`(
    IN `$flightbookingid` INT,
    IN `$flightid` INT,
    IN `$paymentmethodid` INT,
    IN `$bookingdate` DATETIME,
    IN `$bookingtypeid` INT
)
BEGIN
    IF `$flightbookingid` = 0 THEN
        IF NOT EXISTS (
            SELECT *
            FROM `flightbookings` 
            WHERE `flightid` = `$flightid`
              AND `paymentmethodid` = `$paymentmethodid`
              AND `bookingdate` = `$bookingdate`
              AND `bookingtypeid` = `$bookingtypeid`
        ) THEN
            INSERT INTO `flightbookings`(`flightid`, `paymentmethodid`, `bookingdate`, `bookingtypeid`)
            VALUES(`$flightid`, `$paymentmethodid`, `$bookingdate`, `$bookingtypeid`);
        END IF;
    ELSE
        UPDATE `flightbookings`
        SET `flightid` = `$flightid`,
            `paymentmethodid` = `$paymentmethodid`,
            `bookingdate` = `$bookingdate`,
            `bookingtypeid` = `$bookingtypeid`
        WHERE `flightbookingid` = `$flightbookingid`;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_saveflightclasses` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_saveflightclasses` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_saveflightclasses`(
    IN `$flightclassid` INT,
    IN `$flightid` INT,
    IN `$bookingclassid` INT,
    IN `$noofseats` INT,
    IN `$unitprice` DECIMAL(10,2),
    IN `$currencyid` INT
)
BEGIN
    DECLARE duplicate_class INT DEFAULT 0;
    
    -- Check if the booking class already exists for this flight (excluding current record if updating)
    SELECT COUNT(*) INTO duplicate_class
    FROM `flightclasses`
    WHERE `flightid` = `$flightid`
      AND `bookingclassid` = `$bookingclassid`
      AND (`flightclassid` != `$flightclassid` OR `$flightclassid` = 0);
    
    IF duplicate_class > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Booking class already exists for this flight. Cannot add duplicate booking class.';
    ELSE
        IF `$flightclassid` = 0 THEN
            -- Insert new record
            INSERT INTO `flightclasses` (`flightid`, `bookingclassid`, `noofseats`, `unitprice`, `currencyid`)
            VALUES(`$flightid`, `$bookingclassid`, `$noofseats`, `$unitprice`, `$currencyid`);
        ELSE
            -- Update existing record
            UPDATE `flightclasses`
            SET `flightid` = `$flightid`,
                `bookingclassid` = `$bookingclassid`,
                `noofseats` = `$noofseats`,
                `unitprice` = `$unitprice`,
                `currencyid` = `$currencyid`
            WHERE `flightclassid` = `$flightclassid`;
        END IF;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_saveflights` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_saveflights` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_saveflights`(
    IN $flightid INT,
    IN $flightno VARCHAR(200),
    IN $airlineid INT,
    IN $departurecityid INT,
    IN $departureairportid INT,
    IN $destinationcityid INT,
    IN $destinationairportid INT,
    IN $departuretime DATETIME,
    IN $durationofflight TIME
)
BEGIN
    -- Input validation
    IF $airlineid = 0 OR $departurecityid = 0 OR $departureairportid = 0 
       OR $destinationcityid = 0 OR $destinationairportid = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'All location IDs must be provided';
    END IF;

    IF $flightid = 0 THEN
        -- Insert new flight
        IF NOT EXISTS (
            SELECT * FROM `flights` 
            WHERE `flightno` = $flightno 
            AND `airlineid` = $airlineid
            AND `departuretime` = $departuretime
        ) THEN
            INSERT INTO `flights`(
                `flightno`,
                `airlineid`,
                `departurecityid`,
                `departureairportid`,
                `destinationcityid`,
                `destinationairportid`,
                `departuretime`,
                `durationofflight`
            )
            VALUES(
                $flightno,
                $airlineid,
                $departurecityid,
                $departureairportid,
                $destinationcityid,
                $destinationairportid,
                $departuretime,
                $durationofflight
            );
            
            SELECT LAST_INSERT_ID() AS new_flightid;
        ELSE
            SELECT flightid FROM `flights` 
            WHERE `flightno` = $flightno 
            AND `airlineid` = $airlineid
            AND `departuretime` = $departuretime
            LIMIT 1;
        END IF;
    ELSE
        -- Update existing flight
        UPDATE `flights`
        SET 
            `flightno` = $flightno,
            `airlineid` = $airlineid,
            `departurecityid` = $departurecityid,
            `departureairportid` = $departureairportid,
            `destinationcityid` = $destinationcityid,
            `destinationairportid` = $destinationairportid,
            `departuretime` = $departuretime,
            `durationofflight` = $durationofflight
        WHERE `flightid` = $flightid;
        
        SELECT $flightid AS updated_flightid;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_savepayment` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_savepayment` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_savepayment`(
    IN $paymentid INT,
    IN $methodname VARCHAR(200)
)
BEGIN
    IF $paymentid = 0 THEN
        IF NOT EXISTS (SELECT * FROM `payments` WHERE `methodname` = $methodname) THEN
            INSERT INTO `payments`(`methodname`)
            VALUES($methodname);
        END IF;
    ELSE
        UPDATE `payments`
        SET `paymentid` = $paymentid
        WHERE `methodname` = $methodname;
    END IF;
    
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_savesaveairline` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_savesaveairline` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_savesaveairline`(
IN $airlineid INT,
IN $airlinename VARCHAR(255),
IN $airlinelogo VARCHAR(255),
IN $homecountryid INT
)
BEGIN
	IF $airlineid=0 THEN	
		IF NOT EXISTS (SELECT * FROM `airlines` WHERE `airlinename` = $airlinename) THEN
			INSERT INTO `airlines`(`airlinename`,`airlinelogo`,`homecountryid`)
			VALUES($airlinename,$airlinelogo, $homecountryid);
		END IF;
	ELSE
		IF NOT EXISTS(SELECT * FROM `airlines` WHERE `airlineid` != $airlineid AND `airlinename` = $airlinename) THEN
			UPDATE `airlines`
			SET `airlinename`= $airlinename, `airlinelogo`= $airlinelogo, `homecountryid`= $homecountryid
			WHERE `airlineid`= $airlineid;
		END IF;
	END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_savesaveairport` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_savesaveairport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_savesaveairport`(
    IN $airportid INT,
    IN $airportname VARCHAR(255),
    IN $airportcode VARCHAR(255),
    IN $cityid INT
)
BEGIN
    IF $airportid = 0 THEN
        IF NOT EXISTS (SELECT * FROM `airports` WHERE `airportname` = $airportname AND `airportcode` = $airportcode AND `cityid` = $cityid) THEN
            INSERT INTO `airports`(`airportname`, `airportcode`, `cityid`)
            VALUES ($airportname, $airportcode, $cityid);
        END IF;
    ELSE
        UPDATE `airports`
        SET `airportname` = $airportname, 
            `airportcode` = $airportcode, 
            `cityid` = $cityid
        WHERE `airportid` = $airportid;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_savetraveldocuments` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_savetraveldocuments` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_savetraveldocuments`($documentid int, $documenttype VARCHAR(255), $documentexpires date)
BEGIN
	if $documentid = 0 then
		if not exists(select * from `traveldocuments` where `documenttype` = $documenttype and `documentexpires` = $documentexpires) then
			insert into `traveldocuments`(`documenttype`,`documentexpires`)
			values($documenttype, $documentexpires);
		end if;
	else
		update `traveldocuments`
		set `documenttype` = $documenttype, `documentexpires` = $documentexpires
		where `documentid` = $documentid;
	end if;

end */$$
DELIMITER ;

/* Procedure structure for procedure `sp_savetravelers` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_savetravelers` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_savetravelers`($travelertypeid int, $typename varchar(100))
BEGIN
		if $travelertypeid = 0 then
			if not exists (select * from `travelers` where `typename`= $typename)then
				insert into `travelers`(`typename`)
				values($typename);
			end if;
		else
			update `travelers`
			set `typename`= $typename
			where `travelertypeid`= $travelertypeid;
		end if;

	END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
