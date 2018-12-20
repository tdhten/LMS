/*
Navicat MySQL Data Transfer

Source Server         : 本机
Source Server Version : 50724
Source Host           : localhost:3306
Source Database       : tsglxt

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2018-12-20 21:32:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `adminId` char(32) NOT NULL,
  `adminname` varchar(50) DEFAULT NULL,
  `adminpwd` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`adminId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES ('a1', 'liubei', '123');
INSERT INTO `t_admin` VALUES ('a2', 'guanyu', '123');
INSERT INTO `t_admin` VALUES ('a3', 'admin', 'admin');
INSERT INTO `t_admin` VALUES ('a4', 'lilin', 'lilin');
INSERT INTO `t_admin` VALUES ('a5', '段誉', 'duanyu');

-- ----------------------------
-- Table structure for t_book
-- ----------------------------
DROP TABLE IF EXISTS `t_book`;
CREATE TABLE `t_book` (
  `bid` char(32) NOT NULL,
  `bname` varchar(200) DEFAULT NULL,
  `author` varchar(50) DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `press` varchar(100) DEFAULT NULL,
  `publishtime` char(10) DEFAULT NULL,
  `edition` int(11) DEFAULT NULL,
  `pageNum` int(11) DEFAULT NULL,
  `wordNum` int(11) DEFAULT NULL,
  `printtime` char(10) DEFAULT NULL,
  `booksize` int(11) DEFAULT NULL,
  `paper` varchar(50) DEFAULT NULL,
  `cid` char(32) DEFAULT NULL,
  `image_w` varchar(100) DEFAULT NULL,
  `image_b` varchar(100) DEFAULT NULL,
  `orderBy` int(11) NOT NULL AUTO_INCREMENT,
  `cxl` varchar(64) DEFAULT NULL COMMENT '现存量',
  `kczl` varchar(128) DEFAULT NULL COMMENT '库存总量',
  `rksj` datetime DEFAULT NULL COMMENT '入库时间',
  `jccs` int(64) DEFAULT NULL COMMENT '借出次数',
  PRIMARY KEY (`bid`),
  KEY `orderBy` (`orderBy`),
  KEY `FK_t_book_t_category` (`cid`),
  CONSTRAINT `t_book_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `t_category` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_book
-- ----------------------------
INSERT INTO `t_book` VALUES ('000A18FDB38F470DBE9CD0972BADB23F', 'Java Web整合开发实战--基于Struts 2+Hibernate+Spring（99个应用实例，4个项目开发案例，15.5小时配套教学视频，超值DVD光盘含大量开发资源。一本书搞定SSH框架整合开发！）', '贾蓓', '79.80', '清华大学出版社', '2013-7-1', '1', '640', '1030000', '2013-7-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23268958-1_w.jpg', 'book_img/23268958-1_b.jpg', '16', null, null, null, null);
INSERT INTO `t_book` VALUES ('0BE0707984014E66BD9F34F534FCE0F7', 'OSGi实战【OSGi规范制定者亲自撰写 汇集Apache项目技术实战经验】', 'Richard', '99.00', '人民邮电出版社', '2013-1-1', '1', '468', '721000', '2013-1-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22938396-1_w.jpg', 'book_img/22938396-1_b.jpg', '58', null, null, null, null);
INSERT INTO `t_book` VALUES ('0EE8A0AE69154287A378FB110FF2C780', 'Java核心技术：卷Ⅰ基础知识（原书第8版）', '昊斯特曼', '98.00', '机械工业出版社', '2008-6-1', '1', '694', '0', '2008-6-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/20285763-1_w.jpg', 'book_img/20285763-1_b.jpg', '12', null, null, null, null);

-- ----------------------------
-- Table structure for t_borrow
-- ----------------------------
DROP TABLE IF EXISTS `t_borrow`;
CREATE TABLE `t_borrow` (
  `jid` char(32) NOT NULL COMMENT '借阅图书表',
  `bid` varchar(32) DEFAULT NULL,
  `uid` varchar(32) DEFAULT NULL,
  `jysj` datetime DEFAULT NULL COMMENT '借阅时间',
  `mqsj` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '目前时间',
  `dqsj` datetime DEFAULT NULL COMMENT '到期时间',
  `ghsj` datetime DEFAULT NULL,
  `xjcs` int(4) DEFAULT NULL COMMENT '续借次数',
  `zt` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`jid`),
  KEY `borrow_user_fk` (`uid`),
  KEY `borrow_book_fk` (`bid`),
  CONSTRAINT `borrow_book_fk` FOREIGN KEY (`bid`) REFERENCES `t_book` (`bid`),
  CONSTRAINT `borrow_user_fk` FOREIGN KEY (`uid`) REFERENCES `t_user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_borrow
-- ----------------------------
INSERT INTO `t_borrow` VALUES ('123', '000A18FDB38F470DBE9CD0972BADB23F', '4DE7E4D829A54D4FAB150B7451407198', '2018-12-20 15:35:22', '2018-12-20 15:35:25', '2018-12-20 15:35:26', '2018-12-20 15:35:30', '1', '123');

-- ----------------------------
-- Table structure for t_bzdm
-- ----------------------------
DROP TABLE IF EXISTS `t_bzdm`;
CREATE TABLE `t_bzdm` (
  `code` varchar(16) NOT NULL,
  `kind` varchar(255) DEFAULT NULL,
  `mc` varchar(255) DEFAULT NULL,
  `bz` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_bzdm
-- ----------------------------
INSERT INTO `t_bzdm` VALUES ('1', '', '未完成', null);
INSERT INTO `t_bzdm` VALUES ('2', null, '进行中', null);
INSERT INTO `t_bzdm` VALUES ('3', null, '已结束', null);

-- ----------------------------
-- Table structure for t_category
-- ----------------------------
DROP TABLE IF EXISTS `t_category`;
CREATE TABLE `t_category` (
  `cid` char(32) NOT NULL,
  `cname` varchar(50) DEFAULT NULL,
  `pid` char(32) DEFAULT NULL,
  `desc` varchar(100) DEFAULT NULL,
  `orderBy` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`cid`),
  UNIQUE KEY `cname` (`cname`),
  KEY `FK_t_category_t_category` (`pid`),
  KEY `orderBy` (`orderBy`),
  CONSTRAINT `t_category_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `t_category` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_category
-- ----------------------------
INSERT INTO `t_category` VALUES ('1', '程序设计', null, '程序设计分类', '1');
INSERT INTO `t_category` VALUES ('2', '办公室用书', null, '办公室用书', '2');
INSERT INTO `t_category` VALUES ('3', '图形 图像 多媒体', null, '图形图像多媒体', '3');
INSERT INTO `t_category` VALUES ('4', '操作系统/系统开发', null, '操作系统/系统开发', '4');
INSERT INTO `t_category` VALUES ('458795C27E7346A8A5F1B942319297E0', '系统开发', '4', '系统开发分类', '29');
INSERT INTO `t_category` VALUES ('4D01FFF0CB94468EA907EF42780668AB', '购买指南 组装指南 维修', '2', '购买指南 组装指南 维修分类', '18');
INSERT INTO `t_category` VALUES ('5', '数据库', null, '数据库', '5');
INSERT INTO `t_category` VALUES ('56AD72718C524147A2485E5F4A95A062', '3DS MAX', '3', '3DS MAX分类', '21');
INSERT INTO `t_category` VALUES ('57DE3C2DDA784B81844029A28217698C', 'Dreamweaver', '3', 'Dreamweaver分类', '24');
INSERT INTO `t_category` VALUES ('5F79D0D246AD4216AC04E9C5FAB3199E', 'Java Javascript', '1', 'Java Javascript分类', '10');

-- ----------------------------
-- Table structure for t_fine
-- ----------------------------
DROP TABLE IF EXISTS `t_fine`;
CREATE TABLE `t_fine` (
  `fid` char(32) NOT NULL COMMENT '罚款单表',
  `bid` varchar(32) DEFAULT NULL,
  `uid` varchar(32) DEFAULT NULL,
  `cqts` int(4) DEFAULT NULL COMMENT '超期天数',
  `yfje` decimal(10,0) DEFAULT NULL COMMENT '应罚金额',
  `ssje` decimal(10,0) DEFAULT NULL COMMENT '实收金额',
  `zt` varchar(16) DEFAULT NULL COMMENT '状态',
  `bz` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`fid`),
  KEY `fine_user_fk` (`uid`),
  KEY `fine_book_fk` (`bid`),
  CONSTRAINT `fine_book_fk` FOREIGN KEY (`bid`) REFERENCES `t_book` (`bid`),
  CONSTRAINT `fine_user_fk` FOREIGN KEY (`uid`) REFERENCES `t_user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_fine
-- ----------------------------

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `uid` char(32) NOT NULL,
  `loginname` varchar(50) DEFAULT NULL,
  `loginpass` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `activationCode` char(64) DEFAULT NULL,
  `dzlx` varchar(16) DEFAULT NULL COMMENT '读者类型',
  `zcsj` datetime DEFAULT NULL COMMENT '注册时间',
  `lastlogintime` datetime DEFAULT NULL COMMENT '最后一次登录时间',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `loginname` (`loginname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('32DB3700D2564254982BC58B0E4D95BC', 'lisi', 'lisi', 'lisi@126.com', '1', '15682E9C4D2849E2AB5D8AFF55D2F7BA87126B0EF55A45C6A136E3CAA90D60F2', '3', null, null);
INSERT INTO `t_user` VALUES ('4DE7E4D829A54D4FAB150B7451407198', 'def', 'def', 'def@soh.com', '0', 'D00FAA82457748FF8C1B912042E615B39F3602053E154181B98CDD48D9ECFC96', '3', null, null);
INSERT INTO `t_user` VALUES ('531D8A16D524478D86F8A115FE95D93F', 'zhangsan', 'zhangsan', 'zhangsan@163.com', '1', 'FCF142D04C4A420992FF4E7BAC92C1E58AF905F1A46B4818BB455BD925E52DDD', '3', null, null);
INSERT INTO `t_user` VALUES ('55790D9C1A1845738E6D93866A148C7E', 'lilin', 'lilin', 'lilin@sina.com', '1', '659903B3D5FF4576B82425A593962DFE64B6137EBE934AE5AE19F614E71F4549', '3', null, null);
INSERT INTO `t_user` VALUES ('9CC972DFA2D4481F89841A46FD1B3E7B', 'abc', 'abc', 'abc@qq.com', '0', 'D7CEB3DE44364749A4807D98F8B2F63017FDFED9FFC842B6BBC64E20698FED5F', '3', null, null);
INSERT INTO `t_user` VALUES ('x', '123', '123', '123@163.com', '1', 'x', '1', null, null);
INSERT INTO `t_user` VALUES ('xx', 'guanyu', 'guanyu', 'guanyu@163.com', '1', 'xx', '2', null, null);
INSERT INTO `t_user` VALUES ('xxx', 'zhangfei', 'zhangfei', 'zhangfei@163.com', '1', 'xxx', '2', null, null);
INSERT INTO `t_user` VALUES ('xxxx', 'zhaoyun', 'zhangfei', 'zhaoyun@163.com', '1', 'xxxx', '2', null, null);

-- ----------------------------
-- Procedure structure for synTime
-- ----------------------------
DROP PROCEDURE IF EXISTS `synTime`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `synTime`()
begin
update t_borrow set mqsj = now();
end
;;
DELIMITER ;

-- ----------------------------
-- Event structure for synTime
-- ----------------------------
DROP EVENT IF EXISTS `synTime`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` EVENT `synTime` ON SCHEDULE EVERY 12 HOUR STARTS '2018-12-21 00:00:00' ON COMPLETION PRESERVE ENABLE DO call synTime()
;;
DELIMITER ;
