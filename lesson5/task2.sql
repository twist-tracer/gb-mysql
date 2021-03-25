# 2. Пусть задан некоторый пользователь.
# Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользователем.

# возьмем пользователя id=63
select * from vk.user where id = (
    # получаем id друга, который больше всего писал
    select from_user_id
    from vk.message
    where
          from_user_id in (
                # получаем друзей
                select from_user_id from vk.friend_request where to_user_id = 63 and status = 1
          )
          and to_user_id = 63
    group by from_user_id
    order by count(*) desc
    limit 1
);
