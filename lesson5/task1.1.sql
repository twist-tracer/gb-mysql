# 1.1 Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем.

update shop.users set created_at = CURRENT_TIMESTAMP, updated_at = CURRENT_TIMESTAMP where id > 0;
