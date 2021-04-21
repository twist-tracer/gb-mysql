CREATE SCHEMA `hh` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

use `hh`;

CREATE TABLE IF NOT EXISTS `users` (
    `id` INT(10) UNSIGNED NOT NULL,
    `firstname` VARCHAR(255) NOT NULL,
    `lastname` VARCHAR(255) NULL DEFAULT NULL,
    `middlename` VARCHAR(255) NULL DEFAULT NULL,
    `email` VARCHAR(255) NOT NULL,
    `phone` BIGINT(15) NOT NULL,
    PRIMARY KEY (`id`))
ENGINE = InnoDB
COMMENT = 'Пользователи';

CREATE TABLE IF NOT EXISTS `companies` (
    `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `description` TEXT NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `name_uidx` (`name` ASC))
ENGINE = InnoDB
COMMENT = 'Компании';

CREATE TABLE IF NOT EXISTS `resumes` (
    `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id` INT(10) UNSIGNED NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `about` TEXT NULL DEFAULT NULL,
    `salary` INT(10) UNSIGNED NULL DEFAULT NULL,
    `salary_currency` ENUM('USD', 'RUB', 'EUR') NOT NULL DEFAULT 'RUB',
    PRIMARY KEY (`id`),
    INDEX `user_id_idx` (`user_id` ASC),
    CONSTRAINT `user_id_fk`
      FOREIGN KEY (`user_id`)
          REFERENCES `users` (`id`)
          ON DELETE NO ACTION
          ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Резюме';

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
    CONSTRAINT `resume_id_fk`
        FOREIGN KEY (`resume_id`)
            REFERENCES `resumes` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Опыт работы';

CREATE TABLE IF NOT EXISTS `vacancies` (
    `id` INT NOT NULL,
    `company_id` INT(10) UNSIGNED NOT NULL,
    `description` TEXT NULL,
    `salary` INT(10) UNSIGNED NULL DEFAULT NULL,
    `salary_currency` ENUM('USD', 'RUB', 'EUR') NOT NULL DEFAULT 'RUB',
    PRIMARY KEY (`id`),
    INDEX `company_id_idx` (`company_id` ASC),
    CONSTRAINT `company_id`
        FOREIGN KEY (`company_id`)
            REFERENCES `companies` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Вакансии';

CREATE TABLE IF NOT EXISTS `favorite_vacancies` (
    `user_id` INT(10) UNSIGNED NOT NULL,
    `vacancy_id` INT(10) UNSIGNED NOT NULL,
    INDEX `user_id_idx` (`user_id` ASC),
    INDEX `vacancy_id_idx` (`vacancy_id` ASC),
    UNIQUE INDEX `user_vacancy_uidx` (`user_id` ASC, `vacancy_id` ASC),
    CONSTRAINT `user_id`
     FOREIGN KEY (`user_id`)
         REFERENCES `users` (`id`)
         ON DELETE NO ACTION
         ON UPDATE NO ACTION,
    CONSTRAINT `vacancy_id`
     FOREIGN KEY (`vacancy_id`)
         REFERENCES `vacancies` (`id`)
         ON DELETE NO ACTION
         ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Избранные вакансии';

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
    CONSTRAINT `resume_id`
      FOREIGN KEY (`resume_id`)
          REFERENCES `resumes` (`id`)
          ON DELETE NO ACTION
          ON UPDATE NO ACTION,
    CONSTRAINT `vacancy_id`
      FOREIGN KEY (`vacancy_id`)
          REFERENCES `vacancies` (`company_id`)
          ON DELETE NO ACTION
          ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Отклики на вакансии';

CREATE TABLE IF NOT EXISTS `skills` (
    `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `name_uidx` (`name` ASC))
ENGINE = InnoDB
COMMENT = 'Скилы';

CREATE TABLE IF NOT EXISTS `skills_relations` (
    `skill_id` INT(10) UNSIGNED NOT NULL,
    `resume_id` INT(10) UNSIGNED NULL DEFAULT NULL,
    `vacancy_id` INT(10) UNSIGNED NULL DEFAULT NULL,
    INDEX `skill_id_idx` (`skill_id` ASC),
    INDEX `resume_id_idx` (`resume_id` ASC),
    INDEX `vacancy_id_idx` (`vacancy_id` ASC),
    CONSTRAINT `skill_id_fk`
        FOREIGN KEY (`skill_id`)
            REFERENCES `skills` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    CONSTRAINT `resume_id_fk`
       FOREIGN KEY (`resume_id`)
           REFERENCES `resumes` (`id`)
           ON DELETE NO ACTION
           ON UPDATE NO ACTION,
    CONSTRAINT `vacancy_id_fk`
       FOREIGN KEY (`vacancy_id`)
           REFERENCES `vacancies` (`company_id`)
           ON DELETE NO ACTION
           ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `scopes` (
    `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `name_uidx` (`name` ASC))
ENGINE = InnoDB
COMMENT = 'Области';

CREATE TABLE IF NOT EXISTS `scopes_relations` (
    `scope_id` INT(10) UNSIGNED NOT NULL,
    `resume_experience_id` INT(10) UNSIGNED NULL DEFAULT NULL,
    `company_id` INT(10) UNSIGNED NULL DEFAULT NULL,
    INDEX `scope_id_idx` (`scope_id` ASC),
    INDEX `resume_experience_id_idx` (`resume_experience_id` ASC),
    INDEX `company_id_fk` (`company_id` ASC),
    CONSTRAINT `scope_id_fk`
       FOREIGN KEY (`scope_id`)
           REFERENCES `scopes` (`id`)
           ON DELETE NO ACTION
           ON UPDATE NO ACTION,
    CONSTRAINT `resume_experience_id_fk`
       FOREIGN KEY (`resume_experience_id`)
           REFERENCES `resume_experience` (`id`)
           ON DELETE NO ACTION
           ON UPDATE NO ACTION,
    CONSTRAINT `company_id_fk`
       FOREIGN KEY (`company_id`)
           REFERENCES `companies` (`id`)
           ON DELETE NO ACTION
           ON UPDATE NO ACTION)
ENGINE = InnoDB;
