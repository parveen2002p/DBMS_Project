CREATE DATABASE  IF NOT EXISTS `cab2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cab2`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: cab2
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `id` int NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'121');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `id` int NOT NULL AUTO_INCREMENT,
  `custId` int NOT NULL,
  `driverId` int DEFAULT NULL,
  `RC` int DEFAULT NULL,
  `pickupStreet` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `destinationCity` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bookingTime` datetime NOT NULL,
  `price` int NOT NULL,
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'waiting',
  `carType` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT 'sedan',
  PRIMARY KEY (`id`),
  KEY `custId` (`custId`),
  KEY `driverId` (`driverId`),
  KEY `RC` (`RC`),
  KEY `index1` (`custId`),
  KEY `index2` (`status`),
  CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`custId`) REFERENCES `customer` (`id`) ON DELETE CASCADE,
  CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`driverId`) REFERENCES `driver` (`id`) ON DELETE SET NULL,
  CONSTRAINT `booking_ibfk_3` FOREIGN KEY (`RC`) REFERENCES `car` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10169 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (10001,1001,185,1026,'Connecticut','East Theresia','2024-01-01 09:00:00',4502,'success','sedan'),(10002,1090,107,1007,'Kentucky','East Scarlettmouth','2024-01-01 08:00:00',3186,'success','sedan'),(10003,1047,135,1060,'Colorado','Cassieville','2024-01-01 09:00:00',472,'cancelled','sedan'),(10004,1087,150,1042,'Kentucky','Steuberberg','2024-01-01 08:00:00',844,'success','sedan'),(10005,1020,151,1130,'Texas','New Art','2024-01-01 09:00:00',6623,'waiting','sedan'),(10006,1022,134,1034,'Massachusetts','Bradenville','2024-01-01 08:00:00',5337,'success','sedan'),(10007,1023,104,1015,'Vermont','Crookston','2024-01-01 09:00:00',1733,'waiting','sedan'),(10008,1022,112,1061,'Illinois','Gonzalomouth','2024-01-01 08:00:00',6803,'ongoing','sedan'),(10009,1045,151,1089,'California','Port Cathrynburgh','2024-01-01 09:00:00',5387,'cancelled','sedan'),(10010,1078,132,1088,'Maryland','East Gilbertoport','2024-01-01 08:00:00',5745,'waiting','sedan'),(10011,1053,181,1013,'RhodeIsland','West Cara','2024-01-01 09:00:00',1563,'cancelled','sedan'),(10012,1088,152,1128,'Vermont','Blickmouth','2024-01-01 08:00:00',4479,'cancelled','sedan'),(10013,1035,160,1015,'Hawaii','Carmelabury','2024-01-01 09:00:00',5010,'success','sedan'),(10014,1038,114,1037,'NewJersey','Metzmouth','2024-01-01 08:00:00',5897,'success','sedan'),(10015,1055,166,1065,'SouthDakota','Mertzview','2024-01-01 09:00:00',1190,'waiting','sedan'),(10016,1050,138,1035,'Michigan','Port Lola','2024-01-01 08:00:00',3727,'waiting','sedan'),(10017,1005,186,1042,'Iowa','North Vada','2024-01-01 09:00:00',4422,'success','sedan'),(10018,1070,178,1112,'NorthCarolina','Lake Rudolph','2024-01-01 08:00:00',1898,'success','sedan'),(10019,1013,175,1110,'Delaware','North Malindaton','2024-01-01 09:00:00',4924,'cancelled','sedan'),(10020,1060,151,1090,'Hawaii','Westmouth','2024-01-01 08:00:00',6837,'cancelled','sedan'),(10021,1026,170,1011,'Louisiana','Port Clarabelle','2024-01-01 09:00:00',3062,'success','sedan'),(10022,1052,140,1008,'Oregon','Orieport','2024-01-01 08:00:00',587,'cancelled','sedan'),(10023,1038,133,1035,'Montana','Port Kennethberg','2024-01-01 09:00:00',4549,'waiting','sedan'),(10024,1058,183,1023,'Nevada','Arvelland','2024-01-01 08:00:00',257,'success','sedan'),(10025,1056,182,1085,'SouthCarolina','Port Carlichester','2024-01-01 09:00:00',1529,'waiting','sedan'),(10026,1037,148,1039,'Minnesota','East Barton','2024-01-01 08:00:00',6455,'waiting','sedan'),(10027,1006,111,1038,'Idaho','Lake Normaborough','2024-01-01 09:00:00',2161,'success','sedan'),(10028,1051,112,1004,'Nevada','Konopelskiborough','2024-01-01 08:00:00',3065,'ongoing','sedan'),(10029,1081,144,1087,'NewHampshire','Rosstown','2024-01-01 09:00:00',5839,'waiting','sedan'),(10030,1046,104,1124,'Georgia','Lake Noemi','2024-01-01 08:00:00',1592,'success','sedan'),(10031,1021,115,1064,'Delaware','South Deon','2024-01-01 09:00:00',1290,'cancelled','sedan'),(10032,1086,132,1119,'Ohio','Lake Samfort','2024-01-01 08:00:00',2916,'waiting','sedan'),(10033,1053,110,1054,'Idaho','Rohanmouth','2024-01-01 09:00:00',3584,'waiting','sedan'),(10034,1027,146,1067,'Alabama','Willmsville','2024-01-01 08:00:00',3128,'waiting','sedan'),(10035,1068,161,1033,'Utah','East Nelsonhaven','2024-01-01 09:00:00',6992,'cancelled','sedan'),(10036,1081,111,1073,'Georgia','South Dixieport','2024-01-01 08:00:00',6505,'cancelled','sedan'),(10037,1039,154,1025,'Maine','Port Daren','2024-01-01 09:00:00',2577,'cancelled','sedan'),(10038,1021,173,1074,'RhodeIsland','Jastshire','2024-01-01 08:00:00',5922,'waiting','sedan'),(10039,1034,188,1048,'Arizona','East Janie','2024-01-01 09:00:00',1956,'waiting','sedan'),(10040,1028,185,1056,'NorthCarolina','West Matildeview','2024-01-01 08:00:00',4598,'success','sedan'),(10041,1033,177,1033,'Kentucky','Port Sadie','2024-01-01 09:00:00',6962,'cancelled','sedan'),(10042,1079,158,1004,'Nebraska','South Alizetown','2024-01-01 08:00:00',4000,'success','sedan'),(10043,1035,151,1112,'District of Columbia','Garrettborough','2024-01-01 09:00:00',405,'waiting','sedan'),(10044,1059,102,1059,'Washington','Hermannport','2024-01-01 08:00:00',852,'cancelled','sedan'),(10045,1055,138,1012,'Wyoming','Cartwrightstad','2024-01-01 09:00:00',4799,'success','sedan'),(10046,1040,176,1108,'Pennsylvania','New Rosinafort','2024-01-01 08:00:00',6782,'cancelled','sedan'),(10047,1046,137,1095,'Pennsylvania','North Princeberg','2024-01-01 09:00:00',607,'success','sedan'),(10048,1036,104,1076,'NewYork','Port Brionnahaven','2024-01-01 08:00:00',3282,'cancelled','sedan'),(10049,1082,184,1015,'Louisiana','Barretthaven','2024-01-01 09:00:00',6936,'success','sedan'),(10050,1031,147,1024,'Alabama','West Dudley','2024-01-01 08:00:00',5909,'cancelled','sedan'),(10051,1031,114,1116,'RhodeIsland','Lindseyland','2024-01-01 09:00:00',5776,'cancelled','sedan'),(10052,1004,137,1097,'Arkansas','Wilhelmfort','2024-01-01 08:00:00',2652,'success','sedan'),(10053,1084,110,1092,'Nebraska','Port Roryborough','2024-01-01 09:00:00',4178,'cancelled','sedan'),(10054,1040,130,1008,'Alaska','Bayerfurt','2024-01-01 08:00:00',4246,'waiting','sedan'),(10055,1073,143,1057,'Texas','Giovannachester','2024-01-01 09:00:00',2578,'waiting','sedan'),(10056,1023,184,1005,'SouthDakota','West Joesph','2024-01-01 08:00:00',3757,'success','sedan'),(10057,1013,127,1070,'NewHampshire','Hirthehaven','2024-01-01 09:00:00',5630,'success','sedan'),(10058,1082,139,1070,'Louisiana','Lake Rickyhaven','2024-01-01 08:00:00',4093,'success','sedan'),(10059,1078,117,1031,'Kentucky','South Eloise','2024-01-01 09:00:00',6494,'cancelled','sedan'),(10060,1078,107,1115,'Pennsylvania','North Hal','2024-01-01 08:00:00',1880,'cancelled','sedan'),(10061,1014,167,1052,'Vermont','Port Cindy','2024-01-01 09:00:00',4142,'success','sedan'),(10062,1010,130,1047,'Colorado','Lake Kaitlynstad','2024-01-01 08:00:00',5378,'cancelled','sedan'),(10063,1086,169,1062,'Utah','Cormierhaven','2024-01-01 09:00:00',4248,'cancelled','sedan'),(10064,1037,171,1018,'Oklahoma','Krisbury','2024-01-01 08:00:00',3458,'cancelled','sedan'),(10065,1080,147,1091,'Kansas','North Othohaven','2024-01-01 09:00:00',5930,'waiting','sedan'),(10066,1023,174,1070,'Virginia','Lake Taliastad','2024-01-01 08:00:00',5883,'waiting','sedan'),(10067,1077,164,1059,'Utah','New Frank','2024-01-01 09:00:00',6021,'cancelled','sedan'),(10068,1089,175,1097,'Tennessee','Bethelport','2024-01-01 08:00:00',2201,'waiting','sedan'),(10069,1066,190,1129,'Kansas','New Nella','2024-01-01 09:00:00',5288,'waiting','sedan'),(10070,1020,108,1018,'Vermont','Helenside','2024-01-01 08:00:00',3941,'waiting','sedan'),(10071,1014,190,1115,'Missouri','Nikolaushaven','2024-01-01 09:00:00',6914,'success','sedan'),(10072,1030,108,1065,'Virginia','Lake Kayceeport','2024-01-01 08:00:00',4973,'cancelled','sedan'),(10073,1071,158,1119,'Iowa','Reyesville','2024-01-01 09:00:00',2662,'waiting','sedan'),(10074,1003,180,1068,'Oregon','Rueckerhaven','2024-01-01 08:00:00',3137,'success','sedan'),(10075,1013,174,1058,'NewHampshire','Lindgrenhaven','2024-01-01 09:00:00',3551,'cancelled','sedan'),(10076,1061,164,1088,'SouthDakota','South Ramonborough','2024-01-01 08:00:00',487,'cancelled','sedan'),(10077,1002,156,1069,'Nebraska','Quigleyport','2024-01-01 09:00:00',4509,'success','sedan'),(10078,1063,172,1079,'Oregon','Lake Heidi','2024-01-01 08:00:00',2086,'waiting','sedan'),(10079,1074,114,1077,'SouthCarolina','New Kiarafort','2024-01-01 09:00:00',2734,'success','sedan'),(10080,1068,107,1108,'Connecticut','Kelvinfort','2024-01-01 08:00:00',1655,'success','sedan'),(10081,1004,126,1036,'Virginia','Port Jammiefort','2024-01-01 09:00:00',4435,'success','sedan'),(10082,1019,132,1124,'Oklahoma','Lorinebury','2024-01-01 08:00:00',975,'success','sedan'),(10083,1081,156,1021,'NorthCarolina','South Nellie','2024-01-01 09:00:00',3582,'cancelled','sedan'),(10084,1077,159,1124,'Connecticut','Kassulkeside','2024-01-01 08:00:00',4607,'waiting','sedan'),(10085,1062,177,1062,'NorthCarolina','East Marcos','2024-01-01 09:00:00',1971,'cancelled','sedan'),(10086,1023,181,1023,'Arizona','North Ledaton','2024-01-01 08:00:00',1268,'success','sedan'),(10087,1015,161,1066,'Utah','North Maxfurt','2024-01-01 09:00:00',2709,'cancelled','sedan'),(10088,1029,146,1084,'Kansas','New Deontaeberg','2024-01-01 08:00:00',1688,'success','sedan'),(10089,1014,116,1010,'Maryland','South Matteo','2024-01-01 09:00:00',2730,'cancelled','sedan'),(10090,1008,160,1103,'Nebraska','New Ervin','2024-01-01 08:00:00',2087,'cancelled','sedan'),(10091,1049,169,1059,'District of Columbia','Sebastianbury','2024-01-01 09:00:00',2611,'success','sedan'),(10092,1011,166,1007,'Montana','North Kailyn','2024-01-01 08:00:00',4412,'waiting','sedan'),(10093,1028,171,1122,'Florida','New Jaycefort','2024-01-01 09:00:00',2646,'success','sedan'),(10094,1047,178,1056,'NewMexico','Bauchchester','2024-01-01 08:00:00',3980,'cancelled','sedan'),(10095,1034,104,1124,'Arkansas','Jackelinefort','2024-01-01 09:00:00',6040,'waiting','sedan'),(10096,1049,153,1086,'Minnesota','South Trudie','2024-01-01 08:00:00',1315,'success','sedan'),(10097,1030,152,1012,'Kentucky','D\'Amoreland','2024-01-01 09:00:00',3604,'success','sedan'),(10098,1054,161,1070,'Maryland','McLaughlinmouth','2024-01-01 08:00:00',6338,'cancelled','sedan'),(10099,1005,145,1032,'NorthDakota','Lake Janae','2024-01-01 09:00:00',5794,'waiting','sedan'),(10100,1068,133,1024,'Hawaii','Myrtlehaven','2024-01-01 08:00:00',2112,'waiting','sedan'),(10101,1044,107,1043,'Mississippi','Deborahland','2024-01-01 09:00:00',6265,'waiting','sedan'),(10102,1035,184,1002,'Delaware','Lisandrobury','2024-01-01 08:00:00',3441,'cancelled','sedan'),(10103,1017,133,1008,'Ohio','Port Arturo','2024-01-01 09:00:00',1795,'success','sedan'),(10104,1078,103,1054,'NewHampshire','South Brianchester','2024-01-01 08:00:00',989,'waiting','sedan'),(10105,1063,139,1008,'Nebraska','Lake Reid','2024-01-01 09:00:00',5117,'waiting','sedan'),(10106,1035,162,1105,'NewJersey','Lindgrentown','2024-01-01 08:00:00',4123,'success','sedan'),(10107,1039,126,1014,'Texas','Catalinabury','2024-01-01 09:00:00',5054,'waiting','sedan'),(10108,1023,109,1034,'California','Rebekastad','2024-01-01 08:00:00',6833,'waiting','sedan'),(10109,1023,172,1121,'Florida','Brayanmouth','2024-01-01 09:00:00',3647,'waiting','sedan'),(10110,1088,128,1048,'Alabama','Lake Reillyport','2024-01-01 08:00:00',4216,'success','sedan'),(10111,1013,152,1078,'Kansas','Coleton','2024-01-01 09:00:00',5301,'waiting','sedan'),(10112,1061,164,1094,'NorthCarolina','North Jillianville','2024-01-01 08:00:00',6254,'cancelled','sedan'),(10113,1032,114,1029,'NewYork','Stokesland','2024-01-01 09:00:00',5693,'success','sedan'),(10114,1058,182,1115,'Oregon','Jenningsland','2024-01-01 08:00:00',1955,'cancelled','sedan'),(10115,1045,146,1084,'Pennsylvania','East Magnolia','2024-01-01 09:00:00',5452,'success','sedan'),(10116,1005,135,1023,'Nevada','South Baronfort','2024-01-01 08:00:00',2431,'success','sedan'),(10117,1045,147,1086,'Indiana','South Amayachester','2024-01-01 09:00:00',3491,'success','sedan'),(10118,1024,165,1052,'NewJersey','Lake Odaborough','2024-01-01 08:00:00',5878,'waiting','sedan'),(10119,1034,149,1088,'Utah','Ortizshire','2024-01-01 09:00:00',5921,'waiting','sedan'),(10120,1071,179,1021,'District of Columbia','McGlynnview','2024-01-01 08:00:00',4134,'cancelled','sedan'),(10121,1027,111,1005,'Michigan','Hopehaven','2024-01-01 09:00:00',4113,'cancelled','sedan'),(10122,1075,179,1061,'Kansas','Kozeyport','2024-01-01 08:00:00',4417,'waiting','sedan'),(10123,1047,141,1053,'Texas','Port Price','2024-01-01 09:00:00',1355,'waiting','sedan'),(10124,1070,114,1045,'Utah','New Bianka','2024-01-01 08:00:00',6788,'cancelled','sedan'),(10125,1085,155,1088,'Florida','East Spencer','2024-01-01 09:00:00',3605,'waiting','sedan'),(10126,1084,125,1100,'Vermont','South Cassandre','2024-01-01 08:00:00',1237,'cancelled','sedan'),(10127,1049,150,1016,'Delaware','Audreyland','2024-01-01 09:00:00',391,'success','sedan'),(10128,1026,174,1129,'Maryland','Braxtonton','2024-01-01 08:00:00',2894,'waiting','sedan'),(10129,1073,136,1064,'Idaho','Okunevashire','2024-01-01 09:00:00',4341,'waiting','sedan'),(10130,1088,164,1090,'Connecticut','Lake Elian','2024-01-01 08:00:00',6738,'waiting','sedan'),(10131,1016,178,1067,'Mississippi','Spencerview','2024-01-01 09:00:00',6618,'cancelled','sedan'),(10132,1075,189,1124,'Pennsylvania','West Ewell','2024-01-01 08:00:00',1332,'cancelled','sedan'),(10133,1069,107,1106,'Connecticut','Kirlinberg','2024-01-01 09:00:00',1259,'cancelled','sedan'),(10134,1016,143,1031,'Kentucky','Brandostad','2024-01-01 08:00:00',3888,'success','sedan'),(10135,1072,167,1050,'NorthDakota','Lake Audrey','2024-01-01 09:00:00',380,'waiting','sedan'),(10136,1081,135,1023,'Idaho','Kayton','2024-01-01 08:00:00',956,'waiting','sedan'),(10137,1010,129,1111,'District of Columbia','Meaganborough','2024-01-01 09:00:00',4850,'cancelled','sedan'),(10138,1054,162,1093,'NewJersey','West Maya','2024-01-01 08:00:00',4276,'success','sedan'),(10139,1073,162,1010,'Montana','Port Tyree','2024-01-01 09:00:00',1637,'waiting','sedan'),(10140,1008,124,1062,'Alaska','Lake Laurelstad','2024-01-01 08:00:00',5266,'waiting','sedan'),(10141,1018,136,1041,'Ohio','East Frida','2024-01-01 09:00:00',1737,'waiting','sedan'),(10142,1055,151,1118,'Oklahoma','Keeblermouth','2024-01-01 08:00:00',5161,'cancelled','sedan'),(10143,1010,109,1013,'Wyoming','Mitchellside','2024-01-01 09:00:00',3922,'cancelled','sedan'),(10144,1089,187,1112,'SouthDakota','Waelchiberg','2024-01-01 08:00:00',435,'success','sedan'),(10145,1073,142,1042,'Mississippi','Alessandroborough','2024-01-01 09:00:00',4530,'cancelled','sedan'),(10146,1038,162,1004,'Louisiana','Saulville','2024-01-01 08:00:00',2549,'waiting','sedan'),(10147,1017,179,1009,'California','New Herberthaven','2024-01-01 09:00:00',5624,'waiting','sedan'),(10148,1045,110,1094,'Texas','New Cordia','2024-01-01 08:00:00',6610,'cancelled','sedan'),(10149,1008,112,1073,'Texas','Prosaccotown','2024-01-01 09:00:00',2315,'success','sedan'),(10150,1048,148,1044,'Arkansas','South Juvenalbury','2024-01-01 08:00:00',6208,'waiting','sedan'),(10151,1118,108,1026,'p','d','2024-02-02 01:01:01',1200,'success','sedan'),(10152,1118,NULL,NULL,NULL,'Search destination','2024-02-02 01:01:01',100,'success','sedan'),(10153,1118,NULL,NULL,NULL,'Search destination','2024-02-02 01:01:01',100,'success','sedan'),(10154,1118,NULL,NULL,NULL,'Search destination','2024-02-02 01:01:01',100,'success','sedan'),(10156,1118,NULL,NULL,NULL,'Search destination','2023-03-18 09:33:34',233659,'success','sedan'),(10157,1118,NULL,NULL,NULL,'Search destination new','2023-03-18 09:36:39',235890,'success','sedan'),(10158,1118,NULL,NULL,NULL,'Gurugram','2023-03-18 09:49:58',1928,'success','sedan'),(10160,1118,109,1111,'hr','up','2023-03-25 11:43:09',500,'success','sedan'),(10161,1118,115,1069,'home','newhome','2023-04-20 10:10:31',1200,'success','SUV'),(10162,1118,122,1076,'home','home','2023-04-20 11:07:46',1200,'success','SUV'),(10163,1118,112,1063,'home','home','2023-04-20 11:22:29',500,'success','Micro'),(10164,1118,111,1001,'Pickup','Search destination','2023-04-20 17:40:25',1000,'success','Sedan'),(10165,1118,111,1001,'Pickup','Search destination','2023-04-20 17:41:52',1000,'success','Sedan'),(10166,1118,111,1001,'Pickup','Search destination','2023-04-20 17:49:41',1000,'success','Sedan'),(10167,1118,NULL,NULL,'Pickup','Search destination','2023-04-21 07:53:51',800,'aborted','any'),(10168,1118,109,1111,'Pickup','Search destination','2023-04-21 07:54:55',500,'aborted','Micro');
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `driverAssigner` BEFORE INSERT ON `booking` FOR EACH ROW BEGIN
   DECLARE driverId int;
   DECLARE Rc int;
   DECLARE carType varchar(20);
   Select t1.id into driverId from driver as t1 inner join car as t2 on t1.RC=t2.id where status = 'active' AND type = NEW.carType limit 1;
   Select driver.RC into Rc from driver where id = driverId;
   Select car.type into cartype from car where id = Rc;
   IF carType = 'Sedan' THEN
      SET NEW.price = 1000 ;
   ELSEIF carType = 'SUV' THEN
       SET NEW.price = 1200 ;
   ELSEIF carType = 'Micro' THEN
       SET NEW.price = 500 ;
   ELSE
       SET NEW.price = 800 ;
   END IF;
   Update driver set status ='busy' where id = driverId;
   SET NEW.driverId=driverId;
   SET NEW.RC=Rc;
   SET NEW.status='waiting';
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `car`
--

DROP TABLE IF EXISTS `car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `car` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `capacity` int NOT NULL,
  `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Sedan',
  `location` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2024 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car`
--

LOCK TABLES `car` WRITE;
/*!40000 ALTER TABLE `car` DISABLE KEYS */;
INSERT INTO `car` VALUES (1001,'saepe',7,'Sedan','885 Jalen Stravenue Apt. 110\nLake Ceciliafort, OH 42637-6117'),(1002,'id',4,'Micro','SouthDelhi'),(1003,'ipsa',3,'Micro','349 Juliet Prairie Suite 929\nBereniceside, MT 75650-2742'),(1004,'illo',7,'SUV','SouthDelhi'),(1005,'laboriosam',7,'Sedan','6646 McDermott Hills Apt. 245\nLake Lavonne, IN 39941'),(1006,'optio',8,'Sedan','SouthDelhi'),(1007,'ut',6,'Micro','299 Brandt Avenue Apt. 977\nMelbamouth, AR 25396'),(1008,'qui',4,'Micro','SouthDelhi'),(1009,'eveniet',9,'Micro','03668 Casimer Dale Apt. 430\nSouth Lauren, NJ 79556'),(1010,'nesciunt',5,'Micro','SouthDelhi'),(1011,'id',3,'Micro','8717 Tillman Knolls\nJamarborough, KY 06036-2318'),(1012,'enim',9,'SUV','SouthDelhi'),(1013,'eius',5,'Sedan','91661 Newell Way\nPort Estherstad, TX 87224-6201'),(1014,'deleniti',4,'Sedan','SouthDelhi'),(1015,'omnis',5,'SUV','719 Lavon Parks Apt. 080\nPort Ebba, AR 01317'),(1016,'et',3,'Sedan','SouthDelhi'),(1017,'repudiandae',3,'Sedan','958 Abshire Union\nSadyeville, OK 88759'),(1018,'vel',9,'Sedan','SouthDelhi'),(1019,'praesentium',5,'SUV','750 Joaquin Camp Suite 140\nPort Bernardo, NH 25058'),(1020,'aut',4,'Micro','SouthDelhi'),(1021,'ea',3,'Micro','1758 Leta Island\nNorth Kristinberg, WI 00320-2551'),(1022,'quod',4,'Sedan','SouthDelhi'),(1023,'enim',3,'Sedan','04498 Laura Lakes\nNorth Howardside, PA 31380'),(1024,'qui',9,'Sedan','SouthDelhi'),(1025,'amet',4,'Micro','810 Kobe Island Apt. 807\nLake Harmony, NH 77021'),(1026,'autem',5,'SUV','SouthDelhi'),(1027,'eaque',9,'Micro','064 Enid Cape\nDayanamouth, DE 61028-5072'),(1028,'officiis',7,'Micro','SouthDelhi'),(1029,'qui',5,'Sedan','121 Shields Lights Apt. 763\nNorth Jeff, TN 09731-6799'),(1030,'adipisci',9,'SUV','SouthDelhi'),(1031,'molestias',8,'SUV','4759 Violette Pike\nBrakusview, VA 64218-4374'),(1032,'sit',7,'Sedan','SouthDelhi'),(1033,'aut',9,'Micro','456 Von Inlet\nWest Toy, MO 16936'),(1034,'quis',8,'SUV','SouthDelhi'),(1035,'dolorum',9,'Sedan','105 Marks Prairie Apt. 876\nNorth Stan, LA 15469'),(1036,'veritatis',7,'Sedan','SouthDelhi'),(1037,'recusandae',4,'SUV','7212 Vida Rest\nMayerview, NY 22938'),(1038,'dolor',6,'SUV','SouthDelhi'),(1039,'aut',8,'SUV','11056 Quigley Estates Apt. 281\nSchimmelberg, WV 36522'),(1040,'quod',9,'Micro','SouthDelhi'),(1041,'est',8,'Sedan','5250 Homenick Mills Suite 648\nTayaland, DE 04932'),(1042,'consequatur',3,'Micro','SouthDelhi'),(1043,'similique',8,'Sedan','59532 Barrett Burg Suite 919\nBraedenmouth, TN 41772-3303'),(1044,'nulla',7,'Sedan','SouthDelhi'),(1045,'ea',8,'Micro','26566 Aufderhar Highway\nWest Antonietta, SC 08594-5682'),(1046,'delectus',9,'SUV','SouthDelhi'),(1047,'enim',3,'SUV','33796 Stanton Plains Suite 182\nSouth Gudrun, TN 19792-5871'),(1048,'error',6,'Sedan','SouthDelhi'),(1049,'totam',8,'SUV','753 Conroy Key\nLonniefort, ID 65998-2371'),(1050,'et',3,'Sedan','SouthDelhi'),(1051,'laboriosam',6,'Micro','7149 O\'Hara Ranch Suite 780\nWest Fionaport, IN 00838'),(1052,'quam',8,'Micro','SouthDelhi'),(1053,'nulla',4,'Sedan','629 Petra Path Apt. 841\nKadinfurt, AR 62463-5621'),(1054,'fuga',3,'Micro','SouthDelhi'),(1055,'ut',4,'SUV','3855 Bryon Walk\nMertztown, NY 82814'),(1056,'quaerat',3,'Sedan','SouthDelhi'),(1057,'sed',7,'Sedan','8451 Stephon Tunnel Apt. 349\nWest Vidal, VT 73803'),(1058,'rem',8,'Sedan','SouthDelhi'),(1059,'consequatur',5,'Micro','04665 Upton Trace Apt. 375\nLake Allison, TX 55026'),(1060,'perferendis',3,'Micro','SouthDelhi'),(1061,'quia',7,'Sedan','1642 Santiago Wall\nLubowitzchester, TN 38033-6059'),(1062,'et',4,'Micro','SouthDelhi'),(1063,'quis',4,'Micro','798 Lisandro Stravenue Apt. 672\nFritschville, VA 49512'),(1064,'et',6,'Micro','SouthDelhi'),(1065,'rerum',9,'Sedan','940 Zaria Walk\nJastland, NH 88098'),(1066,'a',6,'SUV','SouthDelhi'),(1067,'totam',9,'Micro','643 Beer Parkways Suite 911\nEast Taylorton, WA 51762'),(1068,'consequatur',6,'Micro','SouthDelhi'),(1069,'sit',4,'SUV','094 Borer Loop Suite 855\nNorth Louie, MA 37756-6594'),(1070,'recusandae',4,'Sedan','SouthDelhi'),(1071,'corporis',7,'SUV','159 Jones Parkways\nBahringermouth, OK 14719'),(1072,'illum',8,'Micro','SouthDelhi'),(1073,'fugit',3,'Micro','064 Miller Cliffs\nWebermouth, CT 74206'),(1074,'quis',9,'Micro','SouthDelhi'),(1075,'et',7,'SUV','455 Klocko Via Suite 904\nNorth Judgeview, IL 21212'),(1076,'unde',4,'SUV','SouthDelhi'),(1077,'beatae',9,'Micro','445 Bartell Dam Suite 554\nKoepptown, NH 67725'),(1078,'iste',9,'Micro','SouthDelhi'),(1079,'voluptatem',5,'Sedan','566 Lukas Manors\nBartellview, TN 25990'),(1080,'vero',3,'Micro','SouthDelhi'),(1081,'quia',6,'Micro','0975 Addie Place Suite 668\nHartmannbury, IL 48831'),(1082,'molestiae',4,'Sedan','SouthDelhi'),(1083,'et',5,'Sedan','698 Windler Plains Apt. 356\nCynthiastad, NV 99575-4462'),(1084,'sit',4,'SUV','SouthDelhi'),(1085,'totam',5,'Micro','491 Kathryne Point Apt. 397\nPort Alvah, SD 33513'),(1086,'dolore',3,'SUV','SouthDelhi'),(1087,'aut',5,'Micro','201 Miller Bypass\nLake Esperanzaburgh, NH 63648'),(1088,'dolor',5,'Micro','SouthDelhi'),(1089,'sit',9,'Sedan','2897 Rolfson Forest Apt. 662\nSouth Colt, MD 17197'),(1090,'est',8,'Micro','SouthDelhi'),(1091,'vel',3,'SUV','005 Agnes Orchard\nNew Violet, IN 13251'),(1092,'sint',5,'Sedan','SouthDelhi'),(1093,'ex',6,'SUV','00863 Wyman Mission\nLake Nicolette, CA 50188-8602'),(1094,'nobis',4,'Micro','SouthDelhi'),(1095,'accusamus',8,'SUV','84408 Maegan Freeway Suite 973\nPort Savannamouth, CA 87807'),(1096,'occaecati',7,'SUV','SouthDelhi'),(1097,'aperiam',9,'Sedan','4786 Jenkins Fords Suite 729\nDouglasland, TN 16534'),(1098,'sunt',6,'Micro','SouthDelhi'),(1099,'consequatur',5,'SUV','089 Osinski Inlet\nGaylordbury, HI 54008'),(1100,'vitae',5,'Sedan','SouthDelhi'),(1101,'ex',4,'Sedan','9664 Smith Viaduct Suite 214\nNew Alysson, IL 31579'),(1102,'blanditiis',9,'Sedan','SouthDelhi'),(1103,'quis',8,'SUV','6823 Bosco Lakes\nVicentefort, AR 74653-6457'),(1104,'sed',8,'SUV','SouthDelhi'),(1105,'quis',4,'Sedan','935 Rex Canyon\nNew Deonview, SC 23607-7596'),(1106,'harum',6,'SUV','SouthDelhi'),(1107,'ea',3,'Sedan','170 Brigitte Camp Suite 072\nDavisfort, DC 07390-6431'),(1108,'sunt',9,'Sedan','SouthDelhi'),(1109,'ex',5,'Micro','19849 Bergnaum Fort Suite 562\nPort Zora, LA 92546-1601'),(1110,'perferendis',8,'Sedan','SouthDelhi'),(1111,'sapiente',7,'Micro','051 Beahan Mount Suite 340\nTheresefurt, PA 05366'),(1112,'voluptatibus',3,'Sedan','SouthDelhi'),(1113,'ab',4,'Micro','612 Ettie Views\nEldonchester, KS 53829-8768'),(1114,'tempore',7,'SUV','SouthDelhi'),(1115,'velit',6,'SUV','46990 Lonie Gardens Suite 976\nBeerside, MN 11907-9389'),(1116,'accusantium',7,'Micro','SouthDelhi'),(1117,'doloribus',5,'Sedan','64627 Nick Lake\nHerbertfurt, HI 34120-6085'),(1118,'ad',5,'SUV','SouthDelhi'),(1119,'id',6,'Sedan','135 Verona Haven\nKoeppshire, MA 61544'),(1120,'tenetur',5,'SUV','SouthDelhi'),(1121,'voluptatem',5,'Sedan','749 Alphonso Meadow\nAmbroseview, SC 26793-3278'),(1122,'quo',7,'Sedan','SouthDelhi'),(1123,'odit',4,'SUV','48954 Hessel Run\nSouth Laurine, NH 03485'),(1124,'ea',3,'Sedan','SouthDelhi'),(1125,'nesciunt',8,'Sedan','5894 Kariane Corner\nLake Bria, MD 78636'),(1126,'eum',6,'SUV','SouthDelhi'),(1127,'consequatur',7,'Micro','093 Weissnat Field\nPort Alfredhaven, WI 34836-7301'),(1128,'et',5,'Sedan','SouthDelhi'),(1129,'mollitia',3,'SUV','4606 Samson Vista\nWest Randy, OH 72217-0359'),(1130,'odit',4,'Sedan','SouthDelhi'),(1131,'quia',3,'SUV','749 Boehm Shoal\nPort Roy, WV 76200'),(1132,'repellendus',4,'SUV','SouthDelhi'),(1133,'veniam',8,'Sedan','33483 Citlalli Mountains Suite 834\nRebecastad, MA 20221'),(1134,'veritatis',7,'Micro','SouthDelhi'),(1135,'dicta',5,'SUV','05374 Kautzer Fields\nWest Zella, SC 87167-1505'),(1136,'voluptatem',6,'SUV','SouthDelhi'),(1137,'laborum',9,'Micro','7921 Wolf Bridge Apt. 275\nEast Maximo, DC 23278-8586'),(1138,'dolor',3,'Sedan','SouthDelhi'),(1139,'consequatur',5,'SUV','984 Norma Parkway\nPort Gabrielhaven, WY 78598'),(1140,'facilis',5,'Micro','SouthDelhi'),(1141,'occaecati',7,'Micro','026 Hodkiewicz Island\nWinstonfurt, TX 21421'),(1142,'unde',5,'Sedan','SouthDelhi'),(1143,'illo',5,'SUV','01507 Wanda Meadows Apt. 574\nSouth Adaline, MD 69239-1989'),(1144,'saepe',8,'SUV','SouthDelhi'),(1145,'amet',5,'SUV','961 Braun Fort\nLauryborough, UT 45834-5312'),(1146,'a',6,'SUV','SouthDelhi'),(1147,'voluptate',4,'Sedan','35732 Smith Isle\nSouth Nestorstad, NJ 99305-2397'),(1148,'a',6,'Sedan','SouthDelhi'),(1149,'nemo',4,'Sedan','69104 Dillan Shore\nQuigleyton, GA 36730'),(1150,'et',3,'SUV','SouthDelhi'),(2023,'sonet',5,'SUV','kalka');
/*!40000 ALTER TABLE `car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupon`
--

DROP TABLE IF EXISTS `coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupon` (
  `id` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon`
--

LOCK TABLES `coupon` WRITE;
/*!40000 ALTER TABLE `coupon` DISABLE KEYS */;
INSERT INTO `coupon` VALUES ('121',2),('141',3),('234',5),('241',5),('423',34);
/*!40000 ALTER TABLE `coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `midName` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastName` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` int DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phoneNumber` int NOT NULL,
  `altPhoneNumber` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phoneNumber` (`phoneNumber`),
  KEY `index3` (`username`),
  CONSTRAINT `customer_chk_1` CHECK ((`age` >= 14))
) ENGINE=InnoDB AUTO_INCREMENT=1120 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1000,'Halie','suscipit','Ondricka','381a1e5e816ff447c586933c30a46420e0fbf34f','ugreenfelder',24,'eryn.casper@example.org',96079874,0),(1001,'Shubham','animi','Herzog','3390188d875344747e15f56b4f20ab3b874cb4c6','heller.brendan',69,'ike85@example.org',98017053,69780786),(1002,'Brenden','veritatis','Cremin','32e893ee13b0827b78e753e8e1990ca143915488','bernita.cummerata',61,'lisette21@example.net',73306196,0),(1003,'Keaton','omnis','Senger','783d2933a9807b7bf02d958a08d481cef086b8dc','vada.smith',74,'moshe93@example.com',92524145,0),(1004,'Toni','saepe','Labadie','6779def452db472937895098fc9d32c01f03c96b','oyost',27,'brock.kuvalis@example.com',84826224,0),(1005,'Barrett','praesentium','Murray','f26f7c3b94f21c4be4023c3d8910e0e5a6830a0c','zwiegand',27,'nhegmann@example.org',78855173,0),(1006,'Sierra','incidunt','Shields','84ea43a03cfc87e5bd219af8323b78d70aa1c14d','flatley.assunta',58,'quitzon.zora@example.org',80618064,0),(1007,'Harold','minus','Windler','9b31bcad87674cd42e6655001e2c88d3e76a1206','kledner',53,'harvey.trantow@example.com',87247174,0),(1008,'Sheridan','reiciendis','Kilback','852208e04dc6b321a3bcb4722c25cd16cad4f206','terry.yost',18,'carmela.schroeder@example.net',83099273,0),(1009,'Raphael','commodi','Kozey','c32dc297b860d2ff71f4c99053db82a02837ba64','ilene93',37,'pschmidt@example.org',77542274,0),(1010,'Anastasia','provident','Haag','6493242baeb7696b92dc53443e8208c901e1f491','steuber.rylee',65,'rippin.magdalena@example.com',93165157,88155067),(1011,'Sanford','est','Reinger','26faa6fdbab02b7602f022ae9a237957e5dac5b0','qveum',59,'kylie.armstrong@example.org',69363975,0),(1012,'Marge','molestias','Wiegand','7d996f5c49072a932d908a2684c8c014e117d482','sallie.gutmann',43,'obie49@example.org',79463022,0),(1013,'Leland','velit','Rogahn','93c970dce9fa4d3724a75e86fac49e66fae0dafe','olegros',45,'moore.kian@example.net',95690228,0),(1014,'Chadrick','ad','Lind','5e31d91b860713c6e05a174f16035f14077df2a6','morris81',21,'roberts.neal@example.net',79295112,0),(1015,'Lexi','atque','Gutmann','3c842b699d9c2b98ad4d5d9438781fce4a579a87','jheaney',26,'heaven78@example.net',97480612,99448837),(1016,'Emelie','dolorem','Bergnaum','dc2a2e43d6c25f9a4caa182dcc97a60ea190659d','stacy.breitenberg',37,'vschowalter@example.com',72024570,0),(1017,'Callie','qui','Auer','0cbd5038d4244b544ab9b39f146f64461f6d7aad','hilpert.zelda',36,'carmen.cartwright@example.org',85192299,72111551),(1018,'Tony','occaecati','Kunde','e707689ede4c79755053cb4e7256ba4790470576','jany.zieme',21,'oda22@example.com',98738239,90107827),(1019,'Elna','et','Barrows','3713ce1a7240f2c3871696142b5c28133a46325a','antonetta07',47,'jacobs.dewitt@example.com',83513050,75862090),(1020,'Clemens','fuga','Corwin','2ef848f084c9abdaae03f4d8400d4b56815c9eb1','rahsaan.kling',32,'pzieme@example.org',69830154,0),(1021,'Alayna','ipsum','Gulgowski','57af0c7e46fd603901fcb4831fae10242845bb93','savion.schiller',60,'francisca89@example.net',81840571,0),(1022,'Harold','dignissimos','Stark','2f9e7d8feac187a1356a9730aa14d5192de263e5','leland.gorczany',18,'tania.bauch@example.net',91832700,89250397),(1023,'Benjamin','blanditiis','Crooks','bf7195c7e80edeb6a80bb8f2bfe269223bbeaa10','mohr.israel',24,'iconn@example.com',69743080,0),(1024,'Bailee','minima','Deckow','fdac0437f45989e91cd5b07db4309bc64e0b9da1','kurt14',34,'stiedemann.emmet@example.net',78250970,72751179),(1025,'Alexanne','vero','Conn','48113b1d3518f43f22898c4b6009b971ca59ee09','abbott.nichole',38,'coleman07@example.net',77827758,86709061),(1026,'Presley','aspernatur','Robel','3b45ea7e00ef074ab1df43e0b863df7b6a9e188f','jgorczany',77,'harvey.jazmin@example.com',81488476,0),(1027,'Vanessa','ducimus','Hintz','82c630c14516dd7790ccd8941538eed3f984564f','lola67',20,'johann.bauch@example.org',95291874,0),(1028,'Sonya','sed','Bauch','5ac6f100382d72d3b92d3bf31e8ff2fb48e196e7','lavina.reichel',28,'twila.orn@example.org',73613214,0),(1029,'Afton','voluptas','Jacobi','a926fbce56c815387346898bdd551932af2d4bbe','horacio.bartoletti',58,'alisa.mraz@example.net',84522588,0),(1030,'Reymundo','optio','Rosenbaum','4574e37c919ef93dfa9fcadb7e83acc6d0da268f','xmohr',26,'streich.cydney@example.com',92722946,0),(1031,'Bertram','aut','Volkman','eebded22786ca3301575e6d25dc1a4dae78d10d4','kari17',18,'thompson.alberto@example.net',69891532,89333551),(1032,'Raymundo','omnis','Steuber','2e66a8a2285626afa3b625184c50007b219632b3','leuschke.rhianna',53,'hirthe.hailee@example.org',97483136,0),(1033,'Norma','odio','Stokes','4b9a4e67a78c5232d462d68ef044a6722c69498a','dibbert.lowell',54,'lisette.bartell@example.net',84481696,78363687),(1034,'Suzanne','qui','Schroeder','f9a4f53e7f106b5a8f33245ebcc46fd260d4b14e','mafalda14',37,'cdach@example.net',71327266,0),(1035,'Shanelle','quia','Tillman','df917c19d0c0d85216f8e22fcd0ff26060668ded','telly.turner',68,'alexis29@example.com',91025582,0),(1036,'Jason','consequatur','Schamberger','050e25e3a37268f3338260f950e329cdac455ccf','monty11',69,'graham.keeling@example.net',79947265,0),(1037,'Ida','atque','Daniel','dcff1c4bc33f13e7a593057657cbfb3c94eb643e','hilbert71',57,'alberta21@example.org',91447135,87097323),(1038,'Rowan','quod','Emard','3b962bc4961e3f5af9331ad40162d07d31249408','reuben.welch',51,'uskiles@example.org',78591530,73349259),(1039,'Oswald','asperiores','Leuschke','48f70fb0a0334d54595f01ab0566860689dd50a2','jaunita.windler',29,'emraz@example.org',71213999,0),(1040,'Lucius','adipisci','Langosh','a4bb56ced0b6d72912df22234e41ec2a027dbcb1','leonel.padberg',21,'collier.kelton@example.net',66991095,0),(1041,'Shanie','aliquid','Koch','a9a258276ba26a2e22cca3297d1c23a94b580334','jessica95',68,'hand.carlee@example.net',83286755,0),(1042,'Delia','tempore','Wilkinson','ac4822f1f80ec1c5f9625ee129e932a770f81f48','conn.emelia',46,'doberbrunner@example.net',83371195,0),(1043,'Leslie','sapiente','Feest','01c7f35ec5a63632e1c213aa8664969a552189ba','theresa39',56,'kobe.lueilwitz@example.net',74199378,98292118),(1044,'Lucius','omnis','Hansen','d5326f43be152aa5fab188a6159bae5e689f5f30','fritz.deckow',18,'miller.jerome@example.com',74929925,84331137),(1045,'Palma','sed','Abbott','6c61c2ff000f93f999b23f33b8e29a78e9aa534f','krystel.miller',51,'rubye.stokes@example.net',99999055,0),(1046,'Junius','qui','Brown','9e45bbceb8ad45907778e9cfc2650d1767bd1b97','yost.dorian',38,'braulio.mayert@example.com',79699186,74880614),(1047,'Alysa','est','Schoen','fcfba70bfc31cede1f94504a4bda3f2e4f32cb46','gtrantow',19,'cornelius11@example.net',99732119,0),(1048,'Danielle','harum','Bartoletti','84c715f8898e3ece4320fb94fec1180ecde9f76d','arodriguez',56,'griffin.lehner@example.com',86895137,0),(1049,'Crystal','dolores','Williamson','c5d0acd79635bc46fc2c601f938f6eb9cbe4d83f','nstark',74,'fankunding@example.org',85442860,0),(1050,'Leopold','repellendus','Hayes','e9c333c2e26896a582272f57fda5aaa61208c7ae','helga.spencer',45,'zkuhlman@example.org',92248693,0),(1051,'Loren','sunt','Schowalter','3395a1648fab6548ef58b4ef902b020da1f826c9','shyanne56',70,'ziemann.patricia@example.org',71850462,0),(1052,'Henri','expedita','Oberbrunner','5b2fb9518428fe18cc1c77bf2d18c11ba7ce62ac','etoy',25,'reynolds.greyson@example.com',91942345,0),(1053,'Lesly','voluptatum','Kovacek','dd4529a1b12ca3c1f6cb8b4b6721b898f8c39251','hhaag',54,'nbrown@example.org',76467849,92029703),(1054,'Garrett','dolore','Vandervort','17c41c2f246e7405f0109a95964a5378ffe2f14f','fletcher.boehm',65,'hazel.cronin@example.org',85506791,75969661),(1055,'Shad','nisi','Goyette','7a6a824714b9f2dd8ca05a31a9ebda722ef37653','pfeest',64,'caleb.stehr@example.org',74223674,87707754),(1056,'Mattie','aut','Bogan','479045f1cb395d49c991e593fb225032435ae4d9','ressie28',61,'jaskolski.sven@example.net',91256829,0),(1057,'Aric','consequatur','Hoeger','fd736fb66230acf78bd625c5a457d7d3770a0800','lawrence59',73,'ronaldo.smith@example.com',94434840,0),(1058,'Ariel','voluptatem','Batz','aa2d815bc589162c3c14ce94d27283120e58d1b5','abigayle.hansen',32,'rodriguez.wilma@example.com',71228816,71150769),(1059,'Leonor','inventore','Jacobs','569ae2775120a01fff22b4a2c8867c4eac4c6b4b','jerod.considine',27,'hgusikowski@example.org',95111472,0),(1060,'Jerod','autem','Considine','1b237093d679f99ca308e812571bb8200d13a6f9','hackett.lilyan',35,'jaylin43@example.net',97663666,0),(1061,'Maudie','similique','Ratke','eb8fe1d4bbf16546103bcf7da28e66e0917dc683','helena.stracke',26,'davin16@example.net',69264849,0),(1062,'Maia','iure','Hermiston','b6d10d5efa649fff54a3b8718f04889e14597917','kailyn35',18,'maximo86@example.org',98810018,83248975),(1063,'Ocie','fugit','Jast','1920cc5fe3b4fd6bb26f74f2873300520b0011c2','gunner.legros',50,'tmurazik@example.org',68129592,96136783),(1064,'Maurine','nulla','Cartwright','e59ba4c27ecda52b8d3ebfdf4c1170be58595b48','darwin.hilpert',31,'aurelio.schowalter@example.net',99670952,71080685),(1065,'Rosanna','mollitia','Koss','b09ea9b792597e11a2ff38a8407b16813e4d4e91','marcelina.mayer',20,'alberta.howe@example.net',98792777,76297095),(1066,'Cody','eos','Wolff','6ef3b48f9a724ef52e1f679f3dccb445a18853e9','lind.noble',37,'cjones@example.com',98708752,88223370),(1067,'Abraham','omnis','Ullrich','cbb5901b8811a9e6837d0af7d843029517446011','wintheiser.isabel',36,'littel.ena@example.com',79472214,73611982),(1068,'Keira','ut','Marvin','e0f9ac17a4054ba6bf5c7320b46d77ec2d3b7828','burnice14',24,'kirsten.lynch@example.net',82440958,0),(1069,'Bessie','ut','Keeling','405a4bf34e1ef34dd7c61434c26719a834e39aa7','gusikowski.levi',56,'jalyn02@example.net',81385687,0),(1070,'Clement','asperiores','Wiza','1f27a8cc72c03c17aee99f5cffff59cccf09088f','george90',25,'ivonrueden@example.com',92428506,0),(1071,'Elissa','qui','Oberbrunner','0384ca130ec1ef54903e1d1be52f215370dc8944','mkunze',69,'kaitlyn33@example.net',69388715,0),(1072,'Heidi','earum','Haley','1dab326151c1d9c059c9ecbb438604a0e0602fa1','sibyl05',77,'huel.elody@example.net',98463097,91091729),(1073,'Sam','qui','Hodkiewicz','d242b0889174241292237e83008c5261d707f515','dennis.jerde',56,'judy.hilll@example.org',98607057,70477198),(1074,'Camilla','cum','Rohan','986e13d4e9a980791d9596e282574a2db68957c1','bconn',19,'dach.nikolas@example.org',93645959,0),(1075,'Pablo','quaerat','Kassulke','637db4deeb94917e75361443938ddcb9266e5eca','pagac.gladys',71,'gaylord.tyree@example.com',87068571,0),(1076,'Hester','quos','Pagac','ff1038ad2e1eb1d77f2e6d5e063c14c535ee6890','marjory61',55,'spencer66@example.net',79174045,0),(1077,'Nichole','fuga','Schmeler','04351aa4fdafc76b6b61ebf289b5d1bac26b2215','lbednar',70,'leffler.nyasia@example.com',96326926,75625690),(1078,'Jaiden','odit','Casper','196da87f13e97185ef7eed3fafc3d42926a64d66','zboncak.alice',22,'schumm.zakary@example.org',67575149,68631205),(1079,'Adan','quod','Wilkinson','d258df332c21c7f7dbc7ce6f501ca4a5db533c4e','schamberger.mable',60,'zwelch@example.com',71453979,76011198),(1080,'Patrick','eos','Becker','f0915237a5776289c3e7fccbd2dee1363a538c41','kertzmann.virgie',25,'annetta.smitham@example.org',99247896,87991304),(1081,'Veda','corrupti','Kuhic','14f5b377363f317853467e636f838386d2d8e8be','klocko.jaron',43,'cassidy21@example.com',77094786,0),(1082,'Tyshawn','voluptatem','Homenick','9c64a87d09e55ecfd1ae8babc278f77b5d73060c','hiram58',76,'ernser.paris@example.org',94712475,97473091),(1083,'Alana','hic','Weber','ff300d77965291e0d1ece283aa3d1fde60124c18','quincy99',71,'pfeffer.gabe@example.com',80825385,78094575),(1084,'Nannie','et','Huels','18fb4e32b040c2c7bdf85d2bd04b994fd9b9535d','anita.langosh',32,'linda.nitzsche@example.com',80286965,95632284),(1085,'Rod','fuga','Dicki','5ff6fde18a99eed2054168c8a3736ae49eb8e6cc','pfannerstill.jacques',46,'veum.cassandra@example.org',98133520,80878213),(1086,'Marshall','ratione','Witting','8eed37fe56a7e4baa65d641afb828633fb86c7fa','vprosacco',56,'tsimonis@example.com',90778982,0),(1087,'Candace','qui','Dare','44a057d45e6f5d94631defeb5ea8c3bd7125ab4f','jessie.mayert',66,'zakary94@example.net',72447542,0),(1088,'Berry','autem','Kuphal','a68f3706ad495dee2e51e86c6082125a15b62624','ulueilwitz',51,'rzboncak@example.com',84756530,96040018),(1089,'Keeley','reprehenderit','Wisoky','137116ad1559ea6140ca5cbc3c3bbafde3197e68','bartoletti.conor',18,'nsauer@example.org',92965295,0),(1090,'Karianne','error','Johns','574b353a007fc6eb063b8e7a3617c3f76aca8c7a','slesch',48,'al.kub@example.com',90177413,0),(1091,'Ellis','culpa','Armstrong','7f8ff619d05ed99a6870ec45f3278dd785af129a','samantha83',57,'kautzer.octavia@example.net',87404952,0),(1092,'Nathen','a','Hartmann','de588454097a06cb2d068693718bdde1cca4ff9d','milo68',61,'ward19@example.org',78571024,85262273),(1093,'Lamar','occaecati','Rau','dfa7cf96c672ddf28ae119559afceb41a590550d','fdickens',67,'haylee.stamm@example.com',70364863,0),(1094,'Ambrose','dolorem','Pfeffer','2329724f0a1fbf4e3d3a505b9e9b012a127860f4','jevon64',29,'zlang@example.org',74820668,98365585),(1095,'Joelle','debitis','Rohan','fda359869d6ada69217b96f6c1e6d18f89fcab75','dschuster',39,'qmedhurst@example.org',96322274,74978666),(1096,'Timmy','dignissimos','Koss','820382d5ffea19fbcd1a8fe511c16089d0d796b9','ghyatt',20,'odessa24@example.net',70320295,67050736),(1097,'Jade','fugit','Nienow','629eb26f7626a63fe728003dea8119badfe0a5bc','nikko19',22,'josh.balistreri@example.org',95255942,67627963),(1098,'Reginald','amet','Blanda','4fa42e722b8772c91c0fd06b3490d304dccf5cfc','pierce.nikolaus',45,'qmoore@example.net',72240634,0),(1099,'Harry','est','Reynolds','236cda32599d29f1645d4a0fdd90fb50b2771b1e','donnell78',51,'carissa.lockman@example.org',71353516,0),(1100,'Fanny','mollitia','Schamberger','a777e8f56ea654c871947a75a726c1137487dbe8','rashad.windler',75,'bschuppe@example.org',99367068,69701169),(1101,'Emerald','illum','Nitzsche','b17eecd1e111696445ef5cea930359e26bb8a40c','farrell.abdul',61,'clementina65@example.org',82375954,0),(1102,'Sylvester','in','Gleason','671a1cb84d4b041ea87981d002c2d88de10e7355','sporer.loren',60,'o\'connell.roma@example.com',92954984,75509732),(1103,'Lempi','omnis','Kemmer','bf1f569f54003bbd49e9eb0d5b2cb702a0618204','rachel03',32,'jessie.bartoletti@example.com',69565608,72349057),(1104,'Pamela','qui','Grant','cd493dcee59aa1256e597f78d8a4264710b52a29','gdooley',77,'rachelle.windler@example.com',74760901,0),(1105,'Florida','perferendis','Kub','a05289b35da42b6a93e239dedd46011db51f7bdf','dianna99',76,'percival.zulauf@example.org',76592336,0),(1107,'Whitney','non','Cartwright','14883a224299660ba118b77cae6eddf2b9dfa1d4','emiliano49',49,'keegan39@example.net',87315468,86987599),(1108,'Maria','quis','Lemke','f519a2f6c63834b0ea737437d327c3027bb7470d','paige44',60,'guillermo60@example.org',74801483,95950391),(1109,'Cecilia','repellat','Beatty','5fdc853084fe02b386d9e8ba134fa6e69b581516','edwina.mckenzie',21,'lisa77@example.com',73473204,97906984),(1110,'NONAME',NULL,NULL,'[l, o, l, 1, 2, 1]','lol121',NULL,'parv121',813278766,NULL),(1111,'Enter',NULL,NULL,'[l, o, l, 1, 2, 1, 1]','lol1211',NULL,'lol1211',93391103,NULL),(1115,'saumya',NULL,NULL,'[l, o, l]','lol1212',NULL,'lol1212',98183929,NULL),(1118,'NewF','NewM','NewL','parv2','parv3',18,'iiitd@',121,1212),(1119,'f','m','l','p','p',20,'p',1,2);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `person_age` BEFORE INSERT ON `customer` FOR EACH ROW IF NEW.age > 120 or NEW.age <8 THEN
SIGNAL SQLSTATE '50001' SET MESSAGE_TEXT = 'Please enter valid age';
END IF */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `walletMaker` AFTER INSERT ON `customer` FOR EACH ROW Insert into wallet set money = '500', id = NEW.id */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `userHistorty` AFTER DELETE ON `customer` FOR EACH ROW Insert into user_history set action = 'DELETED', customerId = OLD.id, name = OLD.firstName,username = OLD.username, changedate =NOW() */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `driver`
--

DROP TABLE IF EXISTS `driver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `driver` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastName` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phoneNumber` int NOT NULL,
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `RC` int NOT NULL,
  `DLNumber` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Not active',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `balance` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `phoneNumber` (`phoneNumber`),
  UNIQUE KEY `RC` (`RC`),
  UNIQUE KEY `DLNumber` (`DLNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=212 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver`
--

LOCK TABLES `driver` WRITE;
/*!40000 ALTER TABLE `driver` DISABLE KEYS */;
INSERT INTO `driver` VALUES (100,'Diego','Brown',73505610,'de74e374ae48ebf40310c99feb0aa1901b34339e',1060,'6606','notActive','allan.casper@example.com',1898),(101,'Jadyn','Hayes',79050244,'9c56d8e686517f4b2602ef0ea7a5ddae399f368b',1039,'3027','notActive','emory56@example.net',3082),(102,'Easter','Maggio',90398090,'3ce70184d2ef0f450f3393271d1df9c17348974d',1059,'2107','notActive','goyette.derrick@example.org',3691),(103,'Marjory','Fritsch',86344919,'61d6221f1fa1078492dbfa5259370bcc16bbb4b7',1077,'4710','notActive','katheryn.labadie@example.com',3903),(104,'Gabriel','Carroll',87717950,'d066e0574addc7758eb13547857f6a252b835152',1047,'4135','notActive','francisca85@example.net',1577),(105,'Gunnar','McCullough',86973009,'82b1180b75a1b1800d2537ff5f60bb593f367f3b',1030,'4485','busy','dbradtke@example.org',3223),(106,'Vivian','Yost',75078548,'494f2b26cc840b5a1ebb5307e82519c54d5a0b0c',1029,'2196','busy','marshall56@example.com',664),(107,'Bell','Dietrich',98365667,'be97ffd434467f33c9b550eea70725ba32748669',1057,'6614','notActive','pouros.jamel@example.com',2692),(108,'Sarai','Becker',67564620,'0a21dae3ce1786e05722008d34a788d0db952eed',1026,'4498','active','barton.jaylen@example.org',3554),(109,'Elroy','Runolfsson',82708981,'71a10bd6847623b1ea49fe23f13a529953c6f7a3',1111,'6647','active','burdette87@example.net',2087),(110,'Marietta','Zulauf',74748907,'fe534b6c5da738c2c3782dfb626cdf70fa74f098',1108,'5229','notActive','antonetta12@example.com',3875),(111,'Alexandrine','Gusikowski',85547242,'909ae6b05835679bc9205234f5e03b715e901601',1001,'4233','active','harvey47@example.net',2940),(112,'Ted','Funk',80882344,'8b5419a4337733acee2b4b85dc7c73506073c6d5',1063,'3850','active','jasper.hackett@example.com',905),(113,'Lorine','Runolfsson',95522264,'97d8740db7cb5f6895686e85979df8ac2adfb714',1098,'3517','notActive','bahringer.antonina@example.net',723),(114,'Darrick','Wolf',78155061,'945ddb2fb5bbdfc8a9cb4861f5270f903a2009a5',1088,'5055','active','bechtelar.gordon@example.net',1254),(115,'Judson','Greenholt',90197149,'9656459e4a9230205e4adde583be9a233367fbe5',1069,'4167','busy','israel12@example.net',3212),(116,'Litzy','Goodwin',96858405,'7006a31719453139709de110633d39339b832b57',1072,'4291','active','lhickle@example.net',2495),(117,'Alayna','Padberg',80373310,'5accd42eb15bc23bf295d31bed05fb6bcb51417f',1016,'3722','active','hagenes.loyal@example.net',905),(118,'Lolita','Farrell',85005747,'f8685e938b39c7fa3feb92470ce136240d8654ec',1053,'6313','active','kelsi.block@example.org',1208),(119,'Cornelius','Crooks',81742228,'daf15f6eb41cf0cfd8c7bd31aa646ad047324593',1078,'3887','notActive','erwin.morissette@example.net',1416),(120,'Daryl','Abernathy',73850040,'a267e9c53f0d6019db02b8632f09a948719e203f',1040,'3044','active','hzieme@example.com',542),(121,'Easton','Rempel',99347333,'ca67466646594c171562acb1d64437394272479c',1126,'5750','notActive','arianna.mertz@example.org',1496),(122,'Aryanna','Welch',98760180,'ba6b89753e21d9cde297fe912510df42a464c8be',1076,'3952','active','brau@example.com',644),(123,'Scarlett','Jakubowski',73126336,'c09909c7aa256726a0a60dd7febaa2b91458f7a8',1002,'5790','notActive','amani30@example.net',632),(124,'German','Wolff',81190617,'e61665e9628ef44385fdb56317fc241a7bed9b7c',1097,'3731','active','laury49@example.org',1686),(125,'Nikki','Huels',70127141,'fc5ee55451a945a97b79a12ec71617a1bae73fc9',1041,'2951','notActive','hintz.marlee@example.org',2216),(126,'Emie','Wolf',78236132,'e421a1994a19975571190477656ee946cd82139c',1049,'4921','active','steve38@example.com',2287),(127,'Edythe','Murazik',73347127,'174377b15a1419eb238e93a21febb87719524fa5',1074,'4054','active','moore.angelo@example.org',3411),(128,'Johanna','Keebler',97001494,'ae33bb60de6d47f4246132078e19eef78516f308',1128,'2436','notActive','sawayn.doyle@example.net',1564),(129,'Destini','Powlowski',98963596,'6fc1e9738d452e0abb09c1e2145b2f871f0733ae',1106,'6388','notActive','remard@example.net',2586),(130,'Cleo','Kautzer',69007369,'050266ac0640660958ffb79de7c975059d438641',1050,'3889','notActive','mgleason@example.com',1156),(131,'Cyrus','Morar',78021750,'ffc5dcddd304fdca30d8cc6f756e8a0c977a3511',1095,'3827','active','marta14@example.com',1786),(132,'Deanna','Heidenreich',82108338,'03db19f4c084c63e782ba8aee7e69e412ffa1037',1101,'4107','active','kara61@example.net',1893),(133,'Denis','Wiegand',83985832,'05d901d20e0f514a14fcbfad8a7287e5970a9a74',1015,'2785','active','beulah.hartmann@example.com',3112),(134,'Albina','Romaguera',81880103,'12fb0b89f7d861619e6bd6b7a87516455f9532df',1084,'5001','active','lesch.susanna@example.org',3471),(135,'Concepcion','Tillman',91818714,'4b226b003db939c0eba15b5bc7bda5b2c3944800',1085,'4738','active','armstrong.alfonzo@example.org',3480),(136,'Letitia','Eichmann',97377160,'c524a6acd84f3a7d84980ce84aed6e137c917bf9',1064,'3421','notActive','ike.kertzmann@example.net',2398),(137,'Elmore','McDermott',82352134,'bd15443f8f26aeb3326720379bc7f4b06d46370c',1080,'3701','notActive','edwina.murazik@example.org',881),(138,'Savanah','Reichert',96482637,'aa0beb542a62a7b1f7007b2353ed792d1bf91828',1012,'2451','active','rita85@example.com',790),(139,'Nina','Harber',97969438,'a28b2f7ff8c646f6740efee797dabb3637514d4d',1125,'6205','active','evelyn56@example.com',4052),(140,'Emely','Buckridge',91408656,'9bdfa02d50e37e35e688b6002750fc90b6c2da07',1118,'3187','active','ekunze@example.com',2058),(141,'Rhoda','Predovic',71554985,'0db7257172e088d3ce3722ab671c872728d094d0',1013,'5778','active','arvel52@example.com',3724),(142,'Jorge','Roberts',72710904,'9e091ee45ed39b7d393e2003ec8ecbe7d91dfad0',1006,'3540','active','qauer@example.net',2125),(143,'Melody','Gulgowski',67149351,'1e519b488f6b2d42218f4befb0205d6401582251',1102,'2048','notActive','vkuvalis@example.net',2255),(144,'Wyatt','Olson',88470435,'0f758da8a1d3bd263493e8f3fab4af4a2680f83e',1099,'3531','active','ofisher@example.org',749),(145,'Shakira','Zieme',93116272,'af023e28ef7361e6e6940b83bb1008b2800b0d9d',1021,'2594','active','vschuppe@example.org',1427),(146,'Kody','Buckridge',89610526,'8cf7c399991e1fa2513c7bade51a2963ad24fc85',1103,'3962','notActive','tkoepp@example.com',3494),(147,'Bernardo','Volkman',91941900,'caccd0e976031c1dd112b51fbb667d9ea90136bb',1052,'3844','active','fmills@example.org',2323),(148,'Sammy','Langosh',77592473,'543a570b61141525b7b7447bbe527d368af98ab8',1032,'6876','active','xzavier.douglas@example.com',2332),(149,'Ocie','Wehner',81341182,'8db2f90b9ebdc17dc734564ff4275250d91b6f31',1109,'3432','notActive','lorine21@example.com',1081),(150,'Alda','O\'Kon',91224369,'ea45925b9cccb5011fbc76a50e3acf2b7c86fcc8',1022,'2089','notActive','mabelle.stark@example.com',2760),(151,'Esta','Schumm',70264914,'2674d1003972d81b83b484ff0bcdaea23f8cad28',1075,'5921','active','prudence54@example.net',3103),(152,'Cloyd','Lockman',87993396,'a35bc9ad247728ba3be8dba37afd472a2084361f',1079,'2411','active','elissa33@example.net',3604),(153,'Danial','Prohaska',97048476,'e100dca0ddfcf28202152195f1967506cc2fcb47',1115,'2898','active','andres.jakubowski@example.net',3726),(154,'Taurean','Rippin',94815223,'2c9c2259fc2b7719ce27e3acedd6772291a3ded3',1024,'4229','notActive','qfeeney@example.org',3341),(155,'Matilde','Kiehn',89115942,'f7f40898a96ca5903596a04522ba5ffb17d9fedc',1071,'3250','active','wolf.raquel@example.org',4152),(156,'Milo','Bergnaum',74311646,'ab2ce5490cd8270880d9435982b52444b517d3ef',1123,'3249','active','okey53@example.org',4115),(157,'Amos','Runolfsdottir',83561105,'b1c17289db8e1d56bdd48e1afc5221585a30bb0a',1093,'2561','active','evert.dietrich@example.org',4054),(158,'Michele','Kessler',94710861,'ce725fd1957dcb7bd662d6f386b368d15b144dec',1048,'4022','active','devante.koch@example.org',1754),(159,'Everett','Keebler',91469731,'4f49ce4a34b3b290959182ebe61ef77fd358c21d',1073,'5739','notActive','jamar.wyman@example.net',1619),(160,'Hassan','Spinka',94497799,'e35d33766d90ee502cedf3af76e7a1ac38df10fb',1020,'4163','notActive','zshields@example.com',3237),(161,'Earl','Wolf',73126270,'1c7066cd9bef80a7c600166e144676772b9e00ec',1031,'5881','notActive','shana.torp@example.com',1028),(162,'Dejah','Halvorson',81360879,'aba52fa0cbf9069c306912a2fff17bd54b701f42',1054,'2167','active','hertha28@example.net',2593),(163,'Donald','Keeling',80298474,'cd02fef23b0fa2f968bb2cb162b43cab8bdcbc72',1082,'4860','active','kuphal.allison@example.net',1856),(164,'Rick','Stark',94518504,'e438cb35844e3e37034c8588dce4b1a7a85648b8',1010,'2747','notActive','emmalee97@example.com',1884),(165,'Rose','Kessler',95229081,'d4124ee84efd1dbf7a313509976af81cf7880603',1035,'2911','active','catalina.gerlach@example.com',4142),(166,'Eleanora','Huel',73675794,'ef40ef70455e30c39792591df500dd218b457f2b',1009,'3556','notActive','kariane53@example.net',626),(167,'Lavon','O\'Keefe',80957714,'bc2af137dca226f49eb0496a259d4e443d04f4e9',1083,'3685','notActive','chanelle13@example.org',2170),(168,'Summer','Mosciski',93474541,'55814d11628c195865f4568ec680d0a1d4f7e623',1067,'2265','active','tconroy@example.com',3178),(169,'Rebecca','Rodriguez',70532339,'9645498c11957303d05e27f20ad765725136e79c',1043,'5875','active','mbechtelar@example.com',636),(170,'Muhammad','Weimann',70724068,'3d05180f58dbd56a2611302b1f73628571c624b4',1003,'4564','notActive','dturcotte@example.net',3456),(171,'Beatrice','Schuster',71836664,'7cfa0b543420b789a8a4bcbada65d68e32260e26',1112,'5572','notActive','zromaguera@example.org',1542),(172,'Zoe','Huels',98557143,'3e8420acb842b1e9209c830e2578118fa3b0dd56',1120,'3083','active','witting.abdullah@example.net',3680),(173,'Joanne','Runte',76447455,'b6ee31a818d37af41e5d2577d73a5fdfb2806a4f',1051,'6847','notActive','nkub@example.org',2220),(174,'Deven','Carter',86588039,'9eaf41155b5320acda74d5bdd6068691679fbb2e',1037,'3122','active','spinka.mara@example.org',4152),(175,'Aidan','Haley',95639727,'689b3d2f9aa5360a04a238db0138a6eb93e09200',1114,'2162','active','kamren03@example.org',2970),(176,'Norval','Beahan',72474770,'6ad5601f879917c11862086c9bb65f380b70ee79',1081,'4117','active','tania68@example.com',1709),(177,'Austyn','Wisoky',68381586,'caa6dd16ee3ea1a97b250df68030fa73f41c0cd0',1096,'3650','notActive','tprohaska@example.net',4058),(178,'Easton','Hansen',93396505,'c0139ded70a7f3478d9114b3bc6b4480a1aa548e',1011,'5846','notActive','jhermann@example.org',2120),(179,'Ariane','Kirlin',70299777,'5e766d1eec8762e4c357cb8d59d3473591ac0156',1105,'2028','notActive','hettinger.rick@example.net',4304),(180,'Roslyn','Bechtelar',92102638,'26b9b5d7280554e65e26337975bad55f476ddd66',1025,'2094','active','obartoletti@example.com',2205),(181,'Charley','Kuhic',95402057,'d01d6803bbc3b03285f3d23000870e83428f0eb2',1092,'5097','notActive','ucorwin@example.org',1138),(182,'Sophia','Runte',82232686,'d68b4eb9409c76e1c8770391850b0468c7bf9e8e',1086,'6115','notActive','scotty17@example.com',548),(183,'Blaise','Baumbach',86672519,'ade256c7b2347e6b7eca967b8201fd59b25e42c9',1130,'3078','active','gleason.bella@example.net',1924),(184,'Cade','Hoeger',80594744,'7693d84ce95623bd8f3c698064a8d31f9946850e',1023,'2398','active','terry.wilfredo@example.net',1326),(185,'Mabelle','Friesen',81112327,'34a7d743096beec5af33678259bad21f26338817',1055,'4071','active','joesph.walker@example.com',1495),(186,'Jared','Baumbach',83332253,'a18f4026d638ef1b03d4b557f9bea96eb5099221',1068,'4086','notActive','stevie.hessel@example.org',1404),(187,'Teresa','Tremblay',76605953,'44a201efd4576f20b3ac6677dbb5f9dbe6e33d36',1124,'4310','active','alverta99@example.com',3733),(188,'Furman','Oberbrunner',91369945,'1b3a8373668e51809e2be27a2d52705f19209acb',1027,'5359','active','nettie57@example.net',4091),(189,'Roderick','Schaefer',81560168,'5a2d59e987c9165a6053bfbf65db0a235433ae1e',1066,'4263','active','cruickshank.lexi@example.org',1442),(190,'Janessa','Hoppe',92285493,'24474f03f35365d0805c4ce29f4af823b2305ea5',1046,'6971','active','gibson.hadley@example.com',3465),(191,'Rene','Fahey',71373686,'50d8ccbb1497081ad781e74401b384506255025c',1119,'2080','active','concepcion87@example.net',3166),(192,'Graciela','Rath',81214368,'476a059f3825d5b2ed3748bf0bc66ec9d537ac2f',1044,'6148','active','merl.kuhic@example.net',3919),(193,'Ona','Kulas',97896457,'d91456a94a56afecbfa1461bcb8a6b5937f0c425',1017,'2906','active','rveum@example.net',1113),(194,'Twila','Tromp',91250115,'1956a6de2286a5dffd9898ffa5875e4c387474fe',1036,'5403','active','heller.garrison@example.com',3938),(195,'Cecilia','Stark',95559122,'8286273ea3fb4ce0304700548ee1766f9bdb3313',1113,'5057','notActive','eudora91@example.org',1936),(196,'Modesto','Willms',74605748,'3905a683a3f16a4be7152d050a76eb3507e6e25f',1034,'3733','notActive','verda30@example.org',1715),(197,'Ferne','Kuhlman',92258925,'a9fb3cf880621e92987e11885a45eb35ba3b2bbc',1117,'4008','notActive','vschmitt@example.net',3374),(198,'Priscilla','McCullough',92169645,'88baf8a5ed9b0feecf8af2f204a34999e5d71093',1028,'3483','active','remington75@example.net',2373),(199,'Ashly','Ebert',76868301,'b80ef445bc6fda4bef9c1c1eaec72120db723656',1038,'3526','active','franecki.christian@example.org',948),(200,'Tabitha','Nikolaus',96200741,'7f6a786949cc3e69dd3938c063d90cac15646c5f',1065,'5543','notActive','catharine69@example.org',4260),(201,'Elda','Price',85066491,'3ba79bd66e689725d87010afabf2ba2b50dea452',1061,'3304','notActive','zluettgen@example.org',2705),(202,'Josephine','Corwin',72622658,'85b3b319760604ef548c15a2ecff3fea02948c5d',1005,'2343','notActive','ollie.rutherford@example.net',3039),(203,'Fernando','Halvorson',78020142,'319da0a40a9a6a2936bfbe4acc69f490dc48b01f',1127,'3838','notActive','pcartwright@example.org',1395),(204,'Raheem','Kuhic',71594549,'2a5491b1fdfb71cc2e7a5431af627f9f86794902',1090,'5560','active','frami.clare@example.net',1881),(205,'Jarred','Kihn',67632251,'c9d43e0e276f85c0e97a5eeaf4778977379766d5',1018,'2645','notActive','nina08@example.net',2609),(206,'Salma','Carter',73251067,'89591eb41e3f6cf57fa1dbf48b81cd137637fd2c',1008,'2977','active','sammy.sanford@example.com',1050),(207,'Weston','Dickinson',70996349,'28b95557d9bbef156b33b6653eb2e8cf886d8ae1',1007,'2965','notActive','kathryn.stoltenberg@example.net',3377),(208,'Mikel','McLaughlin',1,'1',1033,'3036','active','metz.kaylie@example.net',1940),(211,'new','new',121,'parveen',2023,'2023','active','myemail',0);
/*!40000 ALTER TABLE `driver` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `driverUpdateHistory` BEFORE UPDATE ON `driver` FOR EACH ROW Insert into driver_history set DriverDL = OLD.DLNumber, name = OLD.lastname, oldRC = OLD.RC, changedate =NOW() */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `driver_history`
--

DROP TABLE IF EXISTS `driver_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `driver_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `DriverDL` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `oldRC` int NOT NULL,
  `changedate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver_history`
--

LOCK TABLES `driver_history` WRITE;
/*!40000 ALTER TABLE `driver_history` DISABLE KEYS */;
INSERT INTO `driver_history` VALUES (1,'4485','McCullough',1030,'2023-03-25 11:20:10'),(2,'2196','Yost',1029,'2023-03-25 11:28:27'),(3,'4498','Becker',1026,'2023-03-25 11:33:17'),(4,'6647','Runolfsson',1111,'2023-03-25 11:43:09'),(5,'2023','new',2023,'2023-04-20 09:26:41'),(6,'2023','new',2023,'2023-04-20 09:26:59'),(7,'4167','Greenholt',1069,'2023-04-20 10:10:31'),(8,'3952','Welch',1076,'2023-04-20 11:07:46'),(9,'3952','Welch',1076,'2023-04-20 11:13:57'),(10,'3850','Funk',1063,'2023-04-20 11:22:29'),(11,'3850','Funk',1063,'2023-04-20 11:43:20'),(12,'6647','Runolfsson',1111,'2023-04-20 17:36:08'),(13,'4498','Becker',1026,'2023-04-20 17:39:48'),(14,'4233','Gusikowski',1001,'2023-04-20 17:40:25'),(15,'4233','Gusikowski',1001,'2023-04-20 17:41:13'),(16,'4233','Gusikowski',1001,'2023-04-20 17:41:52'),(17,'4233','Gusikowski',1001,'2023-04-20 17:46:06'),(18,'4233','Gusikowski',1001,'2023-04-20 17:49:41'),(19,'4233','Gusikowski',1001,'2023-04-20 17:51:20'),(20,'3036','McLaughlin',1033,'2023-04-20 18:00:11'),(21,'3036','McLaughlin',1033,'2023-04-20 18:00:20'),(22,'6647','Runolfsson',1111,'2023-04-21 07:54:55'),(23,'6647','Runolfsson',1111,'2023-04-21 07:55:22');
/*!40000 ALTER TABLE `driver_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `id` int NOT NULL,
  `type` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` int NOT NULL,
  `couponId` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `couponId` (`couponId`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`id`) REFERENCES `trip` (`paymentId`) ON DELETE CASCADE,
  CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`couponId`) REFERENCES `coupon` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,'online','success',6417,NULL),(2,'cash','success',4994,NULL),(3,'online','failed',6242,NULL),(4,'online','failed',974,NULL),(5,'online','success',4147,NULL),(6,'cash','success',5039,NULL),(7,'online','success',4019,NULL),(8,'online','failed',6904,NULL),(9,'online','success',500,NULL),(10,'cash','failed',3129,NULL),(11,'online','failed',4543,NULL),(12,'online','success',4607,NULL),(13,'cash','failed',3195,NULL),(14,'cash','failed',2581,NULL),(15,'cash','failed',6988,NULL),(16,'cash','failed',1985,NULL),(17,'cash','success',6118,NULL),(18,'cash','success',727,NULL),(19,'cash','failed',1937,NULL),(20,'online','success',3387,NULL),(21,'cash','failed',1341,NULL),(22,'online','failed',4274,NULL),(23,'online','success',6159,NULL),(24,'cash','success',5461,NULL),(25,'cash','failed',644,NULL),(26,'cash','failed',6985,NULL),(27,'online','success',660,NULL),(28,'cash','failed',5763,NULL),(29,'online','success',6493,NULL),(30,'online','success',6906,NULL),(31,'online','failed',1243,NULL),(32,'cash','success',4965,NULL),(33,'online','success',4867,NULL),(34,'online','failed',2218,NULL),(35,'online','failed',5113,NULL),(36,'online','failed',2975,NULL),(37,'online','success',647,NULL),(38,'cash','success',3664,NULL),(39,'cash','success',1097,NULL),(40,'online','success',1575,NULL),(41,'cash','failed',4583,NULL),(42,'cash','success',1383,NULL),(43,'online','failed',6482,NULL),(44,'cash','failed',4650,NULL),(45,'online','failed',2452,NULL),(46,'cash','failed',4466,NULL),(47,'online','failed',4442,NULL),(48,'cash','failed',1641,NULL),(49,'cash','success',4418,NULL),(50,'online','success',255,NULL),(51,'online','success',4491,NULL),(52,'online','failed',1805,NULL),(53,'cash','failed',3875,NULL),(54,'cash','failed',4214,NULL),(55,'cash','failed',4427,NULL),(56,'cash','success',5308,NULL),(57,'cash','success',6014,NULL),(58,'cash','failed',6153,NULL),(59,'cash','failed',6847,NULL),(60,'online','failed',2982,NULL),(61,'online','failed',1969,NULL),(62,'online','success',3954,NULL),(63,'online','failed',3456,NULL),(64,'cash','failed',6285,NULL),(65,'cash','success',5682,NULL),(66,'online','failed',5385,NULL),(67,'online','success',1470,NULL),(68,'cash','failed',1234,NULL),(69,'cash','failed',4817,NULL),(70,'cash','success',2413,NULL),(71,'cash','failed',5494,NULL),(72,'online','failed',504,NULL),(73,'online','failed',3504,NULL),(74,'online','failed',5170,NULL),(75,'online','failed',5377,NULL),(76,'online','failed',6722,NULL),(77,'cash','success',4541,NULL),(78,'online','failed',6418,NULL),(79,'online','success',1426,NULL),(80,'online','success',6033,NULL),(81,'online','success',3396,NULL),(82,'online','failed',4276,NULL),(83,'online','failed',499,NULL),(84,'cash','success',3033,NULL),(85,'cash','failed',5313,NULL),(86,'cash','failed',874,NULL),(87,'cash','failed',991,NULL),(88,'cash','success',5736,NULL),(89,'cash','failed',5353,NULL),(90,'cash','success',1992,NULL),(91,'cash','success',857,NULL),(92,'cash','success',4536,NULL),(93,'cash','failed',2487,NULL),(94,'online','failed',3332,NULL),(95,'cash','failed',3185,NULL),(96,'cash','failed',4226,NULL),(97,'cash','success',4435,NULL),(98,'cash','failed',6386,NULL),(99,'online','failed',1081,NULL),(100,'cash','success',3557,NULL),(101,'cash','Success',1200,NULL),(102,'online','Success',500,NULL),(103,'cash','Success',-500,NULL),(104,'cash','Success',-1000,NULL),(105,'cash','Success',980,NULL);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report` (
  `bookingId` int NOT NULL,
  `issue` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  KEY `bookingId` (`bookingId`),
  CONSTRAINT `report_ibfk_1` FOREIGN KEY (`bookingId`) REFERENCES `booking` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report`
--

LOCK TABLES `report` WRITE;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
INSERT INTO `report` VALUES (10005,'rude driver'),(10007,'cab was dirty'),(10158,'Report Any Issue'),(10160,'Report Any Issue'),(10160,'Report Any Issue'),(10163,'Report Any Issue');
/*!40000 ALTER TABLE `report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trip`
--

DROP TABLE IF EXISTS `trip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trip` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bookingId` int NOT NULL,
  `endTime` datetime DEFAULT NULL,
  `completion` int DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paymentId` int DEFAULT NULL,
  `tripRating` int DEFAULT NULL,
  `netDistance` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `paymentId` (`paymentId`),
  KEY `bookingId` (`bookingId`),
  CONSTRAINT `trip_ibfk_1` FOREIGN KEY (`bookingId`) REFERENCES `booking` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=212 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trip`
--

LOCK TABLES `trip` WRITE;
/*!40000 ALTER TABLE `trip` DISABLE KEYS */;
INSERT INTO `trip` VALUES (1,10015,'2024-01-01 11:45:00',3,'success',62,1,175),(2,10106,'2024-01-01 11:00:00',1,'aborted',78,5,111),(3,10004,'2024-01-01 11:45:00',80,'aborted',80,0,590),(4,10069,'2024-01-01 11:00:00',91,'aborted',91,4,389),(5,10097,'2024-01-01 11:45:00',7,'success',74,0,768),(6,10025,'2024-01-01 11:00:00',46,'aborted',68,3,16),(7,10095,'2024-01-01 11:45:00',30,'aborted',75,3,496),(8,10026,'2024-01-01 11:00:00',59,'success',99,3,232),(9,10005,'2024-01-01 11:45:00',2,'aborted',77,4,127),(10,10098,'2024-01-01 11:00:00',21,'success',32,1,638),(11,10073,'2024-01-01 11:45:00',0,'aborted',61,4,371),(12,10038,'2024-01-01 11:00:00',14,'success',10,3,208),(13,10084,'2024-01-01 11:45:00',83,'success',31,5,78),(14,10036,'2024-01-01 11:00:00',75,'success',1,5,37),(15,10002,'2024-01-01 11:45:00',65,'success',97,2,112),(16,10090,'2024-01-01 11:00:00',97,'aborted',8,2,654),(17,10006,'2024-01-01 11:45:00',4,'aborted',40,1,23),(18,10091,'2024-01-01 11:00:00',29,'aborted',22,5,482),(19,10040,'2024-01-01 11:45:00',1,'aborted',41,0,526),(20,10013,'2024-01-01 11:00:00',41,'aborted',84,4,217),(21,10017,'2024-01-01 11:45:00',63,'success',51,1,762),(22,10031,'2024-01-01 11:00:00',1,'success',52,1,491),(23,10100,'2024-01-01 11:45:00',96,'success',18,0,606),(24,10048,'2024-01-01 11:00:00',6,'success',36,3,798),(25,10037,'2024-01-01 11:45:00',6,'success',88,0,506),(26,10065,'2024-01-01 11:00:00',70,'aborted',28,2,244),(27,10103,'2024-01-01 11:45:00',23,'success',90,5,22),(28,10066,'2024-01-01 11:00:00',47,'aborted',94,0,461),(29,10107,'2024-01-01 11:45:00',59,'success',63,4,786),(30,10043,'2024-01-01 11:00:00',86,'success',39,2,344),(31,10072,'2024-01-01 11:45:00',31,'success',38,1,283),(32,10054,'2024-01-01 11:00:00',42,'success',89,3,501),(33,10039,'2024-01-01 11:45:00',10,'aborted',98,5,380),(34,10058,'2024-01-01 11:00:00',30,'aborted',47,1,466),(35,10056,'2024-01-01 11:45:00',56,'success',6,0,221),(36,10034,'2024-01-01 11:00:00',14,'success',7,0,145),(37,10021,'2024-01-01 11:45:00',85,'success',72,4,260),(38,10092,'2024-01-01 11:00:00',22,'aborted',95,1,587),(39,10052,'2024-01-01 11:45:00',17,'success',93,0,225),(40,10075,'2024-01-01 11:00:00',34,'aborted',34,5,236),(41,10009,'2024-01-01 11:45:00',22,'success',13,4,228),(42,10074,'2024-01-01 11:00:00',59,'aborted',2,1,176),(43,10019,'2024-01-01 11:45:00',67,'success',25,1,49),(44,10062,'2024-01-01 11:00:00',79,'aborted',66,0,59),(45,10080,'2024-01-01 11:45:00',35,'aborted',42,5,245),(46,10024,'2024-01-01 11:00:00',77,'success',23,3,422),(47,10050,'2024-01-01 11:45:00',89,'aborted',14,5,158),(48,10041,'2024-01-01 11:00:00',85,'success',58,2,246),(49,10046,'2024-01-01 11:45:00',44,'success',73,5,451),(50,10007,'2024-01-01 11:00:00',40,'aborted',70,2,687),(51,10068,'2024-01-01 11:45:00',84,'aborted',67,0,518),(52,10042,'2024-01-01 11:00:00',39,'aborted',71,5,468),(53,10093,'2024-01-01 11:45:00',81,'success',92,1,214),(54,10023,'2024-01-01 11:00:00',88,'success',11,4,259),(55,10105,'2024-01-01 11:45:00',4,'success',86,5,590),(56,10008,'2024-01-01 11:00:00',17,'success',65,0,475),(57,10063,'2024-01-01 11:45:00',92,'success',43,5,552),(58,10029,'2024-01-01 11:00:00',85,'aborted',59,1,308),(59,10061,'2024-01-01 11:45:00',55,'success',48,0,53),(60,10088,'2024-01-01 11:00:00',77,'success',21,5,175),(61,10011,'2024-01-01 11:45:00',90,'success',82,2,257),(62,10109,'2024-01-01 11:00:00',99,'aborted',5,0,308),(63,10044,'2024-01-01 11:45:00',25,'success',29,1,490),(64,10057,'2024-01-01 11:00:00',88,'success',85,4,250),(65,10030,'2024-01-01 11:45:00',8,'success',56,1,455),(66,10108,'2024-01-01 11:00:00',27,'success',100,1,412),(67,10087,'2024-01-01 11:45:00',0,'success',55,4,586),(68,10020,'2024-01-01 11:00:00',40,'success',37,2,178),(69,10101,'2024-01-01 11:45:00',92,'success',24,3,729),(70,10094,'2024-01-01 11:00:00',97,'aborted',12,5,577),(71,10047,'2024-01-01 11:45:00',69,'aborted',57,3,497),(72,10086,'2024-01-01 11:00:00',27,'success',33,1,477),(73,10079,'2024-01-01 11:45:00',77,'aborted',44,4,714),(74,10055,'2024-01-01 11:00:00',68,'aborted',17,0,363),(75,10022,'2024-01-01 11:45:00',73,'success',46,1,646),(76,10082,'2024-01-01 11:00:00',48,'aborted',45,3,572),(77,10081,'2024-01-01 11:45:00',6,'aborted',30,3,471),(78,10028,'2024-01-01 11:00:00',19,'success',50,0,590),(79,10078,'2024-01-01 11:45:00',20,'success',81,2,31),(80,10012,'2024-01-01 11:00:00',90,'aborted',69,1,11),(81,10045,'2024-01-01 11:45:00',44,'aborted',9,5,691),(82,10104,'2024-01-01 11:00:00',56,'aborted',53,2,305),(83,10051,'2024-01-01 11:45:00',17,'aborted',16,2,795),(84,10099,'2024-01-01 11:00:00',39,'success',60,5,608),(85,10071,'2024-01-01 11:45:00',12,'success',4,4,42),(86,10016,'2024-01-01 11:00:00',21,'aborted',20,1,300),(87,10014,'2024-01-01 11:45:00',23,'aborted',96,2,532),(88,10049,'2024-01-01 11:00:00',15,'aborted',83,4,281),(89,10035,'2024-01-01 11:45:00',81,'success',79,1,449),(90,10089,'2024-01-01 11:00:00',94,'aborted',87,1,71),(91,10067,'2024-01-01 11:45:00',24,'aborted',54,0,257),(92,10060,'2024-01-01 11:00:00',98,'aborted',15,3,592),(93,10110,'2024-01-01 11:45:00',86,'success',3,5,78),(94,10010,'2024-01-01 11:00:00',82,'aborted',35,5,632),(95,10077,'2024-01-01 11:45:00',89,'success',19,5,74),(96,10083,'2024-01-01 11:00:00',61,'aborted',26,5,356),(97,10085,'2024-01-01 11:45:00',48,'success',49,2,368),(98,10096,'2024-01-01 11:00:00',3,'aborted',64,1,229),(99,10003,'2024-01-01 11:45:00',98,'success',27,4,396),(100,10064,'2024-01-01 11:00:00',54,'aborted',76,2,64),(201,10160,'2023-03-25 11:49:09',0,'success',103,0,0),(204,10161,NULL,2,'success',101,NULL,100),(207,10008,NULL,2,'started',NULL,NULL,100),(208,10028,NULL,2,'started',NULL,NULL,100),(209,10163,NULL,2,'success',102,5,100),(210,10165,NULL,2,'success',104,NULL,100),(211,10166,NULL,2,'success',105,NULL,100);
/*!40000 ALTER TABLE `trip` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TripChecker2` BEFORE INSERT ON `trip` FOR EACH ROW BEGIN
   DECLARE tripstatus varchar(20);
   IF (NEW.netDistance) < 0 OR (NEW.completion<0) THEN
      SET NEW.status= 'aborted';
   ELSEIF (NEW.completion>=95) THEN
      SET NEW.status = 'success';
   ELSE
      SET NEW.status = 'started';
   END IF;
   IF NEW.completion >100 THEN SET NEW.completion =100;
   END IF;
   IF NEW.netDistance <0 THEN SET NEW.netDistance =0;
   END IF;
   IF NEW.completion <0 THEN SET NEW.completion =0;
   END IF;
   IF NEW.endTime <= (Select bookingTime from booking where id = NEW.bookingId)THEN
   SIGNAL SQLSTATE '50001' SET MESSAGE_TEXT = 'Please enter valid Trip End Time';
   END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `user_history`
--

DROP TABLE IF EXISTS `user_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customerId` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `changedate` datetime DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_history`
--

LOCK TABLES `user_history` WRITE;
/*!40000 ALTER TABLE `user_history` DISABLE KEYS */;
INSERT INTO `user_history` VALUES (1,1106,'Retha','uosinski','2023-03-26 13:04:45','DELETED'),(2,1116,'parv','parv','2023-04-07 15:22:36','DELETED');
/*!40000 ALTER TABLE `user_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallet`
--

DROP TABLE IF EXISTS `wallet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wallet` (
  `id` int NOT NULL,
  `money` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `wallet_ibfk_1` FOREIGN KEY (`id`) REFERENCES `customer` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallet`
--

LOCK TABLES `wallet` WRITE;
/*!40000 ALTER TABLE `wallet` DISABLE KEYS */;
INSERT INTO `wallet` VALUES (1000,'356'),(1001,'769'),(1002,'060'),(1003,'735'),(1004,'497'),(1005,'358'),(1006,'912'),(1007,'008'),(1008,'870'),(1009,'430'),(1010,'572'),(1011,'682'),(1012,'993'),(1013,'548'),(1014,'332'),(1015,'913'),(1016,'119'),(1017,'618'),(1018,'713'),(1019,'603'),(1020,'192'),(1021,'716'),(1022,'773'),(1023,'861'),(1024,'810'),(1025,'673'),(1026,'249'),(1027,'107'),(1028,'568'),(1029,'737'),(1030,'674'),(1031,'931'),(1032,'725'),(1033,'077'),(1034,'690'),(1035,'184'),(1036,'998'),(1037,'844'),(1038,'809'),(1039,'002'),(1040,'404'),(1041,'606'),(1042,'159'),(1043,'306'),(1044,'071'),(1045,'845'),(1046,'912'),(1047,'058'),(1048,'238'),(1049,'022'),(1050,'440'),(1051,'180'),(1052,'632'),(1053,'505'),(1054,'606'),(1055,'999'),(1056,'565'),(1057,'059'),(1058,'316'),(1059,'831'),(1060,'608'),(1061,'383'),(1062,'209'),(1063,'952'),(1064,'244'),(1065,'206'),(1066,'784'),(1067,'346'),(1068,'428'),(1069,'526'),(1070,'747'),(1071,'995'),(1072,'764'),(1073,'510'),(1074,'737'),(1075,'417'),(1076,'272'),(1077,'987'),(1078,'967'),(1079,'994'),(1080,'976'),(1081,'006'),(1082,'998'),(1083,'590'),(1084,'276'),(1085,'750'),(1086,'392'),(1087,'295'),(1088,'279'),(1089,'393'),(1090,'682'),(1091,'523'),(1092,'736'),(1093,'022'),(1094,'714'),(1095,'387'),(1096,'028'),(1097,'304'),(1098,'362'),(1099,'714'),(1100,'120'),(1101,'351'),(1102,'287'),(1103,'111'),(1104,'793'),(1105,'671'),(1107,'156'),(1108,'719'),(1109,'355'),(1118,'1102'),(1119,'500');
/*!40000 ALTER TABLE `wallet` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `walletHistory` BEFORE UPDATE ON `wallet` FOR EACH ROW Insert into wallet_history set action = 'UPDATED', customerId = OLD.id, oldMoney = OLD.money, changedate =NOW() */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `wallet_history`
--

DROP TABLE IF EXISTS `wallet_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wallet_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customerId` int NOT NULL,
  `oldMoney` int NOT NULL,
  `changedate` datetime DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallet_history`
--

LOCK TABLES `wallet_history` WRITE;
/*!40000 ALTER TABLE `wallet_history` DISABLE KEYS */;
INSERT INTO `wallet_history` VALUES (1,1118,7000,'2023-04-20 11:44:17','UPDATED'),(2,1118,6500,'2023-04-20 15:24:42','UPDATED'),(3,1118,2,'2023-04-21 07:50:53','UPDATED'),(4,1118,1002,'2023-04-21 07:51:54','UPDATED');
/*!40000 ALTER TABLE `wallet_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'cab2'
--

--
-- Dumping routines for database 'cab2'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-24 19:33:57
