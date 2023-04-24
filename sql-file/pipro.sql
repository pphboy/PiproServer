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

 Date: 23/04/2023 23:24:59
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
) ENGINE = MyISAM AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '项目标签' ROW_FORMAT = Dynamic;

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
INSERT INTO `pi_mission_member` VALUES ('4f17a993169e3f09b5d45501ecbb2eed', 3, '2023-04-23 22:03:44');
INSERT INTO `pi_mission_member` VALUES ('d3df391761f49a23d33c99ec83df811f', 3, '2023-04-23 22:03:36');
INSERT INTO `pi_mission_member` VALUES ('2b76a94d1d36fb633df2bb2cd4568015', 3, '2023-04-23 22:03:32');
INSERT INTO `pi_mission_member` VALUES ('ff17448bbe584453f43c9c4f49a3b616', 2, '2023-04-23 08:57:39');
INSERT INTO `pi_mission_member` VALUES ('24447f0bafa42dfdd1bd7f4aae2cce33', 2, '2023-04-23 08:57:39');
INSERT INTO `pi_mission_member` VALUES ('f7ecd03793030da344ec075dcc1ab006', 2, '2023-04-23 08:57:39');
INSERT INTO `pi_mission_member` VALUES ('497921eda592fbe4798c5ca6471939ac', 2, '2023-04-23 08:57:39');
INSERT INTO `pi_mission_member` VALUES ('76ce6c944bf9c12ceebe3d8626109d49', 2, '2023-04-23 08:57:39');
INSERT INTO `pi_mission_member` VALUES ('4a3a392b4a5d2842cdba480371876945', 2, '2023-04-23 08:57:39');
INSERT INTO `pi_mission_member` VALUES ('1b8432e104807cf5b7da26a36443044d', 2, '2023-04-23 08:57:39');
INSERT INTO `pi_mission_member` VALUES ('7e2e828b0505794811a52928f587b424', 2, '2023-04-23 08:57:39');
INSERT INTO `pi_mission_member` VALUES ('9c0a662a2c92f6995f5e64c098c7086a', 2, '2023-04-23 08:57:39');
INSERT INTO `pi_mission_member` VALUES ('ac129f6baa181ad4693666b7a51d9607', 2, '2023-04-23 08:57:39');
INSERT INTO `pi_mission_member` VALUES ('bcad4242646f15bc1fb5d8fa44abb9b8', 2, '2023-04-23 08:57:39');
INSERT INTO `pi_mission_member` VALUES ('e71f75d5ddea3ad6b2082a2e2072b920', 2, '2023-04-23 08:57:39');
INSERT INTO `pi_mission_member` VALUES ('ad5ab9466fc2a8af68bc61dfa6daa93a', 3, '2023-04-23 22:03:26');
INSERT INTO `pi_mission_member` VALUES ('03b1b3f55389972ca8ea70bc5af28993', 3, '2023-04-23 21:58:49');
INSERT INTO `pi_mission_member` VALUES ('14524da323405487dfc2965fac622453', 3, '2023-04-23 22:02:05');
INSERT INTO `pi_mission_member` VALUES ('300f4d984be84d4c92a54b23fb735af8', 2, '2023-04-23 20:41:12');
INSERT INTO `pi_mission_member` VALUES ('3b971472cadfc267d10c0b51469bc5a1', 2, '2023-04-23 08:57:39');
INSERT INTO `pi_mission_member` VALUES ('8990db5d82f93f1ea60b87b28700c000', 2, '2023-04-23 08:57:39');
INSERT INTO `pi_mission_member` VALUES ('1c79c95e3e59fe0a0dd353734b344ffa', 2, '2023-04-23 08:57:39');
INSERT INTO `pi_mission_member` VALUES ('6878528f7a6a13636e922c12d8bd9c3d', 2, '2023-04-23 08:57:39');
INSERT INTO `pi_mission_member` VALUES ('8c88f069b4592c14db9f46ae1c563cfe', 2, '2023-04-23 08:57:39');
INSERT INTO `pi_mission_member` VALUES ('a7cd3b3ed65f71412422931ed2b073fa', 2, '2023-04-23 08:57:39');
INSERT INTO `pi_mission_member` VALUES ('8584c4c26022d8aca0aeb4cef99704fb', 3, '2023-04-23 22:03:47');
INSERT INTO `pi_mission_member` VALUES ('67e0c652c0fc1f7f776e63e64d0bf66e', 2, '2023-04-23 08:57:39');
INSERT INTO `pi_mission_member` VALUES ('cafa9a978cf828e1a42368e298158bd2', 2, '2023-04-23 08:57:39');
INSERT INTO `pi_mission_member` VALUES ('2a336f065698a27a1b7e85990911b7a8', 2, '2023-04-23 08:57:39');
INSERT INTO `pi_mission_member` VALUES ('5b5a0736e27fe218014835616915e5b2', 2, '2023-04-23 09:41:22');
INSERT INTO `pi_mission_member` VALUES ('5e58870bd6bbe9ac6258f5f2b652cd31', 2, '2023-04-23 09:41:22');
INSERT INTO `pi_mission_member` VALUES ('1a467919e108f25c646a17c09a8e000f', 2, '2023-04-23 09:41:22');
INSERT INTO `pi_mission_member` VALUES ('b80e719b6b71418ef2f211326007aa1f', 2, '2023-04-23 09:41:22');
INSERT INTO `pi_mission_member` VALUES ('7c332e5a7ccb046211465b509062f357', 2, '2023-04-23 09:41:22');
INSERT INTO `pi_mission_member` VALUES ('a878f94a12273d3f4d6ff956277311ee', 2, '2023-04-23 09:41:22');
INSERT INTO `pi_mission_member` VALUES ('25e699d17e1e345ce34335694ae9edfb', 2, '2023-04-23 09:41:22');
INSERT INTO `pi_mission_member` VALUES ('cf44e5100cd45ee361b509e3fa71c6be', 2, '2023-04-23 09:41:22');
INSERT INTO `pi_mission_member` VALUES ('f5f3ea93d121857fe85054161768e5a3', 2, '2023-04-23 09:41:22');
INSERT INTO `pi_mission_member` VALUES ('78071727d7bf687d8744f80f834ba70a', 2, '2023-04-23 09:41:22');
INSERT INTO `pi_mission_member` VALUES ('ed9be387b8d579d235307dca0e09de5c', 2, '2023-04-23 09:41:22');
INSERT INTO `pi_mission_member` VALUES ('d4b3aa106a6cfaf51822ba74a56e4fb1', 2, '2023-04-23 09:41:22');
INSERT INTO `pi_mission_member` VALUES ('74ae1149332ec1b21bce33078a5f1741', 2, '2023-04-23 09:41:22');
INSERT INTO `pi_mission_member` VALUES ('e8ea5b9c13cd40b36d1539307b254dc4', 2, '2023-04-23 09:41:22');
INSERT INTO `pi_mission_member` VALUES ('6af887c31982ac742ce7a2525d04d9a5', 2, '2023-04-23 09:41:22');
INSERT INTO `pi_mission_member` VALUES ('f65eaa061963de2a2fe95e4c149190b7', 2, '2023-04-23 09:41:22');
INSERT INTO `pi_mission_member` VALUES ('66ed7da7adb266f8f1e83668c5bb82ba', 2, '2023-04-23 09:41:22');
INSERT INTO `pi_mission_member` VALUES ('279bc1bab30cf465d133424357203298', 2, '2023-04-23 09:41:22');
INSERT INTO `pi_mission_member` VALUES ('75deac1dfd9d2f689844d7700bf31e6d', 2, '2023-04-23 09:41:22');
INSERT INTO `pi_mission_member` VALUES ('5f13106483d8ee7eb5d17d51d1cd77da', 2, '2023-04-23 09:41:22');
INSERT INTO `pi_mission_member` VALUES ('adaae921ef2fc293280c4ae47b6cf626', 2, '2023-04-23 09:41:22');
INSERT INTO `pi_mission_member` VALUES ('fccc5ea03ca933315d511e1bca5a71fa', 2, '2023-04-23 09:41:22');
INSERT INTO `pi_mission_member` VALUES ('11dd019f87dcbb17172f6d8e17ab4287', 2, '2023-04-23 09:41:22');
INSERT INTO `pi_mission_member` VALUES ('a275be2e13bc473669c5221c71b7bfa4', 2, '2023-04-23 09:41:22');
INSERT INTO `pi_mission_member` VALUES ('ca4d558b0a36167901cbfcba7edef2d8', 2, '2023-04-23 09:41:22');
INSERT INTO `pi_mission_member` VALUES ('736f707db2510b63e2f787e0ef185e10', 2, '2023-04-23 09:41:22');
INSERT INTO `pi_mission_member` VALUES ('0577fdf5394937089277a4f4e65ec08a', 2, '2023-04-23 09:41:22');
INSERT INTO `pi_mission_member` VALUES ('533b5b8cf72ece0131484e7425438014', 2, '2023-04-23 09:41:22');
INSERT INTO `pi_mission_member` VALUES ('08fdb17b31bbb46667f1daaaa388166b', 2, '2023-04-23 09:41:22');
INSERT INTO `pi_mission_member` VALUES ('e3687b4c212d9ef39c8c68634de23493', 2, '2023-04-23 09:41:22');
INSERT INTO `pi_mission_member` VALUES ('b03952a1d84267bb47d737cd80b19d9a', 2, '2023-04-23 10:18:02');
INSERT INTO `pi_mission_member` VALUES ('b741216f322b9d56d537f58b1365238b', 2, '2023-04-23 10:18:02');
INSERT INTO `pi_mission_member` VALUES ('f6ba314d02168d6d87d5063957693813', 2, '2023-04-23 10:18:02');
INSERT INTO `pi_mission_member` VALUES ('e7230e88f1408716f877b086122a7b46', 2, '2023-04-23 10:18:02');
INSERT INTO `pi_mission_member` VALUES ('33110888198724302cb0bc63eecc4d20', 2, '2023-04-23 10:18:02');
INSERT INTO `pi_mission_member` VALUES ('3fb82cea5bbbb9ed528df9e4748ab3e3', 2, '2023-04-23 10:18:02');
INSERT INTO `pi_mission_member` VALUES ('85f3b00e8189788717702f291eac64be', 2, '2023-04-23 10:18:02');
INSERT INTO `pi_mission_member` VALUES ('dfafe7711f54d7b19a7c477ca9657e33', 2, '2023-04-23 10:18:02');
INSERT INTO `pi_mission_member` VALUES ('50ac885979afc52a95ced933108e3577', 2, '2023-04-23 10:18:02');
INSERT INTO `pi_mission_member` VALUES ('196318423168d4608a6f58aa900e8345', 2, '2023-04-23 10:18:02');
INSERT INTO `pi_mission_member` VALUES ('83f6970ec502a86a498e67607f5659b2', 2, '2023-04-23 10:18:02');
INSERT INTO `pi_mission_member` VALUES ('3df70e2de1436401a7a86049b066842a', 2, '2023-04-23 10:18:02');
INSERT INTO `pi_mission_member` VALUES ('bd687325c4b11b3680316d07a2494826', 2, '2023-04-23 10:18:02');
INSERT INTO `pi_mission_member` VALUES ('66c6cfd42167990ad38403d902fb1c55', 2, '2023-04-23 10:18:02');
INSERT INTO `pi_mission_member` VALUES ('e68b065a425f3b28b46faf42df346e1d', 2, '2023-04-23 10:18:02');
INSERT INTO `pi_mission_member` VALUES ('c21eb615cf9683be392a855ee3f84a46', 2, '2023-04-23 10:18:02');
INSERT INTO `pi_mission_member` VALUES ('0524fe0f8a84fe7de20ba284237a1035', 2, '2023-04-23 10:18:02');
INSERT INTO `pi_mission_member` VALUES ('580d9f7cddc53fcf0779df3b6c5e0846', 2, '2023-04-23 10:18:02');
INSERT INTO `pi_mission_member` VALUES ('f5895ce81079664dccdc4f3bce0e551c', 2, '2023-04-23 10:18:03');
INSERT INTO `pi_mission_member` VALUES ('db03a7bbc9808099d09da6ac7c0ee48b', 2, '2023-04-23 10:18:03');
INSERT INTO `pi_mission_member` VALUES ('d75d468e25f0c23ce71eb953dbe6dde5', 2, '2023-04-23 10:18:03');
INSERT INTO `pi_mission_member` VALUES ('318667235f2f166acb79a0d0917ee686', 2, '2023-04-23 10:18:03');
INSERT INTO `pi_mission_member` VALUES ('b541789689b44eafcf6c7caebea267a2', 2, '2023-04-23 10:18:03');
INSERT INTO `pi_mission_member` VALUES ('9714693bd09793a10c30b012e2923343', 2, '2023-04-23 10:18:03');
INSERT INTO `pi_mission_member` VALUES ('2f78796ee76e04168d43071aca43598e', 2, '2023-04-23 10:18:03');
INSERT INTO `pi_mission_member` VALUES ('a144ae8b50d8a671d03ef0c83811310a', 2, '2023-04-23 10:18:03');
INSERT INTO `pi_mission_member` VALUES ('e80e5ff40685721922a216e9193cca8c', 2, '2023-04-23 10:18:03');
INSERT INTO `pi_mission_member` VALUES ('016d36e2c195e40b6e4c301407a58b56', 2, '2023-04-23 10:18:03');
INSERT INTO `pi_mission_member` VALUES ('e814aaeee74d39a41bb3249a2e703c79', 2, '2023-04-23 10:18:03');
INSERT INTO `pi_mission_member` VALUES ('8af0e508466d4d12cfe025ece40e5b9e', 2, '2023-04-23 10:18:03');
INSERT INTO `pi_mission_member` VALUES ('df0a66c23cbeac70efd86c4e63127860', 3, '2023-04-23 22:03:50');

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
INSERT INTO `pi_project` VALUES (7, '软件工程123', '502D0199288C4D90BAFFEBEEBE927B0B软件工程实践项目', 0, '2023-04-23 10:18:02', '2023-04-23 10:18:22');
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
INSERT INTO `pi_project_mission` VALUES ('bbcdd79909aa147137d900e644df9e79', 8, '任务名0', '介绍7EF229EA550D4D89A56D429B4569B96D', 0, '2023-04-23 08:57:39', NULL, NULL, '2023-04-23 20:37:47', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('2e481c21500b10c800ea2b6b7418da03', 8, '任务名1', '介绍1D00ED35FE17406A87BA9D7823FC877F', 1, '2023-04-23 08:57:39', NULL, NULL, '2023-04-23 20:43:46', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('ad5ab9466fc2a8af68bc61dfa6daa93a', 8, '任务名2', '介绍DD5089F714FA43F698A3979329ABAA5D', 2, '2023-04-23 08:57:39', NULL, NULL, '2023-04-23 22:03:26', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('ff17448bbe584453f43c9c4f49a3b616', 8, '任务名3', '介绍F14B9B82A81E48DEB6D1A279C04F0C26', 3, '2023-04-23 08:57:39', NULL, NULL, '2023-04-23 08:57:39', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('24447f0bafa42dfdd1bd7f4aae2cce33', 8, '任务名4', '介绍42314FB850FC4A939420B7875A45CB58', 4, '2023-04-23 08:57:39', NULL, NULL, '2023-04-23 08:57:39', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('f7ecd03793030da344ec075dcc1ab006', 8, '任务名5', '介绍954BB4986E084B1CBC35585A637604E7', 5, '2023-04-23 08:57:39', NULL, NULL, '2023-04-23 08:57:39', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('497921eda592fbe4798c5ca6471939ac', 8, '任务名6', '介绍CEE604CC239A41CC89EF71E3858B052B', 6, '2023-04-23 08:57:39', NULL, NULL, '2023-04-23 08:57:39', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('76ce6c944bf9c12ceebe3d8626109d49', 8, '任务名7', '介绍30962A1EFD4D4EA2B9D80EA3C02C51B9', 7, '2023-04-23 08:57:39', NULL, NULL, '2023-04-23 08:57:39', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('4a3a392b4a5d2842cdba480371876945', 8, '任务名8', '介绍165D997D51C64E09BC3F42E8EC36EC3A', 8, '2023-04-23 08:57:39', NULL, NULL, '2023-04-23 08:57:39', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('1b8432e104807cf5b7da26a36443044d', 8, '任务名9', '介绍D387B6E6BA394AE1BFF3E2345F2A4743', 9, '2023-04-23 08:57:39', NULL, NULL, '2023-04-23 08:57:39', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('7e2e828b0505794811a52928f587b424', 8, '任务名10', '介绍D2965B2C65B34192B448D54160711D2F', 10, '2023-04-23 08:57:39', NULL, NULL, '2023-04-23 08:57:39', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('9c0a662a2c92f6995f5e64c098c7086a', 8, '任务名11', '介绍083818FE2119496BB42863DD9D733350', 11, '2023-04-23 08:57:39', NULL, NULL, '2023-04-23 08:57:39', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('ac129f6baa181ad4693666b7a51d9607', 8, '任务名12', '介绍B0AFDF1EE47C415FABD5C1C94BD56588', 12, '2023-04-23 08:57:39', NULL, NULL, '2023-04-23 08:57:39', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('bcad4242646f15bc1fb5d8fa44abb9b8', 8, '任务名13', '介绍914E38D39DE34B79A049A98320482B39', 13, '2023-04-23 08:57:39', NULL, NULL, '2023-04-23 08:57:39', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('e71f75d5ddea3ad6b2082a2e2072b920', 8, '任务名14', '介绍8888BBA4B3DB42C7B9A8488D2220C5AF', 14, '2023-04-23 08:57:39', NULL, NULL, '2023-04-23 08:57:39', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('d697e644abd9e51c5d71f4b771af948f', 9, '任务名0', '介绍5B24CFAC1CEF4D5E9DE0D4D7CF383C66', 0, '2023-04-23 08:57:39', NULL, NULL, '2023-04-23 20:39:48', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('7f591e42048b7dda8ae74f2683d1819c', 9, '任务名1123123', '介绍EFA22495E1E542A49A31102B6431482D', 1, '2023-04-23 08:57:39', NULL, NULL, '2023-04-23 20:39:55', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('03b1b3f55389972ca8ea70bc5af28993', 9, '任务名2', '介绍3A4F336635E7499F9BF2E624F2F484E6', 2, '2023-04-23 08:57:39', NULL, NULL, '2023-04-23 21:58:49', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('14524da323405487dfc2965fac622453', 9, '任务名3441', '介绍43EDE1C6C9AF4C628C7F9C2F5643BB4912', 3, '2023-04-23 08:57:39', '2023-04-23 22:00:52', '2023-04-23 22:00:53', '2023-04-23 22:02:05', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('300f4d984be84d4c92a54b23fb735af8', 9, '任务名4', '介绍B052B96E07F7443594EF32729479F868', 4, '2023-04-23 08:57:39', NULL, NULL, '2023-04-23 20:41:12', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('3b971472cadfc267d10c0b51469bc5a1', 9, '任务名5', '介绍B4335E8ABDF24FAF91F4874E9C402409', 5, '2023-04-23 08:57:39', NULL, NULL, '2023-04-23 08:57:39', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('8990db5d82f93f1ea60b87b28700c000', 9, '任务名6', '介绍53647E519AE341848810D520EDBACD20', 6, '2023-04-23 08:57:39', NULL, NULL, '2023-04-23 08:57:39', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('1c79c95e3e59fe0a0dd353734b344ffa', 9, '任务名7', '介绍6AA4C0A1D807413D8CCEFBD0A2A0C0E0', 7, '2023-04-23 08:57:39', NULL, NULL, '2023-04-23 08:57:39', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('6878528f7a6a13636e922c12d8bd9c3d', 9, '任务名8', '介绍7AB167D692EE4CCBB92686E1B8BBA376', 8, '2023-04-23 08:57:39', NULL, NULL, '2023-04-23 08:57:39', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('8c88f069b4592c14db9f46ae1c563cfe', 9, '任务名9', '介绍EA9C039D65A94043AECC51CA3A96755F', 9, '2023-04-23 08:57:39', NULL, NULL, '2023-04-23 08:57:39', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('a7cd3b3ed65f71412422931ed2b073fa', 9, '任务名10', '介绍14C3912CC83B4D1BBB3C4C3AF3CE4C96', 10, '2023-04-23 08:57:39', NULL, NULL, '2023-04-23 08:57:39', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('797a3cd00aead4d42850fcda645207fc', 9, '任务名11', '介绍BB1D8EA3CDCC42F997236FA22E0A2ADA', 11, '2023-04-23 08:57:39', NULL, NULL, '2023-04-23 20:37:42', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('67e0c652c0fc1f7f776e63e64d0bf66e', 9, '任务名12', '介绍6C59AC3429B24B2D8852CCE9219A6C24', 12, '2023-04-23 08:57:39', NULL, NULL, '2023-04-23 08:57:39', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('cafa9a978cf828e1a42368e298158bd2', 9, '任务名13', '介绍EC1F862CFE484B7C9F1C47E3D2B21DE9', 13, '2023-04-23 08:57:39', NULL, NULL, '2023-04-23 08:57:39', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('2a336f065698a27a1b7e85990911b7a8', 9, '任务名14', '介绍955F2662723D433F85733A494BACDF81', 14, '2023-04-23 08:57:39', NULL, NULL, '2023-04-23 08:57:39', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('5b5a0736e27fe218014835616915e5b2', 10, '任务名0', '介绍E02BF49520FF4986A23F44834B022A92', 0, '2023-04-23 09:41:22', '2023-04-23 09:41:22', '2023-04-23 09:41:22', '2023-04-23 09:41:22', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('5e58870bd6bbe9ac6258f5f2b652cd31', 10, '任务名1', '介绍E91C0CE8C63047BC9789D0FC1EB52C11', 1, '2023-04-23 09:41:22', '2023-04-23 09:41:22', '2023-04-23 09:41:22', '2023-04-23 09:41:22', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('1a467919e108f25c646a17c09a8e000f', 10, '任务名2', '介绍475D44B1E2E547AB87D23BB780550300', 2, '2023-04-23 09:41:22', '2023-04-23 09:41:22', '2023-04-23 09:41:22', '2023-04-23 09:41:22', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('b80e719b6b71418ef2f211326007aa1f', 10, '任务名3', '介绍283B36DD48D64BC8A5DFE0E39D34C2B0', 3, '2023-04-23 09:41:22', '2023-04-23 09:41:22', '2023-04-23 09:41:22', '2023-04-23 09:41:22', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('7c332e5a7ccb046211465b509062f357', 10, '任务名4', '介绍5109D9899C324F808D3F30298D13298A', 4, '2023-04-23 09:41:22', '2023-04-23 09:41:22', '2023-04-23 09:41:22', '2023-04-23 09:41:22', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('a878f94a12273d3f4d6ff956277311ee', 10, '任务名5', '介绍F7D8E053DDE849019E1B54EE9B8288E1', 5, '2023-04-23 09:41:22', '2023-04-23 09:41:22', '2023-04-23 09:41:22', '2023-04-23 09:41:22', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('25e699d17e1e345ce34335694ae9edfb', 10, '任务名6', '介绍7706658F9FD849B19A7CBAAEEFE9A43F', 6, '2023-04-23 09:41:22', '2023-04-23 09:41:22', '2023-04-23 09:41:22', '2023-04-23 09:41:22', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('cf44e5100cd45ee361b509e3fa71c6be', 10, '任务名7', '介绍A0F7AEF9D6C44CF0BFB142CCFC2C27B5', 7, '2023-04-23 09:41:22', '2023-04-23 09:41:22', '2023-04-23 09:41:22', '2023-04-23 09:41:22', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('f5f3ea93d121857fe85054161768e5a3', 10, '任务名8', '介绍FC316177B73548C785EACB38BD45939D', 8, '2023-04-23 09:41:22', '2023-04-23 09:41:22', '2023-04-23 09:41:22', '2023-04-23 09:41:22', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('78071727d7bf687d8744f80f834ba70a', 10, '任务名9', '介绍3093E01F6DE74E5FA2F498715112601E', 9, '2023-04-23 09:41:22', '2023-04-23 09:41:22', '2023-04-23 09:41:22', '2023-04-23 09:41:22', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('ed9be387b8d579d235307dca0e09de5c', 10, '任务名10', '介绍79F6AA9495FC44BEA60FFD76ED9CD960', 10, '2023-04-23 09:41:22', '2023-04-23 09:41:22', '2023-04-23 09:41:22', '2023-04-23 09:41:22', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('d4b3aa106a6cfaf51822ba74a56e4fb1', 10, '任务名11', '介绍652C3FD064AA4C2799924810C5A12A9D', 11, '2023-04-23 09:41:22', '2023-04-23 09:41:22', '2023-04-23 09:41:22', '2023-04-23 09:41:22', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('74ae1149332ec1b21bce33078a5f1741', 10, '任务名12', '介绍E2CC3C819D1849FAA62C7DBE34D62C19', 12, '2023-04-23 09:41:22', '2023-04-23 09:41:22', '2023-04-23 09:41:22', '2023-04-23 09:41:22', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('e8ea5b9c13cd40b36d1539307b254dc4', 10, '任务名13', '介绍3EB72E2769C2438F84E9F2EA136AF3F4', 13, '2023-04-23 09:41:22', '2023-04-23 09:41:22', '2023-04-23 09:41:22', '2023-04-23 09:41:22', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('6af887c31982ac742ce7a2525d04d9a5', 10, '任务名14', '介绍ACEF1FCB745E4FEA8C69987ECBE2F544', 14, '2023-04-23 09:41:22', '2023-04-23 09:41:22', '2023-04-23 09:41:22', '2023-04-23 09:41:22', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('f65eaa061963de2a2fe95e4c149190b7', 11, '任务名0', '介绍CED5F13954364DA898583DFFB504AEB8', 0, '2023-04-23 09:41:22', '2023-04-23 09:41:22', '2023-04-23 09:41:22', '2023-04-23 09:41:22', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('66ed7da7adb266f8f1e83668c5bb82ba', 11, '任务名1', '介绍AC817812EEF6448AA04445247C0A34F7', 1, '2023-04-23 09:41:22', '2023-04-23 09:41:22', '2023-04-23 09:41:22', '2023-04-23 09:41:22', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('279bc1bab30cf465d133424357203298', 11, '任务名2', '介绍61CAE2EC87C84CC1B875ED0949622E4D', 2, '2023-04-23 09:41:22', '2023-04-23 09:41:22', '2023-04-23 09:41:22', '2023-04-23 09:41:22', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('75deac1dfd9d2f689844d7700bf31e6d', 11, '任务名3', '介绍77AE98266A28449A863B8A007E07C784', 3, '2023-04-23 09:41:22', '2023-04-23 09:41:22', '2023-04-23 09:41:22', '2023-04-23 09:41:22', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('5f13106483d8ee7eb5d17d51d1cd77da', 11, '任务名4', '介绍A43F7A50D0E042DFA22002943741D4B6', 4, '2023-04-23 09:41:22', '2023-04-23 09:41:22', '2023-04-23 09:41:22', '2023-04-23 09:41:22', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('adaae921ef2fc293280c4ae47b6cf626', 11, '任务名5', '介绍7760ED8E1B5448C5974FB4DFC6ECDDD9', 5, '2023-04-23 09:41:22', '2023-04-23 09:41:22', '2023-04-23 09:41:22', '2023-04-23 09:41:22', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('fccc5ea03ca933315d511e1bca5a71fa', 11, '任务名6', '介绍9CD6A62C4E7743E3B5D4A5A765864B9B', 6, '2023-04-23 09:41:22', '2023-04-23 09:41:22', '2023-04-23 09:41:22', '2023-04-23 09:41:22', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('11dd019f87dcbb17172f6d8e17ab4287', 11, '任务名7', '介绍FB20953BB0F945BBAA9CED2B63FAA1D7', 7, '2023-04-23 09:41:22', '2023-04-23 09:41:22', '2023-04-23 09:41:22', '2023-04-23 09:41:22', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('a275be2e13bc473669c5221c71b7bfa4', 11, '任务名8', '介绍B6DC53F0459D420795F7DF338CE012E0', 8, '2023-04-23 09:41:22', '2023-04-23 09:41:22', '2023-04-23 09:41:22', '2023-04-23 09:41:22', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('ca4d558b0a36167901cbfcba7edef2d8', 11, '任务名9', '介绍CC01454C38E245AFB73DA95A53D71DBE', 9, '2023-04-23 09:41:22', '2023-04-23 09:41:22', '2023-04-23 09:41:22', '2023-04-23 09:41:22', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('736f707db2510b63e2f787e0ef185e10', 11, '任务名10', '介绍79D98EE475DA4103B00C96DBD45676A8', 10, '2023-04-23 09:41:22', '2023-04-23 09:41:22', '2023-04-23 09:41:22', '2023-04-23 09:41:22', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('0577fdf5394937089277a4f4e65ec08a', 11, '任务名11', '介绍35DC5438888A4BC4935CFD12C6EF0C0C', 11, '2023-04-23 09:41:22', '2023-04-23 09:41:22', '2023-04-23 09:41:22', '2023-04-23 09:41:22', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('533b5b8cf72ece0131484e7425438014', 11, '任务名12', '介绍CE7B39EE0E30419BBED1685913AB31C7', 12, '2023-04-23 09:41:22', '2023-04-23 09:41:22', '2023-04-23 09:41:22', '2023-04-23 09:41:22', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('08fdb17b31bbb46667f1daaaa388166b', 11, '任务名13', '介绍82578323B2434F29A01FDD136197264B', 13, '2023-04-23 09:41:22', '2023-04-23 09:41:22', '2023-04-23 09:41:22', '2023-04-23 09:41:22', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('e3687b4c212d9ef39c8c68634de23493', 11, '任务名14', '介绍15C6AF9327A04C0FB5AC39855EFC278E', 14, '2023-04-23 09:41:22', '2023-04-23 09:41:22', '2023-04-23 09:41:22', '2023-04-23 09:41:22', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('b03952a1d84267bb47d737cd80b19d9a', 12, '任务名0', '介绍BEA302E941E04A96AEFC5820AA1B5D63', 0, '2023-04-23 10:18:02', '2023-04-23 10:18:02', '2023-04-23 10:18:02', '2023-04-23 10:18:02', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('b741216f322b9d56d537f58b1365238b', 12, '任务名1', '介绍1E61B2692CFC463C8AB9EF0DB7FCD5E0', 1, '2023-04-23 10:18:02', '2023-04-23 10:18:02', '2023-04-23 10:18:02', '2023-04-23 10:18:02', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('f6ba314d02168d6d87d5063957693813', 12, '任务名2', '介绍2681E02A8969469E8D617B75A80FE25D', 2, '2023-04-23 10:18:02', '2023-04-23 10:18:02', '2023-04-23 10:18:02', '2023-04-23 10:18:02', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('e7230e88f1408716f877b086122a7b46', 12, '任务名3', '介绍ECC3DF7419C44FEEAEDDDA64C6B8E720', 3, '2023-04-23 10:18:02', '2023-04-23 10:18:02', '2023-04-23 10:18:02', '2023-04-23 10:18:02', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('33110888198724302cb0bc63eecc4d20', 12, '任务名4', '介绍98D76967CF724E79A1D838CA3FF45529', 4, '2023-04-23 10:18:02', '2023-04-23 10:18:02', '2023-04-23 10:18:02', '2023-04-23 10:18:02', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('3fb82cea5bbbb9ed528df9e4748ab3e3', 12, '任务名5', '介绍C839DFF7CC6D41138ACBFE0C163C497D', 5, '2023-04-23 10:18:02', '2023-04-23 10:18:02', '2023-04-23 10:18:02', '2023-04-23 10:18:02', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('85f3b00e8189788717702f291eac64be', 12, '任务名6', '介绍C74FC2F966284DCF8B364304F9950E79', 6, '2023-04-23 10:18:02', '2023-04-23 10:18:02', '2023-04-23 10:18:02', '2023-04-23 10:18:02', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('dfafe7711f54d7b19a7c477ca9657e33', 12, '任务名7', '介绍2994E56FF76948468B23DE1F6D65CF52', 7, '2023-04-23 10:18:02', '2023-04-23 10:18:02', '2023-04-23 10:18:02', '2023-04-23 10:18:02', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('50ac885979afc52a95ced933108e3577', 12, '任务名8', '介绍C94D1527681E42D6AC41B7D16E0F9DB9', 8, '2023-04-23 10:18:02', '2023-04-23 10:18:02', '2023-04-23 10:18:02', '2023-04-23 10:18:02', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('196318423168d4608a6f58aa900e8345', 12, '任务名9', '介绍B4B72BB035DC43E19A4F0132BD102C03', 9, '2023-04-23 10:18:02', '2023-04-23 10:18:02', '2023-04-23 10:18:02', '2023-04-23 10:18:02', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('83f6970ec502a86a498e67607f5659b2', 12, '任务名10', '介绍DFD0AA0D3CAB49AEA5B352F770F31450', 10, '2023-04-23 10:18:02', '2023-04-23 10:18:02', '2023-04-23 10:18:02', '2023-04-23 10:18:02', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('3df70e2de1436401a7a86049b066842a', 12, '任务名11', '介绍C005BB5AFF1340D48B2D7435A37FF180', 11, '2023-04-23 10:18:02', '2023-04-23 10:18:02', '2023-04-23 10:18:02', '2023-04-23 10:18:02', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('bd687325c4b11b3680316d07a2494826', 12, '任务名12', '介绍5ECD5FA22FB8433FBD4E86C43B816A6F', 12, '2023-04-23 10:18:02', '2023-04-23 10:18:02', '2023-04-23 10:18:02', '2023-04-23 10:18:02', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('66c6cfd42167990ad38403d902fb1c55', 12, '任务名13', '介绍644570C6C7664C179A7534576E32CE56', 13, '2023-04-23 10:18:02', '2023-04-23 10:18:02', '2023-04-23 10:18:02', '2023-04-23 10:18:02', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('e68b065a425f3b28b46faf42df346e1d', 12, '任务名14', '介绍AB20791FC1F04FECBE62673D3EBE4895', 14, '2023-04-23 10:18:02', '2023-04-23 10:18:02', '2023-04-23 10:18:02', '2023-04-23 10:18:02', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('c21eb615cf9683be392a855ee3f84a46', 13, '任务名0', '介绍8E4F946A0DDB4BBA96DAFB5F2CB33FCE', 0, '2023-04-23 10:18:02', '2023-04-23 10:18:02', '2023-04-23 10:18:02', '2023-04-23 10:18:02', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('0524fe0f8a84fe7de20ba284237a1035', 13, '任务名1', '介绍A132D09D6AD64DCD8CF1AF4D8CAACF0A', 1, '2023-04-23 10:18:02', '2023-04-23 10:18:02', '2023-04-23 10:18:02', '2023-04-23 10:18:02', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('580d9f7cddc53fcf0779df3b6c5e0846', 13, '任务名2', '介绍0AA9AE50AAD54FA197AE0026E835A91D', 2, '2023-04-23 10:18:02', '2023-04-23 10:18:02', '2023-04-23 10:18:02', '2023-04-23 10:18:02', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('f5895ce81079664dccdc4f3bce0e551c', 13, '任务名3', '介绍58FAF85DCDF74BAD8402AAB82A9D4C1E', 3, '2023-04-23 10:18:03', '2023-04-23 10:18:02', '2023-04-23 10:18:02', '2023-04-23 10:18:03', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('db03a7bbc9808099d09da6ac7c0ee48b', 13, '任务名4', '介绍145C173DD2A348048B0DA630392D947C', 4, '2023-04-23 10:18:03', '2023-04-23 10:18:03', '2023-04-23 10:18:03', '2023-04-23 10:18:03', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('d75d468e25f0c23ce71eb953dbe6dde5', 13, '任务名5', '介绍9C266400813A4030A244C0D30922D7FD', 5, '2023-04-23 10:18:03', '2023-04-23 10:18:03', '2023-04-23 10:18:03', '2023-04-23 10:18:03', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('318667235f2f166acb79a0d0917ee686', 13, '任务名6', '介绍0544FE42AD094D7C8641A76655F68F33', 6, '2023-04-23 10:18:03', '2023-04-23 10:18:03', '2023-04-23 10:18:03', '2023-04-23 10:18:03', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('b541789689b44eafcf6c7caebea267a2', 13, '任务名7', '介绍F25ABCC9400A44F99ED64A5BE79B0D33', 7, '2023-04-23 10:18:03', '2023-04-23 10:18:03', '2023-04-23 10:18:03', '2023-04-23 10:18:03', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('9714693bd09793a10c30b012e2923343', 13, '任务名8', '介绍8173963364C847639CA9172CC5B68803', 8, '2023-04-23 10:18:03', '2023-04-23 10:18:03', '2023-04-23 10:18:03', '2023-04-23 10:18:03', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('2f78796ee76e04168d43071aca43598e', 13, '任务名9', '介绍DAD82953FEEA426BBD5957894486CCFF', 9, '2023-04-23 10:18:03', '2023-04-23 10:18:03', '2023-04-23 10:18:03', '2023-04-23 10:18:03', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('a144ae8b50d8a671d03ef0c83811310a', 13, '任务名10', '介绍FB7094F0F6744C93966D5E8924453D88', 10, '2023-04-23 10:18:03', '2023-04-23 10:18:03', '2023-04-23 10:18:03', '2023-04-23 10:18:03', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('e80e5ff40685721922a216e9193cca8c', 13, '任务名11', '介绍EA8C38D365A54E4B8CBCA5EE55016080', 11, '2023-04-23 10:18:03', '2023-04-23 10:18:03', '2023-04-23 10:18:03', '2023-04-23 10:18:03', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('016d36e2c195e40b6e4c301407a58b56', 13, '任务名12', '介绍8976F19201C249738AF791E22D29B364', 12, '2023-04-23 10:18:03', '2023-04-23 10:18:03', '2023-04-23 10:18:03', '2023-04-23 10:18:03', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('e814aaeee74d39a41bb3249a2e703c79', 13, '任务名13', '介绍8E2CEDABFB364236A2F43E176CA1306F', 13, '2023-04-23 10:18:03', '2023-04-23 10:18:03', '2023-04-23 10:18:03', '2023-04-23 10:18:03', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('8af0e508466d4d12cfe025ece40e5b9e', 13, '任务名14', '介绍C9382F3EBFB945EEA2AE1C65FBD397F4', 14, '2023-04-23 10:18:03', '2023-04-23 10:18:03', '2023-04-23 10:18:03', '2023-04-23 10:18:03', 0, 1);
INSERT INTO `pi_project_mission` VALUES ('c19ca6b77b59d41dc81c454a47e26a5f', 13, 'Incredible Metal Keyboard', 'Refined Soft Bike', NULL, '2023-04-23 16:42:20', '2023-03-05 11:11:11', '2023-05-05 11:11:11', '2023-04-23 16:42:20', NULL, NULL);
INSERT INTO `pi_project_mission` VALUES ('7491be68c00b78302f995c4c835ee731', 13, 'Tasty Frozen Hat', 'Handcrafted Fresh Salad', NULL, '2023-04-23 16:43:28', '2023-03-05 11:11:11', '2023-05-05 11:11:11', '2023-04-23 16:43:28', NULL, NULL);
INSERT INTO `pi_project_mission` VALUES ('ddc9189a285061ef6210002df27f863c', 12, '123123', NULL, NULL, '2023-04-23 17:19:33', '2023-04-23 17:19:32', NULL, '2023-04-23 17:19:33', NULL, NULL);
INSERT INTO `pi_project_mission` VALUES ('08f18090b47c0148df04c6a783bc4fdf', 12, '123123', NULL, NULL, '2023-04-23 17:20:09', '2023-04-23 17:19:32', '2023-04-23 17:20:05', '2023-04-23 17:20:09', NULL, NULL);
INSERT INTO `pi_project_mission` VALUES ('63ed8485d9829ec73b60247806b020c6', 12, '123123', NULL, NULL, '2023-04-23 17:21:23', '2023-04-23 17:19:32', '2023-04-23 17:20:05', '2023-04-23 17:21:23', NULL, NULL);
INSERT INTO `pi_project_mission` VALUES ('1a1f053cb42b858cc631037e7e100b43', 12, '我爱中国', NULL, NULL, '2023-04-23 17:24:54', NULL, NULL, '2023-04-23 17:24:54', NULL, NULL);
INSERT INTO `pi_project_mission` VALUES ('5ca279b5de481e135156452cabb7f934', 12, '我爱中国', NULL, NULL, '2023-04-23 17:25:17', '2023-04-23 17:25:13', '2023-04-12 00:00:00', '2023-04-23 17:25:17', NULL, NULL);
INSERT INTO `pi_project_mission` VALUES ('14a0b7431b0dc1550d6475f5264d4ff0', 12, '我爱中国', NULL, NULL, '2023-04-23 17:25:52', '2023-04-23 17:25:48', '2023-04-26 00:00:00', '2023-04-23 17:25:52', NULL, NULL);
INSERT INTO `pi_project_mission` VALUES ('37cec1a3087ab4fcd88d19358ecb293f', 12, '创建一个任务', NULL, NULL, '2023-04-23 17:29:13', NULL, '2023-04-03 00:00:00', '2023-04-23 17:29:13', NULL, NULL);
INSERT INTO `pi_project_mission` VALUES ('f9599f7b73b832c4b5037a50eda06223', 13, 'NeverEverGiveUp', '让中华震惊世界', NULL, '2023-04-23 17:29:45', NULL, '2024-04-24 12:00:00', '2023-04-23 20:35:40', NULL, NULL);
INSERT INTO `pi_project_mission` VALUES ('c5a9dc1236880d677d994710ac353da6', 12, '振兴中华', NULL, NULL, '2023-04-23 17:34:02', '2023-04-23 17:33:52', '2023-04-27 00:00:00', '2023-04-23 17:34:02', NULL, NULL);
INSERT INTO `pi_project_mission` VALUES ('c5b70a622ff88160017f795cac7c23f5', 12, '振兴中华', '振兴中华', NULL, '2023-04-23 17:34:56', '2023-04-23 17:33:52', '2023-04-27 00:00:00', '2023-04-23 17:34:56', NULL, NULL);
INSERT INTO `pi_project_mission` VALUES ('6222914b21a1d8d71214cb82d19a0f72', 13, '振兴 中 华', '123123123123让中华震惊世界', NULL, '2023-04-23 17:35:56', '2023-04-23 17:35:49', '2023-04-23 17:35:51', '2023-04-23 20:35:12', NULL, NULL);
INSERT INTO `pi_project_mission` VALUES ('2b76a94d1d36fb633df2bb2cd4568015', 8, '234234234', NULL, NULL, '2023-04-23 22:03:32', NULL, NULL, '2023-04-23 22:03:32', NULL, NULL);
INSERT INTO `pi_project_mission` VALUES ('d3df391761f49a23d33c99ec83df811f', 8, '234234234', NULL, NULL, '2023-04-23 22:03:36', NULL, NULL, '2023-04-23 22:03:36', NULL, NULL);
INSERT INTO `pi_project_mission` VALUES ('4f17a993169e3f09b5d45501ecbb2eed', 8, '234234234', NULL, NULL, '2023-04-23 22:03:44', NULL, NULL, '2023-04-23 22:03:44', NULL, NULL);
INSERT INTO `pi_project_mission` VALUES ('8584c4c26022d8aca0aeb4cef99704fb', 8, '234234234', NULL, NULL, '2023-04-23 22:03:47', NULL, NULL, '2023-04-23 22:03:47', NULL, NULL);
INSERT INTO `pi_project_mission` VALUES ('df0a66c23cbeac70efd86c4e63127860', 8, '234234234', NULL, 10000, '2023-04-23 22:03:50', NULL, NULL, '2023-04-23 22:03:50', NULL, NULL);

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
INSERT INTO `pi_project_mission_rela_label` VALUES (1, '6222914b21a1d8d71214cb82d19a0f72');
INSERT INTO `pi_project_mission_rela_label` VALUES (1, 'c5b70a622ff88160017f795cac7c23f5');
INSERT INTO `pi_project_mission_rela_label` VALUES (1, 'f9599f7b73b832c4b5037a50eda06223');
INSERT INTO `pi_project_mission_rela_label` VALUES (2, '6222914b21a1d8d71214cb82d19a0f72');
INSERT INTO `pi_project_mission_rela_label` VALUES (2, 'c5b70a622ff88160017f795cac7c23f5');
INSERT INTO `pi_project_mission_rela_label` VALUES (3, 'c5b70a622ff88160017f795cac7c23f5');
INSERT INTO `pi_project_mission_rela_label` VALUES (11, '03b1b3f55389972ca8ea70bc5af28993');
INSERT INTO `pi_project_mission_rela_label` VALUES (11, '14524da323405487dfc2965fac622453');
INSERT INTO `pi_project_mission_rela_label` VALUES (11, '2e481c21500b10c800ea2b6b7418da03');
INSERT INTO `pi_project_mission_rela_label` VALUES (11, '7f591e42048b7dda8ae74f2683d1819c');
INSERT INTO `pi_project_mission_rela_label` VALUES (11, 'ad5ab9466fc2a8af68bc61dfa6daa93a');
INSERT INTO `pi_project_mission_rela_label` VALUES (11, 'bbcdd79909aa147137d900e644df9e79');
INSERT INTO `pi_project_mission_rela_label` VALUES (11, 'd697e644abd9e51c5d71f4b771af948f');
INSERT INTO `pi_project_mission_rela_label` VALUES (18, '2e481c21500b10c800ea2b6b7418da03');
INSERT INTO `pi_project_mission_rela_label` VALUES (22, '14524da323405487dfc2965fac622453');
INSERT INTO `pi_project_mission_rela_label` VALUES (22, '300f4d984be84d4c92a54b23fb735af8');
INSERT INTO `pi_project_mission_rela_label` VALUES (22, '797a3cd00aead4d42850fcda645207fc');
INSERT INTO `pi_project_mission_rela_label` VALUES (22, 'bbcdd79909aa147137d900e644df9e79');

SET FOREIGN_KEY_CHECKS = 1;
