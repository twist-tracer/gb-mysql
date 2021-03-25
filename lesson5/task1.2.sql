# 1.2 Таблица users была неудачно спроектирована. Записи created_at и updated_at были заданы типом VARCHAR и в них
# долгое время помещались значения в формате 20.10.2017 8:10. Необходимо преобразовать поля к типу DATETIME, сохранив
# введённые ранее значения.

update ignore shop.users
set created_at = if(STR_TO_DATE(created_at, '%d.%m.%Y %h:%i'), STR_TO_DATE(created_at, '%d.%m.%Y %h:%i'), created_at),
    updated_at = if(STR_TO_DATE(updated_at, '%d.%m.%Y %h:%i'), STR_TO_DATE(updated_at, '%d.%m.%Y %h:%i'), updated_at)
where id > 0;

alter table shop.users
    change column `updated_at` `updated_at` datetime default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;
