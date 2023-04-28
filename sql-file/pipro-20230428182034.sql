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

 Date: 28/04/2023 18:20:35
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
  `file_status` int(11) NULL DEFAULT 0 COMMENT '文档状态',
  `document_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '文档标题',
  `document_content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT '文档内容',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`document_id`) USING BTREE,
  INDEX `FK_pi_document_detail`(`document_directory_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '文档' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pi_document
-- ----------------------------
INSERT INTO `pi_document` VALUES ('asdfadfasdf', 1, 0, '为中华之崛起而读书', '# 振兴中华\n\n我们一定要振兴中华。\n\n```js\nconsole.log(\'实现中华民族伟大复兴\');\n```', '2023-04-28 10:00:58', '2023-04-28 11:36:27');
INSERT INTO `pi_document` VALUES ('6df376707666c3352bd2b7f98faf86e1', 1, 0, '中华民族必将实现伟大复兴', '# 复兴之路\n\n中国', '2023-04-28 10:42:16', '2023-04-28 11:36:25');
INSERT INTO `pi_document` VALUES ('c9322200effbb82a841ca2b965ffde07', 1, -1, '未命名1682649801506', NULL, '2023-04-28 10:43:23', '2023-04-28 11:02:52');
INSERT INTO `pi_document` VALUES ('e701b5629c8cda155e87c249d8cdfaff', 1, 0, '未命名1682649868771', NULL, '2023-04-28 10:44:30', '2023-04-28 10:44:30');
INSERT INTO `pi_document` VALUES ('5094a2d6d92441b92e8348638710600d', 1, 0, '未命名1682649894027', NULL, '2023-04-28 10:44:55', '2023-04-28 10:44:55');
INSERT INTO `pi_document` VALUES ('98be27004eee8f9de10086a76f0e5a3e', 1, -1, '未命名1682650030955', NULL, '2023-04-28 10:47:12', '2023-04-28 10:55:41');
INSERT INTO `pi_document` VALUES ('0f683c238dfc6d5e68f9591fef3567a2', 1, -1, '未命名1682650041771', NULL, '2023-04-28 10:47:25', '2023-04-28 10:55:38');
INSERT INTO `pi_document` VALUES ('770e1a76b26bbfd6fddeac0371ab67ac', 1, 0, '操作文档', NULL, '2023-04-28 10:49:21', '2023-04-28 10:49:21');
INSERT INTO `pi_document` VALUES ('7cccea1643074f90ccb51587468b44ef', 32, 0, '未命名1682650213431', '振兴中华1111111111', '2023-04-28 10:50:15', '2023-04-28 11:08:30');
INSERT INTO `pi_document` VALUES ('8facf93b608299d3db8942c752fcf2a0', 29, 0, '未命名1682650549124', NULL, '2023-04-28 10:55:51', '2023-04-28 10:55:51');
INSERT INTO `pi_document` VALUES ('7db9443832d15675c5084f4244f6c3fc', 29, 0, '民族复兴', NULL, '2023-04-28 10:56:17', '2023-04-28 10:56:17');
INSERT INTO `pi_document` VALUES ('352072db1f4aa52733b4415a2cb784fd', 29, 0, '民族复兴指南2', NULL, '2023-04-28 10:57:26', '2023-04-28 10:57:26');
INSERT INTO `pi_document` VALUES ('68ff28344d838e2c1a128ef07f522277', 50, 0, '未命名1682650675420', '### 三级标题振兴中华', '2023-04-28 10:57:57', '2023-04-28 11:11:08');
INSERT INTO `pi_document` VALUES ('2aecf6ddc95ea529096b6e56d79daf63', 50, 0, '未命名1682650716309', NULL, '2023-04-28 10:58:37', '2023-04-28 10:58:37');
INSERT INTO `pi_document` VALUES ('e37702dd831371b9f8cc53ccc60f05e4', 1, 0, '未命名1682650948988', NULL, '2023-04-28 11:02:30', '2023-04-28 11:02:30');
INSERT INTO `pi_document` VALUES ('101123b6b03dc701b3ecc2c02037c80d', 50, 0, '未命名1682650954107', NULL, '2023-04-28 11:02:36', '2023-04-28 11:02:36');
INSERT INTO `pi_document` VALUES ('91f3b3700cdfc345cd990520ca6b92d4', 51, 0, '未命名1682653114039', '123123123123', '2023-04-28 11:38:35', '2023-04-28 11:38:51');
INSERT INTO `pi_document` VALUES ('ad4ca74d67aca99dbe47851fbef90964', 51, 0, '未命名1682653233623', NULL, '2023-04-28 11:40:35', '2023-04-28 11:40:35');
INSERT INTO `pi_document` VALUES ('eab4ee683aec83cd312edb473b1ae547', 51, 0, '未命名1682653236530', NULL, '2023-04-28 11:40:38', '2023-04-28 11:40:38');
INSERT INTO `pi_document` VALUES ('d42a4280dabdd5135b6f227b08b61007', 52, 0, '未命名1682655162881', NULL, '2023-04-28 12:12:45', '2023-04-28 12:12:45');

-- ----------------------------
-- Table structure for pi_document_directory
-- ----------------------------
DROP TABLE IF EXISTS `pi_document_directory`;
CREATE TABLE `pi_document_directory`  (
  `document_directory_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文档目录标识',
  `project_id` int(11) NULL DEFAULT NULL COMMENT '项目标识',
  `parent_id` int(11) NULL DEFAULT NULL COMMENT '父文件目录',
  `document_directory_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '文件目录名',
  `file_document_status` int(11) NULL DEFAULT 0 COMMENT '文件状态',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`document_directory_id`) USING BTREE,
  INDEX `FK_Reference_23`(`parent_id`) USING BTREE,
  INDEX `FK_pi_project_document_directory`(`project_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 54 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '文档目录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pi_document_directory
-- ----------------------------
INSERT INTO `pi_document_directory` VALUES (1, 1, NULL, 'Edgar', 0, '2023-04-28 07:39:30', '2023-04-28 07:49:07');
INSERT INTO `pi_document_directory` VALUES (48, 1, 42, 'Hans', 0, '2023-04-28 08:06:57', '2023-04-28 08:06:57');
INSERT INTO `pi_document_directory` VALUES (47, 1, 42, 'Adrienne', 0, '2023-04-28 08:06:20', '2023-04-28 08:06:20');
INSERT INTO `pi_document_directory` VALUES (46, 1, 42, 'Maymie', -1, '2023-04-28 08:03:32', '2023-04-28 08:04:48');
INSERT INTO `pi_document_directory` VALUES (45, 1, 42, 'Malika', -1, '2023-04-28 08:03:24', '2023-04-28 08:04:59');
INSERT INTO `pi_document_directory` VALUES (44, 1, 40, 'Emilio', 0, '2023-04-28 08:03:13', '2023-04-28 08:03:13');
INSERT INTO `pi_document_directory` VALUES (43, 1, 40, 'Iliana', 0, '2023-04-28 08:03:06', '2023-04-28 08:03:06');
INSERT INTO `pi_document_directory` VALUES (42, 1, 40, 'Hailee', 0, '2023-04-28 08:03:05', '2023-04-28 08:03:05');
INSERT INTO `pi_document_directory` VALUES (41, 1, 40, 'Makayla', 0, '2023-04-28 08:03:05', '2023-04-28 08:03:05');
INSERT INTO `pi_document_directory` VALUES (40, 1, 36, '重命名', 0, '2023-04-28 08:02:57', '2023-04-28 08:05:12');
INSERT INTO `pi_document_directory` VALUES (39, 1, 36, 'Rex', 0, '2023-04-28 08:02:56', '2023-04-28 08:02:56');
INSERT INTO `pi_document_directory` VALUES (38, 1, 36, 'Julian', 0, '2023-04-28 08:02:55', '2023-04-28 08:02:55');
INSERT INTO `pi_document_directory` VALUES (37, 1, 36, 'Filomena', 0, '2023-04-28 08:02:55', '2023-04-28 08:02:55');
INSERT INTO `pi_document_directory` VALUES (36, 1, 28, 'Birdie', 0, '2023-04-28 08:02:44', '2023-04-28 08:02:44');
INSERT INTO `pi_document_directory` VALUES (35, 1, 28, 'Ellie', 0, '2023-04-28 08:02:44', '2023-04-28 08:02:44');
INSERT INTO `pi_document_directory` VALUES (34, 1, 28, 'Jaydon', 0, '2023-04-28 08:02:43', '2023-04-28 08:02:43');
INSERT INTO `pi_document_directory` VALUES (33, 1, 1, 'Therese', -1, '2023-04-28 08:02:32', '2023-04-28 08:52:01');
INSERT INTO `pi_document_directory` VALUES (32, 1, 1, 'Brooklyn1', 0, '2023-04-28 08:02:31', '2023-04-28 08:52:12');
INSERT INTO `pi_document_directory` VALUES (31, 1, 1, 'Katelynn', 0, '2023-04-28 08:02:30', '2023-04-28 08:02:30');
INSERT INTO `pi_document_directory` VALUES (49, 1, 33, '1', 0, '2023-04-28 08:51:49', '2023-04-28 08:51:49');
INSERT INTO `pi_document_directory` VALUES (30, 1, 1, 'Marcella', 0, '2023-04-28 08:02:24', '2023-04-28 08:02:24');
INSERT INTO `pi_document_directory` VALUES (29, 1, 1, 'Theresia', 0, '2023-04-28 08:02:23', '2023-04-28 08:02:23');
INSERT INTO `pi_document_directory` VALUES (28, 1, 1, 'Bella', -1, '2023-04-28 08:02:17', '2023-04-28 08:52:05');
INSERT INTO `pi_document_directory` VALUES (50, 1, 1, '123', 0, '2023-04-28 08:51:55', '2023-04-28 08:54:25');
INSERT INTO `pi_document_directory` VALUES (51, 8, NULL, '文档', 0, '2023-04-28 11:38:32', '2023-04-28 11:38:32');
INSERT INTO `pi_document_directory` VALUES (52, 6, NULL, 'AAA', 0, '2023-04-28 12:12:40', '2023-04-28 12:12:40');
INSERT INTO `pi_document_directory` VALUES (53, 2, NULL, '创建', 0, '2023-04-28 15:49:22', '2023-04-28 15:49:22');

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
) ENGINE = MyISAM AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '文件' ROW_FORMAT = Dynamic;

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
INSERT INTO `pi_file` VALUES (26, 2, 53, 0, 'SuConfig.dat', '/project_1/2023/04/28/E7DF72B5EFC8439BA6F44C6623F9E8C4.dat', '2023-04-28 11:02:05', '2023-04-28 11:02:05');
INSERT INTO `pi_file` VALUES (27, 2, 1, 0, 'W32N55.dll', '/project_1/2023/04/28/2532D838DDB3461795E532737D64060F.dll', '2023-04-28 12:32:57', '2023-04-28 12:32:57');
INSERT INTO `pi_file` VALUES (28, 2, 44, 0, 'SuConfig.dat', '/project_9/2023/04/28/6E0E9F7FB8744708B908A7AA7B20E21D.dat', '2023-04-28 12:34:09', '2023-04-28 12:34:09');
INSERT INTO `pi_file` VALUES (29, 2, 43, 0, '锐捷客户端4.96.exe', '/project_9/2023/04/28/60792323387E47F98375188A8E6B3BC5.exe', '2023-04-28 12:38:56', '2023-04-28 12:38:56');

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
) ENGINE = MyISAM AUTO_INCREMENT = 57 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '文件目录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pi_file_directory
-- ----------------------------
INSERT INTO `pi_file_directory` VALUES (1, 1, NULL, 'Tracey12', 0, '2023-04-27 18:27:46', '2023-04-28 12:32:12');
INSERT INTO `pi_file_directory` VALUES (2, 1, NULL, '目录1', 0, '2023-04-27 19:47:10', '2023-04-27 19:47:10');
INSERT INTO `pi_file_directory` VALUES (38, 1, 28, '测试', 0, '2023-04-27 21:50:51', '2023-04-27 21:50:51');
INSERT INTO `pi_file_directory` VALUES (40, 10, NULL, '根目录1', 0, '2023-04-27 22:15:34', '2023-04-27 22:15:34');
INSERT INTO `pi_file_directory` VALUES (36, 1, 35, 'T123', -1, '2023-04-27 20:34:48', '2023-04-27 22:04:32');
INSERT INTO `pi_file_directory` VALUES (27, 1, 1, 'Jesus1', 0, '2023-04-27 20:34:01', '2023-04-28 12:39:53');
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
INSERT INTO `pi_file_directory` VALUES (45, 1, 1, 'Scot', 0, '2023-04-28 08:07:09', '2023-04-28 08:07:09');
INSERT INTO `pi_file_directory` VALUES (46, 1, 1, 'Danial', 0, '2023-04-28 08:07:11', '2023-04-28 08:07:11');
INSERT INTO `pi_file_directory` VALUES (47, 1, 1, 'Hilbert1', 0, '2023-04-28 08:07:12', '2023-04-28 12:32:50');
INSERT INTO `pi_file_directory` VALUES (48, 1, 30, '23', 0, '2023-04-28 10:59:03', '2023-04-28 10:59:03');
INSERT INTO `pi_file_directory` VALUES (49, 1, 30, '123', 0, '2023-04-28 10:59:34', '2023-04-28 10:59:34');
INSERT INTO `pi_file_directory` VALUES (50, 1, 30, '123123', 0, '2023-04-28 11:00:11', '2023-04-28 11:00:11');
INSERT INTO `pi_file_directory` VALUES (51, 1, 30, '111', 0, '2023-04-28 11:01:21', '2023-04-28 11:01:21');
INSERT INTO `pi_file_directory` VALUES (52, 1, 30, 'aa', 0, '2023-04-28 11:01:26', '2023-04-28 11:01:26');
INSERT INTO `pi_file_directory` VALUES (53, 1, 30, '1', 0, '2023-04-28 11:01:44', '2023-04-28 11:01:44');
INSERT INTO `pi_file_directory` VALUES (54, 1, 53, '1', 0, '2023-04-28 11:01:55', '2023-04-28 11:01:55');
INSERT INTO `pi_file_directory` VALUES (55, 6, NULL, 'R', 0, '2023-04-28 12:33:52', '2023-04-28 12:33:52');
INSERT INTO `pi_file_directory` VALUES (56, 9, 43, 'T', -1, '2023-04-28 12:38:59', '2023-04-28 12:39:03');

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
INSERT INTO `pi_member` VALUES (4, 'PBOT', '', '', 'pbot@qq.com', '0', '2023-04-25 19:27:23', '2023-04-25 19:27:23');
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
  `message_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '消息标识',
  `message_maker_member_id` int(11) NULL DEFAULT NULL COMMENT '发送者',
  `message_receiver_member_id` int(11) NULL DEFAULT NULL COMMENT '接收者',
  `message_content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT '消息内容',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `message_status` smallint(6) NULL DEFAULT 0 COMMENT '删除状态',
  `message_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`message_id`) USING BTREE,
  INDEX `FK_message_receiver`(`message_receiver_member_id`) USING BTREE,
  INDEX `FK_message_sender`(`message_maker_member_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '消息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pi_message
-- ----------------------------
INSERT INTO `pi_message` VALUES ('fedc83a8ecb7aa525cb3ddbd4664520c', 4, 1, '你的任务更新了 {建设新中国},快速查看', '2023-04-28 18:02:25', 0, '任务更新');
INSERT INTO `pi_message` VALUES ('7039fc29621bb3aabae2256aa4a005c7', 4, 3, '你的任务更新了 {让中华震惊世界},快速查看', '2023-04-28 17:42:19', 0, '任务更新');
INSERT INTO `pi_message` VALUES ('e102ba07c66b7937f18f9fcecec2d05b', 4, 2, '你的任务更新了 {让中华震惊世界},快速查看', '2023-04-28 17:42:19', -1, '任务更新');
INSERT INTO `pi_message` VALUES ('3d97cc944e4bbf26cea2bd3b3fe6b505', 4, 3, '你的任务更新了 {任务测试},快速查看', '2023-04-28 17:24:53', 0, '任务更新');
INSERT INTO `pi_message` VALUES ('681f159b57932edb0ae66720ba1be7ec', 4, 2, '你的任务更新了 {任务测试},快速查看', '2023-04-28 17:42:16', -1, '任务更新');
INSERT INTO `pi_message` VALUES ('60db5cb4aa7dbc056d2625eb7db4b8f7', 4, 3, '你的任务更新了 {任务测试},快速查看', '2023-04-28 17:42:16', 0, '任务更新');
INSERT INTO `pi_message` VALUES ('56dbcb74b3a61d65ca4fcb49c6f280a2', 4, 2, '你的任务更新了 {建设新中国},快速查看', '2023-04-28 18:02:25', -1, '任务更新');
INSERT INTO `pi_message` VALUES ('769d0bd8d662926494a93ebfd408dbe0', 4, 3, '你的任务更新了 {建设新中国},快速查看', '2023-04-28 18:02:25', 0, '任务更新');
INSERT INTO `pi_message` VALUES ('720c535aad117ca3863d2c47878f1d6f', 4, 4, '你的任务更新了 {建设新中国},快速查看', '2023-04-28 18:02:25', 0, '任务更新');
INSERT INTO `pi_message` VALUES ('92980aebc59e7f470016886565e52e3a', 4, 6, '你的任务更新了 {建设新中国},快速查看', '2023-04-28 18:02:25', 0, '任务更新');
INSERT INTO `pi_message` VALUES ('292825fdcbec9cf1b02d6200401dd77f', 4, 29, '你的任务更新了 {建设新中国},快速查看', '2023-04-28 18:02:25', 0, '任务更新');
INSERT INTO `pi_message` VALUES ('1288b481fd846b0c19827f0125d52f99', 4, 2, '你的任务更新了 {123123},快速查看', '2023-04-28 18:02:37', -1, '任务更新');
INSERT INTO `pi_message` VALUES ('b48fe3bd44211497b031c58a558d083c', 4, 3, '你的任务更新了 {123123},快速查看', '2023-04-28 18:02:37', 0, '任务更新');
INSERT INTO `pi_message` VALUES ('52e36749718a077737199fa812c4b343', 4, 22, '你的任务更新了 {123123123},快速查看', '2023-04-28 18:05:22', 0, '任务更新');
INSERT INTO `pi_message` VALUES ('6e65129157c5d49d619443ff25de97df', 4, 2, '你的任务更新了 {123123123},快速查看', '2023-04-28 18:05:30', -1, '任务更新');
INSERT INTO `pi_message` VALUES ('e9ff75a01e6e080ff86c93c04d99c17d', 4, 22, '你的任务更新了 {123123123},快速查看', '2023-04-28 18:05:30', 0, '任务更新');
INSERT INTO `pi_message` VALUES ('6fef02dd39447a8f4baed0cea56c8297', 4, 2, '你的任务更新了 {123},快速查看', '2023-04-28 18:05:50', -1, '任务更新');
INSERT INTO `pi_message` VALUES ('f7cfaf2042905a1a5541d496ad06ff4b', 4, 2, '你的任务更新了 {Kbug },快速查看', '2023-04-28 18:06:20', -1, '任务更新');
INSERT INTO `pi_message` VALUES ('846c32f1b14860cae40217fb68b44895', 4, 1, '你的任务更新了 {建设新中国},快速查看', '2023-04-28 18:06:37', 0, '任务更新');
INSERT INTO `pi_message` VALUES ('c99a0f8699298d154349567d923fc1ac', 4, 2, '你的任务更新了 {建设新中国},快速查看', '2023-04-28 18:06:37', -1, '任务更新');
INSERT INTO `pi_message` VALUES ('3a2eacf8ab297e439d2cb5550bad8fc7', 4, 3, '你的任务更新了 {建设新中国},快速查看', '2023-04-28 18:06:37', 0, '任务更新');
INSERT INTO `pi_message` VALUES ('1478d1bdc2831582bfa78108fe2e9343', 4, 4, '你的任务更新了 {建设新中国},快速查看', '2023-04-28 18:06:37', 0, '任务更新');
INSERT INTO `pi_message` VALUES ('20fe613c015a7aa54658ecfb94386743', 4, 6, '你的任务更新了 {建设新中国},快速查看', '2023-04-28 18:06:37', 0, '任务更新');
INSERT INTO `pi_message` VALUES ('70cb095eb67a772c16d63c8d860497ba', 4, 29, '你的任务更新了 {建设新中国},快速查看', '2023-04-28 18:06:37', 0, '任务更新');
INSERT INTO `pi_message` VALUES ('52a5f00a2faa1d7591bd3d3cbc3b4147', 4, 1, '你的任务更新了 {建设新中国},快速查看', '2023-04-28 18:07:26', 0, '任务更新');
INSERT INTO `pi_message` VALUES ('a75afc7384bd5f7beed6da014f3f7794', 4, 2, '你的任务更新了 {建设新中国},快速查看', '2023-04-28 18:07:26', -1, '任务更新');
INSERT INTO `pi_message` VALUES ('56b3db5e19eb4a8c3375fdddb593412d', 4, 3, '你的任务更新了 {建设新中国},快速查看', '2023-04-28 18:07:26', 0, '任务更新');
INSERT INTO `pi_message` VALUES ('88008dfbf7da51a29071dd09c6595a97', 4, 4, '你的任务更新了 {建设新中国},快速查看', '2023-04-28 18:07:26', 0, '任务更新');
INSERT INTO `pi_message` VALUES ('a9432b9af7fe9ad3f4f7a6052061c849', 4, 6, '你的任务更新了 {建设新中国},快速查看', '2023-04-28 18:07:26', 0, '任务更新');
INSERT INTO `pi_message` VALUES ('13e373b1ff29014a1bd7834e84a92d15', 4, 29, '你的任务更新了 {建设新中国},快速查看', '2023-04-28 18:07:26', 0, '任务更新');
INSERT INTO `pi_message` VALUES ('88987ade71aac7c0982d0fe37da03c81', 4, 2, '你的任务更新了 {让中华震惊世界},快速查看', '2023-04-28 18:14:16', -1, '任务更新');
INSERT INTO `pi_message` VALUES ('2f658956477a89cc960c4fa116c5e2e6', 4, 3, '你的任务更新了 {让中华震惊世界},快速查看', '2023-04-28 18:14:16', 0, '任务更新');
INSERT INTO `pi_message` VALUES ('d0e293438a0280f3ac01bfe06e75bb25', 4, 2, '你的任务更新了 {Kbug },快速查看', '2023-04-28 18:14:18', -1, '任务更新');
INSERT INTO `pi_message` VALUES ('2d503130851618f2c3d24287eff324b8', 4, 2, '你的任务更新了 {123123},快速查看', '2023-04-28 18:16:13', -1, '任务更新');
INSERT INTO `pi_message` VALUES ('3b8d70811839ed0d0c49ef2e45bd00c3', 4, 3, '你的任务更新了 {123123},快速查看', '2023-04-28 18:16:13', 0, '任务更新');
INSERT INTO `pi_message` VALUES ('6b333efacc299e531dfa5ad0206982db', 4, 2, '你的任务更新了 {123123123},快速查看', '2023-04-28 18:17:22', -1, '任务更新');
INSERT INTO `pi_message` VALUES ('5a806a31d4e19694d5f6e93a79f2551a', 4, 22, '你的任务更新了 {123123123},快速查看', '2023-04-28 18:17:22', 0, '任务更新');
INSERT INTO `pi_message` VALUES ('a63580de7dcf7472a64d9c93c0b13ccc', 4, 2, '你的任务更新了 {123},快速查看', '2023-04-28 18:18:34', -1, '任务更新');
INSERT INTO `pi_message` VALUES ('b5700a3c40a9177acd5756c8b577fbd6', 4, 2, '你的任务更新了 {123123123},快速查看', '2023-04-28 18:18:41', -1, '任务更新');
INSERT INTO `pi_message` VALUES ('e0088c0015e5675e2a6710fbae3aeb50', 4, 22, '你的任务更新了 {123123123},快速查看', '2023-04-28 18:18:41', 0, '任务更新');
INSERT INTO `pi_message` VALUES ('5597daf19673ea37f92cc6aa70548bfa', 4, 2, '你的任务更新了 {123123123},快速查看', '2023-04-28 18:18:47', 1, '任务更新');
INSERT INTO `pi_message` VALUES ('1d45f9907998422a91bd49674d5a1335', 4, 22, '你的任务更新了 {123123123},快速查看', '2023-04-28 18:18:47', 0, '任务更新');
INSERT INTO `pi_message` VALUES ('b65bcb05ec18a4f501deba9161759580', 4, 2, '你的任务更新了 {振兴中华},快速查看', '2023-04-28 18:18:49', 1, '任务更新');
INSERT INTO `pi_message` VALUES ('1a0119cc2cf7edd9e0a79896425541d9', 4, 3, '你的任务更新了 {振兴中华},快速查看', '2023-04-28 18:18:49', 0, '任务更新');
INSERT INTO `pi_message` VALUES ('f0ee51783d7844e45f77a6a67a0cc380', 4, 22, '你的任务更新了 {振兴中华},快速查看', '2023-04-28 18:18:49', 0, '任务更新');
INSERT INTO `pi_message` VALUES ('598f639b44de9fbba9785dc1c815ccae', 4, 2, '你的任务更新了 {振兴中华},快速查看', '2023-04-28 18:18:51', 1, '任务更新');
INSERT INTO `pi_message` VALUES ('924252155d92135a1c8bde2c25142c69', 4, 3, '你的任务更新了 {振兴中华},快速查看', '2023-04-28 18:18:51', 0, '任务更新');
INSERT INTO `pi_message` VALUES ('4a49d9a7fc3299be576c615fe4bb2179', 4, 22, '你的任务更新了 {振兴中华},快速查看', '2023-04-28 18:18:51', 0, '任务更新');
INSERT INTO `pi_message` VALUES ('7e9f76ad1f100073902deb91a25f5e1d', 4, 2, '你的任务更新了 {123},快速查看', '2023-04-28 18:18:53', 1, '任务更新');
INSERT INTO `pi_message` VALUES ('cbddfa16fe7c7208b40aa02c2a37b86c', 4, 2, '你的任务更新了 {Kbug },快速查看', '2023-04-28 18:18:55', 1, '任务更新');

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
INSERT INTO `pi_mission_member` VALUES ('affa0b1e2bbd7369bf85923f5a83ba5d', 29, '2023-04-28 18:07:26');
INSERT INTO `pi_mission_member` VALUES ('affa0b1e2bbd7369bf85923f5a83ba5d', 6, '2023-04-28 18:07:26');
INSERT INTO `pi_mission_member` VALUES ('affa0b1e2bbd7369bf85923f5a83ba5d', 4, '2023-04-28 18:07:26');
INSERT INTO `pi_mission_member` VALUES ('affa0b1e2bbd7369bf85923f5a83ba5d', 3, '2023-04-28 18:07:26');
INSERT INTO `pi_mission_member` VALUES ('affa0b1e2bbd7369bf85923f5a83ba5d', 2, '2023-04-28 18:07:26');
INSERT INTO `pi_mission_member` VALUES ('b9863424fe3f7141e0c64bbc0bfaeec4', 29, '2023-04-25 20:34:21');
INSERT INTO `pi_mission_member` VALUES ('b9863424fe3f7141e0c64bbc0bfaeec4', 6, '2023-04-25 20:34:21');
INSERT INTO `pi_mission_member` VALUES ('b9863424fe3f7141e0c64bbc0bfaeec4', 4, '2023-04-25 20:34:21');
INSERT INTO `pi_mission_member` VALUES ('b9863424fe3f7141e0c64bbc0bfaeec4', 3, '2023-04-25 20:34:21');
INSERT INTO `pi_mission_member` VALUES ('b9863424fe3f7141e0c64bbc0bfaeec4', 2, '2023-04-25 20:34:21');
INSERT INTO `pi_mission_member` VALUES ('b9863424fe3f7141e0c64bbc0bfaeec4', 1, '2023-04-25 20:34:21');
INSERT INTO `pi_mission_member` VALUES ('affa0b1e2bbd7369bf85923f5a83ba5d', 1, '2023-04-28 18:07:26');
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
INSERT INTO `pi_mission_member` VALUES ('5517c3e2f8b7e3934b0ca6af36099ce7', 3, '2023-04-28 18:14:16');
INSERT INTO `pi_mission_member` VALUES ('5517c3e2f8b7e3934b0ca6af36099ce7', 2, '2023-04-28 18:14:16');
INSERT INTO `pi_mission_member` VALUES ('adc7c88beaa1af25d9cdd182e1cb7df9', 3, '2023-04-28 18:16:13');
INSERT INTO `pi_mission_member` VALUES ('38d356f62c99d331267b477c29f00977', 3, '2023-04-25 09:20:08');
INSERT INTO `pi_mission_member` VALUES ('adc7c88beaa1af25d9cdd182e1cb7df9', 2, '2023-04-28 18:16:13');
INSERT INTO `pi_mission_member` VALUES ('4b89cec1c6dd21152537fb8277149f26', 2, '2023-04-24 21:45:38');
INSERT INTO `pi_mission_member` VALUES ('ca8b361be69dc77b7c4510807139f405', 3, '2023-04-24 14:37:09');
INSERT INTO `pi_mission_member` VALUES ('ca8b361be69dc77b7c4510807139f405', 2, '2023-04-24 14:37:09');
INSERT INTO `pi_mission_member` VALUES ('3f02622f66cdff11f08b54df6263aabf', 3, '2023-04-24 13:57:37');
INSERT INTO `pi_mission_member` VALUES ('3f02622f66cdff11f08b54df6263aabf', 2, '2023-04-24 13:57:37');
INSERT INTO `pi_mission_member` VALUES ('eb411f80b52df7454cd16a067c3f5909', 3, '2023-04-24 12:54:38');
INSERT INTO `pi_mission_member` VALUES ('281b7cb21ecb5f9a39546395eb9b8486', 3, '2023-04-25 08:23:30');
INSERT INTO `pi_mission_member` VALUES ('ababf19f200b24cb28e7861a99b9edb5', 2, '2023-04-24 12:54:03');
INSERT INTO `pi_mission_member` VALUES ('7818c6ac2bd26d7676153a4d0d0adaa7', 2, '2023-04-27 22:22:14');
INSERT INTO `pi_mission_member` VALUES ('53b035bc3296d8892d8b99e756a90a7e', 22, '2023-04-28 18:18:51');
INSERT INTO `pi_mission_member` VALUES ('53b035bc3296d8892d8b99e756a90a7e', 3, '2023-04-28 18:18:51');
INSERT INTO `pi_mission_member` VALUES ('53b035bc3296d8892d8b99e756a90a7e', 2, '2023-04-28 18:18:51');
INSERT INTO `pi_mission_member` VALUES ('02614b5e26359fa15bb6cbc20d3431ed', 3, '2023-04-28 17:42:16');
INSERT INTO `pi_mission_member` VALUES ('02614b5e26359fa15bb6cbc20d3431ed', 2, '2023-04-28 17:42:16');
INSERT INTO `pi_mission_member` VALUES ('1f8f708e5a8dfa8c8a766b78a927aceb', 2, '2023-04-28 17:42:19');
INSERT INTO `pi_mission_member` VALUES ('1f8f708e5a8dfa8c8a766b78a927aceb', 3, '2023-04-28 17:42:19');
INSERT INTO `pi_mission_member` VALUES ('c90a7f6fd65a4359b96154d4cb3bb254', 22, '2023-04-28 18:18:47');
INSERT INTO `pi_mission_member` VALUES ('c90a7f6fd65a4359b96154d4cb3bb254', 2, '2023-04-28 18:18:47');
INSERT INTO `pi_mission_member` VALUES ('8e0d915ce59a91da85e540af6cd291de', 2, '2023-04-28 18:18:53');
INSERT INTO `pi_mission_member` VALUES ('41e4ac14c609ee9accf41614bcd74d10', 2, '2023-04-28 18:18:55');

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
INSERT INTO `pi_project` VALUES (1, '学生管理系统', '1111111111111111111', 100, '2023-04-23 08:23:16', '2023-04-28 15:57:00');
INSERT INTO `pi_project` VALUES (2, '教务管理系统', '创建项目创建项目', 100, '2023-04-23 08:47:07', '2023-04-28 15:57:12');
INSERT INTO `pi_project` VALUES (7, '购物网站', '502D0199288C4D90BAFFEBEEBE927B0B软件工程实践项目1', 0, '2023-04-23 10:18:02', '2023-04-28 15:57:25');
INSERT INTO `pi_project` VALUES (6, '软件设计组', '项目3项目3项目3', 100, '2023-04-23 09:58:40', '2023-04-28 15:57:43');
INSERT INTO `pi_project` VALUES (8, 'UI设计组', '软件2002班', 100, '2023-04-25 10:49:59', '2023-04-28 15:57:53');
INSERT INTO `pi_project` VALUES (9, '营销项目组', '测试2测试2测试2', 100, '2023-04-25 10:51:23', '2023-04-28 15:58:14');
INSERT INTO `pi_project` VALUES (10, '软件测试组', '测试3测试3测试3测试3', 100, '2023-04-25 10:54:04', '2023-04-28 15:58:42');

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
INSERT INTO `pi_project_mission` VALUES ('b9863424fe3f7141e0c64bbc0bfaeec4', 15, '任务名', NULL, NULL, '2023-04-25 20:34:21', NULL, NULL, '2023-04-28 12:48:29', NULL, 0);
INSERT INTO `pi_project_mission` VALUES ('affa0b1e2bbd7369bf85923f5a83ba5d', 16, '建设新中国', NULL, NULL, '2023-04-25 12:07:17', NULL, '2023-04-25 12:07:15', '2023-04-28 18:07:26', NULL, 0);
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
INSERT INTO `pi_project_mission` VALUES ('adc7c88beaa1af25d9cdd182e1cb7df9', 15, '123123', NULL, NULL, '2023-04-25 07:53:56', NULL, '2023-04-29 00:00:00', '2023-04-28 18:16:13', NULL, 0);
INSERT INTO `pi_project_mission` VALUES ('281b7cb21ecb5f9a39546395eb9b8486', 28, '振兴中华', '世界人民大团队万岁', NULL, '2023-04-24 22:19:59', NULL, '2023-04-26 00:00:00', '2023-04-25 08:23:30', NULL, 0);
INSERT INTO `pi_project_mission` VALUES ('1f8f708e5a8dfa8c8a766b78a927aceb', 14, '让中华震惊世界', NULL, NULL, '2023-04-24 22:15:07', NULL, '2023-04-28 23:42:18', '2023-04-28 17:42:19', NULL, 0);
INSERT INTO `pi_project_mission` VALUES ('4b89cec1c6dd21152537fb8277149f26', 20, '强大中国', '强大中国', NULL, '2023-04-24 21:45:38', NULL, NULL, '2023-04-24 21:45:42', NULL, 0);
INSERT INTO `pi_project_mission` VALUES ('41e4ac14c609ee9accf41614bcd74d10', 8, 'Kbug ', NULL, NULL, '2023-04-24 20:02:56', NULL, NULL, '2023-04-28 18:18:55', NULL, 0);
INSERT INTO `pi_project_mission` VALUES ('a1077d0e5e32ae007ac8b6bf47334b8b', 8, '123123f', NULL, NULL, '2023-04-24 20:02:33', NULL, NULL, '2023-04-28 13:09:38', NULL, 0);
INSERT INTO `pi_project_mission` VALUES ('8e0d915ce59a91da85e540af6cd291de', 8, '123', NULL, NULL, '2023-04-24 20:02:15', NULL, NULL, '2023-04-28 18:18:53', NULL, 0);
INSERT INTO `pi_project_mission` VALUES ('c90a7f6fd65a4359b96154d4cb3bb254', 33, '123123123', NULL, NULL, '2023-04-24 20:01:30', NULL, NULL, '2023-04-28 18:18:47', NULL, 0);
INSERT INTO `pi_project_mission` VALUES ('5517c3e2f8b7e3934b0ca6af36099ce7', 9, '让中华震惊世界', '让中华震惊世界让中华震惊世界让中华震惊世界让中华震惊世界让中华震惊世界让中华震惊世界让中华震惊世界让中华震惊世界让中华震惊世界让中华震惊世界让中华震惊世界让中华震惊世界让中华震惊世界让中华震惊世界让中华震惊世界让中华震惊世界让中华震惊世界让中华震惊世界让中华震惊世界让中华震惊世界让中华震惊世界让中华震惊世界让中华震惊世界让中华震惊世界让中华震惊世界让中华震惊世界让中华震惊世界让中华震惊世界让中华震惊世界让中华震惊世界让中华震惊世界让中华震惊世界让中华震惊世界让中华震惊世界让中华震惊世界', NULL, '2023-04-24 20:01:23', NULL, NULL, '2023-04-28 18:14:16', NULL, 0);
INSERT INTO `pi_project_mission` VALUES ('ca8b361be69dc77b7c4510807139f405', 12, '123', NULL, NULL, '2023-04-24 14:01:54', NULL, '2023-04-24 14:37:05', '2023-04-24 14:37:09', NULL, 0);
INSERT INTO `pi_project_mission` VALUES ('4dd4a198ad4c8ac2e87f314d24f31c8d', 8, '123', NULL, NULL, '2023-04-24 14:01:46', NULL, NULL, '2023-04-28 13:09:37', NULL, 0);
INSERT INTO `pi_project_mission` VALUES ('fb6fb4dab2b1c6c16e63b027f68b0419', 9, '振兴中华', NULL, NULL, '2023-04-24 14:01:25', NULL, NULL, '2023-04-28 13:09:50', NULL, 0);
INSERT INTO `pi_project_mission` VALUES ('53b035bc3296d8892d8b99e756a90a7e', 9, '振兴中华', '振兴中华', NULL, '2023-04-24 14:01:11', NULL, NULL, '2023-04-28 18:18:51', NULL, 0);
INSERT INTO `pi_project_mission` VALUES ('3f02622f66cdff11f08b54df6263aabf', 22, '不错', NULL, NULL, '2023-04-24 13:57:37', '2023-04-24 13:57:25', '2023-04-29 00:00:00', '2023-04-24 22:15:27', NULL, 0);
INSERT INTO `pi_project_mission` VALUES ('eb411f80b52df7454cd16a067c3f5909', 12, '建设共产主义社会', NULL, NULL, '2023-04-24 12:54:38', NULL, '2049-04-24 12:53:03', '2023-04-24 13:58:09', NULL, 0);
INSERT INTO `pi_project_mission` VALUES ('b391a79869701fbc1d4016aad44a0ff0', 20, '振兴中国', NULL, NULL, '2023-04-24 12:53:37', NULL, '2049-04-24 12:53:03', '2023-04-24 22:23:16', NULL, 0);
INSERT INTO `pi_project_mission` VALUES ('ababf19f200b24cb28e7861a99b9edb5', 21, '建设新中国', NULL, NULL, '2023-04-24 12:53:22', NULL, '1949-04-24 12:53:03', '2023-04-24 21:45:53', NULL, 0);
INSERT INTO `pi_project_mission` VALUES ('7818c6ac2bd26d7676153a4d0d0adaa7', 34, '为中华之崛起而读书', NULL, NULL, '2023-04-27 22:22:14', NULL, NULL, '2023-04-27 22:22:14', NULL, NULL);
INSERT INTO `pi_project_mission` VALUES ('02614b5e26359fa15bb6cbc20d3431ed', 14, '任务测试', NULL, NULL, '2023-04-28 17:05:53', NULL, NULL, '2023-04-28 17:42:16', NULL, NULL);

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
