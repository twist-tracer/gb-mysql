# 3. Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей.

select
    *,
    (select count(*) from `vk`.`like` where `like`.user_id=`profile`.user_id) as count_likes
from `vk`.`profile`
order by birthday desc
limit 10;
