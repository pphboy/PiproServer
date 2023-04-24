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

 Date: 24/04/2023 15:53:18
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
  `document_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文档标识',
  `document_directory_id` int(11) NULL DEFAULT NULL COMMENT '文档目录标识',
  `filename` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '文件名',
  `file_path` varchar(512) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '文件路径',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`document_id`) USING BTREE,
  INDEX `FK_pi_document_detail`(`document_directory_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '文档' ROW_FORMAT = Dynamic;

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
  `file_directory_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '文件目录名',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`document_directory_id`) USING BTREE,
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
  INDEX `FK_pi_document_edit_log_rela`(`document_id`) USING BTREE
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
  `filename` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '文件名',
  `file_path` varchar(512) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '文件路径',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`file_id`) USING BTREE,
  INDEX `FK_pi_project_file_rela`(`file_directory_id`) USING BTREE,
  INDEX `FK_user_owned_files`(`member_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '文件' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pi_file
-- ----------------------------

-- ----------------------------
-- Table structure for pi_file_directory
-- ----------------------------
DROP TABLE IF EXISTS `pi_file_directory`;
CREATE TABLE `pi_file_directory`  (
  `file_directory_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文件目录标识',
  `project_id` int(11) NULL DEFAULT NULL COMMENT '项目标识',
  `file_directory_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '文件目录名',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`file_directory_id`) USING BTREE,
  INDEX `FK_pi_project_file_directory_rela`(`project_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '文件目录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pi_file_directory
-- ----------------------------

-- ----------------------------
-- Table structure for pi_kanban_list
-- ----------------------------
DROP TABLE IF EXISTS `pi_kanban_list`;
CREATE TABLE `pi_kanban_list`  (
  `kanban_list_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '列表标识',
  `project_id` int(11) NULL DEFAULT NULL COMMENT '项目标识',
  `list_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '列表名',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`kanban_list_id`) USING BTREE,
  INDEX `FK_pi_project_kanban_list`(`project_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '看板列表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pi_kanban_list
-- ----------------------------
INSERT INTO `pi_kanban_list` VALUES (8, 2, 'Todo名一', '2023-04-23 08:57:39');
INSERT INTO `pi_kanban_list` VALUES (9, 2, 'Todo名二', '2023-04-23 08:57:39');
INSERT INTO `pi_kanban_list` VALUES (10, 3, 'Todo名一', '2023-04-23 09:41:22');
INSERT INTO `pi_kanban_list` VALUES (11, 3, 'Todo名二', '2023-04-23 09:41:22');
INSERT INTO `pi_kanban_list` VALUES (12, 7, 'Todo名一', '2023-04-23 10:18:02');
INSERT INTO `pi_kanban_list` VALUES (13, 7, 'Todo名二', '2023-04-23 10:18:02');

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
) ENGINE = MyISAM AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '项目标签' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pi_label
-- ----------------------------
INSERT INTO `pi_label` VALUES (1, 7, '紧急', 'danger', '2023-04-23 10:18:03', '2023-04-23 10:18:03');
INSERT INTO `pi_label` VALUES (2, 7, '一般', 'primary', '2023-04-23 10:18:03', '2023-04-23 10:18:03');
INSERT INTO `pi_label` VALUES (3, 7, '不重要', 'info', '2023-04-23 10:18:03', '2023-04-23 10:18:03');
INSERT INTO `pi_label` VALUES (4, 6, '测试', 'danger', '2023-04-23 10:50:33', '2023-04-23 10:50:33');
INSERT INTO `pi_label` VALUES (5, 6, '测试', 'danger', '2023-04-23 10:50:36', '2023-04-23 10:50:36');
INSERT INTO `pi_label` VALUES (6, 6, '测试', 'danger', '2023-04-23 10:50:39', '2023-04-23 10:50:39');
INSERT INTO `pi_label` VALUES (7, 6, '测试', 'danger', '2023-04-23 10:50:49', '2023-04-23 10:50:49');
INSERT INTO `pi_label` VALUES (8, 6, '测试', 'danger', '2023-04-23 10:52:43', '2023-04-23 10:52:43');
INSERT INTO `pi_label` VALUES (9, 6, '测试', 'danger', '2023-04-23 10:52:51', '2023-04-23 10:52:51');
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
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pi_member
-- ----------------------------
INSERT INTO `pi_member` VALUES (1, 'Ahmad_Langworth', '81293249ebe334c9dd8f35fb322fc08de5bd7a362dc6c694502e4f11464aa77b', '2E4CC4', 'Louie_Bergnaum6@hotmail.com', '0', '2023-04-23 08:18:40', '2023-04-23 08:18:40');
INSERT INTO `pi_member` VALUES (2, 'abc123', 'ea1d44a5a1893ae1cfd51822cac0e2b69a18a12798b06d00ba92de558acbe88d', '974C41', 'pphboy@qq.com', '0', '2023-04-23 08:19:32', '2023-04-23 08:19:32');
INSERT INTO `pi_member` VALUES (3, 'abcabc', 'bd38899a8e54005b609ca390a5d16ef09b0d9ae70e64d4da5f7b9542cd66bcd0', '562E97', 'abcabc@qq.com', '0', '2023-04-23 10:51:34', '2023-04-23 10:51:34');

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
  PRIMARY KEY (`mission_id`, `member_id`) USING BTREE,
  INDEX `FK_Reference_20`(`member_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '参与任务' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pi_mission_member
-- ----------------------------
INSERT INTO `pi_mission_member` VALUES ('ca8b361be69dc77b7c4510807139f405', 3, '2023-04-24 14:37:09');
INSERT INTO `pi_mission_member` VALUES ('ca8b361be69dc77b7c4510807139f405', 2, '2023-04-24 14:37:09');
INSERT INTO `pi_mission_member` VALUES ('3f02622f66cdff11f08b54df6263aabf', 3, '2023-04-24 13:57:37');
INSERT INTO `pi_mission_member` VALUES ('3f02622f66cdff11f08b54df6263aabf', 2, '2023-04-24 13:57:37');
INSERT INTO `pi_mission_member` VALUES ('eb411f80b52df7454cd16a067c3f5909', 3, '2023-04-24 12:54:38');
INSERT INTO `pi_mission_member` VALUES ('b391a79869701fbc1d4016aad44a0ff0', 3, '2023-04-24 12:53:37');
INSERT INTO `pi_mission_member` VALUES ('ababf19f200b24cb28e7861a99b9edb5', 2, '2023-04-24 12:54:03');

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
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '项目' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pi_project
-- ----------------------------
INSERT INTO `pi_project` VALUES (1, '11111111111', '1111111111111111111', 100, '2023-04-23 08:23:16', '2023-04-23 08:23:16');
INSERT INTO `pi_project` VALUES (2, '创建项目123', '创建项目创建项目', 100, '2023-04-23 08:47:07', '2023-04-23 10:00:11');
INSERT INTO `pi_project` VALUES (7, '软件工程123111', '502D0199288C4D90BAFFEBEEBE927B0B软件工程实践项目1', 0, '2023-04-23 10:18:02', '2023-04-24 11:45:04');
INSERT INTO `pi_project` VALUES (6, '项目3', '项目3项目3项目3', 100, '2023-04-23 09:58:40', '2023-04-23 09:58:40');

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
INSERT INTO `pi_project_mission` VALUES ('ca8b361be69dc77b7c4510807139f405', 12, '123', NULL, NULL, '2023-04-24 14:01:54', NULL, '2023-04-24 14:37:05', '2023-04-24 14:37:09', NULL, NULL);
INSERT INTO `pi_project_mission` VALUES ('4dd4a198ad4c8ac2e87f314d24f31c8d', 8, '123', NULL, NULL, '2023-04-24 14:01:46', NULL, NULL, '2023-04-24 14:01:46', NULL, NULL);
INSERT INTO `pi_project_mission` VALUES ('fb6fb4dab2b1c6c16e63b027f68b0419', 8, '振兴中华', NULL, NULL, '2023-04-24 14:01:25', NULL, NULL, '2023-04-24 14:01:25', NULL, NULL);
INSERT INTO `pi_project_mission` VALUES ('53b035bc3296d8892d8b99e756a90a7e', 8, '振兴中华', '振兴中华', NULL, '2023-04-24 14:01:11', NULL, NULL, '2023-04-24 14:01:11', NULL, NULL);
INSERT INTO `pi_project_mission` VALUES ('3f02622f66cdff11f08b54df6263aabf', 12, '不错', NULL, NULL, '2023-04-24 13:57:37', '2023-04-24 13:57:25', '2023-04-29 00:00:00', '2023-04-24 13:57:53', NULL, NULL);
INSERT INTO `pi_project_mission` VALUES ('eb411f80b52df7454cd16a067c3f5909', 12, '建设共产主义社会', NULL, NULL, '2023-04-24 12:54:38', NULL, '2049-04-24 12:53:03', '2023-04-24 13:58:09', NULL, NULL);
INSERT INTO `pi_project_mission` VALUES ('b391a79869701fbc1d4016aad44a0ff0', 13, '振兴中国', NULL, NULL, '2023-04-24 12:53:37', NULL, '2049-04-24 12:53:03', '2023-04-24 13:58:12', NULL, NULL);
INSERT INTO `pi_project_mission` VALUES ('ababf19f200b24cb28e7861a99b9edb5', 13, '建设新中国', NULL, NULL, '2023-04-24 12:53:22', NULL, '1949-04-24 12:53:03', '2023-04-24 12:57:52', NULL, NULL);

-- ----------------------------
-- Table structure for pi_project_mission_rela_label
-- ----------------------------
DROP TABLE IF EXISTS `pi_project_mission_rela_label`;
CREATE TABLE `pi_project_mission_rela_label`  (
  `label_id` int(11) NOT NULL COMMENT '标签标识',
  `mission_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '任务标识',
  PRIMARY KEY (`label_id`, `mission_id`) USING BTREE,
  INDEX `FK_pi_project_mission_rela_label2`(`mission_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '任务拥有多个标签' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pi_project_mission_rela_label
-- ----------------------------
INSERT INTO `pi_project_mission_rela_label` VALUES (1, '3f02622f66cdff11f08b54df6263aabf');
INSERT INTO `pi_project_mission_rela_label` VALUES (2, '3f02622f66cdff11f08b54df6263aabf');
INSERT INTO `pi_project_mission_rela_label` VALUES (3, '3f02622f66cdff11f08b54df6263aabf');
INSERT INTO `pi_project_mission_rela_label` VALUES (3, 'ca8b361be69dc77b7c4510807139f405');
INSERT INTO `pi_project_mission_rela_label` VALUES (23, '3f02622f66cdff11f08b54df6263aabf');

SET FOREIGN_KEY_CHECKS = 1;
