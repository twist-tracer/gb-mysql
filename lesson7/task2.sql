# 2. Выведите список товаров products и разделов catalogs, который соответствует товару.

select *
from shop.products p
left join catalogs c on p.catalog_id=c.id
