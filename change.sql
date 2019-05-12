ALTER TABLE `electric_iot`.`device_location` 
ADD COLUMN `temp` VARCHAR(45) NULL COMMENT '当地的温度' AFTER `is_delete`,
ADD COLUMN `humidity` VARCHAR(45) NULL COMMENT '当地的湿度' AFTER `temp`;