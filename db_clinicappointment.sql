# HeidiSQL Dump 
#
# --------------------------------------------------------
# Host:                         127.0.0.1
# Database:                     db_clinicappointment
# Server version:               5.0.51b-community-nt
# Server OS:                    Win32
# Target compatibility:         ANSI SQL
# HeidiSQL version:             4.0
# Date/time:                    2024-11-25 20:41:44
# --------------------------------------------------------

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ANSI,NO_BACKSLASH_ESCAPES';*/
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;*/


#
# Database structure for database 'db_clinicappointment'
#

CREATE DATABASE /*!32312 IF NOT EXISTS*/ "db_clinicappointment" /*!40100 DEFAULT CHARACTER SET latin1 */;

USE "db_clinicappointment";


#
# Table structure for table 'tbl_admin'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_admin" (
  "admin_id" int(10) unsigned NOT NULL auto_increment,
  "admin_name" varchar(50) default NULL,
  "admin_contact" varchar(50) default NULL,
  "admin_email" varchar(50) default NULL,
  "admin_password" varchar(50) default NULL,
  PRIMARY KEY  ("admin_id")
) AUTO_INCREMENT=4;



#
# Dumping data for table 'tbl_admin'
#

LOCK TABLES "tbl_admin" WRITE;
/*!40000 ALTER TABLE "tbl_admin" DISABLE KEYS;*/
REPLACE INTO "tbl_admin" ("admin_id", "admin_name", "admin_contact", "admin_email", "admin_password") VALUES
	('3','Adwaitha','9867564670','adwaitha@gmail.com','adwaitha123');
/*!40000 ALTER TABLE "tbl_admin" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_appointment'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_appointment" (
  "appointment_id" int(10) unsigned NOT NULL auto_increment,
  "appointment_date" varchar(50) default NULL,
  "appointment_fordate" varchar(50) default NULL,
  "availability_id" int(10) unsigned default NULL,
  "appointment_token" varchar(50) default NULL,
  "user_id" int(10) unsigned default NULL,
  "appointment_status" int(10) unsigned default '0',
  "appointment_amount" int(10) unsigned default NULL,
  "deliveryboy_id" int(10) unsigned default NULL,
  "presecription_image" varchar(50) default NULL,
  "shop_id" int(10) unsigned default NULL,
  "appointment_type" int(10) unsigned default NULL,
  PRIMARY KEY  ("appointment_id")
) AUTO_INCREMENT=27;



#
# Dumping data for table 'tbl_appointment'
#

LOCK TABLES "tbl_appointment" WRITE;
/*!40000 ALTER TABLE "tbl_appointment" DISABLE KEYS;*/
REPLACE INTO "tbl_appointment" ("appointment_id", "appointment_date", "appointment_fordate", "availability_id", "appointment_token", "user_id", "appointment_status", "appointment_amount", "deliveryboy_id", "presecription_image", "shop_id", "appointment_type") VALUES
	('15','2024-11-12','2024-11-13','1','5','2','0','100',NULL,NULL,'1','0');
REPLACE INTO "tbl_appointment" ("appointment_id", "appointment_date", "appointment_fordate", "availability_id", "appointment_token", "user_id", "appointment_status", "appointment_amount", "deliveryboy_id", "presecription_image", "shop_id", "appointment_type") VALUES
	('16','2024-11-12','2024-11-14','1','5','2','8','100',NULL,'presecriptionImage1650.png','1','0');
REPLACE INTO "tbl_appointment" ("appointment_id", "appointment_date", "appointment_fordate", "availability_id", "appointment_token", "user_id", "appointment_status", "appointment_amount", "deliveryboy_id", "presecription_image", "shop_id", "appointment_type") VALUES
	('17','2024-11-13','2024-11-14','1','4','2','7','56','1','presecriptionImage1585.png','1','1');
REPLACE INTO "tbl_appointment" ("appointment_id", "appointment_date", "appointment_fordate", "availability_id", "appointment_token", "user_id", "appointment_status", "appointment_amount", "deliveryboy_id", "presecription_image", "shop_id", "appointment_type") VALUES
	('18','2024-11-13','2024-11-14','5','8','3','8','100',NULL,'presecriptionImage1039.jpg','1','0');
REPLACE INTO "tbl_appointment" ("appointment_id", "appointment_date", "appointment_fordate", "availability_id", "appointment_token", "user_id", "appointment_status", "appointment_amount", "deliveryboy_id", "presecription_image", "shop_id", "appointment_type") VALUES
	('19','2024-11-13','2024-11-14','5','7','3','7','168','1','presecriptionImage2034.jpg','1','0');
REPLACE INTO "tbl_appointment" ("appointment_id", "appointment_date", "appointment_fordate", "availability_id", "appointment_token", "user_id", "appointment_status", "appointment_amount", "deliveryboy_id", "presecription_image", "shop_id", "appointment_type") VALUES
	('20','2024-11-13','2024-11-13','5','8','3','2','100',NULL,'presecriptionImage1298.jpg','1','1');
REPLACE INTO "tbl_appointment" ("appointment_id", "appointment_date", "appointment_fordate", "availability_id", "appointment_token", "user_id", "appointment_status", "appointment_amount", "deliveryboy_id", "presecription_image", "shop_id", "appointment_type") VALUES
	('21','2024-11-13','2024-11-13','5','7','3','1','100',NULL,NULL,'1','1');
REPLACE INTO "tbl_appointment" ("appointment_id", "appointment_date", "appointment_fordate", "availability_id", "appointment_token", "user_id", "appointment_status", "appointment_amount", "deliveryboy_id", "presecription_image", "shop_id", "appointment_type") VALUES
	('22','2024-11-13','2024-11-13','6','6','3','7','56','1','presecriptionImage1091.jpg','1','1');
REPLACE INTO "tbl_appointment" ("appointment_id", "appointment_date", "appointment_fordate", "availability_id", "appointment_token", "user_id", "appointment_status", "appointment_amount", "deliveryboy_id", "presecription_image", "shop_id", "appointment_type") VALUES
	('23','2024-11-13','2024-11-14','7','1','2','0','100',NULL,NULL,'1','0');
REPLACE INTO "tbl_appointment" ("appointment_id", "appointment_date", "appointment_fordate", "availability_id", "appointment_token", "user_id", "appointment_status", "appointment_amount", "deliveryboy_id", "presecription_image", "shop_id", "appointment_type") VALUES
	('24','2024-11-13','2024-11-19','5','8','2','1','100',NULL,NULL,'1','0');
REPLACE INTO "tbl_appointment" ("appointment_id", "appointment_date", "appointment_fordate", "availability_id", "appointment_token", "user_id", "appointment_status", "appointment_amount", "deliveryboy_id", "presecription_image", "shop_id", "appointment_type") VALUES
	('25','2024-11-13','2024-11-16','7','1','1','7','168','1','presecriptionImage1586.jpg','1','0');
REPLACE INTO "tbl_appointment" ("appointment_id", "appointment_date", "appointment_fordate", "availability_id", "appointment_token", "user_id", "appointment_status", "appointment_amount", "deliveryboy_id", "presecription_image", "shop_id", "appointment_type") VALUES
	('26','2024-11-13','2024-11-15','7','1','1','2','100',NULL,'presecriptionImage1632.jpg',NULL,'1');
/*!40000 ALTER TABLE "tbl_appointment" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_availability'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_availability" (
  "availability_id" int(15) unsigned NOT NULL auto_increment,
  "availability_stime" varchar(15) default NULL,
  "availability_slot" int(15) unsigned default NULL,
  "clinic_id" int(15) unsigned default NULL,
  "availability_etime" varchar(15) default NULL,
  PRIMARY KEY  ("availability_id")
) AUTO_INCREMENT=9;



#
# Dumping data for table 'tbl_availability'
#

LOCK TABLES "tbl_availability" WRITE;
/*!40000 ALTER TABLE "tbl_availability" DISABLE KEYS;*/
REPLACE INTO "tbl_availability" ("availability_id", "availability_stime", "availability_slot", "clinic_id", "availability_etime") VALUES
	('2','15:30','15','4','18:30');
REPLACE INTO "tbl_availability" ("availability_id", "availability_stime", "availability_slot", "clinic_id", "availability_etime") VALUES
	('3','15:30','10','3','18:30');
REPLACE INTO "tbl_availability" ("availability_id", "availability_stime", "availability_slot", "clinic_id", "availability_etime") VALUES
	('4','16:30','10','2','17:30');
REPLACE INTO "tbl_availability" ("availability_id", "availability_stime", "availability_slot", "clinic_id", "availability_etime") VALUES
	('5','18:50','8','8','19:50');
REPLACE INTO "tbl_availability" ("availability_id", "availability_stime", "availability_slot", "clinic_id", "availability_etime") VALUES
	('8','17:07','6','1','19:07');
/*!40000 ALTER TABLE "tbl_availability" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_cart'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_cart" (
  "cart_id" int(10) unsigned NOT NULL auto_increment,
  "cart_quantity" int(50) default '1',
  "cart_status" int(10) unsigned default '0',
  "medicine_id" int(10) unsigned default NULL,
  "appointment_id" int(10) unsigned default NULL,
  PRIMARY KEY  ("cart_id")
) AUTO_INCREMENT=14;



#
# Dumping data for table 'tbl_cart'
#

LOCK TABLES "tbl_cart" WRITE;
/*!40000 ALTER TABLE "tbl_cart" DISABLE KEYS;*/
REPLACE INTO "tbl_cart" ("cart_id", "cart_quantity", "cart_status", "medicine_id", "appointment_id") VALUES
	('5',1,'1','2','4');
REPLACE INTO "tbl_cart" ("cart_id", "cart_quantity", "cart_status", "medicine_id", "appointment_id") VALUES
	('6',1,'1','2','5');
REPLACE INTO "tbl_cart" ("cart_id", "cart_quantity", "cart_status", "medicine_id", "appointment_id") VALUES
	('7',1,'0','2','6');
REPLACE INTO "tbl_cart" ("cart_id", "cart_quantity", "cart_status", "medicine_id", "appointment_id") VALUES
	('8',1,'0','3','7');
REPLACE INTO "tbl_cart" ("cart_id", "cart_quantity", "cart_status", "medicine_id", "appointment_id") VALUES
	('9',1,'1','4','10');
REPLACE INTO "tbl_cart" ("cart_id", "cart_quantity", "cart_status", "medicine_id", "appointment_id") VALUES
	('10',1,'0','4','17');
REPLACE INTO "tbl_cart" ("cart_id", "cart_quantity", "cart_status", "medicine_id", "appointment_id") VALUES
	('11',3,'0','4','19');
REPLACE INTO "tbl_cart" ("cart_id", "cart_quantity", "cart_status", "medicine_id", "appointment_id") VALUES
	('12',1,'0','4','22');
REPLACE INTO "tbl_cart" ("cart_id", "cart_quantity", "cart_status", "medicine_id", "appointment_id") VALUES
	('13',3,'0','4','25');
/*!40000 ALTER TABLE "tbl_cart" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_category'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_category" (
  "category_id" int(10) unsigned NOT NULL auto_increment,
  "category_name" varchar(50) default NULL,
  PRIMARY KEY  ("category_id")
) AUTO_INCREMENT=17;



#
# Dumping data for table 'tbl_category'
#

LOCK TABLES "tbl_category" WRITE;
/*!40000 ALTER TABLE "tbl_category" DISABLE KEYS;*/
REPLACE INTO "tbl_category" ("category_id", "category_name") VALUES
	('8','Cardiac Failure');
REPLACE INTO "tbl_category" ("category_id", "category_name") VALUES
	('9','Antiplatelet Drugs');
REPLACE INTO "tbl_category" ("category_id", "category_name") VALUES
	('10','Hyperglycaemics');
REPLACE INTO "tbl_category" ("category_id", "category_name") VALUES
	('11','Analgesics-Centrally Acting');
REPLACE INTO "tbl_category" ("category_id", "category_name") VALUES
	('12','Fever');
REPLACE INTO "tbl_category" ("category_id", "category_name") VALUES
	('13','Stomach pain');
REPLACE INTO "tbl_category" ("category_id", "category_name") VALUES
	('14','Body Pain');
REPLACE INTO "tbl_category" ("category_id", "category_name") VALUES
	('15','Leg Pain');
REPLACE INTO "tbl_category" ("category_id", "category_name") VALUES
	('16','vitamin');
/*!40000 ALTER TABLE "tbl_category" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_chat'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_chat" (
  "chat_id" int(10) unsigned NOT NULL auto_increment,
  "chat_content" varchar(50) default NULL,
  "chat_datetime" varchar(50) default NULL,
  "chat_fromdid" int(10) unsigned default NULL,
  "chat_fromuid" int(10) unsigned default NULL,
  "chat_touid" int(10) unsigned default NULL,
  "chat_todid" int(10) unsigned default NULL,
  "chat_status" int(10) unsigned default NULL,
  PRIMARY KEY  ("chat_id")
) AUTO_INCREMENT=16;



#
# Dumping data for table 'tbl_chat'
#

LOCK TABLES "tbl_chat" WRITE;
/*!40000 ALTER TABLE "tbl_chat" DISABLE KEYS;*/
REPLACE INTO "tbl_chat" ("chat_id", "chat_content", "chat_datetime", "chat_fromdid", "chat_fromuid", "chat_touid", "chat_todid", "chat_status") VALUES
	('1','hlo','November 11 2024, 02:00 PM',NULL,'2',NULL,'1',NULL);
REPLACE INTO "tbl_chat" ("chat_id", "chat_content", "chat_datetime", "chat_fromdid", "chat_fromuid", "chat_touid", "chat_todid", "chat_status") VALUES
	('2','','November 11 2024, 02:00 PM',NULL,'2',NULL,'1',NULL);
REPLACE INTO "tbl_chat" ("chat_id", "chat_content", "chat_datetime", "chat_fromdid", "chat_fromuid", "chat_touid", "chat_todid", "chat_status") VALUES
	('3','hi','November 11 2024, 02:01 PM','1',NULL,'2',NULL,NULL);
REPLACE INTO "tbl_chat" ("chat_id", "chat_content", "chat_datetime", "chat_fromdid", "chat_fromuid", "chat_touid", "chat_todid", "chat_status") VALUES
	('4','hlo','November 11 2024, 02:02 PM',NULL,'2',NULL,'1',NULL);
REPLACE INTO "tbl_chat" ("chat_id", "chat_content", "chat_datetime", "chat_fromdid", "chat_fromuid", "chat_touid", "chat_todid", "chat_status") VALUES
	('5','alo','November 12 2024, 07:51 AM','1',NULL,'2',NULL,NULL);
REPLACE INTO "tbl_chat" ("chat_id", "chat_content", "chat_datetime", "chat_fromdid", "chat_fromuid", "chat_touid", "chat_todid", "chat_status") VALUES
	('6','hey','November 12 2024, 07:51 AM',NULL,'2',NULL,'1',NULL);
REPLACE INTO "tbl_chat" ("chat_id", "chat_content", "chat_datetime", "chat_fromdid", "chat_fromuid", "chat_touid", "chat_todid", "chat_status") VALUES
	('7','hey','November 12 2024, 07:52 AM',NULL,'2',NULL,'1',NULL);
REPLACE INTO "tbl_chat" ("chat_id", "chat_content", "chat_datetime", "chat_fromdid", "chat_fromuid", "chat_touid", "chat_todid", "chat_status") VALUES
	('8','Ho','November 12 2024, 11:59 AM','1',NULL,'1',NULL,NULL);
REPLACE INTO "tbl_chat" ("chat_id", "chat_content", "chat_datetime", "chat_fromdid", "chat_fromuid", "chat_touid", "chat_todid", "chat_status") VALUES
	('9','','November 12 2024, 11:59 AM','1',NULL,'1',NULL,NULL);
REPLACE INTO "tbl_chat" ("chat_id", "chat_content", "chat_datetime", "chat_fromdid", "chat_fromuid", "chat_touid", "chat_todid", "chat_status") VALUES
	('10','Hi','November 12 2024, 11:59 AM','1',NULL,'1',NULL,NULL);
REPLACE INTO "tbl_chat" ("chat_id", "chat_content", "chat_datetime", "chat_fromdid", "chat_fromuid", "chat_touid", "chat_todid", "chat_status") VALUES
	('11','hlo','November 13 2024, 04:11 AM',NULL,'3',NULL,'8',NULL);
REPLACE INTO "tbl_chat" ("chat_id", "chat_content", "chat_datetime", "chat_fromdid", "chat_fromuid", "chat_touid", "chat_todid", "chat_status") VALUES
	('12','alo','November 13 2024, 09:05 AM','8',NULL,'3',NULL,NULL);
REPLACE INTO "tbl_chat" ("chat_id", "chat_content", "chat_datetime", "chat_fromdid", "chat_fromuid", "chat_touid", "chat_todid", "chat_status") VALUES
	('13','alo','November 13 2024, 09:13 AM',NULL,'3',NULL,'1',NULL);
REPLACE INTO "tbl_chat" ("chat_id", "chat_content", "chat_datetime", "chat_fromdid", "chat_fromuid", "chat_touid", "chat_todid", "chat_status") VALUES
	('14','alo','November 13 2024, 09:14 AM','1',NULL,'3',NULL,NULL);
REPLACE INTO "tbl_chat" ("chat_id", "chat_content", "chat_datetime", "chat_fromdid", "chat_fromuid", "chat_touid", "chat_todid", "chat_status") VALUES
	('15','fk','November 13 2024, 10:29 AM',NULL,'1',NULL,'1',NULL);
/*!40000 ALTER TABLE "tbl_chat" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_chatlist'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_chatlist" (
  "chatlist_id" int(10) unsigned default NULL,
  "chatlist_content" varchar(50) default NULL,
  "chatlist_datetime" varchar(50) default NULL,
  "chatlist_fromid" int(10) unsigned default NULL,
  "chatlist_toid" int(10) unsigned default NULL,
  "chatlist_type" varchar(50) default NULL,
  "chatlist_status" varchar(50) default NULL
);



#
# Dumping data for table 'tbl_chatlist'
#

# No data found.



#
# Table structure for table 'tbl_clinic'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_clinic" (
  "clinic_id" int(10) unsigned NOT NULL auto_increment,
  "clinic_name" varchar(50) default NULL,
  "clinic_email" varchar(50) default NULL,
  "clinic_address" varchar(50) default NULL,
  "clinic_contact" varchar(50) default NULL,
  "clinic_logo" varchar(50) default NULL,
  "clinic_proof" varchar(50) default NULL,
  "type_id" int(10) unsigned default NULL,
  "clinic_vstatus" int(10) unsigned default '0',
  "place_id" tinyint(3) unsigned default NULL,
  "clinic_password" varchar(50) default NULL,
  "clinic_prooftype" varchar(50) default NULL,
  "clinic_regno" varchar(50) default NULL,
  PRIMARY KEY  ("clinic_id")
) AUTO_INCREMENT=10;



#
# Dumping data for table 'tbl_clinic'
#

LOCK TABLES "tbl_clinic" WRITE;
/*!40000 ALTER TABLE "tbl_clinic" DISABLE KEYS;*/
REPLACE INTO "tbl_clinic" ("clinic_id", "clinic_name", "clinic_email", "clinic_address", "clinic_contact", "clinic_logo", "clinic_proof", "type_id", "clinic_vstatus", "place_id", "clinic_password", "clinic_prooftype", "clinic_regno") VALUES
	('1','BioFusion@gmail.com','biofusion@gmail.com','mutzha,erklm','9363748678','clinicLogo1803.jpg','clinicProof2030.jpg','11','1',2,'biofusion123','License','MC1001');
REPLACE INTO "tbl_clinic" ("clinic_id", "clinic_name", "clinic_email", "clinic_address", "clinic_contact", "clinic_logo", "clinic_proof", "type_id", "clinic_vstatus", "place_id", "clinic_password", "clinic_prooftype", "clinic_regno") VALUES
	('2','Excellence Health Care','excellence@gmail.com','mutzha,erklm','8768846789','clinicLogo2010.jpg','clinicProof1569.jpg','11','1',2,'excellence123','License','MC1002');
REPLACE INTO "tbl_clinic" ("clinic_id", "clinic_name", "clinic_email", "clinic_address", "clinic_contact", "clinic_logo", "clinic_proof", "type_id", "clinic_vstatus", "place_id", "clinic_password", "clinic_prooftype", "clinic_regno") VALUES
	('3','TrustCare Medical Group','trustcare@gmail.com','peruva p.o
Kottayam','9363748678','clinicLogo1451.png','clinicProof1729.jpg','11','1',3,'trustcare123','License','MC1003');
REPLACE INTO "tbl_clinic" ("clinic_id", "clinic_name", "clinic_email", "clinic_address", "clinic_contact", "clinic_logo", "clinic_proof", "type_id", "clinic_vstatus", "place_id", "clinic_password", "clinic_prooftype", "clinic_regno") VALUES
	('4','Precision Health Hub','precision@gmail.com','peruva,kottayam','9763738298','clinicLogo1099.png','clinicProof1765.jpg','12','1',3,'precision123','License','MC1004');
REPLACE INTO "tbl_clinic" ("clinic_id", "clinic_name", "clinic_email", "clinic_address", "clinic_contact", "clinic_logo", "clinic_proof", "type_id", "clinic_vstatus", "place_id", "clinic_password", "clinic_prooftype", "clinic_regno") VALUES
	('5','ProHealth Specialists','prohealth@gmail.com','Kochi,Erklm','8768846789','clinicLogo1315.png','clinicProof1019.jpg','13','0',7,'prohealth123','Aadhar','MC1005');
REPLACE INTO "tbl_clinic" ("clinic_id", "clinic_name", "clinic_email", "clinic_address", "clinic_contact", "clinic_logo", "clinic_proof", "type_id", "clinic_vstatus", "place_id", "clinic_password", "clinic_prooftype", "clinic_regno") VALUES
	('6','InnovateWell Clinic','innovate@gmail.com','kollam,kottarakara','9825273356','clinicLogo1618.jpg','clinicProof1508.jpg','11','2',11,'innovate123','License','MC1006');
REPLACE INTO "tbl_clinic" ("clinic_id", "clinic_name", "clinic_email", "clinic_address", "clinic_contact", "clinic_logo", "clinic_proof", "type_id", "clinic_vstatus", "place_id", "clinic_password", "clinic_prooftype", "clinic_regno") VALUES
	('7','TenderCare Clinic','tender@gmail.com','erklm,kochi','9363748678','clinicLogo1157.jpg','clinicProof1628.jpg','14','1',7,'tender123','License','MC1007');
REPLACE INTO "tbl_clinic" ("clinic_id", "clinic_name", "clinic_email", "clinic_address", "clinic_contact", "clinic_logo", "clinic_proof", "type_id", "clinic_vstatus", "place_id", "clinic_password", "clinic_prooftype", "clinic_regno") VALUES
	('8','AllCare Family Medicine','allcare@gmail.com','erklm,mutzha','9786466786','clinicLogo1125.jpg','clinicProof2036.jpg','11','1',2,'allcare123','License','MC1008');
REPLACE INTO "tbl_clinic" ("clinic_id", "clinic_name", "clinic_email", "clinic_address", "clinic_contact", "clinic_logo", "clinic_proof", "type_id", "clinic_vstatus", "place_id", "clinic_password", "clinic_prooftype", "clinic_regno") VALUES
	('9','familycare','familycaregmai@gmaii.com','ernakulam','9363748678','clinicLogo1090.png','clinicProof1879.png','13','0',2,'familycare123','License','MC1009');
/*!40000 ALTER TABLE "tbl_clinic" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_complaint'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_complaint" (
  "complaint_id" int(10) unsigned NOT NULL auto_increment,
  "complaint_title" varchar(50) default NULL,
  "complaint_content" varchar(50) default NULL,
  "complaint_reply" varchar(50) default NULL,
  "complaint_date" date default NULL,
  "user_id" int(10) unsigned default NULL,
  "clinic_id" int(10) unsigned default NULL,
  "complaint_status" int(10) unsigned default '0',
  "reply_date" date default NULL,
  PRIMARY KEY  ("complaint_id")
) AUTO_INCREMENT=4;



#
# Dumping data for table 'tbl_complaint'
#

LOCK TABLES "tbl_complaint" WRITE;
/*!40000 ALTER TABLE "tbl_complaint" DISABLE KEYS;*/
REPLACE INTO "tbl_complaint" ("complaint_id", "complaint_title", "complaint_content", "complaint_reply", "complaint_date", "user_id", "clinic_id", "complaint_status", "reply_date") VALUES
	('2','time issue','delivery late','correct it
','2024-11-13','3','8','1','2024-11-13');
REPLACE INTO "tbl_complaint" ("complaint_id", "complaint_title", "complaint_content", "complaint_reply", "complaint_date", "user_id", "clinic_id", "complaint_status", "reply_date") VALUES
	('3','time issue','fghjkk','frytjk','2024-11-13','1','1','1','2024-11-13');
/*!40000 ALTER TABLE "tbl_complaint" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_deliveryboy'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_deliveryboy" (
  "deliveryboy_id" int(10) unsigned NOT NULL auto_increment,
  "deliveryboy_name" varchar(50) default NULL,
  "deliveryboy_email" varchar(50) default NULL,
  "deliveryboy_address" varchar(50) default NULL,
  "deliveryboy_contact" varchar(50) default NULL,
  "deliveryboy_password" varchar(50) default NULL,
  "shop_id" int(10) unsigned default NULL,
  PRIMARY KEY  ("deliveryboy_id")
) AUTO_INCREMENT=3;



#
# Dumping data for table 'tbl_deliveryboy'
#

LOCK TABLES "tbl_deliveryboy" WRITE;
/*!40000 ALTER TABLE "tbl_deliveryboy" DISABLE KEYS;*/
REPLACE INTO "tbl_deliveryboy" ("deliveryboy_id", "deliveryboy_name", "deliveryboy_email", "deliveryboy_address", "deliveryboy_contact", "deliveryboy_password", "shop_id") VALUES
	('1','Ajith','ajith@gmail.com','mtuzha,erklm','8768846789','123','1');
REPLACE INTO "tbl_deliveryboy" ("deliveryboy_id", "deliveryboy_name", "deliveryboy_email", "deliveryboy_address", "deliveryboy_contact", "deliveryboy_password", "shop_id") VALUES
	('2','Akhil','akhil@gmail.com','mutzha,erklm','9363748678','123','1');
/*!40000 ALTER TABLE "tbl_deliveryboy" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_district'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_district" (
  "district_id" int(10) unsigned NOT NULL auto_increment,
  "district_name" varchar(50) default NULL,
  PRIMARY KEY  ("district_id")
) AUTO_INCREMENT=10;



#
# Dumping data for table 'tbl_district'
#

LOCK TABLES "tbl_district" WRITE;
/*!40000 ALTER TABLE "tbl_district" DISABLE KEYS;*/
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	('1','Ernakulam');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	('2','Kottayam');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	('4','Kollam');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	('5','Idukki');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	('6','Kannur');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	('7','Alapuzha');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	('8','Malapuram');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	('9','ernakulam');
/*!40000 ALTER TABLE "tbl_district" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_medicine'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_medicine" (
  "medicine_id" int(10) unsigned NOT NULL auto_increment,
  "medicine_name" varchar(50) default NULL,
  "medicine_description" varchar(500) default NULL,
  "medicine_image" varchar(50) default NULL,
  "subcategory_id" int(10) unsigned default NULL,
  "medicine_rate" int(10) unsigned default NULL,
  "shop_id" int(10) unsigned default NULL,
  PRIMARY KEY  ("medicine_id")
) AUTO_INCREMENT=7;



#
# Dumping data for table 'tbl_medicine'
#

LOCK TABLES "tbl_medicine" WRITE;
/*!40000 ALTER TABLE "tbl_medicine" DISABLE KEYS;*/
REPLACE INTO "tbl_medicine" ("medicine_id", "medicine_name", "medicine_description", "medicine_image", "subcategory_id", "medicine_rate", "shop_id") VALUES
	('3','Blockers','ndhjdjididikxkd','medicineImage1547.jpg','8','80','2');
REPLACE INTO "tbl_medicine" ("medicine_id", "medicine_name", "medicine_description", "medicine_image", "subcategory_id", "medicine_rate", "shop_id") VALUES
	('4','fghguj','tyyu','medicineImage1007.jpg','8','56','1');
REPLACE INTO "tbl_medicine" ("medicine_id", "medicine_name", "medicine_description", "medicine_image", "subcategory_id", "medicine_rate", "shop_id") VALUES
	('5','Antacids','Neutralize stomach acid, and can help with heartburn and sour stomach. Examples include sodium bicarbonate, aluminum hydroxide, and Tums.
','medicineImage1800.jpg','23','50','3');
REPLACE INTO "tbl_medicine" ("medicine_id", "medicine_name", "medicine_description", "medicine_image", "subcategory_id", "medicine_rate", "shop_id") VALUES
	('6',' Antispasmodics','Neutralize stomach acid, and can help with heartburn and sour stomach. Examples include sodium bicarbonate, aluminum hydroxide, and Tums.
','medicineImage1393.jpg','28','23','3');
/*!40000 ALTER TABLE "tbl_medicine" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_place'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_place" (
  "place_id" int(10) unsigned NOT NULL auto_increment,
  "place_name" varchar(50) default NULL,
  "district_id" int(10) unsigned default NULL,
  PRIMARY KEY  ("place_id")
) AUTO_INCREMENT=14;



#
# Dumping data for table 'tbl_place'
#

LOCK TABLES "tbl_place" WRITE;
/*!40000 ALTER TABLE "tbl_place" DISABLE KEYS;*/
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('2','mvtzha','1');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('3','peruva','2');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('4','Perubavoor','1');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('5','Changanassery','2');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('6','pala','2');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('7','Kochi','1');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('8','Kainagiri','7');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('9','Kuttanad','7');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('10','Kattapana','5');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('11','kottarakara','4');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('12','Thelpara','8');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('13','Vattapadam','8');
/*!40000 ALTER TABLE "tbl_place" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_review'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_review" (
  "review_id" int(10) unsigned NOT NULL auto_increment,
  "user_review" varchar(50) default NULL,
  "user_rating" int(10) unsigned default NULL,
  "review_datetime" varchar(50) default NULL,
  "user_id" int(50) default NULL,
  "clinic_id" int(10) unsigned default NULL,
  PRIMARY KEY  ("review_id")
) AUTO_INCREMENT=6;



#
# Dumping data for table 'tbl_review'
#

LOCK TABLES "tbl_review" WRITE;
/*!40000 ALTER TABLE "tbl_review" DISABLE KEYS;*/
REPLACE INTO "tbl_review" ("review_id", "user_review", "user_rating", "review_datetime", "user_id", "clinic_id") VALUES
	('3','NICE','3','2024-11-13 04:00:15',3,'8');
REPLACE INTO "tbl_review" ("review_id", "user_review", "user_rating", "review_datetime", "user_id", "clinic_id") VALUES
	('4','nice
','5','2024-11-13 07:45:43',3,'8');
REPLACE INTO "tbl_review" ("review_id", "user_review", "user_rating", "review_datetime", "user_id", "clinic_id") VALUES
	('5','sdfgh','5','2024-11-13 10:28:21',1,'1');
/*!40000 ALTER TABLE "tbl_review" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_shop'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_shop" (
  "shop_id" int(10) unsigned NOT NULL auto_increment,
  "shop_name" varchar(20) default NULL,
  "shop_email" varchar(50) default NULL,
  "shop_address" varchar(30) default NULL,
  "shop_contact" varchar(15) default NULL,
  "shop_logo" varchar(50) default NULL,
  "shop_proof" varchar(30) default NULL,
  "shop_vstatus" int(10) unsigned default '0',
  "place_id" int(3) unsigned default NULL,
  "shop_password" varchar(50) default NULL,
  "shop_regno" varchar(50) default NULL,
  PRIMARY KEY  ("shop_id")
) AUTO_INCREMENT=4;



#
# Dumping data for table 'tbl_shop'
#

LOCK TABLES "tbl_shop" WRITE;
/*!40000 ALTER TABLE "tbl_shop" DISABLE KEYS;*/
REPLACE INTO "tbl_shop" ("shop_id", "shop_name", "shop_email", "shop_address", "shop_contact", "shop_logo", "shop_proof", "shop_vstatus", "place_id", "shop_password", "shop_regno") VALUES
	('1','Medmart','medmart@gmail.com','mutzha,erklm','9363748678','shopLogo1500.jpg','shopProof1481.jpg','1','2','123','SHID1001');
REPLACE INTO "tbl_shop" ("shop_id", "shop_name", "shop_email", "shop_address", "shop_contact", "shop_logo", "shop_proof", "shop_vstatus", "place_id", "shop_password", "shop_regno") VALUES
	('2','Apollo Pharmacy','apollo@gmail.com','mutzha,erklm','9825273356','shopLogo1455.jpg','shopProof999.jpg','1','2','123','SHID1002');
REPLACE INTO "tbl_shop" ("shop_id", "shop_name", "shop_email", "shop_address", "shop_contact", "shop_logo", "shop_proof", "shop_vstatus", "place_id", "shop_password", "shop_regno") VALUES
	('3','Health Haven','health@gmail.com','erklm,mutzha','9763738298','shopLogo1472.jpg','shopProof2070.jpg','1','2','health123','SHID1003');
/*!40000 ALTER TABLE "tbl_shop" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_stock'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_stock" (
  "stock_id" int(10) unsigned NOT NULL auto_increment,
  "stock_quantity" int(10) unsigned default NULL,
  "stock_date" date default NULL,
  "medicine_id" int(10) unsigned default NULL,
  PRIMARY KEY  ("stock_id")
) AUTO_INCREMENT=6;



#
# Dumping data for table 'tbl_stock'
#

LOCK TABLES "tbl_stock" WRITE;
/*!40000 ALTER TABLE "tbl_stock" DISABLE KEYS;*/
REPLACE INTO "tbl_stock" ("stock_id", "stock_quantity", "stock_date", "medicine_id") VALUES
	('1','25','2024-11-11','1');
REPLACE INTO "tbl_stock" ("stock_id", "stock_quantity", "stock_date", "medicine_id") VALUES
	('3','10','2024-11-12','3');
REPLACE INTO "tbl_stock" ("stock_id", "stock_quantity", "stock_date", "medicine_id") VALUES
	('4','10','2024-11-12','4');
REPLACE INTO "tbl_stock" ("stock_id", "stock_quantity", "stock_date", "medicine_id") VALUES
	('5','10','2024-11-13','5');
/*!40000 ALTER TABLE "tbl_stock" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_subcategory'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_subcategory" (
  "subcategory_id" int(10) unsigned NOT NULL auto_increment,
  "subcategory_name" varchar(50) default NULL,
  "category_id" int(10) unsigned default NULL,
  PRIMARY KEY  ("subcategory_id")
) AUTO_INCREMENT=29;



#
# Dumping data for table 'tbl_subcategory'
#

LOCK TABLES "tbl_subcategory" WRITE;
/*!40000 ALTER TABLE "tbl_subcategory" DISABLE KEYS;*/
REPLACE INTO "tbl_subcategory" ("subcategory_id", "subcategory_name", "category_id") VALUES
	('8','Alpha/Beta Blockers','8');
REPLACE INTO "tbl_subcategory" ("subcategory_id", "subcategory_name", "category_id") VALUES
	('9','Diuretics','8');
REPLACE INTO "tbl_subcategory" ("subcategory_id", "subcategory_name", "category_id") VALUES
	('10','Vasodilators','8');
REPLACE INTO "tbl_subcategory" ("subcategory_id", "subcategory_name", "category_id") VALUES
	('11','Inotropic Drugs','8');
REPLACE INTO "tbl_subcategory" ("subcategory_id", "subcategory_name", "category_id") VALUES
	('12','Adenosine Uptake Inhibitors','9');
REPLACE INTO "tbl_subcategory" ("subcategory_id", "subcategory_name", "category_id") VALUES
	('13','Anti-thrombotic Agents','9');
REPLACE INTO "tbl_subcategory" ("subcategory_id", "subcategory_name", "category_id") VALUES
	('14','Phosphodiesterase Inhibitors','9');
REPLACE INTO "tbl_subcategory" ("subcategory_id", "subcategory_name", "category_id") VALUES
	('15','Insulin Release Inhibitor','10');
REPLACE INTO "tbl_subcategory" ("subcategory_id", "subcategory_name", "category_id") VALUES
	('16','Pancreatic Hormone','10');
REPLACE INTO "tbl_subcategory" ("subcategory_id", "subcategory_name", "category_id") VALUES
	('17','Aminopyridine Derivative','11');
REPLACE INTO "tbl_subcategory" ("subcategory_id", "subcategory_name", "category_id") VALUES
	('18','Iminostilbene','11');
REPLACE INTO "tbl_subcategory" ("subcategory_id", "subcategory_name", "category_id") VALUES
	('19','Opioid Analgesics','11');
REPLACE INTO "tbl_subcategory" ("subcategory_id", "subcategory_name", "category_id") VALUES
	('20','Aspirin ','12');
REPLACE INTO "tbl_subcategory" ("subcategory_id", "subcategory_name", "category_id") VALUES
	('21','Acetaminophen (Tylenol)','12');
REPLACE INTO "tbl_subcategory" ("subcategory_id", "subcategory_name", "category_id") VALUES
	('22','Dicamol P','12');
REPLACE INTO "tbl_subcategory" ("subcategory_id", "subcategory_name", "category_id") VALUES
	('23','Antacids','13');
REPLACE INTO "tbl_subcategory" ("subcategory_id", "subcategory_name", "category_id") VALUES
	('24','nAnti-inflammatory analgesics','14');
REPLACE INTO "tbl_subcategory" ("subcategory_id", "subcategory_name", "category_id") VALUES
	('25','Acetaminophen','14');
REPLACE INTO "tbl_subcategory" ("subcategory_id", "subcategory_name", "category_id") VALUES
	('26','Nonsteroidal anti-inflammatory drugs (NSAIDs','14');
REPLACE INTO "tbl_subcategory" ("subcategory_id", "subcategory_name", "category_id") VALUES
	('27','Naproxen (Aleve) ','15');
REPLACE INTO "tbl_subcategory" ("subcategory_id", "subcategory_name", "category_id") VALUES
	('28','Antispasmodics','13');
/*!40000 ALTER TABLE "tbl_subcategory" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_type'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_type" (
  "type_id" int(10) unsigned NOT NULL auto_increment,
  "type_name" varchar(50) default NULL,
  PRIMARY KEY  ("type_id")
) AUTO_INCREMENT=16;



#
# Dumping data for table 'tbl_type'
#

LOCK TABLES "tbl_type" WRITE;
/*!40000 ALTER TABLE "tbl_type" DISABLE KEYS;*/
REPLACE INTO "tbl_type" ("type_id", "type_name") VALUES
	('11','dermetology');
REPLACE INTO "tbl_type" ("type_id", "type_name") VALUES
	('12','orthology');
REPLACE INTO "tbl_type" ("type_id", "type_name") VALUES
	('13','omcology');
REPLACE INTO "tbl_type" ("type_id", "type_name") VALUES
	('14','Allergist');
REPLACE INTO "tbl_type" ("type_id", "type_name") VALUES
	('15','Paediatriction');
/*!40000 ALTER TABLE "tbl_type" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_user'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_user" (
  "user_id" int(10) unsigned NOT NULL auto_increment,
  "user_name" varchar(50) default NULL,
  "user_email" varchar(50) default NULL,
  "user_password" varchar(50) default NULL,
  "user_address" varchar(50) default NULL,
  "user_contact" varchar(15) default NULL,
  "user_gender" varchar(50) default NULL,
  "user_dob" date default NULL,
  "user_photo" varchar(50) default NULL,
  "place_id" tinyint(3) unsigned default NULL,
  PRIMARY KEY  ("user_id")
) AUTO_INCREMENT=4;



#
# Dumping data for table 'tbl_user'
#

LOCK TABLES "tbl_user" WRITE;
/*!40000 ALTER TABLE "tbl_user" DISABLE KEYS;*/
REPLACE INTO "tbl_user" ("user_id", "user_name", "user_email", "user_password", "user_address", "user_contact", "user_gender", "user_dob", "user_photo", "place_id") VALUES
	('1','Amala','amala@gmail.com','123','vegola p.o,pvbr','9825273356','female','2002-09-20','userPhoto1885.png',4);
REPLACE INTO "tbl_user" ("user_id", "user_name", "user_email", "user_password", "user_address", "user_contact", "user_gender", "user_dob", "user_photo", "place_id") VALUES
	('2','Adwaitha','adwathasaju2001@gmail.com','123','mupuzha,erklm','9363748678','female','2001-03-24','userPhoto1984.png',2);
REPLACE INTO "tbl_user" ("user_id", "user_name", "user_email", "user_password", "user_address", "user_contact", "user_gender", "user_dob", "user_photo", "place_id") VALUES
	('3','Anusree','anu@gmail.com','anu123','Erklm,pbvr','8768846789','female','2001-10-17','userPhoto1531.png',2);
/*!40000 ALTER TABLE "tbl_user" ENABLE KEYS;*/
UNLOCK TABLES;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE;*/
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;*/
