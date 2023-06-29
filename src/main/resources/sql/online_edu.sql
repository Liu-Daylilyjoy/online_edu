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

 Date: 29/06/2023 11:04:58
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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '菜单' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 306 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '角色权限' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of edu_role_menu
-- ----------------------------
INSERT INTO `edu_role_menu` VALUES (338, 1, 1, '2023-06-28 17:57:14', '2023-06-28 17:57:14');
INSERT INTO `edu_role_menu` VALUES (339, 1, 2, '2023-06-28 17:57:14', '2023-06-28 17:57:14');
INSERT INTO `edu_role_menu` VALUES (340, 1, 3, '2023-06-28 17:57:14', '2023-06-28 17:57:14');
INSERT INTO `edu_role_menu` VALUES (341, 1, 4, '2023-06-28 17:57:14', '2023-06-28 17:57:14');
INSERT INTO `edu_role_menu` VALUES (342, 1, 5, '2023-06-28 17:57:14', '2023-06-28 17:57:14');
INSERT INTO `edu_role_menu` VALUES (343, 1, 6, '2023-06-28 17:57:14', '2023-06-28 17:57:14');
INSERT INTO `edu_role_menu` VALUES (344, 1, 7, '2023-06-28 17:57:14', '2023-06-28 17:57:14');
INSERT INTO `edu_role_menu` VALUES (345, 1, 8, '2023-06-28 17:57:14', '2023-06-28 17:57:14');
INSERT INTO `edu_role_menu` VALUES (346, 1, 9, '2023-06-28 17:57:14', '2023-06-28 17:57:14');
INSERT INTO `edu_role_menu` VALUES (347, 1, 10, '2023-06-28 17:57:14', '2023-06-28 17:57:14');
INSERT INTO `edu_role_menu` VALUES (348, 1, 11, '2023-06-28 17:57:14', '2023-06-28 17:57:14');
INSERT INTO `edu_role_menu` VALUES (349, 1, 13, '2023-06-28 17:57:14', '2023-06-28 17:57:14');
INSERT INTO `edu_role_menu` VALUES (350, 1, 60, '2023-06-28 17:57:14', '2023-06-28 17:57:14');
INSERT INTO `edu_role_menu` VALUES (351, 1, 58, '2023-06-28 17:57:14', '2023-06-28 17:57:14');
INSERT INTO `edu_role_menu` VALUES (352, 1, 53, '2023-06-28 17:57:14', '2023-06-28 17:57:14');
INSERT INTO `edu_role_menu` VALUES (353, 1, 51, '2023-06-28 17:57:14', '2023-06-28 17:57:14');
INSERT INTO `edu_role_menu` VALUES (354, 1, 62, '2023-06-28 17:57:14', '2023-06-28 17:57:14');
INSERT INTO `edu_role_menu` VALUES (355, 1, 14, '2023-06-28 17:57:14', '2023-06-28 17:57:14');
INSERT INTO `edu_role_menu` VALUES (356, 1, 40, '2023-06-28 17:57:14', '2023-06-28 17:57:14');
INSERT INTO `edu_role_menu` VALUES (357, 1, 47, '2023-06-28 17:57:14', '2023-06-28 17:57:14');
INSERT INTO `edu_role_menu` VALUES (358, 1, 54, '2023-06-28 17:57:14', '2023-06-28 17:57:14');
INSERT INTO `edu_role_menu` VALUES (359, 1, 55, '2023-06-28 17:57:14', '2023-06-28 17:57:14');
INSERT INTO `edu_role_menu` VALUES (360, 1, 56, '2023-06-28 17:57:14', '2023-06-28 17:57:14');
INSERT INTO `edu_role_menu` VALUES (361, 1, 48, '2023-06-28 17:57:14', '2023-06-28 17:57:14');
INSERT INTO `edu_role_menu` VALUES (362, 1, 49, '2023-06-28 17:57:14', '2023-06-28 17:57:14');
INSERT INTO `edu_role_menu` VALUES (363, 1, 37, '2023-06-28 17:57:14', '2023-06-28 17:57:14');
INSERT INTO `edu_role_menu` VALUES (364, 1, 41, '2023-06-28 17:57:14', '2023-06-28 17:57:14');
INSERT INTO `edu_role_menu` VALUES (365, 1, 42, '2023-06-28 17:57:14', '2023-06-28 17:57:14');
INSERT INTO `edu_role_menu` VALUES (366, 1, 38, '2023-06-28 17:57:14', '2023-06-28 17:57:14');
INSERT INTO `edu_role_menu` VALUES (367, 1, 63, '2023-06-28 17:57:14', '2023-06-28 17:57:14');
INSERT INTO `edu_role_menu` VALUES (368, 1, 64, '2023-06-28 17:57:14', '2023-06-28 17:57:14');
INSERT INTO `edu_role_menu` VALUES (369, 1, 66, '2023-06-28 17:57:14', '2023-06-28 17:57:14');
INSERT INTO `edu_role_menu` VALUES (370, 1, 65, '2023-06-28 17:57:14', '2023-06-28 17:57:14');
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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '用户角色' ROW_FORMAT = DYNAMIC;

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
INSERT INTO `edu_video` VALUES (2, '第二章节02', 'img\\1.png', '2020-08-14 17:47:27', 2, 1);
INSERT INTO `edu_video` VALUES (3, '第三章节03', 'img\\1.png', '2020-08-14 17:47:49', 3, 1);
INSERT INTO `edu_video` VALUES (4, '第一章节', 'img\\1.png', '2020-08-19 22:52:52', 1, 10);
INSERT INTO `edu_video` VALUES (5, '第二章节', 'img\\1.png', '2020-08-19 22:53:12', 2, 10);

SET FOREIGN_KEY_CHECKS = 1;
