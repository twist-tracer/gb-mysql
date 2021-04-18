DELIMITER $$
CREATE PROCEDURE GENERATE_USERS (IN num INT)
BEGIN
    DECLARE i INT DEFAULT 0;
    WHILE i < num DO
            INSERT INTO `shop`.users (`name`, `birthday_at`) VALUES (concat(CURRENT_TIMESTAMP, '_', i), CURRENT_DATE);
            SET i = i + 1;
        END WHILE;
END$$
DELIMITER $$ ;

CALL GENERATE_USERS(1000000);
