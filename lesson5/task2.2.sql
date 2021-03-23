# 2.2 Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. Следует учесть, что необходимы
# дни недели текущего года, а не года рождения.

select
    dayofweek(date_format(birthday, concat(year(now()), '-%m-%d'))) as day_of_week,
    count(*) as total
from vk.profile
group by day_of_week
order by day_of_week asc;
