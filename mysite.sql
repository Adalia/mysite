/*
Navicat MySQL Data Transfer

Source Server         : 本地mysql
Source Server Version : 50720
Source Host           : 127.0.0.1:3306
Source Database       : mysite

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2018-02-24 09:48:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('5', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('8', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can add user', '4', 'add_user');
INSERT INTO `auth_permission` VALUES ('11', 'Can change user', '4', 'change_user');
INSERT INTO `auth_permission` VALUES ('12', 'Can delete user', '4', 'delete_user');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('17', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('19', 'Can add author', '7', 'add_author');
INSERT INTO `auth_permission` VALUES ('20', 'Can change author', '7', 'change_author');
INSERT INTO `auth_permission` VALUES ('21', 'Can delete author', '7', 'delete_author');
INSERT INTO `auth_permission` VALUES ('22', 'Can add blog', '8', 'add_blog');
INSERT INTO `auth_permission` VALUES ('23', 'Can change blog', '8', 'change_blog');
INSERT INTO `auth_permission` VALUES ('24', 'Can delete blog', '8', 'delete_blog');
INSERT INTO `auth_permission` VALUES ('25', 'Can add category', '9', 'add_category');
INSERT INTO `auth_permission` VALUES ('26', 'Can change category', '9', 'change_category');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete category', '9', 'delete_category');
INSERT INTO `auth_permission` VALUES ('28', 'Can add tag', '10', 'add_tag');
INSERT INTO `auth_permission` VALUES ('29', 'Can change tag', '10', 'change_tag');
INSERT INTO `auth_permission` VALUES ('30', 'Can delete tag', '10', 'delete_tag');
INSERT INTO `auth_permission` VALUES ('31', 'Can add choice', '11', 'add_choice');
INSERT INTO `auth_permission` VALUES ('32', 'Can change choice', '11', 'change_choice');
INSERT INTO `auth_permission` VALUES ('33', 'Can delete choice', '11', 'delete_choice');
INSERT INTO `auth_permission` VALUES ('34', 'Can add question', '12', 'add_question');
INSERT INTO `auth_permission` VALUES ('35', 'Can change question', '12', 'change_question');
INSERT INTO `auth_permission` VALUES ('36', 'Can delete question', '12', 'delete_question');
INSERT INTO `auth_permission` VALUES ('37', 'Can add comment', '13', 'add_comment');
INSERT INTO `auth_permission` VALUES ('38', 'Can change comment', '13', 'change_comment');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete comment', '13', 'delete_comment');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES ('1', 'pbkdf2_sha256$100000$XXLNHWYQNjIh$tYSjXgl38AaIct36+HvF8akjwUBqRlhArSsMnxOG5Tc=', '2018-02-11 03:13:24.320507', '1', 'mysite', '', '', '', '1', '1', '2018-02-10 05:06:53.486127');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for blog_author
-- ----------------------------
DROP TABLE IF EXISTS `blog_author`;
CREATE TABLE `blog_author` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `education` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_author
-- ----------------------------

-- ----------------------------
-- Table structure for blog_blog
-- ----------------------------
DROP TABLE IF EXISTS `blog_blog`;
CREATE TABLE `blog_blog` (
  `views` int(11) unsigned NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(70) NOT NULL,
  `content` longtext NOT NULL,
  `excerpt` varchar(100) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `modified_time` datetime(6) NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_blog_author_id_8791af69_fk_auth_user_id` (`author_id`),
  KEY `blog_blog_category_id_c34d5f94_fk_blog_category_id` (`category_id`),
  CONSTRAINT `blog_blog_author_id_8791af69_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `blog_blog_category_id_c34d5f94_fk_blog_category_id` FOREIGN KEY (`category_id`) REFERENCES `blog_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_blog
-- ----------------------------
INSERT INTO `blog_blog` VALUES ('2', '1', 'test', 'testaaaaaaaaaaaaaaaaaaaaaaaaaaaa\r\n333333333333333333333333333\r\ntttttttttttttttttttttttttttt\r\neeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee\r\nssssssssssssssssssssssssssssssssssssssssssss', '无', '2018-02-10 05:09:34.000000', '2018-02-10 05:09:35.000000', '1', '1');
INSERT INTO `blog_blog` VALUES ('0', '2', '11', '111111111111111111111', '', '2018-01-11 05:11:57.000000', '2018-02-10 05:11:58.000000', '1', '1');
INSERT INTO `blog_blog` VALUES ('1', '3', 'python异常', '```\r\n# try...except... 捕获异常\r\ntry:\r\n    print aa\r\nexcept NameError,msg:\r\n    print msg\r\n    \r\n```\r\noutput: \r\nname \'aa\' is not defined\r\n\r\n```\r\n# try...finally... 不管捕获到什么错误，错误是不是发生，finally中的代码都要执行，比如关闭文件、释放锁等\r\nimport time\r\ntry:\r\n    f=file(\'assert.txt\')\r\n    while True:\r\n        line=f.readline()\r\n        if len(line)==0:\r\n            break\r\n        time.sleep(2)\r\n        print line\r\nfinally:\r\n    f.close()\r\n    print \'Cleaning up...closed the file\'\r\n```\r\n备注：在上述代码执行过程中，中断程序运行\r\n\r\n\r\n```python\r\n# 使用raise跑出异常\r\n# coding:utf-8\r\nfilename=raw_input(\'please input file name:\')\r\n\r\nif filename==\'hello\':\r\n    raise NameError(\'input error\')\r\n```\r\n\r\npython 异常类型：\r\n\r\n异常             | 描述\r\n-----------------|-------------------------------------------\r\nAssertionError   | assert语句失败             \r\nAttributeError   | 试图访问一个对象没有的属性\r\nIOError          |输入输出异常，基本是无法打开文件\r\nImportError      |无法引入模块或包，基本是路径的问题\r\nIndentationError |语法错误，代码没有正确的对其\r\nIndexError       |下表索引超出序列边界\r\nKeyError         |试图访问字典里不存在的键\r\nKeyboardInterrupt|Ctrl+C\r\nNameError        |使用一个还未赋予对象的变量\r\nSyntaxError      |Python代码逻辑语法错误，不能执行\r\nTypeError        |传入的对象类型与要求不符\r\nUnboundLocalError|试图访问一个还未设置的全局变量，基本上是有与另有一个同名的全局变量，导致你以为在访问\r\nValueError       |传入一个不被期望的值，即使类型正确', '', '2018-02-10 06:01:08.000000', '2018-02-10 06:01:09.000000', '1', '1');
INSERT INTO `blog_blog` VALUES ('23', '4', '测试摘要', '####记录一下常用的方法，详情看代码吧\r\n```\r\n# try...except... 捕获异常\r\ntry:\r\n    print aa\r\nexcept NameError,msg:\r\n    print msg\r\n    \r\n```\r\noutput: \r\nname \'aa\' is not defined\r\n\r\n```\r\n# try...finally... 不管捕获到什么错误，错误是不是发生，finally中的代码都要执行，比如关闭文件、释放锁等\r\nimport time\r\ntry:\r\n    f=file(\'assert.txt\')\r\n    while True:\r\n        line=f.readline()\r\n        if len(line)==0:\r\n            break\r\n        time.sleep(2)\r\n        print line\r\nfinally:\r\n    f.close()\r\n    print \'Cleaning up...closed the file\'\r\n```\r\n备注：在上述代码执行过程中，中断程序运行\r\n\r\n\r\n```python\r\n# 使用raise跑出异常\r\n# coding:utf-8\r\nfilename=raw_input(\'please input file name:\')\r\n\r\nif filename==\'hello\':\r\n    raise NameError(\'input error\')\r\n```\r\n\r\npython 异常类型：\r\n\r\n异常             | 描述\r\n-----------------|-------------------------------------------\r\nAssertionError   | assert语句失败             \r\nAttributeError   | 试图访问一个对象没有的属性\r\nIOError          |输入输出异常，基本是无法打开文件\r\nImportError      |无法引入模块或包，基本是路径的问题\r\nIndentationError |语法错误，代码没有正确的对其\r\nIndexError       |下表索引超出序列边界\r\nKeyError         |试图访问字典里不存在的键\r\nKeyboardInterrupt|Ctrl+C\r\nNameError        |使用一个还未赋予对象的变量\r\nSyntaxError      |Python代码逻辑语法错误，不能执行\r\nTypeError        |传入的对象类型与要求不符\r\nUnboundLocalError|试图访问一个还未设置的全局变量，基本上是有与另有一个同名的全局变量，导致你以为在访问\r\nValueError       |传入一个不被期望的值，即使类型正确', '记录一下常用的方法，详情看代码吧\n# try...except... 捕获异常\ntry:\n    print', '2018-02-11 13:32:04.000000', '2018-02-11 13:32:05.000000', '1', '2');
INSERT INTO `blog_blog` VALUES ('33', '5', '安装python', '###Window操作系统\r\n\r\n - 下载所需要的python版本，以python3.6为例 [下载地址](https://www.python.org/downloads/)，下载Windows x86-64 executable installer\r\n - 执行下载的exe文件，可以自定义安装，选择安装目录、是否写入环境变量等。我下载的是```python-3.6.4.exe```\r\n	 ![这里写图片描述](http://img.blog.csdn.net/20180125112910505?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQveGluZ2Z1X3hpYW9ndWFp/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)\r\n	![这里写图片描述](http://img.blog.csdn.net/20180125112647881?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQveGluZ2Z1X3hpYW9ndWFp/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)\r\n - 添加环境变量\r\n	如果选择了默认安装，没有选择安装目录也没有设置环境变量，那么就需要我们手动添加了。\r\n	Python默认安装在：```C:\\Users\\computername\\AppData\\Local\\Programs\\Python\\Python36-32```\r\n	\r\n	右击“计算机”->属性->高级系统设置->环境变量->系统环境变量\r\n	双击path变量添加如下变量：\r\n	```C:\\Users\\Lihaihui\\AppData\\Local\\Programs\\Python\\Python36-32\\Scripts;```\r\n	```C:\\Users\\Lihaihui\\AppData\\Local\\Programs\\Python\\Python36-32;```\r\n	这样就可以将python和pip命令添加到环境变量中了，**重新**打开cmd，执行python和pip，系统不会在提示【\'xxx\' 不是内部或外部命令，也不是可运行的程序或批处理文件。】啦！\r\n	\r\n	python成功安装。\r\n	\r\n###Linux操作系统\r\nlinux中自带python，为了不影响系统的功能，我们不要动系统自带的python，重新安装一个版本。以安装python3.6为例。\r\n1.下载[python3.6](https://www.python.org/downloads/release/python-364/)可以在[官网下载地址](https://www.python.org/downloads/release/python-364/)上下载源码进行安装。\r\n\r\n![这里写图片描述](http://img.blog.csdn.net/20180125231133969?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQveGluZ2Z1X3hpYW9ndWFp/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)\r\n2.找到下载的压缩包（Python-3.6.4.tgz，我下载的是3.6.4版本）进行解压\r\n```linux shell\r\n[root@localhost ~]# cd Downloads/\r\n[root@localhost Downloads]# ls\r\nPython-3.6.4.tgz\r\n[root@localhost Downloads]# tar -xxvf Python-3.6.4.tgz\r\n[root@localhost Downloads]# ls\r\nPython-3.6.4  Python-3.6.4.tgz\r\n```\r\n3.开始安装\r\n```\r\n[root@localhost Downloads]# cd Python-3.6.4\r\n[root@localhost Downloads]# mkdir /usr/local/python36\r\n[root@localhost Python-3.6.4]# ./configure --prefix=/usr/local/python36\r\n[root@localhost Python-3.6.4]# make\r\n[root@localhost Python-3.6.4]# make install\r\n```\r\n4.验证是否成功\r\n```\r\n[root@localhost Python-3.6.4]# cd /usr/local/python36/bin\r\n[root@localhost bin]# ./python3\r\n```\r\n出现下图所示就代表安装成功了。\r\n![python-success](http://img.blog.csdn.net/20180128150106314?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQveGluZ2Z1X3hpYW9ndWFp/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)\r\n如果想在代码中使用python3，需要在脚本的最开始指定python版本，如```#!/usr/local/python36/bin/python3```\r\n5.建立软连接\r\n以上的4步完成后我们已经成功的安装了python，但是当想使用的时候只能进入安装目录使用，或者使用很长的目录指定：\r\n```\r\n[方法1]\r\n[root@localhost ~] # /usr/local/python36/bin/python3\r\n[方法2]\r\n[root@localhost ~]# cd /usr/local/python36/bin/\r\n[root@localhost bin]# ./python3\r\n```\r\n如果我们想在任意目录想直接执行```./python3``` 就可以使用python3，需要建立软连接，命令如下：\r\n```\r\n[root@localhost ~] # ln -s  /usr/local/python36/bin/python3 /usr/bin/python3\r\n```\r\n**安装问题1**：.configure步骤报错，如果系统环境合适，就会在python解压文件夹中生成makefile，否则会报错。下图就是因为环境中缺少依赖，导致出错，用```yum install -y gcc``` 解决问题\r\n![python安装error](http://img.blog.csdn.net/20180128141739036?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQveGluZ2Z1X3hpYW9ndWFp/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)\r\n**安装问题2**：```make install``` 报错**zipimport.ZipImportError: can\'t decompress data; zlib not available**，这种问题一般都是缺少依赖包导致的，我们直接```yum install -y zlib*``` 安装就可以了，然后重新```make & make install```\r\n\r\n**备注1**：```./configure --prefix=/usr/local/python36``` 中的**--prefix** 是用来指定安装目录的。\r\n**备注2**：在linux中编写python要在脚本的首行写上python的解释器路径，这样可以告诉系统到底用哪个版本的python执行此代码。写法如：```#!/usr/bin/python3```\r\n\r\n###Mac操作系统\r\n因为mac系统本来就是unix系统的一种改进，安装方式基本同Linux操作系统的安装方法，下载对应的版本，直接进行安装即可，不再赘述，不需要建立软链接，直接使用python3即可。\r\n**备注** ：MAC自带Python2.7，位于/usr/bin/python中，自己安装的python3.x 位于/usr/local/bin/python3中，所以在命令行运行pip和python指python2的版本，pip3和python3指的是python3版本。\r\n自己安装完Python后会在/Library/Frameworks/Python.framework/Versions/下有版本文件夹\r\n系统的Python在/System/Library/Frameworks/Python.framework/Versions目录下', 'Window操作系统\n\n下载所需要的python版本，以python3.6为例 下载地址，下载Windows', '2018-02-12 10:48:19.175959', '2018-02-12 10:48:19.175959', '1', '2');

-- ----------------------------
-- Table structure for blog_blog_tag
-- ----------------------------
DROP TABLE IF EXISTS `blog_blog_tag`;
CREATE TABLE `blog_blog_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blog_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_blog_tag_blog_id_tag_id_574faa6a_uniq` (`blog_id`,`tag_id`),
  KEY `blog_blog_tag_tag_id_6a5a1786_fk_blog_tag_id` (`tag_id`),
  CONSTRAINT `blog_blog_tag_blog_id_cc8a96d9_fk_blog_blog_id` FOREIGN KEY (`blog_id`) REFERENCES `blog_blog` (`id`),
  CONSTRAINT `blog_blog_tag_tag_id_6a5a1786_fk_blog_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `blog_tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_blog_tag
-- ----------------------------
INSERT INTO `blog_blog_tag` VALUES ('1', '1', '1');
INSERT INTO `blog_blog_tag` VALUES ('2', '2', '1');
INSERT INTO `blog_blog_tag` VALUES ('3', '2', '2');
INSERT INTO `blog_blog_tag` VALUES ('4', '3', '1');
INSERT INTO `blog_blog_tag` VALUES ('5', '3', '2');
INSERT INTO `blog_blog_tag` VALUES ('6', '4', '3');
INSERT INTO `blog_blog_tag` VALUES ('7', '5', '3');

-- ----------------------------
-- Table structure for blog_category
-- ----------------------------
DROP TABLE IF EXISTS `blog_category`;
CREATE TABLE `blog_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryname` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_category
-- ----------------------------
INSERT INTO `blog_category` VALUES ('1', 'test');
INSERT INTO `blog_category` VALUES ('2', 'python');

-- ----------------------------
-- Table structure for blog_comment
-- ----------------------------
DROP TABLE IF EXISTS `blog_comment`;
CREATE TABLE `blog_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `url` varchar(200) NOT NULL,
  `text` longtext NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `post_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_comment_post_id_580e96ef_fk_blog_blog_id` (`post_id`),
  CONSTRAINT `blog_comment_post_id_580e96ef_fk_blog_blog_id` FOREIGN KEY (`post_id`) REFERENCES `blog_blog` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_comment
-- ----------------------------
INSERT INTO `blog_comment` VALUES ('1', '12', '12222222@163.com', '', '222222222', '2018-02-11 16:08:15.297268', '4');
INSERT INTO `blog_comment` VALUES ('2', '12', '12222222@163.com', '', '222222222', '2018-02-11 16:13:54.816900', '4');
INSERT INTO `blog_comment` VALUES ('3', '12', '12222222@163.com', '', '222222222', '2018-02-11 16:14:29.937569', '4');
INSERT INTO `blog_comment` VALUES ('4', '12', '12222222@163.com', '', '222222222', '2018-02-11 16:15:45.931370', '4');
INSERT INTO `blog_comment` VALUES ('5', '222222222', '23333333@11.com', '', 'ddd', '2018-02-11 16:49:31.887573', '4');
INSERT INTO `blog_comment` VALUES ('6', '222222222', '23333333@11.com', '', 'ddd', '2018-02-11 16:50:46.878771', '4');

-- ----------------------------
-- Table structure for blog_tag
-- ----------------------------
DROP TABLE IF EXISTS `blog_tag`;
CREATE TABLE `blog_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tagname` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_tag
-- ----------------------------
INSERT INTO `blog_tag` VALUES ('1', 'test');
INSERT INTO `blog_tag` VALUES ('2', 'test1');
INSERT INTO `blog_tag` VALUES ('3', 'python');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES ('1', '2018-02-10 05:08:56.996652', '1', 'Tag object (1)', '1', '[{\"added\": {}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('2', '2018-02-10 05:09:17.482143', '1', 'Category object (1)', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('3', '2018-02-10 05:09:37.258544', '1', 'Blog object (1)', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('4', '2018-02-10 05:10:06.738652', '1', 'Tag object (1)', '2', '[]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('5', '2018-02-10 05:11:24.261839', '2', 'Tag object (2)', '1', '[{\"added\": {}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('6', '2018-02-10 05:12:37.450545', '2', 'Blog object (2)', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('7', '2018-02-10 06:01:20.565831', '3', 'Blog object (3)', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('8', '2018-02-10 08:06:22.068228', '3', 'Blog object (3)', '2', '[{\"changed\": {\"fields\": [\"title\", \"content\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('9', '2018-02-10 08:11:12.338088', '3', 'Blog object (3)', '2', '[{\"changed\": {\"fields\": [\"content\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('10', '2018-02-11 03:19:22.231610', '2', 'Blog object (2)', '2', '[{\"changed\": {\"fields\": [\"created_time\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('11', '2018-02-11 13:31:50.475165', '3', 'Tag object (3)', '1', '[{\"added\": {}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('12', '2018-02-11 13:31:59.710108', '2', 'Category object (2)', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('13', '2018-02-11 13:32:07.488903', '4', 'Blog object (4)', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('14', '2018-02-12 10:48:19.207961', '5', '安装python', '1', '[{\"added\": {}}]', '8', '1');

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('7', 'blog', 'author');
INSERT INTO `django_content_type` VALUES ('8', 'blog', 'blog');
INSERT INTO `django_content_type` VALUES ('9', 'blog', 'category');
INSERT INTO `django_content_type` VALUES ('13', 'blog', 'comment');
INSERT INTO `django_content_type` VALUES ('10', 'blog', 'tag');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('11', 'polls', 'choice');
INSERT INTO `django_content_type` VALUES ('12', 'polls', 'question');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2018-02-10 03:18:06.211620');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2018-02-10 03:18:59.417663');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2018-02-10 03:19:12.097388');
INSERT INTO `django_migrations` VALUES ('4', 'admin', '0002_logentry_remove_auto_add', '2018-02-10 03:19:12.498411');
INSERT INTO `django_migrations` VALUES ('5', 'contenttypes', '0002_remove_content_type_name', '2018-02-10 03:19:21.072902');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0002_alter_permission_name_max_length', '2018-02-10 03:19:25.471153');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0003_alter_user_email_max_length', '2018-02-10 03:19:29.673394');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0004_alter_user_username_opts', '2018-02-10 03:19:29.947409');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0005_alter_user_last_login_null', '2018-02-10 03:19:32.839575');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0006_require_contenttypes_0002', '2018-02-10 03:19:33.166593');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0007_alter_validators_add_error_messages', '2018-02-10 03:19:33.387606');
INSERT INTO `django_migrations` VALUES ('12', 'auth', '0008_alter_user_username_max_length', '2018-02-10 03:19:45.403293');
INSERT INTO `django_migrations` VALUES ('13', 'auth', '0009_alter_user_last_name_max_length', '2018-02-10 03:19:51.742656');
INSERT INTO `django_migrations` VALUES ('14', 'blog', '0001_initial', '2018-02-10 03:20:19.274231');
INSERT INTO `django_migrations` VALUES ('15', 'polls', '0001_initial', '2018-02-10 03:20:19.534245');
INSERT INTO `django_migrations` VALUES ('16', 'polls', '0002_auto_20180209_1448', '2018-02-10 03:20:19.698255');
INSERT INTO `django_migrations` VALUES ('17', 'polls', '0003_auto_20180209_1507', '2018-02-10 03:20:19.751258');
INSERT INTO `django_migrations` VALUES ('18', 'sessions', '0001_initial', '2018-02-10 03:20:20.850321');
INSERT INTO `django_migrations` VALUES ('19', 'blog', '0002_auto_20180211_1507', '2018-02-11 15:07:50.632358');
INSERT INTO `django_migrations` VALUES ('20', 'blog', '0003_comment', '2018-02-11 15:25:29.813526');
INSERT INTO `django_migrations` VALUES ('21', 'blog', '0004_auto_20180211_1527', '2018-02-11 15:27:41.946760');
INSERT INTO `django_migrations` VALUES ('22', 'blog', '0005_auto_20180211_1652', '2018-02-11 16:52:49.817733');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('l1cx0174lrbyqd0acmfzfmp2ysjrsb93', 'Y2RlNmM4NThjYzNjYWZiOWFhYjY0OTJhNjRmODA4Y2UzOGU1ZDdhZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxOWRjNWJjYzk2MjY1NWQwMDU2M2Q4MDk1ZjVlOTc2MWMyOTBlOGQ3In0=', '2018-02-25 03:13:24.424520');
INSERT INTO `django_session` VALUES ('rr7sj9qj4hzpsvv1a1yr7hvfahv0s2al', 'MWIyOTIxYjAxN2JlZjcxMGY1MDc1NTM3YjUxOTFiYjNkZDE3ODc2ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZDQ4YzYyMjAzNGViYmJiNjE0OTJhNDJiZjZkOTNmMDk4ZTI4MWM1In0=', '2018-02-24 05:07:00.101905');
