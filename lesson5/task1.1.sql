# 1.1 Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем.

alter table vk.user
    add column `updated_at` varchar(255) null default null after `created_at`;


update vk.user set created_at = CURRENT_TIMESTAMP, updated_at = CURRENT_TIMESTAMP where id > 0;
