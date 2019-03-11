/*
 Navicat Premium Data Transfer

 Source Server         : Admin
 Source Server Type    : MySQL
 Source Server Version : 80014
 Source Host           : localhost:3306
 Source Schema         : staffaccounting

 Target Server Type    : MySQL
 Target Server Version : 80014
 File Encoding         : 65001

 Date: 11/03/2019 13:42:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for app_role
-- ----------------------------
DROP TABLE IF EXISTS `app_role`;
CREATE TABLE `app_role`  (
  `Role_Id` bigint(20) NOT NULL,
  `Role_Name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`Role_Id`) USING BTREE,
  UNIQUE INDEX `app_role_uk`(`Role_Name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_role
-- ----------------------------
INSERT INTO `app_role` VALUES (1, 'ROLE_ADMIN');
INSERT INTO `app_role` VALUES (2, 'ROLE_MANAGER');
INSERT INTO `app_role` VALUES (3, 'ROLE_WORKER');

-- ----------------------------
-- Table structure for assume_projects
-- ----------------------------
DROP TABLE IF EXISTS `assume_projects`;
CREATE TABLE `assume_projects`  (
  `Project_Id` bigint(20) NOT NULL,
  `Project_Name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Spent_Hours` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`Project_Id`) USING BTREE,
  CONSTRAINT `projects_assume_fk` FOREIGN KEY (`Project_Id`) REFERENCES `projects` (`Project_Id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of assume_projects
-- ----------------------------
INSERT INTO `assume_projects` VALUES (1, 'First_Project', 8);
INSERT INTO `assume_projects` VALUES (2, 'Second_Project', 0);
INSERT INTO `assume_projects` VALUES (3, 'Third_Project', 5);

-- ----------------------------
-- Table structure for assume_workers
-- ----------------------------
DROP TABLE IF EXISTS `assume_workers`;
CREATE TABLE `assume_workers`  (
  `User_Id` bigint(20) NOT NULL,
  `User_Name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Total_Hours` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`User_Id`) USING BTREE,
  CONSTRAINT `assume_workers_fk` FOREIGN KEY (`User_Id`) REFERENCES `users` (`User_Id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of assume_workers
-- ----------------------------
INSERT INTO `assume_workers` VALUES (1, 'Vlad', 0);
INSERT INTO `assume_workers` VALUES (2, 'Worker', 13);
INSERT INTO `assume_workers` VALUES (3, 'Manager', 0);

-- ----------------------------
-- Table structure for calendar
-- ----------------------------
DROP TABLE IF EXISTS `calendar`;
CREATE TABLE `calendar`  (
  `id` int(11) NOT NULL,
  `db_date` date NOT NULL,
  `year` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `day` int(11) NOT NULL,
  `quarter` int(11) NOT NULL,
  `week` int(11) NOT NULL,
  `day_name` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `month_name` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `holiday_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'f',
  `weekend_flag` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'work',
  `event` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `td_ymd_idx`(`year`, `month`, `day`) USING BTREE,
  UNIQUE INDEX `td_dbdate_idx`(`db_date`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of calendar
-- ----------------------------
INSERT INTO `calendar` VALUES (20190101, '2019-01-01', 2019, 1, 1, 1, 1, 'Tuesday', 'January', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190102, '2019-01-02', 2019, 1, 2, 1, 1, 'Wednesday', 'January', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190103, '2019-01-03', 2019, 1, 3, 1, 1, 'Thursday', 'January', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190104, '2019-01-04', 2019, 1, 4, 1, 1, 'Friday', 'January', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190105, '2019-01-05', 2019, 1, 5, 1, 1, 'Saturday', 'January', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190106, '2019-01-06', 2019, 1, 6, 1, 1, 'Sunday', 'January', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190107, '2019-01-07', 2019, 1, 7, 1, 2, 'Monday', 'January', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190108, '2019-01-08', 2019, 1, 8, 1, 2, 'Tuesday', 'January', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190109, '2019-01-09', 2019, 1, 9, 1, 2, 'Wednesday', 'January', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190110, '2019-01-10', 2019, 1, 10, 1, 2, 'Thursday', 'January', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190111, '2019-01-11', 2019, 1, 11, 1, 2, 'Friday', 'January', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190112, '2019-01-12', 2019, 1, 12, 1, 2, 'Saturday', 'January', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190113, '2019-01-13', 2019, 1, 13, 1, 2, 'Sunday', 'January', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190114, '2019-01-14', 2019, 1, 14, 1, 3, 'Monday', 'January', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190115, '2019-01-15', 2019, 1, 15, 1, 3, 'Tuesday', 'January', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190116, '2019-01-16', 2019, 1, 16, 1, 3, 'Wednesday', 'January', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190117, '2019-01-17', 2019, 1, 17, 1, 3, 'Thursday', 'January', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190118, '2019-01-18', 2019, 1, 18, 1, 3, 'Friday', 'January', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190119, '2019-01-19', 2019, 1, 19, 1, 3, 'Saturday', 'January', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190120, '2019-01-20', 2019, 1, 20, 1, 3, 'Sunday', 'January', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190121, '2019-01-21', 2019, 1, 21, 1, 4, 'Monday', 'January', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190122, '2019-01-22', 2019, 1, 22, 1, 4, 'Tuesday', 'January', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190123, '2019-01-23', 2019, 1, 23, 1, 4, 'Wednesday', 'January', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190124, '2019-01-24', 2019, 1, 24, 1, 4, 'Thursday', 'January', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190125, '2019-01-25', 2019, 1, 25, 1, 4, 'Friday', 'January', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190126, '2019-01-26', 2019, 1, 26, 1, 4, 'Saturday', 'January', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190127, '2019-01-27', 2019, 1, 27, 1, 4, 'Sunday', 'January', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190128, '2019-01-28', 2019, 1, 28, 1, 5, 'Monday', 'January', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190129, '2019-01-29', 2019, 1, 29, 1, 5, 'Tuesday', 'January', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190130, '2019-01-30', 2019, 1, 30, 1, 5, 'Wednesday', 'January', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190131, '2019-01-31', 2019, 1, 31, 1, 5, 'Thursday', 'January', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190201, '2019-02-01', 2019, 2, 1, 1, 5, 'Friday', 'February', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190202, '2019-02-02', 2019, 2, 2, 1, 5, 'Saturday', 'February', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190203, '2019-02-03', 2019, 2, 3, 1, 5, 'Sunday', 'February', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190204, '2019-02-04', 2019, 2, 4, 1, 6, 'Monday', 'February', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190205, '2019-02-05', 2019, 2, 5, 1, 6, 'Tuesday', 'February', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190206, '2019-02-06', 2019, 2, 6, 1, 6, 'Wednesday', 'February', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190207, '2019-02-07', 2019, 2, 7, 1, 6, 'Thursday', 'February', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190208, '2019-02-08', 2019, 2, 8, 1, 6, 'Friday', 'February', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190209, '2019-02-09', 2019, 2, 9, 1, 6, 'Saturday', 'February', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190210, '2019-02-10', 2019, 2, 10, 1, 6, 'Sunday', 'February', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190211, '2019-02-11', 2019, 2, 11, 1, 7, 'Monday', 'February', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190212, '2019-02-12', 2019, 2, 12, 1, 7, 'Tuesday', 'February', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190213, '2019-02-13', 2019, 2, 13, 1, 7, 'Wednesday', 'February', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190214, '2019-02-14', 2019, 2, 14, 1, 7, 'Thursday', 'February', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190215, '2019-02-15', 2019, 2, 15, 1, 7, 'Friday', 'February', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190216, '2019-02-16', 2019, 2, 16, 1, 7, 'Saturday', 'February', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190217, '2019-02-17', 2019, 2, 17, 1, 7, 'Sunday', 'February', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190218, '2019-02-18', 2019, 2, 18, 1, 8, 'Monday', 'February', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190219, '2019-02-19', 2019, 2, 19, 1, 8, 'Tuesday', 'February', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190220, '2019-02-20', 2019, 2, 20, 1, 8, 'Wednesday', 'February', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190221, '2019-02-21', 2019, 2, 21, 1, 8, 'Thursday', 'February', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190222, '2019-02-22', 2019, 2, 22, 1, 8, 'Friday', 'February', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190223, '2019-02-23', 2019, 2, 23, 1, 8, 'Saturday', 'February', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190224, '2019-02-24', 2019, 2, 24, 1, 8, 'Sunday', 'February', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190225, '2019-02-25', 2019, 2, 25, 1, 9, 'Monday', 'February', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190226, '2019-02-26', 2019, 2, 26, 1, 9, 'Tuesday', 'February', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190227, '2019-02-27', 2019, 2, 27, 1, 9, 'Wednesday', 'February', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190228, '2019-02-28', 2019, 2, 28, 1, 9, 'Thursday', 'February', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190301, '2019-03-01', 2019, 3, 1, 1, 9, 'Friday', 'March', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190302, '2019-03-02', 2019, 3, 2, 1, 9, 'Saturday', 'March', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190303, '2019-03-03', 2019, 3, 3, 1, 9, 'Sunday', 'March', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190304, '2019-03-04', 2019, 3, 4, 1, 10, 'Monday', 'March', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190305, '2019-03-05', 2019, 3, 5, 1, 10, 'Tuesday', 'March', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190306, '2019-03-06', 2019, 3, 6, 1, 10, 'Wednesday', 'March', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190307, '2019-03-07', 2019, 3, 7, 1, 10, 'Thursday', 'March', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190308, '2019-03-08', 2019, 3, 8, 1, 10, 'Friday', 'March', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190309, '2019-03-09', 2019, 3, 9, 1, 10, 'Saturday', 'March', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190310, '2019-03-10', 2019, 3, 10, 1, 10, 'Sunday', 'March', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190311, '2019-03-11', 2019, 3, 11, 1, 11, 'Monday', 'March', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190312, '2019-03-12', 2019, 3, 12, 1, 11, 'Tuesday', 'March', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190313, '2019-03-13', 2019, 3, 13, 1, 11, 'Wednesday', 'March', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190314, '2019-03-14', 2019, 3, 14, 1, 11, 'Thursday', 'March', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190315, '2019-03-15', 2019, 3, 15, 1, 11, 'Friday', 'March', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190316, '2019-03-16', 2019, 3, 16, 1, 11, 'Saturday', 'March', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190317, '2019-03-17', 2019, 3, 17, 1, 11, 'Sunday', 'March', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190318, '2019-03-18', 2019, 3, 18, 1, 12, 'Monday', 'March', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190319, '2019-03-19', 2019, 3, 19, 1, 12, 'Tuesday', 'March', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190320, '2019-03-20', 2019, 3, 20, 1, 12, 'Wednesday', 'March', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190321, '2019-03-21', 2019, 3, 21, 1, 12, 'Thursday', 'March', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190322, '2019-03-22', 2019, 3, 22, 1, 12, 'Friday', 'March', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190323, '2019-03-23', 2019, 3, 23, 1, 12, 'Saturday', 'March', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190324, '2019-03-24', 2019, 3, 24, 1, 12, 'Sunday', 'March', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190325, '2019-03-25', 2019, 3, 25, 1, 13, 'Monday', 'March', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190326, '2019-03-26', 2019, 3, 26, 1, 13, 'Tuesday', 'March', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190327, '2019-03-27', 2019, 3, 27, 1, 13, 'Wednesday', 'March', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190328, '2019-03-28', 2019, 3, 28, 1, 13, 'Thursday', 'March', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190329, '2019-03-29', 2019, 3, 29, 1, 13, 'Friday', 'March', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190330, '2019-03-30', 2019, 3, 30, 1, 13, 'Saturday', 'March', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190331, '2019-03-31', 2019, 3, 31, 1, 13, 'Sunday', 'March', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190401, '2019-04-01', 2019, 4, 1, 2, 14, 'Monday', 'April', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190402, '2019-04-02', 2019, 4, 2, 2, 14, 'Tuesday', 'April', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190403, '2019-04-03', 2019, 4, 3, 2, 14, 'Wednesday', 'April', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190404, '2019-04-04', 2019, 4, 4, 2, 14, 'Thursday', 'April', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190405, '2019-04-05', 2019, 4, 5, 2, 14, 'Friday', 'April', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190406, '2019-04-06', 2019, 4, 6, 2, 14, 'Saturday', 'April', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190407, '2019-04-07', 2019, 4, 7, 2, 14, 'Sunday', 'April', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190408, '2019-04-08', 2019, 4, 8, 2, 15, 'Monday', 'April', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190409, '2019-04-09', 2019, 4, 9, 2, 15, 'Tuesday', 'April', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190410, '2019-04-10', 2019, 4, 10, 2, 15, 'Wednesday', 'April', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190411, '2019-04-11', 2019, 4, 11, 2, 15, 'Thursday', 'April', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190412, '2019-04-12', 2019, 4, 12, 2, 15, 'Friday', 'April', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190413, '2019-04-13', 2019, 4, 13, 2, 15, 'Saturday', 'April', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190414, '2019-04-14', 2019, 4, 14, 2, 15, 'Sunday', 'April', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190415, '2019-04-15', 2019, 4, 15, 2, 16, 'Monday', 'April', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190416, '2019-04-16', 2019, 4, 16, 2, 16, 'Tuesday', 'April', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190417, '2019-04-17', 2019, 4, 17, 2, 16, 'Wednesday', 'April', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190418, '2019-04-18', 2019, 4, 18, 2, 16, 'Thursday', 'April', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190419, '2019-04-19', 2019, 4, 19, 2, 16, 'Friday', 'April', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190420, '2019-04-20', 2019, 4, 20, 2, 16, 'Saturday', 'April', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190421, '2019-04-21', 2019, 4, 21, 2, 16, 'Sunday', 'April', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190422, '2019-04-22', 2019, 4, 22, 2, 17, 'Monday', 'April', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190423, '2019-04-23', 2019, 4, 23, 2, 17, 'Tuesday', 'April', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190424, '2019-04-24', 2019, 4, 24, 2, 17, 'Wednesday', 'April', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190425, '2019-04-25', 2019, 4, 25, 2, 17, 'Thursday', 'April', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190426, '2019-04-26', 2019, 4, 26, 2, 17, 'Friday', 'April', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190427, '2019-04-27', 2019, 4, 27, 2, 17, 'Saturday', 'April', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190428, '2019-04-28', 2019, 4, 28, 2, 17, 'Sunday', 'April', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190429, '2019-04-29', 2019, 4, 29, 2, 18, 'Monday', 'April', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190430, '2019-04-30', 2019, 4, 30, 2, 18, 'Tuesday', 'April', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190501, '2019-05-01', 2019, 5, 1, 2, 18, 'Wednesday', 'May', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190502, '2019-05-02', 2019, 5, 2, 2, 18, 'Thursday', 'May', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190503, '2019-05-03', 2019, 5, 3, 2, 18, 'Friday', 'May', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190504, '2019-05-04', 2019, 5, 4, 2, 18, 'Saturday', 'May', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190505, '2019-05-05', 2019, 5, 5, 2, 18, 'Sunday', 'May', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190506, '2019-05-06', 2019, 5, 6, 2, 19, 'Monday', 'May', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190507, '2019-05-07', 2019, 5, 7, 2, 19, 'Tuesday', 'May', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190508, '2019-05-08', 2019, 5, 8, 2, 19, 'Wednesday', 'May', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190509, '2019-05-09', 2019, 5, 9, 2, 19, 'Thursday', 'May', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190510, '2019-05-10', 2019, 5, 10, 2, 19, 'Friday', 'May', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190511, '2019-05-11', 2019, 5, 11, 2, 19, 'Saturday', 'May', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190512, '2019-05-12', 2019, 5, 12, 2, 19, 'Sunday', 'May', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190513, '2019-05-13', 2019, 5, 13, 2, 20, 'Monday', 'May', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190514, '2019-05-14', 2019, 5, 14, 2, 20, 'Tuesday', 'May', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190515, '2019-05-15', 2019, 5, 15, 2, 20, 'Wednesday', 'May', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190516, '2019-05-16', 2019, 5, 16, 2, 20, 'Thursday', 'May', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190517, '2019-05-17', 2019, 5, 17, 2, 20, 'Friday', 'May', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190518, '2019-05-18', 2019, 5, 18, 2, 20, 'Saturday', 'May', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190519, '2019-05-19', 2019, 5, 19, 2, 20, 'Sunday', 'May', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190520, '2019-05-20', 2019, 5, 20, 2, 21, 'Monday', 'May', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190521, '2019-05-21', 2019, 5, 21, 2, 21, 'Tuesday', 'May', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190522, '2019-05-22', 2019, 5, 22, 2, 21, 'Wednesday', 'May', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190523, '2019-05-23', 2019, 5, 23, 2, 21, 'Thursday', 'May', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190524, '2019-05-24', 2019, 5, 24, 2, 21, 'Friday', 'May', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190525, '2019-05-25', 2019, 5, 25, 2, 21, 'Saturday', 'May', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190526, '2019-05-26', 2019, 5, 26, 2, 21, 'Sunday', 'May', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190527, '2019-05-27', 2019, 5, 27, 2, 22, 'Monday', 'May', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190528, '2019-05-28', 2019, 5, 28, 2, 22, 'Tuesday', 'May', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190529, '2019-05-29', 2019, 5, 29, 2, 22, 'Wednesday', 'May', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190530, '2019-05-30', 2019, 5, 30, 2, 22, 'Thursday', 'May', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190531, '2019-05-31', 2019, 5, 31, 2, 22, 'Friday', 'May', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190601, '2019-06-01', 2019, 6, 1, 2, 22, 'Saturday', 'June', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190602, '2019-06-02', 2019, 6, 2, 2, 22, 'Sunday', 'June', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190603, '2019-06-03', 2019, 6, 3, 2, 23, 'Monday', 'June', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190604, '2019-06-04', 2019, 6, 4, 2, 23, 'Tuesday', 'June', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190605, '2019-06-05', 2019, 6, 5, 2, 23, 'Wednesday', 'June', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190606, '2019-06-06', 2019, 6, 6, 2, 23, 'Thursday', 'June', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190607, '2019-06-07', 2019, 6, 7, 2, 23, 'Friday', 'June', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190608, '2019-06-08', 2019, 6, 8, 2, 23, 'Saturday', 'June', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190609, '2019-06-09', 2019, 6, 9, 2, 23, 'Sunday', 'June', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190610, '2019-06-10', 2019, 6, 10, 2, 24, 'Monday', 'June', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190611, '2019-06-11', 2019, 6, 11, 2, 24, 'Tuesday', 'June', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190612, '2019-06-12', 2019, 6, 12, 2, 24, 'Wednesday', 'June', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190613, '2019-06-13', 2019, 6, 13, 2, 24, 'Thursday', 'June', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190614, '2019-06-14', 2019, 6, 14, 2, 24, 'Friday', 'June', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190615, '2019-06-15', 2019, 6, 15, 2, 24, 'Saturday', 'June', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190616, '2019-06-16', 2019, 6, 16, 2, 24, 'Sunday', 'June', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190617, '2019-06-17', 2019, 6, 17, 2, 25, 'Monday', 'June', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190618, '2019-06-18', 2019, 6, 18, 2, 25, 'Tuesday', 'June', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190619, '2019-06-19', 2019, 6, 19, 2, 25, 'Wednesday', 'June', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190620, '2019-06-20', 2019, 6, 20, 2, 25, 'Thursday', 'June', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190621, '2019-06-21', 2019, 6, 21, 2, 25, 'Friday', 'June', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190622, '2019-06-22', 2019, 6, 22, 2, 25, 'Saturday', 'June', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190623, '2019-06-23', 2019, 6, 23, 2, 25, 'Sunday', 'June', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190624, '2019-06-24', 2019, 6, 24, 2, 26, 'Monday', 'June', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190625, '2019-06-25', 2019, 6, 25, 2, 26, 'Tuesday', 'June', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190626, '2019-06-26', 2019, 6, 26, 2, 26, 'Wednesday', 'June', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190627, '2019-06-27', 2019, 6, 27, 2, 26, 'Thursday', 'June', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190628, '2019-06-28', 2019, 6, 28, 2, 26, 'Friday', 'June', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190629, '2019-06-29', 2019, 6, 29, 2, 26, 'Saturday', 'June', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190630, '2019-06-30', 2019, 6, 30, 2, 26, 'Sunday', 'June', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190701, '2019-07-01', 2019, 7, 1, 3, 27, 'Monday', 'July', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190702, '2019-07-02', 2019, 7, 2, 3, 27, 'Tuesday', 'July', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190703, '2019-07-03', 2019, 7, 3, 3, 27, 'Wednesday', 'July', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190704, '2019-07-04', 2019, 7, 4, 3, 27, 'Thursday', 'July', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190705, '2019-07-05', 2019, 7, 5, 3, 27, 'Friday', 'July', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190706, '2019-07-06', 2019, 7, 6, 3, 27, 'Saturday', 'July', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190707, '2019-07-07', 2019, 7, 7, 3, 27, 'Sunday', 'July', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190708, '2019-07-08', 2019, 7, 8, 3, 28, 'Monday', 'July', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190709, '2019-07-09', 2019, 7, 9, 3, 28, 'Tuesday', 'July', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190710, '2019-07-10', 2019, 7, 10, 3, 28, 'Wednesday', 'July', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190711, '2019-07-11', 2019, 7, 11, 3, 28, 'Thursday', 'July', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190712, '2019-07-12', 2019, 7, 12, 3, 28, 'Friday', 'July', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190713, '2019-07-13', 2019, 7, 13, 3, 28, 'Saturday', 'July', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190714, '2019-07-14', 2019, 7, 14, 3, 28, 'Sunday', 'July', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190715, '2019-07-15', 2019, 7, 15, 3, 29, 'Monday', 'July', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190716, '2019-07-16', 2019, 7, 16, 3, 29, 'Tuesday', 'July', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190717, '2019-07-17', 2019, 7, 17, 3, 29, 'Wednesday', 'July', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190718, '2019-07-18', 2019, 7, 18, 3, 29, 'Thursday', 'July', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190719, '2019-07-19', 2019, 7, 19, 3, 29, 'Friday', 'July', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190720, '2019-07-20', 2019, 7, 20, 3, 29, 'Saturday', 'July', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190721, '2019-07-21', 2019, 7, 21, 3, 29, 'Sunday', 'July', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190722, '2019-07-22', 2019, 7, 22, 3, 30, 'Monday', 'July', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190723, '2019-07-23', 2019, 7, 23, 3, 30, 'Tuesday', 'July', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190724, '2019-07-24', 2019, 7, 24, 3, 30, 'Wednesday', 'July', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190725, '2019-07-25', 2019, 7, 25, 3, 30, 'Thursday', 'July', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190726, '2019-07-26', 2019, 7, 26, 3, 30, 'Friday', 'July', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190727, '2019-07-27', 2019, 7, 27, 3, 30, 'Saturday', 'July', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190728, '2019-07-28', 2019, 7, 28, 3, 30, 'Sunday', 'July', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190729, '2019-07-29', 2019, 7, 29, 3, 31, 'Monday', 'July', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190730, '2019-07-30', 2019, 7, 30, 3, 31, 'Tuesday', 'July', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190731, '2019-07-31', 2019, 7, 31, 3, 31, 'Wednesday', 'July', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190801, '2019-08-01', 2019, 8, 1, 3, 31, 'Thursday', 'August', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190802, '2019-08-02', 2019, 8, 2, 3, 31, 'Friday', 'August', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190803, '2019-08-03', 2019, 8, 3, 3, 31, 'Saturday', 'August', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190804, '2019-08-04', 2019, 8, 4, 3, 31, 'Sunday', 'August', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190805, '2019-08-05', 2019, 8, 5, 3, 32, 'Monday', 'August', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190806, '2019-08-06', 2019, 8, 6, 3, 32, 'Tuesday', 'August', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190807, '2019-08-07', 2019, 8, 7, 3, 32, 'Wednesday', 'August', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190808, '2019-08-08', 2019, 8, 8, 3, 32, 'Thursday', 'August', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190809, '2019-08-09', 2019, 8, 9, 3, 32, 'Friday', 'August', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190810, '2019-08-10', 2019, 8, 10, 3, 32, 'Saturday', 'August', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190811, '2019-08-11', 2019, 8, 11, 3, 32, 'Sunday', 'August', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190812, '2019-08-12', 2019, 8, 12, 3, 33, 'Monday', 'August', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190813, '2019-08-13', 2019, 8, 13, 3, 33, 'Tuesday', 'August', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190814, '2019-08-14', 2019, 8, 14, 3, 33, 'Wednesday', 'August', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190815, '2019-08-15', 2019, 8, 15, 3, 33, 'Thursday', 'August', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190816, '2019-08-16', 2019, 8, 16, 3, 33, 'Friday', 'August', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190817, '2019-08-17', 2019, 8, 17, 3, 33, 'Saturday', 'August', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190818, '2019-08-18', 2019, 8, 18, 3, 33, 'Sunday', 'August', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190819, '2019-08-19', 2019, 8, 19, 3, 34, 'Monday', 'August', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190820, '2019-08-20', 2019, 8, 20, 3, 34, 'Tuesday', 'August', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190821, '2019-08-21', 2019, 8, 21, 3, 34, 'Wednesday', 'August', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190822, '2019-08-22', 2019, 8, 22, 3, 34, 'Thursday', 'August', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190823, '2019-08-23', 2019, 8, 23, 3, 34, 'Friday', 'August', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190824, '2019-08-24', 2019, 8, 24, 3, 34, 'Saturday', 'August', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190825, '2019-08-25', 2019, 8, 25, 3, 34, 'Sunday', 'August', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190826, '2019-08-26', 2019, 8, 26, 3, 35, 'Monday', 'August', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190827, '2019-08-27', 2019, 8, 27, 3, 35, 'Tuesday', 'August', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190828, '2019-08-28', 2019, 8, 28, 3, 35, 'Wednesday', 'August', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190829, '2019-08-29', 2019, 8, 29, 3, 35, 'Thursday', 'August', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190830, '2019-08-30', 2019, 8, 30, 3, 35, 'Friday', 'August', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190831, '2019-08-31', 2019, 8, 31, 3, 35, 'Saturday', 'August', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190901, '2019-09-01', 2019, 9, 1, 3, 35, 'Sunday', 'September', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190902, '2019-09-02', 2019, 9, 2, 3, 36, 'Monday', 'September', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190903, '2019-09-03', 2019, 9, 3, 3, 36, 'Tuesday', 'September', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190904, '2019-09-04', 2019, 9, 4, 3, 36, 'Wednesday', 'September', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190905, '2019-09-05', 2019, 9, 5, 3, 36, 'Thursday', 'September', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190906, '2019-09-06', 2019, 9, 6, 3, 36, 'Friday', 'September', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190907, '2019-09-07', 2019, 9, 7, 3, 36, 'Saturday', 'September', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190908, '2019-09-08', 2019, 9, 8, 3, 36, 'Sunday', 'September', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190909, '2019-09-09', 2019, 9, 9, 3, 37, 'Monday', 'September', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190910, '2019-09-10', 2019, 9, 10, 3, 37, 'Tuesday', 'September', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190911, '2019-09-11', 2019, 9, 11, 3, 37, 'Wednesday', 'September', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190912, '2019-09-12', 2019, 9, 12, 3, 37, 'Thursday', 'September', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190913, '2019-09-13', 2019, 9, 13, 3, 37, 'Friday', 'September', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190914, '2019-09-14', 2019, 9, 14, 3, 37, 'Saturday', 'September', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190915, '2019-09-15', 2019, 9, 15, 3, 37, 'Sunday', 'September', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190916, '2019-09-16', 2019, 9, 16, 3, 38, 'Monday', 'September', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190917, '2019-09-17', 2019, 9, 17, 3, 38, 'Tuesday', 'September', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190918, '2019-09-18', 2019, 9, 18, 3, 38, 'Wednesday', 'September', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190919, '2019-09-19', 2019, 9, 19, 3, 38, 'Thursday', 'September', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190920, '2019-09-20', 2019, 9, 20, 3, 38, 'Friday', 'September', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190921, '2019-09-21', 2019, 9, 21, 3, 38, 'Saturday', 'September', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190922, '2019-09-22', 2019, 9, 22, 3, 38, 'Sunday', 'September', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190923, '2019-09-23', 2019, 9, 23, 3, 39, 'Monday', 'September', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190924, '2019-09-24', 2019, 9, 24, 3, 39, 'Tuesday', 'September', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190925, '2019-09-25', 2019, 9, 25, 3, 39, 'Wednesday', 'September', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190926, '2019-09-26', 2019, 9, 26, 3, 39, 'Thursday', 'September', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190927, '2019-09-27', 2019, 9, 27, 3, 39, 'Friday', 'September', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20190928, '2019-09-28', 2019, 9, 28, 3, 39, 'Saturday', 'September', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190929, '2019-09-29', 2019, 9, 29, 3, 39, 'Sunday', 'September', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20190930, '2019-09-30', 2019, 9, 30, 3, 40, 'Monday', 'September', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20191001, '2019-10-01', 2019, 10, 1, 4, 40, 'Tuesday', 'October', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20191002, '2019-10-02', 2019, 10, 2, 4, 40, 'Wednesday', 'October', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20191003, '2019-10-03', 2019, 10, 3, 4, 40, 'Thursday', 'October', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20191004, '2019-10-04', 2019, 10, 4, 4, 40, 'Friday', 'October', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20191005, '2019-10-05', 2019, 10, 5, 4, 40, 'Saturday', 'October', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20191006, '2019-10-06', 2019, 10, 6, 4, 40, 'Sunday', 'October', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20191007, '2019-10-07', 2019, 10, 7, 4, 41, 'Monday', 'October', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20191008, '2019-10-08', 2019, 10, 8, 4, 41, 'Tuesday', 'October', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20191009, '2019-10-09', 2019, 10, 9, 4, 41, 'Wednesday', 'October', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20191010, '2019-10-10', 2019, 10, 10, 4, 41, 'Thursday', 'October', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20191011, '2019-10-11', 2019, 10, 11, 4, 41, 'Friday', 'October', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20191012, '2019-10-12', 2019, 10, 12, 4, 41, 'Saturday', 'October', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20191013, '2019-10-13', 2019, 10, 13, 4, 41, 'Sunday', 'October', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20191014, '2019-10-14', 2019, 10, 14, 4, 42, 'Monday', 'October', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20191015, '2019-10-15', 2019, 10, 15, 4, 42, 'Tuesday', 'October', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20191016, '2019-10-16', 2019, 10, 16, 4, 42, 'Wednesday', 'October', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20191017, '2019-10-17', 2019, 10, 17, 4, 42, 'Thursday', 'October', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20191018, '2019-10-18', 2019, 10, 18, 4, 42, 'Friday', 'October', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20191019, '2019-10-19', 2019, 10, 19, 4, 42, 'Saturday', 'October', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20191020, '2019-10-20', 2019, 10, 20, 4, 42, 'Sunday', 'October', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20191021, '2019-10-21', 2019, 10, 21, 4, 43, 'Monday', 'October', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20191022, '2019-10-22', 2019, 10, 22, 4, 43, 'Tuesday', 'October', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20191023, '2019-10-23', 2019, 10, 23, 4, 43, 'Wednesday', 'October', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20191024, '2019-10-24', 2019, 10, 24, 4, 43, 'Thursday', 'October', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20191025, '2019-10-25', 2019, 10, 25, 4, 43, 'Friday', 'October', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20191026, '2019-10-26', 2019, 10, 26, 4, 43, 'Saturday', 'October', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20191027, '2019-10-27', 2019, 10, 27, 4, 43, 'Sunday', 'October', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20191028, '2019-10-28', 2019, 10, 28, 4, 44, 'Monday', 'October', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20191029, '2019-10-29', 2019, 10, 29, 4, 44, 'Tuesday', 'October', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20191030, '2019-10-30', 2019, 10, 30, 4, 44, 'Wednesday', 'October', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20191031, '2019-10-31', 2019, 10, 31, 4, 44, 'Thursday', 'October', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20191101, '2019-11-01', 2019, 11, 1, 4, 44, 'Friday', 'November', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20191102, '2019-11-02', 2019, 11, 2, 4, 44, 'Saturday', 'November', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20191103, '2019-11-03', 2019, 11, 3, 4, 44, 'Sunday', 'November', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20191104, '2019-11-04', 2019, 11, 4, 4, 45, 'Monday', 'November', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20191105, '2019-11-05', 2019, 11, 5, 4, 45, 'Tuesday', 'November', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20191106, '2019-11-06', 2019, 11, 6, 4, 45, 'Wednesday', 'November', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20191107, '2019-11-07', 2019, 11, 7, 4, 45, 'Thursday', 'November', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20191108, '2019-11-08', 2019, 11, 8, 4, 45, 'Friday', 'November', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20191109, '2019-11-09', 2019, 11, 9, 4, 45, 'Saturday', 'November', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20191110, '2019-11-10', 2019, 11, 10, 4, 45, 'Sunday', 'November', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20191111, '2019-11-11', 2019, 11, 11, 4, 46, 'Monday', 'November', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20191112, '2019-11-12', 2019, 11, 12, 4, 46, 'Tuesday', 'November', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20191113, '2019-11-13', 2019, 11, 13, 4, 46, 'Wednesday', 'November', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20191114, '2019-11-14', 2019, 11, 14, 4, 46, 'Thursday', 'November', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20191115, '2019-11-15', 2019, 11, 15, 4, 46, 'Friday', 'November', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20191116, '2019-11-16', 2019, 11, 16, 4, 46, 'Saturday', 'November', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20191117, '2019-11-17', 2019, 11, 17, 4, 46, 'Sunday', 'November', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20191118, '2019-11-18', 2019, 11, 18, 4, 47, 'Monday', 'November', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20191119, '2019-11-19', 2019, 11, 19, 4, 47, 'Tuesday', 'November', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20191120, '2019-11-20', 2019, 11, 20, 4, 47, 'Wednesday', 'November', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20191121, '2019-11-21', 2019, 11, 21, 4, 47, 'Thursday', 'November', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20191122, '2019-11-22', 2019, 11, 22, 4, 47, 'Friday', 'November', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20191123, '2019-11-23', 2019, 11, 23, 4, 47, 'Saturday', 'November', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20191124, '2019-11-24', 2019, 11, 24, 4, 47, 'Sunday', 'November', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20191125, '2019-11-25', 2019, 11, 25, 4, 48, 'Monday', 'November', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20191126, '2019-11-26', 2019, 11, 26, 4, 48, 'Tuesday', 'November', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20191127, '2019-11-27', 2019, 11, 27, 4, 48, 'Wednesday', 'November', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20191128, '2019-11-28', 2019, 11, 28, 4, 48, 'Thursday', 'November', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20191129, '2019-11-29', 2019, 11, 29, 4, 48, 'Friday', 'November', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20191130, '2019-11-30', 2019, 11, 30, 4, 48, 'Saturday', 'November', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20191201, '2019-12-01', 2019, 12, 1, 4, 48, 'Sunday', 'December', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20191202, '2019-12-02', 2019, 12, 2, 4, 49, 'Monday', 'December', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20191203, '2019-12-03', 2019, 12, 3, 4, 49, 'Tuesday', 'December', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20191204, '2019-12-04', 2019, 12, 4, 4, 49, 'Wednesday', 'December', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20191205, '2019-12-05', 2019, 12, 5, 4, 49, 'Thursday', 'December', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20191206, '2019-12-06', 2019, 12, 6, 4, 49, 'Friday', 'December', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20191207, '2019-12-07', 2019, 12, 7, 4, 49, 'Saturday', 'December', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20191208, '2019-12-08', 2019, 12, 8, 4, 49, 'Sunday', 'December', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20191209, '2019-12-09', 2019, 12, 9, 4, 50, 'Monday', 'December', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20191210, '2019-12-10', 2019, 12, 10, 4, 50, 'Tuesday', 'December', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20191211, '2019-12-11', 2019, 12, 11, 4, 50, 'Wednesday', 'December', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20191212, '2019-12-12', 2019, 12, 12, 4, 50, 'Thursday', 'December', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20191213, '2019-12-13', 2019, 12, 13, 4, 50, 'Friday', 'December', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20191214, '2019-12-14', 2019, 12, 14, 4, 50, 'Saturday', 'December', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20191215, '2019-12-15', 2019, 12, 15, 4, 50, 'Sunday', 'December', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20191216, '2019-12-16', 2019, 12, 16, 4, 51, 'Monday', 'December', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20191217, '2019-12-17', 2019, 12, 17, 4, 51, 'Tuesday', 'December', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20191218, '2019-12-18', 2019, 12, 18, 4, 51, 'Wednesday', 'December', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20191219, '2019-12-19', 2019, 12, 19, 4, 51, 'Thursday', 'December', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20191220, '2019-12-20', 2019, 12, 20, 4, 51, 'Friday', 'December', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20191221, '2019-12-21', 2019, 12, 21, 4, 51, 'Saturday', 'December', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20191222, '2019-12-22', 2019, 12, 22, 4, 51, 'Sunday', 'December', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20191223, '2019-12-23', 2019, 12, 23, 4, 52, 'Monday', 'December', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20191224, '2019-12-24', 2019, 12, 24, 4, 52, 'Tuesday', 'December', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20191225, '2019-12-25', 2019, 12, 25, 4, 52, 'Wednesday', 'December', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20191226, '2019-12-26', 2019, 12, 26, 4, 52, 'Thursday', 'December', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20191227, '2019-12-27', 2019, 12, 27, 4, 52, 'Friday', 'December', 'f', 'work', NULL);
INSERT INTO `calendar` VALUES (20191228, '2019-12-28', 2019, 12, 28, 4, 52, 'Saturday', 'December', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20191229, '2019-12-29', 2019, 12, 29, 4, 52, 'Sunday', 'December', 'f', 'rest', NULL);
INSERT INTO `calendar` VALUES (20191230, '2019-12-30', 2019, 12, 30, 4, 1, 'Monday', 'December', 'f', 'work', NULL);

-- ----------------------------
-- Table structure for projects
-- ----------------------------
DROP TABLE IF EXISTS `projects`;
CREATE TABLE `projects`  (
  `Project_Id` bigint(20) NOT NULL,
  `Project_Name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`Project_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of projects
-- ----------------------------
INSERT INTO `projects` VALUES (1, 'First_Project');
INSERT INTO `projects` VALUES (2, 'Second_Project');
INSERT INTO `projects` VALUES (3, 'Third_Project');
INSERT INTO `projects` VALUES (4, 'Fourth_Project');

-- ----------------------------
-- Table structure for time_dimension
-- ----------------------------
DROP TABLE IF EXISTS `time_dimension`;
CREATE TABLE `time_dimension`  (
  `id` int(11) NOT NULL,
  `db_date` date NOT NULL,
  `year` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `day` int(11) NOT NULL,
  `quarter` int(11) NOT NULL,
  `week` int(11) NOT NULL,
  `day_name` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `month_name` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `holiday_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'f',
  `weekend_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'f',
  `event` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `td_ymd_idx`(`year`, `month`, `day`) USING BTREE,
  UNIQUE INDEX `td_dbdate_idx`(`db_date`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of time_dimension
-- ----------------------------
INSERT INTO `time_dimension` VALUES (20190101, '2019-01-01', 2019, 1, 1, 1, 1, 'Tuesday', 'January', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190102, '2019-01-02', 2019, 1, 2, 1, 1, 'Wednesday', 'January', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190103, '2019-01-03', 2019, 1, 3, 1, 1, 'Thursday', 'January', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190104, '2019-01-04', 2019, 1, 4, 1, 1, 'Friday', 'January', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190105, '2019-01-05', 2019, 1, 5, 1, 1, 'Saturday', 'January', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190106, '2019-01-06', 2019, 1, 6, 1, 1, 'Sunday', 'January', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190107, '2019-01-07', 2019, 1, 7, 1, 2, 'Monday', 'January', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190108, '2019-01-08', 2019, 1, 8, 1, 2, 'Tuesday', 'January', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190109, '2019-01-09', 2019, 1, 9, 1, 2, 'Wednesday', 'January', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190110, '2019-01-10', 2019, 1, 10, 1, 2, 'Thursday', 'January', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190111, '2019-01-11', 2019, 1, 11, 1, 2, 'Friday', 'January', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190112, '2019-01-12', 2019, 1, 12, 1, 2, 'Saturday', 'January', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190113, '2019-01-13', 2019, 1, 13, 1, 2, 'Sunday', 'January', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190114, '2019-01-14', 2019, 1, 14, 1, 3, 'Monday', 'January', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190115, '2019-01-15', 2019, 1, 15, 1, 3, 'Tuesday', 'January', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190116, '2019-01-16', 2019, 1, 16, 1, 3, 'Wednesday', 'January', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190117, '2019-01-17', 2019, 1, 17, 1, 3, 'Thursday', 'January', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190118, '2019-01-18', 2019, 1, 18, 1, 3, 'Friday', 'January', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190119, '2019-01-19', 2019, 1, 19, 1, 3, 'Saturday', 'January', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190120, '2019-01-20', 2019, 1, 20, 1, 3, 'Sunday', 'January', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190121, '2019-01-21', 2019, 1, 21, 1, 4, 'Monday', 'January', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190122, '2019-01-22', 2019, 1, 22, 1, 4, 'Tuesday', 'January', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190123, '2019-01-23', 2019, 1, 23, 1, 4, 'Wednesday', 'January', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190124, '2019-01-24', 2019, 1, 24, 1, 4, 'Thursday', 'January', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190125, '2019-01-25', 2019, 1, 25, 1, 4, 'Friday', 'January', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190126, '2019-01-26', 2019, 1, 26, 1, 4, 'Saturday', 'January', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190127, '2019-01-27', 2019, 1, 27, 1, 4, 'Sunday', 'January', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190128, '2019-01-28', 2019, 1, 28, 1, 5, 'Monday', 'January', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190129, '2019-01-29', 2019, 1, 29, 1, 5, 'Tuesday', 'January', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190130, '2019-01-30', 2019, 1, 30, 1, 5, 'Wednesday', 'January', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190131, '2019-01-31', 2019, 1, 31, 1, 5, 'Thursday', 'January', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190201, '2019-02-01', 2019, 2, 1, 1, 5, 'Friday', 'February', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190202, '2019-02-02', 2019, 2, 2, 1, 5, 'Saturday', 'February', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190203, '2019-02-03', 2019, 2, 3, 1, 5, 'Sunday', 'February', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190204, '2019-02-04', 2019, 2, 4, 1, 6, 'Monday', 'February', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190205, '2019-02-05', 2019, 2, 5, 1, 6, 'Tuesday', 'February', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190206, '2019-02-06', 2019, 2, 6, 1, 6, 'Wednesday', 'February', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190207, '2019-02-07', 2019, 2, 7, 1, 6, 'Thursday', 'February', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190208, '2019-02-08', 2019, 2, 8, 1, 6, 'Friday', 'February', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190209, '2019-02-09', 2019, 2, 9, 1, 6, 'Saturday', 'February', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190210, '2019-02-10', 2019, 2, 10, 1, 6, 'Sunday', 'February', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190211, '2019-02-11', 2019, 2, 11, 1, 7, 'Monday', 'February', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190212, '2019-02-12', 2019, 2, 12, 1, 7, 'Tuesday', 'February', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190213, '2019-02-13', 2019, 2, 13, 1, 7, 'Wednesday', 'February', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190214, '2019-02-14', 2019, 2, 14, 1, 7, 'Thursday', 'February', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190215, '2019-02-15', 2019, 2, 15, 1, 7, 'Friday', 'February', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190216, '2019-02-16', 2019, 2, 16, 1, 7, 'Saturday', 'February', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190217, '2019-02-17', 2019, 2, 17, 1, 7, 'Sunday', 'February', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190218, '2019-02-18', 2019, 2, 18, 1, 8, 'Monday', 'February', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190219, '2019-02-19', 2019, 2, 19, 1, 8, 'Tuesday', 'February', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190220, '2019-02-20', 2019, 2, 20, 1, 8, 'Wednesday', 'February', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190221, '2019-02-21', 2019, 2, 21, 1, 8, 'Thursday', 'February', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190222, '2019-02-22', 2019, 2, 22, 1, 8, 'Friday', 'February', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190223, '2019-02-23', 2019, 2, 23, 1, 8, 'Saturday', 'February', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190224, '2019-02-24', 2019, 2, 24, 1, 8, 'Sunday', 'February', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190225, '2019-02-25', 2019, 2, 25, 1, 9, 'Monday', 'February', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190226, '2019-02-26', 2019, 2, 26, 1, 9, 'Tuesday', 'February', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190227, '2019-02-27', 2019, 2, 27, 1, 9, 'Wednesday', 'February', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190228, '2019-02-28', 2019, 2, 28, 1, 9, 'Thursday', 'February', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190301, '2019-03-01', 2019, 3, 1, 1, 9, 'Friday', 'March', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190302, '2019-03-02', 2019, 3, 2, 1, 9, 'Saturday', 'March', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190303, '2019-03-03', 2019, 3, 3, 1, 9, 'Sunday', 'March', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190304, '2019-03-04', 2019, 3, 4, 1, 10, 'Monday', 'March', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190305, '2019-03-05', 2019, 3, 5, 1, 10, 'Tuesday', 'March', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190306, '2019-03-06', 2019, 3, 6, 1, 10, 'Wednesday', 'March', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190307, '2019-03-07', 2019, 3, 7, 1, 10, 'Thursday', 'March', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190308, '2019-03-08', 2019, 3, 8, 1, 10, 'Friday', 'March', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190309, '2019-03-09', 2019, 3, 9, 1, 10, 'Saturday', 'March', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190310, '2019-03-10', 2019, 3, 10, 1, 10, 'Sunday', 'March', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190311, '2019-03-11', 2019, 3, 11, 1, 11, 'Monday', 'March', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190312, '2019-03-12', 2019, 3, 12, 1, 11, 'Tuesday', 'March', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190313, '2019-03-13', 2019, 3, 13, 1, 11, 'Wednesday', 'March', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190314, '2019-03-14', 2019, 3, 14, 1, 11, 'Thursday', 'March', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190315, '2019-03-15', 2019, 3, 15, 1, 11, 'Friday', 'March', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190316, '2019-03-16', 2019, 3, 16, 1, 11, 'Saturday', 'March', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190317, '2019-03-17', 2019, 3, 17, 1, 11, 'Sunday', 'March', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190318, '2019-03-18', 2019, 3, 18, 1, 12, 'Monday', 'March', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190319, '2019-03-19', 2019, 3, 19, 1, 12, 'Tuesday', 'March', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190320, '2019-03-20', 2019, 3, 20, 1, 12, 'Wednesday', 'March', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190321, '2019-03-21', 2019, 3, 21, 1, 12, 'Thursday', 'March', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190322, '2019-03-22', 2019, 3, 22, 1, 12, 'Friday', 'March', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190323, '2019-03-23', 2019, 3, 23, 1, 12, 'Saturday', 'March', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190324, '2019-03-24', 2019, 3, 24, 1, 12, 'Sunday', 'March', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190325, '2019-03-25', 2019, 3, 25, 1, 13, 'Monday', 'March', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190326, '2019-03-26', 2019, 3, 26, 1, 13, 'Tuesday', 'March', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190327, '2019-03-27', 2019, 3, 27, 1, 13, 'Wednesday', 'March', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190328, '2019-03-28', 2019, 3, 28, 1, 13, 'Thursday', 'March', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190329, '2019-03-29', 2019, 3, 29, 1, 13, 'Friday', 'March', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190330, '2019-03-30', 2019, 3, 30, 1, 13, 'Saturday', 'March', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190331, '2019-03-31', 2019, 3, 31, 1, 13, 'Sunday', 'March', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190401, '2019-04-01', 2019, 4, 1, 2, 14, 'Monday', 'April', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190402, '2019-04-02', 2019, 4, 2, 2, 14, 'Tuesday', 'April', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190403, '2019-04-03', 2019, 4, 3, 2, 14, 'Wednesday', 'April', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190404, '2019-04-04', 2019, 4, 4, 2, 14, 'Thursday', 'April', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190405, '2019-04-05', 2019, 4, 5, 2, 14, 'Friday', 'April', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190406, '2019-04-06', 2019, 4, 6, 2, 14, 'Saturday', 'April', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190407, '2019-04-07', 2019, 4, 7, 2, 14, 'Sunday', 'April', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190408, '2019-04-08', 2019, 4, 8, 2, 15, 'Monday', 'April', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190409, '2019-04-09', 2019, 4, 9, 2, 15, 'Tuesday', 'April', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190410, '2019-04-10', 2019, 4, 10, 2, 15, 'Wednesday', 'April', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190411, '2019-04-11', 2019, 4, 11, 2, 15, 'Thursday', 'April', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190412, '2019-04-12', 2019, 4, 12, 2, 15, 'Friday', 'April', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190413, '2019-04-13', 2019, 4, 13, 2, 15, 'Saturday', 'April', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190414, '2019-04-14', 2019, 4, 14, 2, 15, 'Sunday', 'April', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190415, '2019-04-15', 2019, 4, 15, 2, 16, 'Monday', 'April', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190416, '2019-04-16', 2019, 4, 16, 2, 16, 'Tuesday', 'April', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190417, '2019-04-17', 2019, 4, 17, 2, 16, 'Wednesday', 'April', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190418, '2019-04-18', 2019, 4, 18, 2, 16, 'Thursday', 'April', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190419, '2019-04-19', 2019, 4, 19, 2, 16, 'Friday', 'April', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190420, '2019-04-20', 2019, 4, 20, 2, 16, 'Saturday', 'April', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190421, '2019-04-21', 2019, 4, 21, 2, 16, 'Sunday', 'April', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190422, '2019-04-22', 2019, 4, 22, 2, 17, 'Monday', 'April', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190423, '2019-04-23', 2019, 4, 23, 2, 17, 'Tuesday', 'April', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190424, '2019-04-24', 2019, 4, 24, 2, 17, 'Wednesday', 'April', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190425, '2019-04-25', 2019, 4, 25, 2, 17, 'Thursday', 'April', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190426, '2019-04-26', 2019, 4, 26, 2, 17, 'Friday', 'April', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190427, '2019-04-27', 2019, 4, 27, 2, 17, 'Saturday', 'April', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190428, '2019-04-28', 2019, 4, 28, 2, 17, 'Sunday', 'April', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190429, '2019-04-29', 2019, 4, 29, 2, 18, 'Monday', 'April', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190430, '2019-04-30', 2019, 4, 30, 2, 18, 'Tuesday', 'April', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190501, '2019-05-01', 2019, 5, 1, 2, 18, 'Wednesday', 'May', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190502, '2019-05-02', 2019, 5, 2, 2, 18, 'Thursday', 'May', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190503, '2019-05-03', 2019, 5, 3, 2, 18, 'Friday', 'May', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190504, '2019-05-04', 2019, 5, 4, 2, 18, 'Saturday', 'May', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190505, '2019-05-05', 2019, 5, 5, 2, 18, 'Sunday', 'May', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190506, '2019-05-06', 2019, 5, 6, 2, 19, 'Monday', 'May', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190507, '2019-05-07', 2019, 5, 7, 2, 19, 'Tuesday', 'May', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190508, '2019-05-08', 2019, 5, 8, 2, 19, 'Wednesday', 'May', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190509, '2019-05-09', 2019, 5, 9, 2, 19, 'Thursday', 'May', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190510, '2019-05-10', 2019, 5, 10, 2, 19, 'Friday', 'May', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190511, '2019-05-11', 2019, 5, 11, 2, 19, 'Saturday', 'May', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190512, '2019-05-12', 2019, 5, 12, 2, 19, 'Sunday', 'May', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190513, '2019-05-13', 2019, 5, 13, 2, 20, 'Monday', 'May', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190514, '2019-05-14', 2019, 5, 14, 2, 20, 'Tuesday', 'May', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190515, '2019-05-15', 2019, 5, 15, 2, 20, 'Wednesday', 'May', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190516, '2019-05-16', 2019, 5, 16, 2, 20, 'Thursday', 'May', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190517, '2019-05-17', 2019, 5, 17, 2, 20, 'Friday', 'May', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190518, '2019-05-18', 2019, 5, 18, 2, 20, 'Saturday', 'May', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190519, '2019-05-19', 2019, 5, 19, 2, 20, 'Sunday', 'May', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190520, '2019-05-20', 2019, 5, 20, 2, 21, 'Monday', 'May', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190521, '2019-05-21', 2019, 5, 21, 2, 21, 'Tuesday', 'May', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190522, '2019-05-22', 2019, 5, 22, 2, 21, 'Wednesday', 'May', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190523, '2019-05-23', 2019, 5, 23, 2, 21, 'Thursday', 'May', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190524, '2019-05-24', 2019, 5, 24, 2, 21, 'Friday', 'May', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190525, '2019-05-25', 2019, 5, 25, 2, 21, 'Saturday', 'May', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190526, '2019-05-26', 2019, 5, 26, 2, 21, 'Sunday', 'May', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190527, '2019-05-27', 2019, 5, 27, 2, 22, 'Monday', 'May', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190528, '2019-05-28', 2019, 5, 28, 2, 22, 'Tuesday', 'May', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190529, '2019-05-29', 2019, 5, 29, 2, 22, 'Wednesday', 'May', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190530, '2019-05-30', 2019, 5, 30, 2, 22, 'Thursday', 'May', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190531, '2019-05-31', 2019, 5, 31, 2, 22, 'Friday', 'May', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190601, '2019-06-01', 2019, 6, 1, 2, 22, 'Saturday', 'June', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190602, '2019-06-02', 2019, 6, 2, 2, 22, 'Sunday', 'June', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190603, '2019-06-03', 2019, 6, 3, 2, 23, 'Monday', 'June', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190604, '2019-06-04', 2019, 6, 4, 2, 23, 'Tuesday', 'June', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190605, '2019-06-05', 2019, 6, 5, 2, 23, 'Wednesday', 'June', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190606, '2019-06-06', 2019, 6, 6, 2, 23, 'Thursday', 'June', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190607, '2019-06-07', 2019, 6, 7, 2, 23, 'Friday', 'June', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190608, '2019-06-08', 2019, 6, 8, 2, 23, 'Saturday', 'June', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190609, '2019-06-09', 2019, 6, 9, 2, 23, 'Sunday', 'June', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190610, '2019-06-10', 2019, 6, 10, 2, 24, 'Monday', 'June', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190611, '2019-06-11', 2019, 6, 11, 2, 24, 'Tuesday', 'June', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190612, '2019-06-12', 2019, 6, 12, 2, 24, 'Wednesday', 'June', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190613, '2019-06-13', 2019, 6, 13, 2, 24, 'Thursday', 'June', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190614, '2019-06-14', 2019, 6, 14, 2, 24, 'Friday', 'June', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190615, '2019-06-15', 2019, 6, 15, 2, 24, 'Saturday', 'June', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190616, '2019-06-16', 2019, 6, 16, 2, 24, 'Sunday', 'June', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190617, '2019-06-17', 2019, 6, 17, 2, 25, 'Monday', 'June', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190618, '2019-06-18', 2019, 6, 18, 2, 25, 'Tuesday', 'June', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190619, '2019-06-19', 2019, 6, 19, 2, 25, 'Wednesday', 'June', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190620, '2019-06-20', 2019, 6, 20, 2, 25, 'Thursday', 'June', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190621, '2019-06-21', 2019, 6, 21, 2, 25, 'Friday', 'June', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190622, '2019-06-22', 2019, 6, 22, 2, 25, 'Saturday', 'June', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190623, '2019-06-23', 2019, 6, 23, 2, 25, 'Sunday', 'June', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190624, '2019-06-24', 2019, 6, 24, 2, 26, 'Monday', 'June', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190625, '2019-06-25', 2019, 6, 25, 2, 26, 'Tuesday', 'June', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190626, '2019-06-26', 2019, 6, 26, 2, 26, 'Wednesday', 'June', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190627, '2019-06-27', 2019, 6, 27, 2, 26, 'Thursday', 'June', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190628, '2019-06-28', 2019, 6, 28, 2, 26, 'Friday', 'June', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190629, '2019-06-29', 2019, 6, 29, 2, 26, 'Saturday', 'June', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190630, '2019-06-30', 2019, 6, 30, 2, 26, 'Sunday', 'June', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190701, '2019-07-01', 2019, 7, 1, 3, 27, 'Monday', 'July', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190702, '2019-07-02', 2019, 7, 2, 3, 27, 'Tuesday', 'July', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190703, '2019-07-03', 2019, 7, 3, 3, 27, 'Wednesday', 'July', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190704, '2019-07-04', 2019, 7, 4, 3, 27, 'Thursday', 'July', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190705, '2019-07-05', 2019, 7, 5, 3, 27, 'Friday', 'July', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190706, '2019-07-06', 2019, 7, 6, 3, 27, 'Saturday', 'July', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190707, '2019-07-07', 2019, 7, 7, 3, 27, 'Sunday', 'July', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190708, '2019-07-08', 2019, 7, 8, 3, 28, 'Monday', 'July', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190709, '2019-07-09', 2019, 7, 9, 3, 28, 'Tuesday', 'July', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190710, '2019-07-10', 2019, 7, 10, 3, 28, 'Wednesday', 'July', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190711, '2019-07-11', 2019, 7, 11, 3, 28, 'Thursday', 'July', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190712, '2019-07-12', 2019, 7, 12, 3, 28, 'Friday', 'July', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190713, '2019-07-13', 2019, 7, 13, 3, 28, 'Saturday', 'July', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190714, '2019-07-14', 2019, 7, 14, 3, 28, 'Sunday', 'July', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190715, '2019-07-15', 2019, 7, 15, 3, 29, 'Monday', 'July', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190716, '2019-07-16', 2019, 7, 16, 3, 29, 'Tuesday', 'July', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190717, '2019-07-17', 2019, 7, 17, 3, 29, 'Wednesday', 'July', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190718, '2019-07-18', 2019, 7, 18, 3, 29, 'Thursday', 'July', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190719, '2019-07-19', 2019, 7, 19, 3, 29, 'Friday', 'July', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190720, '2019-07-20', 2019, 7, 20, 3, 29, 'Saturday', 'July', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190721, '2019-07-21', 2019, 7, 21, 3, 29, 'Sunday', 'July', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190722, '2019-07-22', 2019, 7, 22, 3, 30, 'Monday', 'July', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190723, '2019-07-23', 2019, 7, 23, 3, 30, 'Tuesday', 'July', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190724, '2019-07-24', 2019, 7, 24, 3, 30, 'Wednesday', 'July', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190725, '2019-07-25', 2019, 7, 25, 3, 30, 'Thursday', 'July', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190726, '2019-07-26', 2019, 7, 26, 3, 30, 'Friday', 'July', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190727, '2019-07-27', 2019, 7, 27, 3, 30, 'Saturday', 'July', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190728, '2019-07-28', 2019, 7, 28, 3, 30, 'Sunday', 'July', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190729, '2019-07-29', 2019, 7, 29, 3, 31, 'Monday', 'July', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190730, '2019-07-30', 2019, 7, 30, 3, 31, 'Tuesday', 'July', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190731, '2019-07-31', 2019, 7, 31, 3, 31, 'Wednesday', 'July', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190801, '2019-08-01', 2019, 8, 1, 3, 31, 'Thursday', 'August', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190802, '2019-08-02', 2019, 8, 2, 3, 31, 'Friday', 'August', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190803, '2019-08-03', 2019, 8, 3, 3, 31, 'Saturday', 'August', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190804, '2019-08-04', 2019, 8, 4, 3, 31, 'Sunday', 'August', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190805, '2019-08-05', 2019, 8, 5, 3, 32, 'Monday', 'August', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190806, '2019-08-06', 2019, 8, 6, 3, 32, 'Tuesday', 'August', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190807, '2019-08-07', 2019, 8, 7, 3, 32, 'Wednesday', 'August', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190808, '2019-08-08', 2019, 8, 8, 3, 32, 'Thursday', 'August', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190809, '2019-08-09', 2019, 8, 9, 3, 32, 'Friday', 'August', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190810, '2019-08-10', 2019, 8, 10, 3, 32, 'Saturday', 'August', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190811, '2019-08-11', 2019, 8, 11, 3, 32, 'Sunday', 'August', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190812, '2019-08-12', 2019, 8, 12, 3, 33, 'Monday', 'August', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190813, '2019-08-13', 2019, 8, 13, 3, 33, 'Tuesday', 'August', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190814, '2019-08-14', 2019, 8, 14, 3, 33, 'Wednesday', 'August', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190815, '2019-08-15', 2019, 8, 15, 3, 33, 'Thursday', 'August', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190816, '2019-08-16', 2019, 8, 16, 3, 33, 'Friday', 'August', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190817, '2019-08-17', 2019, 8, 17, 3, 33, 'Saturday', 'August', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190818, '2019-08-18', 2019, 8, 18, 3, 33, 'Sunday', 'August', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190819, '2019-08-19', 2019, 8, 19, 3, 34, 'Monday', 'August', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190820, '2019-08-20', 2019, 8, 20, 3, 34, 'Tuesday', 'August', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190821, '2019-08-21', 2019, 8, 21, 3, 34, 'Wednesday', 'August', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190822, '2019-08-22', 2019, 8, 22, 3, 34, 'Thursday', 'August', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190823, '2019-08-23', 2019, 8, 23, 3, 34, 'Friday', 'August', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190824, '2019-08-24', 2019, 8, 24, 3, 34, 'Saturday', 'August', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190825, '2019-08-25', 2019, 8, 25, 3, 34, 'Sunday', 'August', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190826, '2019-08-26', 2019, 8, 26, 3, 35, 'Monday', 'August', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190827, '2019-08-27', 2019, 8, 27, 3, 35, 'Tuesday', 'August', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190828, '2019-08-28', 2019, 8, 28, 3, 35, 'Wednesday', 'August', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190829, '2019-08-29', 2019, 8, 29, 3, 35, 'Thursday', 'August', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190830, '2019-08-30', 2019, 8, 30, 3, 35, 'Friday', 'August', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190831, '2019-08-31', 2019, 8, 31, 3, 35, 'Saturday', 'August', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190901, '2019-09-01', 2019, 9, 1, 3, 35, 'Sunday', 'September', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190902, '2019-09-02', 2019, 9, 2, 3, 36, 'Monday', 'September', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190903, '2019-09-03', 2019, 9, 3, 3, 36, 'Tuesday', 'September', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190904, '2019-09-04', 2019, 9, 4, 3, 36, 'Wednesday', 'September', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190905, '2019-09-05', 2019, 9, 5, 3, 36, 'Thursday', 'September', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190906, '2019-09-06', 2019, 9, 6, 3, 36, 'Friday', 'September', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190907, '2019-09-07', 2019, 9, 7, 3, 36, 'Saturday', 'September', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190908, '2019-09-08', 2019, 9, 8, 3, 36, 'Sunday', 'September', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190909, '2019-09-09', 2019, 9, 9, 3, 37, 'Monday', 'September', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190910, '2019-09-10', 2019, 9, 10, 3, 37, 'Tuesday', 'September', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190911, '2019-09-11', 2019, 9, 11, 3, 37, 'Wednesday', 'September', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190912, '2019-09-12', 2019, 9, 12, 3, 37, 'Thursday', 'September', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190913, '2019-09-13', 2019, 9, 13, 3, 37, 'Friday', 'September', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190914, '2019-09-14', 2019, 9, 14, 3, 37, 'Saturday', 'September', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190915, '2019-09-15', 2019, 9, 15, 3, 37, 'Sunday', 'September', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190916, '2019-09-16', 2019, 9, 16, 3, 38, 'Monday', 'September', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190917, '2019-09-17', 2019, 9, 17, 3, 38, 'Tuesday', 'September', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190918, '2019-09-18', 2019, 9, 18, 3, 38, 'Wednesday', 'September', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190919, '2019-09-19', 2019, 9, 19, 3, 38, 'Thursday', 'September', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190920, '2019-09-20', 2019, 9, 20, 3, 38, 'Friday', 'September', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190921, '2019-09-21', 2019, 9, 21, 3, 38, 'Saturday', 'September', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190922, '2019-09-22', 2019, 9, 22, 3, 38, 'Sunday', 'September', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190923, '2019-09-23', 2019, 9, 23, 3, 39, 'Monday', 'September', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190924, '2019-09-24', 2019, 9, 24, 3, 39, 'Tuesday', 'September', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190925, '2019-09-25', 2019, 9, 25, 3, 39, 'Wednesday', 'September', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190926, '2019-09-26', 2019, 9, 26, 3, 39, 'Thursday', 'September', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190927, '2019-09-27', 2019, 9, 27, 3, 39, 'Friday', 'September', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20190928, '2019-09-28', 2019, 9, 28, 3, 39, 'Saturday', 'September', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190929, '2019-09-29', 2019, 9, 29, 3, 39, 'Sunday', 'September', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20190930, '2019-09-30', 2019, 9, 30, 3, 40, 'Monday', 'September', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20191001, '2019-10-01', 2019, 10, 1, 4, 40, 'Tuesday', 'October', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20191002, '2019-10-02', 2019, 10, 2, 4, 40, 'Wednesday', 'October', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20191003, '2019-10-03', 2019, 10, 3, 4, 40, 'Thursday', 'October', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20191004, '2019-10-04', 2019, 10, 4, 4, 40, 'Friday', 'October', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20191005, '2019-10-05', 2019, 10, 5, 4, 40, 'Saturday', 'October', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20191006, '2019-10-06', 2019, 10, 6, 4, 40, 'Sunday', 'October', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20191007, '2019-10-07', 2019, 10, 7, 4, 41, 'Monday', 'October', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20191008, '2019-10-08', 2019, 10, 8, 4, 41, 'Tuesday', 'October', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20191009, '2019-10-09', 2019, 10, 9, 4, 41, 'Wednesday', 'October', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20191010, '2019-10-10', 2019, 10, 10, 4, 41, 'Thursday', 'October', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20191011, '2019-10-11', 2019, 10, 11, 4, 41, 'Friday', 'October', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20191012, '2019-10-12', 2019, 10, 12, 4, 41, 'Saturday', 'October', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20191013, '2019-10-13', 2019, 10, 13, 4, 41, 'Sunday', 'October', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20191014, '2019-10-14', 2019, 10, 14, 4, 42, 'Monday', 'October', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20191015, '2019-10-15', 2019, 10, 15, 4, 42, 'Tuesday', 'October', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20191016, '2019-10-16', 2019, 10, 16, 4, 42, 'Wednesday', 'October', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20191017, '2019-10-17', 2019, 10, 17, 4, 42, 'Thursday', 'October', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20191018, '2019-10-18', 2019, 10, 18, 4, 42, 'Friday', 'October', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20191019, '2019-10-19', 2019, 10, 19, 4, 42, 'Saturday', 'October', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20191020, '2019-10-20', 2019, 10, 20, 4, 42, 'Sunday', 'October', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20191021, '2019-10-21', 2019, 10, 21, 4, 43, 'Monday', 'October', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20191022, '2019-10-22', 2019, 10, 22, 4, 43, 'Tuesday', 'October', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20191023, '2019-10-23', 2019, 10, 23, 4, 43, 'Wednesday', 'October', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20191024, '2019-10-24', 2019, 10, 24, 4, 43, 'Thursday', 'October', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20191025, '2019-10-25', 2019, 10, 25, 4, 43, 'Friday', 'October', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20191026, '2019-10-26', 2019, 10, 26, 4, 43, 'Saturday', 'October', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20191027, '2019-10-27', 2019, 10, 27, 4, 43, 'Sunday', 'October', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20191028, '2019-10-28', 2019, 10, 28, 4, 44, 'Monday', 'October', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20191029, '2019-10-29', 2019, 10, 29, 4, 44, 'Tuesday', 'October', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20191030, '2019-10-30', 2019, 10, 30, 4, 44, 'Wednesday', 'October', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20191031, '2019-10-31', 2019, 10, 31, 4, 44, 'Thursday', 'October', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20191101, '2019-11-01', 2019, 11, 1, 4, 44, 'Friday', 'November', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20191102, '2019-11-02', 2019, 11, 2, 4, 44, 'Saturday', 'November', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20191103, '2019-11-03', 2019, 11, 3, 4, 44, 'Sunday', 'November', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20191104, '2019-11-04', 2019, 11, 4, 4, 45, 'Monday', 'November', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20191105, '2019-11-05', 2019, 11, 5, 4, 45, 'Tuesday', 'November', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20191106, '2019-11-06', 2019, 11, 6, 4, 45, 'Wednesday', 'November', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20191107, '2019-11-07', 2019, 11, 7, 4, 45, 'Thursday', 'November', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20191108, '2019-11-08', 2019, 11, 8, 4, 45, 'Friday', 'November', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20191109, '2019-11-09', 2019, 11, 9, 4, 45, 'Saturday', 'November', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20191110, '2019-11-10', 2019, 11, 10, 4, 45, 'Sunday', 'November', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20191111, '2019-11-11', 2019, 11, 11, 4, 46, 'Monday', 'November', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20191112, '2019-11-12', 2019, 11, 12, 4, 46, 'Tuesday', 'November', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20191113, '2019-11-13', 2019, 11, 13, 4, 46, 'Wednesday', 'November', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20191114, '2019-11-14', 2019, 11, 14, 4, 46, 'Thursday', 'November', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20191115, '2019-11-15', 2019, 11, 15, 4, 46, 'Friday', 'November', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20191116, '2019-11-16', 2019, 11, 16, 4, 46, 'Saturday', 'November', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20191117, '2019-11-17', 2019, 11, 17, 4, 46, 'Sunday', 'November', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20191118, '2019-11-18', 2019, 11, 18, 4, 47, 'Monday', 'November', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20191119, '2019-11-19', 2019, 11, 19, 4, 47, 'Tuesday', 'November', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20191120, '2019-11-20', 2019, 11, 20, 4, 47, 'Wednesday', 'November', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20191121, '2019-11-21', 2019, 11, 21, 4, 47, 'Thursday', 'November', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20191122, '2019-11-22', 2019, 11, 22, 4, 47, 'Friday', 'November', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20191123, '2019-11-23', 2019, 11, 23, 4, 47, 'Saturday', 'November', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20191124, '2019-11-24', 2019, 11, 24, 4, 47, 'Sunday', 'November', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20191125, '2019-11-25', 2019, 11, 25, 4, 48, 'Monday', 'November', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20191126, '2019-11-26', 2019, 11, 26, 4, 48, 'Tuesday', 'November', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20191127, '2019-11-27', 2019, 11, 27, 4, 48, 'Wednesday', 'November', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20191128, '2019-11-28', 2019, 11, 28, 4, 48, 'Thursday', 'November', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20191129, '2019-11-29', 2019, 11, 29, 4, 48, 'Friday', 'November', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20191130, '2019-11-30', 2019, 11, 30, 4, 48, 'Saturday', 'November', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20191201, '2019-12-01', 2019, 12, 1, 4, 48, 'Sunday', 'December', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20191202, '2019-12-02', 2019, 12, 2, 4, 49, 'Monday', 'December', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20191203, '2019-12-03', 2019, 12, 3, 4, 49, 'Tuesday', 'December', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20191204, '2019-12-04', 2019, 12, 4, 4, 49, 'Wednesday', 'December', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20191205, '2019-12-05', 2019, 12, 5, 4, 49, 'Thursday', 'December', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20191206, '2019-12-06', 2019, 12, 6, 4, 49, 'Friday', 'December', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20191207, '2019-12-07', 2019, 12, 7, 4, 49, 'Saturday', 'December', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20191208, '2019-12-08', 2019, 12, 8, 4, 49, 'Sunday', 'December', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20191209, '2019-12-09', 2019, 12, 9, 4, 50, 'Monday', 'December', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20191210, '2019-12-10', 2019, 12, 10, 4, 50, 'Tuesday', 'December', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20191211, '2019-12-11', 2019, 12, 11, 4, 50, 'Wednesday', 'December', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20191212, '2019-12-12', 2019, 12, 12, 4, 50, 'Thursday', 'December', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20191213, '2019-12-13', 2019, 12, 13, 4, 50, 'Friday', 'December', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20191214, '2019-12-14', 2019, 12, 14, 4, 50, 'Saturday', 'December', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20191215, '2019-12-15', 2019, 12, 15, 4, 50, 'Sunday', 'December', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20191216, '2019-12-16', 2019, 12, 16, 4, 51, 'Monday', 'December', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20191217, '2019-12-17', 2019, 12, 17, 4, 51, 'Tuesday', 'December', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20191218, '2019-12-18', 2019, 12, 18, 4, 51, 'Wednesday', 'December', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20191219, '2019-12-19', 2019, 12, 19, 4, 51, 'Thursday', 'December', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20191220, '2019-12-20', 2019, 12, 20, 4, 51, 'Friday', 'December', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20191221, '2019-12-21', 2019, 12, 21, 4, 51, 'Saturday', 'December', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20191222, '2019-12-22', 2019, 12, 22, 4, 51, 'Sunday', 'December', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20191223, '2019-12-23', 2019, 12, 23, 4, 52, 'Monday', 'December', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20191224, '2019-12-24', 2019, 12, 24, 4, 52, 'Tuesday', 'December', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20191225, '2019-12-25', 2019, 12, 25, 4, 52, 'Wednesday', 'December', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20191226, '2019-12-26', 2019, 12, 26, 4, 52, 'Thursday', 'December', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20191227, '2019-12-27', 2019, 12, 27, 4, 52, 'Friday', 'December', 'f', 'f', NULL);
INSERT INTO `time_dimension` VALUES (20191228, '2019-12-28', 2019, 12, 28, 4, 52, 'Saturday', 'December', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20191229, '2019-12-29', 2019, 12, 29, 4, 52, 'Sunday', 'December', 'f', 't', NULL);
INSERT INTO `time_dimension` VALUES (20191230, '2019-12-30', 2019, 12, 30, 4, 1, 'Monday', 'December', 'f', 'f', NULL);

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_role_uk`(`user_id`, `role_id`) USING BTREE,
  INDEX `user_role_fk2`(`role_id`) USING BTREE,
  CONSTRAINT `user_role_fk1` FOREIGN KEY (`user_id`) REFERENCES `users` (`User_Id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_role_fk2` FOREIGN KEY (`role_id`) REFERENCES `app_role` (`Role_Id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (1, 1, 1);
INSERT INTO `user_role` VALUES (2, 2, 3);
INSERT INTO `user_role` VALUES (3, 3, 2);
INSERT INTO `user_role` VALUES (4, 4, 3);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `User_Id` bigint(20) NOT NULL,
  `User_Name` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Encrypted_Password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `enabled` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`User_Id`) USING BTREE,
  UNIQUE INDEX `user_unique`(`User_Name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Vlad', '$2a$10$PrI5Gk9L.tSZiW9FXhTS8O8Mz9E97k2FZbFvGFFaSsiTUIl.TCrFu', b'1');
INSERT INTO `users` VALUES (2, 'Worker', '$2a$10$PrI5Gk9L.tSZiW9FXhTS8O8Mz9E97k2FZbFvGFFaSsiTUIl.TCrFu', b'1');
INSERT INTO `users` VALUES (3, 'Manager', '$2a$10$PrI5Gk9L.tSZiW9FXhTS8O8Mz9E97k2FZbFvGFFaSsiTUIl.TCrFu', b'1');
INSERT INTO `users` VALUES (4, 'Petrovich', '$2a$10$l.5Ryu8nW7zrrm8L9cg5IO7Ec.3ifuRn7rvQ7C9ubzWwKCTg6gRCO', b'1');

-- ----------------------------
-- Table structure for workout
-- ----------------------------
DROP TABLE IF EXISTS `workout`;
CREATE TABLE `workout`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `User_Id` bigint(20) NOT NULL,
  `Project_Id` bigint(20) NOT NULL,
  `Project_Name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Spent_Hours` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `User_Id_FK1`(`User_Id`) USING BTREE,
  INDEX `Project_Id_FK2`(`Project_Id`) USING BTREE,
  CONSTRAINT `Project_Id_FK2` FOREIGN KEY (`Project_Id`) REFERENCES `projects` (`Project_Id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `User_Id_FK1` FOREIGN KEY (`User_Id`) REFERENCES `users` (`User_Id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of workout
-- ----------------------------
INSERT INTO `workout` VALUES (1, 2, 1, 'First_Project', 9);
INSERT INTO `workout` VALUES (2, 2, 3, 'Third_Project', 5);
INSERT INTO `workout` VALUES (3, 4, 1, 'First_Project', 8);

-- ----------------------------
-- Procedure structure for fill_calendar
-- ----------------------------
DROP PROCEDURE IF EXISTS `fill_calendar`;
delimiter ;;
CREATE PROCEDURE `fill_calendar`(IN startdate DATE,IN stopdate DATE)
BEGIN
    DECLARE currentdate DATE;
    SET currentdate = startdate;
    WHILE currentdate < stopdate DO
        INSERT INTO Calendar VALUES (
                        YEAR(currentdate)*10000+MONTH(currentdate)*100 + DAY(currentdate),
                        currentdate,
                        YEAR(currentdate),
                        MONTH(currentdate),
                        DAY(currentdate),
                        QUARTER(currentdate),
                        WEEKOFYEAR(currentdate),
                        DATE_FORMAT(currentdate,'%W'),
                        DATE_FORMAT(currentdate,'%M'),
                        'f',
                        CASE DAYOFWEEK(currentdate) WHEN 1 THEN 'rest' WHEN 7 then 'rest' ELSE 'work' END,
                        NULL);
        SET currentdate = ADDDATE(currentdate,INTERVAL 1 DAY);
    END WHILE;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for fill_date_dimension
-- ----------------------------
DROP PROCEDURE IF EXISTS `fill_date_dimension`;
delimiter ;;
CREATE PROCEDURE `fill_date_dimension`(IN startdate DATE,IN stopdate DATE)
BEGIN
    DECLARE currentdate DATE;
    SET currentdate = startdate;
    WHILE currentdate < stopdate DO
        INSERT INTO time_dimension VALUES (
                        YEAR(currentdate)*10000+MONTH(currentdate)*100 + DAY(currentdate),
                        currentdate,
                        YEAR(currentdate),
                        MONTH(currentdate),
                        DAY(currentdate),
                        QUARTER(currentdate),
                        WEEKOFYEAR(currentdate),
                        DATE_FORMAT(currentdate,'%W'),
                        DATE_FORMAT(currentdate,'%M'),
                        'f',
                        CASE DAYOFWEEK(currentdate) WHEN 1 THEN 't' WHEN 7 then 't' ELSE 'f' END,
                        NULL);
        SET currentdate = ADDDATE(currentdate,INTERVAL 1 DAY);
    END WHILE;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
