# 2.1 Подсчитайте средний возраст пользователей в таблице users.

SELECT avg(year(now()) - year(birthday_at)) from shop.users;
