/*
 Navicat Premium Data Transfer

 Source Server         : Local
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : pipro

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 27/04/2023 23:30:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for pi_authority
-- ----------------------------
DROP TABLE IF EXISTS `pi_authority`;
CREATE TABLE `pi_authority`  (
  `authority_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '权限标识',
  `authority_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '权限名',
  `authority_introduction` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '权限介绍',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`authority_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '权限' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pi_authority
-- ----------------------------
INSERT INTO `pi_authority` VALUES (1, 'DEFAULT', '默认用户权限', '2023-04-23 08:22:54');
INSERT INTO `pi_authority` VALUES (2, 'ADMIN', '管理员权限', '2023-04-23 08:22:54');
INSERT INTO `pi_authority` VALUES (3, 'PROJECT_ADMIN', '项目管理员', '2023-04-23 08:22:54');

-- ----------------------------
-- Table structure for pi_document
-- ----------------------------
DROP TABLE IF EXISTS `pi_document`;
CREATE TABLE `pi_document`  (
  `document_id` varchar(33) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '文档标识',
  `document_directory_id` int(11) NULL DEFAULT NULL COMMENT '文档目录标识',
  `file_status` int(11) NULL DEFAULT NULL COMMENT '文档状态',
  `document_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '文档标题',
  `document_content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT '文档内容',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`document_id`) USING BTREE,
  INDEX `FK_pi_document_detail`(`document_directory_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '文档' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pi_document
-- ----------------------------

-- ----------------------------
-- Table structure for pi_document_directory
-- ----------------------------
DROP TABLE IF EXISTS `pi_document_directory`;
CREATE TABLE `pi_document_directory`  (
  `document_directory_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文档目录标识',
  `project_id` int(11) NULL DEFAULT NULL COMMENT '项目标识',
  `parent_id` int(11) NULL DEFAULT NULL COMMENT '父文件目录',
  `file_directory_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '文件目录名',
  `file_document_status` int(11) NULL DEFAULT 0 COMMENT '文件状态',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`document_directory_id`) USING BTREE,
  INDEX `FK_Reference_23`(`parent_id`) USING BTREE,
  INDEX `FK_pi_project_document_directory`(`project_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '文档目录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pi_document_directory
-- ----------------------------

-- ----------------------------
-- Table structure for pi_document_edit_log
-- ----------------------------
DROP TABLE IF EXISTS `pi_document_edit_log`;
CREATE TABLE `pi_document_edit_log`  (
  `doc_log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文档日志',
  `document_id` int(11) NULL DEFAULT NULL COMMENT '文档标识',
  `doc_log_context` varchar(512) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '文档日志内容',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`doc_log_id`) USING BTREE,
  INDEX `FK_Reference_24`(`document_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '文档操作日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pi_document_edit_log
-- ----------------------------

-- ----------------------------
-- Table structure for pi_file
-- ----------------------------
DROP TABLE IF EXISTS `pi_file`;
CREATE TABLE `pi_file`  (
  `file_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文档标识',
  `member_id` int(11) NULL DEFAULT NULL COMMENT '会员标识',
  `file_directory_id` int(11) NULL DEFAULT NULL COMMENT '文件目录标识',
  `file_status` int(11) NULL DEFAULT 0 COMMENT '文件状态',
  `filename` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '文件名',
  `file_path` varchar(512) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '文件路径',
  `update_time` datetime(0) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`file_id`) USING BTREE,
  INDEX `FK_pi_project_file_rela`(`file_directory_id`) USING BTREE,
  INDEX `FK_user_owned_files`(`member_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '文件' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pi_file
-- ----------------------------
INSERT INTO `pi_file` VALUES (1, 3, 1, -1, 'pipro_create_database.sql', '/project_1/2023/04/27/0F6455BB24184F05910BF40A7684BB2D.sql', '2023-04-27 18:28:06', '2023-04-27 18:28:06');
INSERT INTO `pi_file` VALUES (2, 3, 1, 0, '1只因文件.txt', '/project_1/2023/04/27/C57DC84A29544EA0B8CC3A8301AB2452.sql', '2023-04-27 22:47:49', '2023-04-27 18:28:08');
INSERT INTO `pi_file` VALUES (3, 3, 1, 0, 'pipro_create_database1.sql', '/project_1/2023/04/27/C9E9CC592AF849F7BFA025F16E2271BD.sql', '2023-04-27 22:44:20', '2023-04-27 18:28:09');
INSERT INTO `pi_file` VALUES (4, 2, 1, 0, '8021x1.exe', '/project_1/2023/04/27/08B64FE0CC954A46B3134F555668601C.exe', '2023-04-27 22:47:59', '2023-04-27 20:50:09');
INSERT INTO `pi_file` VALUES (5, 2, 1, 0, '8021x.exe', '/project_1/2023/04/27/DABF46E0E11B499695661F393FABFD72.exe', '2023-04-27 20:52:23', '2023-04-27 20:52:23');
INSERT INTO `pi_file` VALUES (6, 2, 1, 0, '8021x.exe', '/project_1/2023/04/27/B6CDCC5675FA4E7AA6960C2C4002A207.exe', '2023-04-27 20:55:14', '2023-04-27 20:55:14');
INSERT INTO `pi_file` VALUES (7, 2, 1, 0, '8021x.exe', '/project_1/2023/04/27/F74D8D2AEF344E81AA5036DADA57F7C6.exe', '2023-04-27 20:57:57', '2023-04-27 20:57:57');
INSERT INTO `pi_file` VALUES (8, 2, 1, 0, '8021x.exe', '/project_1/2023/04/27/71B6642A04F84AECBEF6D09B053908E7.exe', '2023-04-27 21:21:51', '2023-04-27 21:21:51');
INSERT INTO `pi_file` VALUES (9, 2, 1, 0, '8021x.exe', '/project_1/2023/04/27/7A55FCDA462346FCA514E482EB127892.exe', '2023-04-27 21:22:38', '2023-04-27 21:22:38');
INSERT INTO `pi_file` VALUES (10, 2, 1, 0, '8021x.exe', '/project_1/2023/04/27/9DA3BFB6DD0C4EF589B00739D978DA95.exe', '2023-04-27 21:23:08', '2023-04-27 21:23:08');
INSERT INTO `pi_file` VALUES (11, 2, 1, 0, '8021x.exe', '/project_1/2023/04/27/EE5B66E9148147FFA876482146CFDB75.exe', '2023-04-27 21:23:17', '2023-04-27 21:23:17');
INSERT INTO `pi_file` VALUES (12, 2, 1, 0, 'W32N55.dll', '/project_1/2023/04/27/450E6031D3C149439555E97D788EFC6B.dll', '2023-04-27 21:23:53', '2023-04-27 21:23:53');
INSERT INTO `pi_file` VALUES (13, 2, 37, 0, '8021x.exe', '/project_1/2023/04/27/AAE8DA3347824E74AEB73AD339E1A391.exe', '2023-04-27 21:24:12', '2023-04-27 21:24:12');
INSERT INTO `pi_file` VALUES (14, 2, 37, 0, 'W32N55.dll', '/project_1/2023/04/27/2D750EDB22D7471790E09B132416707E.dll', '2023-04-27 21:25:01', '2023-04-27 21:25:01');
INSERT INTO `pi_file` VALUES (15, 2, 37, 0, 'SuConfig.dat', '/project_1/2023/04/27/4485971332674DBB9974EB021065763E.dat', '2023-04-27 21:25:45', '2023-04-27 21:25:45');
INSERT INTO `pi_file` VALUES (16, 2, 37, 0, 'W32N55.dll', '/project_1/2023/04/27/4916C596230A4E8DB76845DC6D3CE8A7.dll', '2023-04-27 21:26:39', '2023-04-27 21:26:39');
INSERT INTO `pi_file` VALUES (17, 2, 37, 0, 'W32N55.dll', '/project_1/2023/04/27/96F040BCF06A479895DC7DD75D1DAF15.dll', '2023-04-27 21:36:05', '2023-04-27 21:36:05');
INSERT INTO `pi_file` VALUES (18, 2, 37, 0, '8021x.exe', '/project_1/2023/04/27/899263813A6F48B8817F575A2A683D4E.exe', '2023-04-27 21:36:12', '2023-04-27 21:36:12');
INSERT INTO `pi_file` VALUES (19, 2, 1, 0, 'W32N55.dll', '/project_1/2023/04/27/EE0CDE45E2834699B500CBF122A4BB2B.dll', '2023-04-27 21:38:02', '2023-04-27 21:38:02');
INSERT INTO `pi_file` VALUES (20, 2, 36, 0, 'SuConfig.dat', '/project_1/2023/04/27/A5D5EEE964B9419EB3F004173062BB1C.dat', '2023-04-27 21:39:32', '2023-04-27 21:39:32');
INSERT INTO `pi_file` VALUES (21, 2, 35, 0, 'SuConfig.dat', '/project_1/2023/04/27/553719C9B9444416B73342A988894F6D.dat', '2023-04-27 21:40:48', '2023-04-27 21:40:48');
INSERT INTO `pi_file` VALUES (22, 2, 36, 0, 'SuConfig.dat', '/project_1/2023/04/27/DC2429EA6C6F4981AF5ED73A3838A442.dat', '2023-04-27 21:40:59', '2023-04-27 21:40:59');
INSERT INTO `pi_file` VALUES (23, 2, 37, 0, '8021x.exe', '/project_1/2023/04/27/6A38C0122F1448058BF48522658D31EA.exe', '2023-04-27 21:43:19', '2023-04-27 21:43:19');
INSERT INTO `pi_file` VALUES (24, 2, 36, 0, '锐捷客户端4.96.exe', '/project_1/2023/04/27/CF2721272A174B4BB0758F7223E28C89.exe', '2023-04-27 21:50:12', '2023-04-27 21:50:12');
INSERT INTO `pi_file` VALUES (25, 2, 43, 0, '锐捷客户端4.96.exe', '/project_9/2023/04/27/6D2EB103ECEB4149A0D5D03E17A54CD4.exe', '2023-04-27 22:21:51', '2023-04-27 22:21:51');

-- ----------------------------
-- Table structure for pi_file_directory
-- ----------------------------
DROP TABLE IF EXISTS `pi_file_directory`;
CREATE TABLE `pi_file_directory`  (
  `file_directory_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文件目录标识',
  `project_id` int(11) NULL DEFAULT NULL COMMENT '项目标识',
  `parent_id` int(11) NULL DEFAULT NULL COMMENT '文件父目录',
  `file_directory_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '文件目录名',
  `file_document_status` int(11) NULL DEFAULT 0 COMMENT '文件状态',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`file_directory_id`) USING BTREE,
  INDEX `FK_Reference_22`(`parent_id`) USING BTREE,
  INDEX `FK_pi_project_file_directory_rela`(`project_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '文件目录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pi_file_directory
-- ----------------------------
INSERT INTO `pi_file_directory` VALUES (1, 1, NULL, 'Tracey1', 0, '2023-04-27 18:27:46', '2023-04-27 22:26:35');
INSERT INTO `pi_file_directory` VALUES (2, 1, NULL, '目录1', 0, '2023-04-27 19:47:10', '2023-04-27 19:47:10');
INSERT INTO `pi_file_directory` VALUES (38, 1, 28, '测试', 0, '2023-04-27 21:50:51', '2023-04-27 21:50:51');
INSERT INTO `pi_file_directory` VALUES (40, 10, NULL, '根目录1', 0, '2023-04-27 22:15:34', '2023-04-27 22:15:34');
INSERT INTO `pi_file_directory` VALUES (36, 1, 35, 'T123', -1, '2023-04-27 20:34:48', '2023-04-27 22:04:32');
INSERT INTO `pi_file_directory` VALUES (27, 1, 1, 'Jesus', 0, '2023-04-27 20:34:01', '2023-04-27 20:34:01');
INSERT INTO `pi_file_directory` VALUES (35, 1, 34, 'T', -1, '2023-04-27 20:34:46', '2023-04-27 22:04:42');
INSERT INTO `pi_file_directory` VALUES (34, 1, 33, 'T', -1, '2023-04-27 20:34:43', '2023-04-27 22:07:48');
INSERT INTO `pi_file_directory` VALUES (33, 1, 32, 'T123', -1, '2023-04-27 20:34:40', '2023-04-27 22:08:20');
INSERT INTO `pi_file_directory` VALUES (32, 1, 30, 'T', 0, '2023-04-27 20:34:37', '2023-04-27 20:34:37');
INSERT INTO `pi_file_directory` VALUES (31, 1, 1, 'Sandy', 0, '2023-04-27 20:34:21', '2023-04-27 20:34:21');
INSERT INTO `pi_file_directory` VALUES (30, 1, 1, 'Arden113', 0, '2023-04-27 20:34:20', '2023-04-27 21:58:18');
INSERT INTO `pi_file_directory` VALUES (29, 1, 1, 'Heaven1', 0, '2023-04-27 20:34:19', '2023-04-27 22:26:44');
INSERT INTO `pi_file_directory` VALUES (28, 1, 1, 'Vada', -1, '2023-04-27 20:34:18', '2023-04-27 22:08:32');
INSERT INTO `pi_file_directory` VALUES (39, 1, 28, '测试2', 0, '2023-04-27 21:51:49', '2023-04-27 21:51:49');
INSERT INTO `pi_file_directory` VALUES (41, 10, NULL, '根目录2', 0, '2023-04-27 22:15:43', '2023-04-27 22:15:43');
INSERT INTO `pi_file_directory` VALUES (42, 8, NULL, '牛', 0, '2023-04-27 22:20:02', '2023-04-27 22:20:02');
INSERT INTO `pi_file_directory` VALUES (43, 9, NULL, '1', 0, '2023-04-27 22:21:41', '2023-04-27 22:21:41');
INSERT INTO `pi_file_directory` VALUES (44, 9, NULL, '2', 0, '2023-04-27 22:21:46', '2023-04-27 22:21:46');

-- ----------------------------
-- Table structure for pi_kanban_list
-- ----------------------------
DROP TABLE IF EXISTS `pi_kanban_list`;
CREATE TABLE `pi_kanban_list`  (
  `kanban_list_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '列表标识',
  `project_id` int(11) NULL DEFAULT NULL COMMENT '项目标识',
  `list_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '列表名',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `kanban_status` int(11) NULL DEFAULT 0 COMMENT '看板状态',
  PRIMARY KEY (`kanban_list_id`) USING BTREE,
  INDEX `FK_pi_project_kanban_list`(`project_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '看板列表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pi_kanban_list
-- ----------------------------
INSERT INTO `pi_kanban_list` VALUES (8, 2, 'Todo名一', '2023-04-23 08:57:39', 0);
INSERT INTO `pi_kanban_list` VALUES (9, 2, 'Todo名二', '2023-04-23 08:57:39', 0);
INSERT INTO `pi_kanban_list` VALUES (10, 3, 'Todo名一', '2023-04-23 09:41:22', 0);
INSERT INTO `pi_kanban_list` VALUES (11, 3, 'Todo名二', '2023-04-23 09:41:22', 0);
INSERT INTO `pi_kanban_list` VALUES (12, 7, 'Todo', '2023-04-23 10:18:02', 0);
INSERT INTO `pi_kanban_list` VALUES (13, 7, 'InProgress', '2023-04-23 10:18:02', 0);
INSERT INTO `pi_kanban_list` VALUES (14, 1, '看板111111111', '2023-04-24 20:40:10', 0);
INSERT INTO `pi_kanban_list` VALUES (15, 1, '看板1123123', '2023-04-24 20:40:28', 0);
INSERT INTO `pi_kanban_list` VALUES (16, 1, 'Gaetano_Altenwerth', '2023-04-24 20:40:44', 0);
INSERT INTO `pi_kanban_list` VALUES (17, 1, 'Timothy.Rogahn', '2023-04-24 20:41:26', 0);
INSERT INTO `pi_kanban_list` VALUES (18, 1, 'Rahul.Ryan77', '2023-04-24 20:41:27', -1);
INSERT INTO `pi_kanban_list` VALUES (19, 1, 'Christine.Wisoky37', '2023-04-24 20:41:28', -1);
INSERT INTO `pi_kanban_list` VALUES (20, 7, 'Completed', '2023-04-24 21:44:08', 0);
INSERT INTO `pi_kanban_list` VALUES (21, 7, 'Review', '2023-04-24 21:45:00', 0);
INSERT INTO `pi_kanban_list` VALUES (22, 7, '名五', '2023-04-24 21:45:22', 0);
INSERT INTO `pi_kanban_list` VALUES (30, 7, 'Todo', '2023-04-25 10:50:06', 0);
INSERT INTO `pi_kanban_list` VALUES (23, 7, '让中华震惊世界', '2023-04-24 22:15:45', 0);
INSERT INTO `pi_kanban_list` VALUES (24, 7, '震惊世界2', '2023-04-24 22:16:12', 0);
INSERT INTO `pi_kanban_list` VALUES (25, 7, '3', '2023-04-24 22:16:20', 0);
INSERT INTO `pi_kanban_list` VALUES (26, 7, '震惊世界', '2023-04-24 22:17:37', 0);
INSERT INTO `pi_kanban_list` VALUES (27, 6, '振兴中华', '2023-04-24 22:19:04', 0);
INSERT INTO `pi_kanban_list` VALUES (28, 6, '让中华震惊世界', '2023-04-24 22:19:41', 0);
INSERT INTO `pi_kanban_list` VALUES (31, 7, 'InProgress', '2023-04-25 10:50:17', 0);
INSERT INTO `pi_kanban_list` VALUES (29, 1, 'Rosetta.Stracke26', '2023-04-24 23:29:04', 0);
INSERT INTO `pi_kanban_list` VALUES (32, 8, '软件工程实践', '2023-04-25 10:50:56', 0);
INSERT INTO `pi_kanban_list` VALUES (33, 2, 'Todo', '2023-04-25 10:51:35', 0);
INSERT INTO `pi_kanban_list` VALUES (34, 9, 'Todo', '2023-04-25 10:53:15', 0);
INSERT INTO `pi_kanban_list` VALUES (35, 10, 'Todo', '2023-04-25 10:54:10', 0);
INSERT INTO `pi_kanban_list` VALUES (36, 10, 'InProgress', '2023-04-25 10:54:22', 0);
INSERT INTO `pi_kanban_list` VALUES (37, 10, 'Completed', '2023-04-25 10:54:31', 0);
INSERT INTO `pi_kanban_list` VALUES (38, 10, 'Review', '2023-04-25 10:54:35', 0);

-- ----------------------------
-- Table structure for pi_label
-- ----------------------------
DROP TABLE IF EXISTS `pi_label`;
CREATE TABLE `pi_label`  (
  `label_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '标签标识',
  `project_id` int(11) NULL DEFAULT NULL COMMENT '项目标识',
  `label_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '标签名',
  `label_color` char(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '标签颜色',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`label_id`) USING BTREE,
  INDEX `FK_pi_project_label`(`project_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '项目标签' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pi_label
-- ----------------------------
INSERT INTO `pi_label` VALUES (1, 7, '紧急', 'danger', '2023-04-23 10:18:03', '2023-04-23 10:18:03');
INSERT INTO `pi_label` VALUES (2, 7, '一般', 'primary', '2023-04-23 10:18:03', '2023-04-23 10:18:03');
INSERT INTO `pi_label` VALUES (3, 7, '不重要', 'info', '2023-04-23 10:18:03', '2023-04-23 10:18:03');
INSERT INTO `pi_label` VALUES (25, 1, '一般重要', 'danger', '2023-04-25 08:02:49', '2023-04-25 08:02:49');
INSERT INTO `pi_label` VALUES (5, 6, '震惊世界', 'danger', '2023-04-23 10:50:36', '2023-04-24 22:20:41');
INSERT INTO `pi_label` VALUES (7, 6, '测试', 'danger', '2023-04-23 10:50:49', '2023-04-23 10:50:49');
INSERT INTO `pi_label` VALUES (24, 1, '非常重要', 'primary', '2023-04-25 08:02:40', '2023-04-25 08:02:40');
INSERT INTO `pi_label` VALUES (10, 6, '测试', 'danger', '2023-04-23 10:52:52', '2023-04-23 10:52:52');
INSERT INTO `pi_label` VALUES (11, 2, '紧急', 'danger', '2023-04-23 10:54:06', '2023-04-23 14:49:50');
INSERT INTO `pi_label` VALUES (22, 2, '软工', 'info', '2023-04-23 14:50:01', '2023-04-23 14:50:01');
INSERT INTO `pi_label` VALUES (23, 7, '123', 'info', '2023-04-24 11:45:13', '2023-04-24 11:45:13');
INSERT INTO `pi_label` VALUES (18, 2, '成功人士', 'success', '2023-04-23 11:33:11', '2023-04-23 11:33:11');

-- ----------------------------
-- Table structure for pi_member
-- ----------------------------
DROP TABLE IF EXISTS `pi_member`;
CREATE TABLE `pi_member`  (
  `member_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '会员标识',
  `member_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '会员登录名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `salt` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '盐',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  `authority_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '权限类型',
  `register_time` datetime(0) NULL DEFAULT NULL COMMENT '注册时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`member_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pi_member
-- ----------------------------
INSERT INTO `pi_member` VALUES (1, 'Ahmad_Langworth', '81293249ebe334c9dd8f35fb322fc08de5bd7a362dc6c694502e4f11464aa77b', '2E4CC4', 'Louie_Bergnaum6@hotmail.com', '0', '2023-04-23 08:18:40', '2023-04-23 08:18:40');
INSERT INTO `pi_member` VALUES (2, 'abc123', 'ea1d44a5a1893ae1cfd51822cac0e2b69a18a12798b06d00ba92de558acbe88d', '974C41', 'pphboy@qq.com', '0', '2023-04-23 08:19:32', '2023-04-23 08:19:32');
INSERT INTO `pi_member` VALUES (3, 'abcabc', 'bd38899a8e54005b609ca390a5d16ef09b0d9ae70e64d4da5f7b9542cd66bcd0', '562E97', 'abcabc@qq.com', '0', '2023-04-23 10:51:34', '2023-04-23 10:51:34');
INSERT INTO `pi_member` VALUES (4, 'Phoebe39', 'e1310c7556f3426d9aac0a9b9226bf9734b585ae90022879a29da0029741799c', '75841E', 'Freeda.Lesch9@gmail.com', '0', '2023-04-25 19:27:23', '2023-04-25 19:27:23');
INSERT INTO `pi_member` VALUES (5, 'Emmett_Adams77', '97cfdd07fa98a947364a3e2205ee821752d412a27e8056bf03c2f4e1b0e140d2', 'EEE963', 'Stephany_Halvorson@yahoo.com', '0', '2023-04-25 19:27:25', '2023-04-25 19:27:25');
INSERT INTO `pi_member` VALUES (6, 'Brock.Roberts', '0cd357884da044cdbde58065f919be014418bb7bc6dbd2b5fad341117c8db45a', 'CFCD05', 'Reba.Kunde52@yahoo.com', '0', '2023-04-25 19:27:26', '2023-04-25 19:27:26');
INSERT INTO `pi_member` VALUES (7, 'Darlene.Wolff', '7f630eb273cace958ab6d20185ea91e3ca30906f2550691af5d113281745854f', 'FA73E0', 'Sarah2@hotmail.com', '0', '2023-04-25 19:27:27', '2023-04-25 19:27:27');
INSERT INTO `pi_member` VALUES (8, 'Fritz_Welch35', 'e5f55b375a709fe3fe38d58b0c2328ba919d69db01e4fb367715d21d3e659853', 'FD82CE', 'Ari.Pollich@hotmail.com', '0', '2023-04-25 19:27:28', '2023-04-25 19:27:28');
INSERT INTO `pi_member` VALUES (9, 'Holly_Vandervort0', '178bcc6009ade8be368643eb33ac3c273e2a777e79eae7f2e8c364f9ad4cfa82', 'E4DCA1', 'Elissa.Denesik95@gmail.com', '0', '2023-04-25 19:27:29', '2023-04-25 19:27:29');
INSERT INTO `pi_member` VALUES (10, 'Theodore1', '2ee2a39671db8145de12b00593f42cfbe9cb9517b1c7a1c5ec5f15e7fe07c4e7', '858A46', 'Stevie_Harris74@yahoo.com', '0', '2023-04-25 19:27:29', '2023-04-25 19:27:29');
INSERT INTO `pi_member` VALUES (11, 'Marlene95', '22ce885419f6a168e91563ee6b472b9ddcd9af11c9709ae368b7db389ba6717b', '0AD742', 'Luella_Dibbert@yahoo.com', '0', '2023-04-25 19:27:30', '2023-04-25 19:27:30');
INSERT INTO `pi_member` VALUES (12, 'Declan14', '4c0abe36d948b1028254e5c6bcf7a1467a1dd104694bd035a427ece33b304bde', '8ED9AB', 'Thalia95@gmail.com', '0', '2023-04-25 19:27:32', '2023-04-25 19:27:32');
INSERT INTO `pi_member` VALUES (13, 'Sydni.Gorczany', '6d3f55aa7583f05248ac03323b6ce1e37d662d95a1f0d40312c6a9891b700783', '3B90EA', 'Landen_Lebsack@yahoo.com', '0', '2023-04-25 19:27:35', '2023-04-25 19:27:35');
INSERT INTO `pi_member` VALUES (14, 'Aliza_Schultz53', 'c0283c3b5447125508eed8cd81e57c1d6991a334e79a4f6badce9369a9f2b637', '47A63E', 'Esther48@gmail.com', '0', '2023-04-25 19:27:36', '2023-04-25 19:27:36');
INSERT INTO `pi_member` VALUES (15, 'Cecil.Gaylord', '1afdea12d59cc0130865a7117d5cf3616073dc7d78e036c6e6a7102fda78999c', 'F326AB', 'Claire3@hotmail.com', '0', '2023-04-25 19:27:37', '2023-04-25 19:27:37');
INSERT INTO `pi_member` VALUES (16, 'Samanta36', '5120243fdb6be1377fe6128ee2da14fdee9a99a256e3e442b61294aaf19b556b', '5EB566', 'Darrin_Anderson26@yahoo.com', '0', '2023-04-25 19:27:37', '2023-04-25 19:27:37');
INSERT INTO `pi_member` VALUES (17, 'Ericka96', '66d21423628d7be820ab0ab6372c5375b477e9826ea366731787ba4ebd27018f', '513E6C', 'Loraine_Keeling@gmail.com', '0', '2023-04-25 19:28:06', '2023-04-25 19:28:06');
INSERT INTO `pi_member` VALUES (18, 'Jessica_Brakus54', '5fca30093180312d883396ce41821600f0b5bc29e6d2a734bef9c979d48ea1e2', 'FB38CB', 'Allison.Yost@hotmail.com', '0', '2023-04-25 19:28:07', '2023-04-25 19:28:07');
INSERT INTO `pi_member` VALUES (19, 'Jamal.Marvin', '016f7654a94447e4e8c472e6092205ce094b82908e646ebedcbab4120f17a40f', '29A437', 'Tremayne74@hotmail.com', '0', '2023-04-25 19:28:08', '2023-04-25 19:28:08');
INSERT INTO `pi_member` VALUES (20, 'Isac_Rempel', 'aef93436829860d5d253656da46605ff5ed7cbd4def0258353616de61da499e5', 'AC8D1A', 'Abbie.White@yahoo.com', '0', '2023-04-25 19:28:08', '2023-04-25 19:28:08');
INSERT INTO `pi_member` VALUES (21, 'Lempi_Wolf', '6cb67e805b8e06b4c92ac8cb2e0e3f6a6886e31feb49cc26d98cd3e41eb2f8ff', 'CDEBE2', 'Isaac_Williamson92@yahoo.com', '0', '2023-04-25 19:28:09', '2023-04-25 19:28:09');
INSERT INTO `pi_member` VALUES (22, 'Blaise53', '488dc2962c8567208f26142b5ac6f5d81e1b0724dfb1375afd8a73caea56f6dd', '29A6C1', 'Bernardo38@gmail.com', '0', '2023-04-25 19:28:09', '2023-04-25 19:28:09');
INSERT INTO `pi_member` VALUES (23, 'Etha.Ziemann', '840a9e1be63fd95cd9ffb754c2abdd547cd08f7c1d2836963c137821a98f66a2', '4A7D14', 'Jany.Batz@gmail.com', '0', '2023-04-25 19:28:10', '2023-04-25 19:28:10');
INSERT INTO `pi_member` VALUES (24, 'Erna_Mohr17', '10f41ecdbab2a3ba16a388afa83123e80a85220d9656b0cc6d0445b23c7b1f3e', 'A54DA8', 'Andy94@hotmail.com', '0', '2023-04-25 19:28:11', '2023-04-25 19:28:11');
INSERT INTO `pi_member` VALUES (25, 'Opal88', 'ac2c62935541461f5878549e3e95fd8df659a008889ccb5f08b5ce643f37f856', 'D4816E', 'Kevon_Gutkowski@yahoo.com', '0', '2023-04-25 19:28:12', '2023-04-25 19:28:12');
INSERT INTO `pi_member` VALUES (26, 'Rogelio.Emard40', '876f0cb9a5e1876c19c1255203ea6919679afeb482162a03a64401abfed2b737', '0A8B36', 'Ilene_Beier38@gmail.com', '0', '2023-04-25 19:28:13', '2023-04-25 19:28:13');
INSERT INTO `pi_member` VALUES (27, 'Bonita.Ankunding', 'f13742e72eb70e4f023972b8212a1606b51004e5b442b549a7ad6cf9d89dae55', '092333', 'Enrique39@yahoo.com', '0', '2023-04-25 19:28:14', '2023-04-25 19:28:14');
INSERT INTO `pi_member` VALUES (28, 'Rowena33', '87bece80d5f563b5d24a5452802442edb3131c170ba714114dd179e7211fefc6', 'C8091E', 'Edna73@gmail.com', '0', '2023-04-25 19:28:15', '2023-04-25 19:28:15');
INSERT INTO `pi_member` VALUES (29, 'Teagan_Schuppe', 'd1449a7186ed3e837023518c344b7bc74d69d952f90da938680f171e8c05fa0e', '52B1F5', 'Henry_Orn46@yahoo.com', '0', '2023-04-25 19:28:15', '2023-04-25 19:28:15');
INSERT INTO `pi_member` VALUES (30, 'Abbey_Roberts68', '691cf0bc263fcb74433948ada9dcf09b4ecdcf3a043cf4432ebcf99e49c4a7c4', 'E81884', 'Meggie1@hotmail.com', '0', '2023-04-25 19:28:16', '2023-04-25 19:28:16');
INSERT INTO `pi_member` VALUES (31, 'Madison_Hackett', 'ed01fd267e55422ea22762dd8dc2854c772afcbb87d164cc4a6e55a494e80f0d', '8F4D8B', 'Deangelo12@yahoo.com', '0', '2023-04-25 19:28:17', '2023-04-25 19:28:17');
INSERT INTO `pi_member` VALUES (32, 'Piper.Sanford', '29e28f11d45d2a19b96cacbd32abea8a965c3659acc3ae19d61f7d63e98a0970', 'EA2950', 'Tyreek_Roberts@hotmail.com', '0', '2023-04-25 19:28:17', '2023-04-25 19:28:17');

-- ----------------------------
-- Table structure for pi_member_authority
-- ----------------------------
DROP TABLE IF EXISTS `pi_member_authority`;
CREATE TABLE `pi_member_authority`  (
  `member_id` int(11) NOT NULL COMMENT '会员标识',
  `authority_id` int(11) NOT NULL COMMENT '权限标识',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`member_id`, `authority_id`) USING BTREE,
  INDEX `FK_user_owned_more_authority2`(`authority_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '用户包含多个权限' ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of pi_member_authority
-- ----------------------------
INSERT INTO `pi_member_authority` VALUES (2, 1, NULL);
INSERT INTO `pi_member_authority` VALUES (3, 1, NULL);

-- ----------------------------
-- Table structure for pi_message
-- ----------------------------
DROP TABLE IF EXISTS `pi_message`;
CREATE TABLE `pi_message`  (
  `message_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '消息标识',
  `message_maker_member_id` int(11) NULL DEFAULT NULL COMMENT '发送者',
  `message_reciever_member_id` int(11) NULL DEFAULT NULL COMMENT '接收者',
  `is_read` smallint(6) NULL DEFAULT NULL COMMENT '已读状态',
  `message_content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT '消息内容',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `is_delete` smallint(6) NULL DEFAULT NULL COMMENT '删除状态',
  PRIMARY KEY (`message_id`) USING BTREE,
  INDEX `FK_message_receiver`(`message_reciever_member_id`) USING BTREE,
  INDEX `FK_message_sender`(`message_maker_member_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '消息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pi_message
-- ----------------------------

-- ----------------------------
-- Table structure for pi_mission_member
-- ----------------------------
DROP TABLE IF EXISTS `pi_mission_member`;
CREATE TABLE `pi_mission_member`  (
  `mission_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '任务标识',
  `member_id` int(11) NOT NULL COMMENT '会员标识',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`member_id`, `mission_id`) USING BTREE,
  INDEX `FK_Reference_21`(`mission_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '参与任务' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pi_mission_member
-- ----------------------------
INSERT INTO `pi_mission_member` VALUES ('affa0b1e2bbd7369bf85923f5a83ba5d', 1, '2023-04-25 20:35:21');
INSERT INTO `pi_mission_member` VALUES ('affa0b1e2bbd7369bf85923f5a83ba5d', 2, '2023-04-25 20:35:21');
INSERT INTO `pi_mission_member` VALUES ('affa0b1e2bbd7369bf85923f5a83ba5d', 3, '2023-04-25 20:35:21');
INSERT INTO `pi_mission_member` VALUES ('affa0b1e2bbd7369bf85923f5a83ba5d', 4, '2023-04-25 20:35:21');
INSERT INTO `pi_mission_member` VALUES ('affa0b1e2bbd7369bf85923f5a83ba5d', 6, '2023-04-25 20:35:21');
INSERT INTO `pi_mission_member` VALUES ('b9863424fe3f7141e0c64bbc0bfaeec4', 29, '2023-04-25 20:34:21');
INSERT INTO `pi_mission_member` VALUES ('b9863424fe3f7141e0c64bbc0bfaeec4', 6, '2023-04-25 20:34:21');
INSERT INTO `pi_mission_member` VALUES ('b9863424fe3f7141e0c64bbc0bfaeec4', 4, '2023-04-25 20:34:21');
INSERT INTO `pi_mission_member` VALUES ('b9863424fe3f7141e0c64bbc0bfaeec4', 3, '2023-04-25 20:34:21');
INSERT INTO `pi_mission_member` VALUES ('b9863424fe3f7141e0c64bbc0bfaeec4', 2, '2023-04-25 20:34:21');
INSERT INTO `pi_mission_member` VALUES ('b9863424fe3f7141e0c64bbc0bfaeec4', 1, '2023-04-25 20:34:21');
INSERT INTO `pi_mission_member` VALUES ('affa0b1e2bbd7369bf85923f5a83ba5d', 29, '2023-04-25 20:35:21');
INSERT INTO `pi_mission_member` VALUES ('bb0f072c2122fa077d010c3110c1d303', 2, '2023-04-25 10:55:35');
INSERT INTO `pi_mission_member` VALUES ('7a4022eda170c5080f013151a6ff5bbb', 2, '2023-04-25 09:23:01');
INSERT INTO `pi_mission_member` VALUES ('173054bdfc316c9c10134857b6fdcd01', 2, '2023-04-25 09:22:59');
INSERT INTO `pi_mission_member` VALUES ('0c033ab133be826b0d2a98f1d52be04e', 2, '2023-04-25 09:22:57');
INSERT INTO `pi_mission_member` VALUES ('3c12a5261ad0199e625f9fc4e60c02bd', 2, '2023-04-25 09:22:55');
INSERT INTO `pi_mission_member` VALUES ('d77d79c2c3a1cface5395c2ae5e7780f', 2, '2023-04-25 09:22:53');
INSERT INTO `pi_mission_member` VALUES ('7e97c8097d825311da3b3f861c6d24ca', 3, '2023-04-25 09:21:54');
INSERT INTO `pi_mission_member` VALUES ('7e97c8097d825311da3b3f861c6d24ca', 2, '2023-04-25 09:21:54');
INSERT INTO `pi_mission_member` VALUES ('bb0a7730e9937ef46fd189b760f3db1a', 3, '2023-04-25 09:21:39');
INSERT INTO `pi_mission_member` VALUES ('bb0a7730e9937ef46fd189b760f3db1a', 2, '2023-04-25 09:21:39');
INSERT INTO `pi_mission_member` VALUES ('30757fe57bdcb26b2bb214234b41248f', 3, '2023-04-25 09:21:33');
INSERT INTO `pi_mission_member` VALUES ('30757fe57bdcb26b2bb214234b41248f', 2, '2023-04-25 09:21:33');
INSERT INTO `pi_mission_member` VALUES ('1ee951e0085f065dc4f2fef9e712d5ab', 3, '2023-04-25 09:21:15');
INSERT INTO `pi_mission_member` VALUES ('1ee951e0085f065dc4f2fef9e712d5ab', 2, '2023-04-25 09:21:15');
INSERT INTO `pi_mission_member` VALUES ('7e6258047eb5980915f34a8e95a66359', 3, '2023-04-25 09:20:59');
INSERT INTO `pi_mission_member` VALUES ('7e6258047eb5980915f34a8e95a66359', 2, '2023-04-25 09:20:59');
INSERT INTO `pi_mission_member` VALUES ('eb3cd2155194c56b21981b395eb3fa33', 3, '2023-04-25 09:20:48');
INSERT INTO `pi_mission_member` VALUES ('5dfa016a9fa643e42faf17ce63c69a79', 3, '2023-04-25 09:20:43');
INSERT INTO `pi_mission_member` VALUES ('3e9b67681733aa041abc5f14734a50ea', 3, '2023-04-25 09:20:38');
INSERT INTO `pi_mission_member` VALUES ('d572d07885592d3c26f04d8bdf0e7ca9', 3, '2023-04-25 09:20:34');
INSERT INTO `pi_mission_member` VALUES ('5517c3e2f8b7e3934b0ca6af36099ce7', 3, '2023-04-25 09:18:28');
INSERT INTO `pi_mission_member` VALUES ('5517c3e2f8b7e3934b0ca6af36099ce7', 2, '2023-04-25 09:18:28');
INSERT INTO `pi_mission_member` VALUES ('adc7c88beaa1af25d9cdd182e1cb7df9', 3, '2023-04-25 10:42:03');
INSERT INTO `pi_mission_member` VALUES ('38d356f62c99d331267b477c29f00977', 3, '2023-04-25 09:20:08');
INSERT INTO `pi_mission_member` VALUES ('adc7c88beaa1af25d9cdd182e1cb7df9', 2, '2023-04-25 10:42:03');
INSERT INTO `pi_mission_member` VALUES ('4b89cec1c6dd21152537fb8277149f26', 2, '2023-04-24 21:45:38');
INSERT INTO `pi_mission_member` VALUES ('ca8b361be69dc77b7c4510807139f405', 3, '2023-04-24 14:37:09');
INSERT INTO `pi_mission_member` VALUES ('ca8b361be69dc77b7c4510807139f405', 2, '2023-04-24 14:37:09');
INSERT INTO `pi_mission_member` VALUES ('3f02622f66cdff11f08b54df6263aabf', 3, '2023-04-24 13:57:37');
INSERT INTO `pi_mission_member` VALUES ('3f02622f66cdff11f08b54df6263aabf', 2, '2023-04-24 13:57:37');
INSERT INTO `pi_mission_member` VALUES ('eb411f80b52df7454cd16a067c3f5909', 3, '2023-04-24 12:54:38');
INSERT INTO `pi_mission_member` VALUES ('281b7cb21ecb5f9a39546395eb9b8486', 3, '2023-04-25 08:23:30');
INSERT INTO `pi_mission_member` VALUES ('ababf19f200b24cb28e7861a99b9edb5', 2, '2023-04-24 12:54:03');
INSERT INTO `pi_mission_member` VALUES ('7818c6ac2bd26d7676153a4d0d0adaa7', 2, '2023-04-27 22:22:14');

-- ----------------------------
-- Table structure for pi_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `pi_operation_log`;
CREATE TABLE `pi_operation_log`  (
  `operation_log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '操作日志标识',
  `project_id` int(11) NULL DEFAULT NULL COMMENT '项目标识',
  `authority_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '权限类型',
  `operation_context` varchar(512) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '操作内容',
  `operate_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`operation_log_id`) USING BTREE,
  INDEX `FK_pi_project_operation_log_rela`(`project_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '操作日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pi_operation_log
-- ----------------------------

-- ----------------------------
-- Table structure for pi_project
-- ----------------------------
DROP TABLE IF EXISTS `pi_project`;
CREATE TABLE `pi_project`  (
  `project_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '项目标识',
  `project_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目名',
  `project_intro` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '项目介绍',
  `project_status` smallint(6) NULL DEFAULT NULL COMMENT '项目状态',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`project_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '项目' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pi_project
-- ----------------------------
INSERT INTO `pi_project` VALUES (1, '11111111111', '1111111111111111111', 100, '2023-04-23 08:23:16', '2023-04-23 08:23:16');
INSERT INTO `pi_project` VALUES (2, '创建项目123', '创建项目创建项目', 100, '2023-04-23 08:47:07', '2023-04-23 10:00:11');
INSERT INTO `pi_project` VALUES (7, '软件工程实践', '502D0199288C4D90BAFFEBEEBE927B0B软件工程实践项目1', 0, '2023-04-23 10:18:02', '2023-04-24 22:32:54');
INSERT INTO `pi_project` VALUES (6, '项目3', '项目3项目3项目3', 100, '2023-04-23 09:58:40', '2023-04-23 09:58:40');
INSERT INTO `pi_project` VALUES (8, '软件工程最强实验', '软件2002班', 100, '2023-04-25 10:49:59', '2023-04-25 10:49:59');
INSERT INTO `pi_project` VALUES (9, '测试2', '测试2测试2测试2', 100, '2023-04-25 10:51:23', '2023-04-25 10:51:23');
INSERT INTO `pi_project` VALUES (10, '测试3', '测试3测试3测试3测试3', 100, '2023-04-25 10:54:04', '2023-04-25 10:54:04');

-- ----------------------------
-- Table structure for pi_project_members
-- ----------------------------
DROP TABLE IF EXISTS `pi_project_members`;
CREATE TABLE `pi_project_members`  (
  `project_id` int(11) NOT NULL COMMENT '项目标识',
  `member_id` int(11) NOT NULL COMMENT '会员标识',
  `project_authority` smallint(6) NULL DEFAULT NULL COMMENT '权限',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`project_id`, `member_id`) USING BTREE,
  INDEX `pi_project_members_FK`(`project_id`) USING BTREE,
  INDEX `pi_project_members2_FK`(`member_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '项目创建与参与关系' ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of pi_project_members
-- ----------------------------
INSERT INTO `pi_project_members` VALUES (1, 2, 100, '2023-04-23 08:23:16', '2023-04-23 08:23:16');
INSERT INTO `pi_project_members` VALUES (2, 2, 100, '2023-04-23 08:47:07', '2023-04-23 08:47:07');
INSERT INTO `pi_project_members` VALUES (3, 2, 100, '2023-04-23 09:40:58', '2023-04-23 09:40:58');
INSERT INTO `pi_project_members` VALUES (4, 2, 100, '2023-04-23 09:57:56', '2023-04-23 09:57:56');
INSERT INTO `pi_project_members` VALUES (5, 2, 100, '2023-04-23 09:58:07', '2023-04-23 09:58:07');
INSERT INTO `pi_project_members` VALUES (6, 2, 100, '2023-04-23 09:58:40', '2023-04-23 09:58:40');
INSERT INTO `pi_project_members` VALUES (7, 2, 100, '2023-04-23 10:18:02', '2023-04-23 10:18:02');
INSERT INTO `pi_project_members` VALUES (6, 3, 100, NULL, NULL);
INSERT INTO `pi_project_members` VALUES (2, 3, 100, NULL, NULL);
INSERT INTO `pi_project_members` VALUES (7, 3, 100, NULL, NULL);
INSERT INTO `pi_project_members` VALUES (1, 3, 100, NULL, NULL);
INSERT INTO `pi_project_members` VALUES (8, 2, 100, '2023-04-25 10:49:59', '2023-04-25 10:49:59');
INSERT INTO `pi_project_members` VALUES (9, 2, 100, '2023-04-25 10:51:23', '2023-04-25 10:51:23');
INSERT INTO `pi_project_members` VALUES (10, 2, 0, '2023-04-25 10:54:04', '2023-04-25 10:54:04');
INSERT INTO `pi_project_members` VALUES (1, 6, -1, '2023-04-25 20:21:29', '2023-04-25 20:21:29');
INSERT INTO `pi_project_members` VALUES (1, 1, 0, '2023-04-25 20:32:53', '2023-04-25 20:32:53');
INSERT INTO `pi_project_members` VALUES (1, 4, 0, '2023-04-25 20:33:00', '2023-04-25 20:33:00');
INSERT INTO `pi_project_members` VALUES (1, 29, 0, '2023-04-25 20:33:42', '2023-04-25 20:33:42');
INSERT INTO `pi_project_members` VALUES (2, 22, 0, '2023-04-25 20:35:42', '2023-04-25 20:35:42');
INSERT INTO `pi_project_members` VALUES (10, 6, -1, '2023-04-25 20:51:12', '2023-04-25 23:00:53');
INSERT INTO `pi_project_members` VALUES (10, 1, -1, '2023-04-25 20:55:55', '2023-04-25 23:15:09');
INSERT INTO `pi_project_members` VALUES (10, 3, 0, '2023-04-25 20:55:58', '2023-04-25 20:55:58');
INSERT INTO `pi_project_members` VALUES (10, 4, 0, '2023-04-25 20:56:00', '2023-04-25 20:56:00');
INSERT INTO `pi_project_members` VALUES (10, 5, 0, '2023-04-25 20:56:03', '2023-04-25 20:56:03');
INSERT INTO `pi_project_members` VALUES (10, 11, 0, '2023-04-25 20:56:07', '2023-04-25 20:56:07');
INSERT INTO `pi_project_members` VALUES (10, 13, 0, '2023-04-25 20:56:09', '2023-04-25 20:56:09');
INSERT INTO `pi_project_members` VALUES (10, 7, -1, '2023-04-25 22:57:08', '2023-04-25 23:00:48');
INSERT INTO `pi_project_members` VALUES (10, 8, -1, '2023-04-25 23:01:12', '2023-04-25 23:15:21');
INSERT INTO `pi_project_members` VALUES (10, 28, -1, '2023-04-25 23:15:30', '2023-04-25 23:15:34');

-- ----------------------------
-- Table structure for pi_project_mission
-- ----------------------------
DROP TABLE IF EXISTS `pi_project_mission`;
CREATE TABLE `pi_project_mission`  (
  `mission_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '任务标识',
  `kanban_list_id` int(11) NULL DEFAULT NULL COMMENT '列表标识',
  `mission_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '任务名',
  `mission_intro` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT '任务介绍',
  `mission_order` int(11) NULL DEFAULT NULL COMMENT '任务排序',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `start_time` datetime(0) NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `delete_status` smallint(6) NULL DEFAULT NULL COMMENT '删除状态',
  `mission_status` smallint(6) NULL DEFAULT NULL COMMENT '任务状态',
  PRIMARY KEY (`mission_id`) USING BTREE,
  INDEX `FK_pi_project_kanban_mission`(`kanban_list_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '项目任务' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pi_project_mission
-- ----------------------------
INSERT INTO `pi_project_mission` VALUES ('b9863424fe3f7141e0c64bbc0bfaeec4', 14, '任务名', NULL, NULL, '2023-04-25 20:34:21', NULL, NULL, '2023-04-25 20:34:21', NULL, 0);
INSERT INTO `pi_project_mission` VALUES ('affa0b1e2bbd7369bf85923f5a83ba5d', 15, '建设新中国', NULL, NULL, '2023-04-25 12:07:17', NULL, '2023-04-25 12:07:15', '2023-04-25 20:35:21', NULL, 0);
INSERT INTO `pi_project_mission` VALUES ('bb0f072c2122fa077d010c3110c1d303', 38, '让中华震惊世界', '测试3，项目10', NULL, '2023-04-25 10:54:52', NULL, '2029-12-26 00:00:00', '2023-04-25 10:55:44', NULL, 0);
INSERT INTO `pi_project_mission` VALUES ('173054bdfc316c9c10134857b6fdcd01', 12, '人民', NULL, NULL, '2023-04-25 09:22:59', NULL, NULL, '2023-04-25 09:22:59', NULL, 0);
INSERT INTO `pi_project_mission` VALUES ('7a4022eda170c5080f013151a6ff5bbb', 20, '人民', NULL, NULL, '2023-04-25 09:23:01', NULL, NULL, '2023-04-27 22:22:20', NULL, 0);
INSERT INTO `pi_project_mission` VALUES ('0c033ab133be826b0d2a98f1d52be04e', 12, '人民', NULL, NULL, '2023-04-25 09:22:57', NULL, NULL, '2023-04-25 09:22:57', NULL, 0);
INSERT INTO `pi_project_mission` VALUES ('3c12a5261ad0199e625f9fc4e60c02bd', 12, '人民', NULL, NULL, '2023-04-25 09:22:55', NULL, NULL, '2023-04-25 09:22:55', NULL, 0);
INSERT INTO `pi_project_mission` VALUES ('d77d79c2c3a1cface5395c2ae5e7780f', 12, '人民', NULL, NULL, '2023-04-25 09:22:53', NULL, NULL, '2023-04-25 09:22:53', NULL, 0);
INSERT INTO `pi_project_mission` VALUES ('7e97c8097d825311da3b3f861c6d24ca', 12, '实现中华民族伟大复兴', NULL, NULL, '2023-04-25 09:21:54', NULL, NULL, '2023-04-25 09:21:54', NULL, 0);
INSERT INTO `pi_project_mission` VALUES ('bb0a7730e9937ef46fd189b760f3db1a', 12, '人民万岁', NULL, NULL, '2023-04-25 09:21:39', NULL, NULL, '2023-04-25 09:22:18', NULL, 0);
INSERT INTO `pi_project_mission` VALUES ('30757fe57bdcb26b2bb214234b41248f', 12, '世界人民大团结万岁', NULL, NULL, '2023-04-25 09:21:33', NULL, NULL, '2023-04-25 09:21:33', NULL, 0);
INSERT INTO `pi_project_mission` VALUES ('1ee951e0085f065dc4f2fef9e712d5ab', 12, '建设共产主义社会', NULL, NULL, '2023-04-25 09:21:15', NULL, NULL, '2023-04-25 09:21:15', NULL, 0);
INSERT INTO `pi_project_mission` VALUES ('7e6258047eb5980915f34a8e95a66359', 12, '发展大西北', NULL, NULL, '2023-04-25 09:20:59', NULL, NULL, '2023-04-25 09:20:59', NULL, 0);
INSERT INTO `pi_project_mission` VALUES ('eb3cd2155194c56b21981b395eb3fa33', 12, '建设社会主义现代化强国任务A', NULL, NULL, '2023-04-25 09:20:48', NULL, NULL, '2023-04-25 09:20:48', NULL, 0);
INSERT INTO `pi_project_mission` VALUES ('5dfa016a9fa643e42faf17ce63c69a79', 12, '建设社会主义现代化强国任务5', NULL, NULL, '2023-04-25 09:20:43', NULL, NULL, '2023-04-25 09:20:43', NULL, 0);
INSERT INTO `pi_project_mission` VALUES ('3e9b67681733aa041abc5f14734a50ea', 12, '建设社会主义现代化强国任务2', NULL, NULL, '2023-04-25 09:20:38', NULL, NULL, '2023-04-25 09:20:38', NULL, 0);
INSERT INTO `pi_project_mission` VALUES ('d572d07885592d3c26f04d8bdf0e7ca9', 12, '建设社会主义现代化强国任务1', NULL, NULL, '2023-04-25 09:20:34', NULL, NULL, '2023-04-25 09:20:34', NULL, 0);
INSERT INTO `pi_project_mission` VALUES ('38d356f62c99d331267b477c29f00977', 13, '建设社会主义现代化强国', NULL, NULL, '2023-04-25 09:20:08', NULL, NULL, '2023-04-25 09:20:12', NULL, 0);
INSERT INTO `pi_project_mission` VALUES ('adc7c88beaa1af25d9cdd182e1cb7df9', 15, '123123', NULL, NULL, '2023-04-25 07:53:56', NULL, '2023-04-29 00:00:00', '2023-04-25 10:42:03', NULL, 0);
INSERT INTO `pi_project_mission` VALUES ('281b7cb21ecb5f9a39546395eb9b8486', 28, '振兴中华', '世界人民大团队万岁', NULL, '2023-04-24 22:19:59', NULL, '2023-04-26 00:00:00', '2023-04-25 08:23:30', NULL, 0);
INSERT INTO `pi_project_mission` VALUES ('1f8f708e5a8dfa8c8a766b78a927aceb', 14, '让中华震惊世界', NULL, NULL, '2023-04-24 22:15:07', NULL, '2023-04-28 23:42:18', '2023-04-25 09:16:14', NULL, 0);
INSERT INTO `pi_project_mission` VALUES ('4b89cec1c6dd21152537fb8277149f26', 20, '强大中国', '强大中国', NULL, '2023-04-24 21:45:38', NULL, NULL, '2023-04-24 21:45:42', NULL, 0);
INSERT INTO `pi_project_mission` VALUES ('41e4ac14c609ee9accf41614bcd74d10', 8, 'Kbug ', NULL, NULL, '2023-04-24 20:02:56', NULL, NULL, '2023-04-24 20:02:56', NULL, 0);
INSERT INTO `pi_project_mission` VALUES ('a1077d0e5e32ae007ac8b6bf47334b8b', 8, '123123f', NULL, NULL, '2023-04-24 20:02:33', NULL, NULL, '2023-04-24 20:02:33', NULL, 0);
INSERT INTO `pi_project_mission` VALUES ('8e0d915ce59a91da85e540af6cd291de', 8, '123', NULL, NULL, '2023-04-24 20:02:15', NULL, NULL, '2023-04-25 18:59:28', NULL, 0);
INSERT INTO `pi_project_mission` VALUES ('c90a7f6fd65a4359b96154d4cb3bb254', 33, '123123123', NULL, NULL, '2023-04-24 20:01:30', NULL, NULL, '2023-04-25 18:59:24', NULL, 0);
INSERT INTO `pi_project_mission` VALUES ('5517c3e2f8b7e3934b0ca6af36099ce7', 9, '让中华震惊世界', '让中华震惊世界让中华震惊世界让中华震惊世界让中华震惊世界让中华震惊世界让中华震惊世界让中华震惊世界让中华震惊世界让中华震惊世界让中华震惊世界让中华震惊世界让中华震惊世界让中华震惊世界让中华震惊世界让中华震惊世界让中华震惊世界让中华震惊世界让中华震惊世界让中华震惊世界让中华震惊世界让中华震惊世界让中华震惊世界让中华震惊世界让中华震惊世界让中华震惊世界让中华震惊世界让中华震惊世界让中华震惊世界让中华震惊世界让中华震惊世界让中华震惊世界让中华震惊世界让中华震惊世界让中华震惊世界让中华震惊世界', NULL, '2023-04-24 20:01:23', NULL, NULL, '2023-04-25 18:59:20', NULL, 0);
INSERT INTO `pi_project_mission` VALUES ('ca8b361be69dc77b7c4510807139f405', 12, '123', NULL, NULL, '2023-04-24 14:01:54', NULL, '2023-04-24 14:37:05', '2023-04-24 14:37:09', NULL, 0);
INSERT INTO `pi_project_mission` VALUES ('4dd4a198ad4c8ac2e87f314d24f31c8d', 8, '123', NULL, NULL, '2023-04-24 14:01:46', NULL, NULL, '2023-04-24 14:01:46', NULL, 0);
INSERT INTO `pi_project_mission` VALUES ('fb6fb4dab2b1c6c16e63b027f68b0419', 8, '振兴中华', NULL, NULL, '2023-04-24 14:01:25', NULL, NULL, '2023-04-24 14:01:25', NULL, 0);
INSERT INTO `pi_project_mission` VALUES ('53b035bc3296d8892d8b99e756a90a7e', 8, '振兴中华', '振兴中华', NULL, '2023-04-24 14:01:11', NULL, NULL, '2023-04-24 14:01:11', NULL, 0);
INSERT INTO `pi_project_mission` VALUES ('3f02622f66cdff11f08b54df6263aabf', 22, '不错', NULL, NULL, '2023-04-24 13:57:37', '2023-04-24 13:57:25', '2023-04-29 00:00:00', '2023-04-24 22:15:27', NULL, 0);
INSERT INTO `pi_project_mission` VALUES ('eb411f80b52df7454cd16a067c3f5909', 12, '建设共产主义社会', NULL, NULL, '2023-04-24 12:54:38', NULL, '2049-04-24 12:53:03', '2023-04-24 13:58:09', NULL, 0);
INSERT INTO `pi_project_mission` VALUES ('b391a79869701fbc1d4016aad44a0ff0', 20, '振兴中国', NULL, NULL, '2023-04-24 12:53:37', NULL, '2049-04-24 12:53:03', '2023-04-24 22:23:16', NULL, 0);
INSERT INTO `pi_project_mission` VALUES ('ababf19f200b24cb28e7861a99b9edb5', 21, '建设新中国', NULL, NULL, '2023-04-24 12:53:22', NULL, '1949-04-24 12:53:03', '2023-04-24 21:45:53', NULL, 0);
INSERT INTO `pi_project_mission` VALUES ('7818c6ac2bd26d7676153a4d0d0adaa7', 34, '为中华之崛起而读书', NULL, NULL, '2023-04-27 22:22:14', NULL, NULL, '2023-04-27 22:22:14', NULL, NULL);

-- ----------------------------
-- Table structure for pi_project_mission_rela_label
-- ----------------------------
DROP TABLE IF EXISTS `pi_project_mission_rela_label`;
CREATE TABLE `pi_project_mission_rela_label`  (
  `label_id` int(11) NOT NULL COMMENT '标签标识',
  `mission_id` varchar(33) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '任务标识',
  PRIMARY KEY (`label_id`, `mission_id`) USING BTREE,
  INDEX `FK_pi_project_mission_rela_label2`(`mission_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '任务拥有多个标签' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pi_project_mission_rela_label
-- ----------------------------
INSERT INTO `pi_project_mission_rela_label` VALUES (1, '3f02622f66cdff11f08b54df6263aabf');
INSERT INTO `pi_project_mission_rela_label` VALUES (1, '4b89cec1c6dd21152537fb8277149f26');
INSERT INTO `pi_project_mission_rela_label` VALUES (1, '5517c3e2f8b7e3934b0ca6af36099ce7');
INSERT INTO `pi_project_mission_rela_label` VALUES (1, '7e97c8097d825311da3b3f861c6d24ca');
INSERT INTO `pi_project_mission_rela_label` VALUES (2, '3f02622f66cdff11f08b54df6263aabf');
INSERT INTO `pi_project_mission_rela_label` VALUES (3, '3f02622f66cdff11f08b54df6263aabf');
INSERT INTO `pi_project_mission_rela_label` VALUES (3, '5517c3e2f8b7e3934b0ca6af36099ce7');
INSERT INTO `pi_project_mission_rela_label` VALUES (3, 'ca8b361be69dc77b7c4510807139f405');
INSERT INTO `pi_project_mission_rela_label` VALUES (23, '3f02622f66cdff11f08b54df6263aabf');
INSERT INTO `pi_project_mission_rela_label` VALUES (24, 'adc7c88beaa1af25d9cdd182e1cb7df9');
INSERT INTO `pi_project_mission_rela_label` VALUES (25, 'adc7c88beaa1af25d9cdd182e1cb7df9');

SET FOREIGN_KEY_CHECKS = 1;
