# Создайте представление, которое выводит название name товарной позиции из таблицы products и соответствующее
# название каталога name из таблицы catalogs.

CREATE VIEW products_catalogs AS
select p.`name` product_name, c.`name` `catalog_name` from products p
left join catalogs c on p.catalog_id=c.id
