-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: food_delivery
-- ------------------------------------------------------
-- Server version	9.6.0

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '015413de-1669-11f1-90c2-d843ae3c188b:1-8216';

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch` (
  `id` int NOT NULL AUTO_INCREMENT,
  `location` varchar(255) DEFAULT NULL,
  `restaurant_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `restaurant_id` (`restaurant_id`),
  CONSTRAINT `branch_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES (1,'Maadi, Cairo',1),(2,'Zamalek, Cairo',2),(3,'Nasr City, Cairo',3),(4,'Dokki, Giza',4),(5,'Sheikh Zayed, Giza',5),(6,'Downtown Cairo',1),(7,'Maadi, Cairo',1),(8,'Zamalek, Cairo',2),(9,'Heliopolis, Cairo',2),(10,'New Cairo',3),(11,'6th of October',3),(12,'Downtown Cairo',1),(13,'Maadi, Cairo',1),(14,'Zamalek, Cairo',2),(15,'Heliopolis, Cairo',2),(16,'New Cairo',3),(17,'6th of October',3);
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `menu_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_id` (`menu_id`),
  CONSTRAINT `category_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Beef Burgers',1),(2,'Chicken Burgers',1),(3,'Sides',1),(4,'Classic Pizza',2),(5,'Stuffed Crust',2),(6,'Appetizers',2),(7,'Classic Burgers',1),(8,'Smash Burgers',1),(9,'Chicken Sandwiches',1),(10,'Sides',1),(11,'Shakes & Drinks',1),(12,'Classic Burgers',2),(13,'Smash Burgers',2),(14,'Chicken Sandwiches',2),(15,'Sides',2),(16,'Shakes & Drinks',2),(17,'Signature Pizzas',3),(18,'Build Your Own',3),(19,'Pasta',3),(20,'Starters',3),(21,'Desserts',3),(22,'Signature Pizzas',4),(23,'Build Your Own',4),(24,'Pasta',4),(25,'Starters',4),(26,'Desserts',4),(27,'Nigiri & Sashimi',5),(28,'Maki Rolls',5),(29,'Drinks',5),(30,'Nigiri & Sashimi',6),(31,'Maki Rolls',6),(32,'Drinks',6);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cust_address`
--

DROP TABLE IF EXISTS `cust_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cust_address` (
  `id` int NOT NULL AUTO_INCREMENT,
  `gps_coordinates` varchar(100) DEFAULT NULL,
  `label` varchar(100) DEFAULT NULL,
  `street` varchar(100) DEFAULT NULL,
  `building` varchar(50) DEFAULT NULL,
  `floor` varchar(50) DEFAULT NULL,
  `cust_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cust_id` (`cust_id`),
  CONSTRAINT `cust_address_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cust_address`
--

LOCK TABLES `cust_address` WRITE;
/*!40000 ALTER TABLE `cust_address` DISABLE KEYS */;
INSERT INTO `cust_address` VALUES (1,'30.0444,31.2357','Home','9th Street','Building 10','4th Floor',1),(2,'30.0561,31.2222','Work','Nile Corniche','Tower A','12th Floor',2),(3,'30.0123,31.1234','Gym','Nasr Road','Building 5','Ground',3),(4,'29.9789,31.1345','Home','Pyramids St','Villa 22','1st Floor',4),(5,'30.1234,31.4567','Parent House','El-Tahrir','Building 44','2nd Floor',5);
/*!40000 ALTER TABLE `cust_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cust_phone_num`
--

DROP TABLE IF EXISTS `cust_phone_num`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cust_phone_num` (
  `cust_id` int NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  PRIMARY KEY (`cust_id`,`phone_number`),
  CONSTRAINT `cust_phone_num_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cust_phone_num`
--

LOCK TABLES `cust_phone_num` WRITE;
/*!40000 ALTER TABLE `cust_phone_num` DISABLE KEYS */;
INSERT INTO `cust_phone_num` VALUES (1,'01012345678'),(1,'01112345678'),(2,'01212345678'),(3,'01512345678'),(4,'01098765432'),(5,'01198765432'),(6,'01298765432'),(7,'01598765432'),(8,'01055566677'),(9,'01155566677'),(10,'01255566677'),(11,'01555566677'),(12,'01000011122'),(13,'01100011122'),(14,'01200011122'),(15,'01500011122'),(16,'01033344455'),(17,'01133344455'),(18,'01233344455'),(19,'01533344455');
/*!40000 ALTER TABLE `cust_phone_num` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cust_promo_limit`
--

DROP TABLE IF EXISTS `cust_promo_limit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cust_promo_limit` (
  `cust_id` int NOT NULL,
  `promo_id` int NOT NULL,
  `usage_per_user` int DEFAULT '0',
  PRIMARY KEY (`cust_id`,`promo_id`),
  KEY `promo_id` (`promo_id`),
  CONSTRAINT `cust_promo_limit_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `cust_promo_limit_ibfk_2` FOREIGN KEY (`promo_id`) REFERENCES `promocode` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cust_promo_limit`
--

LOCK TABLES `cust_promo_limit` WRITE;
/*!40000 ALTER TABLE `cust_promo_limit` DISABLE KEYS */;
INSERT INTO `cust_promo_limit` VALUES (1,1,1),(2,1,0),(3,2,2),(4,2,1),(5,3,0);
/*!40000 ALTER TABLE `cust_promo_limit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Ahmed Mahmoud'),(2,'Hamdi  Emad'),(3,'Mohamed Hagag'),(4,'Shams Ashraf'),(5,'jana ahmed'),(6,'Laila Ahmed'),(7,'Khaled Nour'),(8,'Hoda Mahmoud'),(9,'Youssef Idrees'),(10,'Nour El Din'),(11,'Zainab Fawzy'),(12,'Mostafa Gamal'),(13,'Dina Samir'),(14,'Tarek Yehia'),(15,'Mariam Soliman'),(16,'Hany Ramzy'),(17,'Fady Ibrahim'),(18,'Rania Youssef'),(19,'Amr Diab'),(20,'Salma Adel'),(21,'Ahmed Hassan'),(22,'Sara Mohamed'),(23,'Khaled Ibrahim'),(24,'Nour Aly'),(25,'Omar Farouk'),(26,'Layla Mahmoud'),(27,'Youssef Kamal'),(28,'Dina Samir'),(29,'Tarek Nasser'),(30,'Rana Adel'),(31,'Mostafa Gamal'),(32,'Hana Sherif'),(33,'Amr Zaki'),(34,'Mona Fathy'),(35,'Karim Hossam'),(36,'Yasmin Salah'),(37,'Sherif Anwar'),(38,'Noha Tamer'),(39,'Mahmoud Reda'),(40,'Aya Wael'),(41,'Ahmed Hassan'),(42,'Sara Mohamed'),(43,'Khaled Ibrahim'),(44,'Nour Aly'),(45,'Omar Farouk'),(46,'Layla Mahmoud'),(47,'Youssef Kamal'),(48,'Dina Samir'),(49,'Tarek Nasser'),(50,'Rana Adel'),(51,'Mostafa Gamal'),(52,'Hana Sherif'),(53,'Amr Zaki'),(54,'Mona Fathy'),(55,'Karim Hossam'),(56,'Yasmin Salah'),(57,'Sherif Anwar'),(58,'Noha Tamer'),(59,'Mahmoud Reda'),(60,'Aya Wael');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_bonus`
--

DROP TABLE IF EXISTS `delivery_bonus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_bonus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bonus` decimal(10,2) DEFAULT NULL,
  `timestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  `cap_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cap_id` (`cap_id`),
  CONSTRAINT `delivery_bonus_ibfk_1` FOREIGN KEY (`cap_id`) REFERENCES `delivery_cap` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_bonus`
--

LOCK TABLES `delivery_bonus` WRITE;
/*!40000 ALTER TABLE `delivery_bonus` DISABLE KEYS */;
INSERT INTO `delivery_bonus` VALUES (1,50.00,'2026-03-03 22:37:29',1),(2,75.50,'2026-03-03 22:37:29',2),(3,30.00,'2026-03-03 22:37:29',3),(4,100.00,'2026-03-03 22:37:29',7),(5,25.00,'2026-03-03 22:37:29',8);
/*!40000 ALTER TABLE `delivery_bonus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_cap`
--

DROP TABLE IF EXISTS `delivery_cap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_cap` (
  `id` int NOT NULL AUTO_INCREMENT,
  `vehicle_details` varchar(255) DEFAULT NULL,
  `current_status` varchar(50) DEFAULT NULL,
  `base_pay` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_cap`
--

LOCK TABLES `delivery_cap` WRITE;
/*!40000 ALTER TABLE `delivery_cap` DISABLE KEYS */;
INSERT INTO `delivery_cap` VALUES (1,'Honda Bike - ABC 123','Available',50.00),(2,'Yamaha Bike - XYZ 789','Busy',55.00),(3,'Suzuki Van - DEF 456','Available',70.00),(4,'Bicycle - GHI 321','Available',30.00),(5,'Honda Bike - JKL 654','Offline',50.00),(6,'Yamaha Bike - MNO 987','Available',55.00),(7,'Toyota Corolla - PQR 111','Busy',100.00),(8,'Vespa - STU 222','Available',45.00),(9,'Honda Bike - VWX 333','Available',50.00),(10,'Bicycle - YZA 444','Available',30.00);
/*!40000 ALTER TABLE `delivery_cap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_zone`
--

DROP TABLE IF EXISTS `delivery_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_zone` (
  `location` varchar(255) NOT NULL,
  `branch_id` int NOT NULL,
  PRIMARY KEY (`location`,`branch_id`),
  KEY `branch_id` (`branch_id`),
  CONSTRAINT `delivery_zone_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_zone`
--

LOCK TABLES `delivery_zone` WRITE;
/*!40000 ALTER TABLE `delivery_zone` DISABLE KEYS */;
INSERT INTO `delivery_zone` VALUES ('Bab El-Louk',1),('Garden City',1),('Maadi Degla',2),('Maadi Sarayat',2),('Zamalek North',3),('Zamalek South',3),('Heliopolis Korba',4),('Heliopolis Sheraton',4),('New Cairo 1st Settlement',5),('New Cairo Rehab',5),('6th October District 1',6),('6th October District 2',6);
/*!40000 ALTER TABLE `delivery_zone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `general_rating`
--

DROP TABLE IF EXISTS `general_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `general_rating` (
  `restaurant_rating` int DEFAULT NULL,
  `captain_rating` int DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  KEY `order_id` (`order_id`),
  CONSTRAINT `general_rating_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `general_rating_chk_1` CHECK ((`restaurant_rating` between 1 and 5)),
  CONSTRAINT `general_rating_chk_2` CHECK ((`captain_rating` between 1 and 5))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `general_rating`
--

LOCK TABLES `general_rating` WRITE;
/*!40000 ALTER TABLE `general_rating` DISABLE KEYS */;
INSERT INTO `general_rating` VALUES (5,4,1),(4,5,2),(5,5,3);
/*!40000 ALTER TABLE `general_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `is_available` tinyint(1) DEFAULT '1',
  `price` decimal(10,2) DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `item_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'Whopper',1,150.00,1),(2,'Double Cheeseburger',1,120.00,1),(3,'Chicken Royale',1,130.00,2),(4,'Spicy Chicken',1,135.00,2),(5,'French Fries',1,40.00,3),(6,'Onion Rings',1,45.00,3),(7,'Margherita Pizza',1,180.00,4),(8,'Pepperoni',1,210.00,4),(9,'Super Supreme',1,250.00,5),(10,'Meat Lovers',1,260.00,5),(11,'Garlic Bread',1,60.00,6),(12,'Chicken Wings',1,90.00,6),(13,'Classic Cheeseburger',1,55.00,1),(14,'Double Smash Classic',1,75.00,1),(15,'Bacon BBQ Burger',1,85.00,1),(16,'Mushroom Swiss Burger',1,80.00,1),(17,'Smash Single',1,60.00,2),(18,'Smash Double',1,85.00,2),(19,'Smash Triple',1,110.00,2),(20,'Crispy Chicken',1,65.00,3),(21,'Spicy Chicken Deluxe',1,70.00,3),(22,'Grilled Chicken Wrap',1,60.00,3),(23,'Classic Fries',1,25.00,4),(24,'Loaded Cheese Fries',1,40.00,4),(25,'Onion Rings',1,30.00,4),(26,'Coleslaw',1,20.00,4),(27,'Chocolate Shake',1,45.00,5),(28,'Vanilla Shake',1,45.00,5),(29,'Strawberry Shake',1,45.00,5),(30,'Soft Drink',1,15.00,5),(31,'Classic Cheeseburger',1,55.00,6),(32,'Double Smash Classic',1,75.00,6),(33,'Bacon BBQ Burger',1,85.00,6),(34,'Mushroom Swiss Burger',1,80.00,6),(35,'Smash Single',1,60.00,7),(36,'Smash Double',1,85.00,7),(37,'Smash Triple',1,110.00,7),(38,'Crispy Chicken',1,65.00,8),(39,'Spicy Chicken Deluxe',1,70.00,8),(40,'Grilled Chicken Wrap',1,60.00,8),(41,'Classic Fries',1,25.00,9),(42,'Loaded Cheese Fries',1,40.00,9),(43,'Onion Rings',1,30.00,9),(44,'Coleslaw',1,20.00,9),(45,'Chocolate Shake',1,45.00,10),(46,'Vanilla Shake',1,45.00,10),(47,'Soft Drink',1,15.00,10),(48,'Margherita',1,90.00,11),(49,'Pepperoni Feast',1,120.00,11),(50,'BBQ Chicken Pizza',1,115.00,11),(51,'Four Cheese',1,125.00,11),(52,'Veggie Supreme',1,95.00,11),(53,'Custom Pizza Base',1,70.00,12),(54,'Spaghetti Bolognese',1,85.00,13),(55,'Penne Arrabbiata',1,80.00,13),(56,'Fettuccine Alfredo',1,90.00,13),(57,'Garlic Bread',1,30.00,14),(58,'Caesar Salad',1,55.00,14),(59,'Bruschetta',1,40.00,14),(60,'Tiramisu',1,55.00,15),(61,'Nutella Calzone',1,60.00,15),(62,'Margherita',1,90.00,16),(63,'Pepperoni Feast',1,120.00,16),(64,'BBQ Chicken Pizza',1,115.00,16),(65,'Four Cheese',1,125.00,16),(66,'Veggie Supreme',1,95.00,16),(67,'Custom Pizza Base',1,70.00,17),(68,'Spaghetti Bolognese',1,85.00,18),(69,'Penne Arrabbiata',1,80.00,18),(70,'Fettuccine Alfredo',1,90.00,18),(71,'Garlic Bread',1,30.00,19),(72,'Caesar Salad',1,55.00,19),(73,'Tiramisu',1,55.00,20),(74,'Nutella Calzone',1,60.00,20),(75,'Salmon Nigiri (2pc)',1,55.00,21),(76,'Tuna Nigiri (2pc)',1,60.00,21),(77,'Salmon Sashimi (5pc)',1,90.00,21),(78,'California Roll',1,65.00,22),(79,'Spicy Tuna Roll',1,70.00,22),(80,'Dragon Roll',1,95.00,22),(81,'Green Tea',1,20.00,23),(82,'Mango Juice',1,25.00,23),(83,'Salmon Nigiri (2pc)',1,55.00,24),(84,'Tuna Nigiri (2pc)',1,60.00,24),(85,'Salmon Sashimi (5pc)',1,90.00,24),(86,'California Roll',1,65.00,25),(87,'Spicy Tuna Roll',1,70.00,25),(88,'Dragon Roll',1,95.00,25),(89,'Green Tea',1,20.00,26),(90,'Mango Juice',1,25.00,26);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_modifier`
--

DROP TABLE IF EXISTS `item_modifier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_modifier` (
  `item_id` int NOT NULL,
  `modifier_id` int NOT NULL,
  PRIMARY KEY (`item_id`,`modifier_id`),
  KEY `modifier_id` (`modifier_id`),
  CONSTRAINT `item_modifier_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`),
  CONSTRAINT `item_modifier_ibfk_2` FOREIGN KEY (`modifier_id`) REFERENCES `modifiers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_modifier`
--

LOCK TABLES `item_modifier` WRITE;
/*!40000 ALTER TABLE `item_modifier` DISABLE KEYS */;
INSERT INTO `item_modifier` VALUES (1,1),(7,1),(1,2),(1,3),(7,3);
/*!40000 ALTER TABLE `item_modifier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_rating`
--

DROP TABLE IF EXISTS `item_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_rating` (
  `rating` int DEFAULT NULL,
  `item_id` int DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  KEY `item_id` (`item_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `item_rating_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`),
  CONSTRAINT `item_rating_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `item_rating_chk_1` CHECK ((`rating` between 1 and 5))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_rating`
--

LOCK TABLES `item_rating` WRITE;
/*!40000 ALTER TABLE `item_rating` DISABLE KEYS */;
INSERT INTO `item_rating` VALUES (5,1,1),(4,5,1),(5,7,2),(3,1,3),(5,9,5);
/*!40000 ALTER TABLE `item_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `branch_id` (`branch_id`),
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'BK Main Menu',1),(2,'PH Main Menu',2),(3,'KFC Main Menu',3),(4,'Sushi Deluxe',4),(5,'Pasta Classics',5),(6,'Burger Barn Downtown Menu',1),(7,'Burger Barn Maadi Menu',2),(8,'Pizza Palace Zamalek Menu',3),(9,'Pizza Palace Heliopolis Menu',4),(10,'Sushi Station New Cairo Menu',5),(11,'Sushi Station 6Oct Menu',6);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modifiers`
--

DROP TABLE IF EXISTS `modifiers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modifiers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `over_price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modifiers`
--

LOCK TABLES `modifiers` WRITE;
/*!40000 ALTER TABLE `modifiers` DISABLE KEYS */;
INSERT INTO `modifiers` VALUES (1,'Extra Cheese',15.00),(2,'Add Jalapeno',10.00),(3,'Large Size',30.00),(4,'Extra Sauce',5.00),(5,'Extra Patty',20.00),(6,'Beef Patty → Chicken',5.00),(7,'Add Cheddar',5.00),(8,'Add Swiss Cheese',5.00),(9,'Add Blue Cheese',8.00),(10,'Extra BBQ Sauce',3.00),(11,'Spicy Mayo',3.00),(12,'Honey Mustard',3.00),(13,'Add Bacon',12.00),(14,'Add Avocado',10.00),(15,'Add Egg',8.00),(16,'Brioche Bun Upgrade',7.00),(17,'Gluten-Free Bun',10.00),(18,'Upsize to Large',10.00),(19,'Add Dipping Sauce',5.00),(20,'Thin Crust',0.00),(21,'Stuffed Crust',15.00),(22,'Gluten-Free Base',20.00),(23,'Extra Cheese',10.00),(24,'Add Jalapeños',5.00),(25,'Add Olives',5.00),(26,'Add Mushrooms',5.00),(27,'Extra Pepperoni',10.00),(28,'Add Grilled Chicken',20.00),(29,'Make it Spicy',0.00),(30,'Add Wasabi',0.00),(31,'Add Extra Ginger',0.00),(32,'Salmon → Tuna Swap',5.00);
/*!40000 ALTER TABLE `modifiers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operating_hours`
--

DROP TABLE IF EXISTS `operating_hours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operating_hours` (
  `id` int NOT NULL AUTO_INCREMENT,
  `open_time` time DEFAULT NULL,
  `close_time` time DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `branch_id` (`branch_id`),
  CONSTRAINT `operating_hours_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operating_hours`
--

LOCK TABLES `operating_hours` WRITE;
/*!40000 ALTER TABLE `operating_hours` DISABLE KEYS */;
INSERT INTO `operating_hours` VALUES (1,'08:00:00','23:00:00',1),(2,'10:00:00','02:00:00',2),(3,'09:00:00','00:00:00',3),(4,'11:00:00','23:30:00',4),(5,'07:00:00','01:00:00',5),(6,'10:00:00','23:59:00',1),(7,'10:00:00','23:59:00',2),(8,'11:00:00','00:00:00',3),(9,'11:00:00','00:00:00',4),(10,'12:00:00','23:30:00',5),(11,'12:00:00','23:30:00',6);
/*!40000 ALTER TABLE `operating_hours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_item` (
  `order_id` int NOT NULL,
  `item_id` int NOT NULL,
  `quantity` int DEFAULT NULL,
  `final_price` decimal(10,2) DEFAULT NULL,
  `modifier_id` int DEFAULT NULL,
  PRIMARY KEY (`order_id`,`item_id`),
  KEY `item_id` (`item_id`),
  KEY `modifier_id` (`modifier_id`),
  CONSTRAINT `order_item_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `order_item_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`),
  CONSTRAINT `order_item_ibfk_3` FOREIGN KEY (`modifier_id`) REFERENCES `modifiers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
INSERT INTO `order_item` VALUES (1,1,1,150.00,NULL),(1,5,1,40.00,NULL),(2,7,2,360.00,NULL),(3,1,1,150.00,NULL),(4,3,2,260.00,NULL),(5,9,1,280.00,1),(6,11,3,180.00,NULL);
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cust_id` int DEFAULT NULL,
  `is_donation` tinyint(1) DEFAULT '0',
  `delivery_factor` decimal(5,2) DEFAULT NULL,
  `current_status` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `timestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  `total_price` decimal(10,2) DEFAULT NULL,
  `delivery_fee` decimal(10,2) DEFAULT NULL,
  `promocode_id` int DEFAULT NULL,
  `cap_id` int DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cust_id` (`cust_id`),
  KEY `branch_id` (`branch_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,0,1.00,'Delivered','Tahrir St, Building 12, Floor 3','2026-03-01 14:00:00',200.00,20.00,1,1,1),(2,2,0,1.00,'Delivered','El-Nasr Rd, Building 8, Floor 2','2026-03-01 18:15:00',350.00,25.00,7,2,2),(3,3,1,1.00,'Delivered','Maadi St, Building 15, Ground Floor','2026-03-02 12:00:00',150.00,0.00,7,3,1),(4,4,0,1.00,'Cancelled','Aly Basha St, Building 3, Floor 4','2026-03-02 15:00:00',100.00,15.00,7,4,3),(5,5,0,1.00,'Delivered','26th July St, Building 20, Floor 5','2026-03-02 20:00:00',500.00,30.00,1,5,4),(6,2,0,1.00,'Delivered','El-Haram St, Building 7, Floor 1','2026-02-28 13:32:15',152.42,20.00,7,7,5),(7,14,0,1.00,'Delivered','Shooting Club Rd, Building 11, Floor 6','2026-03-02 21:32:15',182.49,20.00,7,8,5),(8,13,1,1.00,'Delivered','Hassan Allam St, Building 9, Floor 2','2026-03-03 17:32:15',234.14,20.00,7,9,2),(9,6,0,1.00,'Delivered','El-Kornish Rd, Building 4, Ground','2026-03-01 06:32:15',311.27,20.00,7,1,1),(10,13,0,1.00,'Delivered','Arab League Rd, Building 6, Floor 3','2026-03-01 22:32:15',326.98,20.00,7,2,1),(11,14,1,1.00,'Delivered','Victoria Sq, Building 18, Floor 8','2026-03-01 19:32:15',363.84,20.00,7,3,5),(12,12,0,1.00,'Delivered','Faisal St, Building 2, Floor 5','2026-03-02 06:32:15',103.29,20.00,7,4,2),(13,20,1,1.00,'Delivered','Nasr City Rd, Building 13, Floor 4','2026-02-28 17:32:15',440.08,20.00,2,5,4),(14,6,1,1.00,'Delivered','Garden City Rd, Building 1, Floor 2','2026-03-01 12:32:15',124.19,20.00,7,7,1),(15,15,0,1.00,'Delivered','El-Azhar St, Building 22, Ground','2026-03-01 21:32:15',334.18,20.00,7,8,5),(16,14,0,1.00,'Delivered','El-Mohandiseen Rd, Building 17, Floor 7','2026-02-28 22:32:15',441.43,20.00,7,9,5),(17,2,0,1.00,'Delivered','Imbaba St, Building 10, Floor 1','2026-03-02 01:32:15',396.37,20.00,7,1,1),(18,1,0,1.00,'Delivered','Shubra El-Kheima Rd, Building 14','2026-03-01 03:32:15',277.01,20.00,7,2,4),(19,1,0,1.00,'Delivered','Helwan Ave, Building 16, Ground','2026-03-01 19:32:15',369.75,20.00,7,3,1),(20,11,1,1.00,'Delivered','Dokki St, Building 19, Floor 9','2026-03-02 21:32:15',174.48,20.00,7,4,1),(21,14,0,1.00,'Delivered','Tahrir St, Building 12, Floor 3','2026-03-03 15:32:15',409.04,20.00,7,5,4),(22,1,0,1.00,'Delivered','El-Nasr Rd, Building 8, Floor 2','2026-02-28 09:32:15',241.46,20.00,1,7,5),(23,5,0,1.00,'Delivered','Maadi St, Building 15, Ground Floor','2026-03-01 20:32:15',455.76,20.00,7,8,3),(24,17,0,1.00,'Delivered','26th July St, Building 20, Floor 5','2026-03-01 13:32:15',467.37,20.00,7,9,4),(25,2,0,1.00,'Delivered','Arab League Rd, Building 6, Floor 3','2026-02-28 14:32:15',327.18,20.00,7,1,4),(26,7,0,1.00,'Delivered','Nasr City Rd, Building 13, Floor 4','2026-03-02 10:32:15',320.23,20.00,7,2,1),(27,3,1,1.00,'Delivered','Hassan Allam St, Building 9, Floor 2','2026-03-03 15:32:15',139.53,20.00,7,3,4),(28,1,0,1.00,'Delivered','El-Azhar St, Building 22, Ground','2026-03-01 21:32:15',486.23,20.00,7,4,5),(29,12,1,1.00,'Delivered','El-Haram St, Building 7, Floor 1','2026-03-01 05:32:15',189.58,20.00,7,5,2),(30,12,0,1.00,'Delivered','Victoria Sq, Building 18, Floor 8','2026-03-03 21:32:15',370.11,20.00,7,7,5),(31,1,1,1.50,'Delivered','Tahrir St, Building 12, Floor 3','2026-03-01 12:32:15',348.42,20.00,2,2,1),(32,1,1,1.50,'Delivered','El-Nasr Rd, Building 8, Floor 2','2026-03-02 07:32:15',488.19,20.00,2,4,2),(33,1,0,1.50,'Delivered','Maadi St, Building 15, Ground Floor','2026-03-02 17:32:15',317.03,20.00,3,5,1),(34,17,0,1.50,'Delivered','26th July St, Building 20, Floor 5','2026-03-03 09:32:15',283.83,20.00,2,8,1),(35,6,0,1.50,'Delivered','Shooting Club Rd, Building 11, Floor 6','2026-02-28 17:32:15',108.07,20.00,3,9,1),(36,17,0,1.50,'Delivered','El-Kornish Rd, Building 4, Ground','2026-03-02 18:32:15',128.69,20.00,2,1,4),(37,4,0,1.50,'Delivered','El-Mohandiseen Rd, Building 17, Floor 7','2026-03-02 16:32:15',457.08,20.00,3,3,1),(38,17,0,1.50,'Delivered','Garden City Rd, Building 1, Floor 2','2026-03-01 20:32:15',225.36,20.00,2,7,1),(39,11,0,1.50,'Delivered','Maadi Degla, Building 5, Floor 2','2026-03-01 20:32:15',232.94,20.00,3,8,1),(40,11,1,1.50,'Delivered','Dokki St, Building 19, Floor 9','2026-03-01 02:32:15',120.62,20.00,2,9,1),(41,5,1,1.50,'Delivered','New Cairo 1st Settlement, Villa 12','2026-03-01 14:32:15',207.69,20.00,3,10,1),(42,20,0,1.50,'Delivered','Maadi Sarayat, Building 8, Floor 3','2026-03-02 04:32:15',332.48,20.00,2,1,2),(43,8,1,1.00,'Delivered','Dar El-Salam Orphanage, Maadi','2026-03-01 23:32:15',443.08,20.00,5,1,4),(44,16,1,1.00,'Delivered','Al-Rahma Charity, Downtown Cairo','2026-02-28 11:32:15',445.32,20.00,5,3,3),(45,12,0,1.00,'Delivered','Hope Shelter, Heliopolis','2026-02-27 19:32:15',472.27,20.00,5,5,2),(46,4,0,1.00,'Delivered','Zakat House, New Cairo','2026-02-28 12:32:15',492.85,20.00,5,7,5),(47,3,0,1.00,'Delivered','Beit El-Aman, 6th October','2026-03-01 08:32:15',298.29,20.00,5,9,2),(48,13,0,1.00,'Delivered','Dar El-Salam Orphanage, Maadi','2026-03-01 10:32:15',308.41,20.00,5,2,1),(49,9,0,1.00,'Delivered','Al-Rahma Charity, Downtown Cairo','2026-03-02 06:32:15',128.07,20.00,5,4,2),(50,16,0,NULL,'Delivered',NULL,'2026-03-03 06:32:15',457.61,20.00,NULL,NULL,4);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `wallet_id` int DEFAULT NULL,
  `credit` decimal(10,2) DEFAULT '0.00',
  `debit` decimal(10,2) DEFAULT '0.00',
  `payment_type` varchar(50) DEFAULT NULL,
  `timestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  `order_id` int DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `wallet_id` (`wallet_id`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`wallet_id`) REFERENCES `wallet_ledger` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,1,0.00,220.00,'Wallet','2026-03-03 22:32:15',1),(2,2,0.00,375.00,'Wallet','2026-03-03 22:32:15',2),(3,3,0.00,150.00,'Wallet','2026-03-03 22:32:15',3);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promocode`
--

DROP TABLE IF EXISTS `promocode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promocode` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL,
  `is_expired` tinyint(1) DEFAULT '0',
  `expiration_date` date DEFAULT NULL,
  `total_global_usage` int DEFAULT '0',
  `discount` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promocode`
--

LOCK TABLES `promocode` WRITE;
/*!40000 ALTER TABLE `promocode` DISABLE KEYS */;
INSERT INTO `promocode` VALUES (1,'WELCOME50',0,'2026-12-31',0,50.00),(2,'RAMADAN20',0,'2026-04-30',0,20.00),(3,'FREE_DEL',0,'2026-01-01',0,15.00);
/*!40000 ALTER TABLE `promocode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
INSERT INTO `restaurant` VALUES (1,'Burger King','bk_logo.png'),(2,'Pizza Hut','ph_logo.png'),(3,'KFC','kfc_logo.png'),(4,'Sushi House','sushi_logo.png'),(5,'Pasta Palace','pasta_logo.png'),(6,'Burger Barn','burger_barn.jpg'),(7,'Pizza Palace','pizza_palace.jpg'),(8,'Sushi Station','sushi_station.jpg'),(9,'Burger Barn','burger_barn.jpg'),(10,'Pizza Palace','pizza_palace.jpg'),(11,'Sushi Station','sushi_station.jpg');
/*!40000 ALTER TABLE `restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallet_ledger`
--

DROP TABLE IF EXISTS `wallet_ledger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wallet_ledger` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cust_id` int NOT NULL,
  `balance` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `cust_id` (`cust_id`),
  CONSTRAINT `wallet_ledger_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallet_ledger`
--

LOCK TABLES `wallet_ledger` WRITE;
/*!40000 ALTER TABLE `wallet_ledger` DISABLE KEYS */;
INSERT INTO `wallet_ledger` VALUES (1,1,434.24),(2,2,582.38),(3,3,609.19),(4,4,298.79),(5,5,466.39),(6,6,435.57),(7,7,678.69),(8,8,186.74),(9,9,597.63),(10,10,527.94),(11,11,746.79),(12,12,250.16),(13,13,710.41),(14,14,901.59),(15,15,476.70),(16,16,478.75),(17,17,863.64),(18,18,981.95),(19,19,418.85),(20,20,848.39),(32,1,250.00),(33,2,80.50),(34,3,420.00),(35,4,15.75),(36,5,630.00),(37,6,190.25),(38,7,0.00),(39,8,310.00),(40,9,55.00),(41,10,900.00),(42,11,120.00),(43,12,45.50),(44,13,780.00),(45,14,200.00),(46,15,360.00),(47,16,5.00),(48,17,150.00),(49,18,95.00),(50,19,500.00),(51,20,275.00),(52,1,250.00),(53,2,80.50),(54,3,420.00),(55,4,15.75),(56,5,630.00),(57,6,190.25),(58,7,0.00),(59,8,310.00),(60,9,55.00),(61,10,900.00),(62,11,120.00),(63,12,45.50),(64,13,780.00),(65,14,200.00),(66,15,360.00),(67,16,5.00),(68,17,150.00),(69,18,95.00),(70,19,500.00),(71,20,275.00);
/*!40000 ALTER TABLE `wallet_ledger` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-03 23:19:19
