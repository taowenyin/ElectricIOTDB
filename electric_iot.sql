-- MySQL Script generated by MySQL Workbench
-- 11/18/18 22:49:55
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema electric_iot
-- -----------------------------------------------------
-- 某电力系统的数据库设计
DROP SCHEMA IF EXISTS `electric_iot` ;

-- -----------------------------------------------------
-- Schema electric_iot
--
-- 某电力系统的数据库设计
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `electric_iot` DEFAULT CHARACTER SET utf8 ;
USE `electric_iot` ;

-- -----------------------------------------------------
-- Table `electric_iot`.`department`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `electric_iot`.`department` ;

CREATE TABLE IF NOT EXISTS `electric_iot`.`department` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL COMMENT '部门名称',
  `level` INT NOT NULL DEFAULT 0 COMMENT '部门等级',
  `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `is_delete` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '部门是否删除，0表示未删除，1表示删除',
  `parent_id` BIGINT NOT NULL DEFAULT 0 COMMENT '父级组织的ID',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB
COMMENT = '部门数据表';


-- -----------------------------------------------------
-- Table `electric_iot`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `electric_iot`.`user` ;

CREATE TABLE IF NOT EXISTS `electric_iot`.`user` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `login_name` VARCHAR(45) NOT NULL COMMENT '登录帐户',
  `login_password` VARCHAR(45) NOT NULL COMMENT '登录密码',
  `name` VARCHAR(45) NOT NULL COMMENT '用户名',
  `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '用户创建时间',
  `mobile` VARCHAR(45) NULL COMMENT '用户电话',
  `email` VARCHAR(45) NULL COMMENT '用户邮件',
  `is_delete` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '用户是否删除，0表示未删除，1表示删除',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `login_name_UNIQUE` (`login_name` ASC))
ENGINE = InnoDB
COMMENT = '用户信息表';


-- -----------------------------------------------------
-- Table `electric_iot`.`role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `electric_iot`.`role` ;

CREATE TABLE IF NOT EXISTS `electric_iot`.`role` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL COMMENT '角色名称',
  `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '角色创建时间',
  `comment` VARCHAR(200) NULL COMMENT '角色描述',
  `is_delete` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '角色是否删除，0表示未删除，1表示删除',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB
COMMENT = '角色数据表';


-- -----------------------------------------------------
-- Table `electric_iot`.`right`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `electric_iot`.`right` ;

CREATE TABLE IF NOT EXISTS `electric_iot`.`right` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL COMMENT '权限名称',
  `description` VARCHAR(200) NOT NULL COMMENT '权限描述',
  `parent_id` BIGINT NOT NULL DEFAULT 0 COMMENT '父级权限的ID',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB
COMMENT = '权限数据表';


-- -----------------------------------------------------
-- Table `electric_iot`.`role_right_relation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `electric_iot`.`role_right_relation` ;

CREATE TABLE IF NOT EXISTS `electric_iot`.`role_right_relation` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `role_id` BIGINT NOT NULL COMMENT '角色ID',
  `right_id` BIGINT NOT NULL COMMENT '权限ID',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `FK_ROLE_RELATION_idx` (`role_id` ASC),
  INDEX `FK_RIGHT_RELATION_idx` (`right_id` ASC),
  CONSTRAINT `FK_ROLE_RRR_R`
    FOREIGN KEY (`role_id`)
    REFERENCES `electric_iot`.`role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_RIGHT_RRR_R`
    FOREIGN KEY (`right_id`)
    REFERENCES `electric_iot`.`right` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '角色权限数据表';


-- -----------------------------------------------------
-- Table `electric_iot`.`user_right_relation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `electric_iot`.`user_right_relation` ;

CREATE TABLE IF NOT EXISTS `electric_iot`.`user_right_relation` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `user_id` BIGINT NOT NULL COMMENT '用户ID',
  `right_id` BIGINT NOT NULL COMMENT '权限ID',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `FK_DEPARTMENT_RIGHT_RELATION_idx` (`right_id` ASC),
  INDEX `FK_USER_RELATION_idx` (`user_id` ASC),
  CONSTRAINT `FK_USER_URIR_U`
    FOREIGN KEY (`user_id`)
    REFERENCES `electric_iot`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_RIGHT_URR_R`
    FOREIGN KEY (`right_id`)
    REFERENCES `electric_iot`.`right` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '用户权限关系表';


-- -----------------------------------------------------
-- Table `electric_iot`.`type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `electric_iot`.`type` ;

CREATE TABLE IF NOT EXISTS `electric_iot`.`type` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL COMMENT '设备类型名称',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB
COMMENT = '设备类型数据表';


-- -----------------------------------------------------
-- Table `electric_iot`.`status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `electric_iot`.`status` ;

CREATE TABLE IF NOT EXISTS `electric_iot`.`status` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL COMMENT '设备状态名称，1表示电池，2表示上电',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB
COMMENT = '设备状态数据表';


-- -----------------------------------------------------
-- Table `electric_iot`.`device`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `electric_iot`.`device` ;

CREATE TABLE IF NOT EXISTS `electric_iot`.`device` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `uid` VARCHAR(45) NULL COMMENT '设备自定义ID',
  `imsi` VARCHAR(45) NOT NULL COMMENT '设备的IMSI',
  `name` VARCHAR(45) NULL COMMENT '设备名称',
  `serial_number` VARCHAR(200) NULL COMMENT '设备序列号',
  `is_delete` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '设备是否删除，0表示未删除，1表示删除',
  `type_id` BIGINT NULL COMMENT '设备类型ID',
  `status_id` BIGINT NULL COMMENT '设备状态ID',
  `user_id` BIGINT NULL COMMENT '设备所属的用户ID',
  `comment` VARCHAR(200) NULL COMMENT '设备描述',
  `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '设备创建时间',
  `battery_record_gps_interval` INT NOT NULL DEFAULT 180 COMMENT '电池供电时GPS采集间隔，默认180分钟',
  `power_record_gps_interval` INT NOT NULL DEFAULT 5 COMMENT '电源供电时GPS采集间隔，默认5分钟',
  `battery_send_gps_interval` INT NOT NULL DEFAULT 180 COMMENT '电池供电时GPS发送间隔，默认180分钟',
  `power_send_gps_interval` INT NOT NULL DEFAULT 5 COMMENT '电源供电时GPS发送间隔，默认5分钟',
  `power_tcp_live_interval` INT NOT NULL DEFAULT 10 COMMENT '电源供电时，TCP心跳包的发送间隔，默认10秒',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `FK_TYPE_DEVICE_idx` (`type_id` ASC),
  INDEX `FK_STATUS_DEVICE_idx` (`status_id` ASC),
  INDEX `FK_USER_D_U_idx` (`user_id` ASC),
  CONSTRAINT `FK_TYPE_D_T`
    FOREIGN KEY (`type_id`)
    REFERENCES `electric_iot`.`type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_STATUS_D_S`
    FOREIGN KEY (`status_id`)
    REFERENCES `electric_iot`.`status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_USER_D_U`
    FOREIGN KEY (`user_id`)
    REFERENCES `electric_iot`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '设备信息表';


-- -----------------------------------------------------
-- Table `electric_iot`.`device_location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `electric_iot`.`device_location` ;

CREATE TABLE IF NOT EXISTS `electric_iot`.`device_location` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `longitude` DECIMAL(9,6) NOT NULL COMMENT '设备的经度',
  `latitude` DECIMAL(9,6) NOT NULL COMMENT '设备的纬度',
  `record_time` DATETIME NOT NULL COMMENT '记录设备位置的时间',
  `device_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `FK_DEVICE_LOCATION_idx` (`device_id` ASC),
  CONSTRAINT `FK_DEVICE_DL_D`
    FOREIGN KEY (`device_id`)
    REFERENCES `electric_iot`.`device` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '设备实时位置数据表';


-- -----------------------------------------------------
-- Table `electric_iot`.`user_department_relation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `electric_iot`.`user_department_relation` ;

CREATE TABLE IF NOT EXISTS `electric_iot`.`user_department_relation` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `user_id` BIGINT NOT NULL COMMENT '用户ID',
  `department_id` BIGINT NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `FK_USER_DEPARTMENT_RELATION_idx` (`user_id` ASC),
  INDEX `FK_DEPARTMENT_RELATION_idx` (`department_id` ASC),
  CONSTRAINT `FK_USER_UDR_U`
    FOREIGN KEY (`user_id`)
    REFERENCES `electric_iot`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_DEPARTMENT_UDR_D`
    FOREIGN KEY (`department_id`)
    REFERENCES `electric_iot`.`department` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '用户组织关系表';


-- -----------------------------------------------------
-- Table `electric_iot`.`user_role_relation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `electric_iot`.`user_role_relation` ;

CREATE TABLE IF NOT EXISTS `electric_iot`.`user_role_relation` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `user_id` BIGINT NOT NULL,
  `role_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `FK_USER_ROLE_RELATION_idx` (`user_id` ASC),
  INDEX `FK_ROLE_RELATION_idx` (`role_id` ASC),
  CONSTRAINT `FK_USER_UROR_U`
    FOREIGN KEY (`user_id`)
    REFERENCES `electric_iot`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_ROLE_URR_R`
    FOREIGN KEY (`role_id`)
    REFERENCES `electric_iot`.`role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '用户权限数据表';


-- -----------------------------------------------------
-- Table `electric_iot`.`department_device_relation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `electric_iot`.`department_device_relation` ;

CREATE TABLE IF NOT EXISTS `electric_iot`.`department_device_relation` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `department_id` BIGINT NOT NULL COMMENT '部门ID',
  `device_id` BIGINT NOT NULL COMMENT '设备ID',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `FK_DEPARTMENT_DR_idx` (`department_id` ASC),
  INDEX `FK_DEVICE_DDR_idx` (`device_id` ASC),
  CONSTRAINT `FK_DEPARTMENT_DDR_D`
    FOREIGN KEY (`department_id`)
    REFERENCES `electric_iot`.`department` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_DEVICE_DDR_D`
    FOREIGN KEY (`device_id`)
    REFERENCES `electric_iot`.`device` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '部门、设备关系表';


-- -----------------------------------------------------
-- Table `electric_iot`.`device_cmd`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `electric_iot`.`device_cmd` ;

CREATE TABLE IF NOT EXISTS `electric_iot`.`device_cmd` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `cmd` VARBINARY(60) NOT NULL COMMENT '要发送的字节数据',
  `is_send` TINYINT(1) NOT NULL DEFAULT 1 COMMENT '指令是否发送，1表示未发送，2表示发送',
  `device_id` BIGINT NOT NULL,
  `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '指令创建时间',
  `send_time` DATETIME NULL COMMENT '指令发送时间',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `FK_DEVICE_D_D_idx` (`device_id` ASC),
  CONSTRAINT `FK_DEVICE_D_D`
    FOREIGN KEY (`device_id`)
    REFERENCES `electric_iot`.`device` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '预向设备发送的指令';

USE `electric_iot` ;

-- -----------------------------------------------------
-- Placeholder table for view `electric_iot`.`view_bind_user_department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `electric_iot`.`view_bind_user_department` (`id` INT, `department_id` INT, `department_name` INT, `level` INT, `department_create_time` INT, `department_is_delete` INT, `parent_id` INT, `user_id` INT, `login_name` INT, `login_password` INT, `user_name` INT, `user_create_time` INT, `mobile` INT, `email` INT, `user_is_delete` INT);

-- -----------------------------------------------------
-- View `electric_iot`.`view_bind_user_department`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `electric_iot`.`view_bind_user_department` ;
DROP TABLE IF EXISTS `electric_iot`.`view_bind_user_department`;
USE `electric_iot`;
CREATE  OR REPLACE VIEW `view_bind_user_department` AS
    SELECT 
        `user_department_relation`.`id` AS `id`,
        `user_department_relation`.`department_id` AS `department_id`,
        `department`.`name` AS `department_name`,
        `department`.`level` AS `level`,
        `department`.`create_time` AS `department_create_time`,
        `department`.`is_delete` AS `department_is_delete`,
        `department`.`parent_id` AS `parent_id`,
        `user_department_relation`.`user_id` AS `user_id`,
        `user`.`login_name` AS `login_name`,
        `user`.`login_password` AS `login_password`,
        `user`.`name` AS `user_name`,
        `user`.`create_time` AS `user_create_time`,
        `user`.`mobile` AS `mobile`,
        `user`.`email` AS `email`,
        `user`.`is_delete` AS `user_is_delete`
    FROM
        ((`department`
        JOIN `user_department_relation` ON ((`user_department_relation`.`department_id` = `department`.`id`)))
        JOIN `user` ON ((`user_department_relation`.`user_id` = `user`.`id`)));

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
