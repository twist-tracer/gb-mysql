# 2.2 Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. Следует учесть, что необходимы
# дни недели текущего года, а не года рождения.

select
    dayofweek(date_format(birthday_at, concat(year(now()), '-%m-%d'))) as day_of_week,
    count(*) as total
from shop.users
group by day_of_week
order by day_of_week asc;
