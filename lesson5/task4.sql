# 4. Определить кто больше поставил лайков (всего) - мужчины или женщины?

SELECT
    gender,
    count((select count(*) from `like` where `like`.user_id=`profile`.user_id)) as count_likes
FROM vk.`profile`
where gender in ('f','m')
group by gender
order by count_likes desc
limit 1
