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

-- Dump completed on 2017-09-25  9:22:45
