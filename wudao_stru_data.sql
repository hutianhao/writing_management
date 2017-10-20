-- MySQL dump 10.13  Distrib 5.6.33, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: zky
-- ------------------------------------------------------
-- Server version	5.5.57-0ubuntu0.14.04.1

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
-- Table structure for table `codeset`
--

DROP TABLE IF EXISTS `codeset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `codeset` (
  `setcode` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '参照集code主键',
  `setname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '参照集名称',
  `setdesc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '参照集描述',
  `remark` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '标识',
  PRIMARY KEY (`setcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='参照集表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `codeset`
--

LOCK TABLES `codeset` WRITE;
/*!40000 ALTER TABLE `codeset` DISABLE KEYS */;
INSERT INTO `codeset` VALUES ('FT','功能类型','function.funtype',NULL),('MS','会员状态','member.status',NULL),('US','用户状态','userinfo.status',NULL),('UT','用户类型','userinfo.usertype的用户类型',NULL),('UX','用户性别','userinfo.sex',NULL);
/*!40000 ALTER TABLE `codeset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `function`
--

DROP TABLE IF EXISTS `function`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `function` (
  `id` char(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '主键id',
  `funparentid` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `funname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '功能名',
  `funtype` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '功能类型菜单、页面、按钮等',
  `viewSeq` int(11) DEFAULT NULL COMMENT '显示顺序',
  `funcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '功能编码',
  `funaction` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '功能请求*.action *.jsp等',
  `fundesc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '功能描述',
  PRIMARY KEY (`id`),
  KEY `FK_function_type` (`funtype`),
  KEY `FK_function_parent` (`funparentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `function`
--

LOCK TABLES `function` WRITE;
/*!40000 ALTER TABLE `function` DISABLE KEYS */;
INSERT INTO `function` VALUES ('0','0','系统','FT00',NULL,NULL,NULL,'功能树根'),('1','0','个人资料','FT02',NULL,NULL,'user/userinfo.jsp','用户修改个人资料'),('1113956936','1234566','hadoop','FT02',0,'','manage/hdfs/datalist.jsp',''),('1219848819','1234566','cloudera的管理','FT02',0,'','manage/cloud/to.jsp?page=http://159.226.19.127:7180','http://159.226.19.127:7180'),('1234566','0','云系统','FT02',0,'','',''),('1893543867','1234566','云系统数据库','FT02',0,'','manage/cloud/to.jsp?page=http://159.226.19.127:10080/phpmyadmin','http://159.226.19.127:10080/phpmyadmin'),('3','0','系统管理','FT02',NULL,NULL,NULL,'节点'),('32','3','用户管理','FT02',NULL,NULL,'manage/user/userlist.jsp','管理用户，激活等'),('33','3','角色管理','FT02',NULL,NULL,'manage/role/rolelist.jsp','角色管理，角色授权'),('34','3','日志管理','FT02',NULL,NULL,NULL,'管理日志信息'),('35','3','功能管理','FT02',NULL,NULL,'manage/function/tree.jsp','功能扩展');
/*!40000 ALTER TABLE `function` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `map_role_fun`
--

DROP TABLE IF EXISTS `map_role_fun`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `map_role_fun` (
  `id` char(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '主键id',
  `roleid` char(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '外键角色id',
  `funid` char(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '外键功能id',
  PRIMARY KEY (`id`),
  KEY `FK_RFmap_fun` (`funid`),
  KEY `FK_RFmap_role` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='角色功能表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_role_fun`
--

LOCK TABLES `map_role_fun` WRITE;
/*!40000 ALTER TABLE `map_role_fun` DISABLE KEYS */;
/*!40000 ALTER TABLE `map_role_fun` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `map_user_role`
--

DROP TABLE IF EXISTS `map_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `map_user_role` (
  `id` char(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '主键id',
  `roleid` char(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '外键角色id',
  `userid` char(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '外键用户id',
  PRIMARY KEY (`id`),
  KEY `FK_URmap_role` (`roleid`),
  KEY `FK_URmap_fun` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_user_role`
--

LOCK TABLES `map_user_role` WRITE;
/*!40000 ALTER TABLE `map_user_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `map_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `id` char(20) NOT NULL COMMENT '主键',
  `username` varchar(50) NOT NULL COMMENT '用户名唯一',
  `password` varchar(50) NOT NULL COMMENT '密码md5',
  `realname` varchar(50) NOT NULL COMMENT '真实姓名',
  `sex` varchar(50) NOT NULL COMMENT '先生，女士，保密',
  `mobile` varchar(25) NOT NULL COMMENT '手机号，必填，用于短信验证，找回密码，发送订票信息等',
  `msgverify` varchar(50) DEFAULT NULL COMMENT '是否用户短信验证通过',
  `createtime` datetime NOT NULL COMMENT '创建时间',
  `lastlogin` datetime DEFAULT NULL COMMENT '最后登录时间',
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_member_name` (`username`),
  KEY `fk_member_status` (`status`),
  KEY `fk_member_sex` (`sex`),
  KEY `fk_member_msgverify` (`msgverify`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='注册会员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES ('04d2c3cc3fe4456fa1cc','翊翊星辰','57d2a4ebf8c0da59d713d5b6f780d24b','翊翊星辰','UX02','','MS02','2015-09-10 12:32:29','2015-09-10 12:32:47','MS01'),('232d93a457fa44b7bf66','abc123','e99a18c428cb38d5f260853678922e03','aaa','UX00','','MS02','2015-09-06 11:07:56','2015-09-06 11:08:20','MS01'),('2d5090e5641843158596','gyzh530','7054e3f7dde4576f7d2fca513fbc0be7','asdfg','UX00','','MS02','2015-09-10 12:32:36','2015-09-10 12:41:38','MS01'),('44c9293ec2e84b82af38','cat','202cb962ac59075b964b07152d234b70','tom','UX00','','MS02','2015-09-06 11:00:41',NULL,'MS01'),('59f2c16831364e568d2a','abc','e10adc3949ba59abbe56e057f20f883e','abc','UX00','','MS02','2015-09-06 11:10:12','2015-09-15 18:41:14','MS01'),('9f9fb413ccb344d095c4','越小野','e10adc3949ba59abbe56e057f20f883e','岳野','UX01','18801260829','MS02','2015-09-10 10:53:01','2015-09-10 10:53:32','MS01'),('a484459fed6f496698ce','neo','970017acd136dde2de2f15c6a387e6a6','neo','UX01','15201127380','MS02','2015-09-06 18:16:00','2015-09-16 09:09:29','MS01'),('ac0cce886eb34027ad58','竹海','51cbd6b911b93afedb9c39a0310bc140','竹海','UX00','','MS02','2015-09-10 12:32:24','2015-09-10 12:57:07','MS01'),('bcf27bc07a19426390fe','lmx','c8278599f6dd35791b7fa347c5aa20a9','刘漫贤','UX00','','MS02','2015-09-10 16:28:16','2015-09-15 18:44:14','MS01'),('fe0b4331ca5f4116af3b','a01','e10adc3949ba59abbe56e057f20f883e','aaa','UX00','','MS02','2015-09-10 10:20:46','2015-09-10 10:30:31','MS01');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oplog`
--

DROP TABLE IF EXISTS `oplog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oplog` (
  `id` char(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '主键',
  `optype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `object` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `objid` char(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '对象id，这里是表记录id',
  `createtime` datetime DEFAULT NULL COMMENT '操作时间',
  `other` text COLLATE utf8_unicode_ci COMMENT '补充具体操作描述',
  `opusername` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '操作用户 后台是管理员账号，会员是会员账号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='操作日志，含系统自动操作的信息 如：2014-10-10 8:30:20 系统 对 会员 dgy 发送短信 等';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oplog`
--

LOCK TABLES `oplog` WRITE;
/*!40000 ALTER TABLE `oplog` DISABLE KEYS */;
INSERT INTO `oplog` VALUES ('1ddf42ef8d88414b8d24','注册并验证','会员','ac0cce886eb34027ad58','2015-09-10 12:32:24',NULL,'竹海'),('489709e1c8274519ab7a','注册并验证','会员','44c9293ec2e84b82af38','2015-09-06 11:00:41',NULL,'cat'),('4dbbee259b654cb39405','注册并验证','会员','a484459fed6f496698ce','2015-09-06 18:16:00',NULL,'neo'),('6a397cf15e344dd29300','注册并验证','会员','04d2c3cc3fe4456fa1cc','2015-09-10 12:32:29',NULL,'翊翊星辰'),('ac7e71d89d854fdb8ea3','注册并验证','会员','fe0b4331ca5f4116af3b','2015-09-10 10:20:46',NULL,'a01'),('b7e69c4d1b89483a83e0','注册并验证','会员','59f2c16831364e568d2a','2015-09-06 11:10:12',NULL,'abc'),('bc1d71ce1a78442d89a6','注册并验证','会员','232d93a457fa44b7bf66','2015-09-06 11:07:56',NULL,'abc123'),('da01b0a6fe0f4053a73f','注册并验证','会员','2d5090e5641843158596','2015-09-10 12:32:36',NULL,'gyzh530'),('f475abc79ee84386aad7','注册并验证','会员','9f9fb413ccb344d095c4','2015-09-10 10:53:01',NULL,'越小野'),('fa9adcc402f0420aa5ff','注册并验证','会员','bcf27bc07a19426390fe','2015-09-10 16:28:16',NULL,'lmx');
/*!40000 ALTER TABLE `oplog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review` (
  `id` char(20) NOT NULL,
  `userworkid` char(20) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `content` varchar(500) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES ('11','32','admin','测试留言测试留言测试留言测试留言测试留言测试留言测试留言','2015-09-10 12:00:00'),('188a20d38468494da7d4','31','a01','好','2015-09-10 10:30:44'),('1a76d22d534b4fbb8d1a','201509101249578157','竹海','什么是流体','2015-09-10 13:03:19'),('1ab0d89e1d3f4a04bb99','201509100348251316','abc','好字','2015-09-10 15:50:29'),('230008be63a64ac99e6b','201509101002405673','abc','写得好啊','2015-09-10 13:05:00'),('239990d3782648159fb3','1','test2','啊啊33','2015-09-10 05:17:31'),('259d696f81694232b5b5','201509100954157690','a01','写得好','2015-09-10 10:29:20'),('26642204c0ee425da5f5','813','test2','aaa','2015-09-10 04:34:55'),('2ce65592d38f4856b75c','31','abc','tttt','2015-09-10 04:29:18'),('3256f5f672bd41c6a181','201509101230116493','gyzh530','用书法设备写英文，我也是醉了','2015-09-10 12:42:21'),('421650e9c34e46febcb1','201509101002405673','neo','写的好','2015-09-10 10:33:48'),('48b37da12a424237b9e3','201509101230116493','abc','哈哈哈','2015-09-10 12:53:09'),('49fd1a62966f470e8a93','201509101238153849','竹海','不错','2015-09-10 13:00:25'),('535cefa98b264544b5f2','32','越小野','好~','2015-09-10 10:53:47'),('5fbf20958f174e709dd3','1','test2','啊啊','2015-09-10 05:17:28'),('63497d05d6924247a3a1','201509101213533929','abc','写的不错','2015-09-10 13:02:16'),('64de1b33d0d541d19280','201509101251597870','gyzh530','这个杂草画的好，以后叫作者就叫杂草兄了','2015-09-10 12:56:15'),('6a6657097046431d9316','288','admin','111','2015-09-10 04:41:27'),('6df6ed2a8d224f83a326','201509101230116493','neo','','2015-09-10 12:52:23'),('6e350286421b480bac67','201509101230116493','abc','meeee，toooo！','2015-09-10 12:42:51'),('6f87ee720f2f48bbb3d4','288','test2','天天啊啊','2015-09-10 05:12:57'),('70567af10fb64f1fa87d','201509101232017714','竹海','为什么没那两个点啊？','2015-09-10 13:05:14'),('7081e6525d854dfbb8db','201509101230116493','neo','哈哈哈，说啥呢啊','2015-09-10 12:52:43'),('728393dcb4de496fb1c8','201509101240575099','gyzh530','作品中这几个字选的挺好','2015-09-10 12:49:14'),('74b707a20fca47fa9267','25','越小野','作品后面灰色的背景','2015-09-10 10:55:08'),('7ac62591bbae482394ce','201509100356492832','abc','水流千里终归大海','2015-09-10 16:39:12'),('7d6382ef89e8465b8e9c','31','abc','good','2015-09-10 10:19:50'),('857b3889705f4e6cb406','201509101232017714','neo','不怎么样啊','2015-09-10 12:33:54'),('898ed0b4f4a14cf79309','201509100948165242','neo','写的太难看了\n','2015-09-10 10:35:02'),('8b8a08f739344521b2a3','201509101230116493','abc','yessssssssss!','2015-09-10 12:44:00'),('9549a3edee8f4604a331','31','abc','good job','2015-09-10 12:36:29'),('992aa70b5ca64a159d2e','201509101230116493','竹海','同醉','2015-09-10 13:01:27'),('a24324b7264e411090b9','201509101249578157','gyzh530','这是什么体，书法文盲，求解','2015-09-10 12:52:29'),('aa6fa45da7e34de8bbb8','201509101255016657','abc','good painting','2015-09-10 12:55:41'),('bf7816e8185340bba3e5','31','越小野','可以发空留言','2015-09-10 10:54:08'),('c2c531eced374fe8ae8f','201509100356492832','neo','好','2015-09-11 09:48:55'),('c7365a52062a4dc0ab39','201509111012456039','abc','good','2015-09-15 16:39:03'),('c762ad5f8f9e4d4292b6','201509101255016657','竹海','这幅画不错','2015-09-10 13:06:32'),('cd2788406d8f40648c1b','201509101230116493','gyzh530','楼上你口吃吗','2015-09-10 12:43:34'),('d2c124107a4243d8bfb8','201509101249578157','竹海','签字笔','2015-09-10 13:03:40'),('d5adb1ce923b442b9b34','201509101232017714','竹海','不过 有毛笔字的感觉','2015-09-10 13:05:28'),('dcf772c79a354c88acd5','31','abc','写的很好','2015-09-10 12:36:17'),('dd777576b33c4420abaf','201509101230116493','gyzh530','看不出来，你还有两下子，是评价界的哪位高人','2015-09-10 12:50:06'),('df3d3a1973b3486e8c35','201509101249578157','abc','流体。。。','2015-09-10 12:59:23'),('e442bf5340fb4dbe9baa','201509100953067940','neo','辅导费','2015-09-10 10:46:59'),('f1ee60f24c2d47f18fd4','31','越小野','','2015-09-10 10:54:09'),('f23ece91be08406fbe59','201509101230116493','gyzh530','口吃的哥们，你对这幅作品有什么想法','2015-09-10 12:46:07'),('f2468131be5f453f970c','25','越小野','这背景能不能透明？','2015-09-10 10:54:51'),('f4bac17bb2b44c77893b','81',NULL,'ttt','2015-09-10 04:30:44'),('f6c43902a260468ca0b8','201509101230116493','abc','虬劲有力！','2015-09-10 12:49:02');
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` char(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '主键id',
  `rolename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '角色名',
  `roledesc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '角色描述',
  `domain` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sourcedb`
--

DROP TABLE IF EXISTS `sourcedb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sourcedb` (
  `id` bigint(255) NOT NULL AUTO_INCREMENT,
  `userworkid` char(20) NOT NULL,
  `username` varchar(50) NOT NULL,
  `imgpath` varchar(500) NOT NULL,
  `review` varchar(500) NOT NULL,
  `createtime` datetime NOT NULL,
  `source` varchar(50) DEFAULT NULL,
  `album` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sourcedb`
--

LOCK TABLES `sourcedb` WRITE;
/*!40000 ALTER TABLE `sourcedb` DISABLE KEYS */;
INSERT INTO `sourcedb` VALUES (1,'201509160340254702','','201509160340254702.jpg','暂无描述','2015-09-16 15:40:25','北京文化馆','1'),(2,'524160724','orSbf0TAqJ_G5DU9qxWvBtjQYxHw','524160724.jpg','no','2017-05-24 16:07:25','首都博物馆,北京','1'),(3,'524165204','orSbf0RJp0hio3awP5DIR2N00k-4','524165204.jpg','no','2017-05-24 16:52:04','首都博物馆,北京','0'),(4,'524170029','orSbf0RJp0hio3awP5DIR2N00k-4','524170029.jpg','no','2017-05-24 17:00:30','首都博物馆,北京','0'),(5,'524180652','orSbf0RJp0hio3awP5DIR2N00k-4','524180652.jpg','no','2017-05-24 18:06:52','首都博物馆,北京','0'),(6,'524181029','orSbf0RJp0hio3awP5DIR2N00k-4','524181029.jpg','no','2017-05-24 18:10:29','首都博物馆,北京','0'),(7,'601105540','orSbf0RJp0hio3awP5DIR2N00k-4','601105540.jpg','no','2017-06-01 10:55:40','首都博物馆,北京','0'),(8,'601130031','orSbf0RJp0hio3awP5DIR2N00k-4','601130031.jpg','no','2017-06-01 13:00:31','首都博物馆,北京','0'),(9,'601130734','orSbf0RJp0hio3awP5DIR2N00k-4','601130734.jpg','no','2017-06-01 13:07:34','首都博物馆,北京','0'),(10,'601130846','orSbf0RJp0hio3awP5DIR2N00k-4','601130846.jpg','no','2017-06-01 13:08:46','首都博物馆,北京','0'),(11,'601131211','orSbf0RJp0hio3awP5DIR2N00k-4','601131211.jpg','no','2017-06-01 13:12:11','首都博物馆,北京','1'),(12,'605111649','orSbf0RJp0hio3awP5DIR2N00k-4','605111649.jpg','no','2017-06-05 11:16:49','首都博物馆,北京','0'),(13,'605112324','orSbf0RJp0hio3awP5DIR2N00k-4','605112324.jpg','no','2017-06-05 11:23:24','首都博物馆,北京','1'),(14,'605150523','orSbf0cx1r95nempzEvunhlT_XtM','605150523.jpg','no','2017-06-05 15:05:23','首都博物馆,北京','1'),(15,'605151548','orSbf0cx1r95nempzEvunhlT_XtM','605151548.jpg','no','2017-06-05 15:15:48','首都博物馆,北京','1'),(16,'605152134','orSbf0cx1r95nempzEvunhlT_XtM','605152134.jpg','no','2017-06-05 15:21:34','首都博物馆,北京','1'),(17,'605152911','orSbf0cx1r95nempzEvunhlT_XtM','605152911.jpg','no','2017-06-05 15:29:11','首都博物馆,北京','1'),(18,'605173441','orSbf0cx1r95nempzEvunhlT_XtM','605173441.jpg','no','2017-06-05 17:34:41','首都博物馆,北京','1'),(19,'605180308','orSbf0cx1r95nempzEvunhlT_XtM','605180308.jpg','no','2017-06-05 18:03:08','首都博物馆,北京','1'),(20,'606144933','orSbf0cx1r95nempzEvunhlT_XtM','606144933.jpg','no','2017-06-06 14:49:33','首都博物馆,北京','1'),(21,'606165123','orSbf0RJp0hio3awP5DIR2N00k-4','606165123.jpg','no','2017-06-06 16:51:23','首都博物馆,北京','0'),(22,'606165351','orSbf0RJp0hio3awP5DIR2N00k-4','606165351.jpg','no','2017-06-06 16:53:51','首都博物馆,北京','0'),(23,'607151915','orSbf0cx1r95nempzEvunhlT_XtM','607151915.jpg','no','2017-06-07 15:19:15','首都博物馆,北京','1'),(24,'607164454','orSbf0bUahBrECTQRqZQh5e7ec94','607164454.jpg','no','2017-06-07 16:44:54','首都博物馆,北京','1'),(25,'607165904','orSbf0cx1r95nempzEvunhlT_XtM','607165904.jpg','no','2017-06-07 16:59:04','首都博物馆,北京','1'),(26,'607171056','orSbf0cx1r95nempzEvunhlT_XtM','607171056.jpg','no','2017-06-07 17:10:56','首都博物馆,北京','1'),(27,'607172307','orSbf0cx1r95nempzEvunhlT_XtM','607172307.jpg','no','2017-06-07 17:23:07','首都博物馆,北京','1'),(28,'608101859','orSbf0cx1r95nempzEvunhlT_XtM','608101859.jpg','no','2017-06-08 10:18:59','首都博物馆,北京','1'),(29,'608102018','orSbf0cx1r95nempzEvunhlT_XtM','608102018.jpg','no','2017-06-08 10:20:18','首都博物馆,北京','1'),(30,'608102307','orSbf0cx1r95nempzEvunhlT_XtM','608102307.jpg','no','2017-06-08 10:23:07','首都博物馆,北京','1'),(31,'608143617','orSbf0cx1r95nempzEvunhlT_XtM','608143617.jpg','no','2017-06-08 14:36:17','首都博物馆,北京','1'),(32,'608153840','orSbf0cx1r95nempzEvunhlT_XtM','608153840.jpg','no','2017-06-08 15:38:40','首都博物馆,北京','1'),(33,'609121427','orSbf0RJp0hio3awP5DIR2N00k-4','609121427.jpg','no','2017-06-09 12:14:27','首都博物馆,北京','0'),(34,'615173250','orSbf0cx1r95nempzEvunhlT_XtM','615173250.jpg','no','2017-06-15 17:32:50','首都博物馆,北京','1'),(35,'620163210','orSbf0UNZ-Bh-UOlMZjxFygmSbK8','620163210.jpg','no','2017-06-20 16:32:10','首都博物馆,北京','1'),(36,'620213833','orSbf0VI1ydeGa9ha2SAvtUXuIkY','620213833.jpg','no','2017-06-20 21:38:33','首都博物馆,北京','1'),(37,'620213954','orSbf0VI1ydeGa9ha2SAvtUXuIkY','620213954.jpg','no','2017-06-20 21:39:54','首都博物馆,北京','1'),(38,'706083350','orSbf0cx1r95nempzEvunhlT_XtM','706083350.jpg','no','2017-07-06 08:33:50','中科院自动化所(无id编号)','1'),(39,'706094619','orSbf0cx1r95nempzEvunhlT_XtM','706094619.jpg','no','2017-07-06 09:46:19','中科院自动化所(无id编号)','1'),(40,'706125459','orSbf0YKlszNypfNwECCp7_ew2jw','706125459.jpg','no','2017-07-06 12:54:59','首都博物馆,北京','0'),(41,'706125757','orSbf0YKlszNypfNwECCp7_ew2jw','706125757.jpg','no','2017-07-06 12:57:57','中国科技馆,北京','1'),(42,'706143421','orSbf0YKlszNypfNwECCp7_ew2jw','706143421.jpg','no','2017-07-06 14:34:21','首都博物馆,北京','1'),(43,'707110701','orSbf0cx1r95nempzEvunhlT_XtM','707110701.jpg','no','2017-07-07 11:07:01','中科院自动化所(无id编号)','1'),(44,'707113142','orSbf0cx1r95nempzEvunhlT_XtM','707113142.jpg','no','2017-07-07 11:31:42','中科院自动化所(无id编号)','1'),(45,'707120541','orSbf0cx1r95nempzEvunhlT_XtM','707120541.jpg','no','2017-07-07 12:05:41','中科院自动化所(无id编号)','1'),(46,'707120951','orSbf0cx1r95nempzEvunhlT_XtM','707120951.jpg','no','2017-07-07 12:09:51','中科院自动化所(无id编号)','1'),(47,'707121524','orSbf0cx1r95nempzEvunhlT_XtM','707121524.jpg','no','2017-07-07 12:15:24','中科院自动化所(无id编号)','1'),(48,'726142329','orSbf0VJHQOgZWcyEbikYzfm2-os','726142329.jpg','no','2017-07-26 14:23:29','中科院自动化所(无id编号)','1'),(49,'726144905','orSbf0RJp0hio3awP5DIR2N00k-4','726144905.jpg','no','2017-07-26 14:49:05','中科院自动化所(无id编号)','1'),(50,'726163036','orSbf0cx1r95nempzEvunhlT_XtM','726163036.jpg','no','2017-07-26 16:30:36','中科院自动化所(无id编号)','1'),(51,'831163445','orSbf0RJp0hio3awP5DIR2N00k-4','831163445.jpg','no','2017-08-31 16:34:45','中科院自动化所(无id编号)','1'),(52,'901085742','orSbf0ZPNHYVPsUTJuNp__xYcdRs','901085742.jpg','no','2017-09-01 08:57:42','中科院自动化所(无id编号)','1'),(53,'901171457','orSbf0dqMZ05zAVZy3Rz8w3wh0x4','901171457.jpg','no','2017-09-01 17:14:57','中科院自动化所(无id编号)','1'),(54,'904090135','orSbf0YKlszNypfNwECCp7_ew2jw','905090135.jpg','no','2017-09-04 09:01:35','中国科技馆,北京','0'),(55,'905085934','NoUserName','905085934.jpg','no','2017-09-05 08:59:34','首都博物馆,北京','1'),(56,'908102513','NoUserName','908102513.jpg','no','2017-09-08 10:25:13','中科院自动化所(无id编号)','1'),(57,'908102731','NoUserName','908102731.jpg','no','2017-09-08 10:27:31','中科院自动化所(无id编号)','1'),(58,'908103034','NoUserName','908103034.jpg','no','2017-09-08 10:30:34','中科院自动化所(无id编号)','1'),(59,'908103313','NoUserName','908103313.jpg','no','2017-09-08 10:33:13','中科院自动化所(无id编号)','1'),(60,'908103555','NoUserName','908103555.jpg','no','2017-09-08 10:35:55','中科院自动化所(无id编号)','1'),(61,'908103946','orSbf0cx1r95nempzEvunhlT_XtM','908103946.jpg','no','2017-09-08 10:39:46','中科院自动化所(无id编号)','1'),(62,'908144059','orSbf0cx1r95nempzEvunhlT_XtM','908144059.jpg','no','2017-09-08 14:40:59','中科院自动化所(无id编号)','1'),(63,'908150032','orSbf0cx1r95nempzEvunhlT_XtM','908150032.jpg','no','2017-09-08 15:00:32','中科院自动化所(无id编号)','1'),(64,'908150206','orSbf0cx1r95nempzEvunhlT_XtM','908150206.jpg','no','2017-09-08 15:02:06','中科院自动化所(无id编号)','1'),(65,'908224550','orSbf0cx1r95nempzEvunhlT_XtM','908224550.jpg','no','2017-09-08 22:45:50','中科院自动化所(无id编号)','1'),(66,'908224729','orSbf0cx1r95nempzEvunhlT_XtM','908224729.jpg','no','2017-09-08 22:47:29','中科院自动化所(无id编号)','1'),(67,'909080004','NoUserName','909080004.jpg','no','2017-09-09 08:00:04','中科院自动化所(无id编号)','1'),(68,'909080527','NoUserName','909080527.jpg','no','2017-09-09 08:05:27','中科院自动化所(无id编号)','1'),(69,'909082925','orSbf0RJp0hio3awP5DIR2N00k-4','909082925.jpg','no','2017-09-09 08:29:25','中科院自动化所(无id编号)','1'),(70,'909091610','NoUserName','909091610.jpg','no','2017-09-09 09:16:10','中科院自动化所(无id编号)','1'),(71,'912091859','NoUserName','912091859.jpg','no','2017-09-12 09:18:59','中科院自动化所(无id编号)','1'),(72,'912102947','NoUserName','912102947.jpg','no','2017-09-12 10:29:47','中科院自动化所(无id编号)','1'),(73,'918150234','NoUserName','918150234.jpg','no','2017-09-18 15:02:34','中科院自动化所(无id编号)','1'),(74,'1111','1111','111','11','2017-09-21 16:45:32','111','1'),(75,'222','222','222','22','2017-09-21 17:00:28','222','2'),(76,'3333','3333','3333','333','2017-09-21 18:51:16','333','3'),(77,'444','444','44','44','2017-09-21 18:59:42','444','4'),(78,'555','55','55','55','2017-09-21 19:04:24','55','5');
/*!40000 ALTER TABLE `sourcedb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenant`
--

DROP TABLE IF EXISTS `tenant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tenant` (
  `id` varchar(45) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `introduction` varchar(200) DEFAULT NULL,
  `config` varchar(200) DEFAULT NULL,
  `desc` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenant`
--

LOCK TABLES `tenant` WRITE;
/*!40000 ALTER TABLE `tenant` DISABLE KEYS */;
/*!40000 ALTER TABLE `tenant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userinfo`
--

DROP TABLE IF EXISTS `userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userinfo` (
  `id` char(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '用户id主键',
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '用户名，唯一',
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '密码md5',
  `realname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '真实姓名',
  `sex` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '性别，外键',
  `birthday` datetime DEFAULT '1970-01-01 00:00:00' COMMENT '生日',
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '电话',
  `idcard` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '身份证号',
  `usertype` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '外键用户类型',
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邮件',
  `createtime` datetime DEFAULT '1970-01-01 00:00:00' COMMENT '创建时间',
  `status` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '外键用户状态',
  `lasttime` datetime DEFAULT '1970-01-01 00:00:00' COMMENT '最后登录时间',
  `nickname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '昵称',
  `domain` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `USERNAMEUNQUE` (`username`),
  UNIQUE KEY `NICKNAMEUNQUE` (`nickname`),
  KEY `FK_userinfo_type` (`usertype`),
  KEY `FK_userinfo_sex` (`sex`),
  KEY `FK_userinfo_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userinfo`
--

LOCK TABLES `userinfo` WRITE;
/*!40000 ALTER TABLE `userinfo` DISABLE KEYS */;
INSERT INTO `userinfo` VALUES ('2527febec4fa426283d5','admin','21232f297a57a5a743894a0e4a801fc3','超级用户','UX01','1970-01-01 00:00:00',NULL,NULL,'UT01',NULL,'1970-01-01 00:00:00',NULL,'1970-01-01 00:00:00',NULL,NULL);
/*!40000 ALTER TABLE `userinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userworks`
--

DROP TABLE IF EXISTS `userworks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userworks` (
  `id` char(20) NOT NULL,
  `username` varchar(50) NOT NULL,
  `imgpath` varchar(500) NOT NULL,
  `review` varchar(500) NOT NULL,
  `createtime` datetime NOT NULL,
  `source` varchar(50) DEFAULT NULL,
  `album` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userworks`
--

LOCK TABLES `userworks` WRITE;
/*!40000 ALTER TABLE `userworks` DISABLE KEYS */;
INSERT INTO `userworks` VALUES ('1111','1111','111','11','2017-09-21 16:45:32','111','1'),('201509160340254702','','201509160340254702.jpg','暂无描述','2015-09-16 15:40:25','北京文化馆','1'),('222','222','222','22','2017-09-21 17:00:28','222','2'),('3333','3333','3333','333','2017-09-21 18:51:16','333','3'),('444','444','44','44','2017-09-21 18:59:42','444','4'),('524160724','orSbf0TAqJ_G5DU9qxWvBtjQYxHw','524160724.jpg','no','2017-05-24 16:07:25','首都博物馆,北京','1'),('524165204','orSbf0RJp0hio3awP5DIR2N00k-4','524165204.jpg','no','2017-05-24 16:52:04','首都博物馆,北京','0'),('524170029','orSbf0RJp0hio3awP5DIR2N00k-4','524170029.jpg','no','2017-05-24 17:00:30','首都博物馆,北京','0'),('524180652','orSbf0RJp0hio3awP5DIR2N00k-4','524180652.jpg','no','2017-05-24 18:06:52','首都博物馆,北京','0'),('524181029','orSbf0RJp0hio3awP5DIR2N00k-4','524181029.jpg','no','2017-05-24 18:10:29','首都博物馆,北京','0'),('555','55','55','55','2017-09-21 19:04:24','55','5'),('601105540','orSbf0RJp0hio3awP5DIR2N00k-4','601105540.jpg','no','2017-06-01 10:55:40','首都博物馆,北京','0'),('601130031','orSbf0RJp0hio3awP5DIR2N00k-4','601130031.jpg','no','2017-06-01 13:00:31','首都博物馆,北京','0'),('601130734','orSbf0RJp0hio3awP5DIR2N00k-4','601130734.jpg','no','2017-06-01 13:07:34','首都博物馆,北京','0'),('601130846','orSbf0RJp0hio3awP5DIR2N00k-4','601130846.jpg','no','2017-06-01 13:08:46','首都博物馆,北京','0'),('601131211','orSbf0RJp0hio3awP5DIR2N00k-4','601131211.jpg','no','2017-06-01 13:12:11','首都博物馆,北京','1'),('605111649','orSbf0RJp0hio3awP5DIR2N00k-4','605111649.jpg','no','2017-06-05 11:16:49','首都博物馆,北京','0'),('605112324','orSbf0RJp0hio3awP5DIR2N00k-4','605112324.jpg','no','2017-06-05 11:23:24','首都博物馆,北京','1'),('605150523','orSbf0cx1r95nempzEvunhlT_XtM','605150523.jpg','no','2017-06-05 15:05:23','首都博物馆,北京','1'),('605151548','orSbf0cx1r95nempzEvunhlT_XtM','605151548.jpg','no','2017-06-05 15:15:48','首都博物馆,北京','1'),('605152134','orSbf0cx1r95nempzEvunhlT_XtM','605152134.jpg','no','2017-06-05 15:21:34','首都博物馆,北京','1'),('605152911','orSbf0cx1r95nempzEvunhlT_XtM','605152911.jpg','no','2017-06-05 15:29:11','首都博物馆,北京','1'),('605173441','orSbf0cx1r95nempzEvunhlT_XtM','605173441.jpg','no','2017-06-05 17:34:41','首都博物馆,北京','1'),('605180308','orSbf0cx1r95nempzEvunhlT_XtM','605180308.jpg','no','2017-06-05 18:03:08','首都博物馆,北京','1'),('606144933','orSbf0cx1r95nempzEvunhlT_XtM','606144933.jpg','no','2017-06-06 14:49:33','首都博物馆,北京','1'),('606165123','orSbf0RJp0hio3awP5DIR2N00k-4','606165123.jpg','no','2017-06-06 16:51:23','首都博物馆,北京','0'),('606165351','orSbf0RJp0hio3awP5DIR2N00k-4','606165351.jpg','no','2017-06-06 16:53:51','首都博物馆,北京','0'),('607151915','orSbf0cx1r95nempzEvunhlT_XtM','607151915.jpg','no','2017-06-07 15:19:15','首都博物馆,北京','1'),('607164454','orSbf0bUahBrECTQRqZQh5e7ec94','607164454.jpg','no','2017-06-07 16:44:54','首都博物馆,北京','1'),('607165904','orSbf0cx1r95nempzEvunhlT_XtM','607165904.jpg','no','2017-06-07 16:59:04','首都博物馆,北京','1'),('607171056','orSbf0cx1r95nempzEvunhlT_XtM','607171056.jpg','no','2017-06-07 17:10:56','首都博物馆,北京','1'),('607172307','orSbf0cx1r95nempzEvunhlT_XtM','607172307.jpg','no','2017-06-07 17:23:07','首都博物馆,北京','1'),('608101859','orSbf0cx1r95nempzEvunhlT_XtM','608101859.jpg','no','2017-06-08 10:18:59','首都博物馆,北京','1'),('608102018','orSbf0cx1r95nempzEvunhlT_XtM','608102018.jpg','no','2017-06-08 10:20:18','首都博物馆,北京','1'),('608102307','orSbf0cx1r95nempzEvunhlT_XtM','608102307.jpg','no','2017-06-08 10:23:07','首都博物馆,北京','1'),('608143617','orSbf0cx1r95nempzEvunhlT_XtM','608143617.jpg','no','2017-06-08 14:36:17','首都博物馆,北京','1'),('608153840','orSbf0cx1r95nempzEvunhlT_XtM','608153840.jpg','no','2017-06-08 15:38:40','首都博物馆,北京','1'),('609121427','orSbf0RJp0hio3awP5DIR2N00k-4','609121427.jpg','no','2017-06-09 12:14:27','首都博物馆,北京','0'),('615173250','orSbf0cx1r95nempzEvunhlT_XtM','615173250.jpg','no','2017-06-15 17:32:50','首都博物馆,北京','1'),('620163210','orSbf0UNZ-Bh-UOlMZjxFygmSbK8','620163210.jpg','no','2017-06-20 16:32:10','首都博物馆,北京','1'),('620213833','orSbf0VI1ydeGa9ha2SAvtUXuIkY','620213833.jpg','no','2017-06-20 21:38:33','首都博物馆,北京','1'),('620213954','orSbf0VI1ydeGa9ha2SAvtUXuIkY','620213954.jpg','no','2017-06-20 21:39:54','首都博物馆,北京','1'),('706083350','orSbf0cx1r95nempzEvunhlT_XtM','706083350.jpg','no','2017-07-06 08:33:50','中科院自动化所(无id编号)','1'),('706094619','orSbf0cx1r95nempzEvunhlT_XtM','706094619.jpg','no','2017-07-06 09:46:19','中科院自动化所(无id编号)','1'),('706125459','orSbf0YKlszNypfNwECCp7_ew2jw','706125459.jpg','no','2017-07-06 12:54:59','首都博物馆,北京','0'),('706125757','orSbf0YKlszNypfNwECCp7_ew2jw','706125757.jpg','no','2017-07-06 12:57:57','中国科技馆,北京','1'),('706143421','orSbf0YKlszNypfNwECCp7_ew2jw','706143421.jpg','no','2017-07-06 14:34:21','首都博物馆,北京','1'),('707110701','orSbf0cx1r95nempzEvunhlT_XtM','707110701.jpg','no','2017-07-07 11:07:01','中科院自动化所(无id编号)','1'),('707113142','orSbf0cx1r95nempzEvunhlT_XtM','707113142.jpg','no','2017-07-07 11:31:42','中科院自动化所(无id编号)','1'),('707120541','orSbf0cx1r95nempzEvunhlT_XtM','707120541.jpg','no','2017-07-07 12:05:41','中科院自动化所(无id编号)','1'),('707120951','orSbf0cx1r95nempzEvunhlT_XtM','707120951.jpg','no','2017-07-07 12:09:51','中科院自动化所(无id编号)','1'),('707121524','orSbf0cx1r95nempzEvunhlT_XtM','707121524.jpg','no','2017-07-07 12:15:24','中科院自动化所(无id编号)','1'),('726142329','orSbf0VJHQOgZWcyEbikYzfm2-os','726142329.jpg','no','2017-07-26 14:23:29','中科院自动化所(无id编号)','1'),('726144905','orSbf0RJp0hio3awP5DIR2N00k-4','726144905.jpg','no','2017-07-26 14:49:05','中科院自动化所(无id编号)','1'),('726163036','orSbf0cx1r95nempzEvunhlT_XtM','726163036.jpg','no','2017-07-26 16:30:36','中科院自动化所(无id编号)','1'),('831163445','orSbf0RJp0hio3awP5DIR2N00k-4','831163445.jpg','no','2017-08-31 16:34:45','中科院自动化所(无id编号)','1'),('901085742','orSbf0ZPNHYVPsUTJuNp__xYcdRs','901085742.jpg','no','2017-09-01 08:57:42','中科院自动化所(无id编号)','1'),('901171457','orSbf0dqMZ05zAVZy3Rz8w3wh0x4','901171457.jpg','no','2017-09-01 17:14:57','中科院自动化所(无id编号)','1'),('904090135','orSbf0YKlszNypfNwECCp7_ew2jw','905090135.jpg','no','2017-09-04 09:01:35','中国科技馆,北京','0'),('905085934','NoUserName','905085934.jpg','no','2017-09-05 08:59:34','首都博物馆,北京','1'),('908102513','NoUserName','908102513.jpg','no','2017-09-08 10:25:13','中科院自动化所(无id编号)','1'),('908102731','NoUserName','908102731.jpg','no','2017-09-08 10:27:31','中科院自动化所(无id编号)','1'),('908103034','NoUserName','908103034.jpg','no','2017-09-08 10:30:34','中科院自动化所(无id编号)','1'),('908103313','NoUserName','908103313.jpg','no','2017-09-08 10:33:13','中科院自动化所(无id编号)','1'),('908103555','NoUserName','908103555.jpg','no','2017-09-08 10:35:55','中科院自动化所(无id编号)','1'),('908103946','orSbf0cx1r95nempzEvunhlT_XtM','908103946.jpg','no','2017-09-08 10:39:46','中科院自动化所(无id编号)','1'),('908144059','orSbf0cx1r95nempzEvunhlT_XtM','908144059.jpg','no','2017-09-08 14:40:59','中科院自动化所(无id编号)','1'),('908150032','orSbf0cx1r95nempzEvunhlT_XtM','908150032.jpg','no','2017-09-08 15:00:32','中科院自动化所(无id编号)','1'),('908150206','orSbf0cx1r95nempzEvunhlT_XtM','908150206.jpg','no','2017-09-08 15:02:06','中科院自动化所(无id编号)','1'),('908224550','orSbf0cx1r95nempzEvunhlT_XtM','908224550.jpg','no','2017-09-08 22:45:50','中科院自动化所(无id编号)','1'),('908224729','orSbf0cx1r95nempzEvunhlT_XtM','908224729.jpg','no','2017-09-08 22:47:29','中科院自动化所(无id编号)','1'),('909080004','NoUserName','909080004.jpg','no','2017-09-09 08:00:04','中科院自动化所(无id编号)','1'),('909080527','NoUserName','909080527.jpg','no','2017-09-09 08:05:27','中科院自动化所(无id编号)','1'),('909082925','orSbf0RJp0hio3awP5DIR2N00k-4','909082925.jpg','no','2017-09-09 08:29:25','中科院自动化所(无id编号)','1'),('909091610','NoUserName','909091610.jpg','no','2017-09-09 09:16:10','中科院自动化所(无id编号)','1'),('912091859','NoUserName','912091859.jpg','no','2017-09-12 09:18:59','中科院自动化所(无id编号)','1'),('912102947','NoUserName','912102947.jpg','no','2017-09-12 10:29:47','中科院自动化所(无id编号)','1'),('918150234','NoUserName','918150234.jpg','no','2017-09-18 15:02:34','中科院自动化所(无id编号)','1');
/*!40000 ALTER TABLE `userworks` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`shufa`@`%`*/ /*!50003 trigger tr1
after insert on userworks
for each row
begin
 insert into sourcedb(userworkid,username,imgpath,review,createtime,source,album) values(new.id,new.username,new.imgpath,new.review,new.createtime,new.source,new.album);
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-25  9:19:34
