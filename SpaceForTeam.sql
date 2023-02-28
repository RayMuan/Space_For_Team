-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: db.itwillbs.dev    Database: class1_221020_team4
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `bk_num` int NOT NULL AUTO_INCREMENT,
  `s_num` int DEFAULT NULL,
  `user_num` int DEFAULT NULL,
  `bk_usercount` int DEFAULT NULL,
  `bk_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `bk_price` int DEFAULT NULL,
  `bk_usedate` varchar(30) DEFAULT NULL,
  `bk_starttime` int DEFAULT NULL,
  `bk_endtime` int DEFAULT NULL,
  `bk_usetime` int DEFAULT NULL,
  `payment` varchar(50) DEFAULT NULL,
  `pay_num` int DEFAULT NULL,
  PRIMARY KEY (`bk_num`),
  KEY `booking_ibfk_1` (`user_num`),
  KEY `booking_ibfk_2` (`s_num`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (90,65,53,15,'2023-02-27 10:37:38',40000,'2023-03-11',22,24,2,'결제완료',9),(91,6,60,25,'2023-02-27 11:58:57',140000,'2023-03-04',10,12,2,'결제완료',5),(92,2,60,12,'2023-02-27 12:02:34',245000,'2023-03-05',8,15,7,'결제전',NULL),(93,3,61,5,'2023-02-27 12:03:33',56000,'2023-02-28',17,19,2,'결제전',NULL),(94,2,61,8,'2023-02-27 12:04:02',210000,'2023-03-09',5,11,6,'결제완료',6),(97,7,2,4,'2023-02-27 12:51:05',105000,'2023-02-28',8,11,3,'결제전',NULL),(102,1,5,2,'2023-02-27 17:04:10',80000,'2023-02-28',13,15,2,'결제전',NULL),(104,10,1,7,'2023-02-27 18:48:51',120000,'2023-03-08',10,18,8,'결제전',NULL),(105,10,1,4,'2023-02-27 18:50:25',30000,'2023-03-05',4,6,2,'결제완료',11),(106,6,1,1,'2023-02-27 18:51:13',280000,'2023-03-01',8,12,4,'결제전',NULL),(107,3,1,4,'2023-02-27 18:53:19',28000,'2023-02-28',1,2,1,'결제완료',13),(108,6,1,4,'2023-02-27 18:58:14',70000,'2023-03-12',4,5,1,'결제완료',32),(109,6,1,3,'2023-02-27 19:02:25',70000,'2023-02-28',2,3,1,'결제완료',26),(110,13,20,100,'2023-02-27 20:06:13',0,'2023-02-28',1,1,0,'결제완료',31),(111,11,20,122,'2023-02-27 20:12:51',0,'2023-02-27',1,1,0,'결제완료',NULL),(113,12,1,20,'2023-02-27 20:14:09',150000,'2023-03-05',8,9,1,'결제완료',33),(114,12,20,1,'2023-02-27 20:16:28',750000,'2023-02-28',14,19,5,'결제완료',34),(115,4,6,3,'2023-02-27 20:19:14',70000,'2023-02-27',6,8,2,'결제전',NULL),(116,3,20,99,'2023-02-27 20:21:04',84000,'2023-02-28',12,15,3,'결제완료',35),(117,10,1,2,'2023-02-27 23:35:15',30000,'2023-03-08',11,13,2,'결제전',NULL),(118,20,21,4,'2023-02-28 09:08:14',60000,'2023-03-06',4,6,2,'결제완료',36),(119,19,1,2,'2023-02-28 09:39:36',30000,'2023-03-10',4,6,2,'결제전',NULL),(122,20,1,2,'2023-02-28 11:42:56',90000,'2023-03-01',2,5,3,'결제완료',38);
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `host`
--

DROP TABLE IF EXISTS `host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `host` (
  `h_num` int NOT NULL,
  `h_email` varchar(50) NOT NULL,
  `h_id` varchar(50) NOT NULL,
  `h_name` varchar(30) NOT NULL,
  `h_pass` varchar(30) NOT NULL,
  `h_phone` varchar(50) NOT NULL,
  `h_birth` varchar(20) NOT NULL,
  PRIMARY KEY (`h_num`),
  UNIQUE KEY `h_email` (`h_email`),
  UNIQUE KEY `h_id` (`h_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `host`
--

LOCK TABLES `host` WRITE;
/*!40000 ALTER TABLE `host` DISABLE KEYS */;
INSERT INTO `host` VALUES (1,'admin@naver.com','admin','관리자','admin12!','01011111111','19920518'),(2,'hostkim@naver.com','hostkim','김길동','hostkim12!','01022222222','19950612'),(3,'hosthong@naver.com','hosthong','홍길동','hosthong12!','01033333333','19940812'),(4,'hostlee@naver.com','hostlee','이길동','hostlee12!','01044445555','19970805'),(5,'hostpark@naver.com','hostpark','박길동','hostpark12!','01045455656','20000227'),(6,'hostsu@naver.com','hostsu','수길동','hostsu12!','01078787878','19990622'),(7,'hostmin@naver.com','hostmin','민길동','hostmin12!','01098765432','19930530'),(8,'hostjung@google.com','hostjung','정길동','hostjung12!','01056567878','19940505'),(9,'hostkwon@hanmail.net','hostkwon','권길동','hostkwon12!','01087876565','19960321'),(10,'hostjeon@google.com','hostjeon','전길동','hostjeon12!','01046465656','19920805'),(11,'hostseok@naver.com','hostseok','석길동','hostseok12!','01078945612','19980217'),(12,'hostmoon@naver.com','hostmoon','문길동','hostmoon12!','01023451234','19940825'),(13,'hostbaek@naver.com','hostbaek','백길동','hostbaek12!','01056891214','19970913'),(14,'hostjo@naver.com','hostjo','조길동','hostjo12!','01058584747','19990112'),(15,'host@naver.com','host','호스트','host12!','01050505050','19840512'),(16,'hostlong@naver.com','hostlong','롱길동','hostlong12!','01045784578','19940520'),(17,'hostbang@naver.com','hostbang','방길동','hostbang12!','01011112222','19950518');
/*!40000 ALTER TABLE `host` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mypage`
--

DROP TABLE IF EXISTS `mypage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mypage` (
  `user_num` int NOT NULL,
  `re_num` int DEFAULT NULL,
  `bk_num` int DEFAULT NULL,
  `q_num` int DEFAULT NULL,
  PRIMARY KEY (`user_num`),
  KEY `mypage_ibfk_2` (`re_num`),
  KEY `mypage_ibfk_3` (`bk_num`),
  KEY `mypage_ibfk_4` (`q_num`),
  CONSTRAINT `mypage_ibfk_1` FOREIGN KEY (`user_num`) REFERENCES `user` (`user_num`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `mypage_ibfk_2` FOREIGN KEY (`re_num`) REFERENCES `review` (`re_num`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `mypage_ibfk_3` FOREIGN KEY (`bk_num`) REFERENCES `booking` (`bk_num`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `mypage_ibfk_4` FOREIGN KEY (`q_num`) REFERENCES `qna` (`q_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mypage`
--

LOCK TABLES `mypage` WRITE;
/*!40000 ALTER TABLE `mypage` DISABLE KEYS */;
/*!40000 ALTER TABLE `mypage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notice` (
  `no_num` int NOT NULL,
  `no_subject` varchar(30) NOT NULL,
  `no_content` varchar(1000) NOT NULL,
  `no_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`no_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
INSERT INTO `notice` VALUES (28,'계정만들기!','SpaceForTeam 계정은 무료로 간편하게 만들 수 있습니다.','2023-02-27 03:45:38');
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `pay_num` int NOT NULL,
  `bk_num` int DEFAULT NULL,
  `payment` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`pay_num`),
  KEY `bk_num` (`bk_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,1,'Naver pay'),(2,2,'Card'),(3,3,'Naver pay'),(4,4,'Card'),(5,5,'Moblie'),(6,6,'Naver pay'),(7,7,'Card'),(8,8,'Moblie'),(9,9,'Moblie'),(10,10,'Moblie'),(11,11,'Card'),(12,12,'Moblie'),(13,13,'Card'),(14,14,'Moblie'),(15,15,'Card'),(16,16,'Moblie'),(17,17,'Card'),(18,18,'Naver pay'),(19,19,'Card'),(20,20,'Card');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qna`
--

DROP TABLE IF EXISTS `qna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qna` (
  `q_num` int NOT NULL AUTO_INCREMENT,
  `user_num` int DEFAULT NULL,
  `q_content` varchar(700) DEFAULT NULL,
  `q_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `q_recontent` varchar(700) DEFAULT NULL,
  `s_num` int DEFAULT NULL,
  PRIMARY KEY (`q_num`),
  KEY `qna_ibfk_3_idx` (`s_num`),
  KEY `qna_ibfk_1` (`user_num`),
  CONSTRAINT `qna_ibfk_1` FOREIGN KEY (`user_num`) REFERENCES `user` (`user_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qna`
--

LOCK TABLES `qna` WRITE;
/*!40000 ALTER TABLE `qna` DISABLE KEYS */;
INSERT INTO `qna` VALUES (1,5,'궁금','2023-02-27 16:04:24',NULL,9),(2,5,'달리긴함','2023-02-27 16:08:43',NULL,8),(3,4,'왜 다들 이름이 길동인가요','2023-02-27 16:41:41',NULL,1),(4,5,'질문','2023-02-27 17:03:55',NULL,1),(5,1,'인포테스트 qna?','2023-02-28 00:46:29',NULL,21),(6,21,'네모난 책상은 없나요?','2023-02-28 09:03:31',NULL,20),(7,1,'우와미는 무슨 뜻이죠?','2023-02-28 10:01:06',NULL,19);
/*!40000 ALTER TABLE `qna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `re_num` int NOT NULL AUTO_INCREMENT,
  `user_num` int DEFAULT NULL,
  `re_content` varchar(400) DEFAULT NULL,
  `re_date` datetime NOT NULL,
  `re_point` int NOT NULL,
  `s_num` int NOT NULL,
  `re_reply` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`re_num`),
  KEY `user_num` (`user_num`),
  KEY `s_num` (`s_num`),
  CONSTRAINT `review_chk_1` CHECK ((`re_point` <= 5))
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,51,'좋았어요','2023-02-25 00:00:00',5,51,'감사합니다.'),(2,51,'좀 되나요','2023-02-26 05:28:44',5,51,NULL),(4,51,'주인님 답글 없는데 왜 떠요 진짜 고소하고 싶다','2023-02-26 05:33:35',5,51,NULL),(6,51,'으흠 잘 되는 듯?','2023-02-26 06:53:56',1,51,NULL),(7,51,'7','2023-02-26 08:50:59',5,51,NULL),(8,51,'8','2023-02-26 08:50:59',5,51,NULL),(9,51,'9','2023-02-26 08:51:50',5,51,NULL),(10,51,'10','2023-02-26 08:51:58',5,51,NULL),(11,51,'11','2023-02-26 08:52:01',5,51,NULL),(12,51,'12','2023-02-26 08:53:10',5,51,NULL),(13,51,'13','2023-02-26 08:53:25',5,51,NULL),(14,51,'됐나? 아임 게스트','2023-02-26 09:34:15',5,51,NULL),(15,51,'안녕','2023-02-26 13:50:47',5,51,NULL),(16,51,'나 kim아닌데','2023-02-26 13:51:03',5,51,NULL),(17,51,'댓글테러를 해보았습니다.','2023-02-26 14:10:54',1,51,NULL),(19,51,'무려 노트북이 공짜 ','2023-02-26 23:40:22',5,68,NULL),(20,51,'파란 하늘 파란 하늘 꿈이 드리운 푸른 언덕에 아기 염소 여럿이 풀을 뜯고 놀아요 해처럼 밝은 얼굴로','2023-02-27 00:03:59',3,68,NULL),(21,1,'바다 보면서 공부하기 좋아요','2023-02-27 12:03:03',5,6,NULL),(22,1,'','2023-02-27 12:19:10',1,8,NULL),(23,2,'','2023-02-27 12:49:58',1,9,NULL),(24,5,'리뷰달기 ','2023-02-27 17:03:47',5,1,NULL),(25,1,'eeeeeeee','2023-02-27 17:07:35',5,6,NULL),(26,20,'리뷰','2023-02-27 17:29:55',2,1,NULL),(27,1,'','2023-02-27 19:46:17',5,5,NULL),(28,5,'무난합니다.','2023-02-27 19:47:53',4,12,NULL),(29,5,'위치가 너무 좋습니다.','2023-02-27 20:04:09',5,13,NULL),(30,20,'좋아요 ','2023-02-27 20:05:51',5,13,NULL),(31,7,'좋습니다.!','2023-02-27 20:08:42',5,10,NULL),(32,3,'노량진역보다 대방역에서 훨씬 가깝습니다.','2023-02-27 20:11:16',5,11,NULL),(33,1,'인포테스트 리뷰','2023-02-28 00:24:51',1,21,NULL),(34,1,'무난하니 좋아요.','2023-02-28 02:50:37',3,1,NULL),(35,21,'너무 좋았어요!','2023-02-28 09:03:22',5,20,NULL),(36,1,'세모세모','2023-02-28 09:54:22',4,20,NULL),(37,1,'너무좋아요 !','2023-02-28 11:21:20',5,20,NULL),(38,1,'좋아요\r\n','2023-02-28 11:41:57',5,20,NULL);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `space`
--

DROP TABLE IF EXISTS `space`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `space` (
  `s_num` int NOT NULL,
  `s_name` varchar(30) NOT NULL,
  `s_address` varchar(100) NOT NULL,
  `s_bill` varchar(20) NOT NULL,
  `s_max` varchar(20) DEFAULT NULL,
  `h_num` int NOT NULL,
  `s_sido` varchar(10) NOT NULL,
  `s_gungu` varchar(100) DEFAULT NULL,
  `s_memo` varchar(400) NOT NULL,
  `s_file` varchar(200) DEFAULT NULL,
  `s_opt` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`s_num`),
  KEY `space_ibfk_1` (`h_num`),
  CONSTRAINT `space_ibfk_1` FOREIGN KEY (`h_num`) REFERENCES `host` (`h_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `space`
--

LOCK TABLES `space` WRITE;
/*!40000 ALTER TABLE `space` DISABLE KEYS */;
INSERT INTO `space` VALUES (1,'삼성역 근처 회의실','서울특별시 강남구 삼성로95길 9(삼성동)','40000','5명',2,'서울특별시','강남구','최고의 접근성 ! 최적화된 회의 운영 서비스로 여러분과 함께합니다.\r\n찾기 쉬운 위치, 원활한 대중교통!\r\n                                        ','room7.jpg','없음 '),(2,'회의실','서울특별시 강서구 양천로 지하485(가양동)','35000','8명',2,'서울특별시','강서구','가양역 근처 회의실입니다. 젊은 감각의 인테리어를 갖추고 있으며 빔프로젝트 제공됩니다.\r\n                                        ','room21.jpg','없음 '),(3,'스터디룸','부산광역시 부산진구 서전로 1(부전동)','28000','8명',3,'부산광역시','부산진구','깔끔하고 아늑한 스터디룸입니다\r\n자세한 사항은 010-5555-6666으로 연락주세요','study1.jpg','와이파이 화장실 콘센트 에어컨 '),(4,'스터디룸&회의룸','경상남도 창원시 성산구 마디미로21번길 17(상남동)','35000','10명',4,'경상남도','창원시 성산구','원하시는 용도로 공간을 사용해보세요 !','room3.jpg','엘레베이터 화장실 빔프로젝트 노트북 '),(5,'서면역 근처 스터디룸','부산광역시 부산진구 서전로 7(부전동)','50000','10명',5,'부산광역시','부산진구','서면역 접근성 최고 !\r\n빔프로젝트와 노트북을 무료로 대여해 드립니다','study2.jpg','와이파이 빔프로젝트 노트북 '),(6,'해운대 근처 회의실','부산광역시 해운대구 해운대해변로 226(우동)','70000','20명',5,'부산광역시','해운대구','멋진 뷰를 자랑하는 해운대에 위치한 회의룸입니다\r\n주차장 있음','room8.jpg','엘레베이터 주차장 와이파이 콘센트 '),(10,'강남일등스터디','서울특별시 강남구 테헤란로16길 13(역삼동)','15000','8명',3,'서울특별시','강남구','★ 특징 ★\r\n1. 역삼역 3번출구 254m 도보 4분 / 강남역 1번출구 527m 도보 8분 - 네이버지도\r\n2. 소음無 : 15cm ALC방음블럭 = 노래방급 이상, 아랫층 없음, 위층 식당, 회의내용 보안됨\r\n3. 환기잘됨.(룸당 4개 환풍기&대형선풍기)\r\n\r\n영업시간0~24시\r\n휴무일없음\r\n                                        ','study10.jpg','없음 '),(11,'스터디룸!','서울특별시 동작구 노량진로 40(대방동)','16000','5명',2,'서울특별시','동작구','소수인원을 위한 스터디룸 겸 회의실입니다\r\n지하철역 근처예요\r\n                                        ','study61.jpg','없음 '),(12,'회의실','인천광역시 연수구 대암로 4(옥련동)','150000','30명이상',14,'인천광역시','연수구','넓고 쾌적한 회의실입니다 \r\n','room91.jpg','없음 '),(13,'회의실','서울특별시 강남구 봉은사로57길 8(삼성동, iSOD 삼성동빌딩)','80000','10명',12,'서울특별시','강남구','강남구 중심에 위치한 회의실\r\n쾌적하고 깨끗한 공간 \r\n빔프로젝트 준비되어 있습니다','room101.jpg','엘레베이터 주차장 빔프로젝트 노트북 없음 '),(14,'스터디룸&회의실','울산광역시 남구 대암로 81(야음동, 신정현대홈타운1단지아파트)','17000','5명',10,'울산광역시','남구','4명씩 수용가능한 스터디룸 겸 회의실이 여러개 있음 \r\n사물함 多,\r\n칠판, TV제공 ','study71.jpg','주차장 와이파이 화장실 콘센트 사물함 프린터 '),(15,'4인 회의실 ','대구광역시 중구 태평로 160(북성로1가)','20000','4명',14,'대구광역시','중구','- 무료 wifi\r\n- 프린트, 스캔, 팩스 등 사무용품과 사무기기가 준비된 OA존\r\n- 최신 화상장비를 갖춘 회의실 *82인치TV, 대형 빔프로젝트, 전자칠판, \r\n  유무선마이크, 로지텍 등\r\n                                        ','15.jpg','없음 '),(16,'토즈 서면점','부산광역시 부산진구 신천대로62번길 59(부전동)','16000','5명',14,'부산광역시','부산진구','도심 속 최고의 세미나 공간\r\n*10~13인 이용가능\r\n*프로젝터(유료), 노트북(유료) 이용가능\r\n*무료WIFI 이용가능\r\n*단독공간\r\n                                        ','16.jpg','없음 '),(17,'오션뷰 제주 스터디 카페','제주특별자치도 제주시 한림읍 협재1길 8','25000','10명',14,'제주특별자치도','제주시','독서강연회 ,각종강의 또는 소규모 세미나\r\n초청 강연회 등\r\n그림 그리기 활동에 적합합니다.\r\n                                        ','17.jpg','없음 '),(18,'1인 독립형','서울특별시 서초구 남부순환로 2606(양재동)','10000','1명',14,'서울특별시','서초구','1인 독립형\r\n\r\n* 음료제공\r\n* 견적서, 세금계산서 발급\r\n* 다중보안시스템\r\n* 간식판매\r\n* 전문매니저 상주\r\n* 유선 인터넷, 무선 Wi-Fi 제공\r\n* 공용 프린터, 팩스, 스캐너 (유료)\r\n* 노트북 대여 (유료)\r\n* 기계식 주차 가능 (유료)\r\n                                        ','18.jpg','없음 '),(19,'우와미 플레이스 강남역','서울특별시 서초구 강남대로65길 12(서초동)','15000','6명',14,'서울특별시','서초구','강남역10번출구 도보 4분 / 신논현역  도보6분  \r\n\r\n강의를 할 수 있는 전자칠판 과 여러사람들과 회의할수있는 5인 롱테이블,  촬영을 위한 조명,무선마이크,각종장비들이 있으며 쉴 수 있는 쇼파 로 이루어 져 있습니다. \r\n\r\n책상은 총 6명이  앉을 수 있는 롱테이블 이며, \r\n\r\n전자칠판은 삼성플립 55인치 제품 입니다.(\r\n                                        ','19.jpg','없음 '),(20,'세모세모 스터디','부산광역시 부산진구 신천대로62번길 59(부전동)','30000','6명',14,'부산광역시','부산진구','도심 속 최고의 세미나 공간\r\n*4~6인 이용가능\r\n*노트북(유료)이용가능\r\n*무료WIFI 이용가능\r\n*단독공간\r\n                                        ','20.jpg','엘레베이터 에어컨 '),(22,'강의실','서울특별시 동작구 노량진로 40(대방동)','50000','10명',14,'서울특별시','동작구','ㅇㅇ','study53.jpg','엘레베이터 에어컨 없음 ');
/*!40000 ALTER TABLE `space` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_num` int NOT NULL AUTO_INCREMENT,
  `user_email` varchar(30) NOT NULL,
  `user_id` varchar(30) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `user_pass` varchar(20) NOT NULL,
  `user_phone` varchar(20) NOT NULL,
  `user_birth` varchar(20) NOT NULL,
  PRIMARY KEY (`user_num`),
  UNIQUE KEY `user_email` (`user_email`),
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `user_phone` (`user_phone`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'lee01@naver.com','lee01','이앙뇽','lee1234!','01010101010','19930225'),(2,'lee02@naver.com','lee02','이녕안','lee1234!','1011111111','19970707'),(3,'lee03@naver.com','lee03','이수지','lee1234!','1022222222','19960606'),(4,'lee04@naver.com','lee04','이철수','lee1234!','1033333333','19930714'),(5,'lee05@naver.com','lee05','이순자','lee1234!','1044444433','19920926'),(6,'lee06@naver.com','lee06','이민지','lee1234!','1055555555','20030509'),(7,'lee07@naver.com','lee07','이지은','lee1234!','1066666666','19910604'),(8,'lee08@naver.com','lee08','이안녕','lee1234!','1077777777','20050903'),(10,'kim10@naver.com','kim10','김안녕','kim1234!','1010101010','19941010'),(11,'kim11@naver.com','kim11','김안녕','kim1234!','1011101110','19980717'),(12,'kim12@naver.com','lee12','이녕안','lee1234!','1012121212','19941112'),(13,'kim13@naver.com','lee13','이수지','lee1234!','1013131313','19991213'),(14,'kim14@naver.com','lee14','이철수','lee1234!','1014141414','19980614'),(15,'kim15@naver.com','lee15','이순자','lee1234!','1015151515','20010607'),(16,'kim16@naver.com','lee16','이민지','lee1234!','1016161616','19901119'),(17,'kim17@naver.com','lee17','이지은','lee1234!','1017171717','19880209'),(18,'kim18@naver.com','lee18','이안녕','lee1234!','1018181818','19890303'),(19,'kim19@naver.com','lee19','이안녕','lee1234!','1019191919','20060409'),(20,'digetlyn@naver.com','digetlyn','군만두','test1234!!','01020002801','19850816'),(21,'lee20@naver.com','lee20','리길동','lee1234!','01098764578','19940505'),(22,'it@naver.com','ititit','몰라도돼','8qlalfqjsgh*','01012345678','910523'),(23,'123@naver.com','12345','이이이','qwer1234!!','123456789','12345');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-28 12:20:57
