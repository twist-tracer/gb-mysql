# 5. Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети.

# Не совсем понял чем характеризуется наименьшая активность
# Пусть это будут пользователи, которые меньше всего отправляли запросы в друзья, писали, постили

select
    user.*,
    (select count(*) from vk.friend_request where friend_request.from_user_id=user.id) as friend_request_count,
    (select count(*) from vk.message where message.from_user_id=user.id) as messages_count,
    (select count(*) from vk.post where post.user_id=user.id) as posts_count
from vk.user
order by friend_request_count + messages_count + posts_count
limit 10;
