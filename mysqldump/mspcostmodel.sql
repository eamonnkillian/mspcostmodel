-- MySQL dump 10.13  Distrib 5.6.17, for osx10.7 (x86_64)
--
-- Host: localhost    Database: mspCostModel
-- ------------------------------------------------------
-- Server version	5.6.17

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
-- Table structure for table `aboutus`
--

DROP TABLE IF EXISTS `aboutus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aboutus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `our_name` varchar(45) DEFAULT NULL,
  `street_number` varchar(8) DEFAULT NULL,
  `street_address_1` varchar(45) DEFAULT NULL,
  `street_address_2` varchar(45) DEFAULT NULL,
  `street_address_3` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `currency` varchar(45) DEFAULT NULL,
  `over_subscription_ratio` float(3,2) DEFAULT '1.00',
  `post_code` varchar(8) DEFAULT NULL,
  `company_number` int(15) DEFAULT '0',
  `VAT_number` int(15) DEFAULT '0',
  `primary_telephone` varchar(18) DEFAULT '0',
  `secondary_telephone` varchar(18) DEFAULT '0',
  `fax_number` varchar(18) DEFAULT '0',
  `business_description` blob,
  `our_email` varchar(45) DEFAULT NULL,
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aboutus`
--

LOCK TABLES `aboutus` WRITE;
/*!40000 ALTER TABLE `aboutus` DISABLE KEYS */;
INSERT INTO `aboutus` VALUES (1,'Sample Company','','Buckingham Palace','The Mall','New Malden','London','United Kingdom','GBP',1.20,'SW1A 1AA',123456,123456,'01634238304','07896103881','01234567890','Test entry. ','eamonnkillian@gmail.com','eamonnkillian@gmail.com','2014-05-22 06:06:30');
/*!40000 ALTER TABLE `aboutus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accelerators`
--

DROP TABLE IF EXISTS `accelerators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accelerators` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accelerators_type` varchar(45) DEFAULT NULL,
  `assignment` varchar(11) DEFAULT NULL,
  `currency` varchar(8) DEFAULT NULL,
  `accelerators_purchase_date` varchar(10) DEFAULT NULL,
  `accelerators_number_ports` int(6) DEFAULT '0',
  `accelerators_location` varchar(45) DEFAULT NULL,
  `accelerators_cost` float(10,2) DEFAULT '0.00',
  `accelerators_maintenance_cost` float(10,2) DEFAULT '0.00',
  `accelerators_maintenance_term` int(6) DEFAULT '0',
  `accelerators_lifespan` int(6) DEFAULT '0',
  `accelerators_power_consumption` int(6) DEFAULT '0',
  `accelerators_qty` int(6) DEFAULT '0',
  `accelerators_disposal_cost` int(6) DEFAULT '0',
  `accelerators_rack_size_u` int(6) DEFAULT '0',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='cost_input';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accelerators`
--

LOCK TABLES `accelerators` WRITE;
/*!40000 ALTER TABLE `accelerators` DISABLE KEYS */;
/*!40000 ALTER TABLE `accelerators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amd_servers`
--

DROP TABLE IF EXISTS `amd_servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `amd_servers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_type` varchar(45) DEFAULT NULL,
  `assignment` varchar(11) DEFAULT NULL,
  `server_purchase_date` varchar(10) DEFAULT NULL,
  `currency` varchar(8) DEFAULT NULL,
  `server_location` varchar(45) DEFAULT NULL,
  `server_number_processors` int(8) DEFAULT '0',
  `server_number_cores_per_processor` int(8) DEFAULT '0',
  `server_memory_GB` int(8) DEFAULT '0',
  `server_hard_drive` varchar(4) DEFAULT NULL,
  `server_cddvd_drive` varchar(4) DEFAULT NULL,
  `server_video_card` varchar(4) DEFAULT NULL,
  `server_IO_drawers` int(8) DEFAULT NULL,
  `server_IO_ports` int(8) DEFAULT NULL,
  `server_cost` float(10,2) DEFAULT '0.00',
  `server_maintenance_cost` float(10,2) DEFAULT '0.00',
  `server_maintenance_term` int(8) DEFAULT '0',
  `server_lifespan` int(8) DEFAULT '0',
  `server_power_consumption` int(8) DEFAULT '0',
  `server_qty` int(8) DEFAULT '0',
  `server_disposal_cost` float(10,2) DEFAULT '0.00',
  `server_rack_size_u` int(8) DEFAULT '0',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='cost_input';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amd_servers`
--

LOCK TABLES `amd_servers` WRITE;
/*!40000 ALTER TABLE `amd_servers` DISABLE KEYS */;
/*!40000 ALTER TABLE `amd_servers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_acquisition_charges`
--

DROP TABLE IF EXISTS `asset_acquisition_charges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asset_acquisition_charges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_currency` varchar(4) DEFAULT 'GBP',
  `2014` float(10,2) NOT NULL DEFAULT '0.00',
  `2015` float(10,2) NOT NULL DEFAULT '0.00',
  `2016` float(10,2) NOT NULL DEFAULT '0.00',
  `2017` float(10,2) NOT NULL DEFAULT '0.00',
  `2018` float(10,2) NOT NULL DEFAULT '0.00',
  `2019` float(10,2) NOT NULL DEFAULT '0.00',
  `2020` float(10,2) NOT NULL DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_acquisition_charges`
--

LOCK TABLES `asset_acquisition_charges` WRITE;
/*!40000 ALTER TABLE `asset_acquisition_charges` DISABLE KEYS */;
INSERT INTO `asset_acquisition_charges` VALUES (3,'GBP',0.00,0.00,0.00,0.00,0.00,0.00,0.00,NULL,'2014-04-19 10:18:11');
/*!40000 ALTER TABLE `asset_acquisition_charges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assignments`
--

DROP TABLE IF EXISTS `assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assignments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assignment_type` varchar(11) DEFAULT NULL,
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignments`
--

LOCK TABLES `assignments` WRITE;
/*!40000 ALTER TABLE `assignments` DISABLE KEYS */;
INSERT INTO `assignments` VALUES (1,'Production','eamonnkillian@gmail.com','2014-05-17 07:36:40'),(2,'Test','eamonnkillian@gmail.com','2014-04-16 09:54:03'),(3,'Development','eamonnkillian@gmail.com','2014-05-17 07:36:12'),(4,'Management','eamonnkillian@gmail.com','2014-05-17 07:34:59');
/*!40000 ALTER TABLE `assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audits`
--

DROP TABLE IF EXISTS `audits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_currency` varchar(4) DEFAULT 'GBP',
  `2014` float(10,2) NOT NULL DEFAULT '0.00',
  `2015` float(10,2) NOT NULL DEFAULT '0.00',
  `2016` float(10,2) NOT NULL DEFAULT '0.00',
  `2017` float(10,2) NOT NULL DEFAULT '0.00',
  `2018` float(10,2) NOT NULL DEFAULT '0.00',
  `2019` float(10,2) NOT NULL DEFAULT '0.00',
  `2020` float(10,2) NOT NULL DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audits`
--

LOCK TABLES `audits` WRITE;
/*!40000 ALTER TABLE `audits` DISABLE KEYS */;
INSERT INTO `audits` VALUES (3,'GBP',0.00,0.00,0.00,0.00,0.00,0.00,0.00,NULL,'2014-04-19 10:22:18');
/*!40000 ALTER TABLE `audits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backup_service_products`
--

DROP TABLE IF EXISTS `backup_service_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backup_service_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(45) DEFAULT NULL,
  `amount_of_VMs` int(6) DEFAULT '0',
  `amount_of_memory_MBs` int(6) DEFAULT '0',
  `amount_of_storage_GBs` int(6) DEFAULT '0',
  `backup_product_source` varchar(23) DEFAULT NULL,
  `description` blob,
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backup_service_products`
--

LOCK TABLES `backup_service_products` WRITE;
/*!40000 ALTER TABLE `backup_service_products` DISABLE KEYS */;
INSERT INTO `backup_service_products` VALUES (10,'test of backup',4,256,50,'Internal_Infrastructure','fdvdfvffv','eamonnkillian@gmail.com','2014-05-24 19:28:27');
/*!40000 ALTER TABLE `backup_service_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backup_service_products_sales`
--

DROP TABLE IF EXISTS `backup_service_products_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backup_service_products_sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(45) DEFAULT NULL,
  `service_start_date` varchar(10) DEFAULT NULL,
  `service_finish_date` varchar(10) DEFAULT NULL,
  `purchased_qty` int(6) DEFAULT NULL,
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backup_service_products_sales`
--

LOCK TABLES `backup_service_products_sales` WRITE;
/*!40000 ALTER TABLE `backup_service_products_sales` DISABLE KEYS */;
/*!40000 ALTER TABLE `backup_service_products_sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bandwidth`
--

DROP TABLE IF EXISTS `bandwidth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bandwidth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bandwidth_type` varchar(45) DEFAULT NULL,
  `assignment` varchar(11) DEFAULT NULL,
  `currency` varchar(8) DEFAULT NULL,
  `bandwidth_purchase_date` varchar(10) DEFAULT NULL,
  `bandwidth_available_gbps` float(4,2) DEFAULT '0.00',
  `bandwidth_location` varchar(45) DEFAULT NULL,
  `bandwidth_cost_pa` float(10,2) DEFAULT '0.00',
  `bandwidth_maintenance_support_cost` float(10,2) DEFAULT '0.00',
  `bandwidth_lifespan` int(6) DEFAULT '0',
  `bandwidth_qty` int(6) DEFAULT '0',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COMMENT='cost_input';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bandwidth`
--

LOCK TABLES `bandwidth` WRITE;
/*!40000 ALTER TABLE `bandwidth` DISABLE KEYS */;
INSERT INTO `bandwidth` VALUES (1,'Multi-Links','Production','GBP','01/01/2014',1.50,'DC 1',3500.00,0.00,10,2,'eamonnkillian@gmail.com','2014-05-24 10:10:27'),(2,'another test','Production','GBP','01/01/2014',3.60,'DC 1',10000.00,0.00,0,1,'eamonnkillian@gmail.com','2014-05-24 15:53:46');
/*!40000 ALTER TABLE `bandwidth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bandwidth_service_products`
--

DROP TABLE IF EXISTS `bandwidth_service_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bandwidth_service_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(45) DEFAULT NULL,
  `amount_of_bandwidth` int(6) DEFAULT '0',
  `product_source` varchar(23) DEFAULT NULL,
  `description` blob,
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bandwidth_service_products`
--

LOCK TABLES `bandwidth_service_products` WRITE;
/*!40000 ALTER TABLE `bandwidth_service_products` DISABLE KEYS */;
INSERT INTO `bandwidth_service_products` VALUES (11,'test of bandwidth srv',25,'Internal_Infrastructure','gfgf','eamonnkillian@gmail.com','2014-05-24 19:21:08'),(12,'virtual networks',55,'Internal_Infrastructure','fsdsgfbg','eamonnkillian@gmail.com','2014-05-25 12:33:58');
/*!40000 ALTER TABLE `bandwidth_service_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bandwidth_service_products_sales`
--

DROP TABLE IF EXISTS `bandwidth_service_products_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bandwidth_service_products_sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(45) DEFAULT NULL,
  `service_start_date` varchar(10) DEFAULT NULL,
  `service_finish_date` varchar(10) DEFAULT NULL,
  `purchased_qty` int(6) DEFAULT NULL,
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bandwidth_service_products_sales`
--

LOCK TABLES `bandwidth_service_products_sales` WRITE;
/*!40000 ALTER TABLE `bandwidth_service_products_sales` DISABLE KEYS */;
/*!40000 ALTER TABLE `bandwidth_service_products_sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `benchmarking_charges`
--

DROP TABLE IF EXISTS `benchmarking_charges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `benchmarking_charges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_currency` varchar(4) DEFAULT 'GBP',
  `2014` float(10,2) NOT NULL DEFAULT '0.00',
  `2015` float(10,2) NOT NULL DEFAULT '0.00',
  `2016` float(10,2) NOT NULL DEFAULT '0.00',
  `2017` float(10,2) NOT NULL DEFAULT '0.00',
  `2018` float(10,2) NOT NULL DEFAULT '0.00',
  `2019` float(10,2) NOT NULL DEFAULT '0.00',
  `2020` float(10,2) NOT NULL DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `benchmarking_charges`
--

LOCK TABLES `benchmarking_charges` WRITE;
/*!40000 ALTER TABLE `benchmarking_charges` DISABLE KEYS */;
INSERT INTO `benchmarking_charges` VALUES (3,'GBP',0.00,0.00,0.00,0.00,0.00,0.00,0.00,NULL,'2014-04-19 10:19:21');
/*!40000 ALTER TABLE `benchmarking_charges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand_awareness_budget`
--

DROP TABLE IF EXISTS `brand_awareness_budget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brand_awareness_budget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_currency` varchar(4) DEFAULT 'GBP',
  `2014` float(10,2) NOT NULL DEFAULT '0.00',
  `2015` float(10,2) NOT NULL DEFAULT '0.00',
  `2016` float(10,2) NOT NULL DEFAULT '0.00',
  `2017` float(10,2) NOT NULL DEFAULT '0.00',
  `2018` float(10,2) NOT NULL DEFAULT '0.00',
  `2019` float(10,2) NOT NULL DEFAULT '0.00',
  `2020` float(10,2) NOT NULL DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand_awareness_budget`
--

LOCK TABLES `brand_awareness_budget` WRITE;
/*!40000 ALTER TABLE `brand_awareness_budget` DISABLE KEYS */;
INSERT INTO `brand_awareness_budget` VALUES (3,'GBP',0.00,0.00,0.00,0.00,0.00,0.00,0.00,'eamonnkillian@gmail.com','2014-04-29 10:04:44');
/*!40000 ALTER TABLE `brand_awareness_budget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_continuity_plan_maintenance`
--

DROP TABLE IF EXISTS `business_continuity_plan_maintenance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business_continuity_plan_maintenance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_currency` varchar(4) DEFAULT 'GBP',
  `2014` float(10,2) NOT NULL DEFAULT '0.00',
  `2015` float(10,2) NOT NULL DEFAULT '0.00',
  `2016` float(10,2) NOT NULL DEFAULT '0.00',
  `2017` float(10,2) NOT NULL DEFAULT '0.00',
  `2018` float(10,2) NOT NULL DEFAULT '0.00',
  `2019` float(10,2) NOT NULL DEFAULT '0.00',
  `2020` float(10,2) NOT NULL DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_continuity_plan_maintenance`
--

LOCK TABLES `business_continuity_plan_maintenance` WRITE;
/*!40000 ALTER TABLE `business_continuity_plan_maintenance` DISABLE KEYS */;
INSERT INTO `business_continuity_plan_maintenance` VALUES (3,'GBP',0.00,0.00,0.00,0.00,0.00,0.00,0.00,NULL,'2014-04-19 10:19:32');
/*!40000 ALTER TABLE `business_continuity_plan_maintenance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_continuity_testing`
--

DROP TABLE IF EXISTS `business_continuity_testing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business_continuity_testing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_currency` varchar(4) DEFAULT 'GBP',
  `2014` float(10,2) NOT NULL DEFAULT '0.00',
  `2015` float(10,2) NOT NULL DEFAULT '0.00',
  `2016` float(10,2) NOT NULL DEFAULT '0.00',
  `2017` float(10,2) NOT NULL DEFAULT '0.00',
  `2018` float(10,2) NOT NULL DEFAULT '0.00',
  `2019` float(10,2) NOT NULL DEFAULT '0.00',
  `2020` float(10,2) NOT NULL DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_continuity_testing`
--

LOCK TABLES `business_continuity_testing` WRITE;
/*!40000 ALTER TABLE `business_continuity_testing` DISABLE KEYS */;
INSERT INTO `business_continuity_testing` VALUES (3,'GBP',0.00,0.00,0.00,0.00,0.00,0.00,0.00,NULL,'2014-04-19 10:19:48');
/*!40000 ALTER TABLE `business_continuity_testing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `byod_service_products`
--

DROP TABLE IF EXISTS `byod_service_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `byod_service_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(45) DEFAULT NULL,
  `amount_of_VMs` int(6) DEFAULT '0',
  `amount_of_memory_MBs` int(6) DEFAULT '0',
  `amount_of_storage_GBs` int(6) DEFAULT '0',
  `product_source` varchar(23) DEFAULT NULL,
  `description` blob,
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `byod_service_products`
--

LOCK TABLES `byod_service_products` WRITE;
/*!40000 ALTER TABLE `byod_service_products` DISABLE KEYS */;
INSERT INTO `byod_service_products` VALUES (10,'TEst of BYOD',1,128,50,'Internal_Infrastructure','kjnjkjkj','eamonnkillian@gmail.com','2014-05-23 12:50:43');
/*!40000 ALTER TABLE `byod_service_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `byod_service_products_sales`
--

DROP TABLE IF EXISTS `byod_service_products_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `byod_service_products_sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(45) DEFAULT NULL,
  `service_start_date` varchar(10) DEFAULT NULL,
  `service_finish_date` varchar(10) DEFAULT NULL,
  `purchased_qty` int(6) DEFAULT NULL,
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `byod_service_products_sales`
--

LOCK TABLES `byod_service_products_sales` WRITE;
/*!40000 ALTER TABLE `byod_service_products_sales` DISABLE KEYS */;
/*!40000 ALTER TABLE `byod_service_products_sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cables`
--

DROP TABLE IF EXISTS `cables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cables_type` varchar(45) DEFAULT NULL,
  `assignment` varchar(11) DEFAULT NULL,
  `currency` varchar(4) DEFAULT NULL,
  `cables_purchase_date` varchar(10) DEFAULT NULL,
  `cables_location` varchar(45) DEFAULT NULL,
  `cables_cost` float(10,2) DEFAULT NULL,
  `cables_lifespan` int(6) DEFAULT NULL,
  `cables_qty` int(6) DEFAULT NULL,
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='cost_input';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cables`
--

LOCK TABLES `cables` WRITE;
/*!40000 ALTER TABLE `cables` DISABLE KEYS */;
/*!40000 ALTER TABLE `cables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certifications`
--

DROP TABLE IF EXISTS `certifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_currency` varchar(4) DEFAULT 'GBP',
  `ISO27001` float DEFAULT NULL,
  `SAS70` float DEFAULT NULL,
  `SSAE16` float DEFAULT NULL,
  `PCIDSS` float DEFAULT NULL,
  `NORLAND` float DEFAULT NULL,
  `DDOD8570` float DEFAULT NULL,
  `FIPS` float DEFAULT NULL,
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certifications`
--

LOCK TABLES `certifications` WRITE;
/*!40000 ALTER TABLE `certifications` DISABLE KEYS */;
INSERT INTO `certifications` VALUES (1,'GBP',12000,0,0,0,0,0,0,'eamonnkillian@gmail.com','2014-04-30 13:09:24');
/*!40000 ALTER TABLE `certifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `change_administration`
--

DROP TABLE IF EXISTS `change_administration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `change_administration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_currency` varchar(4) DEFAULT 'GBP',
  `2014` float(10,2) NOT NULL DEFAULT '0.00',
  `2015` float(10,2) NOT NULL DEFAULT '0.00',
  `2016` float(10,2) NOT NULL DEFAULT '0.00',
  `2017` float(10,2) NOT NULL DEFAULT '0.00',
  `2018` float(10,2) NOT NULL DEFAULT '0.00',
  `2019` float(10,2) NOT NULL DEFAULT '0.00',
  `2020` float(10,2) NOT NULL DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `change_administration`
--

LOCK TABLES `change_administration` WRITE;
/*!40000 ALTER TABLE `change_administration` DISABLE KEYS */;
INSERT INTO `change_administration` VALUES (3,'GBP',0.00,0.00,0.00,0.00,0.00,0.00,0.00,NULL,'2014-04-19 10:20:24');
/*!40000 ALTER TABLE `change_administration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `change_management`
--

DROP TABLE IF EXISTS `change_management`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `change_management` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_currency` varchar(4) DEFAULT 'GBP',
  `2014` float(10,2) NOT NULL DEFAULT '0.00',
  `2015` float(10,2) NOT NULL DEFAULT '0.00',
  `2016` float(10,2) NOT NULL DEFAULT '0.00',
  `2017` float(10,2) NOT NULL DEFAULT '0.00',
  `2018` float(10,2) NOT NULL DEFAULT '0.00',
  `2019` float(10,2) NOT NULL DEFAULT '0.00',
  `2020` float(10,2) NOT NULL DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `change_management`
--

LOCK TABLES `change_management` WRITE;
/*!40000 ALTER TABLE `change_management` DISABLE KEYS */;
INSERT INTO `change_management` VALUES (3,'GBP',0.00,0.00,0.00,0.00,0.00,0.00,0.00,NULL,'2014-04-19 10:20:14');
/*!40000 ALTER TABLE `change_management` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel_advertising_budget`
--

DROP TABLE IF EXISTS `channel_advertising_budget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel_advertising_budget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_currency` varchar(4) DEFAULT 'GBP',
  `2014` float(10,2) NOT NULL DEFAULT '0.00',
  `2015` float(10,2) NOT NULL DEFAULT '0.00',
  `2016` float(10,2) NOT NULL DEFAULT '0.00',
  `2017` float(10,2) NOT NULL DEFAULT '0.00',
  `2018` float(10,2) NOT NULL DEFAULT '0.00',
  `2019` float(10,2) NOT NULL DEFAULT '0.00',
  `2020` float(10,2) NOT NULL DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel_advertising_budget`
--

LOCK TABLES `channel_advertising_budget` WRITE;
/*!40000 ALTER TABLE `channel_advertising_budget` DISABLE KEYS */;
INSERT INTO `channel_advertising_budget` VALUES (3,'GBP',8000.00,0.00,10000.00,0.00,0.00,0.00,0.00,'eamonnkillian@gmail.com','2014-05-04 14:04:47');
/*!40000 ALTER TABLE `channel_advertising_budget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel_business_development_plan`
--

DROP TABLE IF EXISTS `channel_business_development_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel_business_development_plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `2014` float(10,2) NOT NULL DEFAULT '0.00',
  `2015` float(10,2) NOT NULL DEFAULT '0.00',
  `2016` float(10,2) NOT NULL DEFAULT '0.00',
  `2017` float(10,2) NOT NULL DEFAULT '0.00',
  `2018` float(10,2) NOT NULL DEFAULT '0.00',
  `2019` float(10,2) NOT NULL DEFAULT '0.00',
  `2020` float(10,2) NOT NULL DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel_business_development_plan`
--

LOCK TABLES `channel_business_development_plan` WRITE;
/*!40000 ALTER TABLE `channel_business_development_plan` DISABLE KEYS */;
INSERT INTO `channel_business_development_plan` VALUES (3,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'eamonnkillian@gmail.com','2014-04-29 10:07:04');
/*!40000 ALTER TABLE `channel_business_development_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel_certification_courses`
--

DROP TABLE IF EXISTS `channel_certification_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel_certification_courses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_currency` varchar(4) DEFAULT 'GBP',
  `2014` float(10,2) NOT NULL DEFAULT '0.00',
  `2015` float(10,2) NOT NULL DEFAULT '0.00',
  `2016` float(10,2) NOT NULL DEFAULT '0.00',
  `2017` float(10,2) NOT NULL DEFAULT '0.00',
  `2018` float(10,2) NOT NULL DEFAULT '0.00',
  `2019` float(10,2) NOT NULL DEFAULT '0.00',
  `2020` float(10,2) NOT NULL DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel_certification_courses`
--

LOCK TABLES `channel_certification_courses` WRITE;
/*!40000 ALTER TABLE `channel_certification_courses` DISABLE KEYS */;
INSERT INTO `channel_certification_courses` VALUES (3,'GBP',0.00,0.00,0.00,0.00,0.00,0.00,0.00,'eamonnkillian@gmail.com','2014-04-29 10:07:15');
/*!40000 ALTER TABLE `channel_certification_courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel_credit_evaluation`
--

DROP TABLE IF EXISTS `channel_credit_evaluation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel_credit_evaluation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_currency` varchar(4) DEFAULT 'GBP',
  `2014` float(10,2) NOT NULL DEFAULT '0.00',
  `2015` float(10,2) NOT NULL DEFAULT '0.00',
  `2016` float(10,2) NOT NULL DEFAULT '0.00',
  `2017` float(10,2) NOT NULL DEFAULT '0.00',
  `2018` float(10,2) NOT NULL DEFAULT '0.00',
  `2019` float(10,2) NOT NULL DEFAULT '0.00',
  `2020` float(10,2) NOT NULL DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel_credit_evaluation`
--

LOCK TABLES `channel_credit_evaluation` WRITE;
/*!40000 ALTER TABLE `channel_credit_evaluation` DISABLE KEYS */;
INSERT INTO `channel_credit_evaluation` VALUES (3,'GBP',0.00,0.00,0.00,0.00,0.00,0.00,0.00,'eamonnkillian@gmail.com','2014-04-29 10:07:28');
/*!40000 ALTER TABLE `channel_credit_evaluation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel_legal_expenses`
--

DROP TABLE IF EXISTS `channel_legal_expenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel_legal_expenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_currency` varchar(4) DEFAULT 'GBP',
  `2014` float(10,2) NOT NULL DEFAULT '0.00',
  `2015` float(10,2) NOT NULL DEFAULT '0.00',
  `2016` float(10,2) NOT NULL DEFAULT '0.00',
  `2017` float(10,2) NOT NULL DEFAULT '0.00',
  `2018` float(10,2) NOT NULL DEFAULT '0.00',
  `2019` float(10,2) NOT NULL DEFAULT '0.00',
  `2020` float(10,2) NOT NULL DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel_legal_expenses`
--

LOCK TABLES `channel_legal_expenses` WRITE;
/*!40000 ALTER TABLE `channel_legal_expenses` DISABLE KEYS */;
INSERT INTO `channel_legal_expenses` VALUES (3,'GBP',0.00,2500.00,0.00,0.00,0.00,0.00,0.00,'eamonnkillian@gmail.com','2014-05-04 14:04:34');
/*!40000 ALTER TABLE `channel_legal_expenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel_marketing_support`
--

DROP TABLE IF EXISTS `channel_marketing_support`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel_marketing_support` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_currency` varchar(4) DEFAULT 'GBP',
  `2014` float(10,2) NOT NULL DEFAULT '0.00',
  `2015` float(10,2) NOT NULL DEFAULT '0.00',
  `2016` float(10,2) NOT NULL DEFAULT '0.00',
  `2017` float(10,2) NOT NULL DEFAULT '0.00',
  `2018` float(10,2) NOT NULL DEFAULT '0.00',
  `2019` float(10,2) NOT NULL DEFAULT '0.00',
  `2020` float(10,2) NOT NULL DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel_marketing_support`
--

LOCK TABLES `channel_marketing_support` WRITE;
/*!40000 ALTER TABLE `channel_marketing_support` DISABLE KEYS */;
INSERT INTO `channel_marketing_support` VALUES (3,'GBP',0.00,0.00,0.00,0.00,0.00,0.00,0.00,NULL,'2014-04-18 20:42:38');
/*!40000 ALTER TABLE `channel_marketing_support` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel_professional_bodies_membership`
--

DROP TABLE IF EXISTS `channel_professional_bodies_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel_professional_bodies_membership` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_currency` varchar(4) DEFAULT 'GBP',
  `2014` float(10,2) NOT NULL DEFAULT '0.00',
  `2015` float(10,2) NOT NULL DEFAULT '0.00',
  `2016` float(10,2) NOT NULL DEFAULT '0.00',
  `2017` float(10,2) NOT NULL DEFAULT '0.00',
  `2018` float(10,2) NOT NULL DEFAULT '0.00',
  `2019` float(10,2) NOT NULL DEFAULT '0.00',
  `2020` float(10,2) NOT NULL DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel_professional_bodies_membership`
--

LOCK TABLES `channel_professional_bodies_membership` WRITE;
/*!40000 ALTER TABLE `channel_professional_bodies_membership` DISABLE KEYS */;
INSERT INTO `channel_professional_bodies_membership` VALUES (3,'GBP',0.00,0.00,0.00,0.00,0.00,0.00,0.00,NULL,'2014-04-18 20:44:41');
/*!40000 ALTER TABLE `channel_professional_bodies_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel_security_budget`
--

DROP TABLE IF EXISTS `channel_security_budget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel_security_budget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_currency` varchar(4) DEFAULT 'GBP',
  `2014` float(10,2) NOT NULL DEFAULT '0.00',
  `2015` float(10,2) NOT NULL DEFAULT '0.00',
  `2016` float(10,2) NOT NULL DEFAULT '0.00',
  `2017` float(10,2) NOT NULL DEFAULT '0.00',
  `2018` float(10,2) NOT NULL DEFAULT '0.00',
  `2019` float(10,2) NOT NULL DEFAULT '0.00',
  `2020` float(10,2) NOT NULL DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel_security_budget`
--

LOCK TABLES `channel_security_budget` WRITE;
/*!40000 ALTER TABLE `channel_security_budget` DISABLE KEYS */;
INSERT INTO `channel_security_budget` VALUES (3,'GBP',0.00,0.00,0.00,0.00,0.00,0.00,0.00,'eamonnkillian@gmail.com','2014-04-29 10:07:43');
/*!40000 ALTER TABLE `channel_security_budget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel_training_budget`
--

DROP TABLE IF EXISTS `channel_training_budget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel_training_budget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_currency` varchar(4) DEFAULT 'GBP',
  `2014` float(10,2) NOT NULL DEFAULT '0.00',
  `2015` float(10,2) NOT NULL DEFAULT '0.00',
  `2016` float(10,2) NOT NULL DEFAULT '0.00',
  `2017` float(10,2) NOT NULL DEFAULT '0.00',
  `2018` float(10,2) NOT NULL DEFAULT '0.00',
  `2019` float(10,2) NOT NULL DEFAULT '0.00',
  `2020` float(10,2) NOT NULL DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel_training_budget`
--

LOCK TABLES `channel_training_budget` WRITE;
/*!40000 ALTER TABLE `channel_training_budget` DISABLE KEYS */;
INSERT INTO `channel_training_budget` VALUES (3,'GBP',4000.00,0.00,0.00,0.00,0.00,0.00,0.00,'phil@niu.com','2014-05-03 10:04:18');
/*!40000 ALTER TABLE `channel_training_budget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cloudprovider`
--

DROP TABLE IF EXISTS `cloudprovider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cloudprovider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cloudprovider_name` varchar(45) DEFAULT NULL,
  `cloudprovider_web_address` varchar(45) DEFAULT NULL,
  `street_number` varchar(8) DEFAULT NULL,
  `street_address_1` varchar(45) DEFAULT NULL,
  `street_address_2` varchar(45) DEFAULT NULL,
  `street_address_3` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `currency` varchar(45) DEFAULT NULL,
  `post_code` varchar(8) DEFAULT NULL,
  `company_number` int(15) DEFAULT '0',
  `VAT_number` int(15) DEFAULT '0',
  `primary_telephone` varchar(15) DEFAULT NULL,
  `secondary_telephone` varchar(15) DEFAULT NULL,
  `fax_number` varchar(15) DEFAULT NULL,
  `relationship_description` blob,
  `cloudprovider_email` varchar(45) DEFAULT NULL,
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cloudprovider`
--

LOCK TABLES `cloudprovider` WRITE;
/*!40000 ALTER TABLE `cloudprovider` DISABLE KEYS */;
INSERT INTO `cloudprovider` VALUES (9,'Joyent','www.joyent.com','','','','','','United Kindom','GBP','',123456,123456,'01234567890','01234567890','01234567890','','ee@ee.com','eamonnkillian@gmail.com','2014-04-30 13:05:11'),(10,'Amazon','www.aws.com','','','','','','United Kindom','GBP','',123456,123456,'01234567890','01234567890','01234567890','','ee@eeeee.com','eamonnkillian@gmail.com','2014-05-15 12:21:58'),(11,'Amanda','www.amanda.com','','','','','','United Kindom','GBP','',123456,123456,'01234567890','01234567890','01234567890','','amanda@amanda.com','eamonnkillian@gmail.com','2014-05-21 14:06:10');
/*!40000 ALTER TABLE `cloudprovider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `competition_research_budget`
--

DROP TABLE IF EXISTS `competition_research_budget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `competition_research_budget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_currency` varchar(4) DEFAULT 'GBP',
  `2014` float(10,2) NOT NULL DEFAULT '0.00',
  `2015` float(10,2) NOT NULL DEFAULT '0.00',
  `2016` float(10,2) NOT NULL DEFAULT '0.00',
  `2017` float(10,2) NOT NULL DEFAULT '0.00',
  `2018` float(10,2) NOT NULL DEFAULT '0.00',
  `2019` float(10,2) NOT NULL DEFAULT '0.00',
  `2020` float(10,2) NOT NULL DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competition_research_budget`
--

LOCK TABLES `competition_research_budget` WRITE;
/*!40000 ALTER TABLE `competition_research_budget` DISABLE KEYS */;
INSERT INTO `competition_research_budget` VALUES (3,'USD',0.00,0.00,0.00,0.00,0.00,0.00,0.00,'eamonnkillian@gmail.com','2014-04-25 11:41:22');
/*!40000 ALTER TABLE `competition_research_budget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `competitive_intelligence_budget`
--

DROP TABLE IF EXISTS `competitive_intelligence_budget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `competitive_intelligence_budget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_currency` varchar(4) DEFAULT 'GBP',
  `2014` float(10,2) NOT NULL DEFAULT '0.00',
  `2015` float(10,2) NOT NULL DEFAULT '0.00',
  `2016` float(10,2) NOT NULL DEFAULT '0.00',
  `2017` float(10,2) NOT NULL DEFAULT '0.00',
  `2018` float(10,2) NOT NULL DEFAULT '0.00',
  `2019` float(10,2) NOT NULL DEFAULT '0.00',
  `2020` float(10,2) NOT NULL DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competitive_intelligence_budget`
--

LOCK TABLES `competitive_intelligence_budget` WRITE;
/*!40000 ALTER TABLE `competitive_intelligence_budget` DISABLE KEYS */;
INSERT INTO `competitive_intelligence_budget` VALUES (3,'JPY',0.00,0.00,0.00,0.00,0.00,0.00,0.00,'eamonnkillian@gmail.com','2014-04-29 10:02:55');
/*!40000 ALTER TABLE `competitive_intelligence_budget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conference_attendance`
--

DROP TABLE IF EXISTS `conference_attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conference_attendance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_currency` varchar(4) DEFAULT 'GBP',
  `2014` float(10,2) NOT NULL DEFAULT '0.00',
  `2015` float(10,2) NOT NULL DEFAULT '0.00',
  `2016` float(10,2) NOT NULL DEFAULT '0.00',
  `2017` float(10,2) NOT NULL DEFAULT '0.00',
  `2018` float(10,2) NOT NULL DEFAULT '0.00',
  `2019` float(10,2) NOT NULL DEFAULT '0.00',
  `2020` float(10,2) NOT NULL DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conference_attendance`
--

LOCK TABLES `conference_attendance` WRITE;
/*!40000 ALTER TABLE `conference_attendance` DISABLE KEYS */;
INSERT INTO `conference_attendance` VALUES (3,'GBP',15000.00,0.00,0.00,0.00,0.00,0.00,0.00,'phil@niu.com','2014-05-03 10:03:21');
/*!40000 ALTER TABLE `conference_attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `confidentiality_obligations`
--

DROP TABLE IF EXISTS `confidentiality_obligations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `confidentiality_obligations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_currency` varchar(4) DEFAULT 'GBP',
  `2014` float(10,2) NOT NULL DEFAULT '0.00',
  `2015` float(10,2) NOT NULL DEFAULT '0.00',
  `2016` float(10,2) NOT NULL DEFAULT '0.00',
  `2017` float(10,2) NOT NULL DEFAULT '0.00',
  `2018` float(10,2) NOT NULL DEFAULT '0.00',
  `2019` float(10,2) NOT NULL DEFAULT '0.00',
  `2020` float(10,2) NOT NULL DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `confidentiality_obligations`
--

LOCK TABLES `confidentiality_obligations` WRITE;
/*!40000 ALTER TABLE `confidentiality_obligations` DISABLE KEYS */;
INSERT INTO `confidentiality_obligations` VALUES (3,'GBP',0.00,0.00,0.00,0.00,0.00,0.00,0.00,NULL,'2014-04-19 10:21:18');
/*!40000 ALTER TABLE `confidentiality_obligations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consents_maintenance`
--

DROP TABLE IF EXISTS `consents_maintenance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consents_maintenance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_currency` varchar(4) DEFAULT 'GBP',
  `2014` float(10,2) NOT NULL DEFAULT '0.00',
  `2015` float(10,2) NOT NULL DEFAULT '0.00',
  `2016` float(10,2) NOT NULL DEFAULT '0.00',
  `2017` float(10,2) NOT NULL DEFAULT '0.00',
  `2018` float(10,2) NOT NULL DEFAULT '0.00',
  `2019` float(10,2) NOT NULL DEFAULT '0.00',
  `2020` float(10,2) NOT NULL DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consents_maintenance`
--

LOCK TABLES `consents_maintenance` WRITE;
/*!40000 ALTER TABLE `consents_maintenance` DISABLE KEYS */;
INSERT INTO `consents_maintenance` VALUES (3,'GBP',0.00,0.00,0.00,0.00,0.00,0.00,0.00,NULL,'2014-04-19 10:19:05');
/*!40000 ALTER TABLE `consents_maintenance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consulting_service_products`
--

DROP TABLE IF EXISTS `consulting_service_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consulting_service_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(45) DEFAULT NULL,
  `amount_of_person_days` int(6) DEFAULT '0',
  `description` blob,
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consulting_service_products`
--

LOCK TABLES `consulting_service_products` WRITE;
/*!40000 ALTER TABLE `consulting_service_products` DISABLE KEYS */;
INSERT INTO `consulting_service_products` VALUES (9,'test of consult',55,'cvxvvf','eamonnkillian@gmail.com','2014-05-24 10:19:26'),(10,'another trst of this',35,'fgbgfbgb','eamonnkillian@gmail.com','2014-05-25 10:00:05');
/*!40000 ALTER TABLE `consulting_service_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consulting_service_products_sales`
--

DROP TABLE IF EXISTS `consulting_service_products_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consulting_service_products_sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(45) DEFAULT NULL,
  `service_start_date` varchar(10) DEFAULT NULL,
  `service_finish_date` varchar(10) DEFAULT NULL,
  `purchased_qty` int(6) DEFAULT NULL,
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consulting_service_products_sales`
--

LOCK TABLES `consulting_service_products_sales` WRITE;
/*!40000 ALTER TABLE `consulting_service_products_sales` DISABLE KEYS */;
/*!40000 ALTER TABLE `consulting_service_products_sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contingency_fund`
--

DROP TABLE IF EXISTS `contingency_fund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contingency_fund` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_currency` varchar(4) DEFAULT 'GBP',
  `2014` float(10,2) NOT NULL DEFAULT '0.00',
  `2015` float(10,2) NOT NULL DEFAULT '0.00',
  `2016` float(10,2) NOT NULL DEFAULT '0.00',
  `2017` float(10,2) NOT NULL DEFAULT '0.00',
  `2018` float(10,2) NOT NULL DEFAULT '0.00',
  `2019` float(10,2) NOT NULL DEFAULT '0.00',
  `2020` float(10,2) NOT NULL DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contingency_fund`
--

LOCK TABLES `contingency_fund` WRITE;
/*!40000 ALTER TABLE `contingency_fund` DISABLE KEYS */;
INSERT INTO `contingency_fund` VALUES (3,'GBP',2500.00,0.00,0.00,0.00,0.00,0.00,0.00,'phil@niu.com','2014-05-03 10:03:01');
/*!40000 ALTER TABLE `contingency_fund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `continuous_form`
--

DROP TABLE IF EXISTS `continuous_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `continuous_form` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `printer_type` varchar(45) DEFAULT NULL,
  `currency` varchar(8) DEFAULT NULL,
  `printer_purchase_date` varchar(10) DEFAULT NULL,
  `printer_location` varchar(45) DEFAULT NULL,
  `colour` varchar(4) DEFAULT NULL,
  `printer_cost` float DEFAULT NULL,
  `printer_maintenance_cost_per_annum` float DEFAULT NULL,
  `printer_maintenance_term` int(11) DEFAULT NULL,
  `printer_lifespan` varchar(45) DEFAULT NULL,
  `printer_power_consumption` float DEFAULT NULL,
  `printer_consumables_cost` float(10,2) DEFAULT '0.00',
  `estimated_consumables_qty` int(6) DEFAULT '0',
  `printer_qty` int(11) DEFAULT NULL,
  `printer_disposal_cost` float(10,2) DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='cost_input';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `continuous_form`
--

LOCK TABLES `continuous_form` WRITE;
/*!40000 ALTER TABLE `continuous_form` DISABLE KEYS */;
/*!40000 ALTER TABLE `continuous_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contract_administration`
--

DROP TABLE IF EXISTS `contract_administration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contract_administration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_currency` varchar(4) DEFAULT 'GBP',
  `2014` float(10,2) NOT NULL DEFAULT '0.00',
  `2015` float(10,2) NOT NULL DEFAULT '0.00',
  `2016` float(10,2) NOT NULL DEFAULT '0.00',
  `2017` float(10,2) NOT NULL DEFAULT '0.00',
  `2018` float(10,2) NOT NULL DEFAULT '0.00',
  `2019` float(10,2) NOT NULL DEFAULT '0.00',
  `2020` float(10,2) NOT NULL DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contract_administration`
--

LOCK TABLES `contract_administration` WRITE;
/*!40000 ALTER TABLE `contract_administration` DISABLE KEYS */;
INSERT INTO `contract_administration` VALUES (3,'USD',0.00,0.00,0.00,0.00,0.00,0.00,0.00,'eamonnkillian@gmail.com','2014-04-29 10:08:19');
/*!40000 ALTER TABLE `contract_administration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contract_governance`
--

DROP TABLE IF EXISTS `contract_governance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contract_governance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_currency` varchar(4) DEFAULT 'GBP',
  `2014` float(10,2) NOT NULL DEFAULT '0.00',
  `2015` float(10,2) NOT NULL DEFAULT '0.00',
  `2016` float(10,2) NOT NULL DEFAULT '0.00',
  `2017` float(10,2) NOT NULL DEFAULT '0.00',
  `2018` float(10,2) NOT NULL DEFAULT '0.00',
  `2019` float(10,2) NOT NULL DEFAULT '0.00',
  `2020` float(10,2) NOT NULL DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contract_governance`
--

LOCK TABLES `contract_governance` WRITE;
/*!40000 ALTER TABLE `contract_governance` DISABLE KEYS */;
INSERT INTO `contract_governance` VALUES (3,'GBP',0.00,0.00,0.00,0.00,0.00,0.00,0.00,'eamonnkillian@gmail.com','2014-04-29 10:08:13');
/*!40000 ALTER TABLE `contract_governance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `costsperUnit`
--

DROP TABLE IF EXISTS `costsperUnit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `costsperUnit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `perVM` float(10,2) DEFAULT NULL,
  `perGB` float(10,2) DEFAULT NULL,
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `costsperUnit`
--

LOCK TABLES `costsperUnit` WRITE;
/*!40000 ALTER TABLE `costsperUnit` DISABLE KEYS */;
INSERT INTO `costsperUnit` VALUES (1,141.49,0.11,'eamonnkillian@gmail.com','2014-05-20 14:31:59'),(2,141.49,0.11,'eamonnkillian@gmail.com','2014-05-21 10:07:31'),(3,141.49,0.11,'eamonnkillian@gmail.com','2014-05-21 13:48:27'),(4,27.01,0.12,'eamonnkillian@gmail.com','2014-05-21 13:54:36'),(5,10.48,0.12,'eamonnkillian@gmail.com','2014-05-21 13:57:00'),(6,9.71,0.11,'eamonnkillian@gmail.com','2014-05-21 13:59:52'),(7,9.71,0.11,'eamonnkillian@gmail.com','2014-05-21 14:02:37'),(8,9.71,0.11,'eamonnkillian@gmail.com','2014-05-21 14:04:19'),(9,9.71,0.11,'eamonnkillian@gmail.com','2014-05-21 14:04:36'),(10,10.12,0.12,'eamonnkillian@gmail.com','2014-05-21 14:07:25'),(11,10.12,0.12,'eamonnkillian@gmail.com','2014-05-22 06:05:17'),(12,10.12,0.12,'eamonnkillian@gmail.com','2014-05-22 06:06:01'),(13,10.12,0.12,'eamonnkillian@gmail.com','2014-05-22 06:06:38'),(14,10.12,0.12,'eamonnkillian@gmail.com','2014-05-22 16:29:43'),(15,10.12,0.12,'eamonnkillian@gmail.com','2014-05-22 16:44:13'),(16,10.12,0.12,'eamonnkillian@gmail.com','2014-05-23 09:30:45'),(17,10.16,0.12,'eamonnkillian@gmail.com','2014-05-24 10:23:41'),(18,16.98,0.19,'eamonnkillian@gmail.com','2014-05-25 21:32:05'),(19,16.98,0.19,'','2014-05-25 21:32:32'),(20,16.98,0.19,'','2014-05-26 06:10:43'),(21,16.98,0.19,'','2014-05-26 06:10:48'),(22,16.98,0.19,'','2014-05-26 06:11:01'),(23,16.98,0.19,'eamonnkillian@gmail.com','2014-05-26 06:12:51'),(24,16.98,0.19,'eamonnkillian@gmail.com','2014-05-26 06:13:47'),(25,16.98,0.19,'','2014-05-26 06:14:06'),(26,16.98,0.19,'eamonnkillian@gmail.com','2014-05-26 06:14:50'),(27,16.98,0.19,'eamonnkillian@gmail.com','2014-05-26 06:19:28'),(28,16.98,0.19,'eamonnkillian@gmail.com','2014-05-26 06:20:18'),(29,16.98,0.19,'','2014-05-26 06:25:30'),(30,16.98,0.19,'','2014-05-26 06:25:41'),(31,16.98,0.19,'eamonnkillian@gmail.com','2014-05-26 06:29:41'),(32,16.98,0.19,'','2014-05-26 06:30:11'),(33,16.98,0.19,'eamonnkillian@gmail.com','2014-05-26 06:43:52'),(34,16.98,0.19,'eamonnkillian@gmail.com','2014-05-26 06:50:03'),(35,16.98,0.19,'eamonnkillian@gmail.com','2014-05-26 06:53:52'),(36,16.98,0.19,'eamonnkillian@gmail.com','2014-05-26 07:03:01'),(37,16.98,0.19,'eamonnkillian@gmail.com','2014-05-26 07:05:26'),(38,16.98,0.19,'eamonnkillian@gmail.com','2014-05-26 07:06:32'),(39,16.98,0.19,'eamonnkillian@gmail.com','2014-05-26 07:06:52'),(40,16.98,0.19,'','2014-05-26 07:08:40'),(41,16.98,0.19,'','2014-05-26 07:09:09'),(42,16.98,0.19,'eamonnkillian@gmail.com','2014-05-26 07:19:25'),(43,16.98,0.19,'eamonnkillian@gmail.com','2014-05-26 07:20:11'),(44,16.98,0.19,'eamonnkillian@gmail.com','2014-05-26 07:25:41'),(45,16.98,0.19,'eamonnkillian@gmail.com','2014-05-26 07:50:14'),(46,16.98,0.19,'eamonnkillian@gmail.com','2014-05-26 07:50:44'),(47,16.98,0.19,'eamonnkillian@gmail.com','2014-05-26 07:52:36'),(48,16.98,0.19,'eamonnkillian@gmail.com','2014-05-26 07:53:44'),(49,16.98,0.19,'eamonnkillian@gmail.com','2014-05-26 09:18:36'),(50,16.98,0.19,'','2014-05-26 13:50:30'),(51,16.98,0.19,'eamonnkillian@gmail.com','2014-05-26 14:19:03'),(52,16.98,0.19,'eamonnkillian@gmail.com','2014-05-26 14:22:57'),(53,16.98,0.19,'me@me.com','2014-05-26 14:23:26'),(54,16.98,0.19,'eamonnkillian@gmail.com','2014-05-26 14:29:27'),(55,16.98,0.19,'eamonnkillian@gmail.com','2014-05-26 14:30:17'),(56,16.98,0.19,'eamonnkillian@gmail.com','2014-05-26 14:35:33'),(57,16.98,0.19,'eamonnkillian@gmail.com','2014-05-26 14:36:59'),(58,16.98,0.19,'eamonnkillian@gmail.com','2014-05-26 14:48:45'),(59,16.98,0.19,'eamonnkillian@gmail.com','2014-05-26 14:53:31'),(60,16.98,0.19,'eamonnkillian@gmail.com','2014-05-26 14:57:29'),(61,16.98,0.19,'eamonnkillian@gmail.com','2014-05-27 09:25:40'),(62,16.98,0.19,'me@me.com','2014-05-27 09:26:21'),(63,16.98,0.19,'eamonnkillian@gmail.com','2014-05-27 09:27:33'),(64,16.98,0.19,'eamonnkillian@gmail.com','2014-05-27 09:51:49'),(65,16.98,0.19,'me@me.com','2014-05-27 09:58:43'),(66,16.98,0.19,'eamonnkillian@gmail.com','2014-05-27 09:59:38'),(67,16.98,0.19,'me@me.com','2014-05-27 10:08:13'),(68,16.98,0.19,'eamonnkillian@gmail.com','2014-05-27 10:14:58'),(69,16.98,0.19,'eamonnkillian@gmail.com','2014-05-28 08:54:34'),(70,16.98,0.19,'eamonnkillian@gmail.com','2014-05-28 08:55:58'),(71,16.98,0.19,'eamonnkillian@gmail.com','2014-05-28 08:58:47'),(72,16.98,0.19,'eamonnkillian@gmail.com','2014-06-13 08:50:58'),(73,16.98,0.19,'eamonnkillian@gmail.com','2014-06-21 15:28:33'),(74,16.98,0.19,'eamonnkillian@gmail.com','2014-07-01 17:17:45'),(75,16.98,0.19,'eamonnkillian@gmail.com','2014-07-15 13:47:16'),(76,16.98,0.19,'eamonnkillian@gmail.com','2014-07-15 13:48:32'),(77,16.98,0.19,'eamonnkillian@gmail.com','2014-07-24 15:45:50'),(78,16.98,0.19,'eamonnkillian@gmail.com','2014-07-24 15:46:36'),(79,16.98,0.19,'eamonnkillian@gmail.com','2014-07-25 05:51:37'),(80,16.98,0.19,'eamonnkillian@gmail.com','2014-09-12 14:01:16'),(81,16.98,0.19,'eamonnkillian@gmail.com','2014-09-12 14:03:02'),(82,16.98,0.19,'eamonnkillian@gmail.com','2014-10-07 07:51:18'),(83,16.98,0.19,'eamonnkillian@gmail.com','2014-10-09 15:56:10'),(84,16.98,0.19,'aa@aa.com','2015-04-18 08:46:19');
/*!40000 ALTER TABLE `costsperUnit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(45) DEFAULT NULL,
  `street_number` varchar(8) DEFAULT NULL,
  `street_address_1` varchar(45) DEFAULT NULL,
  `street_address_2` varchar(45) DEFAULT NULL,
  `street_address_3` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `post_code` varchar(8) DEFAULT NULL,
  `company_number` int(15) DEFAULT '0',
  `VAT_number` int(15) DEFAULT '0',
  `primary_telephone` varchar(18) DEFAULT '0',
  `secondary_telephone` varchar(18) DEFAULT '0',
  `fax_telephone` varchar(18) DEFAULT '0',
  `business_description` blob,
  `customer_email` varchar(45) DEFAULT NULL,
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cutsheet_production`
--

DROP TABLE IF EXISTS `cutsheet_production`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cutsheet_production` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `printer_type` varchar(45) DEFAULT NULL,
  `currency` varchar(8) DEFAULT NULL,
  `printer_purchase_date` varchar(10) DEFAULT NULL,
  `printer_location` varchar(45) DEFAULT NULL,
  `colour` varchar(4) DEFAULT NULL,
  `printer_cost` float DEFAULT NULL,
  `printer_maintenance_cost_per_annum` float DEFAULT NULL,
  `printer_maintenance_term` int(11) DEFAULT NULL,
  `printer_lifespan` varchar(45) DEFAULT NULL,
  `printer_power_consumption` float DEFAULT NULL,
  `printer_consumables_cost` float(10,2) DEFAULT '0.00',
  `estimated_consumables_qty` int(6) DEFAULT '0',
  `printer_qty` int(11) DEFAULT NULL,
  `printer_disposal_cost` float(10,2) DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='cost_input';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cutsheet_production`
--

LOCK TABLES `cutsheet_production` WRITE;
/*!40000 ALTER TABLE `cutsheet_production` DISABLE KEYS */;
/*!40000 ALTER TABLE `cutsheet_production` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_privacy`
--

DROP TABLE IF EXISTS `data_privacy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_privacy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_currency` varchar(4) DEFAULT 'GBP',
  `2014` float(10,2) NOT NULL DEFAULT '0.00',
  `2015` float(10,2) NOT NULL DEFAULT '0.00',
  `2016` float(10,2) NOT NULL DEFAULT '0.00',
  `2017` float(10,2) NOT NULL DEFAULT '0.00',
  `2018` float(10,2) NOT NULL DEFAULT '0.00',
  `2019` float(10,2) NOT NULL DEFAULT '0.00',
  `2020` float(10,2) NOT NULL DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_privacy`
--

LOCK TABLES `data_privacy` WRITE;
/*!40000 ALTER TABLE `data_privacy` DISABLE KEYS */;
INSERT INTO `data_privacy` VALUES (3,'GBP',0.00,0.00,0.00,0.00,0.00,0.00,0.00,NULL,'2014-04-19 10:22:30');
/*!40000 ALTER TABLE `data_privacy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `database_software`
--

DROP TABLE IF EXISTS `database_software`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `database_software` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `software_type` varchar(45) DEFAULT NULL,
  `assignment` varchar(11) DEFAULT NULL,
  `currency` varchar(45) DEFAULT NULL,
  `software_purchase_date` varchar(10) DEFAULT NULL,
  `software_name` varchar(45) DEFAULT NULL,
  `software_purchase_cost` float(10,2) DEFAULT '0.00',
  `software_annual_maintenance_cost` float(10,2) DEFAULT '0.00',
  `software_maintenance_term` int(8) DEFAULT '0',
  `software_description` blob,
  `software_location` varchar(45) DEFAULT NULL,
  `software_annual_subscription_cost` float(10,2) DEFAULT '0.00',
  `software_licences_qty` int(8) DEFAULT '0',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='cost_input';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `database_software`
--

LOCK TABLES `database_software` WRITE;
/*!40000 ALTER TABLE `database_software` DISABLE KEYS */;
/*!40000 ALTER TABLE `database_software` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcassets`
--

DROP TABLE IF EXISTS `dcassets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dcassets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assets_location` varchar(45) DEFAULT NULL,
  `currency` varchar(4) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `rent_or_depreciation_cost_pa` float(10,2) DEFAULT '0.00',
  `power_generator_cost` float(10,2) DEFAULT '0.00',
  `power_generator_qty` int(6) DEFAULT '0',
  `gas_diesel_cost_per_litre` float(10,2) DEFAULT '0.00',
  `gas_diesel_qty` int(11) DEFAULT '0',
  `ups_machine_cost` float(10,2) DEFAULT '0.00',
  `ups_machine_qty` int(11) DEFAULT '0',
  `rack_surge_protection_cost` float(10,2) DEFAULT '0.00',
  `rack_surge_protection_qty` int(11) DEFAULT '0',
  `transformers_cost` float(10,2) DEFAULT '0.00',
  `transformers_qty` int(11) DEFAULT '0',
  `circuit_breaker_cost` float(10,2) DEFAULT '0.00',
  `circuit_breaker_qty` int(11) DEFAULT '0',
  `crac_units_cost` float(10,2) DEFAULT '0.00',
  `crac_units_qty` int(11) DEFAULT '0',
  `ducting_cost_per_meter` float(10,2) DEFAULT '0.00',
  `ducting_qty` int(11) DEFAULT '0',
  `piping_cost_per_meter` float(10,2) DEFAULT '0.00',
  `piping_qty` int(11) DEFAULT '0',
  `fire_supression_system_cost` float(10,2) DEFAULT '0.00',
  `fire_prevention_system_cost` float(10,2) DEFAULT '0.00',
  `fire_detector_units_cost` float(10,2) DEFAULT '0.00',
  `fire_detector_units_qty` int(11) DEFAULT '0',
  `biometric_security_system_cost` float(10,2) DEFAULT '0.00',
  `biometric_security_nodes_cost` float(10,2) DEFAULT '0.00',
  `biometric_security_nodes_qty` int(11) DEFAULT '0',
  `mag_stripe_card_system_cost` float(10,2) DEFAULT '0.00',
  `mag_strip_card_readers_cost` float(10,2) DEFAULT '0.00',
  `mag_strip_card_readers_qty` int(11) DEFAULT '0',
  `building_management_system_cost` float(10,2) DEFAULT '0.00',
  `environmental_management_system_cost` float(10,2) DEFAULT '0.00',
  `bms_sensors_cost` float(10,2) DEFAULT '0.00',
  `bms_sensors_qty` int(11) DEFAULT '0',
  `environmental_sensors_cost` float(10,2) DEFAULT '0.00',
  `environmental_sensors_qty` int(6) DEFAULT '0',
  `cctv_system_cost` float(10,2) DEFAULT '0.00',
  `cctv_cameras_cost` float(10,2) DEFAULT '0.00',
  `cctv_cameras_qty` int(11) DEFAULT '0',
  `wiring_cost_per_meter` float(10,2) DEFAULT '0.00',
  `wiring_qty` int(11) DEFAULT '0',
  `40u_racks_cost` float(10,2) DEFAULT '0.00',
  `40u_racks_qty` int(11) DEFAULT '0',
  `KVM_drawers_cost` float(10,2) DEFAULT '0.00',
  `KVM_drawers_qty` int(11) DEFAULT '0',
  `patch_panel_cost` float(10,2) DEFAULT '0.00',
  `patch_wiring_cost_per_meter` float(10,2) DEFAULT '0.00',
  `patch_wiring_qty` int(11) DEFAULT '0',
  `size_in_square_feet` int(11) DEFAULT '0',
  `baseline_power_KWH_cost` float(10,2) DEFAULT '0.00',
  `baseline_power_KWH_qty` int(11) DEFAULT '0',
  `building_insurances_cost_pa` float(10,2) DEFAULT '0.00',
  `contents_insurances_cost_pa` float(10,2) DEFAULT '0.00',
  `building_maintenance_cost_pa` float(10,2) DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1 COMMENT='cost_input';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcassets`
--

LOCK TABLES `dcassets` WRITE;
/*!40000 ALTER TABLE `dcassets` DISABLE KEYS */;
INSERT INTO `dcassets` VALUES (16,'DC 1','GBP','United Kindom',15000.00,0.00,0,0.00,0,0.00,0,0.00,0,0.00,0,0.00,0,0.00,0,0.00,0,0.00,0,0.00,0.00,0.00,0,0.00,0.00,0,0.00,0.00,0,0.00,0.00,0.00,0,0.00,0,0.00,0.00,0,0.00,0,0.00,0,0.00,0,0.00,0.00,0,0,0.00,0,0.00,0.00,0.00,'phil@niu.com','2014-05-03 09:55:25'),(17,'DC 2','GBP','United Kindom',14000.00,0.00,0,0.00,0,0.00,0,0.00,0,0.00,0,0.00,0,0.00,0,0.00,0,0.00,0,0.00,0.00,0.00,0,0.00,0.00,0,0.00,0.00,0,0.00,0.00,0.00,0,0.00,0,0.00,0.00,0,0.00,0,0.00,0,0.00,0,0.00,0.00,0,0,0.00,0,0.00,0.00,0.00,'phil@niu.com','2014-05-03 09:55:38'),(19,'Amanda','GBP','United Kindom',20000.00,0.00,0,0.00,0,0.00,0,0.00,0,0.00,0,0.00,0,0.00,0,0.00,0,0.00,0,0.00,0.00,0.00,0,0.00,0.00,0,0.00,0.00,0,0.00,0.00,0.00,0,0.00,0,0.00,0.00,0,0.00,0,0.00,0,0.00,0,0.00,0.00,0,0,0.00,0,0.00,0.00,0.00,'eamonnkillian@gmail.com','2014-05-21 13:50:25');
/*!40000 ALTER TABLE `dcassets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `desktop`
--

DROP TABLE IF EXISTS `desktop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `desktop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `desktop_type` varchar(45) DEFAULT NULL,
  `assignment` varchar(11) DEFAULT NULL,
  `currency` varchar(8) DEFAULT NULL,
  `desktop_purchase_date` varchar(10) DEFAULT NULL,
  `desktop_location` varchar(45) DEFAULT NULL,
  `desktop_cost` float(10,2) DEFAULT '0.00',
  `desktop_maintenance_cost` float(10,2) DEFAULT '0.00',
  `desktop_maintenance_term` int(6) DEFAULT '0',
  `desktop_lifespan` int(6) DEFAULT '0',
  `desktop_power_consumption` int(6) DEFAULT '0',
  `desktop_qty` int(6) DEFAULT '0',
  `desktop_disposal_cost` float(10,2) DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='cost_input';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `desktop`
--

LOCK TABLES `desktop` WRITE;
/*!40000 ALTER TABLE `desktop` DISABLE KEYS */;
/*!40000 ALTER TABLE `desktop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `desktop_software`
--

DROP TABLE IF EXISTS `desktop_software`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `desktop_software` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `software_type` varchar(45) DEFAULT NULL,
  `assignment` varchar(11) DEFAULT NULL,
  `currency` varchar(45) DEFAULT NULL,
  `software_purchase_date` varchar(10) DEFAULT NULL,
  `software_name` varchar(45) DEFAULT NULL,
  `software_purchase_cost` float(10,2) DEFAULT '0.00',
  `software_annual_maintenance_cost` float(10,2) DEFAULT '0.00',
  `software_maintenance_term` int(8) DEFAULT '0',
  `software_description` blob,
  `software_location` varchar(45) DEFAULT NULL,
  `software_annual_subscription_cost` float(10,2) DEFAULT '0.00',
  `software_licences_qty` int(8) DEFAULT '0',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='cost_input';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `desktop_software`
--

LOCK TABLES `desktop_software` WRITE;
/*!40000 ALTER TABLE `desktop_software` DISABLE KEYS */;
/*!40000 ALTER TABLE `desktop_software` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `digital_presence_budget`
--

DROP TABLE IF EXISTS `digital_presence_budget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `digital_presence_budget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_currency` varchar(4) DEFAULT 'GBP',
  `2014` float(10,2) NOT NULL DEFAULT '0.00',
  `2015` float(10,2) NOT NULL DEFAULT '0.00',
  `2016` float(10,2) NOT NULL DEFAULT '0.00',
  `2017` float(10,2) NOT NULL DEFAULT '0.00',
  `2018` float(10,2) NOT NULL DEFAULT '0.00',
  `2019` float(10,2) NOT NULL DEFAULT '0.00',
  `2020` float(10,2) NOT NULL DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `digital_presence_budget`
--

LOCK TABLES `digital_presence_budget` WRITE;
/*!40000 ALTER TABLE `digital_presence_budget` DISABLE KEYS */;
INSERT INTO `digital_presence_budget` VALUES (3,'GBP',12000.00,0.00,0.00,0.00,0.00,0.00,0.00,'phil@niu.com','2014-05-03 10:03:52');
/*!40000 ALTER TABLE `digital_presence_budget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dot_matrix_printer`
--

DROP TABLE IF EXISTS `dot_matrix_printer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dot_matrix_printer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `printer_type` varchar(45) DEFAULT NULL,
  `currency` varchar(8) DEFAULT NULL,
  `printer_purchase_date` varchar(10) DEFAULT NULL,
  `printer_location` varchar(45) DEFAULT NULL,
  `colour` varchar(4) DEFAULT NULL,
  `printer_cost` float DEFAULT NULL,
  `printer_maintenance_cost_per_annum` float DEFAULT NULL,
  `printer_maintenance_term` int(11) DEFAULT NULL,
  `printer_lifespan` varchar(45) DEFAULT NULL,
  `printer_power_consumption` float DEFAULT NULL,
  `printer_consumables_cost` float(10,2) DEFAULT '0.00',
  `estimated_consumables_qty` int(6) DEFAULT '0',
  `printer_qty` int(11) DEFAULT NULL,
  `printer_disposal_cost` float(10,2) DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='cost_input';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dot_matrix_printer`
--

LOCK TABLES `dot_matrix_printer` WRITE;
/*!40000 ALTER TABLE `dot_matrix_printer` DISABLE KEYS */;
/*!40000 ALTER TABLE `dot_matrix_printer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ethical_hacking`
--

DROP TABLE IF EXISTS `ethical_hacking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ethical_hacking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_currency` varchar(4) DEFAULT 'GBP',
  `2014` float DEFAULT NULL,
  `2015` float DEFAULT NULL,
  `2016` float DEFAULT NULL,
  `2017` float DEFAULT NULL,
  `2018` float DEFAULT NULL,
  `2019` float DEFAULT NULL,
  `2020` float DEFAULT NULL,
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ethical_hacking`
--

LOCK TABLES `ethical_hacking` WRITE;
/*!40000 ALTER TABLE `ethical_hacking` DISABLE KEYS */;
INSERT INTO `ethical_hacking` VALUES (1,'GBP',0,0,0,0,0,0,0,'eamonnkillian@gmail.com','2014-04-29 09:59:39');
/*!40000 ALTER TABLE `ethical_hacking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exit_services`
--

DROP TABLE IF EXISTS `exit_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exit_services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_currency` varchar(4) DEFAULT 'GBP',
  `2014` float(10,2) NOT NULL DEFAULT '0.00',
  `2015` float(10,2) NOT NULL DEFAULT '0.00',
  `2016` float(10,2) NOT NULL DEFAULT '0.00',
  `2017` float(10,2) NOT NULL DEFAULT '0.00',
  `2018` float(10,2) NOT NULL DEFAULT '0.00',
  `2019` float(10,2) NOT NULL DEFAULT '0.00',
  `2020` float(10,2) NOT NULL DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exit_services`
--

LOCK TABLES `exit_services` WRITE;
/*!40000 ALTER TABLE `exit_services` DISABLE KEYS */;
INSERT INTO `exit_services` VALUES (3,'GBP',5000.00,0.00,0.00,0.00,0.00,0.00,0.00,'phil@niu.com','2014-05-03 10:29:36');
/*!40000 ALTER TABLE `exit_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `external_audit`
--

DROP TABLE IF EXISTS `external_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `external_audit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_currency` varchar(4) DEFAULT 'GBP',
  `2014` float DEFAULT NULL,
  `2015` float DEFAULT NULL,
  `2016` float DEFAULT NULL,
  `2017` float DEFAULT NULL,
  `2018` float DEFAULT NULL,
  `2019` float DEFAULT NULL,
  `2020` float DEFAULT NULL,
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `external_audit`
--

LOCK TABLES `external_audit` WRITE;
/*!40000 ALTER TABLE `external_audit` DISABLE KEYS */;
INSERT INTO `external_audit` VALUES (1,'GBP',0,0,0,0,0,0,0,'eamonnkillian@gmail.com','2014-04-29 10:00:27');
/*!40000 ALTER TABLE `external_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `external_design_budget`
--

DROP TABLE IF EXISTS `external_design_budget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `external_design_budget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_currency` varchar(4) DEFAULT 'GBP',
  `2014` float(10,2) NOT NULL DEFAULT '0.00',
  `2015` float(10,2) NOT NULL DEFAULT '0.00',
  `2016` float(10,2) NOT NULL DEFAULT '0.00',
  `2017` float(10,2) NOT NULL DEFAULT '0.00',
  `2018` float(10,2) NOT NULL DEFAULT '0.00',
  `2019` float(10,2) NOT NULL DEFAULT '0.00',
  `2020` float(10,2) NOT NULL DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `external_design_budget`
--

LOCK TABLES `external_design_budget` WRITE;
/*!40000 ALTER TABLE `external_design_budget` DISABLE KEYS */;
INSERT INTO `external_design_budget` VALUES (3,'GBP',0.00,0.00,0.00,0.00,0.00,0.00,0.00,NULL,'2014-04-18 18:02:49');
/*!40000 ALTER TABLE `external_design_budget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `external_testing_budget`
--

DROP TABLE IF EXISTS `external_testing_budget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `external_testing_budget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_currency` varchar(4) DEFAULT 'GBP',
  `2014` float(10,2) NOT NULL DEFAULT '0.00',
  `2015` float(10,2) NOT NULL DEFAULT '0.00',
  `2016` float(10,2) NOT NULL DEFAULT '0.00',
  `2017` float(10,2) NOT NULL DEFAULT '0.00',
  `2018` float(10,2) NOT NULL DEFAULT '0.00',
  `2019` float(10,2) NOT NULL DEFAULT '0.00',
  `2020` float(10,2) NOT NULL DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `external_testing_budget`
--

LOCK TABLES `external_testing_budget` WRITE;
/*!40000 ALTER TABLE `external_testing_budget` DISABLE KEYS */;
INSERT INTO `external_testing_budget` VALUES (3,'GBP',0.00,0.00,0.00,0.00,0.00,0.00,0.00,'eamonnkillian@gmail.com','2014-04-29 10:03:24');
/*!40000 ALTER TABLE `external_testing_budget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `firewalls`
--

DROP TABLE IF EXISTS `firewalls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `firewalls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firewalls_type` varchar(45) DEFAULT NULL,
  `assignment` varchar(11) DEFAULT NULL,
  `currency` varchar(8) DEFAULT NULL,
  `firewalls_purchase_date` varchar(10) DEFAULT NULL,
  `firewalls_location` varchar(45) DEFAULT NULL,
  `firewalls_cost` float(10,2) DEFAULT '0.00',
  `firewalls_maintenance_cost` float(10,2) DEFAULT '0.00',
  `firewalls_maintenance_term` int(6) DEFAULT '0',
  `firewalls_lifespan` int(6) DEFAULT '0',
  `firewalls_power_consumption` int(6) DEFAULT '0',
  `firewalls_qty` int(6) DEFAULT '0',
  `firewalls_disposal_cost` int(6) DEFAULT '0',
  `firewalls_rack_size_u` int(6) DEFAULT '0',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COMMENT='cost_input';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `firewalls`
--

LOCK TABLES `firewalls` WRITE;
/*!40000 ALTER TABLE `firewalls` DISABLE KEYS */;
INSERT INTO `firewalls` VALUES (5,'Prod FW','Production','GBP','01/01/2014','DC 1',1250.00,0.00,0,0,0,2,0,2,'phil@niu.com','2014-05-03 09:58:43');
/*!40000 ALTER TABLE `firewalls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flash_storage`
--

DROP TABLE IF EXISTS `flash_storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flash_storage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flash_storage_type` varchar(45) DEFAULT NULL,
  `assignment` varchar(11) DEFAULT NULL,
  `currency` varchar(8) DEFAULT NULL,
  `storage_purchase_date` varchar(10) DEFAULT NULL,
  `flash_storage_location` varchar(45) DEFAULT NULL,
  `flash_raw_capacity_TB` float DEFAULT NULL,
  `flash_formatted_capacity_TB` float DEFAULT NULL,
  `flash_storage_number_ports` varchar(45) DEFAULT NULL,
  `flash_storage_cost` varchar(45) DEFAULT NULL,
  `flash_storage_maintenance_term` varchar(45) DEFAULT NULL,
  `flash_storage_maintenance_cost` varchar(45) DEFAULT NULL,
  `flash_storage_lifespan` varchar(45) DEFAULT NULL,
  `flash_storage_power_consumption` varchar(45) DEFAULT NULL,
  `flash_storage_qty` varchar(45) DEFAULT NULL,
  `flash_storage_disposal_cost` int(6) DEFAULT '0',
  `flash_storage_rack_size_u` varchar(45) DEFAULT NULL,
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='cost_input';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flash_storage`
--

LOCK TABLES `flash_storage` WRITE;
/*!40000 ALTER TABLE `flash_storage` DISABLE KEYS */;
/*!40000 ALTER TABLE `flash_storage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `focus_groups_budget`
--

DROP TABLE IF EXISTS `focus_groups_budget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `focus_groups_budget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_currency` varchar(4) DEFAULT 'GBP',
  `2014` float(10,2) NOT NULL DEFAULT '0.00',
  `2015` float(10,2) NOT NULL DEFAULT '0.00',
  `2016` float(10,2) NOT NULL DEFAULT '0.00',
  `2017` float(10,2) NOT NULL DEFAULT '0.00',
  `2018` float(10,2) NOT NULL DEFAULT '0.00',
  `2019` float(10,2) NOT NULL DEFAULT '0.00',
  `2020` float(10,2) NOT NULL DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `focus_groups_budget`
--

LOCK TABLES `focus_groups_budget` WRITE;
/*!40000 ALTER TABLE `focus_groups_budget` DISABLE KEYS */;
INSERT INTO `focus_groups_budget` VALUES (3,'AUS',0.00,0.00,0.00,0.00,0.00,0.00,0.00,'eamonnkillian@gmail.com','2014-04-29 10:02:47');
/*!40000 ALTER TABLE `focus_groups_budget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foi`
--

DROP TABLE IF EXISTS `foi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `foi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_currency` varchar(4) DEFAULT 'GBP',
  `2014` float DEFAULT NULL,
  `2015` float DEFAULT NULL,
  `2016` float DEFAULT NULL,
  `2017` float DEFAULT NULL,
  `2018` float DEFAULT NULL,
  `2019` float DEFAULT NULL,
  `2020` float DEFAULT NULL,
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foi`
--

LOCK TABLES `foi` WRITE;
/*!40000 ALTER TABLE `foi` DISABLE KEYS */;
INSERT INTO `foi` VALUES (1,'GBP',0,0,0,0,0,0,0,'eamonnkillian@gmail.com','2014-04-29 09:59:49');
/*!40000 ALTER TABLE `foi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fx`
--

DROP TABLE IF EXISTS `fx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fx` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `GBP` float DEFAULT NULL,
  `USD` float DEFAULT NULL,
  `EURO` float DEFAULT NULL,
  `JPY` float DEFAULT NULL,
  `AUS` float DEFAULT NULL,
  `CHF` float DEFAULT NULL,
  `HKD` float DEFAULT NULL,
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fx`
--

LOCK TABLES `fx` WRITE;
/*!40000 ALTER TABLE `fx` DISABLE KEYS */;
INSERT INTO `fx` VALUES (1,1,1.555,1.21,123,2.2,2.12,1.88,'eamonnkillian@gmail.com','2014-04-25 15:27:02');
/*!40000 ALTER TABLE `fx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `handheld_printer`
--

DROP TABLE IF EXISTS `handheld_printer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `handheld_printer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `printer_type` varchar(45) DEFAULT NULL,
  `assignment` varchar(11) DEFAULT NULL,
  `currency` varchar(8) DEFAULT NULL,
  `printer_purchase_date` varchar(10) DEFAULT NULL,
  `printer_location` varchar(45) DEFAULT NULL,
  `colour` varchar(4) DEFAULT NULL,
  `printer_cost` float DEFAULT NULL,
  `printer_maintenance_cost_per_annum` float DEFAULT NULL,
  `printer_maintenance_term` int(11) DEFAULT NULL,
  `printer_lifespan` varchar(45) DEFAULT NULL,
  `printer_power_consumption` float DEFAULT NULL,
  `printer_consumables_cost` float(10,2) DEFAULT '0.00',
  `estimated_consumables_qty` int(6) DEFAULT '0',
  `printer_qty` int(11) DEFAULT NULL,
  `printer_disposal_cost` float(10,2) DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='cost_input';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `handheld_printer`
--

LOCK TABLES `handheld_printer` WRITE;
/*!40000 ALTER TABLE `handheld_printer` DISABLE KEYS */;
/*!40000 ALTER TABLE `handheld_printer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `helpdesk_software`
--

DROP TABLE IF EXISTS `helpdesk_software`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `helpdesk_software` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `software_type` varchar(45) DEFAULT NULL,
  `assignment` varchar(11) DEFAULT NULL,
  `currency` varchar(45) DEFAULT NULL,
  `software_purchase_date` varchar(10) DEFAULT NULL,
  `software_name` varchar(45) DEFAULT NULL,
  `software_purchase_cost` float(10,2) DEFAULT '0.00',
  `software_annual_maintenance_cost` float(10,2) DEFAULT '0.00',
  `software_maintenance_term` int(8) DEFAULT '0',
  `software_description` blob,
  `software_location` varchar(45) DEFAULT NULL,
  `software_annual_subscription_cost` float(10,2) DEFAULT '0.00',
  `software_licences_qty` int(8) DEFAULT '0',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='cost_input';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `helpdesk_software`
--

LOCK TABLES `helpdesk_software` WRITE;
/*!40000 ALTER TABLE `helpdesk_software` DISABLE KEYS */;
/*!40000 ALTER TABLE `helpdesk_software` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_hub`
--

DROP TABLE IF EXISTS `home_hub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `home_hub` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `home_hub_type` varchar(45) DEFAULT NULL,
  `assignment` varchar(11) DEFAULT NULL,
  `currency` varchar(8) DEFAULT NULL,
  `hub_purchase_date` varchar(10) DEFAULT NULL,
  `home_hub_location` varchar(45) DEFAULT NULL,
  `home_hub_cost` float(10,2) DEFAULT '0.00',
  `home_hub_maintenance_cost` float(10,2) DEFAULT '0.00',
  `home_hub_maintenance_term` int(6) DEFAULT '0',
  `home_hub_lifespan` int(6) DEFAULT '0',
  `home_hub_power_consumption` varchar(45) DEFAULT NULL,
  `home_hub_qty` int(6) DEFAULT '0',
  `home_hub_disposal_cost` float(10,2) DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='cost_input';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_hub`
--

LOCK TABLES `home_hub` WRITE;
/*!40000 ALTER TABLE `home_hub` DISABLE KEYS */;
/*!40000 ALTER TABLE `home_hub` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iaas_physical_NAS_products`
--

DROP TABLE IF EXISTS `iaas_physical_NAS_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iaas_physical_NAS_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(45) DEFAULT NULL,
  `amount_of_storage_GBs` int(6) DEFAULT '0',
  `product_source` varchar(23) DEFAULT NULL,
  `description` blob,
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iaas_physical_NAS_products`
--

LOCK TABLES `iaas_physical_NAS_products` WRITE;
/*!40000 ALTER TABLE `iaas_physical_NAS_products` DISABLE KEYS */;
INSERT INTO `iaas_physical_NAS_products` VALUES (10,'test element',50,'Internal_Infrastructure','dfggsfddfh','eamonnkillian@gmail.com','2014-05-22 07:45:41');
/*!40000 ALTER TABLE `iaas_physical_NAS_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iaas_physical_NAS_products_sales`
--

DROP TABLE IF EXISTS `iaas_physical_NAS_products_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iaas_physical_NAS_products_sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(45) DEFAULT NULL,
  `service_start_date` varchar(10) DEFAULT NULL,
  `service_finish_date` varchar(10) DEFAULT NULL,
  `purchased_qty` int(6) DEFAULT NULL,
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iaas_physical_NAS_products_sales`
--

LOCK TABLES `iaas_physical_NAS_products_sales` WRITE;
/*!40000 ALTER TABLE `iaas_physical_NAS_products_sales` DISABLE KEYS */;
/*!40000 ALTER TABLE `iaas_physical_NAS_products_sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iaas_physical_SAN_products`
--

DROP TABLE IF EXISTS `iaas_physical_SAN_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iaas_physical_SAN_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(45) DEFAULT NULL,
  `amount_of_storage_GBs` int(6) DEFAULT '0',
  `product_source` varchar(23) DEFAULT NULL,
  `description` blob,
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iaas_physical_SAN_products`
--

LOCK TABLES `iaas_physical_SAN_products` WRITE;
/*!40000 ALTER TABLE `iaas_physical_SAN_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `iaas_physical_SAN_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iaas_physical_SAN_products_sales`
--

DROP TABLE IF EXISTS `iaas_physical_SAN_products_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iaas_physical_SAN_products_sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(45) DEFAULT NULL,
  `service_start_date` varchar(10) DEFAULT NULL,
  `service_finish_date` varchar(10) DEFAULT NULL,
  `purchased_qty` int(6) DEFAULT NULL,
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iaas_physical_SAN_products_sales`
--

LOCK TABLES `iaas_physical_SAN_products_sales` WRITE;
/*!40000 ALTER TABLE `iaas_physical_SAN_products_sales` DISABLE KEYS */;
/*!40000 ALTER TABLE `iaas_physical_SAN_products_sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iaas_physical_machine_clouds`
--

DROP TABLE IF EXISTS `iaas_physical_machine_clouds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iaas_physical_machine_clouds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iaas_physical_machine_clouds_type` varchar(45) DEFAULT NULL,
  `assignment` varchar(11) DEFAULT NULL,
  `currency` varchar(8) DEFAULT NULL,
  `iaas_provider` varchar(45) DEFAULT NULL,
  `iaas_contract_purchase_date` varchar(10) DEFAULT NULL,
  `iaas_number_physical_processors` int(8) DEFAULT '0',
  `iaas_number_physical_cores` int(8) DEFAULT '0',
  `iaas_amount_physical_memory_GB` float(10,2) DEFAULT '0.00',
  `iaas_baseline_cost_per_physical_machine_monthly` float(10,2) DEFAULT '0.00',
  `iaas_anticipated_physical_machine_qty` int(8) DEFAULT '0',
  `iaas_contract_term_months` int(4) DEFAULT '0',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iaas_physical_machine_clouds`
--

LOCK TABLES `iaas_physical_machine_clouds` WRITE;
/*!40000 ALTER TABLE `iaas_physical_machine_clouds` DISABLE KEYS */;
/*!40000 ALTER TABLE `iaas_physical_machine_clouds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iaas_physical_machine_products`
--

DROP TABLE IF EXISTS `iaas_physical_machine_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iaas_physical_machine_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(45) DEFAULT NULL,
  `amount_of_physical_cores` int(6) DEFAULT '0',
  `amount_of_memory_MBs` int(6) DEFAULT '0',
  `amount_of_storage_GBs` int(6) DEFAULT '0',
  `product_source` varchar(23) DEFAULT NULL,
  `description` blob,
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iaas_physical_machine_products`
--

LOCK TABLES `iaas_physical_machine_products` WRITE;
/*!40000 ALTER TABLE `iaas_physical_machine_products` DISABLE KEYS */;
INSERT INTO `iaas_physical_machine_products` VALUES (1,'testing',4,1000,25,'Internal_Infrastructure','Adding a description for test purposes.','eamonnkillian@gmail.com','2014-05-22 16:56:53');
/*!40000 ALTER TABLE `iaas_physical_machine_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iaas_physical_machine_products_sales`
--

DROP TABLE IF EXISTS `iaas_physical_machine_products_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iaas_physical_machine_products_sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(45) DEFAULT NULL,
  `service_start_date` varchar(10) DEFAULT NULL,
  `service_finish_date` varchar(10) DEFAULT NULL,
  `purchased_qty` int(6) DEFAULT NULL,
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iaas_physical_machine_products_sales`
--

LOCK TABLES `iaas_physical_machine_products_sales` WRITE;
/*!40000 ALTER TABLE `iaas_physical_machine_products_sales` DISABLE KEYS */;
INSERT INTO `iaas_physical_machine_products_sales` VALUES (1,'testing','01/01/2014','31/12/2020',2,'eamonnkillian@gmail.com','2014-07-25 05:52:23');
/*!40000 ALTER TABLE `iaas_physical_machine_products_sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iaas_physical_storage_clouds`
--

DROP TABLE IF EXISTS `iaas_physical_storage_clouds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iaas_physical_storage_clouds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iaas_physical_storage_clouds_type` varchar(45) DEFAULT NULL,
  `assignment` varchar(11) DEFAULT NULL,
  `currency` varchar(8) DEFAULT NULL,
  `iaas_provider` varchar(45) DEFAULT NULL,
  `iaas_contract_purchase_date` varchar(10) DEFAULT NULL,
  `iaas_number_physical_raw_TB` float(10,2) DEFAULT '0.00',
  `iaas_number_physical_formatted_TB` float(10,2) DEFAULT '0.00',
  `iaas_amount_physical_cache_memory_MB` float(10,2) DEFAULT '0.00',
  `iaas_baseline_cost_per_physical_storage_monthly` float(10,2) DEFAULT '0.00',
  `iaas_anticipated_physical_storage_qty` int(8) DEFAULT '0',
  `iaas_contract_term_months` int(4) DEFAULT '0',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iaas_physical_storage_clouds`
--

LOCK TABLES `iaas_physical_storage_clouds` WRITE;
/*!40000 ALTER TABLE `iaas_physical_storage_clouds` DISABLE KEYS */;
/*!40000 ALTER TABLE `iaas_physical_storage_clouds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iaas_total_cloud_capacity`
--

DROP TABLE IF EXISTS `iaas_total_cloud_capacity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iaas_total_cloud_capacity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iaas_total_virtual_machines` int(10) DEFAULT '0',
  `iaas_total_storage_GBs` int(10) DEFAULT '0',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iaas_total_cloud_capacity`
--

LOCK TABLES `iaas_total_cloud_capacity` WRITE;
/*!40000 ALTER TABLE `iaas_total_cloud_capacity` DISABLE KEYS */;
/*!40000 ALTER TABLE `iaas_total_cloud_capacity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iaas_virtual_NAS_products`
--

DROP TABLE IF EXISTS `iaas_virtual_NAS_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iaas_virtual_NAS_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(45) DEFAULT NULL,
  `amount_of_storage_GBs` int(6) DEFAULT '0',
  `product_source` varchar(23) DEFAULT NULL,
  `description` blob,
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iaas_virtual_NAS_products`
--

LOCK TABLES `iaas_virtual_NAS_products` WRITE;
/*!40000 ALTER TABLE `iaas_virtual_NAS_products` DISABLE KEYS */;
INSERT INTO `iaas_virtual_NAS_products` VALUES (8,'Test the NAS Storage',50,'Internal_Infrastructure','This is a description.','eamonnkillian@gmail.com','2014-05-19 11:48:11'),(9,'Test number 2222',55,'External_Provider','dskjhfdhdfgkdfkvjadl','eamonnkillian@gmail.com','2014-05-19 11:48:31');
/*!40000 ALTER TABLE `iaas_virtual_NAS_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iaas_virtual_NAS_products_sales`
--

DROP TABLE IF EXISTS `iaas_virtual_NAS_products_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iaas_virtual_NAS_products_sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(45) DEFAULT NULL,
  `service_start_date` varchar(10) DEFAULT NULL,
  `service_finish_date` varchar(10) DEFAULT NULL,
  `purchased_qty` int(6) DEFAULT NULL,
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iaas_virtual_NAS_products_sales`
--

LOCK TABLES `iaas_virtual_NAS_products_sales` WRITE;
/*!40000 ALTER TABLE `iaas_virtual_NAS_products_sales` DISABLE KEYS */;
INSERT INTO `iaas_virtual_NAS_products_sales` VALUES (9,'Test the NAS Storage','01/01/2014','31/12/2020',1000,'eamonnkillian@gmail.com','2014-05-26 08:36:45'),(10,'Test the NAS Storage','01/01/2014','31/12/2020',500,'eamonnkillian@gmail.com','2014-05-26 08:36:54');
/*!40000 ALTER TABLE `iaas_virtual_NAS_products_sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iaas_virtual_SAN_products`
--

DROP TABLE IF EXISTS `iaas_virtual_SAN_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iaas_virtual_SAN_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(45) DEFAULT NULL,
  `amount_of_storage_GBs` int(6) DEFAULT '0',
  `product_source` varchar(23) DEFAULT NULL,
  `description` blob,
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iaas_virtual_SAN_products`
--

LOCK TABLES `iaas_virtual_SAN_products` WRITE;
/*!40000 ALTER TABLE `iaas_virtual_SAN_products` DISABLE KEYS */;
INSERT INTO `iaas_virtual_SAN_products` VALUES (10,'testty hheheh',65,'External_Provider','fsdihvdushvlkjhvksd','eamonnkillian@gmail.com','2014-05-19 11:50:43');
/*!40000 ALTER TABLE `iaas_virtual_SAN_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iaas_virtual_SAN_products_sales`
--

DROP TABLE IF EXISTS `iaas_virtual_SAN_products_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iaas_virtual_SAN_products_sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(45) DEFAULT NULL,
  `service_start_date` varchar(10) DEFAULT NULL,
  `service_finish_date` varchar(10) DEFAULT NULL,
  `purchased_qty` int(6) DEFAULT NULL,
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iaas_virtual_SAN_products_sales`
--

LOCK TABLES `iaas_virtual_SAN_products_sales` WRITE;
/*!40000 ALTER TABLE `iaas_virtual_SAN_products_sales` DISABLE KEYS */;
INSERT INTO `iaas_virtual_SAN_products_sales` VALUES (8,'testty hheheh','01/01/2014','31/12/2020',50,'eamonnkillian@gmail.com','2014-05-26 08:35:20');
/*!40000 ALTER TABLE `iaas_virtual_SAN_products_sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iaas_virtual_machine_clouds`
--

DROP TABLE IF EXISTS `iaas_virtual_machine_clouds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iaas_virtual_machine_clouds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iaas_virtual_machine_clouds_type` varchar(45) DEFAULT NULL,
  `assignment` varchar(11) DEFAULT NULL,
  `currency` varchar(8) DEFAULT NULL,
  `iaas_provider` varchar(45) DEFAULT NULL,
  `iaas_contract_purchase_date` varchar(10) DEFAULT NULL,
  `iaas_number_virtual_processors` int(8) DEFAULT '0',
  `iaas_number_virtual_cores` int(8) DEFAULT '0',
  `iaas_amount_virtual_memory_GB` float(10,2) DEFAULT '0.00',
  `iaas_baseline_cost_per_virtual_machine_monthly` float(10,2) DEFAULT '0.00',
  `iaas_anticipated_virtual_machine_qty` int(8) DEFAULT '0',
  `iaas_contract_term_months` int(4) DEFAULT '0',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iaas_virtual_machine_clouds`
--

LOCK TABLES `iaas_virtual_machine_clouds` WRITE;
/*!40000 ALTER TABLE `iaas_virtual_machine_clouds` DISABLE KEYS */;
/*!40000 ALTER TABLE `iaas_virtual_machine_clouds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iaas_virtual_machine_products`
--

DROP TABLE IF EXISTS `iaas_virtual_machine_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iaas_virtual_machine_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(45) DEFAULT NULL,
  `amount_of_VMs` int(6) DEFAULT '0',
  `amount_of_memory_MBs` int(6) DEFAULT '0',
  `amount_of_storage_GBs` int(6) DEFAULT '0',
  `product_source` varchar(23) DEFAULT 'Internal',
  `description` blob,
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iaas_virtual_machine_products`
--

LOCK TABLES `iaas_virtual_machine_products` WRITE;
/*!40000 ALTER TABLE `iaas_virtual_machine_products` DISABLE KEYS */;
INSERT INTO `iaas_virtual_machine_products` VALUES (2,'BigMachines',8,1000,1000,'Internal_Infrastructure','Description \"field\".','eamonnkillian@gmail.com','2014-05-25 10:55:30'),(9,'Amanda Scene',2,128,10,'Internal_Infrastructure','kjdsfhfgkhdkfgshdfkj','eamonnkillian@gmail.com','2014-05-21 14:01:37'),(10,'test of function',8,1000,1000,'External_Provider','testing the external provider element','eamonnkillian@gmail.com','2014-05-26 07:55:15');
/*!40000 ALTER TABLE `iaas_virtual_machine_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iaas_virtual_machine_products_sales`
--

DROP TABLE IF EXISTS `iaas_virtual_machine_products_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iaas_virtual_machine_products_sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(45) DEFAULT NULL,
  `service_start_date` varchar(10) DEFAULT NULL,
  `service_finish_date` varchar(10) DEFAULT NULL,
  `purchased_qty` int(6) DEFAULT NULL,
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iaas_virtual_machine_products_sales`
--

LOCK TABLES `iaas_virtual_machine_products_sales` WRITE;
/*!40000 ALTER TABLE `iaas_virtual_machine_products_sales` DISABLE KEYS */;
INSERT INTO `iaas_virtual_machine_products_sales` VALUES (72,'BigMachines','01/01/2014','31/12/2020',5,'eamonnkillian@gmail.com','2014-05-26 08:34:54'),(73,'BigMachines','01/01/2014','31/12/2020',5,'eamonnkillian@gmail.com','2014-05-26 08:34:56'),(74,'BigMachines','01/01/2014','31/12/2020',5,'eamonnkillian@gmail.com','2014-05-26 08:34:59'),(75,'Amanda Scene','01/01/2014','31/12/2020',20,'eamonnkillian@gmail.com','2014-05-26 08:35:07');
/*!40000 ALTER TABLE `iaas_virtual_machine_products_sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iaas_virtual_storage_clouds`
--

DROP TABLE IF EXISTS `iaas_virtual_storage_clouds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iaas_virtual_storage_clouds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iaas_virtual_storage_clouds_type` varchar(45) DEFAULT NULL,
  `assignment` varchar(11) DEFAULT NULL,
  `currency` varchar(8) DEFAULT NULL,
  `iaas_provider` varchar(45) DEFAULT NULL,
  `iaas_contract_purchase_date` varchar(10) DEFAULT NULL,
  `iaas_number_virtual_TB` float(10,2) DEFAULT '0.00',
  `iaas_amount_virtual_cache_memory_MB` float(10,2) DEFAULT '0.00',
  `iaas_baseline_cost_per_virtual_storage_monthly` float(10,2) DEFAULT '0.00',
  `iaas_anticipated_virtual_storage_qty` int(8) DEFAULT '0',
  `iaas_contract_term_months` int(4) DEFAULT '0',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iaas_virtual_storage_clouds`
--

LOCK TABLES `iaas_virtual_storage_clouds` WRITE;
/*!40000 ALTER TABLE `iaas_virtual_storage_clouds` DISABLE KEYS */;
/*!40000 ALTER TABLE `iaas_virtual_storage_clouds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `indemnities`
--

DROP TABLE IF EXISTS `indemnities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `indemnities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_currency` varchar(4) DEFAULT 'GBP',
  `2014` float(10,2) NOT NULL DEFAULT '0.00',
  `2015` float(10,2) NOT NULL DEFAULT '0.00',
  `2016` float(10,2) NOT NULL DEFAULT '0.00',
  `2017` float(10,2) NOT NULL DEFAULT '0.00',
  `2018` float(10,2) NOT NULL DEFAULT '0.00',
  `2019` float(10,2) NOT NULL DEFAULT '0.00',
  `2020` float(10,2) NOT NULL DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indemnities`
--

LOCK TABLES `indemnities` WRITE;
/*!40000 ALTER TABLE `indemnities` DISABLE KEYS */;
INSERT INTO `indemnities` VALUES (3,'GBP',0.00,0.00,0.00,0.00,0.00,0.00,0.00,NULL,'2014-04-19 10:21:47');
/*!40000 ALTER TABLE `indemnities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `indemnity`
--

DROP TABLE IF EXISTS `indemnity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `indemnity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_currency` varchar(4) DEFAULT 'GBP',
  `2014` float(10,2) DEFAULT NULL,
  `2015` float(10,2) DEFAULT NULL,
  `2016` float(10,2) DEFAULT NULL,
  `2017` float(10,2) DEFAULT NULL,
  `2018` float(10,2) DEFAULT NULL,
  `2019` float(10,2) DEFAULT NULL,
  `2020` float(10,2) DEFAULT NULL,
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indemnity`
--

LOCK TABLES `indemnity` WRITE;
/*!40000 ALTER TABLE `indemnity` DISABLE KEYS */;
INSERT INTO `indemnity` VALUES (1,'GBP',12000.00,0.00,0.00,0.00,0.00,0.00,0.00,'phil@niu.com','2014-05-03 15:48:06');
/*!40000 ALTER TABLE `indemnity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `industry_insights_budget`
--

DROP TABLE IF EXISTS `industry_insights_budget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `industry_insights_budget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_currency` varchar(4) DEFAULT 'GBP',
  `2014` float(10,2) NOT NULL DEFAULT '0.00',
  `2015` float(10,2) NOT NULL DEFAULT '0.00',
  `2016` float(10,2) NOT NULL DEFAULT '0.00',
  `2017` float(10,2) NOT NULL DEFAULT '0.00',
  `2018` float(10,2) NOT NULL DEFAULT '0.00',
  `2019` float(10,2) NOT NULL DEFAULT '0.00',
  `2020` float(10,2) NOT NULL DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `industry_insights_budget`
--

LOCK TABLES `industry_insights_budget` WRITE;
/*!40000 ALTER TABLE `industry_insights_budget` DISABLE KEYS */;
INSERT INTO `industry_insights_budget` VALUES (3,'EURO',0.00,0.00,0.00,0.00,0.00,0.00,0.00,'eamonnkillian@gmail.com','2014-04-29 10:03:05');
/*!40000 ALTER TABLE `industry_insights_budget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inflation`
--

DROP TABLE IF EXISTS `inflation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inflation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `2014` float DEFAULT NULL,
  `2015` float DEFAULT NULL,
  `2016` float DEFAULT NULL,
  `2017` float DEFAULT NULL,
  `2018` float DEFAULT NULL,
  `2019` float DEFAULT NULL,
  `2020` float DEFAULT NULL,
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inflation`
--

LOCK TABLES `inflation` WRITE;
/*!40000 ALTER TABLE `inflation` DISABLE KEYS */;
INSERT INTO `inflation` VALUES (1,0,0,0,0,0,0,0,'eamonnkillian@gmail.com','2014-04-29 09:59:01');
/*!40000 ALTER TABLE `inflation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inkjet_desktop`
--

DROP TABLE IF EXISTS `inkjet_desktop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inkjet_desktop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `printer_type` varchar(45) DEFAULT NULL,
  `currency` varchar(8) DEFAULT NULL,
  `printer_location` varchar(45) DEFAULT NULL,
  `printer_purchase_date` varchar(45) DEFAULT NULL,
  `printer_memory` float(10,2) DEFAULT NULL,
  `scanner` varchar(4) DEFAULT NULL,
  `copier` varchar(4) DEFAULT NULL,
  `fax` varchar(4) DEFAULT NULL,
  `colour` varchar(4) DEFAULT NULL,
  `printer_input_drawers` int(4) DEFAULT NULL,
  `printer_cost` float(10,2) DEFAULT NULL,
  `printer_maintenance_cost_per_annum` float(10,2) DEFAULT NULL,
  `printer_maintenance_term` int(11) DEFAULT NULL,
  `printer_lifespan` varchar(45) DEFAULT NULL,
  `printer_power_consumption` int(10) DEFAULT NULL,
  `printer_consumables_cost` float(10,2) DEFAULT '0.00',
  `estimated_consumables_qty` int(6) DEFAULT '0',
  `printer_qty` int(11) DEFAULT NULL,
  `printer_disposal_cost` float(10,2) DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='cost_input';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inkjet_desktop`
--

LOCK TABLES `inkjet_desktop` WRITE;
/*!40000 ALTER TABLE `inkjet_desktop` DISABLE KEYS */;
/*!40000 ALTER TABLE `inkjet_desktop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insurances`
--

DROP TABLE IF EXISTS `insurances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `insurances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_currency` varchar(4) DEFAULT 'GBP',
  `2014` float(10,2) NOT NULL DEFAULT '0.00',
  `2015` float(10,2) NOT NULL DEFAULT '0.00',
  `2016` float(10,2) NOT NULL DEFAULT '0.00',
  `2017` float(10,2) NOT NULL DEFAULT '0.00',
  `2018` float(10,2) NOT NULL DEFAULT '0.00',
  `2019` float(10,2) NOT NULL DEFAULT '0.00',
  `2020` float(10,2) NOT NULL DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insurances`
--

LOCK TABLES `insurances` WRITE;
/*!40000 ALTER TABLE `insurances` DISABLE KEYS */;
INSERT INTO `insurances` VALUES (3,'GBP',0.00,0.00,0.00,0.00,0.00,0.00,0.00,NULL,'2014-04-19 10:21:58');
/*!40000 ALTER TABLE `insurances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `intel_servers`
--

DROP TABLE IF EXISTS `intel_servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `intel_servers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_type` varchar(45) DEFAULT NULL,
  `assignment` varchar(11) DEFAULT NULL,
  `server_purchase_date` varchar(10) DEFAULT NULL,
  `currency` varchar(8) DEFAULT NULL,
  `server_location` varchar(45) DEFAULT NULL,
  `server_number_processors` int(8) DEFAULT '0',
  `server_number_cores_per_processor` int(8) DEFAULT '0',
  `server_memory_GB` int(8) DEFAULT '0',
  `server_hard_drive` varchar(4) DEFAULT NULL,
  `server_cddvd_drive` varchar(4) DEFAULT NULL,
  `server_video_card` varchar(4) DEFAULT NULL,
  `server_IO_drawers` int(8) DEFAULT NULL,
  `server_IO_ports` int(8) DEFAULT NULL,
  `server_cost` float(10,2) DEFAULT '0.00',
  `server_maintenance_cost` float(10,2) DEFAULT '0.00',
  `server_maintenance_term` int(8) DEFAULT '0',
  `server_lifespan` int(8) DEFAULT '0',
  `server_power_consumption` int(8) DEFAULT '0',
  `server_qty` int(8) DEFAULT '0',
  `server_disposal_cost` float(10,2) DEFAULT '0.00',
  `server_rack_size_u` int(8) DEFAULT '0',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 COMMENT='cost_input';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `intel_servers`
--

LOCK TABLES `intel_servers` WRITE;
/*!40000 ALTER TABLE `intel_servers` DISABLE KEYS */;
INSERT INTO `intel_servers` VALUES (9,'Prod Srvs    ','Production','01/01/2014','GBP','DC 1',4,6,8,'No','No','No',0,0,3500.00,245.00,3,4,0,4,100.00,4,'eamonnkillian@gmail.com','2014-05-17 08:21:00'),(10,'test2    ','Production','01/01/2014','GBP','DC 1',4,6,8,'No','No','No',0,0,2500.00,120.00,3,4,0,4,100.00,4,'eamonnkillian@gmail.com','2014-05-21 13:54:31'),(11,'Test Again   ','Production','01/01/2014','GBP','DC 1',2,1,1,'No','No','No',0,0,0.00,0.00,0,0,0,0,0.00,0,'eamonnkillian@gmail.com','2014-05-21 13:54:32'),(12,'Graphics Servers  ','Production','15/05/2014','GBP','DC 1',8,6,8,'No','No','No',0,0,10000.00,1000.00,0,0,0,2,0.00,6,'eamonnkillian@gmail.com','2014-05-22 06:18:45');
/*!40000 ALTER TABLE `intel_servers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `intellectual_property_rights`
--

DROP TABLE IF EXISTS `intellectual_property_rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `intellectual_property_rights` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_currency` varchar(4) DEFAULT 'GBP',
  `2014` float(10,2) NOT NULL DEFAULT '0.00',
  `2015` float(10,2) NOT NULL DEFAULT '0.00',
  `2016` float(10,2) NOT NULL DEFAULT '0.00',
  `2017` float(10,2) NOT NULL DEFAULT '0.00',
  `2018` float(10,2) NOT NULL DEFAULT '0.00',
  `2019` float(10,2) NOT NULL DEFAULT '0.00',
  `2020` float(10,2) NOT NULL DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `intellectual_property_rights`
--

LOCK TABLES `intellectual_property_rights` WRITE;
/*!40000 ALTER TABLE `intellectual_property_rights` DISABLE KEYS */;
INSERT INTO `intellectual_property_rights` VALUES (3,'GBP',0.00,0.00,0.00,0.00,0.00,0.00,0.00,NULL,'2014-04-19 10:21:29');
/*!40000 ALTER TABLE `intellectual_property_rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `internal_audit`
--

DROP TABLE IF EXISTS `internal_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `internal_audit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_currency` varchar(4) DEFAULT 'GBP',
  `2014` float DEFAULT NULL,
  `2015` float DEFAULT NULL,
  `2016` float DEFAULT NULL,
  `2017` float DEFAULT NULL,
  `2018` float DEFAULT NULL,
  `2019` float DEFAULT NULL,
  `2020` float DEFAULT NULL,
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `internal_audit`
--

LOCK TABLES `internal_audit` WRITE;
/*!40000 ALTER TABLE `internal_audit` DISABLE KEYS */;
INSERT INTO `internal_audit` VALUES (1,'GBP',0,0,0,0,0,0,0,'eamonnkillian@gmail.com','2014-04-29 10:00:36');
/*!40000 ALTER TABLE `internal_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `internal_or_external`
--

DROP TABLE IF EXISTS `internal_or_external`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `internal_or_external` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `internal_or_external` varchar(23) DEFAULT NULL,
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `internal_or_external`
--

LOCK TABLES `internal_or_external` WRITE;
/*!40000 ALTER TABLE `internal_or_external` DISABLE KEYS */;
INSERT INTO `internal_or_external` VALUES (1,'Internal_Infrastructure','eamonnkillian@gmail.com','2014-05-19 11:04:34'),(2,'External_Provider','eamonnkillian@gmail.com','2014-05-19 11:04:34');
/*!40000 ALTER TABLE `internal_or_external` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `intrusion`
--

DROP TABLE IF EXISTS `intrusion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `intrusion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `intrusion_type` varchar(45) DEFAULT NULL,
  `assignment` varchar(11) DEFAULT NULL,
  `currency` varchar(8) DEFAULT NULL,
  `device_purchase_date` varchar(10) DEFAULT NULL,
  `intrusion_location` varchar(45) DEFAULT NULL,
  `intrusion_cost` float(10,2) DEFAULT '0.00',
  `intrusion_maintenance_cost` float(10,2) DEFAULT '0.00',
  `intrusion_maintenance_term` int(6) DEFAULT '0',
  `intrusion_lifespan` int(6) DEFAULT '0',
  `intrusion_power_consumption` int(6) DEFAULT '0',
  `intrusion_qty` int(6) DEFAULT '0',
  `intrusion_disposal_cost` int(6) DEFAULT '0',
  `intrusion_rack_size_u` int(6) DEFAULT '0',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='cost_input';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `intrusion`
--

LOCK TABLES `intrusion` WRITE;
/*!40000 ALTER TABLE `intrusion` DISABLE KEYS */;
/*!40000 ALTER TABLE `intrusion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `label_printer`
--

DROP TABLE IF EXISTS `label_printer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `label_printer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `printer_type` varchar(45) DEFAULT NULL,
  `currency` varchar(8) DEFAULT NULL,
  `printer_purchase_date` varchar(10) DEFAULT NULL,
  `printer_location` varchar(45) DEFAULT NULL,
  `colour` varchar(4) DEFAULT NULL,
  `printer_cost` float DEFAULT NULL,
  `printer_maintenance_cost_per_annum` float DEFAULT NULL,
  `printer_maintenance_term` int(11) DEFAULT NULL,
  `printer_lifespan` varchar(45) DEFAULT NULL,
  `printer_power_consumption` float DEFAULT NULL,
  `printer_consumables_cost` float(10,2) DEFAULT '0.00',
  `estimated_consumables_qty` int(6) DEFAULT '0',
  `printer_qty` int(11) DEFAULT NULL,
  `printer_disposal_cost` float(10,2) DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='cost_input';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `label_printer`
--

LOCK TABLES `label_printer` WRITE;
/*!40000 ALTER TABLE `label_printer` DISABLE KEYS */;
/*!40000 ALTER TABLE `label_printer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `labour`
--

DROP TABLE IF EXISTS `labour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `labour` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_category` varchar(45) DEFAULT NULL,
  `employee_type` varchar(45) DEFAULT 'Central Performer',
  `currency` varchar(4) DEFAULT NULL,
  `numbers_of_this_employee` int(6) DEFAULT '0',
  `salary` float(10,2) DEFAULT '0.00',
  `award_bonus_allocation` float(4,2) DEFAULT '0.00',
  `pension_contribution` float(10,2) DEFAULT '0.00',
  `life_insurances` float(10,2) DEFAULT '0.00',
  `health_insurance` float(10,2) DEFAULT '0.00',
  `longterm_disability_insurance` float(10,2) DEFAULT '0.00',
  `dental_insurance` float(10,2) DEFAULT '0.00',
  `vision_insurance` float(10,2) DEFAULT '0.00',
  `group_legal_insurances` float(10,2) DEFAULT '0.00',
  `gym_club_memberships` float(10,2) DEFAULT '0.00',
  `rail_travel_ticket` float(10,2) DEFAULT '0.00',
  `lunch_allowance` float(10,2) DEFAULT '0.00',
  `company_car_plan` float(10,2) DEFAULT '0.00',
  `company_car_insurance` float(10,2) DEFAULT '0.00',
  `fuel_card` float(10,2) DEFAULT '0.00',
  `print_consumables` float(10,2) DEFAULT '0.00',
  `broadband` float(10,2) DEFAULT '0.00',
  `internal_IT_support` float(10,2) DEFAULT '0.00',
  `central_IT_services` float(10,2) DEFAULT '0.00',
  `HR_employee_mgmt` float(10,2) DEFAULT '0.00',
  `HR_recruitment` float(10,2) DEFAULT '0.00',
  `distance_learning` float(10,2) DEFAULT '0.00',
  `residential_learning` float(10,2) DEFAULT '0.00',
  `conferences_events` float(10,2) DEFAULT '0.00',
  `expenses_allocation` float(4,2) DEFAULT '0.00',
  `maternity_paternity_allocation` float(4,2) DEFAULT '0.00',
  `sickness_allocation` float(4,2) DEFAULT '0.00',
  `legal_challenges_allocation` float(4,2) DEFAULT '0.00',
  `redundancy_allocation` float(4,2) DEFAULT '0.00',
  `jury_civil_duties_allocation` float(4,2) DEFAULT '0.00',
  `employer_social_security_allocation` float(4,2) DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1 COMMENT='cost_input';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `labour`
--

LOCK TABLES `labour` WRITE;
/*!40000 ALTER TABLE `labour` DISABLE KEYS */;
INSERT INTO `labour` VALUES (27,'Helpdesk Agents','Central Performer','GBP',2,16000.00,10.00,850.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,5.00,0.00,0.00,0.00,0.00,0.00,6.00,'eamonnkillian@gmail.com','2014-05-24 14:17:40'),(28,'Technies','On-site Performer','GBP',2,28000.00,6.00,1200.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,6.00,'eamonnkillian@gmail.com','2014-05-24 14:59:25'),(29,'Owner CEO','Non-Performer','GBP',1,50000.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,6.00,'eamonnkillian@gmail.com','2014-05-24 14:05:30'),(30,'Test Employee','Central Performer','GBP',2,100000.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'eamonnkillian@gmail.com','2014-05-24 14:05:37');
/*!40000 ALTER TABLE `labour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laptop`
--

DROP TABLE IF EXISTS `laptop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `laptop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `laptop_type` varchar(45) DEFAULT NULL,
  `assignment` varchar(11) DEFAULT NULL,
  `currency` varchar(8) DEFAULT NULL,
  `laptop_purchase_date` varchar(10) DEFAULT NULL,
  `laptop_location` varchar(45) DEFAULT NULL,
  `laptop_cost` float(10,2) DEFAULT '0.00',
  `laptop_maintenance_cost` float(10,2) DEFAULT '0.00',
  `laptop_maintenance_term` int(6) DEFAULT '0',
  `laptop_lifespan` int(6) DEFAULT '0',
  `laptop_power_consumption` int(6) DEFAULT '0',
  `laptop_qty` int(6) DEFAULT '0',
  `laptop_disposal_cost` float(10,2) DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COMMENT='cost_input';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laptop`
--

LOCK TABLES `laptop` WRITE;
/*!40000 ALTER TABLE `laptop` DISABLE KEYS */;
INSERT INTO `laptop` VALUES (3,'MacBook Pros','Production','GBP','01/01/2014','DC 1',2200.00,0.00,0,4,0,5,120.00,'phil@niu.com','2014-05-03 09:59:20');
/*!40000 ALTER TABLE `laptop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laser_desktop`
--

DROP TABLE IF EXISTS `laser_desktop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `laser_desktop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `printer_type` varchar(45) DEFAULT NULL,
  `currency` varchar(8) DEFAULT NULL,
  `printer_location` varchar(45) DEFAULT NULL,
  `printer_purchase_date` varchar(45) DEFAULT NULL,
  `printer_memory` float(10,2) DEFAULT NULL,
  `scanner` varchar(4) DEFAULT NULL,
  `copier` varchar(4) DEFAULT NULL,
  `fax` varchar(4) DEFAULT NULL,
  `colour` varchar(4) DEFAULT NULL,
  `printer_input_drawers` int(4) DEFAULT NULL,
  `printer_cost` float(10,2) DEFAULT NULL,
  `printer_maintenance_cost_per_annum` float(10,2) DEFAULT NULL,
  `printer_maintenance_term` int(11) DEFAULT NULL,
  `printer_lifespan` varchar(45) DEFAULT NULL,
  `printer_power_consumption` int(10) DEFAULT NULL,
  `printer_consumables_cost` float(10,2) DEFAULT '0.00',
  `estimated_consumables_qty` int(6) DEFAULT '0',
  `printer_qty` int(11) DEFAULT NULL,
  `printer_disposal_cost` float(10,2) DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='cost_input';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laser_desktop`
--

LOCK TABLES `laser_desktop` WRITE;
/*!40000 ALTER TABLE `laser_desktop` DISABLE KEYS */;
/*!40000 ALTER TABLE `laser_desktop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laser_multifunction`
--

DROP TABLE IF EXISTS `laser_multifunction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `laser_multifunction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `printer_type` varchar(45) DEFAULT NULL,
  `currency` varchar(8) DEFAULT NULL,
  `printer_location` varchar(45) DEFAULT NULL,
  `printer_purchase_date` varchar(45) DEFAULT NULL,
  `printer_memory` float(10,2) DEFAULT NULL,
  `scanner` varchar(4) DEFAULT NULL,
  `copier` varchar(4) DEFAULT NULL,
  `fax` varchar(4) DEFAULT NULL,
  `colour` varchar(4) DEFAULT NULL,
  `printer_input_drawers` int(4) DEFAULT NULL,
  `printer_cost` float(10,2) DEFAULT NULL,
  `printer_maintenance_cost_per_annum` float(10,2) DEFAULT NULL,
  `printer_maintenance_term` int(11) DEFAULT NULL,
  `printer_lifespan` varchar(45) DEFAULT NULL,
  `printer_power_consumption` int(10) DEFAULT NULL,
  `printer_consumables_cost` float(10,2) DEFAULT '0.00',
  `estimated_consumables_qty` int(6) DEFAULT '0',
  `printer_qty` int(11) DEFAULT NULL,
  `printer_disposal_cost` float(10,2) DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='cost_input';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laser_multifunction`
--

LOCK TABLES `laser_multifunction` WRITE;
/*!40000 ALTER TABLE `laser_multifunction` DISABLE KEYS */;
/*!40000 ALTER TABLE `laser_multifunction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laser_workgroup`
--

DROP TABLE IF EXISTS `laser_workgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `laser_workgroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `printer_type` varchar(45) DEFAULT NULL,
  `currency` varchar(8) DEFAULT NULL,
  `printer_location` varchar(45) DEFAULT NULL,
  `printer_purchase_date` varchar(45) DEFAULT NULL,
  `printer_memory` float(10,2) DEFAULT NULL,
  `scanner` varchar(4) DEFAULT NULL,
  `copier` varchar(4) DEFAULT NULL,
  `fax` varchar(4) DEFAULT NULL,
  `colour` varchar(4) DEFAULT NULL,
  `printer_input_drawers` int(4) DEFAULT NULL,
  `printer_cost` float(10,2) DEFAULT NULL,
  `printer_maintenance_cost_per_annum` float(10,2) DEFAULT NULL,
  `printer_maintenance_term` int(11) DEFAULT NULL,
  `printer_lifespan` varchar(45) DEFAULT NULL,
  `printer_power_consumption` int(10) DEFAULT NULL,
  `printer_consumables_cost` float(10,2) DEFAULT '0.00',
  `estimated_consumables_qty` int(6) DEFAULT '0',
  `printer_qty` int(11) DEFAULT NULL,
  `printer_disposal_cost` float(10,2) DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='cost_input';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laser_workgroup`
--

LOCK TABLES `laser_workgroup` WRITE;
/*!40000 ALTER TABLE `laser_workgroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `laser_workgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `launch_events`
--

DROP TABLE IF EXISTS `launch_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `launch_events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_currency` varchar(4) DEFAULT 'GBP',
  `2014` float(10,2) NOT NULL DEFAULT '0.00',
  `2015` float(10,2) NOT NULL DEFAULT '0.00',
  `2016` float(10,2) NOT NULL DEFAULT '0.00',
  `2017` float(10,2) NOT NULL DEFAULT '0.00',
  `2018` float(10,2) NOT NULL DEFAULT '0.00',
  `2019` float(10,2) NOT NULL DEFAULT '0.00',
  `2020` float(10,2) NOT NULL DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `launch_events`
--

LOCK TABLES `launch_events` WRITE;
/*!40000 ALTER TABLE `launch_events` DISABLE KEYS */;
INSERT INTO `launch_events` VALUES (3,'GBP',0.00,0.00,0.00,0.00,0.00,0.00,0.00,'eamonnkillian@gmail.com','2014-04-29 10:06:03');
/*!40000 ALTER TABLE `launch_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lead_generation_campaigns`
--

DROP TABLE IF EXISTS `lead_generation_campaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lead_generation_campaigns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_currency` varchar(4) DEFAULT 'GBP',
  `2014` float(10,2) NOT NULL DEFAULT '0.00',
  `2015` float(10,2) NOT NULL DEFAULT '0.00',
  `2016` float(10,2) NOT NULL DEFAULT '0.00',
  `2017` float(10,2) NOT NULL DEFAULT '0.00',
  `2018` float(10,2) NOT NULL DEFAULT '0.00',
  `2019` float(10,2) NOT NULL DEFAULT '0.00',
  `2020` float(10,2) NOT NULL DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lead_generation_campaigns`
--

LOCK TABLES `lead_generation_campaigns` WRITE;
/*!40000 ALTER TABLE `lead_generation_campaigns` DISABLE KEYS */;
INSERT INTO `lead_generation_campaigns` VALUES (3,'GBP',25000.00,0.00,0.00,0.00,0.00,0.00,0.00,'phil@niu.com','2014-05-03 10:04:06');
/*!40000 ALTER TABLE `lead_generation_campaigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loadbalancers`
--

DROP TABLE IF EXISTS `loadbalancers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loadbalancers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loadbalancers_type` varchar(45) DEFAULT NULL,
  `assignment` varchar(11) DEFAULT NULL,
  `currency` varchar(8) DEFAULT NULL,
  `loadbalancers_purchase_date` varchar(10) DEFAULT NULL,
  `loadbalancers_number_ports` int(6) DEFAULT '0',
  `loadbalancers_location` varchar(45) DEFAULT NULL,
  `loadbalancers_cost` float(10,2) DEFAULT '0.00',
  `loadbalancers_maintenance_cost` float(10,2) DEFAULT '0.00',
  `loadbalancers_maintenance_term` int(6) DEFAULT '0',
  `loadbalancers_lifespan` int(6) DEFAULT '0',
  `loadbalancers_power_consumption` int(6) DEFAULT '0',
  `loadbalancers_qty` int(6) DEFAULT '0',
  `loadbalancers_disposal_cost` int(6) DEFAULT '0',
  `loadbalancers_rack_size_u` int(6) DEFAULT '0',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='cost_input';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loadbalancers`
--

LOCK TABLES `loadbalancers` WRITE;
/*!40000 ALTER TABLE `loadbalancers` DISABLE KEYS */;
/*!40000 ALTER TABLE `loadbalancers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mainframe_servers`
--

DROP TABLE IF EXISTS `mainframe_servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mainframe_servers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_type` varchar(45) DEFAULT NULL,
  `assignment` varchar(11) DEFAULT NULL,
  `server_purchase_date` varchar(10) DEFAULT NULL,
  `currency` varchar(8) DEFAULT NULL,
  `server_location` varchar(45) DEFAULT NULL,
  `server_number_IFLs` float DEFAULT NULL,
  `server_memory_GB` float DEFAULT NULL,
  `server_IO_ports` float DEFAULT NULL,
  `server_crypto_engine` varchar(4) DEFAULT NULL,
  `server_cost` float DEFAULT NULL,
  `server_maintenance_cost` float DEFAULT NULL,
  `server_maintenance_term` int(11) DEFAULT NULL,
  `server_lifespan` varchar(45) DEFAULT NULL,
  `server_power_consumption` float DEFAULT NULL,
  `server_qty` int(11) DEFAULT NULL,
  `server_disposal_cost` float(10,2) DEFAULT '0.00',
  `server_rack_size_u` int(11) DEFAULT NULL,
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='cost_input';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mainframe_servers`
--

LOCK TABLES `mainframe_servers` WRITE;
/*!40000 ALTER TABLE `mainframe_servers` DISABLE KEYS */;
/*!40000 ALTER TABLE `mainframe_servers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `market_intelligence_budget`
--

DROP TABLE IF EXISTS `market_intelligence_budget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `market_intelligence_budget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_currency` varchar(4) DEFAULT 'GBP',
  `2014` float(10,2) DEFAULT NULL,
  `2015` float(10,2) DEFAULT NULL,
  `2016` float(10,2) DEFAULT NULL,
  `2017` float(10,2) DEFAULT NULL,
  `2018` float(10,2) DEFAULT NULL,
  `2019` float(10,2) DEFAULT NULL,
  `2020` float(10,2) DEFAULT NULL,
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `market_intelligence_budget`
--

LOCK TABLES `market_intelligence_budget` WRITE;
/*!40000 ALTER TABLE `market_intelligence_budget` DISABLE KEYS */;
INSERT INTO `market_intelligence_budget` VALUES (2,'GBP',1000.00,0.00,0.00,0.00,0.00,0.00,0.00,'phil@niu.com','2014-05-03 10:02:28');
/*!40000 ALTER TABLE `market_intelligence_budget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `market_research_budget`
--

DROP TABLE IF EXISTS `market_research_budget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `market_research_budget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_currency` varchar(4) DEFAULT 'GBP',
  `2014` float(10,2) NOT NULL DEFAULT '0.00',
  `2015` float(10,2) NOT NULL DEFAULT '0.00',
  `2016` float(10,2) NOT NULL DEFAULT '0.00',
  `2017` float(10,2) NOT NULL DEFAULT '0.00',
  `2018` float(10,2) NOT NULL DEFAULT '0.00',
  `2019` float(10,2) NOT NULL DEFAULT '0.00',
  `2020` float(10,2) NOT NULL DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `market_research_budget`
--

LOCK TABLES `market_research_budget` WRITE;
/*!40000 ALTER TABLE `market_research_budget` DISABLE KEYS */;
INSERT INTO `market_research_budget` VALUES (3,'USD',2500.00,0.00,0.00,0.00,0.00,0.00,0.00,'phil@niu.com','2014-05-03 10:03:37');
/*!40000 ALTER TABLE `market_research_budget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marketing_bodies_membership`
--

DROP TABLE IF EXISTS `marketing_bodies_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marketing_bodies_membership` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_currency` varchar(4) DEFAULT 'GBP',
  `2014` float(10,2) NOT NULL DEFAULT '0.00',
  `2015` float(10,2) NOT NULL DEFAULT '0.00',
  `2016` float(10,2) NOT NULL DEFAULT '0.00',
  `2017` float(10,2) NOT NULL DEFAULT '0.00',
  `2018` float(10,2) NOT NULL DEFAULT '0.00',
  `2019` float(10,2) NOT NULL DEFAULT '0.00',
  `2020` float(10,2) NOT NULL DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marketing_bodies_membership`
--

LOCK TABLES `marketing_bodies_membership` WRITE;
/*!40000 ALTER TABLE `marketing_bodies_membership` DISABLE KEYS */;
INSERT INTO `marketing_bodies_membership` VALUES (3,'GBP',0.00,0.00,0.00,0.00,0.00,0.00,0.00,NULL,'2014-04-18 20:10:47');
/*!40000 ALTER TABLE `marketing_bodies_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merchandise_budget`
--

DROP TABLE IF EXISTS `merchandise_budget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `merchandise_budget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_currency` varchar(4) DEFAULT 'GBP',
  `2014` float(10,2) NOT NULL DEFAULT '0.00',
  `2015` float(10,2) NOT NULL DEFAULT '0.00',
  `2016` float(10,2) NOT NULL DEFAULT '0.00',
  `2017` float(10,2) NOT NULL DEFAULT '0.00',
  `2018` float(10,2) NOT NULL DEFAULT '0.00',
  `2019` float(10,2) NOT NULL DEFAULT '0.00',
  `2020` float(10,2) NOT NULL DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchandise_budget`
--

LOCK TABLES `merchandise_budget` WRITE;
/*!40000 ALTER TABLE `merchandise_budget` DISABLE KEYS */;
INSERT INTO `merchandise_budget` VALUES (3,'GBP',5000.00,0.00,0.00,0.00,0.00,0.00,0.00,'phil@niu.com','2014-05-03 10:03:31');
/*!40000 ALTER TABLE `merchandise_budget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mobile_phone`
--

DROP TABLE IF EXISTS `mobile_phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mobile_phone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mobile_phone_type` varchar(45) DEFAULT NULL,
  `assignment` varchar(11) DEFAULT NULL,
  `currency` varchar(8) DEFAULT NULL,
  `phone_purchase_date` varchar(10) DEFAULT NULL,
  `mobile_phone_location` varchar(45) DEFAULT NULL,
  `mobile_phone_cost` float(10,2) DEFAULT '0.00',
  `mobile_phone_maintenance_cost` float(10,2) DEFAULT '0.00',
  `mobile_phone_maintenance_term` int(6) DEFAULT '0',
  `mobile_phone_airtime_cost_pa` float(10,2) DEFAULT '0.00',
  `mobile_phone_lifespan` int(6) DEFAULT '0',
  `mobile_phone_qty` int(6) DEFAULT '0',
  `mobile_phone_disposal_cost` float(10,2) DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COMMENT='cost_input';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mobile_phone`
--

LOCK TABLES `mobile_phone` WRITE;
/*!40000 ALTER TABLE `mobile_phone` DISABLE KEYS */;
INSERT INTO `mobile_phone` VALUES (4,'iPhones','Production','GBP','01/01/2014','DC 1',500.00,0.00,0,240.00,0,5,50.00,'phil@niu.com','2014-05-03 09:59:59');
/*!40000 ALTER TABLE `mobile_phone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mobile_phone_apps`
--

DROP TABLE IF EXISTS `mobile_phone_apps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mobile_phone_apps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `software_type` varchar(45) DEFAULT NULL,
  `assignment` varchar(11) DEFAULT NULL,
  `currency` varchar(45) DEFAULT NULL,
  `software_purchase_date` varchar(10) DEFAULT NULL,
  `software_name` varchar(45) DEFAULT NULL,
  `software_purchase_cost` float(10,2) DEFAULT '0.00',
  `software_annual_maintenance_cost` float(10,2) DEFAULT '0.00',
  `software_maintenance_term` int(8) DEFAULT '0',
  `software_description` blob,
  `software_location` varchar(45) DEFAULT NULL,
  `software_annual_subscription_cost` float(10,2) DEFAULT '0.00',
  `software_licences_qty` int(8) DEFAULT '0',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='cost_input';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mobile_phone_apps`
--

LOCK TABLES `mobile_phone_apps` WRITE;
/*!40000 ALTER TABLE `mobile_phone_apps` DISABLE KEYS */;
/*!40000 ALTER TABLE `mobile_phone_apps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modems`
--

DROP TABLE IF EXISTS `modems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modems_type` varchar(45) DEFAULT NULL,
  `assignment` varchar(11) DEFAULT NULL,
  `currency` varchar(8) DEFAULT NULL,
  `modems_purchase_date` varchar(10) DEFAULT NULL,
  `modems_location` varchar(45) DEFAULT NULL,
  `modems_cost` float(10,2) DEFAULT '0.00',
  `modems_maintenance_cost` float(10,2) DEFAULT '0.00',
  `modems_maintenance_term` int(6) DEFAULT '0',
  `modems_lifespan` int(6) DEFAULT '0',
  `modems_power_consumption` int(6) DEFAULT '0',
  `modems_qty` int(6) DEFAULT '0',
  `modems_disposal_cost` int(6) DEFAULT '0',
  `modems_rack_size_u` int(6) DEFAULT '0',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='cost_input';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modems`
--

LOCK TABLES `modems` WRITE;
/*!40000 ALTER TABLE `modems` DISABLE KEYS */;
/*!40000 ALTER TABLE `modems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nas_storage`
--

DROP TABLE IF EXISTS `nas_storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nas_storage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nas_storage_type` varchar(45) DEFAULT NULL,
  `assignment` varchar(11) DEFAULT NULL,
  `currency` varchar(8) DEFAULT NULL,
  `storage_purchase_date` varchar(10) DEFAULT NULL,
  `nas_storage_IO_GBE_ports` varchar(45) DEFAULT NULL,
  `nas_memory` int(8) DEFAULT '0',
  `nas_raw_capacity_TB` int(8) DEFAULT '0',
  `nas_formatted_capacity_TB` int(8) DEFAULT '0',
  `nas_storage_location` varchar(45) DEFAULT NULL,
  `nas_storage_cost` float(10,2) DEFAULT '0.00',
  `nas_storage_maintenance_term` int(8) DEFAULT '0',
  `nas_storage_maintenance_cost` float(10,2) DEFAULT '0.00',
  `nas_storage_lifespan` int(8) DEFAULT '0',
  `nas_storage_power_consumption` int(8) DEFAULT '0',
  `nas_storage_qty` int(8) DEFAULT '0',
  `nas_storage_disposal_cost` float(10,2) DEFAULT '0.00',
  `nas_storage_rack_size_u` int(8) DEFAULT '0',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COMMENT='cost_input';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nas_storage`
--

LOCK TABLES `nas_storage` WRITE;
/*!40000 ALTER TABLE `nas_storage` DISABLE KEYS */;
INSERT INTO `nas_storage` VALUES (3,'BigNas','Production','GBP','01/01/2014','10',1,144,120,'DC 1',14000.00,0,0.00,0,0,2,0.00,6,'phil@niu.com','2014-05-03 10:01:29');
/*!40000 ALTER TABLE `nas_storage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `office_software`
--

DROP TABLE IF EXISTS `office_software`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `office_software` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `software_type` varchar(45) DEFAULT NULL,
  `assignment` varchar(11) DEFAULT NULL,
  `currency` varchar(45) DEFAULT NULL,
  `software_purchase_date` varchar(10) DEFAULT NULL,
  `software_name` varchar(45) DEFAULT NULL,
  `software_purchase_cost` float(10,2) DEFAULT '0.00',
  `software_annual_maintenance_cost` float(10,2) DEFAULT '0.00',
  `software_maintenance_term` int(8) DEFAULT '0',
  `software_description` blob,
  `software_location` varchar(45) DEFAULT NULL,
  `software_annual_subscription_cost` float(10,2) DEFAULT '0.00',
  `software_licences_qty` int(8) DEFAULT '0',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COMMENT='cost_input';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `office_software`
--

LOCK TABLES `office_software` WRITE;
/*!40000 ALTER TABLE `office_software` DISABLE KEYS */;
INSERT INTO `office_software` VALUES (5,'Office 365','Production','GBP','01/01/2014','Microsoft',785.00,0.00,0,'','DC 1',0.00,1,'phil@niu.com','2014-05-03 10:00:38');
/*!40000 ALTER TABLE `office_software` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offices`
--

DROP TABLE IF EXISTS `offices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `office_name` varchar(45) DEFAULT NULL,
  `currency` varchar(45) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `street_number` varchar(6) DEFAULT 'Null',
  `office_address1` varchar(45) DEFAULT NULL,
  `office_address2` varchar(45) DEFAULT NULL,
  `office_address3` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `office_post_code` varchar(45) DEFAULT NULL,
  `office_telephone_number` varchar(15) DEFAULT NULL,
  `office_fax_number` varchar(15) DEFAULT NULL,
  `office_number_of_seats` int(6) DEFAULT '0',
  `office_size_sq_ft` int(8) DEFAULT '0',
  `furniture_cost` float(10,2) DEFAULT '0.00',
  `rent_or_depreciation_cost_pa` float(10,2) DEFAULT '0.00',
  `office_power_consumption_per_annum` int(8) DEFAULT '0',
  `office_maintenance_cost_per_annum` float(10,2) DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1 COMMENT='cost_input';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offices`
--

LOCK TABLES `offices` WRITE;
/*!40000 ALTER TABLE `offices` DISABLE KEYS */;
INSERT INTO `offices` VALUES (22,'HQ','GBP','United Kindom','33','Sample HQ Office','Some Address','More Address','London','','01234567890','01234567890',0,0,0.00,12000.00,0,0.00,'eamonnkillian@gmail.com','2014-05-26 07:27:59');
/*!40000 ALTER TABLE `offices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paas_clouds`
--

DROP TABLE IF EXISTS `paas_clouds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paas_clouds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paas_clouds_type` varchar(45) DEFAULT NULL,
  `assignment` varchar(11) DEFAULT NULL,
  `currency` varchar(8) DEFAULT NULL,
  `paas_provider` varchar(45) DEFAULT NULL,
  `paas_contract_purchase_date` varchar(10) DEFAULT NULL,
  `paas_number_users` float DEFAULT NULL,
  `paas_baseline_cost_per_month_each` float DEFAULT NULL,
  `paas_anticipated_additional_cost_per_month_each` float DEFAULT NULL,
  `paas_contract_term_months` int(4) DEFAULT NULL,
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paas_clouds`
--

LOCK TABLES `paas_clouds` WRITE;
/*!40000 ALTER TABLE `paas_clouds` DISABLE KEYS */;
/*!40000 ALTER TABLE `paas_clouds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paas_service_products`
--

DROP TABLE IF EXISTS `paas_service_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paas_service_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(45) DEFAULT NULL,
  `amount_of_VMs` int(6) DEFAULT '0',
  `amount_of_memory_MBs` int(6) DEFAULT '0',
  `amount_of_storage_GBs` int(6) DEFAULT '0',
  `product_source` varchar(23) DEFAULT NULL,
  `description` blob,
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paas_service_products`
--

LOCK TABLES `paas_service_products` WRITE;
/*!40000 ALTER TABLE `paas_service_products` DISABLE KEYS */;
INSERT INTO `paas_service_products` VALUES (11,'test of Pass',3,1024,25,'Internal_Infrastructure','bfgbfgbfg','eamonnkillian@gmail.com','2014-05-25 15:23:55'),(12,'testing',8,1000,1000,'External_Provider','test','eamonnkillian@gmail.com','2014-05-26 08:25:55');
/*!40000 ALTER TABLE `paas_service_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paas_service_products_sales`
--

DROP TABLE IF EXISTS `paas_service_products_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paas_service_products_sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(45) DEFAULT NULL,
  `service_start_date` varchar(10) DEFAULT NULL,
  `service_finish_date` varchar(10) DEFAULT NULL,
  `purchased_qty` int(6) DEFAULT NULL,
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paas_service_products_sales`
--

LOCK TABLES `paas_service_products_sales` WRITE;
/*!40000 ALTER TABLE `paas_service_products_sales` DISABLE KEYS */;
INSERT INTO `paas_service_products_sales` VALUES (8,'testing','01/01/2014','31/12/2020',250,'eamonnkillian@gmail.com','2014-05-26 08:34:30'),(9,'test of Pass','01/01/2014','31/12/2020',12,'eamonnkillian@gmail.com','2014-05-26 08:34:41');
/*!40000 ALTER TABLE `paas_service_products_sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `penetration_tests`
--

DROP TABLE IF EXISTS `penetration_tests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `penetration_tests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_currency` varchar(4) DEFAULT 'GBP',
  `2014` float DEFAULT NULL,
  `2015` float DEFAULT NULL,
  `2016` float DEFAULT NULL,
  `2017` float DEFAULT NULL,
  `2018` float DEFAULT NULL,
  `2019` float DEFAULT NULL,
  `2020` float DEFAULT NULL,
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `penetration_tests`
--

LOCK TABLES `penetration_tests` WRITE;
/*!40000 ALTER TABLE `penetration_tests` DISABLE KEYS */;
INSERT INTO `penetration_tests` VALUES (1,'GBP',45000,0,0,0,0,0,0,'phil@niu.com','2014-05-03 15:48:00');
/*!40000 ALTER TABLE `penetration_tests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portable_drive`
--

DROP TABLE IF EXISTS `portable_drive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portable_drive` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `portable_drive_type` varchar(45) DEFAULT NULL,
  `assignment` varchar(11) DEFAULT NULL,
  `currency` varchar(8) DEFAULT NULL,
  `drive_purchase_date` varchar(10) DEFAULT NULL,
  `portable_drive_number_ports` varchar(45) DEFAULT NULL,
  `portable_drive_location` varchar(45) DEFAULT NULL,
  `portable_drive_cost` varchar(45) DEFAULT NULL,
  `portable_drive_maintenance_term` varchar(45) DEFAULT NULL,
  `portable_drive_maintenance_cost` varchar(45) DEFAULT NULL,
  `portable_drive_lifespan` varchar(45) DEFAULT NULL,
  `portable_drive_power_consumption` varchar(45) DEFAULT NULL,
  `portable_drive_qty` varchar(45) DEFAULT NULL,
  `portable_drive_disposal_cost` int(6) DEFAULT '0',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='cost_input';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portable_drive`
--

LOCK TABLES `portable_drive` WRITE;
/*!40000 ALTER TABLE `portable_drive` DISABLE KEYS */;
/*!40000 ALTER TABLE `portable_drive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `power_servers`
--

DROP TABLE IF EXISTS `power_servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `power_servers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_type` varchar(45) DEFAULT NULL,
  `assignment` varchar(11) DEFAULT NULL,
  `server_purchase_date` varchar(10) DEFAULT NULL,
  `currency` varchar(8) DEFAULT NULL,
  `server_location` varchar(45) DEFAULT NULL,
  `server_number_processor_books` int(6) DEFAULT '0',
  `server_number_processors` int(8) DEFAULT '0',
  `server_number_cores_per_processor` int(8) DEFAULT '0',
  `server_memory_GB` int(8) DEFAULT '0',
  `server_hard_drive` varchar(3) DEFAULT NULL,
  `server_cddvd_drive` varchar(3) DEFAULT NULL,
  `server_video_card` varchar(3) DEFAULT NULL,
  `server_IO_drawers` int(8) DEFAULT NULL,
  `server_IO_ports` int(8) DEFAULT NULL,
  `server_cost` float(10,2) DEFAULT '0.00',
  `server_maintenance_cost` float(10,2) DEFAULT '0.00',
  `server_maintenance_term` int(8) DEFAULT '0',
  `server_lifespan` int(8) DEFAULT '0',
  `server_power_consumption` int(8) DEFAULT '0',
  `server_qty` int(8) DEFAULT '0',
  `server_disposal_cost` float(10,2) DEFAULT '0.00',
  `server_rack_size_u` int(8) DEFAULT '0',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='cost_input';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `power_servers`
--

LOCK TABLES `power_servers` WRITE;
/*!40000 ALTER TABLE `power_servers` DISABLE KEYS */;
/*!40000 ALTER TABLE `power_servers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `print_media_budget`
--

DROP TABLE IF EXISTS `print_media_budget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `print_media_budget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_currency` varchar(4) DEFAULT 'GBP',
  `2014` float(10,2) NOT NULL DEFAULT '0.00',
  `2015` float(10,2) NOT NULL DEFAULT '0.00',
  `2016` float(10,2) NOT NULL DEFAULT '0.00',
  `2017` float(10,2) NOT NULL DEFAULT '0.00',
  `2018` float(10,2) NOT NULL DEFAULT '0.00',
  `2019` float(10,2) NOT NULL DEFAULT '0.00',
  `2020` float(10,2) NOT NULL DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `print_media_budget`
--

LOCK TABLES `print_media_budget` WRITE;
/*!40000 ALTER TABLE `print_media_budget` DISABLE KEYS */;
INSERT INTO `print_media_budget` VALUES (3,'GBP',12000.00,0.00,0.00,0.00,0.00,0.00,0.00,'phil@niu.com','2014-05-03 10:03:46');
/*!40000 ALTER TABLE `print_media_budget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_development_tooling`
--

DROP TABLE IF EXISTS `product_development_tooling`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_development_tooling` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_currency` varchar(4) DEFAULT 'GBP',
  `2014` float(10,2) NOT NULL DEFAULT '0.00',
  `2015` float(10,2) NOT NULL DEFAULT '0.00',
  `2016` float(10,2) NOT NULL DEFAULT '0.00',
  `2017` float(10,2) NOT NULL DEFAULT '0.00',
  `2018` float(10,2) NOT NULL DEFAULT '0.00',
  `2019` float(10,2) NOT NULL DEFAULT '0.00',
  `2020` float(10,2) NOT NULL DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_development_tooling`
--

LOCK TABLES `product_development_tooling` WRITE;
/*!40000 ALTER TABLE `product_development_tooling` DISABLE KEYS */;
INSERT INTO `product_development_tooling` VALUES (3,'GBP',500.00,500.00,0.00,0.00,0.00,0.00,0.00,'eamonnkillian@gmail.com','2014-05-13 17:36:22');
/*!40000 ALTER TABLE `product_development_tooling` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_partner_evaluation`
--

DROP TABLE IF EXISTS `product_partner_evaluation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_partner_evaluation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_currency` varchar(4) DEFAULT 'GBP',
  `2014` float(10,2) NOT NULL DEFAULT '0.00',
  `2015` float(10,2) NOT NULL DEFAULT '0.00',
  `2016` float(10,2) NOT NULL DEFAULT '0.00',
  `2017` float(10,2) NOT NULL DEFAULT '0.00',
  `2018` float(10,2) NOT NULL DEFAULT '0.00',
  `2019` float(10,2) NOT NULL DEFAULT '0.00',
  `2020` float(10,2) NOT NULL DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_partner_evaluation`
--

LOCK TABLES `product_partner_evaluation` WRITE;
/*!40000 ALTER TABLE `product_partner_evaluation` DISABLE KEYS */;
INSERT INTO `product_partner_evaluation` VALUES (3,'GBP',0.00,0.00,0.00,0.00,0.00,0.00,0.00,'eamonnkillian@gmail.com','2014-04-29 10:03:54');
/*!40000 ALTER TABLE `product_partner_evaluation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professional_bodies_membership`
--

DROP TABLE IF EXISTS `professional_bodies_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `professional_bodies_membership` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_currency` varchar(4) DEFAULT 'GBP',
  `2014` float(10,2) NOT NULL DEFAULT '0.00',
  `2015` float(10,2) NOT NULL DEFAULT '0.00',
  `2016` float(10,2) NOT NULL DEFAULT '0.00',
  `2017` float(10,2) NOT NULL DEFAULT '0.00',
  `2018` float(10,2) NOT NULL DEFAULT '0.00',
  `2019` float(10,2) NOT NULL DEFAULT '0.00',
  `2020` float(10,2) NOT NULL DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professional_bodies_membership`
--

LOCK TABLES `professional_bodies_membership` WRITE;
/*!40000 ALTER TABLE `professional_bodies_membership` DISABLE KEYS */;
INSERT INTO `professional_bodies_membership` VALUES (3,'GBP',2800.00,0.00,0.00,0.00,0.00,0.00,0.00,'phil@niu.com','2014-05-03 10:02:42');
/*!40000 ALTER TABLE `professional_bodies_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projector`
--

DROP TABLE IF EXISTS `projector`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projector` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projector_type` varchar(45) DEFAULT NULL,
  `assignment` varchar(11) DEFAULT NULL,
  `currency` varchar(8) DEFAULT NULL,
  `projector_purchase_date` varchar(10) DEFAULT NULL,
  `projector_location` varchar(45) DEFAULT NULL,
  `projector_cost` float(10,2) DEFAULT '0.00',
  `projector_maintenance_cost` float(10,2) DEFAULT '0.00',
  `projector_maintenance_term` int(6) DEFAULT '0',
  `projector_lifespan` int(6) DEFAULT '0',
  `projector_power_consumption` int(6) DEFAULT '0',
  `projector_qty` int(6) DEFAULT '0',
  `projector_disposal_cost` float(10,2) DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='cost_input';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projector`
--

LOCK TABLES `projector` WRITE;
/*!40000 ALTER TABLE `projector` DISABLE KEYS */;
/*!40000 ALTER TABLE `projector` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prospecting_campaigns`
--

DROP TABLE IF EXISTS `prospecting_campaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prospecting_campaigns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_currency` varchar(4) DEFAULT 'GBP',
  `2014` float(10,2) NOT NULL DEFAULT '0.00',
  `2015` float(10,2) NOT NULL DEFAULT '0.00',
  `2016` float(10,2) NOT NULL DEFAULT '0.00',
  `2017` float(10,2) NOT NULL DEFAULT '0.00',
  `2018` float(10,2) NOT NULL DEFAULT '0.00',
  `2019` float(10,2) NOT NULL DEFAULT '0.00',
  `2020` float(10,2) NOT NULL DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prospecting_campaigns`
--

LOCK TABLES `prospecting_campaigns` WRITE;
/*!40000 ALTER TABLE `prospecting_campaigns` DISABLE KEYS */;
INSERT INTO `prospecting_campaigns` VALUES (3,'GBP',0.00,0.00,0.00,0.00,0.00,0.00,0.00,'eamonnkillian@gmail.com','2014-04-29 10:05:56');
/*!40000 ALTER TABLE `prospecting_campaigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `public_relations_budget`
--

DROP TABLE IF EXISTS `public_relations_budget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `public_relations_budget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_currency` varchar(4) DEFAULT 'GBP',
  `2014` float(10,2) NOT NULL DEFAULT '0.00',
  `2015` float(10,2) NOT NULL DEFAULT '0.00',
  `2016` float(10,2) NOT NULL DEFAULT '0.00',
  `2017` float(10,2) NOT NULL DEFAULT '0.00',
  `2018` float(10,2) NOT NULL DEFAULT '0.00',
  `2019` float(10,2) NOT NULL DEFAULT '0.00',
  `2020` float(10,2) NOT NULL DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `public_relations_budget`
--

LOCK TABLES `public_relations_budget` WRITE;
/*!40000 ALTER TABLE `public_relations_budget` DISABLE KEYS */;
INSERT INTO `public_relations_budget` VALUES (3,'GBP',0.00,0.00,0.00,0.00,0.00,0.00,0.00,NULL,'2014-04-18 18:02:34');
/*!40000 ALTER TABLE `public_relations_budget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regulatory_compliance`
--

DROP TABLE IF EXISTS `regulatory_compliance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regulatory_compliance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_currency` varchar(4) DEFAULT 'GBP',
  `2014` float(10,2) NOT NULL DEFAULT '0.00',
  `2015` float(10,2) NOT NULL DEFAULT '0.00',
  `2016` float(10,2) NOT NULL DEFAULT '0.00',
  `2017` float(10,2) NOT NULL DEFAULT '0.00',
  `2018` float(10,2) NOT NULL DEFAULT '0.00',
  `2019` float(10,2) NOT NULL DEFAULT '0.00',
  `2020` float(10,2) NOT NULL DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regulatory_compliance`
--

LOCK TABLES `regulatory_compliance` WRITE;
/*!40000 ALTER TABLE `regulatory_compliance` DISABLE KEYS */;
INSERT INTO `regulatory_compliance` VALUES (3,'GBP',0.00,0.00,0.00,0.00,0.00,0.00,0.00,NULL,'2014-04-19 10:22:08');
/*!40000 ALTER TABLE `regulatory_compliance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `risk`
--

DROP TABLE IF EXISTS `risk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `risk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `2014` float DEFAULT NULL,
  `2015` float DEFAULT NULL,
  `2016` float DEFAULT NULL,
  `2017` float DEFAULT NULL,
  `2018` float DEFAULT NULL,
  `2019` float DEFAULT NULL,
  `2020` float DEFAULT NULL,
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `risk`
--

LOCK TABLES `risk` WRITE;
/*!40000 ALTER TABLE `risk` DISABLE KEYS */;
INSERT INTO `risk` VALUES (1,0,0,0,0,0,0,0,'eamonnkillian@gmail.com','2014-04-29 09:58:54');
/*!40000 ALTER TABLE `risk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userroletype` varchar(16) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `userrole_IDX` (`userroletype`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Administrator','2014-03-11 09:24:02'),(2,'User','2014-03-11 09:24:02');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `routers`
--

DROP TABLE IF EXISTS `routers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `routers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `routers_type` varchar(45) DEFAULT NULL,
  `assignment` varchar(11) DEFAULT NULL,
  `currency` varchar(8) DEFAULT NULL,
  `routers_purchase_date` varchar(10) DEFAULT NULL,
  `routers_number_ports` int(6) DEFAULT '0',
  `routers_location` varchar(45) DEFAULT NULL,
  `routers_cost` float(10,2) DEFAULT '0.00',
  `routers_maintenance_cost` float(10,2) DEFAULT '0.00',
  `routers_maintenance_term` int(6) DEFAULT '0',
  `routers_lifespan` int(6) DEFAULT '0',
  `routers_power_consumption` int(6) DEFAULT '0',
  `routers_qty` int(6) DEFAULT '0',
  `routers_disposal_cost` float(10,2) DEFAULT '0.00',
  `routers_rack_size_u` int(6) DEFAULT '0',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='cost_input';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routers`
--

LOCK TABLES `routers` WRITE;
/*!40000 ALTER TABLE `routers` DISABLE KEYS */;
/*!40000 ALTER TABLE `routers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saas_clouds`
--

DROP TABLE IF EXISTS `saas_clouds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `saas_clouds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `saas_clouds_type` varchar(45) DEFAULT NULL,
  `assignment` varchar(11) DEFAULT NULL,
  `currency` varchar(8) DEFAULT NULL,
  `saas_provider` varchar(45) DEFAULT NULL,
  `saas_contract_purchase_date` varchar(10) DEFAULT NULL,
  `saas_number_users` float DEFAULT NULL,
  `saas_baseline_cost_per_month_each` float DEFAULT NULL,
  `saas_anticipated_additional_cost_per_month_each` float DEFAULT NULL,
  `saas_contract_term_months` int(4) DEFAULT NULL,
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saas_clouds`
--

LOCK TABLES `saas_clouds` WRITE;
/*!40000 ALTER TABLE `saas_clouds` DISABLE KEYS */;
INSERT INTO `saas_clouds` VALUES (1,'wwwwwwww','Production','GBP','Amanda','01/01/2014',10,100,0,6,'eamonnkillian@gmail.com','2014-05-21 14:07:22');
/*!40000 ALTER TABLE `saas_clouds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saas_service_products`
--

DROP TABLE IF EXISTS `saas_service_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `saas_service_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(45) DEFAULT NULL,
  `amount_of_VMs` int(6) DEFAULT '0',
  `amount_of_memory_MBs` int(6) DEFAULT '0',
  `amount_of_storage_GBs` int(6) DEFAULT '0',
  `product_source` varchar(23) DEFAULT NULL,
  `description` blob,
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saas_service_products`
--

LOCK TABLES `saas_service_products` WRITE;
/*!40000 ALTER TABLE `saas_service_products` DISABLE KEYS */;
INSERT INTO `saas_service_products` VALUES (11,'test of saas',4,1000,500,'Internal_Infrastructure','','eamonnkillian@gmail.com','2014-05-24 12:57:38');
/*!40000 ALTER TABLE `saas_service_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saas_service_products_sales`
--

DROP TABLE IF EXISTS `saas_service_products_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `saas_service_products_sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(45) DEFAULT NULL,
  `service_start_date` varchar(10) DEFAULT NULL,
  `service_finish_date` varchar(10) DEFAULT NULL,
  `purchased_qty` int(6) DEFAULT NULL,
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saas_service_products_sales`
--

LOCK TABLES `saas_service_products_sales` WRITE;
/*!40000 ALTER TABLE `saas_service_products_sales` DISABLE KEYS */;
/*!40000 ALTER TABLE `saas_service_products_sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_advertising_budget`
--

DROP TABLE IF EXISTS `sales_advertising_budget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_advertising_budget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_currency` varchar(4) DEFAULT 'GBP',
  `2014` float(10,2) NOT NULL DEFAULT '0.00',
  `2015` float(10,2) NOT NULL DEFAULT '0.00',
  `2016` float(10,2) NOT NULL DEFAULT '0.00',
  `2017` float(10,2) NOT NULL DEFAULT '0.00',
  `2018` float(10,2) NOT NULL DEFAULT '0.00',
  `2019` float(10,2) NOT NULL DEFAULT '0.00',
  `2020` float(10,2) NOT NULL DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_advertising_budget`
--

LOCK TABLES `sales_advertising_budget` WRITE;
/*!40000 ALTER TABLE `sales_advertising_budget` DISABLE KEYS */;
INSERT INTO `sales_advertising_budget` VALUES (3,'GBP',0.00,0.00,0.00,0.00,0.00,0.00,0.00,'eamonnkillian@gmail.com','2014-04-29 10:06:17');
/*!40000 ALTER TABLE `sales_advertising_budget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_business_development_plan`
--

DROP TABLE IF EXISTS `sales_business_development_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_business_development_plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_currency` varchar(4) DEFAULT 'GBP',
  `2014` float(10,2) NOT NULL DEFAULT '0.00',
  `2015` float(10,2) NOT NULL DEFAULT '0.00',
  `2016` float(10,2) NOT NULL DEFAULT '0.00',
  `2017` float(10,2) NOT NULL DEFAULT '0.00',
  `2018` float(10,2) NOT NULL DEFAULT '0.00',
  `2019` float(10,2) NOT NULL DEFAULT '0.00',
  `2020` float(10,2) NOT NULL DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_business_development_plan`
--

LOCK TABLES `sales_business_development_plan` WRITE;
/*!40000 ALTER TABLE `sales_business_development_plan` DISABLE KEYS */;
INSERT INTO `sales_business_development_plan` VALUES (3,'GBP',0.00,0.00,0.00,0.00,0.00,0.00,0.00,'eamonnkillian@gmail.com','2014-04-29 10:06:24');
/*!40000 ALTER TABLE `sales_business_development_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_certification_courses`
--

DROP TABLE IF EXISTS `sales_certification_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_certification_courses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_currency` varchar(4) DEFAULT 'GBP',
  `2014` float(10,2) NOT NULL DEFAULT '0.00',
  `2015` float(10,2) NOT NULL DEFAULT '0.00',
  `2016` float(10,2) NOT NULL DEFAULT '0.00',
  `2017` float(10,2) NOT NULL DEFAULT '0.00',
  `2018` float(10,2) NOT NULL DEFAULT '0.00',
  `2019` float(10,2) NOT NULL DEFAULT '0.00',
  `2020` float(10,2) NOT NULL DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_certification_courses`
--

LOCK TABLES `sales_certification_courses` WRITE;
/*!40000 ALTER TABLE `sales_certification_courses` DISABLE KEYS */;
INSERT INTO `sales_certification_courses` VALUES (3,'GBP',0.00,0.00,0.00,0.00,0.00,0.00,0.00,'eamonnkillian@gmail.com','2014-04-29 10:05:36');
/*!40000 ALTER TABLE `sales_certification_courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_events`
--

DROP TABLE IF EXISTS `sales_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_currency` varchar(4) DEFAULT 'GBP',
  `2014` float(10,2) NOT NULL DEFAULT '0.00',
  `2015` float(10,2) NOT NULL DEFAULT '0.00',
  `2016` float(10,2) NOT NULL DEFAULT '0.00',
  `2017` float(10,2) NOT NULL DEFAULT '0.00',
  `2018` float(10,2) NOT NULL DEFAULT '0.00',
  `2019` float(10,2) NOT NULL DEFAULT '0.00',
  `2020` float(10,2) NOT NULL DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_events`
--

LOCK TABLES `sales_events` WRITE;
/*!40000 ALTER TABLE `sales_events` DISABLE KEYS */;
INSERT INTO `sales_events` VALUES (3,'GBP',0.00,0.00,0.00,0.00,0.00,0.00,0.00,'eamonnkillian@gmail.com','2014-04-29 10:06:08');
/*!40000 ALTER TABLE `sales_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_professional_bodies_membership`
--

DROP TABLE IF EXISTS `sales_professional_bodies_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_professional_bodies_membership` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_currency` varchar(4) DEFAULT 'GBP',
  `2014` float(10,2) NOT NULL DEFAULT '0.00',
  `2015` float(10,2) NOT NULL DEFAULT '0.00',
  `2016` float(10,2) NOT NULL DEFAULT '0.00',
  `2017` float(10,2) NOT NULL DEFAULT '0.00',
  `2018` float(10,2) NOT NULL DEFAULT '0.00',
  `2019` float(10,2) NOT NULL DEFAULT '0.00',
  `2020` float(10,2) NOT NULL DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_professional_bodies_membership`
--

LOCK TABLES `sales_professional_bodies_membership` WRITE;
/*!40000 ALTER TABLE `sales_professional_bodies_membership` DISABLE KEYS */;
INSERT INTO `sales_professional_bodies_membership` VALUES (3,'EURO',0.00,0.00,0.00,0.00,0.00,0.00,0.00,'eamonnkillian@gmail.com','2014-04-29 10:06:32');
/*!40000 ALTER TABLE `sales_professional_bodies_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_training_budget`
--

DROP TABLE IF EXISTS `sales_training_budget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_training_budget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_currency` varchar(4) DEFAULT 'GBP',
  `2014` float(10,2) NOT NULL DEFAULT '0.00',
  `2015` float(10,2) NOT NULL DEFAULT '0.00',
  `2016` float(10,2) NOT NULL DEFAULT '0.00',
  `2017` float(10,2) NOT NULL DEFAULT '0.00',
  `2018` float(10,2) NOT NULL DEFAULT '0.00',
  `2019` float(10,2) NOT NULL DEFAULT '0.00',
  `2020` float(10,2) NOT NULL DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_training_budget`
--

LOCK TABLES `sales_training_budget` WRITE;
/*!40000 ALTER TABLE `sales_training_budget` DISABLE KEYS */;
INSERT INTO `sales_training_budget` VALUES (3,'GBP',0.00,0.00,0.00,0.00,0.00,0.00,0.00,'eamonnkillian@gmail.com','2014-04-29 10:05:45');
/*!40000 ALTER TABLE `sales_training_budget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `san_storage`
--

DROP TABLE IF EXISTS `san_storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `san_storage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `san_storage_type` varchar(45) DEFAULT NULL,
  `assignment` varchar(11) DEFAULT NULL,
  `currency` varchar(8) DEFAULT NULL,
  `storage_purchase_date` varchar(10) DEFAULT NULL,
  `san_storage_IO_GBE_ports` varchar(45) DEFAULT NULL,
  `san_memory` int(8) DEFAULT '0',
  `san_raw_capacity_TB` int(8) DEFAULT '0',
  `san_formatted_capacity_TB` int(8) DEFAULT '0',
  `san_storage_location` varchar(45) DEFAULT NULL,
  `san_storage_cost` float(10,2) DEFAULT '0.00',
  `san_storage_maintenance_term` int(8) DEFAULT '0',
  `san_storage_maintenance_cost` float(10,2) DEFAULT '0.00',
  `san_storage_lifespan` int(8) DEFAULT '0',
  `san_storage_power_consumption` int(8) DEFAULT '0',
  `san_storage_qty` int(8) DEFAULT '0',
  `san_storage_disposal_cost` float(10,2) DEFAULT '0.00',
  `san_storage_rack_size_u` int(8) DEFAULT '0',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COMMENT='cost_input';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `san_storage`
--

LOCK TABLES `san_storage` WRITE;
/*!40000 ALTER TABLE `san_storage` DISABLE KEYS */;
INSERT INTO `san_storage` VALUES (3,'Test1','Production','GBP','01/01/2014','0',128,144,113,'DC 1',0.00,0,0.00,0,0,2,0.00,0,'eamonnkillian@gmail.com','2014-05-23 12:15:39');
/*!40000 ALTER TABLE `san_storage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `san_switch`
--

DROP TABLE IF EXISTS `san_switch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `san_switch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `san_switch_type` varchar(45) DEFAULT NULL,
  `assignment` varchar(11) DEFAULT NULL,
  `currency` varchar(8) DEFAULT NULL,
  `san_switch_purchase_date` varchar(10) DEFAULT NULL,
  `san_switch_IO_GBE_ports` float DEFAULT NULL,
  `san_switch_memory` float DEFAULT NULL,
  `san_switch_location` varchar(45) DEFAULT NULL,
  `san_switch_cost` float(10,2) DEFAULT '0.00',
  `san_switch_maintenance_term` int(11) DEFAULT NULL,
  `san_switch_maintenance_cost` float(10,2) DEFAULT '0.00',
  `san_switch_lifespan` varchar(45) DEFAULT NULL,
  `san_switch_power_consumption` float DEFAULT NULL,
  `san_switch_qty` int(11) DEFAULT NULL,
  `san_switch_disposal_cost` int(6) DEFAULT '0',
  `san_switch_rack_size_u` int(11) DEFAULT NULL,
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='cost_input';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `san_switch`
--

LOCK TABLES `san_switch` WRITE;
/*!40000 ALTER TABLE `san_switch` DISABLE KEYS */;
/*!40000 ALTER TABLE `san_switch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `security_service_products`
--

DROP TABLE IF EXISTS `security_service_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `security_service_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(45) DEFAULT NULL,
  `amount_of_VMs` int(6) DEFAULT '0',
  `amount_of_memory_MBs` int(6) DEFAULT '0',
  `amount_of_storage_GBs` int(6) DEFAULT '0',
  `security_VM_source` varchar(23) DEFAULT 'Internal',
  `description` blob,
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `security_service_products`
--

LOCK TABLES `security_service_products` WRITE;
/*!40000 ALTER TABLE `security_service_products` DISABLE KEYS */;
INSERT INTO `security_service_products` VALUES (9,'test of security',6,2048,50,'Internal_Infrastructure','vffdfdbfdb','eamonnkillian@gmail.com','2014-05-24 10:28:12');
/*!40000 ALTER TABLE `security_service_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `security_service_products_sales`
--

DROP TABLE IF EXISTS `security_service_products_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `security_service_products_sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(45) DEFAULT NULL,
  `service_start_date` varchar(10) DEFAULT NULL,
  `service_finish_date` varchar(10) DEFAULT NULL,
  `purchased_qty` int(6) DEFAULT NULL,
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `security_service_products_sales`
--

LOCK TABLES `security_service_products_sales` WRITE;
/*!40000 ALTER TABLE `security_service_products_sales` DISABLE KEYS */;
/*!40000 ALTER TABLE `security_service_products_sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `security_software`
--

DROP TABLE IF EXISTS `security_software`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `security_software` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `software_type` varchar(45) DEFAULT NULL,
  `assignment` varchar(11) DEFAULT NULL,
  `currency` varchar(45) DEFAULT NULL,
  `software_purchase_date` varchar(10) DEFAULT NULL,
  `software_name` varchar(45) DEFAULT NULL,
  `software_purchase_cost` float(10,2) DEFAULT '0.00',
  `software_annual_maintenance_cost` float(10,2) DEFAULT '0.00',
  `software_maintenance_term` int(8) DEFAULT '0',
  `software_description` blob,
  `software_location` varchar(45) DEFAULT NULL,
  `software_annual_subscription_cost` float(10,2) DEFAULT '0.00',
  `software_licences_qty` int(8) DEFAULT '0',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='cost_input';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `security_software`
--

LOCK TABLES `security_software` WRITE;
/*!40000 ALTER TABLE `security_software` DISABLE KEYS */;
/*!40000 ALTER TABLE `security_software` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server_software`
--

DROP TABLE IF EXISTS `server_software`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `server_software` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `software_type` varchar(45) DEFAULT NULL,
  `assignment` varchar(11) DEFAULT NULL,
  `currency` varchar(45) DEFAULT NULL,
  `software_purchase_date` varchar(10) DEFAULT NULL,
  `software_name` varchar(45) DEFAULT NULL,
  `software_purchase_cost` float(10,2) DEFAULT '0.00',
  `software_annual_maintenance_cost` float(10,2) DEFAULT '0.00',
  `software_maintenance_term` int(8) DEFAULT '0',
  `software_description` blob,
  `software_location` varchar(45) DEFAULT NULL,
  `software_annual_subscription_cost` float(10,2) DEFAULT '0.00',
  `software_licences_qty` varchar(10) DEFAULT NULL,
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='cost_input';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_software`
--

LOCK TABLES `server_software` WRITE;
/*!40000 ALTER TABLE `server_software` DISABLE KEYS */;
/*!40000 ALTER TABLE `server_software` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_credits`
--

DROP TABLE IF EXISTS `service_credits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_credits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `2014` float DEFAULT NULL,
  `2015` float DEFAULT NULL,
  `2016` float DEFAULT NULL,
  `2017` float DEFAULT NULL,
  `2018` float DEFAULT NULL,
  `2019` float DEFAULT NULL,
  `2020` float DEFAULT NULL,
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_credits`
--

LOCK TABLES `service_credits` WRITE;
/*!40000 ALTER TABLE `service_credits` DISABLE KEYS */;
INSERT INTO `service_credits` VALUES (1,2,2,2,2,2,2,2,'eamonnkillian@gmail.com','2014-04-30 13:08:49');
/*!40000 ALTER TABLE `service_credits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_operation_charges`
--

DROP TABLE IF EXISTS `service_operation_charges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_operation_charges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_currency` varchar(4) DEFAULT 'GBP',
  `2014` float(10,2) NOT NULL DEFAULT '0.00',
  `2015` float(10,2) NOT NULL DEFAULT '0.00',
  `2016` float(10,2) NOT NULL DEFAULT '0.00',
  `2017` float(10,2) NOT NULL DEFAULT '0.00',
  `2018` float(10,2) NOT NULL DEFAULT '0.00',
  `2019` float(10,2) NOT NULL DEFAULT '0.00',
  `2020` float(10,2) NOT NULL DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_operation_charges`
--

LOCK TABLES `service_operation_charges` WRITE;
/*!40000 ALTER TABLE `service_operation_charges` DISABLE KEYS */;
INSERT INTO `service_operation_charges` VALUES (3,'GBP',0.00,0.00,0.00,0.00,0.00,0.00,0.00,NULL,'2014-04-19 10:17:58');
/*!40000 ALTER TABLE `service_operation_charges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `severability`
--

DROP TABLE IF EXISTS `severability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `severability` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_currency` varchar(4) DEFAULT 'GBP',
  `2014` float(10,2) NOT NULL DEFAULT '0.00',
  `2015` float(10,2) NOT NULL DEFAULT '0.00',
  `2016` float(10,2) NOT NULL DEFAULT '0.00',
  `2017` float(10,2) NOT NULL DEFAULT '0.00',
  `2018` float(10,2) NOT NULL DEFAULT '0.00',
  `2019` float(10,2) NOT NULL DEFAULT '0.00',
  `2020` float(10,2) NOT NULL DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `severability`
--

LOCK TABLES `severability` WRITE;
/*!40000 ALTER TABLE `severability` DISABLE KEYS */;
INSERT INTO `severability` VALUES (3,'GBP',0.00,0.00,0.00,0.00,0.00,0.00,0.00,NULL,'2014-04-19 10:23:05');
/*!40000 ALTER TABLE `severability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_media_budget`
--

DROP TABLE IF EXISTS `social_media_budget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_media_budget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_currency` varchar(4) DEFAULT 'GBP',
  `2014` float(10,2) NOT NULL DEFAULT '0.00',
  `2015` float(10,2) NOT NULL DEFAULT '0.00',
  `2016` float(10,2) NOT NULL DEFAULT '0.00',
  `2017` float(10,2) NOT NULL DEFAULT '0.00',
  `2018` float(10,2) NOT NULL DEFAULT '0.00',
  `2019` float(10,2) NOT NULL DEFAULT '0.00',
  `2020` float(10,2) NOT NULL DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_media_budget`
--

LOCK TABLES `social_media_budget` WRITE;
/*!40000 ALTER TABLE `social_media_budget` DISABLE KEYS */;
INSERT INTO `social_media_budget` VALUES (3,'GBP',0.00,0.00,0.00,0.00,0.00,0.00,0.00,'eamonnkillian@gmail.com','2014-04-29 10:04:55');
/*!40000 ALTER TABLE `social_media_budget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spare_drive`
--

DROP TABLE IF EXISTS `spare_drive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spare_drive` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `spare_drive_type` varchar(45) DEFAULT NULL,
  `assignment` varchar(11) DEFAULT NULL,
  `currency` varchar(8) DEFAULT NULL,
  `spare_drive_purchase_date` varchar(10) DEFAULT NULL,
  `spare_drive_location` varchar(45) DEFAULT NULL,
  `spare_drive_cost` varchar(45) DEFAULT NULL,
  `spare_drive_maintenance_term` varchar(45) DEFAULT NULL,
  `spare_drive_maintenance_cost` varchar(45) DEFAULT NULL,
  `spare_drive_lifespan` varchar(45) DEFAULT NULL,
  `spare_drive_qty` varchar(45) DEFAULT NULL,
  `spare_drive_disposal_cost` int(6) DEFAULT '0',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='cost_input';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spare_drive`
--

LOCK TABLES `spare_drive` WRITE;
/*!40000 ALTER TABLE `spare_drive` DISABLE KEYS */;
/*!40000 ALTER TABLE `spare_drive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `step_in_rights`
--

DROP TABLE IF EXISTS `step_in_rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `step_in_rights` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_currency` varchar(4) DEFAULT 'GBP',
  `2014` float(10,2) NOT NULL DEFAULT '0.00',
  `2015` float(10,2) NOT NULL DEFAULT '0.00',
  `2016` float(10,2) NOT NULL DEFAULT '0.00',
  `2017` float(10,2) NOT NULL DEFAULT '0.00',
  `2018` float(10,2) NOT NULL DEFAULT '0.00',
  `2019` float(10,2) NOT NULL DEFAULT '0.00',
  `2020` float(10,2) NOT NULL DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `step_in_rights`
--

LOCK TABLES `step_in_rights` WRITE;
/*!40000 ALTER TABLE `step_in_rights` DISABLE KEYS */;
INSERT INTO `step_in_rights` VALUES (3,'GBP',10000.00,0.00,0.00,0.00,0.00,0.00,0.00,'eamonnkillian@gmail.com','2014-05-13 17:44:19');
/*!40000 ALTER TABLE `step_in_rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storage_cabling`
--

DROP TABLE IF EXISTS `storage_cabling`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storage_cabling` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `storage_cabling_type` varchar(45) DEFAULT NULL,
  `assignment` varchar(11) DEFAULT NULL,
  `currency` varchar(8) DEFAULT NULL,
  `storage_cabling_location` varchar(45) DEFAULT NULL,
  `storage_cabling_cost` varchar(45) DEFAULT NULL,
  `storage_cabling_lifespan` varchar(45) DEFAULT NULL,
  `storage_cabling_qty` varchar(45) DEFAULT NULL,
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='cost_input';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storage_cabling`
--

LOCK TABLES `storage_cabling` WRITE;
/*!40000 ALTER TABLE `storage_cabling` DISABLE KEYS */;
/*!40000 ALTER TABLE `storage_cabling` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storage_software`
--

DROP TABLE IF EXISTS `storage_software`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storage_software` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `software_type` varchar(45) DEFAULT NULL,
  `assignment` varchar(11) DEFAULT NULL,
  `currency` varchar(45) DEFAULT NULL,
  `software_purchase_date` varchar(10) DEFAULT NULL,
  `software_name` varchar(45) DEFAULT NULL,
  `software_purchase_cost` float(10,2) DEFAULT '0.00',
  `software_annual_maintenance_cost` float(10,2) DEFAULT '0.00',
  `software_maintenance_term` int(8) DEFAULT '0',
  `software_description` blob,
  `software_location` varchar(45) DEFAULT NULL,
  `software_annual_subscription_cost` float(10,2) DEFAULT '0.00',
  `software_licences_qty` int(8) DEFAULT '0',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='cost_input';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storage_software`
--

LOCK TABLES `storage_software` WRITE;
/*!40000 ALTER TABLE `storage_software` DISABLE KEYS */;
/*!40000 ALTER TABLE `storage_software` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier_liaison`
--

DROP TABLE IF EXISTS `supplier_liaison`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier_liaison` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_currency` varchar(4) DEFAULT 'GBP',
  `2014` float DEFAULT NULL,
  `2015` float DEFAULT NULL,
  `2016` float DEFAULT NULL,
  `2017` float DEFAULT NULL,
  `2018` float DEFAULT NULL,
  `2019` float DEFAULT NULL,
  `2020` float DEFAULT NULL,
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier_liaison`
--

LOCK TABLES `supplier_liaison` WRITE;
/*!40000 ALTER TABLE `supplier_liaison` DISABLE KEYS */;
INSERT INTO `supplier_liaison` VALUES (1,'USD',0,0,0,0,0,0,0,'eamonnkillian@gmail.com','2014-04-29 09:59:16');
/*!40000 ALTER TABLE `supplier_liaison` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survival`
--

DROP TABLE IF EXISTS `survival`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survival` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_currency` varchar(4) DEFAULT 'GBP',
  `2014` float(10,2) NOT NULL DEFAULT '0.00',
  `2015` float(10,2) NOT NULL DEFAULT '0.00',
  `2016` float(10,2) NOT NULL DEFAULT '0.00',
  `2017` float(10,2) NOT NULL DEFAULT '0.00',
  `2018` float(10,2) NOT NULL DEFAULT '0.00',
  `2019` float(10,2) NOT NULL DEFAULT '0.00',
  `2020` float(10,2) NOT NULL DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survival`
--

LOCK TABLES `survival` WRITE;
/*!40000 ALTER TABLE `survival` DISABLE KEYS */;
INSERT INTO `survival` VALUES (3,'GBP',0.00,0.00,0.00,0.00,0.00,0.00,0.00,NULL,'2014-04-19 10:22:56');
/*!40000 ALTER TABLE `survival` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `switches`
--

DROP TABLE IF EXISTS `switches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `switches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `switches_type` varchar(45) DEFAULT NULL,
  `assignment` varchar(11) DEFAULT NULL,
  `currency` varchar(8) DEFAULT NULL,
  `switches_purchase_date` varchar(10) DEFAULT NULL,
  `switches_number_ports` int(6) DEFAULT '0',
  `switches_location` varchar(45) DEFAULT NULL,
  `switches_cost` float(10,2) DEFAULT '0.00',
  `switches_maintenance_term` int(6) DEFAULT '0',
  `switches_maintenance_cost` float(10,2) DEFAULT '0.00',
  `switches_lifespan` int(6) DEFAULT '0',
  `switches_power_consumption` int(6) DEFAULT '0',
  `switches_qty` int(6) DEFAULT '0',
  `switches_disposal_cost` float(10,2) DEFAULT '0.00',
  `switches_rack_size_u` int(6) DEFAULT '0',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1 COMMENT='cost_input';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `switches`
--

LOCK TABLES `switches` WRITE;
/*!40000 ALTER TABLE `switches` DISABLE KEYS */;
INSERT INTO `switches` VALUES (51,'Prod Switches','Production','GBP','01/01/2014',24,'DC 1',2850.00,0,0.00,4,0,4,0.00,2,'phil@niu.com','2014-05-03 09:58:12');
/*!40000 ALTER TABLE `switches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tablet`
--

DROP TABLE IF EXISTS `tablet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tablet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tablet_type` varchar(45) DEFAULT NULL,
  `assignment` varchar(11) DEFAULT NULL,
  `currency` varchar(8) DEFAULT NULL,
  `tablet_purchase_date` varchar(10) DEFAULT NULL,
  `tablet_location` varchar(45) DEFAULT NULL,
  `tablet_cost` float(10,2) DEFAULT '0.00',
  `tablet_maintenance_cost` float(10,2) DEFAULT '0.00',
  `tablet_maintenance_term` int(6) DEFAULT '0',
  `tablet_airtime_cost_pa` float(10,2) DEFAULT '0.00',
  `tablet_lifespan` int(6) DEFAULT '0',
  `tablet_qty` int(6) DEFAULT '0',
  `tablet_disposal_cost` float(10,2) DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='cost_input';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tablet`
--

LOCK TABLES `tablet` WRITE;
/*!40000 ALTER TABLE `tablet` DISABLE KEYS */;
/*!40000 ALTER TABLE `tablet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tablet_software`
--

DROP TABLE IF EXISTS `tablet_software`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tablet_software` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `software_type` varchar(45) DEFAULT NULL,
  `assignment` varchar(11) DEFAULT NULL,
  `currency` varchar(45) DEFAULT NULL,
  `software_purchase_date` varchar(10) DEFAULT NULL,
  `software_name` varchar(45) DEFAULT NULL,
  `software_purchase_cost` float(10,2) DEFAULT '0.00',
  `software_annual_maintenance_cost` float(10,2) DEFAULT '0.00',
  `software_maintenance_term` int(8) DEFAULT '0',
  `software_description` blob,
  `software_location` varchar(45) DEFAULT NULL,
  `software_annual_subscription_cost` float(10,2) DEFAULT '0.00',
  `software_licences_qty` int(8) DEFAULT '0',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='cost_input';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tablet_software`
--

LOCK TABLES `tablet_software` WRITE;
/*!40000 ALTER TABLE `tablet_software` DISABLE KEYS */;
/*!40000 ALTER TABLE `tablet_software` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tape_drive`
--

DROP TABLE IF EXISTS `tape_drive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tape_drive` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tape_drive_type` varchar(45) DEFAULT NULL,
  `assignment` varchar(11) DEFAULT NULL,
  `currency` varchar(8) DEFAULT NULL,
  `tape_drive_purchase_date` varchar(10) DEFAULT NULL,
  `tape_drive_number_IO_ports` int(11) DEFAULT NULL,
  `tape_drive_location` varchar(45) DEFAULT NULL,
  `tape_drive_cost` float DEFAULT NULL,
  `tape_drive_maintenance_term` float DEFAULT NULL,
  `tape_drive_maintenance_cost` float DEFAULT NULL,
  `tape_drive_lifespan` varchar(45) DEFAULT NULL,
  `tape_drive_power_consumption` float DEFAULT NULL,
  `tape_drive_qty` int(11) DEFAULT NULL,
  `tape_drive_disposal_cost` int(6) DEFAULT '0',
  `tape_drive_rack_size_u` int(11) DEFAULT NULL,
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='cost_input';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tape_drive`
--

LOCK TABLES `tape_drive` WRITE;
/*!40000 ALTER TABLE `tape_drive` DISABLE KEYS */;
/*!40000 ALTER TABLE `tape_drive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tape_media`
--

DROP TABLE IF EXISTS `tape_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tape_media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tape_media_type` varchar(45) DEFAULT NULL,
  `assignment` varchar(11) DEFAULT NULL,
  `currency` varchar(8) DEFAULT NULL,
  `tape_media_purchase_date` varchar(10) DEFAULT NULL,
  `tape_media_location` varchar(45) DEFAULT NULL,
  `tape_media_cost` varchar(45) DEFAULT NULL,
  `tape_media_lifespan` varchar(45) DEFAULT NULL,
  `tape_media_qty` varchar(45) DEFAULT NULL,
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='cost_input';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tape_media`
--

LOCK TABLES `tape_media` WRITE;
/*!40000 ALTER TABLE `tape_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `tape_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `technology_currency`
--

DROP TABLE IF EXISTS `technology_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `technology_currency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_currency` varchar(4) DEFAULT 'GBP',
  `2014` float DEFAULT NULL,
  `2015` float DEFAULT NULL,
  `2016` float DEFAULT NULL,
  `2017` float DEFAULT NULL,
  `2018` float DEFAULT NULL,
  `2019` float DEFAULT NULL,
  `2020` float DEFAULT NULL,
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `technology_currency`
--

LOCK TABLES `technology_currency` WRITE;
/*!40000 ALTER TABLE `technology_currency` DISABLE KEYS */;
INSERT INTO `technology_currency` VALUES (1,'GBP',0,0,0,0,0,0,0,'eamonnkillian@gmail.com','2014-04-29 10:00:50');
/*!40000 ALTER TABLE `technology_currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telecoms`
--

DROP TABLE IF EXISTS `telecoms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telecoms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `telecoms_type` varchar(45) DEFAULT NULL,
  `assignment` varchar(11) DEFAULT NULL,
  `currency` varchar(8) DEFAULT NULL,
  `device_purchase_date` varchar(10) DEFAULT NULL,
  `telecoms_location` varchar(45) DEFAULT NULL,
  `telecoms_cost` float(10,2) DEFAULT '0.00',
  `telecoms_maintenance_cost` float(10,2) DEFAULT '0.00',
  `telecoms_maintenance_term` int(6) DEFAULT '0',
  `telecoms_lifespan` int(6) DEFAULT '0',
  `telecoms_power_consumption` int(6) DEFAULT '0',
  `telecoms_qty` int(6) DEFAULT '0',
  `telecoms_disposal_cost` int(6) DEFAULT '0',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='cost_input';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telecoms`
--

LOCK TABLES `telecoms` WRITE;
/*!40000 ALTER TABLE `telecoms` DISABLE KEYS */;
/*!40000 ALTER TABLE `telecoms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temporary_services_extension`
--

DROP TABLE IF EXISTS `temporary_services_extension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temporary_services_extension` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_currency` varchar(4) DEFAULT 'GBP',
  `2014` float(10,2) NOT NULL DEFAULT '0.00',
  `2015` float(10,2) NOT NULL DEFAULT '0.00',
  `2016` float(10,2) NOT NULL DEFAULT '0.00',
  `2017` float(10,2) NOT NULL DEFAULT '0.00',
  `2018` float(10,2) NOT NULL DEFAULT '0.00',
  `2019` float(10,2) NOT NULL DEFAULT '0.00',
  `2020` float(10,2) NOT NULL DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temporary_services_extension`
--

LOCK TABLES `temporary_services_extension` WRITE;
/*!40000 ALTER TABLE `temporary_services_extension` DISABLE KEYS */;
INSERT INTO `temporary_services_extension` VALUES (3,'GBP',0.00,0.00,0.00,0.00,0.00,0.00,0.00,NULL,'2014-04-19 10:21:05');
/*!40000 ALTER TABLE `temporary_services_extension` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `termination_for_cause_charges`
--

DROP TABLE IF EXISTS `termination_for_cause_charges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `termination_for_cause_charges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_currency` varchar(4) DEFAULT 'GBP',
  `2014` float(10,2) NOT NULL DEFAULT '0.00',
  `2015` float(10,2) NOT NULL DEFAULT '0.00',
  `2016` float(10,2) NOT NULL DEFAULT '0.00',
  `2017` float(10,2) NOT NULL DEFAULT '0.00',
  `2018` float(10,2) NOT NULL DEFAULT '0.00',
  `2019` float(10,2) NOT NULL DEFAULT '0.00',
  `2020` float(10,2) NOT NULL DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `termination_for_cause_charges`
--

LOCK TABLES `termination_for_cause_charges` WRITE;
/*!40000 ALTER TABLE `termination_for_cause_charges` DISABLE KEYS */;
INSERT INTO `termination_for_cause_charges` VALUES (3,'GBP',0.00,0.00,0.00,0.00,0.00,0.00,0.00,NULL,'2014-04-19 10:20:49');
/*!40000 ALTER TABLE `termination_for_cause_charges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `termination_for_convenience_charges`
--

DROP TABLE IF EXISTS `termination_for_convenience_charges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `termination_for_convenience_charges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_currency` varchar(4) DEFAULT 'GBP',
  `2014` float(10,2) NOT NULL DEFAULT '0.00',
  `2015` float(10,2) NOT NULL DEFAULT '0.00',
  `2016` float(10,2) NOT NULL DEFAULT '0.00',
  `2017` float(10,2) NOT NULL DEFAULT '0.00',
  `2018` float(10,2) NOT NULL DEFAULT '0.00',
  `2019` float(10,2) NOT NULL DEFAULT '0.00',
  `2020` float(10,2) NOT NULL DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `termination_for_convenience_charges`
--

LOCK TABLES `termination_for_convenience_charges` WRITE;
/*!40000 ALTER TABLE `termination_for_convenience_charges` DISABLE KEYS */;
INSERT INTO `termination_for_convenience_charges` VALUES (3,'GBP',0.00,0.00,0.00,0.00,0.00,0.00,0.00,NULL,'2014-04-19 10:20:36');
/*!40000 ALTER TABLE `termination_for_convenience_charges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `third_party_contracts_management`
--

DROP TABLE IF EXISTS `third_party_contracts_management`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `third_party_contracts_management` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_currency` varchar(4) DEFAULT 'GBP',
  `2014` float(10,2) NOT NULL DEFAULT '0.00',
  `2015` float(10,2) NOT NULL DEFAULT '0.00',
  `2016` float(10,2) NOT NULL DEFAULT '0.00',
  `2017` float(10,2) NOT NULL DEFAULT '0.00',
  `2018` float(10,2) NOT NULL DEFAULT '0.00',
  `2019` float(10,2) NOT NULL DEFAULT '0.00',
  `2020` float(10,2) NOT NULL DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `third_party_contracts_management`
--

LOCK TABLES `third_party_contracts_management` WRITE;
/*!40000 ALTER TABLE `third_party_contracts_management` DISABLE KEYS */;
INSERT INTO `third_party_contracts_management` VALUES (3,'GBP',0.00,0.00,0.00,0.00,0.00,0.00,0.00,NULL,'2014-04-19 10:18:48');
/*!40000 ALTER TABLE `third_party_contracts_management` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tier_1_margin_expectation`
--

DROP TABLE IF EXISTS `tier_1_margin_expectation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tier_1_margin_expectation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `2014` float(10,2) NOT NULL DEFAULT '0.00',
  `2015` float(10,2) NOT NULL DEFAULT '0.00',
  `2016` float(10,2) NOT NULL DEFAULT '0.00',
  `2017` float(10,2) NOT NULL DEFAULT '0.00',
  `2018` float(10,2) NOT NULL DEFAULT '0.00',
  `2019` float(10,2) NOT NULL DEFAULT '0.00',
  `2020` float(10,2) NOT NULL DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tier_1_margin_expectation`
--

LOCK TABLES `tier_1_margin_expectation` WRITE;
/*!40000 ALTER TABLE `tier_1_margin_expectation` DISABLE KEYS */;
INSERT INTO `tier_1_margin_expectation` VALUES (3,8.00,8.00,8.00,8.00,8.00,8.00,8.00,'phil@niu.com','2014-05-03 10:04:30');
/*!40000 ALTER TABLE `tier_1_margin_expectation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tier_2_margin_expectation`
--

DROP TABLE IF EXISTS `tier_2_margin_expectation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tier_2_margin_expectation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `2014` float(10,2) NOT NULL DEFAULT '0.00',
  `2015` float(10,2) NOT NULL DEFAULT '0.00',
  `2016` float(10,2) NOT NULL DEFAULT '0.00',
  `2017` float(10,2) NOT NULL DEFAULT '0.00',
  `2018` float(10,2) NOT NULL DEFAULT '0.00',
  `2019` float(10,2) NOT NULL DEFAULT '0.00',
  `2020` float(10,2) NOT NULL DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tier_2_margin_expectation`
--

LOCK TABLES `tier_2_margin_expectation` WRITE;
/*!40000 ALTER TABLE `tier_2_margin_expectation` DISABLE KEYS */;
INSERT INTO `tier_2_margin_expectation` VALUES (3,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'eamonnkillian@gmail.com','2014-05-21 13:59:49');
/*!40000 ALTER TABLE `tier_2_margin_expectation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `total_person_days_available`
--

DROP TABLE IF EXISTS `total_person_days_available`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `total_person_days_available` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total_person_days_available` int(8) DEFAULT '0',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `total_person_days_available`
--

LOCK TABLES `total_person_days_available` WRITE;
/*!40000 ALTER TABLE `total_person_days_available` DISABLE KEYS */;
/*!40000 ALTER TABLE `total_person_days_available` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transition_charges`
--

DROP TABLE IF EXISTS `transition_charges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transition_charges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_currency` varchar(4) DEFAULT 'GBP',
  `2014` float(10,2) NOT NULL DEFAULT '0.00',
  `2015` float(10,2) NOT NULL DEFAULT '0.00',
  `2016` float(10,2) NOT NULL DEFAULT '0.00',
  `2017` float(10,2) NOT NULL DEFAULT '0.00',
  `2018` float(10,2) NOT NULL DEFAULT '0.00',
  `2019` float(10,2) NOT NULL DEFAULT '0.00',
  `2020` float(10,2) NOT NULL DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transition_charges`
--

LOCK TABLES `transition_charges` WRITE;
/*!40000 ALTER TABLE `transition_charges` DISABLE KEYS */;
INSERT INTO `transition_charges` VALUES (3,'GBP',0.00,0.00,0.00,0.00,0.00,0.00,0.00,'eamonnkillian@gmail.com','2014-04-29 10:08:24');
/*!40000 ALTER TABLE `transition_charges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(40) NOT NULL,
  `password` varchar(32) NOT NULL,
  `first_name` varchar(25) DEFAULT NULL,
  `middle_name` varchar(25) DEFAULT NULL,
  `surname` varchar(25) DEFAULT NULL,
  `mobile_phonenumber` varchar(14) DEFAULT NULL,
  `land_phonenumber` varchar(14) DEFAULT NULL,
  `user_role` varchar(16) NOT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lastupdatedby` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_userrole` (`user_role`),
  CONSTRAINT `fk_const1` FOREIGN KEY (`user_role`) REFERENCES `roles` (`userroletype`)
) ENGINE=InnoDB AUTO_INCREMENT=188 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (29,'eamonnkillian@gmail.com','64a3da4ffddfe25d8380d4caad407271','Eamonn','Joseph','Killian','01234567890','01634238304','Administrator','2014-04-28 12:48:16','eamonnkillian@gmail.com'),(186,'me@me.com','c8664e1420b8cbb70ed91b74c98cbdc6','me','me','me','99','99','User','2014-05-27 10:08:05','me@me.com'),(187,'aa@aa.com','3f61173eaf7219186e0348f99f0f264c','aa','aa','aa','22','33','Administrator','2015-04-18 08:46:13','aa@aa.com');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `virtual_machines_allocations`
--

DROP TABLE IF EXISTS `virtual_machines_allocations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `virtual_machines_allocations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `small_VM` int(4) DEFAULT '0',
  `total_number_of_small_VMs` int(8) DEFAULT '0',
  `medium_VM` int(4) DEFAULT '0',
  `total_number_of_medium_VMs` int(8) DEFAULT '0',
  `large_VM` int(4) DEFAULT '0',
  `total_number_of_large_VMs` int(8) DEFAULT '0',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `virtual_machines_allocations`
--

LOCK TABLES `virtual_machines_allocations` WRITE;
/*!40000 ALTER TABLE `virtual_machines_allocations` DISABLE KEYS */;
INSERT INTO `virtual_machines_allocations` VALUES (1,16,0,8,0,4,0,'eamonnkillian@gmail.com','2014-05-08 11:17:28');
/*!40000 ALTER TABLE `virtual_machines_allocations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voip_service_products`
--

DROP TABLE IF EXISTS `voip_service_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voip_service_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(45) DEFAULT NULL,
  `amount_of_VMs` int(6) DEFAULT '0',
  `amount_of_memory_MBs` int(6) DEFAULT '0',
  `amount_of_storage_GBs` int(6) DEFAULT '0',
  `voip_product_source` varchar(23) DEFAULT NULL,
  `description` blob,
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voip_service_products`
--

LOCK TABLES `voip_service_products` WRITE;
/*!40000 ALTER TABLE `voip_service_products` DISABLE KEYS */;
INSERT INTO `voip_service_products` VALUES (10,'test of voip',4,1024,50,'Internal_Infrastructure','','eamonnkillian@gmail.com','2014-05-24 12:48:43');
/*!40000 ALTER TABLE `voip_service_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voip_service_products_sales`
--

DROP TABLE IF EXISTS `voip_service_products_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voip_service_products_sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(45) DEFAULT NULL,
  `service_start_date` varchar(10) DEFAULT NULL,
  `service_finish_date` varchar(10) DEFAULT NULL,
  `purchased_qty` int(6) DEFAULT NULL,
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voip_service_products_sales`
--

LOCK TABLES `voip_service_products_sales` WRITE;
/*!40000 ALTER TABLE `voip_service_products_sales` DISABLE KEYS */;
/*!40000 ALTER TABLE `voip_service_products_sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voipdevices`
--

DROP TABLE IF EXISTS `voipdevices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voipdevices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `voipdevices_type` varchar(45) DEFAULT NULL,
  `assignment` varchar(11) DEFAULT NULL,
  `currency` varchar(8) DEFAULT NULL,
  `device_purchase_date` varchar(10) DEFAULT NULL,
  `voipdevices_location` varchar(45) DEFAULT NULL,
  `voipdevices_cost` float(10,2) DEFAULT '0.00',
  `voipdevices_maintenance_cost` float(10,2) DEFAULT '0.00',
  `voipdevices_maintenance_term` int(6) DEFAULT '0',
  `voipdevices_lifespan` int(6) DEFAULT '0',
  `voipdevices_power_consumption` int(6) DEFAULT '0',
  `voipdevices_qty` int(6) DEFAULT '0',
  `voipdevices_disposal_cost` int(6) DEFAULT '0',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='cost_input';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voipdevices`
--

LOCK TABLES `voipdevices` WRITE;
/*!40000 ALTER TABLE `voipdevices` DISABLE KEYS */;
/*!40000 ALTER TABLE `voipdevices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wide_format`
--

DROP TABLE IF EXISTS `wide_format`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wide_format` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `printer_type` varchar(45) DEFAULT NULL,
  `currency` varchar(8) DEFAULT NULL,
  `printer_purchase_date` varchar(10) DEFAULT NULL,
  `printer_location` varchar(45) DEFAULT NULL,
  `colour` varchar(4) DEFAULT NULL,
  `printer_cost` float DEFAULT NULL,
  `printer_maintenance_cost_per_annum` float DEFAULT NULL,
  `printer_maintenance_term` int(11) DEFAULT NULL,
  `printer_lifespan` varchar(45) DEFAULT NULL,
  `printer_power_consumption` float DEFAULT NULL,
  `printer_consumables_cost` float(10,2) DEFAULT '0.00',
  `estimated_consumables_qty` int(6) DEFAULT '0',
  `printer_qty` int(11) DEFAULT NULL,
  `printer_disposal_cost` float(10,2) DEFAULT '0.00',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='cost_input';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wide_format`
--

LOCK TABLES `wide_format` WRITE;
/*!40000 ALTER TABLE `wide_format` DISABLE KEYS */;
/*!40000 ALTER TABLE `wide_format` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wifiaccess`
--

DROP TABLE IF EXISTS `wifiaccess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wifiaccess` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wifiaccess_type` varchar(45) DEFAULT NULL,
  `assignment` varchar(11) DEFAULT NULL,
  `currency` varchar(8) DEFAULT NULL,
  `devices_purchase_date` varchar(10) DEFAULT NULL,
  `wifiaccess_location` varchar(45) DEFAULT NULL,
  `wifiaccess_cost` float(10,2) DEFAULT '0.00',
  `wifiaccess_maintenance_cost` float(10,2) DEFAULT '0.00',
  `wifiaccess_maintenance_term` int(6) DEFAULT '0',
  `wifiaccess_lifespan` int(6) DEFAULT '0',
  `wifiaccess_power_consumption` int(6) DEFAULT '0',
  `wifiaccess_qty` int(6) DEFAULT '0',
  `wifiaccess_disposal_cost` int(6) DEFAULT '0',
  `lastupdatedby` varchar(45) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='cost_input';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wifiaccess`
--

LOCK TABLES `wifiaccess` WRITE;
/*!40000 ALTER TABLE `wifiaccess` DISABLE KEYS */;
/*!40000 ALTER TABLE `wifiaccess` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-04-18  9:57:46
