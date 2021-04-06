# В таблице products есть два текстовых поля: name с названием товара и description с его описанием.
# Допустимо присутствие обоих полей или одно из них. Ситуация, когда оба поля принимают неопределенное значение NULL неприемлема.
# Используя триггеры, добейтесь того, чтобы одно из этих полей или оба поля были заполнены.
# При попытке присвоить полям NULL-значение необходимо отменить операцию.


DELIMITER ;;

CREATE TRIGGER before_insert_products BEFORE INSERT ON products
    FOR EACH ROW
BEGIN
    IF (SELECT COALESCE(NEW.`name`, NEW.`description`) as name) IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'INSERT canceled. Set name or description';
    END IF;
END;;

CREATE TRIGGER before_update_products BEFORE UPDATE ON products
    FOR EACH ROW
BEGIN
    IF (SELECT COALESCE(NEW.`name`, NEW.`description`) as name) IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'UPDATE canceled. Set name or description';
    END IF;
END;;

DELIMITER ;

