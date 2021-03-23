# 1.3 В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 0, если товар
# закончился и выше нуля, если на складе имеются запасы. Необходимо отсортировать записи таким образом, чтобы они
# выводились в порядке увеличения значения value. Однако нулевые запасы должны выводиться в конце, после всех записей.

CREATE TABLE `storehouses_products` (
    `id` int unsigned NOT NULL AUTO_INCREMENT,
    `value` int unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

select * from vk.storehouses_products order by value > 0 desc, value;
