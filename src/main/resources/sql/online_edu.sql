/*
 Navicat Premium Data Transfer

 Source Server         : online_edu
 Source Server Type    : MySQL
 Source Server Version : 80033
 Source Host           : localhost:3306
 Source Schema         : online_edu

 Target Server Type    : MySQL
 Target Server Version : 80033
 File Encoding         : 65001

 Date: 30/06/2023 18:41:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for edu_answer
-- ----------------------------
DROP TABLE IF EXISTS `edu_answer`;
CREATE TABLE `edu_answer`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL,
  `question_id` int NULL DEFAULT NULL,
  `answer_id` int NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `score` double NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of edu_answer
-- ----------------------------

-- ----------------------------
-- Table structure for edu_carousel
-- ----------------------------
DROP TABLE IF EXISTS `edu_carousel`;
CREATE TABLE `edu_carousel`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `sort` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of edu_carousel
-- ----------------------------
INSERT INTO `edu_carousel` VALUES (1, '图片0001', 'http://rwxu06s4o.hd-bkt.clouddn.com/img/mycat.jpg', 1);
INSERT INTO `edu_carousel` VALUES (2, '图片002', 'http://rwxu06s4o.hd-bkt.clouddn.com/img/layui.png', 2);
INSERT INTO `edu_carousel` VALUES (3, '图片003', 'http://rwxu06s4o.hd-bkt.clouddn.com/img/spring4.jpg', 3);

-- ----------------------------
-- Table structure for edu_classify
-- ----------------------------
DROP TABLE IF EXISTS `edu_classify`;
CREATE TABLE `edu_classify`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '名称',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `remark` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of edu_classify
-- ----------------------------
INSERT INTO `edu_classify` VALUES (1, 'Java后端', 1, 'Java后端');
INSERT INTO `edu_classify` VALUES (3, '数据库', 3, '数据库');
INSERT INTO `edu_classify` VALUES (4, '前端', 4, '前端');

-- ----------------------------
-- Table structure for edu_course
-- ----------------------------
DROP TABLE IF EXISTS `edu_course`;
CREATE TABLE `edu_course`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '名称',
  `image_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '缩略图',
  `type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '类别',
  `content` varchar(10000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '内容',
  `teacher_id` int NULL DEFAULT NULL COMMENT '教师id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `classify_id` int NULL DEFAULT NULL COMMENT '分类id',
  `ggkc` int NULL DEFAULT 0 COMMENT '公共课程',
  `zykc` int NULL DEFAULT 0 COMMENT '专业课程',
  `mfkc` int NULL DEFAULT 0 COMMENT '免费课程',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of edu_course
-- ----------------------------
INSERT INTO `edu_course` VALUES (1, 'SpringMvc视频教程', 'http://rwxu06s4o.hd-bkt.clouddn.com/img/springmvc.png', 'free', '<p><img src=\"http://localhost:8081/getFileURL/file/20200814/mybatis-plus(1).jpg\" alt=\"mybatis-plus.jpg\"></p><p>Spring MVC属于SpringFrameWork的后续产品，已经融合在Spring Web Flow里面。</p><p>Spring 框架提供了构建 Web 应用程序的全功能 MVC 模块。</p><p>使用 Spring 可插入的 MVC 架构，从而在使用Spring进行WEB开发时，</p><p>可以选择使用Spring的Spring MVC框架或集成其他MVC开发框架，</p><p>如Struts1(现在一般不用)，Struts 2(一般老项目使用)等等21312312321。</p>', 1, '2020-08-14 17:43:29', 1, 1, 0, 1);
INSERT INTO `edu_course` VALUES (2, 'SpringBoot快速入门视频教程', 'http://rwxu06s4o.hd-bkt.clouddn.com/img/springboot.png', 'free', '<p>Spring Boot是由Pivotal团队提供的全新框架，其设计目的是用来简化新Spring应用的初始搭建以及开发过程。该框架使用了特定的方式来进行配置，从而使开发人员不再需要定义样板化的配置。通过这种方式，Spring Boot致力于在蓬勃发展的快速应用开发领域(rapid application development)成为领导者。</p><p><br></p>', 1, '2020-08-16 09:14:53', 1, 1, 1, 1);
INSERT INTO `edu_course` VALUES (3, 'Spring4视频教程', 'http://rwxu06s4o.hd-bkt.clouddn.com/img/spring4.jpg', 'free', '<p><span>Spring框架是一个开放源代码的J2EE应用程序框架，由Rod Johnson发起，是针对bean的生命周期进行管理的轻量级容器（lightweight container）。 Spring解决了开发者在J2EE开发中遇到的许多常见的问题，提供了功能强大IOC、AOP及Web MVC等功能。Spring可以单独应用于构筑应用程序，也可以和Struts、Webwork、Tapestry等众多Web框架组合使用，并且可以与 Swing等桌面应用程序AP组合。因此， Spring不仅仅能应用于JEE应用程序之中，也可以应用于桌面应用程序以及小应用程序之中。Spring框架主要由七部分组成，分别是 Spring Core、 Spring AOP、 Spring ORM、 Spring DAO、Spring Context、 Spring Web和 Spring Web MVC。 [1]</span></p>', 2, '2020-08-16 09:16:36', 1, 0, 0, 1);
INSERT INTO `edu_course` VALUES (4, 'vue视频教程', 'http://rwxu06s4o.hd-bkt.clouddn.com/img/vue.png', 'audition', '<p><img src=\"http://localhost:8081/getFileURL/file/20200816/vue23.jpg\" alt=\"vue23.jpg\"></p><p>Vue.js（读音 /vjuː/, 类似于 view） 是一套构建用户界面的渐进式框架。</p><p>Vue 只关注视图层， 采用自底向上增量开发的设计。</p><p>Vue 的目标是通过尽可能简单的 API 实现响应的数据绑定和组合的视图组件。</p><p>Vue 学习起来非常简单，本教程基于 Vue 2.1.8 版本测试。</p>', 2, '2020-08-16 09:18:46', 4, 1, 0, 0);
INSERT INTO `edu_course` VALUES (5, 'mysql数据库视频教程', 'http://rwxu06s4o.hd-bkt.clouddn.com/img/mysql.png', 'audition', '<p>MySQL是一个关系型数据库管理系统，由瑞典MySQL AB 公司开发，属于 Oracle 旗下产品。MySQL 是最流行的关系型数据库管理系统之一，在 WEB 应用方面，MySQL是最好的 RDBMS (Relational Database Management System，关系数据库管理系统) 应用软件之一。</p><p><br>&nbsp; &nbsp;MySQL是一种关系型数据库管理系统，关系数据库将数据保存在不同的表中，而不是将所有数据放在一个大仓库内，这样就增加了速度并提高了灵活性。</p><p><br>&nbsp; &nbsp; MySQL所使用的 SQL 语言是用于访问数据库的最常用标准化语言。MySQL 软件采用了双授权政策，分为社区版和商业版，由于其体积小、速度快、总体拥有成本低，尤其是开放源码这一特点，一般中小型网站的开发都选择 MySQL 作为网站数据库。</p>', 1, '2020-08-16 09:20:50', 3, 0, 1, 0);
INSERT INTO `edu_course` VALUES (6, 'Shiro视频教程', 'http://rwxu06s4o.hd-bkt.clouddn.com/img/shiro.jpg', 'audition', '<p><span>Apache Shiro（读作“sheeroh”，即日语“城”）是一个开源安全框架，提供身份验证、授权、密码学和会话管理。Shiro框架直观、易用，同时也能提供健壮的安全性。</span></p>', 1, '2020-08-16 09:22:40', 1, 1, 0, 0);
INSERT INTO `edu_course` VALUES (7, 'Layui框架视频教程', 'http://rwxu06s4o.hd-bkt.clouddn.com/img/layui.png', 'free', '<p><span>layui（谐音：类UI) 是一款采用自身模块规范编写的前端 UI 框架，遵循原生 HTML/CSS/JS 的书写与组织形式，门槛极低，拿来即用。其外在极简，却又不失饱满的内在，体积轻盈，组件丰盈，从核心代码到 API 的每一处细节都经过精心雕琢，非常适合界面的快速开发。layui 首个版本发布于 2016 年金秋，她区别于那些基于 MVVM 底层的 UI 框架，却并非逆道而行，而是信奉返璞归真之道。准确地说，她更多是为服务端程序员量身定做，你无需涉足各种前端工具的复杂配置，只需面对浏览器本身，让一切你所需要的元素与交互，从这里信手拈来。</span></p>', 1, '2020-08-16 09:24:14', 4, 0, 1, 1);
INSERT INTO `edu_course` VALUES (8, 'SpringBoot打造电影网站视频教程', 'http://rwxu06s4o.hd-bkt.clouddn.com/img/springboot.png', 'audition', '<p><span>本系统采用SpringBoot架构，数据访问层采用Spring Data Jpa，业务控制层采用SpringMvc，安全框架采用Spring Security以及采用thymeleaf模版引擎和restful风格；本视频教程详细讲解了次系统的完整开发，亮点是SpringBoot的综合应用，以及thymeleaf模版引擎的应用；</span></p><p><span><img src=\"http://localhost:8081/getFileURL/file/20200816/20200712065841.png\" alt=\"20200712065841.png\"><br></span></p>', 2, '2020-08-16 20:24:33', 1, 0, 0, 0);
INSERT INTO `edu_course` VALUES (9, 'mycat视频教程', 'http://rwxu06s4o.hd-bkt.clouddn.com/img/mycat.jpg', 'free', '<p><img src=\"http://localhost:8081/getFileURL/file/20200816/mycat2.jpg\" alt=\"mycat2.jpg\"></p><p><strong>MyCAT&nbsp;</strong><span>是一个彻底开源的，面向企业应用开发的“大数据库集群” 支持事务、ACID、可以替代Mysql的加强版数据库 ? 一个可以视为“Mysql”集群的企业级数据库，用来替代昂贵的Oracle集群 ? 一个融合内存缓存技术、Nosql技术、HDFS大数据的新型SQL Server ? 结合传统数据库和新型分布式数据仓库的新一代企业级数据库产品 ? 一个新颖的数据库中间件产品。</span></p>', 1, '2020-08-16 20:28:10', 3, 1, 1, 1);
INSERT INTO `edu_course` VALUES (10, 'springboot项目实战', 'http://rwxu06s4o.hd-bkt.clouddn.com/img/springboot.png', 'free', '<p><img src=\"http://localhost:8081/getFileURL/file/20200819/mysql.jpg\" alt=\"mysql.jpg\"></p><p>springboot项目实战springboot项目实战springboot项目实战</p><p>springboot项目实战springboot项目实战springboot项目实战</p><p>springboot项目实战springboot项目实战springboot项目实战</p>', 1, '2020-08-19 22:52:26', 1, 1, 1, 1);

-- ----------------------------
-- Table structure for edu_course_menu
-- ----------------------------
DROP TABLE IF EXISTS `edu_course_menu`;
CREATE TABLE `edu_course_menu`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '名称',
  `url` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '路径',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `icon` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '图标',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of edu_course_menu
-- ----------------------------
INSERT INTO `edu_course_menu` VALUES (1, '首页', '/default/default', 1, '');
INSERT INTO `edu_course_menu` VALUES (2, '课程', '/default/course', 2, '');
INSERT INTO `edu_course_menu` VALUES (3, '考试', '/default/homework', 3, NULL);

-- ----------------------------
-- Table structure for edu_exam
-- ----------------------------
DROP TABLE IF EXISTS `edu_exam`;
CREATE TABLE `edu_exam`  (
  `exam_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `exam_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `exam_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`exam_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of edu_exam
-- ----------------------------
INSERT INTO `edu_exam` VALUES ('4235ec27-0686-4780-9c65-14e37b2c3509', '123', 'god给');

-- ----------------------------
-- Table structure for edu_menu
-- ----------------------------
DROP TABLE IF EXISTS `edu_menu`;
CREATE TABLE `edu_menu`  (
  `menu_id` int NOT NULL AUTO_INCREMENT COMMENT '菜单id',
  `parent_id` int NOT NULL DEFAULT 0 COMMENT '上级id,0是顶级',
  `menu_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '菜单名称',
  `menu_icon` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `path` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '菜单地址',
  `menu_type` int NULL DEFAULT 0 COMMENT '类型,0菜单,1按钮',
  `sort_number` int NOT NULL DEFAULT 1 COMMENT '排序号',
  `authority` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `target` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '_self' COMMENT '打开位置',
  `icon_color` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '图标颜色',
  `hide` int NOT NULL DEFAULT 0 COMMENT '是否隐藏,0否,1是',
  `deleted` int NOT NULL DEFAULT 0 COMMENT '是否删除,0否,1是',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 67 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '菜单' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of edu_menu
-- ----------------------------
INSERT INTO `edu_menu` VALUES (1, 0, '系统管理', 'layui-icon layui-icon-set-sm', NULL, 0, 1, NULL, '_self', NULL, 0, 0, '2020-02-26 12:51:23', '2020-03-21 18:47:00');
INSERT INTO `edu_menu` VALUES (2, 1, '用户管理', NULL, 'sys/user', 0, 1, 'sys:user:view', '_self', NULL, 0, 0, '2020-02-26 12:51:55', '2020-03-21 18:45:26');
INSERT INTO `edu_menu` VALUES (3, 2, '查询用户', NULL, NULL, 1, 1, 'sys:user:list', '_self', NULL, 0, 0, '2020-02-26 12:52:06', '2020-03-21 18:45:28');
INSERT INTO `edu_menu` VALUES (4, 2, '添加用户', NULL, NULL, 1, 2, 'sys:user:save', '_self', NULL, 0, 0, '2020-02-26 12:52:26', '2020-03-21 18:45:29');
INSERT INTO `edu_menu` VALUES (5, 2, '修改用户', NULL, NULL, 1, 3, 'sys:user:update', '_self', NULL, 0, 0, '2020-02-26 12:52:50', '2020-03-21 18:45:30');
INSERT INTO `edu_menu` VALUES (6, 2, '删除用户', NULL, NULL, 1, 4, 'sys:user:remove', '_self', NULL, 0, 0, '2020-02-26 12:53:13', '2020-03-21 18:45:32');
INSERT INTO `edu_menu` VALUES (7, 1, '角色管理', NULL, 'sys/role', 0, 2, 'sys:role:view', '_self', NULL, 0, 0, '2020-03-13 13:29:08', '2020-03-21 18:45:33');
INSERT INTO `edu_menu` VALUES (8, 7, '查询角色', NULL, NULL, 1, 1, 'sys:role:list', '_self', NULL, 0, 0, '2020-03-13 13:30:41', '2020-03-21 18:45:34');
INSERT INTO `edu_menu` VALUES (9, 7, '添加角色', NULL, NULL, 1, 2, 'sys:role:save', '_self', NULL, 0, 0, '2020-03-15 13:02:07', '2020-03-21 18:45:35');
INSERT INTO `edu_menu` VALUES (10, 7, '修改角色', NULL, NULL, 1, 3, 'sys:role:update', '_self', NULL, 0, 0, '2020-03-15 13:02:49', '2020-03-21 18:45:36');
INSERT INTO `edu_menu` VALUES (11, 7, '删除角色', NULL, NULL, 1, 4, 'sys:role:remove', '_self', NULL, 0, 0, '2020-03-20 17:58:51', '2020-03-21 18:45:38');
INSERT INTO `edu_menu` VALUES (12, 1, '菜单管理', NULL, 'sys/menu', 0, 3, 'sys:menu:view', '_self', NULL, 0, 1, '2020-03-21 01:07:13', '2023-06-21 22:38:43');
INSERT INTO `edu_menu` VALUES (13, 12, '查询菜单', NULL, NULL, 1, 1, 'sys:menu:list', '_self', NULL, 0, 0, '2020-03-21 16:43:30', '2020-03-21 18:45:40');
INSERT INTO `edu_menu` VALUES (14, 12, '添加菜单', NULL, NULL, 1, 2, 'sys:menu:save', '_self', NULL, 0, 0, '2020-03-21 16:43:54', '2020-03-21 18:45:41');
INSERT INTO `edu_menu` VALUES (15, 12, '修改菜单', NULL, NULL, 1, 3, 'sys:menu:update', '_self', NULL, 0, 1, '2020-03-21 18:24:17', '2020-08-13 10:50:33');
INSERT INTO `edu_menu` VALUES (16, 12, '删除菜单', NULL, NULL, 1, 4, 'sys:menu:remove', '_self', NULL, 0, 1, '2020-03-21 18:24:18', '2020-08-13 10:50:31');
INSERT INTO `edu_menu` VALUES (17, 1, '机构管理', '', 'sys/organization', 0, 4, 'sys:org:view', '_self', NULL, 1, 1, '2020-03-21 18:24:20', '2020-08-13 10:49:56');
INSERT INTO `edu_menu` VALUES (18, 17, '查询机构', NULL, NULL, 1, 1, 'sys:org:list', '_self', NULL, 0, 1, '2020-03-21 18:24:21', '2020-08-13 10:49:53');
INSERT INTO `edu_menu` VALUES (19, 17, '添加机构', NULL, NULL, 1, 2, 'sys:org:save', '_self', NULL, 0, 1, '2020-03-21 18:24:22', '2020-08-13 10:49:49');
INSERT INTO `edu_menu` VALUES (20, 17, '修改机构', NULL, NULL, 1, 3, 'sys:org:update', '_self', NULL, 0, 1, '2020-03-21 18:24:24', '2020-08-13 10:49:45');
INSERT INTO `edu_menu` VALUES (21, 17, '删除机构', NULL, NULL, 1, 4, 'sys:org:remove', '_self', NULL, 0, 1, '2020-03-21 18:24:25', '2020-08-13 10:49:39');
INSERT INTO `edu_menu` VALUES (22, 1, '字典管理', NULL, 'sys/dict', 0, 5, 'sys:dict:view', '_self', NULL, 0, 1, '2020-03-21 18:24:26', '2020-08-13 10:49:33');
INSERT INTO `edu_menu` VALUES (23, 22, '查询字典', NULL, NULL, 1, 1, 'sys:dict:list', '_self', NULL, 0, 1, '2020-03-21 18:24:27', '2020-08-13 10:49:27');
INSERT INTO `edu_menu` VALUES (24, 22, '添加字典', NULL, NULL, 1, 2, 'sys:dict:save', '_self', NULL, 0, 1, '2020-03-21 18:24:28', '2020-08-13 10:49:24');
INSERT INTO `edu_menu` VALUES (25, 22, '修改字典', NULL, NULL, 1, 3, 'sys:dict:update', '_self', NULL, 0, 1, '2020-03-21 18:24:29', '2020-08-13 10:49:19');
INSERT INTO `edu_menu` VALUES (26, 22, '删除字典', NULL, NULL, 1, 4, 'sys:dict:remove', '_self', NULL, 0, 1, '2020-03-21 18:24:31', '2020-08-13 10:49:14');
INSERT INTO `edu_menu` VALUES (27, 0, '日志管理', 'layui-icon layui-icon-list', NULL, 0, 2, NULL, '_self', NULL, 0, 1, '2020-03-21 18:24:32', '2020-08-13 10:50:28');
INSERT INTO `edu_menu` VALUES (28, 27, '登录日志', NULL, 'sys/loginRecord', 0, 1, 'sys:login_record:view', '_self', NULL, 0, 1, '2020-03-21 18:24:33', '2020-08-13 10:50:26');
INSERT INTO `edu_menu` VALUES (29, 27, '操作日志', NULL, 'sys/operRecord', 0, 2, 'sys:oper_record:view', '_self', NULL, 0, 1, '2020-03-21 18:24:34', '2020-08-13 10:50:23');
INSERT INTO `edu_menu` VALUES (30, 27, '数据监控', NULL, 'druid', 0, 3, NULL, '_self', NULL, 0, 1, '2020-03-21 18:24:35', '2020-08-13 10:50:22');
INSERT INTO `edu_menu` VALUES (31, 0, '系统工具', 'layui-icon layui-icon-slider', NULL, 0, 3, NULL, '_self', NULL, 0, 1, '2020-03-21 18:24:36', '2020-08-13 10:50:19');
INSERT INTO `edu_menu` VALUES (32, 31, '文件管理', NULL, 'file/manage', 0, 1, 'sys:file:view', '_self', NULL, 0, 1, '2020-03-21 18:24:38', '2020-08-13 10:50:18');
INSERT INTO `edu_menu` VALUES (33, 32, '查询文件', NULL, NULL, 1, 1, 'sys:file:list', '_self', NULL, 0, 1, '2020-03-21 18:24:39', '2020-08-13 10:50:15');
INSERT INTO `edu_menu` VALUES (34, 32, '删除文件', NULL, NULL, 1, 2, 'sys:file:remove', '_self', NULL, 0, 1, '2020-03-21 18:24:40', '2020-08-13 10:50:13');
INSERT INTO `edu_menu` VALUES (35, 31, '发送邮件', NULL, 'sys/email', 0, 2, 'sys:email:view', '_self', NULL, 0, 1, '2020-03-21 18:24:41', '2020-08-13 10:50:11');
INSERT INTO `edu_menu` VALUES (36, 31, '项目生成', NULL, NULL, 0, 3, NULL, '_self', NULL, 0, 1, '2020-03-21 18:24:42', '2020-08-13 10:50:08');
INSERT INTO `edu_menu` VALUES (37, 12, '修改菜单', '', '', 1, 3, 'sys:menu:update', '_self', NULL, 0, 0, '2020-08-13 10:51:25', '2020-08-13 10:51:25');
INSERT INTO `edu_menu` VALUES (38, 12, '删除菜单', '', '', 1, 4, 'sys:menu:remove', '_self', NULL, 0, 0, '2020-08-13 10:52:06', '2020-08-13 10:52:06');
INSERT INTO `edu_menu` VALUES (39, 1, '课程管理', 'layui-icon layui-icon-app', 'course/course', 0, 2, '', '_self', NULL, 0, 1, '2020-08-13 10:55:33', '2020-08-13 10:56:37');
INSERT INTO `edu_menu` VALUES (40, 0, '课程管理', 'layui-icon layui-icon-app', '', 0, 2, '', '_self', NULL, 0, 0, '2020-08-13 10:56:28', '2020-08-13 10:56:28');
INSERT INTO `edu_menu` VALUES (41, 0, '教师管理', 'layui-icon layui-icon-username', '', 0, 3, '', '_self', NULL, 0, 0, '2020-08-13 11:00:59', '2020-08-13 11:00:59');
INSERT INTO `edu_menu` VALUES (42, 41, '教师管理', '', 'course/teacher', 0, 1, 'course:teacher:view', '_self', NULL, 0, 0, '2020-08-13 11:12:19', '2020-08-13 11:12:19');
INSERT INTO `edu_menu` VALUES (43, 42, '查询教师', '', '', 1, 1, 'course:teacher:list', '_self', NULL, 0, 1, '2020-08-13 11:13:41', '2020-08-13 11:19:38');
INSERT INTO `edu_menu` VALUES (44, 42, '添加教师', '', '', 1, 2, 'course:teacher:save', '_self', NULL, 0, 1, '2020-08-13 11:14:02', '2020-08-13 11:19:35');
INSERT INTO `edu_menu` VALUES (45, 42, '修改教师', '', '', 1, 3, 'course:teacher:update', '_self', NULL, 0, 1, '2020-08-13 11:14:20', '2020-08-13 11:19:33');
INSERT INTO `edu_menu` VALUES (46, 42, '删除教师', '', '', 1, 4, 'course:teacher:remove', '_self', NULL, 0, 1, '2020-08-13 11:14:36', '2020-08-13 11:19:31');
INSERT INTO `edu_menu` VALUES (47, 40, '课程管理', '', 'course/course', 0, 1, 'course:course:view', '_self', NULL, 0, 0, '2020-08-13 11:17:08', '2020-08-13 11:17:08');
INSERT INTO `edu_menu` VALUES (48, 40, '类别管理', '', 'course/classify', 0, 5, '', '_self', NULL, 0, 0, '2020-08-14 09:08:33', '2020-08-15 20:20:43');
INSERT INTO `edu_menu` VALUES (49, 40, '视频管理', '', 'course/video', 0, 6, '', '_self', NULL, 0, 0, '2020-08-14 17:48:26', '2020-08-15 20:20:50');
INSERT INTO `edu_menu` VALUES (50, 0, '导航菜单', 'layui-icon layui-icon-app', '', 0, 4, '', '_self', NULL, 0, 1, '2020-08-14 18:08:14', '2023-06-21 22:36:40');
INSERT INTO `edu_menu` VALUES (51, 50, '导航菜单', '', 'course/menu', 1, 1, '', '_self', NULL, 0, 0, '2020-08-14 18:08:40', '2023-06-21 19:39:08');
INSERT INTO `edu_menu` VALUES (52, 0, '轮播管理', 'layui-icon layui-icon-component', '', 0, 5, '', '_self', NULL, 0, 1, '2020-08-14 19:01:29', '2023-06-21 22:37:26');
INSERT INTO `edu_menu` VALUES (53, 52, '轮播管理', '', 'course/lunbo', 0, 1, '', '_self', NULL, 0, 0, '2020-08-14 19:01:54', '2020-08-14 19:01:54');
INSERT INTO `edu_menu` VALUES (54, 40, '公共课程管理', '', 'course/course/ggkc', 0, 2, '', '_self', NULL, 0, 0, '2020-08-15 20:18:16', '2020-08-15 20:18:16');
INSERT INTO `edu_menu` VALUES (55, 40, '专业课程管理', '', 'course/course/zykc', 0, 3, '', '_self', NULL, 0, 0, '2020-08-15 20:19:04', '2020-08-15 20:19:04');
INSERT INTO `edu_menu` VALUES (56, 40, '免费课程管理', '', 'course/course/mfkc', 0, 4, '', '_self', NULL, 0, 0, '2020-08-15 20:20:31', '2020-08-15 20:20:31');
INSERT INTO `edu_menu` VALUES (57, 0, '订单管理', 'layui-icon layui-icon-cart-simple', '', 0, 6, '', '_self', NULL, 0, 1, '2020-08-18 11:41:45', '2023-06-21 22:37:37');
INSERT INTO `edu_menu` VALUES (58, 57, '订单管理', '', 'course/order', 0, 1, '', '_self', NULL, 0, 0, '2020-08-18 11:42:30', '2020-08-18 11:42:30');
INSERT INTO `edu_menu` VALUES (59, 0, '通知管理', 'layui-icon layui-icon-speaker', '', 0, 7, '', '_self', NULL, 0, 1, '2020-08-18 13:25:14', '2023-06-21 22:37:44');
INSERT INTO `edu_menu` VALUES (60, 59, '通知管理', '', 'course/notice', 0, 1, '', '_self', NULL, 0, 0, '2020-08-18 13:25:40', '2020-08-18 13:25:40');
INSERT INTO `edu_menu` VALUES (61, 0, '礼品管理', 'layui-icon layui-icon-star', '', 0, 8, '', '_self', NULL, 0, 1, '2020-08-18 13:26:25', '2023-06-21 22:37:56');
INSERT INTO `edu_menu` VALUES (62, 61, '礼品管理', '', 'course/present', 0, 1, '', '_self', NULL, 0, 0, '2020-08-18 13:26:45', '2020-08-18 13:26:45');
INSERT INTO `edu_menu` VALUES (63, 0, '考试管理', NULL, NULL, 0, 9, NULL, '_self', NULL, 0, 0, '2023-06-28 14:54:29', '2023-06-28 14:55:24');
INSERT INTO `edu_menu` VALUES (64, 63, '考试列表', NULL, 'exam/exam', 0, 1, '', '_self', NULL, 0, 0, '2023-06-28 14:54:50', '2023-06-28 17:54:18');
INSERT INTO `edu_menu` VALUES (65, 63, '批改试卷', NULL, 'exam/exam/judge', 0, 3, NULL, '_self', NULL, 0, 0, '2023-06-28 14:56:15', '2023-06-28 18:07:34');
INSERT INTO `edu_menu` VALUES (66, 63, '发布考试', NULL, 'exam/exam/publish', 0, 2, NULL, '_self', NULL, 0, 0, '2023-06-28 17:56:51', '2023-06-28 18:07:38');
INSERT INTO `edu_menu` VALUES (67, 0, '学生管理', NULL, NULL, 0, 1, NULL, '_self', NULL, 0, 0, '2023-06-30 18:37:33', '2023-06-30 18:37:33');
INSERT INTO `edu_menu` VALUES (68, 67, '学生管理', NULL, 'users/student', 0, 1, NULL, '_self', NULL, 0, 0, '2023-06-30 18:37:59', '2023-06-30 18:37:59');

-- ----------------------------
-- Table structure for edu_question
-- ----------------------------
DROP TABLE IF EXISTS `edu_question`;
CREATE TABLE `edu_question`  (
  `question_id` int NOT NULL AUTO_INCREMENT,
  `exam_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `solution` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `score` double NOT NULL,
  PRIMARY KEY (`question_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of edu_question
-- ----------------------------
INSERT INTO `edu_question` VALUES (1, '4235ec27-0686-4780-9c65-14e37b2c3509', '3123', '123', 124);

-- ----------------------------
-- Table structure for edu_role
-- ----------------------------
DROP TABLE IF EXISTS `edu_role`;
CREATE TABLE `edu_role`  (
  `role_id` int NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `role_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '角色名称',
  `role_code` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '角色标识',
  `comments` varchar(400) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  `deleted` int NOT NULL DEFAULT 0 COMMENT '是否删除,0否,1是',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '角色' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of edu_role
-- ----------------------------
INSERT INTO `edu_role` VALUES (1, '管理员', 'admin', '管理员', 0, '2020-02-26 15:18:37', '2020-03-21 15:15:54');
INSERT INTO `edu_role` VALUES (2, '教师', 'teacher', '教师', 0, '2020-02-26 15:18:52', '2020-08-18 19:27:35');
INSERT INTO `edu_role` VALUES (3, '游客', 'guest', '游客', 1, '2020-02-26 15:19:49', '2020-08-18 13:26:51');

-- ----------------------------
-- Table structure for edu_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `edu_role_menu`;
CREATE TABLE `edu_role_menu`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `role_id` int NOT NULL COMMENT '角色id',
  `menu_id` int NOT NULL COMMENT '菜单id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_sys_role_permission_role`(`role_id` ASC) USING BTREE,
  INDEX `menu_id`(`menu_id` ASC) USING BTREE,
  CONSTRAINT `edu_role_menu_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `edu_role` (`role_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `edu_role_menu_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `edu_menu` (`menu_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 383 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '角色权限' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of edu_role_menu
-- ----------------------------
INSERT INTO `edu_role_menu` VALUES (371, 2, 60, '2023-06-28 17:57:18', '2023-06-28 17:57:18');
INSERT INTO `edu_role_menu` VALUES (372, 2, 40, '2023-06-28 17:57:18', '2023-06-28 17:57:18');
INSERT INTO `edu_role_menu` VALUES (373, 2, 47, '2023-06-28 17:57:18', '2023-06-28 17:57:18');
INSERT INTO `edu_role_menu` VALUES (374, 2, 54, '2023-06-28 17:57:18', '2023-06-28 17:57:18');
INSERT INTO `edu_role_menu` VALUES (375, 2, 55, '2023-06-28 17:57:18', '2023-06-28 17:57:18');
INSERT INTO `edu_role_menu` VALUES (376, 2, 56, '2023-06-28 17:57:18', '2023-06-28 17:57:18');
INSERT INTO `edu_role_menu` VALUES (377, 2, 48, '2023-06-28 17:57:18', '2023-06-28 17:57:18');
INSERT INTO `edu_role_menu` VALUES (378, 2, 49, '2023-06-28 17:57:18', '2023-06-28 17:57:18');
INSERT INTO `edu_role_menu` VALUES (379, 2, 63, '2023-06-28 17:57:18', '2023-06-28 17:57:18');
INSERT INTO `edu_role_menu` VALUES (380, 2, 64, '2023-06-28 17:57:18', '2023-06-28 17:57:18');
INSERT INTO `edu_role_menu` VALUES (381, 2, 66, '2023-06-28 17:57:18', '2023-06-28 17:57:18');
INSERT INTO `edu_role_menu` VALUES (382, 2, 65, '2023-06-28 17:57:18', '2023-06-28 17:57:18');
INSERT INTO `edu_role_menu` VALUES (383, 1, 1, '2023-06-30 18:38:10', '2023-06-30 18:38:10');
INSERT INTO `edu_role_menu` VALUES (384, 1, 2, '2023-06-30 18:38:10', '2023-06-30 18:38:10');
INSERT INTO `edu_role_menu` VALUES (385, 1, 3, '2023-06-30 18:38:10', '2023-06-30 18:38:10');
INSERT INTO `edu_role_menu` VALUES (386, 1, 4, '2023-06-30 18:38:10', '2023-06-30 18:38:10');
INSERT INTO `edu_role_menu` VALUES (387, 1, 5, '2023-06-30 18:38:10', '2023-06-30 18:38:10');
INSERT INTO `edu_role_menu` VALUES (388, 1, 6, '2023-06-30 18:38:10', '2023-06-30 18:38:10');
INSERT INTO `edu_role_menu` VALUES (389, 1, 7, '2023-06-30 18:38:10', '2023-06-30 18:38:10');
INSERT INTO `edu_role_menu` VALUES (390, 1, 8, '2023-06-30 18:38:10', '2023-06-30 18:38:10');
INSERT INTO `edu_role_menu` VALUES (391, 1, 9, '2023-06-30 18:38:10', '2023-06-30 18:38:10');
INSERT INTO `edu_role_menu` VALUES (392, 1, 10, '2023-06-30 18:38:10', '2023-06-30 18:38:10');
INSERT INTO `edu_role_menu` VALUES (393, 1, 11, '2023-06-30 18:38:10', '2023-06-30 18:38:10');
INSERT INTO `edu_role_menu` VALUES (394, 1, 67, '2023-06-30 18:38:10', '2023-06-30 18:38:10');
INSERT INTO `edu_role_menu` VALUES (395, 1, 68, '2023-06-30 18:38:10', '2023-06-30 18:38:10');
INSERT INTO `edu_role_menu` VALUES (396, 1, 51, '2023-06-30 18:38:10', '2023-06-30 18:38:10');
INSERT INTO `edu_role_menu` VALUES (397, 1, 53, '2023-06-30 18:38:10', '2023-06-30 18:38:10');
INSERT INTO `edu_role_menu` VALUES (398, 1, 58, '2023-06-30 18:38:10', '2023-06-30 18:38:10');
INSERT INTO `edu_role_menu` VALUES (399, 1, 13, '2023-06-30 18:38:10', '2023-06-30 18:38:10');
INSERT INTO `edu_role_menu` VALUES (400, 1, 60, '2023-06-30 18:38:10', '2023-06-30 18:38:10');
INSERT INTO `edu_role_menu` VALUES (401, 1, 62, '2023-06-30 18:38:10', '2023-06-30 18:38:10');
INSERT INTO `edu_role_menu` VALUES (402, 1, 14, '2023-06-30 18:38:10', '2023-06-30 18:38:10');
INSERT INTO `edu_role_menu` VALUES (403, 1, 40, '2023-06-30 18:38:10', '2023-06-30 18:38:10');
INSERT INTO `edu_role_menu` VALUES (404, 1, 47, '2023-06-30 18:38:10', '2023-06-30 18:38:10');
INSERT INTO `edu_role_menu` VALUES (405, 1, 54, '2023-06-30 18:38:10', '2023-06-30 18:38:10');
INSERT INTO `edu_role_menu` VALUES (406, 1, 55, '2023-06-30 18:38:10', '2023-06-30 18:38:10');
INSERT INTO `edu_role_menu` VALUES (407, 1, 56, '2023-06-30 18:38:10', '2023-06-30 18:38:10');
INSERT INTO `edu_role_menu` VALUES (408, 1, 48, '2023-06-30 18:38:10', '2023-06-30 18:38:10');
INSERT INTO `edu_role_menu` VALUES (409, 1, 49, '2023-06-30 18:38:10', '2023-06-30 18:38:10');
INSERT INTO `edu_role_menu` VALUES (410, 1, 37, '2023-06-30 18:38:10', '2023-06-30 18:38:10');
INSERT INTO `edu_role_menu` VALUES (411, 1, 41, '2023-06-30 18:38:10', '2023-06-30 18:38:10');
INSERT INTO `edu_role_menu` VALUES (412, 1, 42, '2023-06-30 18:38:10', '2023-06-30 18:38:10');
INSERT INTO `edu_role_menu` VALUES (413, 1, 38, '2023-06-30 18:38:10', '2023-06-30 18:38:10');
INSERT INTO `edu_role_menu` VALUES (414, 1, 63, '2023-06-30 18:38:10', '2023-06-30 18:38:10');
INSERT INTO `edu_role_menu` VALUES (415, 1, 64, '2023-06-30 18:38:10', '2023-06-30 18:38:10');
INSERT INTO `edu_role_menu` VALUES (416, 1, 66, '2023-06-30 18:38:10', '2023-06-30 18:38:10');
INSERT INTO `edu_role_menu` VALUES (417, 1, 65, '2023-06-30 18:38:10', '2023-06-30 18:38:10');

-- ----------------------------
-- Table structure for edu_student
-- ----------------------------
DROP TABLE IF EXISTS `edu_student`;
CREATE TABLE `edu_student`  (
  `user_id` int NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '账号',
  `password` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '密码',
  `nick_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '昵称',
  `avatar` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '头像',
  `sex` int NULL DEFAULT NULL COMMENT '性别',
  `phone` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `email_verified` int NOT NULL DEFAULT 0 COMMENT '邮箱是否验证,0否,1是',
  `true_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `id_card` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `birthday` date NULL DEFAULT NULL COMMENT '出生日期',
  `introduction` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '个人简介',
  `present` int NULL DEFAULT NULL COMMENT '积分',
  `state` int NOT NULL DEFAULT 0 COMMENT '状态,0正常,1冻结',
  `deleted` int NOT NULL DEFAULT 0 COMMENT '是否删除,0否,1是',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '用户' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of edu_student
-- ----------------------------
INSERT INTO `edu_student` VALUES (1, 'student_01', 'E10ADC3949BA59ABBE56E057F20F883E', '学生_01', NULL, 1, '15535353535', NULL, 0, NULL, NULL, NULL, '学生_01学生_01学生_01学生_01', 800, 0, 0, '2020-08-13 10:01:26', '2023-06-21 16:33:40');
INSERT INTO `edu_student` VALUES (4, 'liudy ', '01cfcd4f6b8770febfb40cb906715822', 'ldy', NULL, NULL, '17362434749', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 1, '2023-06-30 18:38:31', '2023-06-30 18:38:52');

-- ----------------------------
-- Table structure for edu_submit
-- ----------------------------
DROP TABLE IF EXISTS `edu_submit`;
CREATE TABLE `edu_submit`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL,
  `exam_id` int NULL DEFAULT NULL,
  `score` double NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of edu_submit
-- ----------------------------

-- ----------------------------
-- Table structure for edu_teacher
-- ----------------------------
DROP TABLE IF EXISTS `edu_teacher`;
CREATE TABLE `edu_teacher`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `nickName` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `remark` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  `imageName` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '图片',
  `user_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of edu_teacher
-- ----------------------------
INSERT INTO `edu_teacher` VALUES (1, '张三', '一枚java全栈架构讲师...', 'img\\1.png', 2);
INSERT INTO `edu_teacher` VALUES (2, '李四', 'java架构师一枚', 'img\\1.png', NULL);

-- ----------------------------
-- Table structure for edu_user
-- ----------------------------
DROP TABLE IF EXISTS `edu_user`;
CREATE TABLE `edu_user`  (
  `user_id` int NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '账号',
  `password` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '密码',
  `nick_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '昵称',
  `avatar` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '头像',
  `sex` int NULL DEFAULT NULL COMMENT '性别',
  `phone` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `email_verified` int NOT NULL DEFAULT 0 COMMENT '邮箱是否验证,0否,1是',
  `true_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `id_card` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `birthday` date NULL DEFAULT NULL COMMENT '出生日期',
  `introduction` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '个人简介',
  `state` int NOT NULL DEFAULT 0 COMMENT '状态,0正常,1冻结',
  `deleted` int NOT NULL DEFAULT 0 COMMENT '是否删除,0否,1是',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '用户' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of edu_user
-- ----------------------------
INSERT INTO `edu_user` VALUES (1, 'admin', 'E10ADC3949BA59ABBE56E057F20F883E', '管理员', '20230628/135848ca3a4345319da80b120116c3a9.jpeg', 1, '17362434747', NULL, 0, NULL, NULL, NULL, '我是一只猫。', 0, 0, '2020-01-13 14:43:52', '2023-06-28 18:16:00');
INSERT INTO `edu_user` VALUES (2, 'teacher_01', 'E10ADC3949BA59ABBE56E057F20F883E', '教师_01', NULL, 1, '17362434748', NULL, 0, NULL, NULL, NULL, NULL, 0, 0, '2020-08-13 10:01:26', '2023-06-28 15:58:15');

-- ----------------------------
-- Table structure for edu_user_role
-- ----------------------------
DROP TABLE IF EXISTS `edu_user_role`;
CREATE TABLE `edu_user_role`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` int NOT NULL COMMENT '用户id',
  `role_id` int NOT NULL COMMENT '角色id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_sys_user_role`(`user_id` ASC) USING BTREE,
  INDEX `FK_sys_user_role_role`(`role_id` ASC) USING BTREE,
  CONSTRAINT `edu_user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `edu_user` (`user_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `edu_user_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `edu_role` (`role_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '用户角色' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of edu_user_role
-- ----------------------------
INSERT INTO `edu_user_role` VALUES (4, 1, 1, '2023-06-28 15:57:44', '2023-06-28 15:57:44');
INSERT INTO `edu_user_role` VALUES (5, 2, 2, '2023-06-28 15:58:15', '2023-06-28 15:58:15');

-- ----------------------------
-- Table structure for edu_video
-- ----------------------------
DROP TABLE IF EXISTS `edu_video`;
CREATE TABLE `edu_video`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `sort` int NULL DEFAULT NULL,
  `course_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of edu_video
-- ----------------------------
INSERT INTO `edu_video` VALUES (1, '第一章节01', 'http://rwxu06s4o.hd-bkt.clouddn.com/video/OdysseyCraft%20-%20%E5%8D%95%E4%BA%BA%E6%B8%B8%E6%88%8F%202022-09-20%2023-48-23.mp4', '2020-08-14 17:42:25', 1, 1);
INSERT INTO `edu_video` VALUES (2, '第二章节02', 'http://rwxu06s4o.hd-bkt.clouddn.com/video/OdysseyCraft%20-%20%E5%8D%95%E4%BA%BA%E6%B8%B8%E6%88%8F%202022-09-20%2023-48-23.mp4', '2020-08-14 17:47:27', 2, 1);
INSERT INTO `edu_video` VALUES (3, '第三章节03', 'http://rwxu06s4o.hd-bkt.clouddn.com/video/OdysseyCraft%20-%20%E5%8D%95%E4%BA%BA%E6%B8%B8%E6%88%8F%202022-09-20%2023-48-23.mp4', '2020-08-14 17:47:49', 3, 1);
INSERT INTO `edu_video` VALUES (4, '第一章节', 'http://rwxu06s4o.hd-bkt.clouddn.com/video/OdysseyCraft%20-%20%E5%8D%95%E4%BA%BA%E6%B8%B8%E6%88%8F%202022-09-20%2023-48-23.mp4', '2020-08-19 22:52:52', 1, 10);
INSERT INTO `edu_video` VALUES (5, '第二章节', 'http://rwxu06s4o.hd-bkt.clouddn.com/video/OdysseyCraft%20-%20%E5%8D%95%E4%BA%BA%E6%B8%B8%E6%88%8F%202022-09-20%2023-48-23.mp4', '2020-08-19 22:53:12', 2, 10);

-- ----------------------------
-- Table structure for tb_post
-- ----------------------------
DROP TABLE IF EXISTS `tb_post`;
CREATE TABLE `tb_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '帖子主键id',
  `publish_user_id` bigint NOT NULL COMMENT '发布者id',
  `post_title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '帖子标题',
  `post_content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '帖子内容',
  `post_category_id` int NOT NULL COMMENT '帖子分类id',
  `post_category_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '帖子分类(冗余字段)',
  `post_status` tinyint NOT NULL DEFAULT 1 COMMENT '0-未审核 1-审核通过 2-审核失败 (默认审核通过)',
  `post_views` bigint NOT NULL DEFAULT 0 COMMENT '阅读量',
  `post_comments` bigint NOT NULL DEFAULT 0 COMMENT '评论量',
  `post_collects` bigint NOT NULL DEFAULT 0 COMMENT '收藏量',
  `last_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最新修改时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_post
-- ----------------------------
INSERT INTO `tb_post` VALUES (1, 1, 'My-BBS开源啦！', '<p>My-BBS开源啦！</p>', 5, '动态', 1, 446, 4, 2, '2021-08-01 13:00:00', '2021-08-01 13:00:00');
INSERT INTO `tb_post` VALUES (2, 1, '6 年前，只会 JSP 和 Servlet 就可以找到工作', '<p>沧海桑田，欢迎大家讨论~</p>', 4, '讨论', 1, 3, 0, 0, '2021-08-17 14:54:49', '2021-08-17 14:54:49');
INSERT INTO `tb_post` VALUES (3, 2, 'spring-boot框架学起来容易吗？', '<p>如题~</p>', 1, '提问', 1, 233, 0, 0, '2021-08-17 15:58:30', '2021-08-17 15:58:30');
INSERT INTO `tb_post` VALUES (4, 2, 'Java知识点归纳(Java基础部分)', '<pre><code class=\"Bash\"><xmp>原文地址：https://skya.csdn.net/topics/392168597</xmp></code></pre><p>写这篇文章的目的是想总结一下自己这么多年来使用java的一些心得体会，主要是和一些java基础知识点相关的，所以也希望能分享给刚刚入门的Java程序员和打算入Java开发这个行当的准新手们，希望可以给大家一些经验，能让大家更好学习和使用Java。<br/>　　这次介绍的主要内容是和J2SE相关的部分，另外，会在以后再介绍些J2EE相关的、和Java中各个框架相关的内容。<br/>　　经过这么多年的Java开发，以及结合平时面试Java开发者的一些经验，我觉得对于J2SE方面主要就是要掌握以下的一些内容。<br/><br/>　　1. JVM相关(包括了各个版本的特性)<br/>　　对于刚刚接触Java的人来说，JVM相关的知识不一定需要理解很深，对此里面的概念有一些简单的了解即可。不过对于一个有着3年以上Java经验的资深开发者来说，不会JVM几乎是不可接受的。<br/>　　JVM作为java运行的基础，很难相信对于JVM一点都不了解的人可以把java语言吃得很透。我在面试有超过3年Java经验的开发者的时候， JVM几乎就是一个必问的问题了。当然JVM不是唯一决定技术能力好坏的面试问题，但是可以佐证java开发能力的高低。<br/>　　在JVM这个大类中，我认为需要掌握的知识有：<br/>JVM内存模型和结构<br/>GC原理，性能调优<br/>调优：Thread Dump， 分析内存结构<br/>class 二进制字节码结构， class loader 体系 ， class加载过程 ， 实例创建过程<br/>方法执行过程<br/>Java各个大版本更新提供的新特性(需要简单了解)<br/><br/>　　2. Java的运行（基础必备）<br/>　　这条可能出看很简单，java程序的运行谁不会呢？不过很多时候， 我们只是单纯通过IDE去执行java程序，底层IDE又是如何执行java程序呢？很多人并不了解。<br/>　　这个知识点是最最基本的java开发者需要掌握的，初学java，第一个肯定是教你如何在命令行中执行java程序，但是很多人一旦把java学完了，IDE用上了，就把这个都忘了。为什么强调要知道这个呢，知道了java最纯粹的启动方式之后，你才能在启动出问题的时候，去分析当时启动的目录多少，执行命名如何，参数如何，是否有缺失等。 这样有利于你真正开发中去解决那些奇奇怪怪的可能和环境相关的问题。<br/>　　在这里需要掌握的知识有：<br/>javac 编译java文件为 class 文件<br/>java 命令的使用， 带package的java类如何在命令行中启动<br/>java程序涉及到的各个路径(classpath， java。library。path， java运行的主目录等)<br/><br/>　　3. 数据类型<br/>　　这条没有什么好多说的，无非就是Java中的基本类型和对象类型的掌握。可以再了解一些JDK如何自动转换方面的知识，包括装箱拆箱等，还要注意避免装箱之后的类型相等的判断<br/>　　主要知识点：<br/>基本类型： int， long， float， double， boolean ， 。。。<br/>对应的对象类型： Integer 等类型到基本类型的转换， 装箱和拆箱<br/>Object类型： equals， hashcode<br/>String 类型的特点<br/><br/>　　4. 对象和实例，对象的创建<br/>　　在这方面，开发者需要了解class和instance的概念以及之间的差别， 这是java面向对象特性的一个基础。主要知识点有：<br/>Class和 Instance 的概念<br/>Instance 创建的过程：<br/>　　1。 无继承：分配内存空间， 初始化变量， 调用构造函数<br/>　　2。 有继承：处理静态动作， 分配内存空间， 变量定义为初始值 ， 从基类-&gt;子类， 处理定义处的初始化， 执行构造方法<br/>　　需要注意的点：<br/>　　　　静态属性等从基类-&gt;子类进行初始化<br/>　　　　默认无参构造方法相关的特性　　<br/><br/>　　5. 访问控制<br/>　　这也是java封装特性的一个基础，需要掌握的有：<br/>public protected default private 对于class， method， field 的修饰作用<br/><br/>　　6. 流程控制<br/>　　Java 流程控制的基础， 虽然有些语法不一定很常用，但是都需要了解，并且在合适的地方使用它们。<br/>需要掌握的有：<br/>if， switch， loop， for， while 等流程控制的语法<br/><br/>　　7. 面向对象编程的概念<br/>　　这是一个java的核心概念，对于任何java开发者都需要熟练掌握。Java中很多特性或者说知识点都是和java面向对象编程概念相关的。在我的理解，一个好的开发者不仅仅需要了解这些特性（知识点）本身，也更需要知道这些对象在java的面向对象编程概念中是如何体现出来的，这样更有利于开发者掌握java这门开发语言，以及其他面向对象编程的语言。在这里只是简单罗列了一下，主要的知识点包括有：<br/>面向对象三大特性：封装，继承，多态; 各自的定义概念，有哪些特性体现出来，各自的使用场景<br/>静态多分派，动态单分派的概念<br/>重载的概念和使用<br/>继承：接口多实现，基类单继承<br/>抽象，抽象类，接口<br/>多态：方法覆盖的概念和使用<br/>接口回调<br/><br/>　　8. Static<br/>　　静态属性在java日常开发中也是经常使用，需要了解和 static 关键字相关的用法，还有和其他关键字的配合使用， 如是否可以和 abstract， final 等关键字联合使用。<br/>主要需要掌握的有：<br/>静态属性的定义，使用，以及类加载时如何初始化<br/>静态方法的定义和使用<br/>静态类的定义和使用<br/>静态代码块的定义和初始化时机<br/><br/>　　9. 基础知识点<br/>　　这里主要罗列一些散落的，没有系统归类的一些java知识点。在日常的开发中用到也不少。 这块内容其实还有很多，目前只是暂时归纳了这几个在这里：<br/>　　包括有：<br/>equals ， hashcode ， string/stringbuffer ，final ， finally ， finalize<br/><br/>　　10.集合框架<br/>　　这个是一个需要多加掌握的部分，做java开发，可以说没有不用到集合框架的，这很重要。但是这里的知识点并不难，但是对于集合最好要了解内部的实现方式，因为这样有助于你在各个不同的场景选择适合的框架来解决问题，比如有1W个元素的集合，经常要进行contains判断操作，知道了集合的特性或者内部实现，就很容易做出正确的选择。<br/>　　这里包括了如下内容(并发相关不包含在内)：<br/>集合框架的体系： 基础Collection ，Map<br/>具体集合实现的内容， List ，Set ，Map 具体的实现，内部结构， 特殊的方法， 适用场景等<br/>集合相关的工具类 Collections 等的用法<br/><br/>　　11.异常框架<br/>　　异常在java的开发中可能没有那么被重视。一般遇到异常，直接上抛，或者随便catch一下处理之后对于程序整体运行也没有什么大的影响。不过在企业级设计开发中， 异常的设计与处理的好坏，往往就关系着这个系统整体的健壮性。一个好的系统的异常对于开发者来说，处理应该统一，避免各处散落很多异常处理逻辑；对于系统来说，异常应该是可控的，并且是易于运维的，某些异常出现后，应该有应对的方法，知道如何运维处理，所以虽然异常框架很简单，但是对于整个企业级应用开发来说，异常处理是很重要的，处理好异常就需要了解Java中的异常体系。<br/>　　这部分需要掌握的知识点不多，主要就是：<br/>异常的体系：<br/>Throwable<br/>Exception<br/>RuntimeException<br/>Error<br/>RuntimeException 和 一般 Exception 的区别， 具体处理方法等<br/><br/>　　12. Java IO<br/>　　IO 在java中不仅仅是文件读写那么简单，也包括了 socket 网络的读写等等一切的输入输出操作。比如说 标准HTTP请求中Post的内容的读取也是一个输出的过程，等等…<br/>　　对于IO，Java不仅提供了基本Input、Output相关的api，也提供了一些简化操作的Reader、Writer等api，在某些开发（涉及大量IO操作的项目）中也很重要，一般日常的开发中也会涉及（日志，临时文件的读写等）。<br/>　　在这中的知识点主要有：<br/>基本IO的体系： 包括有InputStream ， OutputStream， Reader/Writer， 文件读取，各种流读取等<br/>NIO 的概念， 具体使用方式和使用场景<br/><br/>　　13.多线程并发<br/>　　多线程是Java中普遍认为比较难的一块。多线程用好了可以有效提高cpu使用率， 提升整体系统效率， 特别是在有大量IO操作阻塞的情况下；但是它也是一柄双刃剑， 如果用不好，系统非但提升不大，或者没有提升，而且还会带来多线程之间的调试时等问题。<br/>　　在多线程中内容有很多，只是简单说明一下Java中初步使用多线程需要掌握的知识点，以后有机会单独再详细介绍一些高级特性的使用场景。<br/>多线程的实现和启动<br/>callable 与 runable 区别<br/>syncrhoized ，reentrantLock 各自特点和比对<br/>线程池<br/>future 异步方式获取执行结果<br/>concurrent 包<br/>lock<br/>..<br/><br/>　　14.网络<br/>　　Java中也是提供了可以直接操作 TCP协议、UDP协议的API。在需要强调网络性能的情况下，可以直接使用TCP/UDP 进行通讯。在查看Tomcat等的源码中，就可以看到这些相关API的使用情况。不过一般也比较少会直接使用TCP，会使用诸如MINA、Netty这样的框架来进行处理，因为这个方面的开发涉及不多，所以就不再详细罗列了。<br/><br/>　　15.时间日期处理<br/>　　几乎对于每个应用来说，时间日期的处理也是绕不过去的，但是JDK8 之前的时间相关API用法并不友好。在那个时代，可以选择Joda等时间框架。到了JDK8 发布之后，全新的时间API基本融合了其他框架的优点，已经可以很好的直接使用了。<br/>　　对于Java开发者来说，需要熟练地使用API来对时间和日期做相关的处理。<br/>　　具体知识点不再罗列，会在以后再写个专门的文章来总结一下JDK8中时间日期API的用法。<br/><br/>　　16.XML解析/ JSON解析<br/>　　其实这两块内容都不是J2SE里面的内容，但是在日常开发中，和其他程序交互，和配置文件交互，越来越离不开这两种格式的解析。<br/>　　不过对于一个开发者来说，能够了解一些XML/JSON具体解析的原理和方法，有助于你在各个具体的场景中更好的选择合适你的方式来使得你的程序更有效率和更加健壮。<br/>　　XML： 需要了解 DOM解析和 SAX解析的基本原理和各自的适用场景<br/>　　JSON： 需要了解一些常用JSON框架的用法， 如 Jackson， FastJson， Gson 等。。<br/><br/>　　17.Maven的使用<br/>　　Maven也不是Java里面的内容，但是maven是革命性的，给java开发带来了巨大的便利。从依赖的引入和管理，开发流程的更新和发布产出，乃至版本的更新，使用maven可以大大简化开发过程中的复杂度，从而节省大量时间。可以说，maven已经成为java开发者的标配了。所以我把maven也作为一个java开发者对于基础必备的知识点。以后会再放上一些我的一些对于maven使用的经验和技巧等，这里就不再细说了。<br/><br/>　　18.泛型<br/>　　这是JDK5开始引入的新概念，其实是个语法糖，在编写java代码时会有些许便利， 一般的应用或者是业务的开发，只需要简单使用，不一定会用到定义泛型这样的操作， 但是开发一些基础公共组件会使用到，可以在需要的时候再细看这个部分，一般情况下只要会简单使用即可。<br/><br/>　　19.标注<br/>　　也是jdk5 之后引入的。spring是个优秀的框架，最开始就以xml作为标准的配置文件。不过到了Spring3 之后，尤其是 spring-boot 兴起之后，越来越推崇使用标注来简化xml配置文件了，对于开发者来说，可以节省不少xml配置的时间。但是劣势是在于标注散落在各个类中，不像xml，可以对所有配置有个全局性的理解和管理，所以还没有办法说完全就取代所有的xml。对于一般开发者，会使用标注即可，一些公共组建的开发者可能会需要了解标注的定义和实现，可以在具体需要的时候再细看。<br/><br/>　　20.RMI<br/>　　RemoteMethodInvocation ，Java语言特有的远程调用接口，使用还是比较简单方便。不过需要跨语言的情况下，就需要使用 webservice 等其他方式来支持。一般来说，程序都不需要使用RMI，不过可以在特定的情况下使用，我就在一个项目中，使用RMI来进行程序远程启动停止的控制。<br/><br/>　　21.JNI<br/>　　Java Native Interface，可以允许Java中调用本地接口方法，一般用于C/C++代码的调用。需要注意的是在java中加载so/dll文件的路径问题，本身调用接口并不复杂，但是经常在是否加载了所需的本地接口库中花费较多时间。<br/><br/>　　以上也只是简单介绍了下我对于这些java基本知识点和技术点的一些看法和介绍， 这些内容都源自于我这些年来使用java的一些总结， 希望给刚刚接触Java， 或者打算从Java开发的人一些经验， 希望能够更有效率地学习和使用java， 避免走了弯路浪费了宝贵的时间。这当中还有些内容不够完善的地方，会通过以后的文章再添加上。由于个人能力有限，当然其中也会有些错误和疏漏，欢迎指正，一起讨论，共同来把这篇文章再完善下，希望它可以真正帮助到有需要的人。<br/></p>', 2, '分享', 1, 5, 1, 1, '2021-08-17 16:03:36', '2021-08-17 16:03:36');
INSERT INTO `tb_post` VALUES (5, 2, '自主学习的困惑', '<pre><code class=\"Bash\"><xmp>原文地址：https://skya.csdn.net/topics/600406000</xmp></code></pre><p>大学学的是Java，但由于学的不扎实，实习找了份c#的工作。</p><p>平常工作也就稍微改一改代码，更多的是sqlserver跟sqllite的增删查改。</p><p>在这种情况下，想要自主学习，想请问一下各位大佬，是重新学习Java还是从头开始学习C#好一点。</p><p>注：Java已经五六个月没接触了，而且当时学的不扎实。</p>', 4, '讨论', 1, 233, 0, 0, '2021-08-17 16:05:22', '2021-08-17 16:05:22');
INSERT INTO `tb_post` VALUES (6, 2, '小白想学java该如何入手学习？？求有经验大佬告知。', '<pre><code class=\"Bash\"><xmp>原文地址：https://skya.csdn.net/topics/600398682</xmp></code></pre><p>毕业出来半年，目前在广州做着php，感觉前途不算大。目前想转java，但又不知道如何入手。<br/></p>', 1, '提问', 1, 84, 0, 0, '2021-08-17 16:06:13', '2021-08-17 16:06:13');
INSERT INTO `tb_post` VALUES (7, 2, '高性能的内存数据库（关系型）会不会对Java开发产生影响？', '<pre><code class=\"Bash\"><xmp>原文地址：https://skya.csdn.net/topics/600338509</xmp></code></pre><p>Java开发里很多类似共享，锁，队列的问题都在应用层用Java代码解决，但数据库层一般也是可以提供这样的功能的，如果直接用数据库带的锁功能，代码可以简化很多（比如可以不用考虑锁的问题），数据库的一个缺点是IO读写慢，不过现在也有纯内存级数据库，只是目前还不普及，只是在大公司的企业级系统里才会见到。</p><p>如果数据库性能能够得到极大的提升，是不是可以极大地简化Java开发代码复杂度？</p>', 1, '提问', 1, 5, 1, 0, '2021-08-17 16:07:23', '2021-08-17 16:07:23');
INSERT INTO `tb_post` VALUES (8, 2, '使用 Lambda 的一些疑惑', '<pre><code class=\"Bash\"><xmp>原文地址：https://skya.csdn.net/topics/600333260</xmp></code></pre><p>开始使用 Lambda 时觉得很爽， 代码结构简单了，代码量减少了。但是时间久了就遇到一些问题（以上主要是针对一些复杂的代码逻辑，不可否认如果是简单逻辑代码的话没有上述问题）</p><p>1)Lambda 改变了自己的编程风格，以前设计虑面向对象（我个人觉得这种更偏向业务流程）， Lambda 使用后变流式风格（这种更偏向数据处理）。如果根据《重构》提到的原则为标准， 使用Lambda 后我的代码结构越来越烂了。</p><p>2)Lambda 本身的一些推断处理，有时候会让理解代码很困难， 更不用说去理解其他人的代码了。敏捷开发和极限编程中都提到不写设计文档使用代码来表示需求。 Lambda被使用后，根据代码理解业务更困难了。 现在读别人写的代码我就头疼。 原罪：自己可写Lambda ，但不想别人写</p><p>欢迎大家讨论，说说自己的想法 。有没有我相同的困惑， 工作中如何取舍呢</p>', 4, '讨论', 1, 0, 0, 0, '2021-08-17 16:08:26', '2021-08-17 16:08:26');
INSERT INTO `tb_post` VALUES (9, 3, '36 个 Java 教程和练手项目列表', '<p>下面是根据现有资源整理的 Java 学习路径，包含 ：</p><p>Java 基础 --&gt;&gt; Web 基础 --&gt;&gt; Java Web 框架 --&gt;&gt; 基础项目 --&gt;&gt; 进阶项目 等36个大大小小的学习项目</p><p>你将逐步深入，并学习用 Java 开发计算器、博客、代码编辑器、支付平台、人事管理系统等项目……</p><p>关于这 34 个练手项目：学习任何语言，最终都是通过实际动手操作来内化、巩固知识的；希望你能选一个感兴趣的项目，亲手把它实现出来！</p><h2>Java 基础</h2><ol><li><a href=\"https://www.lanqiao.cn/courses/1230\" target=\"_blank\">Java 简明教程</a></li><li><a href=\"https://www.lanqiao.cn/courses/100\" target=\"_blank\">Java 设计模式详解</a></li><li><a href=\"https://www.lanqiao.cn/courses/109\" target=\"_blank\">JDK 基础入门</a></li><li><a href=\"https://www.lanqiao.cn/courses/9\" target=\"_blank\">MySQL 基础课程</a></li><li><a href=\"https://www.lanqiao.cn/courses/90\" target=\"_blank\">正则表达式基础入门</a></li><li><a href=\"https://www.lanqiao.cn/courses/110\" target=\"_blank\">JDBC 入门教程</a></li><li><a href=\"https://www.lanqiao.cn/courses/539\" target=\"_blank\">Java 函数式编程</a></li><li><a href=\"https://www.lanqiao.cn/courses/362\" target=\"_blank\">J2SE 网络通信基础入门</a></li></ol><h2>Web 基础</h2><ol><li><a href=\"https://www.lanqiao.cn/courses/43\" target=\"_blank\">HTML5 简明教程</a></li><li><a href=\"https://www.lanqiao.cn/courses/1237\" target=\"_blank\">CSS3 简明教程</a></li><li><a href=\"https://www.lanqiao.cn/courses/1238\" target=\"_blank\">JavaScript 基础入门</a></li></ol><h2>Java Web 框架</h2><ol><li><a href=\"https://www.lanqiao.cn/courses/32\" target=\"_blank\">Apache Struts 框架基础入门</a></li><li><a href=\"https://www.lanqiao.cn/courses/34\" target=\"_blank\">Hibernate 框架基础入门</a></li><li><a href=\"https://www.lanqiao.cn/courses/578\" target=\"_blank\">Spring 框架基础入门</a></li><li><a href=\"https://www.lanqiao.cn/courses/802\" target=\"_blank\">MyBatis 框架基础入门</a></li><li><a href=\"https://www.lanqiao.cn/courses/810\" target=\"_blank\">Spring MVC 基础入门</a></li><li><a href=\"https://www.lanqiao.cn/courses/1152\" target=\"_blank\">Spring Boot 入门教程</a></li><li><a href=\"https://www.lanqiao.cn/courses/1257\" target=\"_blank\">Netty 开发实战入门</a></li><li><a href=\"https://www.lanqiao.cn/courses/1274\" target=\"_blank\">23 个实验带你轻松玩转 Spring Boot</a></li></ol><h2>Java 基础项目</h2><ol><li><a href=\"https://www.lanqiao.cn/courses/185\" target=\"_blank\">Java 实现简单计算器</a></li><li><a href=\"https://www.lanqiao.cn/courses/260\" target=\"_blank\">Java 实现日记写作软件</a></li><li><a href=\"https://www.lanqiao.cn/courses/742\" target=\"_blank\">Java 实现在线协作文档</a></li><li><a href=\"https://www.lanqiao.cn/courses/287\" target=\"_blank\">Eclipse 实现 Java 编辑器</a></li><li><a href=\"https://www.lanqiao.cn/courses/817\" target=\"_blank\">SSM 框架基础入门</a></li><li><a href=\"https://www.lanqiao.cn/courses/704\" target=\"_blank\">Java 编写数独计算器</a></li></ol><h2>Java 进阶项目</h2><ol><li><a href=\"https://www.lanqiao.cn/courses/576\" target=\"_blank\">Java 实现简单支付业务流程</a></li><li><a href=\"https://www.lanqiao.cn/courses/588\" target=\"_blank\">Java Servlet 生成简单验证码图片</a></li><li><a href=\"https://www.lanqiao.cn/courses/824\" target=\"_blank\">SSM 搭建简易人事管理系统</a></li><li><a href=\"https://www.lanqiao.cn/courses/930\" target=\"_blank\">Java 实现个人博客网站</a></li><li><a href=\"https://www.lanqiao.cn/courses/875\" target=\"_blank\">Java 基于 SSM 实现简历生成</a></li><li><a href=\"https://www.lanqiao.cn/courses/1244\" target=\"_blank\">Spring Boot 入门及前后端分离项目实践</a></li><li><a href=\"https://www.lanqiao.cn/courses/1249\" target=\"_blank\">Spring Boot 实现健康管理系统（维护中）</a></li><li><a href=\"https://www.lanqiao.cn/courses/1405\" target=\"_blank\">Java Web 三级跳：SSM，SpringBoot 与前后端分离</a></li><li><a href=\"https://www.lanqiao.cn/courses/1360\" target=\"_blank\">Spring Cloud 与 Docker 实战</a></li><li><a href=\"https://www.lanqiao.cn/courses/1367\" target=\"_blank\">SpringBoot+Mybatis+Thymeleaf 搭建个人博客</a></li><li><a href=\"https://www.lanqiao.cn/courses/1346\" target=\"_blank\">SpringBoot 和 Vue.js 实现前后端分离的微人事系统</a></li></ol><blockquote><p><strong>学一门编程语言最好的时间是十年前，其次是现在。</strong></p></blockquote><p>分享一句话：</p><p>It\'s not what we do once in a while that shapes our lives. It\'s what we do consistently.</p><p><strong>我们过着的生活，是由那些持之以恒的事情造就的；而不是一时兴起、偶尔为之的新鲜刺激的事。</strong></p><p>加油。</p>', 2, '分享', 1, 345, 0, 1, '2021-08-17 16:13:31', '2021-08-17 16:13:31');
INSERT INTO `tb_post` VALUES (10, 3, '今天也要好好学习啊！', '<p>加油~</p>', 5, '动态', 1, 0, 0, 0, '2021-08-17 16:15:29', '2021-08-17 16:15:29');
INSERT INTO `tb_post` VALUES (11, 3, 'spring-boot框架实战项目', '<h1>Spring Boot Projects</h1><p>该仓库中主要是 Spring Boot 的入门学习教程以及一些常用的 Spring Boot 实战项目教程，包括 Spring Boot 使用的各种示例代码，同时也包括一些实战项目的项目源码和效果展示，实战项目包括基本的 web 开发以及目前大家普遍使用的前后端分离实践项目等，后续会根据大家的反馈继续增加一些实战项目源码，摆脱各种 hello world 入门案例的束缚，真正的掌握 Spring Boot 开发。</p><h2><a href=\"https://gitee.com/zhenfeng13/spring-boot-projects#%E9%A1%B9%E7%9B%AE%E5%AF%BC%E8%88%AA\"></a>项目导航</h2><p><a href=\"https://github.com/ZHENFENG13/spring-boot-projects/tree/master/SpringBoot%E5%85%A5%E9%97%A8%E6%A1%88%E4%BE%8B%E6%BA%90%E7%A0%81\">Spring Boot 入门小案例</a>&nbsp;|&nbsp;<a href=\"https://github.com/ZHENFENG13/spring-boot-projects/tree/master/SpringBoot%E5%85%A5%E9%97%A8%E6%A1%88%E4%BE%8B%E6%BA%90%E7%A0%81\">Spring Boot 入门小案例</a>&nbsp;|&nbsp;<a href=\"https://github.com/ZHENFENG13/spring-boot-projects/tree/master/%E7%8E%A9%E8%BD%ACSpringBoot%E7%B3%BB%E5%88%97%E6%A1%88%E4%BE%8B%E6%BA%90%E7%A0%81\">Spring Boot 整合案例系列2</a>&nbsp;|&nbsp;<a href=\"https://github.com/ZHENFENG13/spring-boot-projects/tree/master/SpringBoot%E5%89%8D%E5%90%8E%E7%AB%AF%E5%88%86%E7%A6%BB%E5%AE%9E%E6%88%98%E9%A1%B9%E7%9B%AE%E6%BA%90%E7%A0%81\">Spring Boot 前后端分离项目实践</a>&nbsp;|&nbsp;<a href=\"https://github.com/ZHENFENG13/spring-boot-projects/tree/master/SpringBoot%E5%92%A8%E8%AF%A2%E5%8F%91%E5%B8%83%E7%B3%BB%E7%BB%9F%E5%AE%9E%E6%88%98%E9%A1%B9%E7%9B%AE%E6%BA%90%E7%A0%81\">Spring Boot 咨询发布系统项目实践</a>&nbsp;&nbsp;| &nbsp;<a href=\"https://github.com/ZHENFENG13/My-Blog\">Spring Boot + Mybatis + Thymeleaf 实现的开源博客系统</a>&nbsp;|&nbsp;<a href=\"https://github.com/ZHENFENG13/My-Column\">Spring Boot + Mybatis + Thymeleaf 仿知乎专栏项目</a>&nbsp;|&nbsp;<a href=\"https://github.com/ZHENFENG13/My-Blog-layui\">Spring Boot + layui 实现的后台管理系统</a>&nbsp;&nbsp;| &nbsp;<a href=\"https://github.com/newbee-ltd/newbee-mall\">Spring Boot 大型商城项目实践</a>&nbsp;| &nbsp;<a href=\"https://github.com/newbee-ltd/newbee-mall-vue-app\">Spring Boot + Vue 前后端分离商城项目</a>&nbsp;| &nbsp;<a href=\"https://github.com/newbee-ltd/newbee-mall-vue3-app\">Spring Boot + Vue3 前后端分离商城项目</a>&nbsp;| &nbsp;<a href=\"https://github.com/ZHENFENG13/spring-boot-projects\">Github地址</a>&nbsp;&nbsp;| &nbsp;<a href=\"https://gitee.com/zhenfeng13/spring-boot-projects\">码云 Gitee 地址</a></p><p><strong>目前代码中使用的 Spring Boot 版本为 2.3.7.RELEASE 及以上版本，请知悉。</strong></p><hr/><h4><a href=\"https://gitee.com/zhenfeng13/spring-boot-projects#%E9%A1%B9%E7%9B%AE%E6%BC%94%E7%A4%BA\"></a>项目演示</h4><ul><li><a href=\"https://www.bilibili.com/video/av52551579\">Spring Boot 前后端分离项目预览</a></li><li><a href=\"https://www.bilibili.com/video/av52551450\">Spring Boot 咨询发布系统项目预览</a></li><li><a href=\"https://www.bilibili.com/video/av52551095\">Spring Boot 开源博客系统预览</a></li><li><a href=\"https://edu.csdn.net/course/play/26258/326466\">Spring Boot 商城项目总览</a></li><li><a href=\"https://edu.csdn.net/course/play/26258/326467\">Spring Boot 商城系统介绍</a></li><li><a href=\"https://edu.csdn.net/course/play/26258/328801\">Spring Boot 商城后台管理系统介绍</a></li></ul><hr/><h4><a href=\"https://gitee.com/zhenfeng13/spring-boot-projects#spring-boot-%E5%AE%9E%E6%88%98%E9%A1%B9%E7%9B%AE%E6%BA%90%E7%A0%81\"></a>Spring Boot 实战项目源码</h4><ul><li><a href=\"https://github.com/ZHENFENG13/spring-boot-projects/tree/master/SpringBoot%E5%89%8D%E5%90%8E%E7%AB%AF%E5%88%86%E7%A6%BB%E5%AE%9E%E6%88%98%E9%A1%B9%E7%9B%AE%E6%BA%90%E7%A0%81/spring-boot-project-front-end&amp;back-end\">前后端分离项目</a></li><li><a href=\"https://github.com/ZHENFENG13/spring-boot-projects/tree/master/SpringBoot%E5%92%A8%E8%AF%A2%E5%8F%91%E5%B8%83%E7%B3%BB%E7%BB%9F%E5%AE%9E%E6%88%98%E9%A1%B9%E7%9B%AE%E6%BA%90%E7%A0%81/springboot-project-news-publish-system\">咨询发布项目</a></li><li><a href=\"https://github.com/ZHENFENG13/My-Blog\">博客系统</a></li><li><a href=\"https://github.com/ZHENFENG13/My-Column\">仿知乎专栏项目</a></li><li><a href=\"https://github.com/ZHENFENG13/My-Blog-layui\">Spring Boot + layui 实现的后台管理系统</a></li><li><a href=\"https://github.com/newbee-ltd/newbee-mall\">Spring Boot 大型商城项目</a></li><li><a href=\"https://github.com/newbee-ltd/newbee-mall-vue-app\">Spring Boot + Vue 前后端分离商城项目</a></li><li><a href=\"https://github.com/newbee-ltd/newbee-mall-vue3-app\">Spring Boot + Vue3 前后端分离商城项目</a></li></ul><hr/><h2><a href=\"https://gitee.com/zhenfeng13/spring-boot-projects#spring-boot-%E5%9F%BA%E7%A1%80%E4%BD%BF%E7%94%A8%E6%A1%88%E4%BE%8B\"></a>Spring Boot 基础使用案例</h2><p><strong>示例代码</strong></p><ul><li><a href=\"https://github.com/ZHENFENG13/spring-boot-projects/tree/master/SpringBoot%E5%85%A5%E9%97%A8%E6%A1%88%E4%BE%8B%E6%BA%90%E7%A0%81/spring-boot-helloworld\">spring-boot-hello</a>：Spring Boot 第一个案例代码</li><li><a href=\"https://github.com/ZHENFENG13/spring-boot-projects/tree/master/%E7%8E%A9%E8%BD%ACSpringBoot%E7%B3%BB%E5%88%97%E6%A1%88%E4%BE%8B%E6%BA%90%E7%A0%81/spring-boot-logging\">spring-boot-logging</a>：Spring Boot 基础开发之日志输出案例</li><li><a href=\"https://github.com/ZHENFENG13/spring-boot-projects/tree/master/%E7%8E%A9%E8%BD%ACSpringBoot%E7%B3%BB%E5%88%97%E6%A1%88%E4%BE%8B%E6%BA%90%E7%A0%81/spring-boot-test\">spring-boot-test</a>：Spring Boot 基础开发之单元测试案例</li><li><a href=\"https://github.com/ZHENFENG13/spring-boot-projects/tree/master/SpringBoot%E5%85%A5%E9%97%A8%E6%A1%88%E4%BE%8B%E6%BA%90%E7%A0%81/spring-boot-static-resources\">spring-boot-static-resources</a>：Spring Boot 基础开发之静态资源处理案例</li><li><a href=\"https://github.com/ZHENFENG13/spring-boot-projects/tree/master/SpringBoot%E5%85%A5%E9%97%A8%E6%A1%88%E4%BE%8B%E6%BA%90%E7%A0%81/spring-boot-ajax\">spring-boot-ajax</a>：Spring Boot 项目实践之 Ajax 技术使用教程</li><li><a href=\"https://github.com/ZHENFENG13/spring-boot-projects/tree/master/%E7%8E%A9%E8%BD%ACSpringBoot%E7%B3%BB%E5%88%97%E6%A1%88%E4%BE%8B%E6%BA%90%E7%A0%81/spring-boot-message-converter\">spring-boot-message-converter</a>：Spring Boot 基础开发之消息转换器案例</li><li><a href=\"https://github.com/ZHENFENG13/spring-boot-projects/tree/master/SpringBoot%E5%85%A5%E9%97%A8%E6%A1%88%E4%BE%8B%E6%BA%90%E7%A0%81/spring-boot-jdbc\">spring-boot-jdbc</a>：Spring Boot 连接数据库以及在 Spring Boot 项目中操作数据库</li><li><a href=\"https://github.com/ZHENFENG13/spring-boot-projects/tree/master/%E7%8E%A9%E8%BD%ACSpringBoot%E7%B3%BB%E5%88%97%E6%A1%88%E4%BE%8B%E6%BA%90%E7%A0%81/spring-boot-druid\">spring-boot-druid</a>：Spring Boot 中使用自定义 Druid 数据源案例</li><li><a href=\"https://github.com/ZHENFENG13/spring-boot-projects/tree/master/SpringBoot%E5%85%A5%E9%97%A8%E6%A1%88%E4%BE%8B%E6%BA%90%E7%A0%81/spring-boot-mybatis\">spring-boot-mybatis</a>：Spring Boot 整合 MyBatis 操作数据库案例</li><li><a href=\"https://github.com/ZHENFENG13/spring-boot-projects/tree/master/%E7%8E%A9%E8%BD%ACSpringBoot%E7%B3%BB%E5%88%97%E6%A1%88%E4%BE%8B%E6%BA%90%E7%A0%81/spring-boot-transaction\">spring-boot-transaction</a>：Spring Boot 中的事务处理案例</li><li><a href=\"https://github.com/ZHENFENG13/spring-boot-projects/tree/master/%E7%8E%A9%E8%BD%ACSpringBoot%E7%B3%BB%E5%88%97%E6%A1%88%E4%BE%8B%E6%BA%90%E7%A0%81/spring-boot-redis\">spring-boot-redis</a>：Spring Boot 整合 Redis 操作缓存模块</li><li><a href=\"https://github.com/ZHENFENG13/spring-boot-projects/tree/master/%E7%8E%A9%E8%BD%ACSpringBoot%E7%B3%BB%E5%88%97%E6%A1%88%E4%BE%8B%E6%BA%90%E7%A0%81/spring-boot-schedule\">spring-boot-schedule</a>：Spring Boot 项目开发之@Scheduled实现定时任务案例</li><li><a href=\"https://github.com/ZHENFENG13/spring-boot-projects/tree/master/%E7%8E%A9%E8%BD%ACSpringBoot%E7%B3%BB%E5%88%97%E6%A1%88%E4%BE%8B%E6%BA%90%E7%A0%81/spring-boot-quartz\">spring-boot-quartz</a>：Spring Boot 项目开发之Quartz定时任务案例</li><li><a href=\"https://github.com/ZHENFENG13/spring-boot-projects/tree/master/%E7%8E%A9%E8%BD%ACSpringBoot%E7%B3%BB%E5%88%97%E6%A1%88%E4%BE%8B%E6%BA%90%E7%A0%81/spring-boot-error-page\">spring-boot-error-page</a>：Spring Boot 自定义错误页面案例</li><li><a href=\"https://github.com/ZHENFENG13/spring-boot-projects/tree/master/%E7%8E%A9%E8%BD%ACSpringBoot%E7%B3%BB%E5%88%97%E6%A1%88%E4%BE%8B%E6%BA%90%E7%A0%81/spring-boot-swagger\">spring-boot-swagger</a>：Spring Boot 集成 Swagger 生成接口文档案例</li><li><a href=\"https://github.com/ZHENFENG13/spring-boot-projects/tree/master/SpringBoot%E5%85%A5%E9%97%A8%E6%A1%88%E4%BE%8B%E6%BA%90%E7%A0%81/spring-boot-file-upload\">spring-boot-file-upload</a>：Spring Boot 处理文件上传及路径回显</li><li><a href=\"https://github.com/ZHENFENG13/spring-boot-projects/tree/master/SpringBoot%E5%85%A5%E9%97%A8%E6%A1%88%E4%BE%8B%E6%BA%90%E7%A0%81/spring-boot-RESTful-api\">spring-boot-RESTful-api</a>&nbsp;：Spring Boot 项目实践之 RESTful API 设计与实现</li><li><a href=\"https://github.com/ZHENFENG13/spring-boot-projects/tree/master/%E7%8E%A9%E8%BD%ACSpringBoot%E7%B3%BB%E5%88%97%E6%A1%88%E4%BE%8B%E6%BA%90%E7%A0%81/spring-boot-web-jsp\">spring-boot-web-jsp</a>&nbsp;：Spring Boot 整合 JSP 开发 web 项目</li><li><a href=\"https://github.com/ZHENFENG13/spring-boot-projects/tree/master/%E7%8E%A9%E8%BD%ACSpringBoot%E7%B3%BB%E5%88%97%E6%A1%88%E4%BE%8B%E6%BA%90%E7%A0%81/spring-boot-web-thymeleaf\">spring-boot-web-thymeleaf</a>&nbsp;：Spring Boot 整合 Thymeleaf 案例</li><li><a href=\"https://github.com/ZHENFENG13/spring-boot-projects/tree/master/%E7%8E%A9%E8%BD%ACSpringBoot%E7%B3%BB%E5%88%97%E6%A1%88%E4%BE%8B%E6%BA%90%E7%A0%81/spring-boot-web-thymeleaf-syntax\">spring-boot-web-thymeleaf-syntax</a>&nbsp;：Thymeleaf 语法详解</li><li><a href=\"https://github.com/ZHENFENG13/spring-boot-projects/tree/master/%E7%8E%A9%E8%BD%ACSpringBoot%E7%B3%BB%E5%88%97%E6%A1%88%E4%BE%8B%E6%BA%90%E7%A0%81/spring-boot-web-freemarker\">spring-boot-web-freemarker</a>&nbsp;：Spring Boot 整合 FreeMarker 案例</li><li><a href=\"https://github.com/ZHENFENG13/spring-boot-projects/tree/master/%E7%8E%A9%E8%BD%ACSpringBoot%E7%B3%BB%E5%88%97%E6%A1%88%E4%BE%8B%E6%BA%90%E7%A0%81/spring-boot-admin\">spring-boot-admin</a>&nbsp;：Spring Boot Admin 整合使用案例</li></ul><p>这些案例主要是为了让大家能够掌握 Spring Boot 的开发和使用，旨在让读者更加熟悉 Spring Boot 及企业开发中需要注意的事项并具有使用 Spring Boot 技术进行大部分企业项目功能开发的能力。</p><p>关注公众号：<strong>程序员十三</strong>，回复\"勾搭\"进群交流。</p><p><img src=\"https://newbee-mall.oss-cn-beijing.aliyuncs.com/wx-gzh/%E7%A8%8B%E5%BA%8F%E5%91%98%E5%8D%81%E4%B8%89-%E5%85%AC%E4%BC%97%E5%8F%B7.png\" alt=\"wx-gzh\"/></p><hr/><h2><a href=\"https://gitee.com/zhenfeng13/spring-boot-projects#%E5%BC%80%E5%8F%91%E6%96%87%E6%A1%A3\"></a>开发文档</h2><h3><a href=\"https://gitee.com/zhenfeng13/spring-boot-projects#springboot--mybatis--thymeleaf-%E6%90%AD%E5%BB%BA%E7%BE%8E%E8%A7%82%E5%AE%9E%E7%94%A8%E7%9A%84%E4%B8%AA%E4%BA%BA%E5%8D%9A%E5%AE%A2%E6%94%AF%E4%BB%98%E5%87%8F%E5%85%8D%E4%BC%98%E6%83%A0%E5%88%B8%E7%A0%81-lsjdk3kt-\"></a>《SpringBoot + Mybatis + Thymeleaf 搭建美观实用的个人博客》(支付减免优惠券码 LSJdK3KT )</h3><p><a href=\"https://www.lanqiao.cn/courses/1367\"><img src=\"https://newbee-mall.oss-cn-beijing.aliyuncs.com/poster/store/lesson-03.png\" alt=\"lesson-03\"/></a></p><ul><li><a href=\"https://www.lanqiao.cn/courses/1367\"><strong>第01课：Spring Boot 搭建简洁实用的个人博客系统导读</strong></a></li><li><a href=\"https://www.lanqiao.cn/courses/1367\">第02课：快速构建 Spring Boot 应用</a></li><li><a href=\"https://www.lanqiao.cn/courses/1367\">第03课：Spring Boot 项目开发之web项目开发讲解</a></li><li><a href=\"https://www.lanqiao.cn/courses/1367\">第04课：Spring Boot 整合 Thymeleaf 模板引擎</a></li><li><a href=\"https://www.lanqiao.cn/courses\">第05课：Spring Boot 处理文件上传及路径回显</a></li><li><a href=\"https://www.lanqiao.cn/courses/1367\">第06课：Spring Boot 自动配置数据源及操作数据库</a></li><li><a href=\"https://www.lanqiao.cn/courses/1367\">第07课：Spring Boot 整合 MyBatis 操作数据库</a></li><li><a href=\"https://www.lanqiao.cn/courses/1367\">第08课：Mybatis-Generator 自动生成代码</a></li><li><a href=\"https://www.lanqiao.cn/courses/1367\">第09课：Spring Boot 中的事务处理</a></li><li><a href=\"https://www.lanqiao.cn/courses/1367\">第10课：Spring Boot 项目实践之 Ajax 技术使用教程</a></li><li><a href=\"https://www.lanqiao.cn/courses/1367\">第11课：Spring Boot 项目实践之 RESTful API 设计与实现</a></li><li><a href=\"https://www.lanqiao.cn/courses/1367\">第12课：Spring Boot 博客系统项目开发之分页功能实现</a></li><li><a href=\"https://www.lanqiao.cn/courses/1367\">第13课：Spring Boot 博客系统项目开发之验证码功能</a></li><li><a href=\"https://www.lanqiao.cn/courses/1367\">第14课：Spring Boot 博客系统项目开发之登录模块实现</a></li><li><a href=\"https://www.lanqiao.cn/courses/1367\">第15课：Spring Boot 博客系统项目开发之登陆拦截器</a></li><li><a href=\"https://www.lanqiao.cn/courses/1367\">第16课：Spring Boot 博客系统项目开发之分类功能实现</a></li><li><a href=\"https://www.lanqiao.cn/courses/1367\">第17课：Spring Boot 博客系统项目开发之标签功能实现</a></li><li><a href=\"https://www.lanqiao.cn/courses/1367\">第18课：Spring Boot 博客系统项目开发之文章编辑功能</a></li><li><a href=\"https://www.lanqiao.cn/courses/1367\">第19课：Spring Boot 博客系统项目开发之文章编辑完善</a></li><li><a href=\"https://www.lanqiao.cn/courses/1367\">第20课：Spring Boot 博客系统项目开发之文章模块实现</a></li><li><a href=\"https://www.lanqiao.cn/courses/1367\">第21课：Spring Boot 博客系统项目开发之友链模块实现</a></li><li><a href=\"https://www.lanqiao.cn/courses/1367\">第22课：Spring Boot 博客系统项目开发之网站首页制作</a></li><li><a href=\"https://www.lanqiao.cn/courses/1367\">第23课：Spring Boot 博客系统项目开发之分页及侧边栏制作</a></li><li><a href=\"https://www.lanqiao.cn/courses/1367\">第24课：Spring Boot 博客系统项目开发之搜索页面制作</a></li><li><a href=\"https://www.lanqiao.cn/courses/1367\">第25课：Spring Boot 博客系统项目开发之文章详情页制作</a></li><li><a href=\"https://www.lanqiao.cn/courses/1367\">第26课：Spring Boot 博客系统项目开发之错误页面制作</a></li><li><a href=\"https://www.lanqiao.cn/courses/1367\">第27课：Spring Boot 博客系统项目开发之评论功能实现</a></li><li><a href=\"https://www.lanqiao.cn/courses/1367\">第28课：Spring Boot 博客系统项目开发之项目打包部署</a></li></ul><h3><a href=\"https://gitee.com/zhenfeng13/spring-boot-projects#springboot--mybatis--thymeleaf-%E4%B8%93%E6%A0%8F%E9%A1%B9%E7%9B%AE%E5%BC%80%E5%8F%91%E5%AE%9E%E6%88%98%E6%94%AF%E4%BB%98%E5%87%8F%E5%85%8D%E4%BC%98%E6%83%A0%E5%88%B8%E7%A0%81-nzif4dn9-\"></a>《SpringBoot + Mybatis + Thymeleaf 专栏项目开发实战》(支付减免优惠券码 nZiF4DN9 )</h3><p><a href=\"https://www.shiyanlou.com/courses/3228\"><img src=\"https://newbee-mall.oss-cn-beijing.aliyuncs.com/poster/store/lesson-08.png\" alt=\"lesson-08\"/></a></p><ul><li><a href=\"https://www.shiyanlou.com/courses/3228\"><strong>第01课：Spring Boot 项目开发环境</strong></a></li><li><a href=\"https://www.shiyanlou.com/courses/3228\">第02课：快速构建 Spring Boot 应用</a></li><li><a href=\"https://www.shiyanlou.com/courses/3228\">第03课：Spring Boot 项目开发之Web项目开发讲解</a></li><li><a href=\"https://www.shiyanlou.com/courses/3228\">第04课：Spring Boot 整合 Thymeleaf 模板引擎</a></li><li><a href=\"https://www.shiyanlou.com/courses/3228\">第05课：Thymeleaf 语法详解 语法详解</a></li><li><a href=\"https://www.shiyanlou.com/courses/3228\">第06课：Spring Boot 自动配置数据源及操作数据库</a></li><li><a href=\"https://www.shiyanlou.com/courses/3228\">第07课：Spring Boot 整合 MyBatis 操作数据库</a></li><li><a href=\"https://www.shiyanlou.com/courses/3228\">第08课：Spring Boot 项目开发之验证码功能</a></li><li><a href=\"https://www.shiyanlou.com/courses/3228\">第09课：项目开发之用户注册模块实现</a></li><li><a href=\"https://www.shiyanlou.com/courses/3228\">第10课：项目开发之用户登录模块实现</a></li><li><a href=\"https://www.shiyanlou.com/courses/3228\">第11课：项目开发之用户登录拦截器</a></li><li><a href=\"https://www.shiyanlou.com/courses/3228\">第12课：项目实战之处理文件上传及路径回显</a></li><li><a href=\"https://www.shiyanlou.com/courses/3228\">第13课：项目实战之个人中心页面制作</a></li><li><a href=\"https://www.shiyanlou.com/courses/3228\">第14课：项目实战之专栏模块开发</a></li><li><a href=\"https://www.shiyanlou.com/courses/3228\">第15课：富文本编辑器 wangEditor 整合</a></li><li><a href=\"https://www.shiyanlou.com/courses/3228\">第16课：项目实战之文章发布功能开发</a></li><li><a href=\"https://www.shiyanlou.com/courses/3228\">第17课：项目实战之文章列表及详情功能开发</a></li><li><a href=\"https://www.shiyanlou.com/courses/3228\">第18课：项目实战之文章修改功能开发</a></li></ul><h3><a href=\"https://gitee.com/zhenfeng13/spring-boot-projects#spring-boot-%E5%89%8D%E5%90%8E%E7%AB%AF%E5%88%86%E7%A6%BB%E9%A1%B9%E7%9B%AE%E5%AE%9E%E8%B7%B5%E8%AF%BE%E7%A8%8B%E7%9B%AE%E5%BD%95%E6%94%AF%E4%BB%98%E5%87%8F%E5%85%8D%E4%BC%98%E6%83%A0%E5%88%B8%E7%A0%81-y6tpsok7-\"></a>《Spring Boot 前后端分离项目实践》课程目录(支付减免优惠券码 y6tPSOK7 )</h3><p><a href=\"https://www.lanqiao.cn/courses/1244\"><img src=\"https://newbee-mall.oss-cn-beijing.aliyuncs.com/poster/store/lesson-01.png\" alt=\"lesson-01\"/></a></p><ul><li><a href=\"https://www.lanqiao.cn/courses/1244\"><strong>开篇词：SpringBoot入门及前后端分离项目实践导读</strong></a></li><li><a href=\"https://www.lanqiao.cn/courses/1244\">第02课：快速认识 Spring Boot 技术栈</a></li><li><a href=\"https://www.lanqiao.cn/courses/1244\">第03课：开发环境搭建</a></li><li><a href=\"https://www.lanqiao.cn/courses/1244\">第04课：快速构建 Spring Boot 应用</a></li><li><a href=\"https://www.lanqiao.cn/courses\">第05课：Spring Boot 之基础 web 功能开发</a></li><li><a href=\"https://www.lanqiao.cn/courses/1244\">第06课：Spring Boot 之数据库连接操作</a></li><li><a href=\"https://www.lanqiao.cn/courses/1244\">第07课：Spring Boot 整合 MyBatis 操作数据库</a></li><li><a href=\"https://www.lanqiao.cn/courses/1244\">第08课：Spring Boot 处理文件上传及路径回显</a></li><li><a href=\"https://www.lanqiao.cn/courses/1244\">第09课：Spring Boot 项目实践之前后端分离详解</a></li><li><a href=\"https://www.lanqiao.cn/courses/1244\">第10课：Spring Boot 项目实践之 Ajax 技术使用教程</a></li><li><a href=\"https://www.lanqiao.cn/courses/1244\">第11课：Spring Boot 项目实践之 RESTful API 设计与实现</a></li><li><a href=\"https://www.lanqiao.cn/courses/1244\">第12课：Spring Boot 项目实践之登录模块实现</a></li><li><a href=\"https://www.lanqiao.cn/courses/1244\">第13课：Spring Boot 项目实践之分页功能实现</a></li><li><a href=\"https://www.lanqiao.cn/courses/1244\">第14课：Spring Boot 项目实践之 jqgrid 分页整合</a></li><li><a href=\"https://www.lanqiao.cn/courses/1244\">第15课：Spring Boot 项目实践之用户编辑功能实现</a></li><li><a href=\"https://www.lanqiao.cn/courses/1244\">第16课：Spring Boot 项目实践之用户管理模块实现</a></li><li><a href=\"https://www.lanqiao.cn/courses/1244\">第17课：Spring Boot 项目实践之图片管理模块</a></li><li><a href=\"https://www.lanqiao.cn/courses/1244\">第18课：Spring Boot 项目实践之信息管理模块实现</a></li></ul><h3><a href=\"https://gitee.com/zhenfeng13/spring-boot-projects#23-%E4%B8%AA%E5%AE%9E%E9%AA%8C%E5%B8%A6%E4%BD%A0%E8%BD%BB%E6%9D%BE%E7%8E%A9%E8%BD%AC-spring-boot%E8%AF%BE%E7%A8%8B%E7%9B%AE%E5%BD%95%E6%94%AF%E4%BB%98%E5%87%8F%E5%85%8D%E4%BC%98%E6%83%A0%E5%88%B8%E7%A0%81-s0n2dsd2-\"></a>《23 个实验带你轻松玩转 Spring Boot》课程目录(支付减免优惠券码 S0N2dSD2 )</h3><p><a href=\"https://www.lanqiao.cn/courses/1274\"><img src=\"https://newbee-mall.oss-cn-beijing.aliyuncs.com/poster/store/lesson-02.png\" alt=\"lesson-02\"/></a></p><ul><li><a href=\"https://www.lanqiao.cn/courses/1274\"><strong>开篇词：《23 个实验带你轻松玩转 Spring Boot》导读</strong></a></li><li><a href=\"https://www.lanqiao.cn/courses/1274\">第02课：Spring Boot 项目开发环境搭建</a></li><li><a href=\"https://www.lanqiao.cn/courses/1274\">第03课：快速构建 Spring Boot 应用</a></li><li><a href=\"https://www.lanqiao.cn/courses/1274\">第04课：Spring Boot 基础功能开发</a></li><li><a href=\"https://www.lanqiao.cn/courses/1274\">第05课：Spring Boot 项目开发之 web 项目开发讲解</a></li><li><a href=\"https://www.lanqiao.cn/courses/1274\">第06课：Spring Boot 整合 JSP 开发 web 项目</a></li><li><a href=\"https://www.lanqiao.cn/courses/1274\">第07课：模板引擎介绍及 Spring Boot 整合 Thymeleaf</a></li><li><a href=\"https://www.lanqiao.cn/courses/1274\">第08课：Thymeleaf 语法详解</a></li><li><a href=\"https://www.lanqiao.cn/courses/1274\">第09课：FreeMarker 模板引擎整合使用教程</a></li><li><a href=\"https://www.lanqiao.cn/courses/1274\">第10课：Spring Boot 处理文件上传及路径回显</a></li><li><a href=\"https://www.lanqiao.cn/courses/1274\">第11课：Spring Boot 自动配置数据源及操作数据库</a></li><li><a href=\"https://www.lanqiao.cn/courses/1274\">第12课：Spring Boot 整合 Druid 数据源</a></li><li><a href=\"https://www.lanqiao.cn/courses/1274\">第13课：Spring Boot 整合 MyBatis 操作数据库</a></li><li><a href=\"https://www.lanqiao.cn/courses/1274\">第14课：Spring Boot 中的事务处理</a></li><li><a href=\"https://www.lanqiao.cn/courses/1274\">第15课：Spring Boot 整合 Redis 操作缓存模块</a></li><li><a href=\"https://www.lanqiao.cn/courses/1274\">第16课：Spring Boot 项目开发之实现定时任务</a></li><li><a href=\"https://www.lanqiao.cn/courses/1274\">第17课：Spring Boot 自定义错误页面</a></li><li><a href=\"https://www.lanqiao.cn/courses/1274\">第18课：Spring Boot 集成 Swagger 生成接口文档</a></li><li><a href=\"https://www.lanqiao.cn/courses/1274\">第19课：Spring Boot 项目打包部署介绍</a></li><li><a href=\"https://www.lanqiao.cn/courses/1274\">第20课：Spring Boot Admin 介绍及整合使用</a></li><li><a href=\"https://www.lanqiao.cn/courses/1274\">第21课：Spring Boot 资讯管理信息系统开发实战(一)</a></li><li><a href=\"https://www.lanqiao.cn/courses/1274\">第22课：Spring Boot 资讯管理信息系统开发实战(二)</a></li><li><a href=\"https://www.lanqiao.cn/courses/1274\">第23课：Spring Boot 资讯管理信息系统开发实战(三)</a></li><li><a href=\"https://www.lanqiao.cn/courses/1274\">第24课：Spring Boot 资讯管理信息系统开发实战(四)</a></li></ul><hr/><h2><a href=\"https://gitee.com/zhenfeng13/spring-boot-projects#%E4%BA%A4%E6%B5%81\"></a>交流</h2><blockquote><p>大家有任何问题或者建议都可以在&nbsp;<a href=\"https://github.com/ZHENFENG13/spring-boot-projects/issues\">issues</a>&nbsp;中反馈给我，我会慢慢完善这个 Spring Boot 仓库。</p></blockquote><ul><li>我的邮箱：<a href=\"mailto:2449207463@qq.com\">2449207463@qq.com</a></li><li>QQ技术交流群：719099151 796794009</li></ul>', 2, '分享', 1, 13, 2, 2, '2021-08-17 16:17:05', '2021-08-17 16:17:05');
INSERT INTO `tb_post` VALUES (12, 2, 'good good study', '<p>day day up</p>', 5, '动态', 1, 547, 0, 0, '2021-08-17 16:18:06', '2021-08-17 16:18:06');
INSERT INTO `tb_post` VALUES (13, 2, '作为程序员，听到的最多的词就是“bug”吧', '<pre><code class=\"Bash\"><xmp>原文地址：https://www.lanqiao.cn/questions/178374</xmp></code></pre><p>程序员的内心得有多强大，才能淡然接受每天的bug。</p><p>每天都要听到，“你写的东西有问题吧”，“这是bug吧”，我的天</p>', 4, '讨论', 1, 7, 0, 0, '2021-08-17 16:19:20', '2021-08-17 16:19:20');
INSERT INTO `tb_post` VALUES (14, 1, '一本实体书、一个掘金小册｜2021 年中总结', '<p>又是满满当当的半年，一边上班，一边搞搞副业，反正也挺充足的吧，虽然非常累，但是现在还年轻，多折腾折腾总是没错的。本来一切正常，按部就班的上着班，空闲时间做做副业，写写文章、写写书。最近两个月，全被慕课网涉嫌抄袭我原创项目的事件给打乱了。</p><p>也七月份了，总结一下2021年的上半年。</p><h2>第一次写书，开始印刷了</h2><p>五年了，免费文章 → 付费专栏 → 付费视频 → 实体书籍，从一开始的免费文章，之后在各个不同的平台上线付费专栏，并且录制付费视频，再到如今的实体书籍出版，每年都在变化和进步。</p><p><img src=\"https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/2f39190efb724b368b074700d02d3271~tplv-k3u1fbpfcp-watermark.awebp\" alt=\"2016-2021\"/></p><p>在<a href=\"https://juejin.cn/post/6847902217941286926#heading-7\" target=\"_blank\">《「2020年中总结」这半年我又做了哪些副业？》</a>和<a href=\"https://juejin.cn/post/6876942586980859917#heading-4\" target=\"_blank\">《程序员的副业：我靠写作赚到的第一笔收入》</a>两篇文章中都有提到我要写一本书以及第一本书的写作进度，经过了大半年时间的写作，终于在 2021 年 2 月 9 号完成了所有章节的书稿，并发送给出版社的对接编辑。<strong>这是一本面向后端开发人员的书籍，因为我自己主要使用的技术栈就是 Java，最近几年的开发中也都是使用 Spring Boot 框架，为了避免在写书过程中给自己制造困难，就选择了比较熟悉的内容进行写作，写完之后也算是了结了自己的一桩心愿。</strong></p><p>2020 年 3 月份开始与出版社方面进行沟通，之后是确定选题、写样张、签订约稿合同，到 2021 年 2 月份完成初稿，差不多已经过去了一年时间。2021 年 3 月份正式进入审编阶段，6 月初在出版社完成了三审三编的过程。封面图已设计完毕，ISBN 码也申请到了，目前正在印刷当中，应该不久就可以正式出版了。</p><p><img src=\"https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/72120a9ffe8746e994c0f22ae2b94eb4~tplv-k3u1fbpfcp-watermark.awebp\" alt=\"书籍封面01\"/></p><p>不进行实际的体验，还真的不知道想要出版一本书会这么曲折，会花费这么多时间和精力，走了这一遭之后真的体验到了很多，也学到了很多东西。毕竟，这是我第一次写书，由于很多流程都不熟悉，肯定要花费更多的时间，后面如果出版第二本书、第三本书应该会顺利很多。</p><p>第一次写书，花费了很长时间，主要是跨度时间长，真正写稿子的时间就几个月时间，但是从前期准备，到实际的写稿，再到出版社审编、印刷，这些流程走了很久。今后也有新书的打算，应该比第一次要顺利一些。</p><h2>写了两个开源项目</h2><h5>Vue 3 + Element Plus + Vite 2 的后台管理系统</h5><p>这个项目的开发背景是 Vue 3.0 正式发版和 element plus 的正式发版，时间点分别是 2020 年的 9 月份和 2020 年的 11 月份。项目 <a href=\"https://link.juejin.cn?target=https%3A%2F%2Fgithub.com%2Fnewbee-ltd%2Fvue3-admin\" target=\"_blank\">vue3-admin</a> 的开发时间应该是在 2020 年的 12 月份，当时看到 @iamkun 大佬发了一篇文章<a href=\"https://juejin.cn/post/6900733850540834830\" target=\"_blank\">《? Element UI for Vue 3.0 来了！》</a>，文章里有提到 element plus 正式发版，就想着用它来重构之前的后台管理系统。</p><p>前前后后花费了 4 个月，在 2021 年的 3 月底，把所有代码都开源了出去，主要也是供大家练练手，没什么别的想法。</p><p><img src=\"https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/439ba8fc5d164b87a8aeaf801d5fce6c~tplv-k3u1fbpfcp-watermark.awebp\" alt=\"image-20210703143851953\"/></p><p>所有的代码、文件全部都开源到 GitHub 仓库中，前后端代码全部都在仓库里。并没有任何藏着掖着的行为，包括后端 API 接口的代码也全部开源，不会说缺少哪个页面或者某个重要功能，这种事情是不存在的，大家先看看文章和预览图，觉得不错的朋友可以继续了解一下这个项目。</p><p>当然，也希望感兴趣的朋友可以找找其中的问题，提一些 pr 或者 issue，让这个开源项目能够减少问题并且保持进步。</p><blockquote>\n<p>vue3-admin 在 GitHub 和国内的码云都创建了代码仓库，如果有人访问 GitHub 比较慢的话，建议在 Gitee 上查看该项目，两个仓库会保持同步更新。</p>\n</blockquote><ul>\n<li><a href=\"https://link.juejin.cn?target=https%3A%2F%2Fgithub.com%2Fnewbee-ltd%2Fvue3-admin\" target=\"_blank\">in GitHub : vue3-admin</a></li>\n<li><a href=\"https://link.juejin.cn?target=https%3A%2F%2Fgitee.com%2Fnewbee-ltd%2Fvue3-admin\" target=\"_blank\">in Gitee : vue3-admin</a></li>\n</ul><p>预览图如下：</p><ul>\n<li>登录页</li>\n</ul><p><img src=\"https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/1758f9d6ca874c319a5776ae41d367d9~tplv-k3u1fbpfcp-watermark.awebp\" alt=\"登录页面\"/></p><ul>\n<li>分类管理</li>\n</ul><p><img src=\"https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/6b5938aeab1241e9919a0edd18f47628~tplv-k3u1fbpfcp-watermark.awebp\" alt=\"分类管理\"/></p><ul>\n<li>商品列表</li>\n</ul><p><img src=\"https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/db14e1e2a0894b4db21cd19556d5e9d6~tplv-k3u1fbpfcp-watermark.awebp\" alt=\"商品管理\"/></p><ul>\n<li>商品编辑</li>\n</ul><p><img src=\"https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/06387c4bef2d4526aa144b2b3c8439a1~tplv-k3u1fbpfcp-watermark.awebp\" alt=\"商品编辑\"/></p><h5>新增秒杀功能、优惠券、支付宝、Docker，newbee-mall升级版</h5><p>历经半年的开发、136次代码提交，新蜂商城升级版本 newbee-mall-plus 正式开源啦！</p><p><img src=\"https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/c79676581d3f46eaac7a6e3d4c290c15~tplv-k3u1fbpfcp-watermark.awebp\" alt=\"image-20210616191601257\"/></p><p>newbee-mall-plus 项目正式的开源日期是 2021 年 6 月 2号：</p><p><img src=\"https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/86eb2650289b450eac04311b4ae4e481~tplv-k3u1fbpfcp-watermark.awebp\" alt=\"image-20210616191720554\"/></p><p>该项目还会持续更新的，现在还是第一阶段。第一阶段的话，主要更新了三个功能：秒杀功能、优惠券、对接支付宝。</p><p>关于为什么要开发新蜂商城升级版本 newbee-mall-plus 以及之前的开发计划，大家可以看我之前写的一篇文章：<a href=\"https://juejin.cn/post/6918761224582889486\" target=\"_blank\">《newbee-mall 开源商城新计划：秒杀功能、优惠券、对接支付宝》</a>。所有源码已经发布到 GitHub 和 Gitee 网站上，和往常一样，我做的开源项目不会藏着掖着，源代码、项目的其他文件全部都会免费开源出去。</p><p>本来6、7月份会主要介绍这个项目的，结果被突如其来的一个意外给打乱了。我到现在也没想通，慕课网怎么能干出涉嫌抄袭和涉嫌剽窃的事情，无语。</p><h2>一个掘金小册</h2><p>关于《Vue 3.0 企业级项目实战》这个小册，也是有些巧合的。因为之前已经在掘金平台上上线了两本小册，2019 年上线了一个，2020 年上线了一个，我觉得可能短期内可能不会再让我上线小册了，所以这本小册并不在今年的计划中。</p><p>2021 年 1 月 27 日，优弧大佬发了一个消息给我，问我有没有新小册的打算，聊天记录如下图所示：</p><p><img src=\"https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/eaa3f1f6f2c541738592442736f4fb7b~tplv-k3u1fbpfcp-watermark.awebp\" alt=\"image-20210405184609096\"/></p><p>当时正在整理我第一本书的书稿，还没有这个 Vue3 小册的想法，但是大佬发话了，肯定要处理的。</p><p><img src=\"https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/ebf5fc584c5b42c5b1547ad7e80a4dc9~tplv-k3u1fbpfcp-watermark.awebp\" alt=\"大佬\"/></p><p>于是当时就答应了下来，后面就慢慢的想了一下该写一本什么样的小册，本来是有其它的课程思路，后来商量了一下还是打算做一个 Vue 3.0 的小册。</p><p>书稿整理完成之后，写了一个 Vue3 + Element Plus 的练手项目 <a href=\"https://link.juejin.cn?target=https%3A%2F%2Fgithub.com%2Fnewbee-ltd%2Fvue3-admin\" target=\"_blank\">vue3-admin</a>，同时与掘金平台又合作推出了这本 Vue3 企业级项目实战的小册，帮助大家在掌握 Vue3 基础知识点及使用技巧的同时，通过实战项目来打通 Vue3 项目开发和上线链路上的技能点，真正做到学完即用。这不仅仅是一门教你如何使用 Vue3 的课程，而是会手把手带你用 Vue3 完成和上线一个大型的企业级项目。</p><p>本小册中包含前端和后端知识，对于前端开发人员和后端开发人员都是一个很好的学习选择。</p><p><img src=\"https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/327ae603fdda4db8a4878db9fd67604f~tplv-k3u1fbpfcp-watermark.awebp\" alt=\"WechatIMG672\"/></p><p>2021 年 3 月 29 日，该小册正式上线。总共是40个章节的内容，当时上线时只写了 20 章预售章节，后面又写了两个月，于 2021-05-05 将所有章节更新完成。</p><p><img src=\"https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/1ba9f0a51f1044078ff0af3e338dee6d~tplv-k3u1fbpfcp-watermark.awebp\" alt=\"image-20210703151644810\"/></p><h2>总结</h2><p>上半年就这样过去了，2021年也已走过了一半。有焦虑，也有充实。本想平平淡淡，奈何竟出现意外。</p><p>展望一下下半年的话，重要的就是几件事：</p><p>首先，好好工作。</p><p>其次，开始准备第二本书的书稿。</p><p>以上就是我的 2021 年的年中总结，我是程序员十三，感谢大家的观看。</p><p>\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n<br/>作者：程序员十三<br/>链接：https://juejin.cn/post/6981219125854994439<br/>来源：掘金<br/>著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。</p>', 2, '分享', 1, 218, 0, 0, '2021-08-17 18:43:21', '2021-08-17 16:30:03');
INSERT INTO `tb_post` VALUES (15, 1, '一个小透明作者到出版书籍，我的心路历程分享给各位作者', '<p>作者：程序员十三<br/>链接：https://juejin.cn/post/6991610164780466207<br/>来源：掘金<br/>著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。<br/></p><p><br/></p><p>2020年和电子工业出版社签约，之后开始了自己第一本书的写作之旅。历时近一年，我的第一本书终于出版了。作为一个开发人员，也算是完成了一桩心愿，先看看她的样子吧！</p><p><img src=\"https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/fee8e0fb2f024da28697949b4b3aaff0~tplv-k3u1fbpfcp-watermark.awebp\" alt=\"1424SpringBootʵս-800-800-05\"/></p><p>书籍出版后，我也整理了这些年写作的经历。一开始我就是一个小透明作者，没有阅读量、没有粉丝，写作能力也不高。后来凭借着自己的坚持和付出，一步一个脚印，历经数年，最终完成了出版一本书的心愿。一个小透明作者到可以出书我都经历了什么，这几年的经历整理如下：</p><p><img src=\"https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/e90808601b3f4c9c84e652bae717d3f9~tplv-k3u1fbpfcp-watermark.awebp\" alt=\"写书经历\"/></p><p>本文就是一篇详细的心路历程，分享给大家。希望这段真实的案例，能给大家带来一点点的启发和帮助。</p><h2>一个大学生刚开始接触技术写作</h2><p>我是2015年本科毕业，之后就是很平淡的找工作、上班、码代码。在2017年以前，关于写书这件事，其实一直都没有这个想法，属于想都不敢想的事情。作为菜鸟，能买书、看书就不错了，那会儿哪敢想着要自己写书啊，纯扯淡嘛不是。</p><p><img src=\"https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/4c94e766971541a4a09fd29221674dae~tplv-k3u1fbpfcp-watermark.awebp\" alt=\"想peach\"/></p><p>不过我在大学时就经常逛一些程序员的网站，看看前辈们的日常分享、工作经验之类的内容。基本上每天都会去逛这些论坛，看看帖子和文章。因为我那会儿在自学开发，并且也打算从事技术开发的工作。很长的一段时间里都是默默的潜水，看看文章，偶尔回复一下，那会儿喜欢看的博主也很多。</p><p>第一次脑海中闪过写书的念头，源于张开涛大佬的经历。开涛大神分享了很多篇博客，我关注了他，也经常看这些文章。2016年11月22日，开涛大神发布了一篇文章，简单地说了一下写书的背景，然后介绍了他即将出版的那本书。对我这个初入职场的菜鸟还是带来了一些小震撼的，心里好像想的是“哇，大神就是大神，都出版书籍了”、“我一直看他的文章，竟然出书了，牛啊牛啊”。除此之外，我好像没有多少其他想法。</p><p><img src=\"https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/d2e2a60937f844b1b5256b947a9b59ea~tplv-k3u1fbpfcp-watermark.awebp\" alt=\"大神\"/></p><p>从坚持写博客，再到出版书籍，这个路径非常的清晰明了。因此，那时候脑海里是有了一个总结，通过坚持写博客，慢慢的积累，到可以出版一本书，不愧是大神啊。当然，我那时候并没有写书的念头，因为我连博客还没开始写呢，只是见识到了这个过程，觉得很崇拜。</p><p>这个时间节点是2016年，第一次近距离的接触到技术书籍的写作。</p><h2>当一个程序员有了写书的念头</h2><p>2017年，我自己也开始写文章了。就循着 IT 前辈们的脚步开始写博客，分享一些自己贫瘠的知识储备。在网上写写文章、分享一下自己的想法还有自己的知识，但是菜鸟就是菜鸟，没有写作功底，没有技术沉淀，写出来的东西其实很乏味很枯燥，我第一篇文章，300 字左右，排版混乱，也不知道在说些什么。第二篇文章，200 字左右，排版依然非常混乱，也不知道在说些什么。</p><p>不过，人会慢慢进步的嘛。边写边改，慢慢的优化文章，多看书，就这样坚持了一年多，写了差不多 100 多篇与技术相关的文章，虽然还是没什么流量，但是自己已经养成了写作的习惯，这是个非常好的习惯。</p><p>由于在网上发表的文章比较多，渐渐地也收到了一些出版社的约稿。相信很多博主应该也有过这个经历，不同的出版社会通过邮箱或者站内信的方式联系你，邀请你做书籍出版。不知道你们的想法是什么，我都是当场婉拒掉这些约稿。</p><p>为什么呢？因为我知道我自己的状态，自己几斤几两还是知道的，虽然有过写作经验，但是这种经验相较于出版书籍的要求还是有很大的差距，这一点我非常清楚，也没有什么纠结，就是先拒绝掉这些邀约，因为可行性太低。可是邀约多了，自己的心态也有了改变，讲人话就是“飘了”。不过，飘归飘，我还是没有想着去写书。只是觉得可以尝试一下，如果有合适的时间和题材的话。</p><p><img src=\"https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/8eeb34bc3f874631b38ae0e710655ac1~tplv-k3u1fbpfcp-watermark.awebp\" alt=\"image-20210731223317744\"/></p><p>这个时间节点是2018年，我自己有了写一本书的念头，实实在在的想要去尝试一下。</p><h2>成了！开始写书</h2><p>写书的念头倒是有了，但是可行性不高，因为我觉得我的知识储备还不够，我的写作能力也不高，还需要再积累一下、沉淀一下。</p><p>“写一本书”这件事也就一直埋在心底里了，很长一段时间都没有想这件事。</p><p>2018年、2019年这两年里，继续写文章，也尝试在不同的IT平台里去写付费专栏，两年时间里差不多写了4个付费专栏，每个专栏里大概20~30篇文章。2020年初，在掘金平台把《Spring Boot 大型线上商城项目实战教程》这个付费专栏的40篇文章写完之后，心里的那个念头开始动了。</p><p>相较于第一次有写书念头的2018年，又经过了两年时间的积累和沉淀。这段经历让我觉得可以尝试去联系一下出版社，咨询一下有没有可能出版一本书籍。反正先试一试嘛，如果出版社那边觉得资历不够或者写作能力不够的话，我就继续写文章，再练练。</p><p>这个时间节点是2020年，我觉得自己有能力完成一本书的写作，也想实际的出版一本作者是“十三”的书籍。</p><p><img src=\"https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/0f9514b650ea4d519011cc76ad6a1dfa~tplv-k3u1fbpfcp-watermark.awebp\" alt=\"梦想\"/></p><p>之后就是与出版社方面的沟通，2020 年 3 月份确定了书籍的选题和可行性，2020 年 4 月份开始写书籍的样章，并交给出版社方审核。</p><p>样章通过后，就开始整理书籍的大纲，一开始觉得大纲整理起来应该很快，但是并没有想象的那么顺利，差不多在 2020 年的 4 月份和 5 月份花了很多的时间才整理完成，之后与电子工业出版社签订了约稿合同。</p><h2>完成了一桩心愿！出版一本自己写的书</h2><p>当然，书籍出版的时间还是挺长的。</p><p>首先，我要把书稿整理完毕。经过了大半年时间的写作，终于在 2021 年 2 月 9 号完成了所有章节的书稿，并发送给出版社的对接编辑。</p><p>之后，编辑开始进行基础的审阅，再之后是出版社的三审三编过程。</p><p>2021 年 6 月初，书稿的审编工作完成，正式签署书籍的出版合同。</p><p>出版合同签署后，出版社开始与印刷厂对接，把文稿变成实体书。确认无误后，正式出版并开始上线销售。</p><p>开心是有的，但是激动倒不是特别激动。毕竟经历了两年多时间，再激动的情绪也都在600多个日日夜夜里散开了。我就是觉得，我完成了我个人的一桩心愿，作为一个开发人员，在毕业后的第六年出版了一本书，非常满足。</p><p><strong>“第一本书出版了，第二本还会远吗？”</strong></p><p>继续！扬帆远航！</p><p><img src=\"https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/e5c01db1f33c4456a4632bda4e6e861c~tplv-k3u1fbpfcp-watermark.awebp\" alt=\"sail\"/></p><p>这段孤独而充实的经历让我受益匪浅，今后有时间的话，也会继续尝试第二本书、第三本书、第四本书的写作。</p><h2>写在最后</h2><p>最后，感谢各位朋友们的鼓励，不管是无言的鼓励还是有声的鼓励，我都非常感谢大家。可能你只是看过我写的文章，可能你点赞过我的文章，可能你评论过我的文章，可能你给我发过邮件，可能你star过我写的开源项目，可能你私聊过我。可能你说过鼓励过我的话，可能你做出过鼓励我的行动，也可能你在心里默默的表达过对我的支持。不论如何，感谢你们。有你们的支持和批评，才会有不断完善和不断进步的程序员十三。</p><p><img src=\"https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/87ea1435242e470c90a6fac7b5e42e34~tplv-k3u1fbpfcp-watermark.awebp\" alt=\"感谢\"/></p><p>刚摸到书的时候非常激动，和刚开始签完书籍出版合同时的心情一样，特别开心也特别兴奋。但是也就是那一会儿，之后也就慢慢平静了。毕竟从沟通到写书、再到出版花费了一年多时间，再激动的心情也会在这400多个日日夜夜中消融了。其实，就是生活中千千万万件事情中的一件而已，不管当时有多么激动和愤慨，之后也都变得平静了。</p><blockquote>\n<p>除注明转载/出处外，皆为作者原创，欢迎转载，但未经作者同意必须保留此段声明，且在文章页面明显位置给出原文链接，否则保留追究法律责任的权利。</p></blockquote>', 2, '分享', 1, 1845, 1, 1, '2021-08-17 16:36:37', '2021-08-17 16:36:37');
INSERT INTO `tb_post` VALUES (16, 1, '这是一个新的springboot', '<p>新建的springboot项目</p>', 5, '动态', 1, 5, 1, 0, '2023-02-14 19:37:24', '2023-02-14 19:37:24');

-- ----------------------------
-- Table structure for tb_post_category
-- ----------------------------
DROP TABLE IF EXISTS `tb_post_category`;
CREATE TABLE `tb_post_category`  (
  `category_id` int NOT NULL AUTO_INCREMENT COMMENT '分类表主键',
  `category_name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分类的名称',
  `category_rank` int NOT NULL DEFAULT 1 COMMENT '分类的排序值 被使用的越多数值越大',
  `is_deleted` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除 0=否 1=是',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_post_category
-- ----------------------------
INSERT INTO `tb_post_category` VALUES (1, '提问', 10, 0, '2021-08-10 14:47:38');
INSERT INTO `tb_post_category` VALUES (2, '分享', 9, 0, '2021-08-10 14:47:38');
INSERT INTO `tb_post_category` VALUES (3, '建议', 8, 0, '2021-08-10 14:47:38');
INSERT INTO `tb_post_category` VALUES (4, '讨论', 7, 0, '2021-08-10 14:47:38');
INSERT INTO `tb_post_category` VALUES (5, '动态', 6, 0, '2021-08-10 14:47:38');
INSERT INTO `tb_post_category` VALUES (6, '其它', 5, 0, '2021-08-10 14:47:38');

-- ----------------------------
-- Table structure for tb_post_collect_record
-- ----------------------------
DROP TABLE IF EXISTS `tb_post_collect_record`;
CREATE TABLE `tb_post_collect_record`  (
  `record_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `post_id` bigint NOT NULL DEFAULT 0 COMMENT '收藏帖子主键',
  `user_id` bigint NOT NULL DEFAULT 0 COMMENT '收藏者id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '评论时间',
  PRIMARY KEY (`record_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_post_collect_record
-- ----------------------------
INSERT INTO `tb_post_collect_record` VALUES (1, 4, 3, '2021-08-10 16:10:07');
INSERT INTO `tb_post_collect_record` VALUES (2, 9, 3, '2021-08-10 16:15:44');
INSERT INTO `tb_post_collect_record` VALUES (3, 11, 3, '2021-08-10 16:17:13');
INSERT INTO `tb_post_collect_record` VALUES (4, 11, 2, '2021-08-10 16:18:11');
INSERT INTO `tb_post_collect_record` VALUES (5, 1, 2, '2021-08-10 16:23:02');
INSERT INTO `tb_post_collect_record` VALUES (7, 1, 1, '2023-02-14 22:07:56');

-- ----------------------------
-- Table structure for tb_post_comment
-- ----------------------------
DROP TABLE IF EXISTS `tb_post_comment`;
CREATE TABLE `tb_post_comment`  (
  `comment_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `post_id` bigint NOT NULL DEFAULT 0 COMMENT '关联的帖子主键',
  `comment_user_id` bigint NOT NULL DEFAULT 0 COMMENT '评论者id',
  `comment_body` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '评论内容',
  `parent_comment_user_id` bigint NOT NULL DEFAULT 0 COMMENT '所回复的上一级评论的userId',
  `comment_create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '评论时间',
  `is_deleted` tinyint NULL DEFAULT 0 COMMENT '是否删除 0-未删除 1-已删除',
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_post_comment
-- ----------------------------
INSERT INTO `tb_post_comment` VALUES (1, 1, 2, '赞一个', 0, '2021-08-10 16:08:43', 0);
INSERT INTO `tb_post_comment` VALUES (2, 7, 3, '我觉得 目前除了大厂，很多公司 压根就不需要高性能开发。', 0, '2021-08-10 16:10:40', 0);
INSERT INTO `tb_post_comment` VALUES (3, 11, 2, '顶一下！', 0, '2021-08-10 16:22:27', 0);
INSERT INTO `tb_post_comment` VALUES (4, 1, 2, '??  +1', 2, '2021-08-10 16:23:07', 1);
INSERT INTO `tb_post_comment` VALUES (5, 1, 3, '赞 +1', 0, '2021-08-10 16:23:45', 1);
INSERT INTO `tb_post_comment` VALUES (6, 1, 3, '学无止境', 0, '2021-08-10 16:23:55', 0);
INSERT INTO `tb_post_comment` VALUES (7, 1, 3, '赞 +1', 2, '2021-08-10 16:24:14', 0);
INSERT INTO `tb_post_comment` VALUES (8, 11, 1, '继续努力！', 0, '2021-08-10 16:34:02', 0);
INSERT INTO `tb_post_comment` VALUES (9, 16, 1, '长路漫漫，奋力前进。', 0, '2021-08-10 16:37:43', 0);
INSERT INTO `tb_post_comment` VALUES (10, 16, 1, '是的，这是一个新的java项目', 0, '2023-02-14 19:39:30', 0);

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户主键id',
  `login_name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '登陆名称(默认为邮箱号码)',
  `password_md5` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT 'MD5加密后的密码',
  `nick_name` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `head_img_url` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '头像',
  `gender` varchar(4) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '性别',
  `location` varchar(4) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '居住地',
  `introduce` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '个人简介',
  `user_status` tinyint NOT NULL DEFAULT 0 COMMENT '用户状态 0=正常 1=禁言',
  `last_login_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最新登录时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES (1, 'coder13@qq.com', 'e10adc3949ba59abbe56e057f20f883e', 'coder133', '/images/avatar/default.png', '男', '贵州', '我不怕千万人阻挡，只怕自己投降。', 0, '2023-02-15 22:00:09', '2021-08-10 14:49:38');
INSERT INTO `tb_user` VALUES (2, 'coder14@qq.com', 'e10adc3949ba59abbe56e057f20f883e', 'coder14', '/images/avatar/default.png', '未知', '未知', '这个人很懒，什么都没留下~', 0, '2021-08-10 16:21:57', '2021-08-10 15:57:48');
INSERT INTO `tb_user` VALUES (3, 'coder15@qq.com', 'e10adc3949ba59abbe56e057f20f883e', 'coder15', '/images/avatar/default.png', '男', '未知', '这个人很懒，什么都没留下~', 0, '2021-08-10 16:23:32', '2021-08-10 16:09:41');
INSERT INTO `tb_user` VALUES (4, '12345@qq.com', 'e10adc3949ba59abbe56e057f20f883e', 'gcj', '/images/avatar/default.png', '未知', '未知', '这个人很懒，什么都没留下~', 0, '2023-06-30 18:05:34', '2023-03-01 18:17:25');

SET FOREIGN_KEY_CHECKS = 1;
