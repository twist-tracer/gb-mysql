INSERT INTO `vk`.`message` VALUES (NULL,51,63,'Dolores non eveniet accusantium. Quia et sunt cupiditate maxime consequatur. Deleniti dolore quos iure vel fugit. Dolore iusto debitis ad et.','2003-12-02 10:28:26','2008-07-03 00:32:57',NULL),(NULL,92,63,'Non vero velit odit nemo. Cumque incidunt corrupti nihil ut quo qui iure. Officia soluta sit cum placeat ut.','1971-09-24 06:16:33','1994-03-03 18:25:27',NULL),(NULL,33,63,'Quo maxime dolor officia fugiat. Ducimus laboriosam voluptatum recusandae alias rerum. Quo fugiat iste doloribus sint quidem mollitia. Accusantium facere iure quis hic ut ullam.','1997-10-02 06:43:07','2008-06-09 15:34:33',NULL),(NULL,51,63,'Dignissimos recusandae omnis neque. Eligendi numquam consequatur nisi ullam temporibus qui. Amet sit perspiciatis saepe alias consequuntur. Et deserunt sit sed quisquam.','2001-04-17 05:09:41','1994-02-07 00:08:41',NULL),(NULL,21,63,'Earum earum dignissimos in sunt molestiae rerum. Nulla odit fuga molestiae sint voluptatem. Nostrum et possimus sint nihil sit voluptatem et.','1970-12-01 14:44:06','1970-10-20 00:53:33',NULL),(NULL,26,63,'Et quam accusantium in repellendus possimus. Nulla ipsum nam quas nam sint et omnis.','1971-08-15 04:00:34','1972-01-10 11:41:45',NULL),(NULL,60,63,'Sit qui et eveniet similique. Consequatur facere maiores eos velit.','1980-04-07 06:41:13','1978-12-16 09:05:45',NULL),(NULL,29,63,'Porro odit ut et nostrum laborum qui. Nisi accusantium aliquid voluptates aut id atque. Aliquid laboriosam ut quo et architecto tempore tempora nobis. Sit id sunt beatae itaque.','1985-01-08 18:07:52','1991-10-02 00:02:59',NULL),(NULL,56,63,'Inventore iusto minus eum nisi et sed illo. Voluptatem earum eos consequuntur sint sequi. Voluptatem nihil consequuntur eum repellat sed asperiores ullam.','2010-04-11 19:54:23','2000-03-06 18:33:17',NULL),(NULL,53,63,'Consequuntur neque non deserunt nihil error dolores. Explicabo sed aliquam nulla est quisquam. Ut quis occaecati officiis in sed non.','1977-10-09 12:08:17','1993-01-31 22:06:06',NULL),(NULL,40,63,'Repellendus est eveniet quibusdam minima in quo expedita. Sint nemo nulla aut et voluptas. Enim dolores voluptatem non quasi. Cumque ea aperiam molestiae quod aliquam laborum.','1977-12-27 01:13:15','2017-05-16 15:49:22',NULL),(NULL,95,63,'Quis quis earum doloremque dolor. Eum aliquid quidem ut expedita commodi est. Aut odio et qui voluptate. Aperiam numquam praesentium ut molestiae laudantium enim.','1982-09-29 01:39:51','2009-07-31 15:04:52',NULL),(NULL,81,63,'Voluptatem et officiis mollitia saepe cupiditate. Consectetur velit aspernatur in sequi a ut.','1993-01-01 21:54:06','2003-12-27 04:24:55',NULL),(NULL,85,63,'Cupiditate rem minima dolores dolore. Reprehenderit aut optio sit ut. Soluta itaque ullam non impedit. Est sit maiores accusamus officiis fuga provident. Vero nulla itaque autem corporis iste harum.','1997-04-27 15:46:57','1979-07-27 12:21:43',NULL),(NULL,76,63,'Voluptatem tempora pariatur fugit dolorem eveniet laudantium. Quasi quo aperiam aperiam consequatur aut ut necessitatibus. Aut eos esse eos aut saepe numquam aut. Velit ipsam est veniam deleniti ut.','1997-07-27 01:03:11','2017-02-20 09:41:48',NULL),(NULL,56,63,'Sed ea velit sunt error tempora dolores. Consequatur quo laboriosam exercitationem voluptatem distinctio omnis praesentium.\nQuam consequuntur quis voluptas quia. Veniam ea qui quo quis aliquid.','1996-03-04 23:56:38','1978-05-23 14:24:49',NULL),(NULL,4,63,'Explicabo ipsam labore commodi vel molestias cupiditate. Laudantium enim doloremque molestiae unde qui et voluptatem. Saepe maxime magni assumenda quo placeat.','1972-02-23 18:20:25','1992-11-24 12:28:43',NULL),(NULL,87,63,'Eos quia culpa voluptatem deserunt libero soluta. Libero cumque quam vel dolorem consequatur minus quidem aut. Omnis eos corporis quidem reiciendis autem quia dolores. Eius atque ut quis.','1971-09-27 05:23:02','2003-01-23 10:53:07',NULL),(NULL,80,63,'Rerum eveniet et consequatur. Sint nisi ut ut est et nisi quaerat. Aut et et vitae reiciendis voluptatem ut fugiat asperiores.','2001-03-20 19:51:35','2011-07-15 05:20:25',NULL),(NULL,48,63,'Quia quisquam amet est cumque voluptatem. Eaque aut ratione rerum commodi aliquam deleniti nobis. Vitae blanditiis quos nobis. Et nostrum amet non.','1972-07-09 05:27:26','1993-06-03 20:17:56',NULL);


insert ignore into `vk`.`friend_request`
SELECT from_user_id, to_user_id, 1 as status, NOW() as created_at, NOW() as updated_at FROM vk.message where to_user_id = 63;

