-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: lms_platform
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'프로그래밍','2026-03-18 14:53:00'),(2,'디자인','2026-03-18 14:53:00'),(3,'운동','2026-03-18 14:53:00'),(4,'음악','2026-03-24 01:53:02'),(5,'사진','2026-03-24 01:53:02'),(6,'요리','2026-03-24 01:53:02'),(7,'외국어','2026-03-24 01:53:02'),(8,'자기계발','2026-03-24 01:53:02'),(9,'재테크','2026-03-24 01:53:02'),(10,'공예','2026-03-24 01:53:02');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrollments`
--

DROP TABLE IF EXISTS `enrollments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enrollments` (
  `enrollment_id` int NOT NULL AUTO_INCREMENT,
  `member_id` int NOT NULL,
  `lecture_id` int NOT NULL,
  `progress_percent` int NOT NULL DEFAULT '0',
  `last_position` varchar(100) DEFAULT NULL,
  `enrolled_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`enrollment_id`),
  KEY `member_id` (`member_id`),
  KEY `lecture_id` (`lecture_id`),
  CONSTRAINT `enrollments_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`),
  CONSTRAINT `enrollments_ibfk_2` FOREIGN KEY (`lecture_id`) REFERENCES `lectures` (`lecture_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollments`
--

LOCK TABLES `enrollments` WRITE;
/*!40000 ALTER TABLE `enrollments` DISABLE KEYS */;
/*!40000 ALTER TABLE `enrollments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faqs`
--

DROP TABLE IF EXISTS `faqs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faqs` (
  `faq_id` int NOT NULL AUTO_INCREMENT,
  `question` varchar(500) NOT NULL,
  `answer` text NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`faq_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faqs`
--

LOCK TABLES `faqs` WRITE;
/*!40000 ALTER TABLE `faqs` DISABLE KEYS */;
/*!40000 ALTER TABLE `faqs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedbacks`
--

DROP TABLE IF EXISTS `feedbacks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedbacks` (
  `feedback_id` int NOT NULL AUTO_INCREMENT,
  `member_id` int NOT NULL,
  `instructor_id` int NOT NULL,
  `content` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`feedback_id`),
  KEY `member_id` (`member_id`),
  KEY `instructor_id` (`instructor_id`),
  CONSTRAINT `feedbacks_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`),
  CONSTRAINT `feedbacks_ibfk_2` FOREIGN KEY (`instructor_id`) REFERENCES `members` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedbacks`
--

LOCK TABLES `feedbacks` WRITE;
/*!40000 ALTER TABLE `feedbacks` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedbacks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inquiries`
--

DROP TABLE IF EXISTS `inquiries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inquiries` (
  `inquiry_id` int NOT NULL AUTO_INCREMENT,
  `member_id` int NOT NULL,
  `title` varchar(200) NOT NULL,
  `content` text NOT NULL,
  `answer` text,
  `is_answered` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `answered_at` datetime DEFAULT NULL,
  PRIMARY KEY (`inquiry_id`),
  KEY `member_id` (`member_id`),
  CONSTRAINT `inquiries_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inquiries`
--

LOCK TABLES `inquiries` WRITE;
/*!40000 ALTER TABLE `inquiries` DISABLE KEYS */;
/*!40000 ALTER TABLE `inquiries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor_applications`
--

DROP TABLE IF EXISTS `instructor_applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instructor_applications` (
  `application_id` int NOT NULL AUTO_INCREMENT,
  `member_id` int NOT NULL,
  `certification_file` varchar(500) DEFAULT NULL,
  `status` enum('PENDING','APPROVED','REJECTED') NOT NULL DEFAULT 'PENDING',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `processed_at` datetime DEFAULT NULL,
  PRIMARY KEY (`application_id`),
  KEY `member_id` (`member_id`),
  CONSTRAINT `instructor_applications_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor_applications`
--

LOCK TABLES `instructor_applications` WRITE;
/*!40000 ALTER TABLE `instructor_applications` DISABLE KEYS */;
/*!40000 ALTER TABLE `instructor_applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lecture_comments`
--

DROP TABLE IF EXISTS `lecture_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lecture_comments` (
  `comment_id` int NOT NULL AUTO_INCREMENT,
  `member_id` int NOT NULL,
  `lecture_id` int NOT NULL,
  `content` varchar(500) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`comment_id`),
  KEY `member_id` (`member_id`),
  KEY `lecture_id` (`lecture_id`),
  CONSTRAINT `lecture_comments_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`),
  CONSTRAINT `lecture_comments_ibfk_2` FOREIGN KEY (`lecture_id`) REFERENCES `lectures` (`lecture_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecture_comments`
--

LOCK TABLES `lecture_comments` WRITE;
/*!40000 ALTER TABLE `lecture_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `lecture_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lecture_likes`
--

DROP TABLE IF EXISTS `lecture_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lecture_likes` (
  `like_id` int NOT NULL AUTO_INCREMENT,
  `member_id` int NOT NULL,
  `lecture_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`like_id`),
  UNIQUE KEY `uk_member_lecture` (`member_id`,`lecture_id`),
  KEY `lecture_id` (`lecture_id`),
  CONSTRAINT `lecture_likes_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`),
  CONSTRAINT `lecture_likes_ibfk_2` FOREIGN KEY (`lecture_id`) REFERENCES `lectures` (`lecture_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecture_likes`
--

LOCK TABLES `lecture_likes` WRITE;
/*!40000 ALTER TABLE `lecture_likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `lecture_likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lectures`
--

DROP TABLE IF EXISTS `lectures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lectures` (
  `lecture_id` int NOT NULL AUTO_INCREMENT,
  `instructor_id` int NOT NULL,
  `category_id` int NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` text,
  `view_count` int NOT NULL DEFAULT '0',
  `like_count` int NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`lecture_id`),
  KEY `instructor_id` (`instructor_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `lectures_ibfk_1` FOREIGN KEY (`instructor_id`) REFERENCES `members` (`member_id`),
  CONSTRAINT `lectures_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lectures`
--

LOCK TABLES `lectures` WRITE;
/*!40000 ALTER TABLE `lectures` DISABLE KEYS */;
INSERT INTO `lectures` VALUES (1,3,1,'Java 기초 문법','자바의 변수, 조건문, 반복문 등 기초 문법을 학습하는 강의',1,0,0,'2026-03-18 14:54:38','2026-03-23 19:06:30'),(2,3,1,'Spring Boot 입문','Spring Boot의 기본 구조와 프로젝트 시작 방법을 다루는 강의',0,0,0,'2026-03-18 14:54:38',NULL),(3,3,2,'UI/UX 디자인 기초','디자인 원칙과 사용자 경험의 기본 개념을 배우는 강의',0,0,0,'2026-03-18 14:54:38',NULL),(4,3,3,'홈트레이닝 입문','집에서 쉽게 따라할 수 있는 운동 루틴을 소개하는 강의',0,0,0,'2026-03-18 14:54:38',NULL),(5,3,3,'기초 스트레스 수정본','유연성과 자세 교정을 위한 강의',0,0,1,'2026-03-18 14:54:38','2026-03-23 22:34:42'),(6,3,1,'// 임시 테스트','    testLectureCrud();',0,0,0,'2026-03-23 22:33:22',NULL),(7,3,1,'JDBC 테스트 강의','JDBC 등록 테스트 강의입니다.',0,0,0,'2026-03-23 22:34:05',NULL),(31,3,1,'Java 컬렉션 심화','List, Set, Map을 깊이 있게 배우는 강의',15,3,0,'2026-03-24 01:50:54',NULL),(32,3,1,'Spring Security 입문','인증과 인가를 다루는 Spring Security 기초',22,5,0,'2026-03-24 01:50:54',NULL),(33,3,1,'REST API 실습','실제 프로젝트로 배우는 REST API 설계',30,8,0,'2026-03-24 01:50:54',NULL),(34,3,2,'포토샵 기초','이미지 편집과 기본 툴 사용법',9,2,0,'2026-03-24 01:50:54',NULL),(35,3,2,'피그마 UI 설계','UI/UX 설계 실습 강의',13,4,0,'2026-03-24 01:50:54',NULL),(36,3,2,'색상 이론 기초','디자인 색상 조합과 이론',7,1,0,'2026-03-24 01:50:54',NULL),(37,3,3,'코어 운동 루틴','복부 중심 운동 프로그램',18,4,0,'2026-03-24 01:50:54',NULL),(38,3,3,'하체 강화 트레이닝','하체 근력 강화 집중 강의',21,6,0,'2026-03-24 01:50:54',NULL),(39,3,3,'유산소 운동 기초','체지방 감량을 위한 운동',16,3,0,'2026-03-24 01:50:54',NULL),(40,3,1,'JDBC 심화','DB 연결과 트랜잭션 처리',11,2,0,'2026-03-24 01:50:54',NULL),(41,3,2,'UX 분석 기초','사용자 행동 분석 방법',14,3,0,'2026-03-24 01:50:54',NULL),(42,3,3,'스트레칭 심화','유연성 향상 프로그램',12,2,0,'2026-03-24 01:50:54',NULL);
/*!40000 ALTER TABLE `lectures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_attempts`
--

DROP TABLE IF EXISTS `login_attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login_attempts` (
  `attempt_id` int NOT NULL AUTO_INCREMENT,
  `login_id` varchar(20) NOT NULL,
  `attempt_count` int NOT NULL DEFAULT '0',
  `locked_until` datetime DEFAULT NULL,
  `last_attempt_at` datetime DEFAULT NULL,
  PRIMARY KEY (`attempt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_attempts`
--

LOCK TABLES `login_attempts` WRITE;
/*!40000 ALTER TABLE `login_attempts` DISABLE KEYS */;
INSERT INTO `login_attempts` VALUES (1,'user01',0,NULL,'2026-03-23 15:33:14'),(2,'user99',1,NULL,'2026-03-19 15:02:06'),(3,'user02',0,NULL,'2026-03-19 15:03:20'),(4,'2',1,NULL,'2026-03-23 10:03:06'),(5,'admin01',0,NULL,'2026-03-23 17:56:28'),(6,'inst01',0,NULL,'2026-03-23 19:06:15');
/*!40000 ALTER TABLE `login_attempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members` (
  `member_id` int NOT NULL AUTO_INCREMENT,
  `login_id` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nickname` varchar(30) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `role` enum('USER','PREMIUM','INSTRUCTOR','ADMIN') NOT NULL DEFAULT 'USER',
  `status` enum('ACTIVE','INACTIVE','BANNED') NOT NULL DEFAULT 'ACTIVE',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`member_id`),
  UNIQUE KEY `login_id` (`login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,'user01','r1234567*','유저1','홍길동','user01@test.com','010-1111-1111','USER','ACTIVE','2026-03-18 14:51:22','2026-03-23 13:15:35'),(2,'user02','1234','유저2','김철수','user02@test.com','010-2222-2222','USER','ACTIVE','2026-03-18 14:51:22',NULL),(3,'inst01','1234','강사1','이영희','inst01@test.com','010-3333-3333','INSTRUCTOR','ACTIVE','2026-03-18 14:51:22',NULL),(4,'admin01','1234','관리자','관리자','admin01@test.com','010-9999-9999','ADMIN','ACTIVE','2026-03-18 14:51:22',NULL),(22,'user09','1234','유저3','사용자3','user03@test.com','010-1111-0003','USER','ACTIVE','2026-03-24 01:44:44',NULL),(23,'user10','1234','유저4','사용자4','user04@test.com','010-1111-0004','USER','ACTIVE','2026-03-24 01:44:44',NULL),(24,'user11','1234','유저5','사용자5','user05@test.com','010-1111-0005','USER','ACTIVE','2026-03-24 01:44:44',NULL),(25,'inst09','1234','강사1','강사사용자1','inst01@test.com','010-2222-0001','INSTRUCTOR','ACTIVE','2026-03-24 01:44:44',NULL),(26,'inst10','1234','강사2','강사사용자2','inst02@test.com','010-2222-0002','INSTRUCTOR','ACTIVE','2026-03-24 01:44:44',NULL),(27,'inst11','1234','강사3','강사사용자3','inst03@test.com','010-2222-0003','INSTRUCTOR','ACTIVE','2026-03-24 01:44:44',NULL),(28,'admin09','1234','관리자2','관리자사용자2','admin02@test.com','010-3333-0002','ADMIN','ACTIVE','2026-03-24 01:44:44',NULL),(29,'premium09','1234','프리미엄1','프리미엄사용자1','premium01@test.com','010-4444-0001','PREMIUM','ACTIVE','2026-03-24 01:44:44',NULL);
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `message_id` int NOT NULL AUTO_INCREMENT,
  `sender_id` int NOT NULL,
  `receiver_id` int NOT NULL,
  `content` text NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`message_id`),
  KEY `sender_id` (`sender_id`),
  KEY `receiver_id` (`receiver_id`),
  CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `members` (`member_id`),
  CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`receiver_id`) REFERENCES `members` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notices`
--

DROP TABLE IF EXISTS `notices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notices` (
  `notice_id` int NOT NULL AUTO_INCREMENT,
  `author_id` int DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `view_count` int NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notices`
--

LOCK TABLES `notices` WRITE;
/*!40000 ALTER TABLE `notices` DISABLE KEYS */;
/*!40000 ALTER TABLE `notices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscriptions` (
  `subscription_id` int NOT NULL AUTO_INCREMENT,
  `member_id` int NOT NULL,
  `instructor_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`subscription_id`),
  UNIQUE KEY `uk_member_instructor` (`member_id`,`instructor_id`),
  KEY `instructor_id` (`instructor_id`),
  CONSTRAINT `subscriptions_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`),
  CONSTRAINT `subscriptions_ibfk_2` FOREIGN KEY (`instructor_id`) REFERENCES `members` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptions`
--

LOCK TABLES `subscriptions` WRITE;
/*!40000 ALTER TABLE `subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlists`
--

DROP TABLE IF EXISTS `wishlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlists` (
  `wishlist_id` int NOT NULL AUTO_INCREMENT,
  `member_id` int NOT NULL,
  `lecture_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`wishlist_id`),
  UNIQUE KEY `uk_member_lecture` (`member_id`,`lecture_id`),
  KEY `lecture_id` (`lecture_id`),
  CONSTRAINT `wishlists_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`),
  CONSTRAINT `wishlists_ibfk_2` FOREIGN KEY (`lecture_id`) REFERENCES `lectures` (`lecture_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlists`
--

LOCK TABLES `wishlists` WRITE;
/*!40000 ALTER TABLE `wishlists` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishlists` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-24  9:54:27
