/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50639
Source Host           : localhost:3306
Source Database       : 1711

Target Server Type    : MYSQL
Target Server Version : 50639
File Encoding         : 65001

Date: 2020-02-21 11:58:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_movie`
-- ----------------------------
DROP TABLE IF EXISTS `t_movie`;
CREATE TABLE `t_movie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `actor` varchar(30) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `uptime` date DEFAULT NULL,
  `longtime` int(11) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `years` int(11) DEFAULT NULL,
  `area` varchar(30) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_movie
-- ----------------------------
INSERT INTO `t_movie` VALUES ('1', '西红柿首富', '苏有朋', '30', '2020-02-04', '90', '喜酒', '2019', '大陆', '1');
INSERT INTO `t_movie` VALUES ('2', '猪猪侠', '张三', '50', '2020-02-05', '80', '动画', '2017', '大陆', '2');
INSERT INTO `t_movie` VALUES ('3', '钢铁侠', '李四', '60', '2020-02-10', '120', '动作', '2018', '美国', '3');
