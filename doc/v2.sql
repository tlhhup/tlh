/*
Navicat MySQL Data Transfer

Source Server         : Mysql
Source Server Version : 50615
Source Host           : 127.0.0.1:3306
Source Database       : v2

Target Server Type    : MYSQL
Target Server Version : 50615
File Encoding         : 65001

Date: 2016-03-05 17:06:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_department
-- ----------------------------
DROP TABLE IF EXISTS `sys_department`;
CREATE TABLE `sys_department` (
  `id` varchar(40) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_department
-- ----------------------------
INSERT INTO `sys_department` VALUES ('5365c1c8-ebd8-4ead-9fe9-8840ebeb548d', '教研部', '教学研发部门，非常重要！');
INSERT INTO `sys_department` VALUES ('84a9692a-3732-4cf4-bdd7-dd3b9598aa25', '招生部', '招生部门，非常重要！');

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `data_field` varchar(100) DEFAULT NULL COMMENT '字段名称',
  `data_value` varchar(100) DEFAULT NULL COMMENT '字段值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据字典';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logs
-- ----------------------------
DROP TABLE IF EXISTS `sys_logs`;
CREATE TABLE `sys_logs` (
  `id` varchar(50) NOT NULL,
  `operator` varchar(100) DEFAULT NULL,
  `opertime` datetime DEFAULT NULL,
  `opername` varchar(100) DEFAULT NULL,
  `operparams` varchar(500) DEFAULT NULL,
  `operresult` varchar(50) DEFAULT NULL,
  `resultmsg` varchar(500) DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL COMMENT 'ip地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_logs
-- ----------------------------
INSERT INTO `sys_logs` VALUES ('06a3e953-8854-11e5-a328-dc0ea115d421', '胡平', '2015-11-11 17:10:17', 'saveEntity', 'Menu{serialVersionUID:1,id:null,title:删除角色,url:,sort:0,serials:0,icon:,rightPos:0,rightCode:0,pId:9,isButton:false}', 'success', 'true', null);
INSERT INTO `sys_logs` VALUES ('23e70ddd-8d35-11e5-aada-dc0ea115d421', null, '2015-11-17 22:11:47', null, null, 'failure', 'No thread-bound request found: Are you referring to request attributes outside of an actual web request, or processing a request outside of the originally receiving thread? If you are actually operating within a web request and still receive this message, your code is probably running outside of DispatcherServlet/DispatcherPortlet: In this case, use RequestContextListener or RequestContextFilter to expose the current request.', null);
INSERT INTO `sys_logs` VALUES ('256f1ffd-8880-11e5-9f55-dc0ea115d421', '', '2015-11-11 22:26:06', 'updateLoginInfo', 'User{serialVersionUID:1,id:1,userName:admin,password:21232f297a57a5a743894a0e4a801fc3,loginCount:34,realName:胡平,superAdmin:false}', 'success', 'true', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_logs` VALUES ('268bea23-8876-11e5-9f55-dc0ea115d421', '', '2015-11-11 21:14:33', 'updateLoginInfo', 'User{serialVersionUID:1,id:1,userName:admin,password:21232f297a57a5a743894a0e4a801fc3,loginCount:29,realName:胡平,superAdmin:false}', 'success', 'true', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_logs` VALUES ('26b020a2-8874-11e5-9f55-dc0ea115d421', '', '2015-11-11 21:00:15', 'updateLoginInfo', 'User{serialVersionUID:1,id:1,userName:admin,password:21232f297a57a5a743894a0e4a801fc3,loginCount:26,realName:胡平,superAdmin:false}', 'success', 'true', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_logs` VALUES ('2981175a-e1ba-11e5-a243-dc0ea115d421', '胡平', '2016-03-04 11:35:38', 'deleteEntity', 'Menu{serialVersionUID:1,id:4,title:null,url:null,sort:0,serials:0,icon:null,rightPos:0,rightCode:0,pId:null,isButton:false}', 'success', 'true', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_logs` VALUES ('2b273d6e-e1ba-11e5-a243-dc0ea115d421', '胡平', '2016-03-04 11:35:40', 'deleteEntity', 'Menu{serialVersionUID:1,id:5,title:null,url:null,sort:0,serials:0,icon:null,rightPos:0,rightCode:0,pId:null,isButton:false}', 'success', 'true', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_logs` VALUES ('2c7bfa01-e1ba-11e5-a243-dc0ea115d421', '胡平', '2016-03-04 11:35:43', 'deleteEntity', 'Menu{serialVersionUID:1,id:6,title:null,url:null,sort:0,serials:0,icon:null,rightPos:0,rightCode:0,pId:null,isButton:false}', 'success', 'true', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_logs` VALUES ('2dbac40d-e1ba-11e5-a243-dc0ea115d421', '胡平', '2016-03-04 11:35:45', 'deleteEntity', 'Menu{serialVersionUID:1,id:7,title:null,url:null,sort:0,serials:0,icon:null,rightPos:0,rightCode:0,pId:null,isButton:false}', 'success', 'true', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_logs` VALUES ('2e64673b-e2b1-11e5-afd6-dc0ea115d421', '', '2016-03-05 17:03:52', 'updateLoginInfo', 'User{serialVersionUID:1,id:1,userName:admin,password:21232f297a57a5a743894a0e4a801fc3,loginCount:39,realName:胡平,superAdmin:false}', 'success', 'true', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_logs` VALUES ('2e9a2008-e1ba-11e5-a243-dc0ea115d421', '胡平', '2016-03-04 11:35:46', 'deleteEntity', 'Menu{serialVersionUID:1,id:8,title:null,url:null,sort:0,serials:0,icon:null,rightPos:0,rightCode:0,pId:null,isButton:false}', 'success', 'true', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_logs` VALUES ('2fed645f-e1ba-11e5-a243-dc0ea115d421', '胡平', '2016-03-04 11:35:48', 'deleteEntity', 'Menu{serialVersionUID:1,id:9,title:null,url:null,sort:0,serials:0,icon:null,rightPos:0,rightCode:0,pId:null,isButton:false}', 'success', 'true', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_logs` VALUES ('4171bef0-8f63-11e5-8eb9-dc0ea115d421', '', '2015-11-20 16:46:56', 'updateLoginInfo', 'User{serialVersionUID:1,id:1,userName:admin,password:21232f297a57a5a743894a0e4a801fc3,loginCount:37,realName:胡平,superAdmin:false}', 'success', 'true', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_logs` VALUES ('4b538545-88ec-11e5-891d-dc0ea115d421', '', '2015-11-12 11:20:16', 'updateLoginInfo', 'User{serialVersionUID:1,id:1,userName:admin,password:21232f297a57a5a743894a0e4a801fc3,loginCount:35,realName:胡平,superAdmin:false}', 'success', 'true', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_logs` VALUES ('4dbec023-8d34-11e5-aada-dc0ea115d421', null, '2015-11-17 22:05:48', null, null, 'failure', 'No thread-bound request found: Are you referring to request attributes outside of an actual web request, or processing a request outside of the originally receiving thread? If you are actually operating within a web request and still receive this message, your code is probably running outside of DispatcherServlet/DispatcherPortlet: In this case, use RequestContextListener or RequestContextFilter to expose the current request.', null);
INSERT INTO `sys_logs` VALUES ('550131bd-8867-11e5-9f55-dc0ea115d421', '', '2015-11-11 19:28:29', 'updateLoginInfo', 'User{serialVersionUID:1,id:1,userName:admin,password:21232f297a57a5a743894a0e4a801fc3,loginCount:24,realName:胡平,superAdmin:false}', 'success', 'true', null);
INSERT INTO `sys_logs` VALUES ('5fe31210-8867-11e5-9f55-dc0ea115d421', '胡平', '2015-11-11 19:28:47', 'deleteEntity', 'Menu{serialVersionUID:1,id:66,title:null,url:null,sort:0,serials:0,icon:null,rightPos:0,rightCode:0,pId:null,isButton:false}', 'success', 'true', null);
INSERT INTO `sys_logs` VALUES ('7e4f9aae-8867-11e5-9f55-dc0ea115d421', '胡平', '2015-11-11 19:29:38', 'saveEntity', 'Menu{serialVersionUID:1,id:null,title:日志管理,url:web/logAction/index.do,sort:0,serials:0,icon:,rightPos:0,rightCode:0,pId:3,isButton:false}', 'success', 'true', null);
INSERT INTO `sys_logs` VALUES ('7e70c275-884f-11e5-a328-dc0ea115d421', null, '2015-11-11 16:37:51', null, null, 'failure', 'No thread-bound request found: Are you referring to request attributes outside of an actual web request, or processing a request outside of the originally receiving thread? If you are actually operating within a web request and still receive this message, your code is probably running outside of DispatcherServlet/DispatcherPortlet: In this case, use RequestContextListener or RequestContextFilter to expose the current request.', null);
INSERT INTO `sys_logs` VALUES ('8afcbf5c-8867-11e5-9f55-dc0ea115d421', '胡平', '2015-11-11 19:29:59', 'updateEntity', 'Menu{serialVersionUID:1,id:67,title:日志管理,url:web/logAction/index.do,sort:0,serials:0,icon:,rightPos:0,rightCode:0,pId:62,isButton:false}', 'success', 'true', null);
INSERT INTO `sys_logs` VALUES ('8d5b82e8-8875-11e5-9f55-dc0ea115d421', '', '2015-11-11 21:10:16', 'updateLoginInfo', 'User{serialVersionUID:1,id:1,userName:admin,password:21232f297a57a5a743894a0e4a801fc3,loginCount:28,realName:胡平,superAdmin:false}', 'success', 'true', null);
INSERT INTO `sys_logs` VALUES ('a7d2c61b-887b-11e5-9f55-dc0ea115d421', '', '2015-11-11 21:53:58', 'updateLoginInfo', 'User{serialVersionUID:1,id:1,userName:admin,password:21232f297a57a5a743894a0e4a801fc3,loginCount:33,realName:胡平,superAdmin:false}', 'success', 'true', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_logs` VALUES ('b0d5acfc-887b-11e5-9f55-dc0ea115d421', '胡平', '2015-11-11 21:54:13', 'deleteEntity', 'Menu{serialVersionUID:1,id:69,title:null,url:null,sort:0,serials:0,icon:null,rightPos:0,rightCode:0,pId:null,isButton:false}', 'success', 'true', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_logs` VALUES ('bcade715-8868-11e5-9f55-dc0ea115d421', '', '2015-11-11 19:38:32', 'updateLoginInfo', 'User{serialVersionUID:1,id:1,userName:admin,password:21232f297a57a5a743894a0e4a801fc3,loginCount:25,realName:胡平,superAdmin:false}', 'success', 'true', null);
INSERT INTO `sys_logs` VALUES ('bdc426ae-8874-11e5-9f55-dc0ea115d421', '', '2015-11-11 21:04:28', 'updateLoginInfo', 'User{serialVersionUID:1,id:1,userName:admin,password:21232f297a57a5a743894a0e4a801fc3,loginCount:27,realName:胡平,superAdmin:false}', 'success', 'true', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_logs` VALUES ('c2b30039-8877-11e5-9f55-dc0ea115d421', '', '2015-11-11 21:26:05', 'updateLoginInfo', 'User{serialVersionUID:1,id:1,userName:admin,password:21232f297a57a5a743894a0e4a801fc3,loginCount:31,realName:胡平,superAdmin:false}', 'success', 'true', '192.168.110.154');
INSERT INTO `sys_logs` VALUES ('c4fec38f-887a-11e5-9f55-dc0ea115d421', '', '2015-11-11 21:47:37', 'updateLoginInfo', 'User{serialVersionUID:1,id:1,userName:admin,password:21232f297a57a5a743894a0e4a801fc3,loginCount:32,realName:胡平,superAdmin:false}', 'success', 'true', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_logs` VALUES ('cd5a9d3b-8852-11e5-a328-dc0ea115d421', null, '2015-11-11 17:01:31', null, null, 'failure', 'No thread-bound request found: Are you referring to request attributes outside of an actual web request, or processing a request outside of the originally receiving thread? If you are actually operating within a web request and still receive this message, your code is probably running outside of DispatcherServlet/DispatcherPortlet: In this case, use RequestContextListener or RequestContextFilter to expose the current request.', null);
INSERT INTO `sys_logs` VALUES ('d13020b2-8853-11e5-a328-dc0ea115d421', '用户注册！', '2015-11-11 17:08:47', 'updateLoginInfo', 'User{serialVersionUID:1,id:1,userName:admin,password:21232f297a57a5a743894a0e4a801fc3,loginCount:23,realName:胡平,superAdmin:false}', 'success', 'true', null);
INSERT INTO `sys_logs` VALUES ('db23f39d-887a-11e5-9f55-dc0ea115d421', '胡平', '2015-11-11 21:48:14', 'saveEntity', 'Menu{serialVersionUID:1,id:null,title:fasdfad,url:,sort:0,serials:0,icon:,rightPos:0,rightCode:0,pId:9,isButton:false}', 'success', 'true', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_logs` VALUES ('dc7e9269-8876-11e5-9f55-dc0ea115d421', '', '2015-11-11 21:19:39', 'updateLoginInfo', 'User{serialVersionUID:1,id:1,userName:admin,password:21232f297a57a5a743894a0e4a801fc3,loginCount:30,realName:胡平,superAdmin:false}', 'success', 'true', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_logs` VALUES ('e35781b1-8a87-11e5-960e-dc0ea115d421', '', '2015-11-14 12:26:34', 'updateLoginInfo', 'User{serialVersionUID:1,id:1,userName:admin,password:21232f297a57a5a743894a0e4a801fc3,loginCount:36,realName:胡平,superAdmin:false}', 'success', 'true', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_logs` VALUES ('e3b956fe-e1b9-11e5-a243-dc0ea115d421', '', '2016-03-04 11:33:41', 'updateLoginInfo', 'User{serialVersionUID:1,id:1,userName:admin,password:21232f297a57a5a743894a0e4a801fc3,loginCount:38,realName:胡平,superAdmin:false}', 'success', 'true', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_logs` VALUES ('f92be332-8867-11e5-9f55-dc0ea115d421', '胡平', '2015-11-11 19:33:04', 'saveEntity', 'Menu{serialVersionUID:1,id:null,title:客户端管理,url:web/clientAction/index.do,sort:0,serials:0,icon:,rightPos:0,rightCode:0,pId:62,isButton:false}', 'success', 'true', null);

-- ----------------------------
-- Table structure for sys_menus
-- ----------------------------
DROP TABLE IF EXISTS `sys_menus`;
CREATE TABLE `sys_menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '名称',
  `url` varchar(255) DEFAULT NULL COMMENT '地址',
  `pId` int(11) DEFAULT NULL COMMENT '父级菜单',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `serials` int(11) DEFAULT NULL COMMENT '层级',
  `rightPos` int(11) DEFAULT NULL COMMENT '权限位',
  `rightCode` bigint(60) DEFAULT NULL COMMENT '权限码',
  `icon` varchar(50) DEFAULT NULL,
  `isButton` tinyint(4) DEFAULT '0' COMMENT '是否是按钮',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menus
-- ----------------------------
INSERT INTO `sys_menus` VALUES ('3', '系统设置', '#3', null, '0', '0', '0', '1', null, '0');
INSERT INTO `sys_menus` VALUES ('10', '菜单管理', 'web/menuAction/index.do', '62', '0', '2', '0', '128', null, '0');
INSERT INTO `sys_menus` VALUES ('12', '角色管理', 'web/roleAction/index.do', '62', '1', '2', '0', '256', '', '0');
INSERT INTO `sys_menus` VALUES ('46', '添加菜单', 'web/menuAction/add.do', '10', '0', '3', '0', '512', '', '1');
INSERT INTO `sys_menus` VALUES ('47', '修改菜单', 'web/menuAction/update.do', '10', '1', '3', '0', '1024', '', '1');
INSERT INTO `sys_menus` VALUES ('48', '删除菜单', 'web/menuAction/delete.do', '10', '2', '3', '0', '2048', '', '1');
INSERT INTO `sys_menus` VALUES ('49', '添加角色', 'web/roleAction/add.do', '12', '0', '3', '0', '4096', '', '1');
INSERT INTO `sys_menus` VALUES ('50', '修改角色', 'web/roleAction/update.do', '12', '1', '3', '0', '8192', '', '1');
INSERT INTO `sys_menus` VALUES ('51', '删除角色', 'web/roleAction/delete.do', '12', '2', '3', '0', '16384', '', '1');
INSERT INTO `sys_menus` VALUES ('52', '角色授权', 'web/menuAction/authorRights.do', '12', '3', '3', '0', '32768', '', '1');
INSERT INTO `sys_menus` VALUES ('53', '用户管理', 'web/userAction/index.do', '62', '2', '2', '0', '65536', '', '0');
INSERT INTO `sys_menus` VALUES ('54', '重置密码', 'web/userAction/restPassword.do', '53', '0', '3', '0', '131072', '', '1');
INSERT INTO `sys_menus` VALUES ('55', '用户授权', 'web/roleAction/authorization.do', '53', '1', '3', '0', '262144', '', '1');
INSERT INTO `sys_menus` VALUES ('62', '系统设置', '#62', '3', '0', '1', '0', '524288', '', '0');
INSERT INTO `sys_menus` VALUES ('63', '个人中心', '#63', '3', '1', '1', '0', '1048576', '', '0');
INSERT INTO `sys_menus` VALUES ('64', '修改个人资料', 'web/userAction/edit.do', '63', '1', '2', '0', '2097152', '', '0');
INSERT INTO `sys_menus` VALUES ('65', '修改密码', 'web/userAction/modifyPwd.do', '63', '1', '2', '0', '4194304', '', '0');
INSERT INTO `sys_menus` VALUES ('67', '日志管理', 'web/logAction/index.do', '62', '0', '2', '0', '8388608', '', '0');
INSERT INTO `sys_menus` VALUES ('68', '客户端管理', 'web/clientAction/index.do', '62', '0', '2', '0', '16777216', '', '0');

-- ----------------------------
-- Table structure for sys_roles
-- ----------------------------
DROP TABLE IF EXISTS `sys_roles`;
CREATE TABLE `sys_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(100) DEFAULT NULL,
  `roleDesc` varchar(100) DEFAULT NULL,
  `roleValue` varchar(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_roles
-- ----------------------------
INSERT INTO `sys_roles` VALUES ('1', '超级用户', '拥有所有权限', '-1');
INSERT INTO `sys_roles` VALUES ('4', '一般用户', '部分权限', '0');

-- ----------------------------
-- Table structure for sys_role_right_link
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_right_link`;
CREATE TABLE `sys_role_right_link` (
  `roleId` int(11) NOT NULL,
  `rightId` int(11) NOT NULL,
  PRIMARY KEY (`roleId`,`rightId`),
  KEY `FK_cdwas2fcy10389ftrc990a9e9` (`rightId`) USING BTREE,
  CONSTRAINT `sys_role_right_link_ibfk_1` FOREIGN KEY (`rightId`) REFERENCES `sys_menus` (`id`),
  CONSTRAINT `sys_role_right_link_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `sys_roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_right_link
-- ----------------------------
INSERT INTO `sys_role_right_link` VALUES ('1', '3');
INSERT INTO `sys_role_right_link` VALUES ('4', '3');
INSERT INTO `sys_role_right_link` VALUES ('1', '10');
INSERT INTO `sys_role_right_link` VALUES ('1', '12');
INSERT INTO `sys_role_right_link` VALUES ('1', '46');
INSERT INTO `sys_role_right_link` VALUES ('1', '47');
INSERT INTO `sys_role_right_link` VALUES ('1', '48');
INSERT INTO `sys_role_right_link` VALUES ('1', '49');
INSERT INTO `sys_role_right_link` VALUES ('1', '50');
INSERT INTO `sys_role_right_link` VALUES ('1', '51');
INSERT INTO `sys_role_right_link` VALUES ('1', '52');
INSERT INTO `sys_role_right_link` VALUES ('1', '53');
INSERT INTO `sys_role_right_link` VALUES ('1', '54');
INSERT INTO `sys_role_right_link` VALUES ('1', '55');
INSERT INTO `sys_role_right_link` VALUES ('1', '62');
INSERT INTO `sys_role_right_link` VALUES ('1', '63');
INSERT INTO `sys_role_right_link` VALUES ('4', '63');
INSERT INTO `sys_role_right_link` VALUES ('1', '64');
INSERT INTO `sys_role_right_link` VALUES ('4', '64');
INSERT INTO `sys_role_right_link` VALUES ('1', '65');
INSERT INTO `sys_role_right_link` VALUES ('4', '65');

-- ----------------------------
-- Table structure for sys_users
-- ----------------------------
DROP TABLE IF EXISTS `sys_users`;
CREATE TABLE `sys_users` (
  `id` int(11) NOT NULL,
  `userName` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `registTime` datetime DEFAULT NULL,
  `lastLogin` datetime DEFAULT NULL,
  `loginCount` int(11) DEFAULT '0',
  `realName` varchar(50) DEFAULT NULL COMMENT '真实姓名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_users
-- ----------------------------
INSERT INTO `sys_users` VALUES ('1', 'admin', '21232f297a57a5a743894a0e4a801fc3', '2015-10-23 20:40:18', '2016-03-05 17:03:51', '40', '胡平');
INSERT INTO `sys_users` VALUES ('2', 'fasdf', '96e79218965eb72c92a549dd5a330112', null, '2015-11-11 11:45:02', '8', null);

-- ----------------------------
-- Table structure for sys_user_role_link
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role_link`;
CREATE TABLE `sys_user_role_link` (
  `uid` int(11) NOT NULL,
  `rid` int(11) NOT NULL,
  PRIMARY KEY (`uid`,`rid`),
  KEY `FK_nnx4pixfr0swjnpbnvkrprcbm` (`rid`) USING BTREE,
  CONSTRAINT `sys_user_role_link_ibfk_1` FOREIGN KEY (`rid`) REFERENCES `sys_roles` (`id`),
  CONSTRAINT `sys_user_role_link_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `sys_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_role_link
-- ----------------------------
INSERT INTO `sys_user_role_link` VALUES ('1', '1');
INSERT INTO `sys_user_role_link` VALUES ('2', '4');
