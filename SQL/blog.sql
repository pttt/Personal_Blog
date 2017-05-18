# Host: localhost    Database: blog
# ------------------------------------------------------
# Server version 5.0.67-community-nt

DROP DATABASE IF EXISTS `blog`;
CREATE DATABASE `blog` /*!40100 DEFAULT CHARACTER SET gb2312 */;
USE `blog`;

#
# Table structure for table article
#

CREATE TABLE `article` (
  `Id` int(11) NOT NULL auto_increment,#文章主键
  `title` varchar(50) default NULL,
  `content` text,
  `username` varchar(50) default NULL,
  `date` datetime default NULL,
  `hasread` int(11) default '0',#阅读量
  PRIMARY KEY  (`Id`),
  KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=gb2312 COMMENT='文章表';
INSERT INTO `article` VALUES (1,'Java从入门到放弃','<p>哈哈哈哈<img alt=\"\" src=\"http://localhost:8080/Personal_Blog/user/fckeditor/editor/images/smiley/qq/017.jpg\" /></p>','pt','2017-5-18 10:58:50',2);
INSERT INTO `article` VALUES (2,'Java从入门到转行','<p>我们一起感受其他职业的魅力吧！！！！！</p>','pt','2017-5-18 10:59:41',1);
INSERT INTO `article` VALUES (3,'一定要学习Java吗！','<p>怎么可能<img alt=\"\" src=\"http://localhost:8080/Personal_Blog/user/fckeditor/editor/images/smiley/qq/005.gif\" /></p>','pt','2017-5-17 11:00:22',1);
INSERT INTO `article` VALUES (4,'blog','这是我的第一篇博客','pt','2016-12-27 11:08:43',1);
INSERT INTO `article` VALUES (5,'测试日志！！','<p>测试日志！！<img alt=\"\" src=\"http://localhost:8080/Personal_Blog/user/fckeditor/editor/images/smiley/qq/004.gif\" /></p>','pt','2017-05-17 18:05:06',1);

#
# Table structure for table bloginfo
#

CREATE TABLE `bloginfo` (
  `username` varchar(20) NOT NULL default '',#博客用户名
  `blogtitle` varchar(50) default NULL,#博客标题名称
  `idiograph` varchar(50) default NULL,#博客段落设置
  PRIMARY KEY  (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312 COMMENT='个性设置表';
INSERT INTO `bloginfo` VALUES ('pt','','');

#
# Table structure for table critique
#

CREATE TABLE `critique` (
  `Id` int(11) NOT NULL auto_increment,#评论主键
  `AId` int(11) default NULL,#评论文章的编号
  `content` text,#评论内容
  `username` varchar(50) default NULL,#评论者
  PRIMARY KEY  (`Id`),
  KEY `AId` (`AId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=gb2312 COMMENT='评论表';
INSERT INTO `critique` VALUES (1,3,'<p>我好强啊</p>','pt');
INSERT INTO `critique` VALUES (2,3,'<p>你好棒啊</p>','pt');
INSERT INTO `critique` VALUES (3,2,'<p>我们都好优秀啊</p>','pt');
INSERT INTO `critique` VALUES (4,5,'<p>优秀三连</p>','pt');
INSERT INTO `critique` VALUES (5,1,'<p>测试一下！！</p>','pt');
INSERT INTO `critique` VALUES (6,5,'<p><a href=\"http://localhost:8080/Personal_Blog/\">http://localhost:8080/Personal_Blog/</a></p>','匿名');

#
# Table structure for table dianjiliang
#

CREATE TABLE `dianjiliang` (
  `Id` int(11) NOT NULL auto_increment,#点击量主键
  `AId` int(11) default NULL,#点击的文章编号
  `ip` varchar(255) default NULL,#点击的ip地址
  `time` date default NULL,#点击的时间
  PRIMARY KEY  (`Id`),
  KEY `AId` (`AId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=gb2312 COMMENT='点击量表';
INSERT INTO `dianjiliang` VALUES (1,1,'0:0:0:0:0:0:0:1','2017-4-27');
INSERT INTO `dianjiliang` VALUES (2,3,'0:0:0:0:0:0:0:1','2017-4-27');
INSERT INTO `dianjiliang` VALUES (3,1,'0:0:0:0:0:0:0:1','2017-4-27');
INSERT INTO `dianjiliang` VALUES (4,2,'0:0:0:0:0:0:0:1','2017-4-27');
INSERT INTO `dianjiliang` VALUES (5,5,'0:0:0:0:0:0:0:1','2017-4-27');
INSERT INTO `dianjiliang` VALUES (6,4,'0:0:0:0:0:0:0:1','2017-4-27');

#
# Table structure for table user
#

CREATE TABLE `user` (
  `username` varchar(20) NOT NULL default '',#用户名
  `password` varchar(20) default NULL,#密码
  `nickname` varchar(20) default NULL,#昵称
  `question` varchar(50) default NULL,#密保问题
  `answer` varchar(50) default NULL,#密保答案
  PRIMARY KEY  (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312 COMMENT='用户表';
INSERT INTO `user` VALUES ('pt','111111','hello?','hello','hello');

#
#  Foreign keys for table article
#

ALTER TABLE `article`
ADD CONSTRAINT `article_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`);

#
#  Foreign keys for table bloginfo
#

ALTER TABLE `bloginfo`
ADD CONSTRAINT `bloginfo_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`);

#
#  Foreign keys for table critique
#

ALTER TABLE `critique`
ADD CONSTRAINT `critique_ibfk_1` FOREIGN KEY (`AId`) REFERENCES `article` (`Id`);

#
#  Foreign keys for table dianjiliang
#

ALTER TABLE `dianjiliang`
ADD CONSTRAINT `dianjiliang_ibfk_1` FOREIGN KEY (`AId`) REFERENCES `article` (`Id`);
