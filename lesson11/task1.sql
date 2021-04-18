CREATE TABLE `logs` (
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `table_name` VARCHAR(64) NOT NULL,
    `ext_id` INT(10) UNSIGNED NOT NULL,
    `ext_name` VARCHAR(255) NULL DEFAULT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`))
ENGINE = ARCHIVE;

DELIMITER $$
USE `shop`$$
CREATE TRIGGER `shop`.`catalogs_AFTER_INSERT` AFTER INSERT ON `catalogs` FOR EACH ROW
BEGIN
    INSERT INTO `shop`.`logs` (`table_name`, `ext_id`, `ext_name`) VALUES ('catalogs', NEW.id, NEW.`name`);
END$$
DELIMITER ;

DELIMITER $$
USE `shop`$$
CREATE TRIGGER `shop`.`users_AFTER_INSERT` AFTER INSERT ON `users` FOR EACH ROW
BEGIN
    INSERT INTO `shop`.`logs` (`table_name`, `ext_id`, `ext_name`) VALUES ('users', NEW.id, NEW.`name`);
END$$
DELIMITER ;

DELIMITER $$
USE `shop`$$
CREATE TRIGGER `shop`.`products_AFTER_INSERT` AFTER INSERT ON `products` FOR EACH ROW
BEGIN
    INSERT INTO `shop`.`logs` (`table_name`, `ext_id`, `ext_name`) VALUES ('products', NEW.id, NEW.`name`);
END$$
DELIMITER ;
