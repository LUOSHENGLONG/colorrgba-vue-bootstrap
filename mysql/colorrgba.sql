/*
Navicat MySQL Data Transfer

Source Server         : aaa
Source Server Version : 80011
Source Host           : localhost:3306
Source Database       : colorrgba

Target Server Type    : MYSQL
Target Server Version : 80011
File Encoding         : 65001

Date: 2019-04-06 08:52:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `colorcard`
-- ----------------------------
DROP TABLE IF EXISTS `colorcard`;
CREATE TABLE `colorcard` (
  `id` varchar(250) NOT NULL,
  `colorList` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `createTime` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `num` int(10) DEFAULT NULL,
  `click` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of colorcard
-- ----------------------------
INSERT INTO `colorcard` VALUES ('1', 'blue white purple green', '1546275661003', '1', '0');
INSERT INTO `colorcard` VALUES ('10', 'blue pink purple green', '1546275661005', '10', '0');
INSERT INTO `colorcard` VALUES ('11', 'blue pink purple green', '1546275661004', '11', '0');
INSERT INTO `colorcard` VALUES ('12', 'blue pink purple green', '1546275661003', '12', '0');
INSERT INTO `colorcard` VALUES ('13', 'blue pink purple green', '1546275661019', '13', '0');
INSERT INTO `colorcard` VALUES ('14', 'blue #eee purple green', '1546275662009', '14', '0');
INSERT INTO `colorcard` VALUES ('15', 'blue pink purple green', '1546275661002', '15', '0');
INSERT INTO `colorcard` VALUES ('16', 'blue pink purple green', '1546275661001', '16', '0');
INSERT INTO `colorcard` VALUES ('17', 'blue pink purple green', '1546275661000', '17', '0');
INSERT INTO `colorcard` VALUES ('18', 'blue pink #aaa green', '1546275661002', '15', '0');
INSERT INTO `colorcard` VALUES ('19', 'blue pink purple green', '1546275661001', '16', '0');
INSERT INTO `colorcard` VALUES ('2', 'blue pink purple green', '1546275661019', '2', '0');
INSERT INTO `colorcard` VALUES ('20', 'blue pink purple green', '1546275661000', '17', '0');
INSERT INTO `colorcard` VALUES ('3', 'blue pink purple #ccc', '1546275662009', '3', '0');
INSERT INTO `colorcard` VALUES ('4', 'blue pink purple green', '1546275661002', '4', '0');
INSERT INTO `colorcard` VALUES ('5', 'blue pink purple green', '1546275661001', '5', '0');
INSERT INTO `colorcard` VALUES ('6', 'blue pink purple green', '1546275661000', '6', '0');
INSERT INTO `colorcard` VALUES ('7', 'blue pink purple green', '1546275661008', '7', '0');
INSERT INTO `colorcard` VALUES ('8', 'blue pink purple green', '1546275667007', '8', '0');
INSERT INTO `colorcard` VALUES ('9', 'blue pink purple green', '1546275666006', '9', '0');

-- ----------------------------
-- Table structure for `gradient`
-- ----------------------------
DROP TABLE IF EXISTS `gradient`;
CREATE TABLE `gradient` (
  `id` varchar(200) NOT NULL,
  `rotate` int(4) DEFAULT NULL,
  `colorList` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `num` int(10) DEFAULT NULL,
  `createTime` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `click` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of gradient
-- ----------------------------
INSERT INTO `gradient` VALUES ('1', '1', 'blue 0 pink 100', '1', '1546275661000', '1');
INSERT INTO `gradient` VALUES ('10', '1', 'blue 0 pink 100', '11', '1546275661001', '1');
INSERT INTO `gradient` VALUES ('11', '1', 'blue 0 pink 100', '10', '1546275661002', '11');
INSERT INTO `gradient` VALUES ('12', '1', 'blue 0 pink 100', '1', '1546275662009', '1');
INSERT INTO `gradient` VALUES ('13', '1', 'blue 0 pink 100', '1', '1546275661019', '1');
INSERT INTO `gradient` VALUES ('14', '4', 'blue 0 red 60 purple 90 pink 100', '4', '1546275661005', '6');
INSERT INTO `gradient` VALUES ('15', '3', 'blue 0 pink 100', '3', '1546275661004', '3');
INSERT INTO `gradient` VALUES ('16', '111', 'blue 0 pink 100', '2', '1546275661003', '2');
INSERT INTO `gradient` VALUES ('17', '1', 'blue 0 pink 100', '1', '1546275661019', '1');
INSERT INTO `gradient` VALUES ('18', '1', 'blue 0 pink 100', '1', '1546275662009', '1');
INSERT INTO `gradient` VALUES ('19', '1', 'blue 0 pink 100', '10', '1546275661002', '11');
INSERT INTO `gradient` VALUES ('2', '111', 'blue 0 pink 100', '2', '1546275661003', '2');
INSERT INTO `gradient` VALUES ('20', '1', 'blue 0 pink 100', '11', '1546275661001', '1');
INSERT INTO `gradient` VALUES ('21', '1', 'blue 0 pink 100', '1', '1546275661000', '1');
INSERT INTO `gradient` VALUES ('22', '1', 'blue 0 pink 100', '1', '1546275661000', '1');
INSERT INTO `gradient` VALUES ('3', '3', 'blue 0 pink 100', '3', '1546275661004', '3');
INSERT INTO `gradient` VALUES ('4', '4', 'blue 0 red 60 purple 90 pink 100', '4', '1546275661005', '6');
INSERT INTO `gradient` VALUES ('5', '5', 'blue 0 pink 100', '5', '1546275666006', '4');
INSERT INTO `gradient` VALUES ('6', '6', 'blue 0 pink 100', '6', '1546275667007', '5');
INSERT INTO `gradient` VALUES ('7', '7', 'blue 0 pink 100', '7', '1546275661008', '24');
INSERT INTO `gradient` VALUES ('8', '8', 'blue 0 pink 100', '8', '1546275661009', '23');
INSERT INTO `gradient` VALUES ('9', '9', 'blue 0 pink 100', '9', '1546275661010', '12');
