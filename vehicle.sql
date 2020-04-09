-- MySQL dump 10.13  Distrib 5.7.29, for Linux (x86_64)

--

-- Host: 18.206.162.241    Database: vehicle

-- ------------------------------------------------------

-- Server version       5.7.29-0ubuntu0.18.04.1



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

-- Table structure for table `rest_emp`

--



DROP TABLE IF EXISTS `rest_emp`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!40101 SET character_set_client = utf8 */;

CREATE TABLE `rest_emp` (

  `id` int(11) NOT NULL AUTO_INCREMENT,

  `traveler` varchar(255) NOT NULL,

  `vehiclenum` varchar(255) NOT NULL,

  `phone` varchar(16) DEFAULT NULL,

  `from` varchar(16) DEFAULT NULL,

  `to` varchar(16) DEFAULT NULL,

  `comments` varchar(16) DEFAULT NULL,

  PRIMARY KEY (`id`)

) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET character_set_client = @saved_cs_client */;



--

-- Dumping data for table `rest_emp`

--



LOCK TABLES `rest_emp` WRITE;

/*!40000 ALTER TABLE `rest_emp` DISABLE KEYS */;

/*!40000 ALTER TABLE `rest_emp` ENABLE KEYS */;

UNLOCK TABLES;



--

-- Table structure for table `rest_veh`

--



DROP TABLE IF EXISTS `rest_veh`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!40101 SET character_set_client = utf8 */;

CREATE TABLE `rest_veh` (

  `id` int(11) NOT NULL AUTO_INCREMENT,

  `traveler` varchar(255) NOT NULL,

  `vehiclenum` varchar(255) NOT NULL,

  `phone` varchar(16) DEFAULT NULL,

  `startpoint` varchar(16) DEFAULT NULL,

  `endpoint` varchar(16) DEFAULT NULL,

  `comments` varchar(16) DEFAULT NULL,

  PRIMARY KEY (`id`)

) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=latin1;

/*!40101 SET character_set_client = @saved_cs_client */;



--

-- Dumping data for table `rest_veh`

--



LOCK TABLES `rest_veh` WRITE;

/*!40000 ALTER TABLE `rest_veh` DISABLE KEYS */;

INSERT INTO `rest_veh` VALUES (1,'tintu','KL-46-J-3967','9895058906','Kottayam','Thrissur',NULL),(2,'fiona','KL-6-J-3937','9895058905','pala','kochi',NULL),(6,'peter','KL-56-J878','6666666','hhhhhhhhh','dddddddd','rrrrrr'),(7,'uno','KL-56-J878','6666777666','hhhgghhhhhh','dsdddddddd','rrfsrrrr'),(8,'kochi','kl-','000000000','kiran','967056038','uuijj'),(9,'unoggg','KL-06-J878','6666777666','hhhgghhhhhh','dsdddddddd','rrfsrrrr'),(10,'kochi','kl-','000000000','kiran','967056038','uuijj'),(11,'ssnoggg','KL-08-J878','6666777866','hhhgghhhhhh','dsdddddddd','rrfsrrrr'),(12,'kochi','kl-','000000000','kiran','967056038','uuijj'),(13,'kochi','kl-','000000000','kiran','967056038','uuijj'),(14,'wwnoggg','Kk-08-J878','6666777866','hhhgghhhhhh','dsdddddddd','rrfsrrrr'),(15,'kochi','kl-','000000000','kiran','967056038','uuijj'),(16,'uuoiknoggg','Kk-08-J878','6666777866','hhhgghhhhhh','dsdddddddd','rrfsrrrr'),(17,'lnoggg','Kk-08-J878','6666777866','hhhgghhhhhh','dsdddddddd','rrfsrrrr'),(18,'lnoggg','Kk-08-J878','56777866','hhhgghhhhhh','dsdddddddd','rrfsrrrr'),(20,'kochi','kl-','000000000','kiran','967056038','uuijj'),(21,'kochi','kl-','000000000','kiran','967056038','uuijj'),(22,'kochi','kl-','000000000','kiran','967056038','uuijj'),(23,'kochi','kl-','000000000','kiran','967056038','uuijj'),(24,'anu','KL-56-J988','6667656','ujjhh','dddddddd','rrrrrr'),(25,'kochi','kl-','000000000','kiran','967056038','uuijj'),(26,'kochi','kl-','000000000','kiran','967056038','uuijj'),(27,'kochi','kl-','55454646','kiran','967056038','uuijj'),(28,'kochi','777777','55454646','kiran','967056038','uuijj'),(29,'anupama','KL-56-J988','666765786','ujjhh','dddddddd','rrrrrr'),(30,'kochi','777777','55454646','kiran','967056038','uuijj'),(31,'kochi','777777','55454646','kiran','967056038','uuijj'),(32,'bar1','bar2','bar1','bar2','bar1','bar2'),(33,'bar1','bar2','bar1','bar2','bar1','bar2'),(34,'kochi','kiran@gmail.com','000000000','kiran','967056038','967056038'),(35,'kochi','kiran@gmail.com','5','kiran','967056038','967056038'),(36,'kochi','kiran@gmail.com','5','kiran','967056038','967056038'),(37,'kochi','kiran@gmail.com','5','kiran','967056038','cscscs'),(38,'bar1','bar2','bar1','bar2','bar1','bar2'),(39,'kochi','kiran@gmail.com','5','kiran','967056038','cscscs'),(40,'bar1','bar2','bar1','bar2','bar1','bar2'),(41,'bar1','bar2','bar1','bar2','bar1','bar2'),(42,'kochi','kiran@gmail.com','5','kiran','967056038','cscscs'),(43,'bar1','bar2','bar1','bar2','bar1','bar2'),(44,'bar1','bar2','bar1','bar2','bar1','bar2'),(45,'bar1','bar2','bar1','bar2','bar1','bar2'),(46,'bar1','bar2','bar1','bar2','bar1','bar2'),(47,'bar1','bar2','bar1','bar2','bar1','bar2'),(48,'kochi','kiran@gmail.com','5','kiran','967056038','cscscs'),(49,'nichoos','kl07cs024','123456789','aaaaaaaaa','zzzzzzzzzz','rrrrrrrrrrr'),(50,'fiona','kl07cs024','123456789','aaaaaaaaa','yyyyyyyyyyy','bbbbbbbbbbbb'),(52,'raju','KL-55-H-6578','9876098769','japan','kochi','test'),(53,'raju','KL55k8989','9876098769','japan','kochi','test'),(54,'fdgg','7777777','3434545','dfsg','gfdgfsdg','df'),(55,'szsf','777754','1234568888','sdadsd','sfsf','dsf'),(56,'dgsdg','sfe','345','fsdf','sfsdf','sdasf'),(57,'dgfg','dasff','34252','dsdf','ewr','rere');

/*!40000 ALTER TABLE `rest_veh` ENABLE KEYS */;

UNLOCK TABLES;



--

-- Table structure for table `user`

--



DROP TABLE IF EXISTS `user`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!40101 SET character_set_client = utf8 */;

CREATE TABLE `user` (

  `id` int(11) NOT NULL AUTO_INCREMENT,

  `username` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,

  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,

  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,

  `designation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,

  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,

  `district` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'Unknown district',

  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,

  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'Not aproved',

  PRIMARY KEY (`id`)

) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*!40101 SET character_set_client = @saved_cs_client */;



--

-- Dumping data for table `user`

--



LOCK TABLES `user` WRITE;

/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` VALUES (8,'jnichu','pbkdf2:sha256:150000$bry5EvhE$45e9e422971efa60850738366b61d2e0785debaa242c94a5ba3040169fc704b7','sadish','engineer','kochi','EKM','9898989893','Not aproved'),(10,'jjjnichu','pbkdf2:sha256:150000$5Vh0zRJB$f5a200b191665a72e7a4b1c0e77c6f632679cc21c181501af2fdbd7af8ac0cba','sadish2','engineer2','kochi2','EKM2','9898989892','Not aproved'),(11,'jjjjnichu','pbkdf2:sha256:150000$wlUraV18$d50423dfb48eb209190af87d1f76243876d900cebc319d5b9c994badabd102da','sadish2','engineer2','kochi2','EKM2','9898989891','Not aproved'),(15,'kochi','pbkdf2:sha256:150000$LCpugIFH$1ad9b579720a8b3442a8ae64583798e8950379e34607ca5016f97e6b4c670be2','5','kiran','967056038','cscscs','9809071773','Not aproved'),(17,'reret','pbkdf2:sha256:150000$KaX5BG5q$a0cf4e9f4291e6c7d1dca4dcf731c96b3e163747cd782b039a13ad2e2b3d54e3','fxfdgdg','dsfdfg','fdfdf','Kollam','34354','Not aproved'),(23,'gfgf','pbkdf2:sha256:150000$hPUEMG6D$62fd44b58bb5baaef1143e4a02d9d327ab2086b16c040597749ddf451ff4efb1','SASDSF','fdcg','GFGF','KO','5454111111','Not aproved'),(24,'xzxz','pbkdf2:sha256:150000$BMFGMGAK$a2144907f27e33a41b28205da9755d6335ebc81fd6daf348ced3f84614224637','qqqq','cxc','ernakulam','cxcx','2323233333','Not aproved'),(25,'ghh','pbkdf2:sha256:150000$w1MscqnB$42cf7e43c8b87c1c43878f42a8c2d7796f4fa5a58b8747b55955689858eb768c','vvv','fh','gvh','Kottayam','2855622222','Not aproved'),(28,'fgdgd','pbkdf2:sha256:150000$f0uUhhEE$22acd915e9572d66e494961af5d5287619ab3c61bde479111e67bee7ed445c8e','sss','sdsf','xsds','Kannur','1111111111','Not aproved'),(30,'adminr','pbkdf2:sha256:150000$1o6mFUt1$f9663393d17fa7f1022099d5f6985d45b5a17d1ddb9cfc34b0c7436ce61e87d1','bosss','engineer','pala','kottayam','123456777','Not aproved'),(31,'adminrr','pbkdf2:sha256:150000$a99EwJTZ$9f60b4e855c4fe60a0e14c97706ab7d97639ce446a403f7b8a1d45dfd3433c74','bosss','engineer','pala','kottayam','12345677','Not aproved'),(32,'zaz','pbkdf2:sha256:150000$UuExlb8y$6b7574ecbd195a3081c1eabb6dca63ea9bd7e51c93522fc7b7e9a154b0b1b743','ZXX','xa','axaa','Ernakulam','1111111121','Not aproved'),(33,'saAD','pbkdf2:sha256:150000$CGi5YWwI$5a4de58ca2504c239a891a5b6ba8f4efaa9e7c4445bcd81851bc4aa59d442520','ff','sdd','xzxa','Ernakulam','1212344234','Not aproved'),(34,'aD','pbkdf2:sha256:150000$ZD42M7yC$853f73b7d1a2485cdbfd14bccdc1a652fc9423cd92b263493741635658543010','111','SA','SASAD','Thiruvananthapuram','2222222222','Not aproved'),(35,'dqd','pbkdf2:sha256:150000$cQ1cgLVq$cc7843e1df1c8329ba85669d8462f428dab70f85ce61f548030c0d62c427910f','sas','efef','sadd','Ernakulam','1234567890','Not aproved'),(36,'sadad','pbkdf2:sha256:150000$vkJMS4oh$12cb605c14811ffc72390aa3410e6ca2cec15eb269aee4ee2bf283e085f224d6','sas','adasd','dsfsf','Ernakulam','1113345678','Not aproved'),(37,'sasa','pbkdf2:sha256:150000$TuMwiVGy$7387985c41de2cb24f645a1565926c2ffca1753c1802cc3ed513a0ecce2a2a75','sas','sdsd','dsfsf','Ernakulam','1212121212','Not aproved'),(38,'fgfg','pbkdf2:sha256:150000$xfprW9oY$21c600a120f7e164606c503aff8780ff99846b90479e5f0f413926f4cd1f73be','sas','dfgf','xsdsd','Ernakulam','2323211111','Not aproved'),(39,'dsdsd','pbkdf2:sha256:150000$HwFm1zp0$264ff0516cae40c46c9efa7a624250bad04fde5ace8b81b64ae57aee6dc56e6d','sas','sff','kochi','Ernakulam','1234567800','Not aproved'),(40,'ko333chi','pbkdf2:sha256:150000$bCpstl63$0600aa515c5135a700c2f53279b95bc0fdcd1d80818c43de27d7be78c969a28d','5','kiran','967056038','cscscs','9809070773','Not aproved'),(41,'sar','pbkdf2:sha256:150000$1809DbP0$318525dd2175447bb596767dc56110521bb173cfdf286dead1ed9df75ccaa4c4','5','kiran','967056038','cscscs','9809071173','Not aproved'),(42,'sdsd','pbkdf2:sha256:150000$GrLVqDjp$e5098e63180b23f42cf2c37cce20207125139be3ad40cc8680ec234f17a35616','aaa','dsd','fdf','Ernakulam','3434344444','Not aproved'),(43,'fddfd','pbkdf2:sha256:150000$esPLGUDS$359fbef80fda62efdb003764b0427a202f9701ef5483f9f1604802ed9b4b603a','aaa','pol','sss','Ernakulam','2323333333','Not aproved'),(44,'sas','pbkdf2:sha256:150000$JNUjNCpV$c981bbd5cadc1c7b7899717b61aceefc9dc06c1717e7bc9f5d4545fcdf26ff6c','adeda','sad','desdds','Ernakulam','3434355555','Not aproved'),(45,'royssss','pbkdf2:sha256:150000$ue5T93Hr$5f7969c1d0f3e4ec2c7a54f19abbdca6fd8e6fa3a9ce424d2738a3f622f0876b','dfsfsdfg','gdsggfdfg','dsd','Ernakulam','4545555552','Not aproved'),(46,'aaa','pbkdf2:sha256:150000$TIMolox4$d1f27901cbd909b0567bedcdd73346d209121faf3259af664ef248319c67cfab','yshd','ydh','xhhx','Ernakulam','6868686868','Not aproved'),(47,'abc','pbkdf2:sha256:150000$ENe3pNPP$bfee22ce912901c0820f407fd37df48f2862f8eaaeb4aa3a4b55ce977ef8b8bc','yshd','ydh','xhhx','Ernakulam','6868686869','Not aproved'),(48,'abcd','pbkdf2:sha256:150000$HfWg4A6o$884260b100fc529c02d78a556a0a29cd1d16769072fd0195d0417f643613ddf3','yshd','ydh','xhhx','Ernakulam','6868686860','Not aproved'),(49,'abcde','pbkdf2:sha256:150000$HXF1feyL$ef699bd8c4e711f25a53942d1bd3978ea7093cb02354a61c4622f93142e88dae','yshd','ydh','xhhx','Ernakulam','6868686864','Not aproved'),(50,'abcdef','pbkdf2:sha256:150000$u4RH4klZ$591170d06548a5ea7f9ae7f482ffb43d789dec6859c90c883b6572589c20b042','yshd','ydh','xhhx','Ernakulam','9809066666','Not aproved'),(51,'abcdefg','pbkdf2:sha256:150000$9DN8jrE4$777cae64f3a248ebaf8503e7ce370eaa27da4e98ed033f3d4a318b4d71f6b2b3','yshd','ydh','xhhx','Ernakulam','9809066667','Not aproved'),(52,'abc123','pbkdf2:sha256:150000$a3JQAJ0E$5811185b5582b581ca3f574b762db623d3167ce53294c61eb34cf912e1e662e0','yshd','ydh','xhhx','Ernakulam','9809066665','Not aproved'),(53,'momo','pbkdf2:sha256:150000$PsmfuuFF$e73cb0eb674cd0dca627578473fc204c3d18b9b9eb1337eeec84a5577fcbf782','bosss','engineer','pala','kottayam','1234000','Not aproved'),(54,'ammu','pbkdf2:sha256:150000$ReZgm8ls$63c4299f43940dbc708639035b5ce95cd236bce4dc65dc1132b3a22289f85e34','bosss','engineer','pala','iduki','1234099','Not aproved'),(55,'ammmu','pbkdf2:sha256:150000$ep3ZGp8y$feb53932c6bb3b46a36e54b22ea1e1ef07825ad57a6898245d83f396cb78bf1a','bosss','engineer','pala','iduki','12340990','Not aproved'),(56,'admin1','pbkdf2:sha256:150000$nesYlaVZ$c55decd830f3ffd16c3876dcada8bcd49d2efcf4bdefd4ec5300b2082a89ba8a','ADMIN','Admin','Kakkanad','xxxxxxxx','xxxxxxxx','Not aproved'),(58,'nichu','pbkdf2:sha256:150000$Nj0b6s1q$566974282f9ae677035b4269f5fa5f1972d4bf74d9e13aee9ebe24af2e1f25a4','ADggh','jhvhb','Thrissur','Thrissur','123456888','Not aproved'),(59,'nichu123','pbkdf2:sha256:150000$Ns4bjRDi$9cf99dd211331000fe881da21ee752e0a9cf6caf75b125965f035fd5fdfe291a','ADggh','jhvhb','Thrissur','Kotayam','123454488','Not aproved'),(60,'fio','pbkdf2:sha256:150000$oiO1iyuq$75caf152141e7cb12bd5bd7c0a460db623bcad68da0ea44fa544d374dc80b966','ADggh','jhvhb','Thrissur','Kotayam','1234576588','Not aproved'),(61,'fion','pbkdf2:sha256:150000$rt08Ic5d$7f108392ffcbce9b97e9e65d25d0797d4b64c809bb589a4a31eade5c09f0de59','ADggh','jhvhb','Thrissur','Kotayam','126666588','Not aproved');

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



-- Dump completed on 2020-04-05  9:05:58
