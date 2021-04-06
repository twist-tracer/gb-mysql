# Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток.
# С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать фразу
# "Добрый день", с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".

DELIMITER //
CREATE FUNCTION HELLO()
    RETURNS TEXT DETERMINISTIC
BEGIN
    RETURN (
        SELECT
               CASE
                   WHEN DATE_FORMAT(NOW(), "%H:%i") BETWEEN CAST('6:00' AS TIME) AND CAST('12:00' AS TIME) THEN 'Доброе утро'
                   WHEN DATE_FORMAT(NOW(), "%H:%i") BETWEEN CAST('12:00' AS TIME) AND CAST('18:00' AS TIME) THEN 'Добрый день'
                   WHEN DATE_FORMAT(NOW(), "%H:%i") BETWEEN CAST('18:00' AS TIME) AND CAST('00:00' AS TIME) THEN 'Доброй ночи'
               END
    );
END//
