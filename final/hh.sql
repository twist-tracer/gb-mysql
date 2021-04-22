CREATE SCHEMA `hh` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

use `hh`;

CREATE TABLE IF NOT EXISTS `users` (
    `id` INT(10) UNSIGNED NOT NULL,
    `firstname` VARCHAR(255) NOT NULL,
    `lastname` VARCHAR(255) NULL DEFAULT NULL,
    `middlename` VARCHAR(255) NULL DEFAULT NULL,
    `email` VARCHAR(255) NOT NULL,
    `phone` BIGINT(15) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB COMMENT = 'Пользователи';

INSERT INTO `users` VALUES (1,'Dave','Roob','ab','sierra.murray@example.com',1),(2,'Kenya','Leannon','ipsam','mcglynn.sammy@example.com',0),(3,'Gunner','Beier','ipsam','bcummerata@example.com',461301),(4,'Hans','Kunze','enim','cathryn.spinka@example.net',1),(5,'Koby','Dare','atque','moore.desiree@example.net',2403650301),(6,'Brandi','Williamson','qui','gretchen55@example.com',464304),(7,'Annette','Wintheiser','aliquid','irving.jacobi@example.net',92),(8,'Melissa','Collier','et','sterling39@example.net',38),(9,'Annamae','Parker','rerum','pinkie.trantow@example.com',0),(10,'Stephon','Moen','voluptates','henry.boehm@example.org',287551);

CREATE TABLE IF NOT EXISTS `companies` (
    `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `description` TEXT NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `name_uidx` (`name` ASC))
ENGINE = InnoDB
COMMENT = 'Компании';

INSERT INTO `companies` VALUES (1,'temporibus','Voluptas aspernatur natus accusantium ex eos. Quos dolores distinctio ipsum enim minima optio. Error placeat hic natus doloremque sapiente recusandae ipsam provident.'),(2,'soluta','Inventore sed quas omnis quis consequuntur enim repellendus. Nobis error nihil illo dicta. Quaerat ut aut nesciunt beatae tempore est. Ut quia et sapiente eaque.'),(3,'delectus','Vel sit nulla consequuntur et. Eaque qui ut accusantium sequi rerum numquam. Quia animi placeat consequatur ea tenetur eaque doloribus non. Ut consectetur ut hic dolores perspiciatis veritatis.'),(4,'culpa','Et sunt dolores quasi esse odio accusamus qui. Qui asperiores aut aliquid iure. Deserunt id tenetur animi expedita enim.'),(5,'consequatur','Iure velit eius vero autem aut est tempora. Voluptatibus ut non ratione eligendi eum sit. Voluptatem suscipit aut exercitationem voluptas.'),(6,'nam','Non est laborum minus ipsa quisquam ut consequuntur. Magni esse et facilis iste reiciendis. Tempora nihil iure impedit tempora. Aut aliquid nostrum provident numquam fuga reprehenderit vel.'),(7,'voluptas','Voluptate quisquam vel architecto cumque hic exercitationem. Molestiae magnam doloremque commodi eos omnis suscipit. Velit sit placeat at perferendis vitae occaecati.'),(8,'debitis','Cupiditate consectetur corrupti velit pariatur a placeat quas. At est nobis ullam quis et asperiores. Eligendi atque laudantium repudiandae laboriosam id. Et nostrum rerum cum pariatur corporis voluptate nisi et. Sit laudantium consequatur natus provident unde rerum expedita.'),(9,'non','Quisquam sunt in numquam molestiae ullam. Nihil suscipit eligendi maxime nobis fugiat. Incidunt ab ut maxime qui. Necessitatibus fuga eos amet repellendus rerum et cum earum.'),(10,'quidem','Ut sit consequatur aperiam facilis. Similique voluptatem veniam dolores. Natus ratione recusandae doloribus eos qui. Ipsam eligendi rerum eligendi non.'),(11,'quas','Itaque assumenda repellendus rerum explicabo pariatur maiores iure in. Id est rerum molestiae. Assumenda perferendis vel magnam suscipit non nemo.'),(12,'consectetur','Aut veniam non nobis autem. Ipsa vitae qui temporibus dolores aut debitis velit. Itaque maiores sint consequuntur at.'),(13,'quo','Illo nesciunt et quos. Amet sapiente ullam soluta id reprehenderit dolore magni.'),(14,'odio','Aliquid consequatur culpa aut rerum qui culpa ut occaecati. Aut aut sapiente non. Neque aut vel commodi sit impedit repellat. Et voluptatem accusamus animi delectus consectetur id. Sed voluptatem molestiae earum in in exercitationem.'),(15,'similique','Qui impedit explicabo quisquam repudiandae quod iste. Tenetur aliquam natus laudantium veniam similique. Omnis id officia sit magnam.');

CREATE TABLE IF NOT EXISTS `resumes` (
    `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id` INT(10) UNSIGNED NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `about` TEXT NULL DEFAULT NULL,
    `salary` INT(10) UNSIGNED NULL DEFAULT NULL,
    `salary_currency` ENUM('USD', 'RUB', 'EUR') NOT NULL DEFAULT 'RUB',
    PRIMARY KEY (`id`),
    INDEX `user_id_idx` (`user_id` ASC),
    FOREIGN KEY (`user_id`)
    REFERENCES `users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB COMMENT = 'Резюме';

INSERT INTO `resumes` VALUES (1,10,'nemo','Odit ipsa blanditiis et velit et adipisci non. Et vel adipisci debitis sunt et magnam odit. Rerum ducimus et enim illum vel sit enim omnis.',40451,'RUB'),(2,1,'beatae','Ut ut aut quis maxime temporibus. Dolorum officiis in et voluptas tempore natus. Occaecati occaecati aut est expedita laudantium. Et et distinctio officiis eveniet eos sit aliquid.',296524,'RUB'),(3,2,'ut','Quae placeat dolorem suscipit cupiditate est et aut. Ex autem eum fugiat ut nobis. Exercitationem et et quas delectus. Ratione qui aliquam placeat accusamus.',285928,'EUR'),(4,3,'doloribus','Aut cupiditate fuga et aperiam vero inventore tempora. Eveniet impedit et non aspernatur. Ad sit et dolor quasi recusandae neque rem.',245670,'EUR'),(5,4,'sed','Perspiciatis minima sed sit minima aliquam. Non nihil voluptatibus quia sint at nihil minima. Sapiente id cupiditate a maxime sit illo dignissimos. Necessitatibus nihil dolorum est optio aut molestias sint.',298706,'EUR'),(6,5,'dolorem','Quod sit autem voluptas dolor. Fugiat voluptatem dolores et facilis similique. Ea et cupiditate consequuntur repudiandae suscipit in. Unde sed rerum quia consequatur.',173680,'USD'),(7,6,'beatae','Mollitia inventore magnam consequuntur sed delectus quod. Soluta enim molestiae voluptatum facere quasi est in. Suscipit qui officiis dolores itaque hic ea.',249243,'RUB'),(8,7,'esse','Voluptate id nihil rerum id minus quis. Dolorum numquam consequatur voluptatem magni. Enim quia veniam similique consequatur cupiditate laboriosam deleniti odio. Et illum amet dolorum saepe.',79646,'USD'),(9,8,'enim','Eius ut et ratione nesciunt ea dolores. Error voluptatem quia ex distinctio aut eum. Laboriosam ut quas vel nam. Est tempora adipisci voluptatum omnis id minima.',60317,'EUR'),(10,9,'quos','Tempore ut est asperiores optio nostrum et suscipit omnis. Reiciendis libero quia aut ullam non. Nisi quia corrupti beatae consequatur provident. Cupiditate magnam eos qui aliquid veniam sint eveniet sunt. Omnis est repellat omnis quis.',290150,'RUB');

CREATE TABLE IF NOT EXISTS `resume_experience` (
    `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    `resume_id` INT(10) UNSIGNED NOT NULL,
    `date_from` DATE NOT NULL,
    `date_to` DATE NULL DEFAULT NULL,
    `company` VARCHAR(255) NOT NULL,
    `position` VARCHAR(255) NOT NULL,
    `description` TEXT NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    INDEX `resume_id_idx` (`resume_id` ASC),
    FOREIGN KEY (`resume_id`)
    REFERENCES `resumes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB COMMENT = 'Опыт работы';

INSERT INTO `resume_experience` VALUES (1,1,'2014-11-11','2012-05-04','Kirlin-Lemke','quia','Unde impedit rerum sed animi et et. Aliquam et aut minima odio distinctio nihil.'),(2,2,'1990-09-02','1979-04-26','Runolfsdottir Ltd','delectus','Qui qui accusantium quo est. Est porro aspernatur inventore. Hic voluptatibus ut quidem. Quam et enim qui ut voluptas qui.'),(3,3,'1998-02-25','2017-12-01','Kuhlman, Frami and Dooley','cumque','Dolorum quo qui sed enim porro. Aut doloribus sed eius accusantium illo ut. Facere illo dicta quia molestias corporis.'),(4,4,'2017-01-07','2020-01-31','Shields PLC','officia','Velit quis unde provident ducimus optio consequuntur voluptates. Voluptatibus sint enim dolor et voluptatem quidem corporis. Voluptas consequatur in quae est quis amet. Molestias id omnis aut enim. Voluptatem dolor in mollitia voluptas.'),(5,5,'1998-09-22','1978-08-08','Windler PLC','quo','Et doloremque dolores esse non enim voluptates. Voluptatem veniam adipisci mollitia inventore praesentium sunt facilis molestias.'),(6,6,'2012-04-06','2016-10-31','Kling-Rogahn','velit','In cupiditate optio et praesentium consectetur dolores sit. Placeat velit numquam optio nostrum omnis itaque repudiandae. Culpa eligendi officia accusantium blanditiis vero.'),(7,7,'2019-08-30','1997-10-14','Langworth, Fay and Feest','eos','Autem magnam non laborum quisquam fugit animi. Hic commodi placeat sunt est rem ratione. Dolorem hic accusamus veniam sed. Voluptatem impedit harum magni doloremque quidem cupiditate.'),(8,8,'1997-12-19','1993-02-27','Lind-Glover','nihil','Molestiae molestias explicabo iste et expedita. Vel illo tempora excepturi eligendi nisi quam vero. Excepturi beatae deserunt iusto voluptatibus nihil.'),(9,9,'1978-09-29','1985-06-05','Fadel Ltd','est','Ut eveniet delectus ut repellendus aut sit sint. Sint fugiat error ad quia delectus voluptatum eos. Id harum ea minima odio dolores labore dicta nihil. Sint fugiat quos inventore fugiat.'),(10,10,'1984-07-20','1970-12-04','Shields, Wiza and Blick','nobis','Et consequuntur cumque tempora. Doloribus sed amet sit doloremque dolorum laudantium consequatur. Cumque voluptas accusamus ut.'),(11,1,'2007-01-01','2009-11-10','Prohaska, Sanford and Runolfsdottir','tempora','Qui doloribus aliquid voluptas dolor veniam. Adipisci et architecto earum molestias molestiae quisquam consequuntur nisi. Est odio dolorem numquam recusandae.'),(12,2,'1975-06-25','1970-02-14','Kiehn, Buckridge and Yost','amet','Veniam in non ut maiores. Dolore explicabo aspernatur et consequatur ratione quod sed rerum. Minima quas sit modi suscipit illum omnis perspiciatis. Qui debitis in fugit deleniti ipsum eveniet.'),(13,3,'1978-07-22','2013-02-07','Huels-Schiller','maiores','Voluptas fuga porro alias consequuntur commodi ut reprehenderit. Ab sed voluptas voluptatum fuga distinctio aut. Placeat numquam debitis non aspernatur dolores.'),(14,4,'1981-08-27','2007-10-12','Mertz Ltd','mollitia','Et dolores sed omnis tempora repellendus doloribus iure. Rem rerum nisi dolores unde. Quis harum voluptatem similique quaerat.'),(15,5,'1974-10-10','1999-05-28','Parker-Durgan','quaerat','Nulla fugiat velit fugiat blanditiis ea optio aut similique. Est sint eaque voluptas et quos. Quaerat ex alias in maiores amet repudiandae fugiat.'),(16,6,'1990-03-15','1989-12-16','Hand and Sons','consequatur','Nam sed impedit ut eum et fugit. Nisi ea molestias veritatis est. Suscipit reiciendis ut magni sit. Saepe qui praesentium placeat numquam aspernatur.'),(17,7,'1983-01-16','1986-04-01','Satterfield Ltd','nobis','Iste assumenda ratione aut amet. Facilis consectetur aut sed iusto. Qui molestias vel dolorem aut iste. Cumque eaque et officiis cumque veniam est harum.'),(18,8,'1996-11-15','1983-01-09','Beer-Murazik','odio','Ea rerum ut reprehenderit sit unde. Exercitationem ea libero eius aut ea. Adipisci deserunt necessitatibus vel nihil sint ab.'),(19,9,'1979-02-02','2011-02-12','Lakin, Schimmel and Bartoletti','blanditiis','Odio deleniti atque architecto. Repellendus est quis et aliquam neque impedit. Quo qui tempora maxime cumque pariatur facilis dolor. Cum ab quas deleniti consectetur.'),(20,10,'1970-06-09','1977-06-05','Schumm LLC','magnam','Cumque sed sit labore. Quis aut ut est rem nulla iste. Consequuntur tenetur omnis nihil dolorum. Eligendi dolorem quia odit sint et.'),(21,1,'2012-10-01','1976-05-25','Orn-Friesen','omnis','Provident ut consequuntur quo totam praesentium sed quae. Qui ut explicabo aut et corporis cupiditate. Qui rerum necessitatibus velit eveniet ducimus modi rerum.'),(22,2,'2021-01-29','2004-05-31','Roob-Corkery','quo','Laboriosam aliquam in aut quas. Ipsam occaecati illum ut hic aut voluptatem cupiditate.'),(23,3,'2002-07-12','1995-08-31','Koss-Grady','ea','Quisquam exercitationem sed eveniet tempora eos. Consequuntur vero ea qui soluta. Est voluptas vitae perspiciatis molestiae molestias natus ipsa nihil.'),(24,4,'1983-08-09','2004-02-27','Buckridge, Feeney and Mills','a','Molestiae ut sed est ullam aut molestiae. At dolores a quasi sequi eum suscipit quibusdam. Et quisquam et quis ut et sed. Sunt atque inventore ipsa dolor.'),(25,5,'1972-01-12','2017-07-10','Willms PLC','nulla','Labore modi minima eum est alias voluptatem tenetur. Soluta nostrum adipisci sapiente voluptatem. Fugit dolor modi fuga rerum nihil est. Sit ut et voluptatem odit maxime dolorum iure.'),(26,6,'2001-05-31','1991-01-29','Jaskolski-Yost','voluptatem','Aut fuga non unde aut. Commodi perferendis dolores rerum.'),(27,7,'1987-04-23','2001-05-11','Emard Group','alias','Incidunt ad eos nulla. Et dolores quidem facilis error ab vel totam. Et possimus sunt repellat doloremque voluptate dolor.'),(28,8,'1970-04-23','2020-03-29','Bayer and Sons','sunt','Et atque iure nisi autem voluptate voluptatem dignissimos. Pariatur voluptas aspernatur expedita necessitatibus. Ab dignissimos vel magnam numquam.'),(29,9,'2011-09-04','2012-08-25','Sanford, Crona and Gusikowski','nihil','Quia ex libero distinctio odit assumenda labore occaecati eius. Ut tempora molestiae id. Et ea incidunt vel itaque cum. Rerum dolores itaque error ut placeat non molestias est.'),(30,10,'1986-04-27','1977-04-04','Gerlach-Mosciski','dolores','Et dolores consequatur harum. Nihil voluptatem dolor voluptates eveniet ut quam qui. Nesciunt et ut voluptatibus impedit similique architecto. Consequuntur dicta dolor ut ut dolorum. Ea deserunt dolor necessitatibus perspiciatis cum.');

CREATE TABLE IF NOT EXISTS `vacancies` (
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `company_id` INT(10) UNSIGNED NOT NULL,
    `description` TEXT NULL,
    `salary` INT(10) UNSIGNED NULL DEFAULT NULL,
    `salary_currency` ENUM('USD', 'RUB', 'EUR') NOT NULL DEFAULT 'RUB',
    PRIMARY KEY (`id`),
    INDEX `company_id_idx` (`company_id` ASC),
    FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB COMMENT = 'Вакансии';

INSERT INTO `vacancies` VALUES (1,5,'Qui architecto commodi tempora sint nam aut est. Et facere quia molestiae consequuntur et ullam. Fuga deleniti voluptatem iste eius ad. Beatae eligendi minus doloribus itaque dolore ratione nulla dicta.',49948,'USD'),(2,12,'Laborum laboriosam voluptas et. Molestias placeat voluptatem eum rerum sapiente. Sit et excepturi natus voluptatem perspiciatis atque.',184417,'EUR'),(3,7,'Ad iusto odio voluptas id qui quaerat. Rem doloribus nam molestiae rerum sed expedita. Placeat nam et velit aliquid ut.',176605,'EUR'),(4,1,'Consequatur explicabo officia id qui mollitia at. Dignissimos quos deleniti consequatur enim.',220859,'USD'),(5,7,'Veritatis eos eum doloribus laboriosam deleniti. Reiciendis molestiae doloremque voluptatum dolorem perspiciatis expedita illo. Et nesciunt nihil magnam reiciendis sapiente.',37942,'USD'),(6,6,'Reprehenderit neque voluptas eum blanditiis dolorem est dolorem. Minus id aut aut laboriosam error explicabo voluptatem. Qui quia maiores magni quo.',190718,'EUR'),(7,11,'Suscipit earum qui perferendis sed error deleniti placeat earum. Id et aut optio tenetur qui at.',227125,'USD'),(8,6,'Ut voluptatum placeat nihil voluptatem aperiam in. Provident delectus sequi ut possimus rerum et minus voluptate. Qui quae eveniet nobis nihil natus sed iste repellat.',171581,'EUR'),(9,2,'Praesentium magni ea autem eos eligendi numquam. Dolorum cupiditate rerum rerum necessitatibus provident expedita vero. Officiis non nemo quis nihil blanditiis. Ut cupiditate omnis blanditiis esse.',176398,'RUB'),(10,2,'Voluptates enim perferendis sint. Deserunt corrupti et aperiam magni repellendus. Facere quia quod velit officiis.',64866,'RUB'),(11,10,'Sunt quam ex nostrum nemo harum. Et debitis sequi mollitia natus eaque. Omnis ut iure esse voluptas voluptates illum sunt modi.',100116,'EUR'),(12,11,'A pariatur voluptatem omnis molestiae eaque debitis pariatur omnis. Veritatis et et accusantium magni praesentium. Quia et blanditiis blanditiis eveniet. Occaecati veniam suscipit atque quo facilis velit.',163728,'EUR'),(13,9,'Ut asperiores enim vel tenetur voluptatem. Eligendi minima nam et expedita.',161859,'RUB'),(14,9,'Eveniet voluptatibus corporis dolorum. Laboriosam cum sint officiis aspernatur. Ut nihil ducimus qui et cum delectus quos.',44143,'EUR'),(15,1,'Omnis omnis quos tempore cum fugiat delectus. Aut laboriosam molestiae odit accusantium sequi. Sequi consequatur officiis perferendis omnis provident rem.',105685,'USD'),(16,14,'Voluptatum aut quo necessitatibus aut omnis vero. Id error id sit enim amet dicta ut. Minima praesentium consequatur corporis rerum dolore maxime. Omnis rerum nihil sed saepe. Fugit modi vel sed.',213999,'RUB'),(17,12,'Velit ut ut repudiandae molestiae necessitatibus. Veritatis nisi quos qui accusamus cumque eius et. Quis et illo quia necessitatibus cupiditate.',109376,'EUR'),(18,5,'Sint itaque ut odio et amet. Soluta deleniti et quasi itaque. Tenetur mollitia ut hic qui aut facere voluptatibus. Aut nihil hic nesciunt voluptatem velit dolore corporis cumque.',33615,'USD'),(19,12,'Doloribus dolor autem aut consectetur quos eaque et. Ut voluptas aut molestias sit consequuntur voluptas. Sint itaque non laborum voluptatibus. Laboriosam dolorem aliquid similique ipsam expedita repudiandae.',293430,'EUR'),(20,6,'Sint laborum autem consectetur aut. Et quaerat possimus dolorem reiciendis.',202484,'RUB'),(21,14,'Hic ut est provident eius quia. Tenetur voluptate placeat cum totam. Mollitia rerum amet aut quis ipsum quia.',76826,'USD'),(22,9,'Enim autem dignissimos labore et temporibus. Sed possimus cum aspernatur. Cupiditate maiores cum eos aut explicabo autem. Sit vero ut quas et sint doloremque accusamus tempora.',235304,'RUB'),(23,9,'Eius sunt hic debitis commodi non accusamus. Autem ut est sit eos corrupti. Impedit saepe non architecto doloremque aliquam eius et. Et deleniti rerum sed possimus. Mollitia rerum et sint commodi voluptas explicabo.',253530,'USD'),(24,8,'Sit sed voluptatem quia alias est dolorem est. Et aliquam consequatur quisquam aperiam. Voluptas laudantium tempora deserunt. Non autem corrupti corrupti laudantium voluptatum commodi quo velit. Amet temporibus cum corporis molestias perspiciatis.',267310,'USD'),(25,6,'Debitis nam voluptas sit voluptas velit aut. Ut ad repudiandae ipsa possimus. Nulla vitae molestiae ipsum dolores quia qui animi dolores. Repudiandae neque incidunt temporibus.',188921,'RUB'),(26,5,'Illum repellat libero officia dolor non est. Saepe id nostrum sit voluptas nemo aut ut. Quas quidem natus nihil quis laudantium.',56307,'RUB'),(27,1,'Ab nobis voluptatibus quod similique. Molestias tempore ipsum esse quia placeat. Perferendis ipsam quis rerum laudantium in velit eos. Sint quos libero eveniet ea sit similique aut.',166589,'USD'),(28,2,'Nam quas et reprehenderit soluta omnis iusto voluptas. Qui tempore maiores culpa velit exercitationem. Et sit perferendis voluptatibus est id nostrum. Praesentium atque qui minus laboriosam.',38274,'USD'),(29,3,'Quos blanditiis assumenda vel voluptatibus earum quo. Id voluptatibus ut eligendi dolor. At sit ut doloribus voluptate sunt quia. Ut aspernatur quidem aspernatur nostrum.',97055,'RUB'),(30,11,'Voluptatem et qui et dicta inventore unde architecto. Consequuntur quibusdam aut facere atque sunt. Quia sed consequatur aut et fuga aliquid. Iste ut voluptatem eos officia recusandae.',242041,'RUB');

CREATE TABLE IF NOT EXISTS `favorite_vacancies` (
    `user_id` INT(10) UNSIGNED NOT NULL,
    `vacancy_id` INT(10) UNSIGNED NOT NULL,
    INDEX `user_id_idx` (`user_id` ASC),
    INDEX `vacancy_id_idx` (`vacancy_id` ASC),
    UNIQUE INDEX `user_vacancy_uidx` (`user_id` ASC, `vacancy_id` ASC),
    FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (`vacancy_id`) REFERENCES `vacancies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB COMMENT = 'Избранные вакансии';

INSERT INTO `favorite_vacancies` (`user_id`,`vacancy_id`) VALUES (1,1),(1,3),(1,6),(1,7),(1,8),(1,10),(1,12),(1,14),(1,15),(1,16),(1,17),(1,21),(1,22),(1,26),(1,28),(1,29),(1,30),(2,3),(2,4),(2,8),(2,10),(2,13),(2,14),(2,16),(2,21),(2,23),(2,25),(2,26),(2,27),(3,3),(3,4),(3,6),(3,7),(3,8),(3,9),(3,11),(3,15),(3,16),(3,18),(3,20),(3,22),(3,24),(3,25),(3,26),(3,27),(3,29),(3,30),(4,2),(4,5),(4,7),(4,8),(4,10),(4,12),(4,14),(4,16),(4,18),(4,19),(4,20),(4,22),(4,26),(4,29),(4,30),(5,1),(5,2),(5,3),(5,4),(5,8),(5,9),(5,10),(5,12),(5,14),(5,15),(5,16),(5,17),(5,20),(5,21),(5,22),(5,24),(5,26),(5,29),(6,5),(6,7),(6,8),(6,9),(6,10),(6,11),(6,12),(6,13),(6,14),(6,15),(6,16),(6,18),(6,19),(6,20),(6,21),(6,23),(6,24),(6,29),(6,30),(7,2),(7,3),(7,4),(7,7),(7,8),(7,9),(7,10),(7,12),(7,14),(7,17),(7,23),(7,26),(7,27),(7,28),(7,29),(7,30),(8,3),(8,8),(8,9),(8,10),(8,13),(8,14),(8,15),(8,16),(8,17),(8,18),(8,20),(8,23),(8,25),(8,29),(8,30),(9,1),(9,2),(9,3),(9,5),(9,6),(9,7),(9,8),(9,10),(9,15),(9,17),(9,20),(9,22),(9,25),(10,1),(10,4),(10,7),(10,13),(10,14),(10,16),(10,17),(10,18),(10,19),(10,20),(10,21),(10,22),(10,23);

CREATE TABLE IF NOT EXISTS `vacancy_request` (
    `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    `resume_id` INT(10) UNSIGNED NOT NULL,
    `vacancy_id` INT(10) UNSIGNED NOT NULL,
    `message` TEXT NULL DEFAULT NULL COMMENT 'Сопроводительное письмо',
    `status` ENUM('unread', 'read', 'invite', 'reject') NOT NULL DEFAULT 'unread',
    `response_message` VARCHAR(45) NULL DEFAULT NULL COMMENT 'Ответ компании на отклик',
    PRIMARY KEY (`id`),
    INDEX `resume_id_idx` (`resume_id` ASC),
    INDEX `vacancy_id_idx` (`vacancy_id` ASC),
    UNIQUE INDEX `resume_vacancy_id_uidx` (`resume_id` ASC, `vacancy_id` ASC),
    FOREIGN KEY (`resume_id`) REFERENCES `resumes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (`vacancy_id`) REFERENCES `vacancies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB COMMENT = 'Отклики на вакансии';

INSERT INTO `vacancy_request` (`id`,`resume_id`,`vacancy_id`,`message`,`status`,`response_message`) VALUES (1,8,6,'','read','Nisi aut doloremque non qui iusto est eaque. '),(2,8,1,'','unread',''),(3,9,9,'Eaque ad ut ut quidem dolorem nesciunt et neque. Veniam reiciendis et voluptatem reprehenderit dolore aut. Ut necessitatibus repellat occaecati corrupti earum inventore.','read',''),(4,2,9,'','reject','Sint maxime assumenda expedita facere praesen'),(7,7,9,'Suscipit sit qui sunt beatae delectus possimus totam. Nobis aliquid voluptatum iste. Magni dolor impedit mollitia quia officia. Quia eos qui ut veniam doloremque consequatur.','read',''),(8,5,3,'','unread','Excepturi fugiat voluptatibus fugiat ipsum qu'),(9,10,10,'Dolores perferendis eos iure a hic molestias id. Rerum non voluptas molestiae sit. Fugit libero sunt mollitia autem voluptatem quia et.','reject',''),(10,4,5,'','reject','Quod eaque expedita sequi rerum nostrum enim '),(11,7,1,'','reject','Nobis esse sed explicabo qui ipsam eius eum. '),(12,1,9,'','unread','Et minus alias est. Numquam rerum cumque opti'),(13,7,6,'','reject','Ratione alias ut consequatur reiciendis fugia'),(14,6,10,'','invite','Eveniet modi consequatur hic qui est. Minus a'),(15,3,10,'Unde eum soluta adipisci dignissimos consequatur. Quia doloribus ea dicta in odio quasi. Modi vel dolorem fugiat eum laborum mollitia. Ea placeat facere veniam consequatur.','reject','Quo rerum nesciunt provident delectus culpa c'),(16,4,1,'','reject','Est voluptas delectus eos voluptas. Officiis '),(17,8,3,'','reject','Distinctio alias magnam iusto vel aliquam dol'),(18,9,6,'Asperiores sed neque enim inventore. Reiciendis voluptas amet quos et ut laudantium. Corrupti exercitationem quis consequatur numquam in et magni sit. Qui ea nobis reprehenderit.','unread',''),(19,6,9,'Magni dicta beatae dolorem veritatis. Soluta dolorum non qui libero. Reprehenderit est repellendus maxime quidem dolor dolore.','invite',''),(20,4,2,'','unread','Nihil dolorem perferendis voluptatum et. Hic ');

CREATE TABLE IF NOT EXISTS `skills` (
    `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `name_uidx` (`name` ASC)
) ENGINE = InnoDB COMMENT = 'Скилы';

INSERT INTO `skills` (`id`,`name`) VALUES (2,'CSS'),(9,'Docker'),(7,'Git'),(1,'HTML'),(5,'JavaScript'),(6,'jQuery'),(11,'Laravel'),(4,'MYSQL'),(3,'PHP'),(10,'Sphinx'),(8,'Symphony');

CREATE TABLE IF NOT EXISTS `skills_relations` (
    `skill_id` INT(10) UNSIGNED NOT NULL,
    `resume_id` INT(10) UNSIGNED NULL DEFAULT NULL,
    `vacancy_id` INT(10) UNSIGNED NULL DEFAULT NULL,
    INDEX `skill_id_idx` (`skill_id` ASC),
    INDEX `resume_id_idx` (`resume_id` ASC),
    INDEX `vacancy_id_idx` (`vacancy_id` ASC),
    UNIQUE INDEX `skill_resume_id_uidx` (`skill_id` ASC, `resume_id` ASC),
    UNIQUE INDEX `skill_vacancy_id_uidx` (`skill_id` ASC, `vacancy_id` ASC),
    FOREIGN KEY (`skill_id`) REFERENCES `skills` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (`resume_id`) REFERENCES `resumes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (`vacancy_id`) REFERENCES `vacancies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB;

DELIMITER $$
CREATE TRIGGER `skills_relations_BEFORE_INSERT` BEFORE INSERT ON `skills_relations` FOR EACH ROW
BEGIN
    IF NEW.resume_id IS NOT NULL AND NEW.vacancy_id IS NOT NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Only one of relations can be set';
    END IF;
END$$
DELIMITER ;

# TODO skills_relations_BEFORE_UPDATE

INSERT INTO `skills_relations` (`skill_id`,`resume_id`) VALUES (1,2),(3,3),(4,6),(7,6),(6,8),(3,5),(2,6),(9,4),(11,10),(7,3),(9,9),(8,2),(4,1),(8,8),(1,9),(3,2),(4,2),(8,9),(9,7),(2,4),(8,4),(8,7),(9,2),(7,5),(6,4),(10,8),(1,1),(10,10),(11,7);
INSERT INTO `skills_relations` (`skill_id`,`vacancy_id`) VALUES (11,26),(3,11),(5,1),(2,14),(5,11),(10,19),(8,25),(2,30),(8,20),(6,28),(9,28),(8,1),(1,22),(6,22),(11,7),(7,3),(7,27),(7,24),(2,3),(3,15),(11,23),(7,25),(6,6),(5,4),(5,21),(2,7),(9,25),(4,30),(8,22),(2,27),(9,13);

CREATE TABLE IF NOT EXISTS `scopes` (
    `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `name_uidx` (`name` ASC)
) ENGINE = InnoDB COMMENT = 'Области';

INSERT INTO `scopes` (`id`,`name`) VALUES (4,'Государственные организации'),(3,'Добывающая отрасль'),(2,'ЖКХ'),(1,'Информационные технологии, системная интеграция, интернет'),(5,'Искусство, культура');

CREATE TABLE IF NOT EXISTS `scopes_relations` (
    `scope_id` INT(10) UNSIGNED NOT NULL,
    `resume_experience_id` INT(10) UNSIGNED NULL DEFAULT NULL,
    `company_id` INT(10) UNSIGNED NULL DEFAULT NULL,
    INDEX `scope_id_idx` (`scope_id` ASC),
    INDEX `resume_experience_id_idx` (`resume_experience_id` ASC),
    INDEX `company_id_fk` (`company_id` ASC),
    UNIQUE INDEX `scope_resume_exp_id_uidx` (`scope_id` ASC, `resume_experience_id` ASC),
    UNIQUE INDEX `scope_company_id_uidx` (`scope_id` ASC, `company_id` ASC),
    FOREIGN KEY (`scope_id`) REFERENCES `scopes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (`resume_experience_id`) REFERENCES `resume_experience` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB;

DELIMITER $$
CREATE TRIGGER `scopes_relations_BEFORE_INSERT` BEFORE INSERT ON `scopes_relations` FOR EACH ROW
BEGIN
    IF NEW.resume_experience_id IS NOT NULL AND NEW.company_id IS NOT NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Only one of relations can be set';
    END IF;
END$$
DELIMITER ;

# TODO scopes_relations_BEFORE_UPDATE

INSERT INTO `scopes_relations` (`scope_id`,`resume_experience_id`) VALUES (1,24),(1,7),(5,23),(2,5),(2,26),(4,16),(4,3),(1,25),(4,15),(2,3),(5,7),(2,18),(2,14),(2,20),(5,4),(1,3),(2,19),(5,8),(3,25),(4,20),(2,7),(3,18),(2,28),(3,28),(3,26),(1,13),(2,6),(3,6),(2,29),(1,1),(5,20),(5,17),(5,10),(4,23),(1,16),(1,6),(4,22),(3,1),(4,1),(5,28),(3,10),(1,28),(3,21),(3,27),(2,9),(4,8),(5,26),(5,14),(3,20),(5,18),(2,8),(4,25),(1,14),(4,19),(2,21),(1,12),(1,17),(3,4),(1,27),(5,24),(3,11);
INSERT INTO `scopes_relations` (`scope_id`,`company_id`) VALUES (5,8),(4,14),(2,8),(4,6),(3,1),(1,1),(2,1),(1,10),(4,10),(2,12),(2,6),(1,7),(2,4),(3,11),(2,3),(4,1),(5,4),(3,7),(4,7),(2,7),(2,10),(1,8),(5,2),(2,11),(2,2),(1,4),(5,3),(5,6),(4,15),(1,11),(3,12),(3,3),(3,9),(4,13),(3,5),(3,14),(4,2),(2,9),(3,4),(5,12),(1,3),(5,9),(4,8),(5,5),(4,4),(3,2),(3,8),(1,2),(1,12),(5,11);

create view `top_skill_users` as
select u.id, u.firstname, u.lastname, u.middlename, count(distinct s.name) as skills_cnt,  group_concat(distinct s.name) as skills
from users u
     join resumes r on u.id=r.user_id
     join skills_relations sr on sr.resume_id=r.id
     join skills s on sr.skill_id=s.id
group by u.id
order by skills_cnt desc
limit 5

# TODO one more view

# TODO stored procedure

# TODO stored function
