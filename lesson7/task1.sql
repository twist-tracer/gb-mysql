# 1. Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.

select * from users where exists (select * from orders where orders.user_id=users.id);
