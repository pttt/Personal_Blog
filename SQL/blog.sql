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
  `Id` int(11) NOT NULL auto_increment,#��������
  `title` varchar(50) default NULL,
  `content` text,
  `username` varchar(50) default NULL,
  `date` datetime default NULL,
  `hasread` int(11) default '0',#�Ķ���
  PRIMARY KEY  (`Id`),
  KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=gb2312 COMMENT='���±�';
INSERT INTO `article` VALUES (1,'Java�����ŵ�����','<p>��������<img alt=\"\" src=\"http://localhost:8080/Personal_Blog/user/fckeditor/editor/images/smiley/qq/017.jpg\" /></p>','pt','2017-5-18 10:58:50',2);
INSERT INTO `article` VALUES (2,'Java�����ŵ�ת��','<p>����һ���������ְҵ�������ɣ���������</p>','pt','2017-5-18 10:59:41',1);
INSERT INTO `article` VALUES (3,'һ��ҪѧϰJava��','<p>��ô����<img alt=\"\" src=\"http://localhost:8080/Personal_Blog/user/fckeditor/editor/images/smiley/qq/005.gif\" /></p>','pt','2017-5-17 11:00:22',1);
INSERT INTO `article` VALUES (4,'blog','�����ҵĵ�һƪ����','pt','2016-12-27 11:08:43',1);
INSERT INTO `article` VALUES (5,'������־����','<p>������־����<img alt=\"\" src=\"http://localhost:8080/Personal_Blog/user/fckeditor/editor/images/smiley/qq/004.gif\" /></p>','pt','2017-05-17 18:05:06',1);

#
# Table structure for table bloginfo
#

CREATE TABLE `bloginfo` (
  `username` varchar(20) NOT NULL default '',#�����û���
  `blogtitle` varchar(50) default NULL,#���ͱ�������
  `idiograph` varchar(50) default NULL,#���Ͷ�������
  PRIMARY KEY  (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312 COMMENT='�������ñ�';
INSERT INTO `bloginfo` VALUES ('pt','','');

#
# Table structure for table critique
#

CREATE TABLE `critique` (
  `Id` int(11) NOT NULL auto_increment,#��������
  `AId` int(11) default NULL,#�������µı��
  `content` text,#��������
  `username` varchar(50) default NULL,#������
  PRIMARY KEY  (`Id`),
  KEY `AId` (`AId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=gb2312 COMMENT='���۱�';
INSERT INTO `critique` VALUES (1,3,'<p>�Һ�ǿ��</p>','pt');
INSERT INTO `critique` VALUES (2,3,'<p>��ð���</p>','pt');
INSERT INTO `critique` VALUES (3,2,'<p>���Ƕ������㰡</p>','pt');
INSERT INTO `critique` VALUES (4,5,'<p>��������</p>','pt');
INSERT INTO `critique` VALUES (5,1,'<p>����һ�£���</p>','pt');
INSERT INTO `critique` VALUES (6,5,'<p><a href=\"http://localhost:8080/Personal_Blog/\">http://localhost:8080/Personal_Blog/</a></p>','����');

#
# Table structure for table dianjiliang
#

CREATE TABLE `dianjiliang` (
  `Id` int(11) NOT NULL auto_increment,#���������
  `AId` int(11) default NULL,#��������±��
  `ip` varchar(255) default NULL,#�����ip��ַ
  `time` date default NULL,#�����ʱ��
  PRIMARY KEY  (`Id`),
  KEY `AId` (`AId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=gb2312 COMMENT='�������';
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
  `username` varchar(20) NOT NULL default '',#�û���
  `password` varchar(20) default NULL,#����
  `nickname` varchar(20) default NULL,#�ǳ�
  `question` varchar(50) default NULL,#�ܱ�����
  `answer` varchar(50) default NULL,#�ܱ���
  PRIMARY KEY  (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312 COMMENT='�û���';
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
