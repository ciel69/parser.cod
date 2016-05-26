-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Май 26 2016 г., 23:45
-- Версия сервера: 10.1.13-MariaDB
-- Версия PHP: 7.0.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Структура таблицы `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(11) NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Структура таблицы `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Структура таблицы `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Структура таблицы `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Структура таблицы `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Структура таблицы `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Структура таблицы `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Структура таблицы `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Структура таблицы `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Структура таблицы `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

-- --------------------------------------------------------

--
-- Структура таблицы `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Структура таблицы `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Структура таблицы `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT '0',
  `x` float UNSIGNED NOT NULL DEFAULT '0',
  `y` float UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Структура таблицы `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Структура таблицы `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Структура таблицы `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Структура таблицы `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Дамп данных таблицы `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2016-04-26 19:38:56', '{"lang":"ru","collation_connection":"utf8mb4_unicode_ci"}');

-- --------------------------------------------------------

--
-- Структура таблицы `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Структура таблицы `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Индексы таблицы `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Индексы таблицы `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Индексы таблицы `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Индексы таблицы `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Индексы таблицы `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Индексы таблицы `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Индексы таблицы `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Индексы таблицы `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Индексы таблицы `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Индексы таблицы `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Индексы таблицы `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Индексы таблицы `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Индексы таблицы `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Индексы таблицы `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Индексы таблицы `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Индексы таблицы `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Индексы таблицы `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;--
-- База данных: `reviews`
--
CREATE DATABASE IF NOT EXISTS `reviews` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `reviews`;

-- --------------------------------------------------------

--
-- Структура таблицы `default_property`
--

CREATE TABLE `default_property` (
  `id` int(11) NOT NULL,
  `lvl_property` int(11) DEFAULT NULL,
  `type_property` varchar(255) DEFAULT NULL,
  `class_property` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `placeholder_property` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `default_property`
--

INSERT INTO `default_property` (`id`, `lvl_property`, `type_property`, `class_property`, `value`, `placeholder_property`) VALUES
(1, 1, 'text', 'name_source', '', 'Название источника'),
(2, 2, 'text', 'name_parser', '', 'Название категории'),
(3, 3, 'textarea', 'url', '', 'Ссылка на сайт'),
(4, 4, 'text', 'class_item', '', 'Класс элемента'),
(5, 5, 'text', 'next_link', '', 'класс paginator''a'),
(6, 6, 'text', 'name_item', '', 'название товара'),
(7, 7, 'text', 'code_item', '', 'код товара'),
(8, 8, 'textarea', 'exceptions', '', 'исключения'),
(9, 9, 'textarea', 'link_reviews', '', 'шаблон ссылки на отзывы'),
(10, 10, 'text', 'class_review', '', 'класс текста отзыва'),
(11, 11, 'text', 'class_page_rev', '', 'След страница отзывов'),
(12, 12, 'file', 'img_filter', NULL, 'Пример картинки'),
(13, 13, 'text', 'link_img', NULL, 'Ссылка на картинку'),
(14, 14, 'text', 'table_property', NULL, 'Таблица свойств');

-- --------------------------------------------------------

--
-- Структура таблицы `groups`
--

CREATE TABLE `groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'members', 'General User'),
(1, 'admin', 'Administrator'),
(2, 'members', 'General User'),
(1, 'admin', 'Administrator'),
(2, 'members', 'General User'),
(1, 'admin', 'Administrator'),
(2, 'members', 'General User'),
(1, 'admin', 'Administrator'),
(2, 'members', 'General User');

-- --------------------------------------------------------

--
-- Структура таблицы `item_rev`
--

CREATE TABLE `item_rev` (
  `id` int(11) NOT NULL,
  `id_catagory` int(11) DEFAULT NULL,
  `name` text,
  `img` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `item_rev`
--

INSERT INTO `item_rev` (`id`, `id_catagory`, `name`, `img`) VALUES
(1, 36, 'Телевизор LG 43LH560V', '/color/img/Tehnoshoe/36/10009936b1.jpg\n/color/img/Tehnoshoe/36/10009936b1.jpg\n'),
(2, 36, 'Телевизор Sony KDL32RD433', '/color/img/Tehnoshoe/36/10009966b.jpg\n/color/img/Tehnoshoe/36/10009966b1.jpg\n/color/img/Tehnoshoe/36/10009966b2.jpg\n/color/img/Tehnoshoe/36/10009966b.jpg\n/color/img/Tehnoshoe/36/10009966b1.jpg\n/color/img/Tehnoshoe/36/10009966b2.jpg\n'),
(3, 36, 'Телевизор Horizont 24LE3181', '/color/img/Tehnoshoe/36/10009969b.jpg\n/color/img/Tehnoshoe/36/10009969b1.jpg\n/color/img/Tehnoshoe/36/10009969b2.jpg\n/color/img/Tehnoshoe/36/10009969b3.jpg\n/color/img/Tehnoshoe/36/10009969b.jpg\n/color/img/Tehnoshoe/36/10009969b1.jpg\n/color/img/Tehnoshoe/36/10009969b2.jpg\n/color/img/Tehnoshoe/36/10009969b3.jpg\n'),
(4, 36, 'Телевизор Horizont 19LE5206D', '/color/img/Tehnoshoe/36/10009974b.jpg\n/color/img/Tehnoshoe/36/10009974b1.jpg\n/color/img/Tehnoshoe/36/10009974b.jpg\n/color/img/Tehnoshoe/36/10009974b1.jpg\n'),
(5, 36, 'Телевизор Horizont 15LE3416', '/color/img/Tehnoshoe/36/10009973b.jpg\n/color/img/Tehnoshoe/36/10009973b1.jpg\n/color/img/Tehnoshoe/36/10009973b.jpg\n/color/img/Tehnoshoe/36/10009973b1.jpg\n'),
(6, 36, 'Телевизор Supra STV-LC40T840WL', '/color/img/Tehnoshoe/36/10009654b1.jpg\n/color/img/Tehnoshoe/36/10009654b2.jpg\n/color/img/Tehnoshoe/36/10009654b3.jpg\n/color/img/Tehnoshoe/36/10009654b1.jpg\n/color/img/Tehnoshoe/36/10009654b2.jpg\n/color/img/Tehnoshoe/36/10009654b3.jpg\n'),
(7, 36, 'Телевизор Samsung UE40J6330AU', '/color/img/Tehnoshoe/36/10007928b1.jpg\n/color/img/Tehnoshoe/36/10007928b3.jpg\n/color/img/Tehnoshoe/36/10007928b4.jpg\n/color/img/Tehnoshoe/36/10007928b6.jpg\n/color/img/Tehnoshoe/36/10007928b1.jpg\n/color/img/Tehnoshoe/36/10007928b3.jpg\n/color/img/Tehnoshoe/36/10007928b4.jpg\n/color/img/Tehnoshoe/36/10007928b6.jpg\n'),
(8, 36, 'Телевизор Sony KDL24W605A White', '/color/img/Tehnoshoe/36/10005116b1.jpg\n/color/img/Tehnoshoe/36/10005116b3.jpg\n/color/img/Tehnoshoe/36/10005116b1.jpg\n/color/img/Tehnoshoe/36/10005116b3.jpg\n'),
(9, 36, 'Телевизор Samsung UE40J6200AU', '/color/img/Tehnoshoe/36/10007913b1.jpg\n/color/img/Tehnoshoe/36/10007913b2.jpg\n/color/img/Tehnoshoe/36/10007913b3.jpg\n/color/img/Tehnoshoe/36/10007913b1.jpg\n/color/img/Tehnoshoe/36/10007913b2.jpg\n/color/img/Tehnoshoe/36/10007913b3.jpg\n'),
(10, 36, 'Телевизор Samsung UE32J6500AU', '/color/img/Tehnoshoe/36/10008042b.jpg\n/color/img/Tehnoshoe/36/10008042b1.jpg\n/color/img/Tehnoshoe/36/10008042b2.jpg\n/color/img/Tehnoshoe/36/10008042b3.jpg\n/color/img/Tehnoshoe/36/10008042b4.jpg\n/color/img/Tehnoshoe/36/10008042b6.jpg\n/color/img/Tehnoshoe/36/10008042b.jpg\n/color/img/Tehnoshoe/36/10008042b1.jpg\n/color/img/Tehnoshoe/36/10008042b2.jpg\n/color/img/Tehnoshoe/36/10008042b3.jpg\n/color/img/Tehnoshoe/36/10008042b4.jpg\n/color/img/Tehnoshoe/36/10008042b6.jpg\n'),
(11, 36, 'Телевизор Sony KDL43W756C', '/color/img/Tehnoshoe/36/10008170b.jpg\n/color/img/Tehnoshoe/36/10008170b1.jpg\n/color/img/Tehnoshoe/36/10008170b2.jpg\n/color/img/Tehnoshoe/36/10008170b3.jpg\n/color/img/Tehnoshoe/36/10008170b4.jpg\n/color/img/Tehnoshoe/36/10008170b5.jpg\n/color/img/Tehnoshoe/36/10008170b6.jpg\n/color/img/Tehnoshoe/36/10008170b.jpg\n/color/img/Tehnoshoe/36/10008170b1.jpg\n/color/img/Tehnoshoe/36/10008170b2.jpg\n/color/img/Tehnoshoe/36/10008170b3.jpg\n/color/img/Tehnoshoe/36/10008170b4.jpg\n/color/img/Tehnoshoe/36/10008170b5.jpg\n/color/img/Tehnoshoe/36/10008170b6.jpg\n'),
(12, 36, 'Телевизор LG 43LF630V', '/color/img/Tehnoshoe/36/10007755b1.jpg\n/color/img/Tehnoshoe/36/10007755b2.jpg\n/color/img/Tehnoshoe/36/10007755b4.jpg\n/color/img/Tehnoshoe/36/10007755b1.jpg\n/color/img/Tehnoshoe/36/10007755b2.jpg\n/color/img/Tehnoshoe/36/10007755b4.jpg\n'),
(13, 36, 'Телевизор Samsung UE40J5510AU', ''),
(14, 36, 'Телевизор Philips 32PFT4100/60', '/color/img/Tehnoshoe/36/10007978b.jpg\n/color/img/Tehnoshoe/36/10007978b1.jpg\n/color/img/Tehnoshoe/36/10007978b2.jpg\n/color/img/Tehnoshoe/36/10007978b3.jpg\n/color/img/Tehnoshoe/36/10007978b4.jpg\n/color/img/Tehnoshoe/36/10007978b5.jpg\n/color/img/Tehnoshoe/36/10007978b.jpg\n/color/img/Tehnoshoe/36/10007978b1.jpg\n/color/img/Tehnoshoe/36/10007978b2.jpg\n/color/img/Tehnoshoe/36/10007978b3.jpg\n/color/img/Tehnoshoe/36/10007978b4.jpg\n/color/img/Tehnoshoe/36/10007978b5.jpg\n'),
(15, 36, 'Телевизор Sony KDL50W805C', '/color/img/Tehnoshoe/36/10008150b.jpg\n/color/img/Tehnoshoe/36/10008150b1.jpg\n/color/img/Tehnoshoe/36/10008150b2.jpg\n/color/img/Tehnoshoe/36/10008150b3.jpg\n/color/img/Tehnoshoe/36/10008150b4.jpg\n/color/img/Tehnoshoe/36/10008150b5.jpg\n/color/img/Tehnoshoe/36/10008150b.jpg\n/color/img/Tehnoshoe/36/10008150b1.jpg\n/color/img/Tehnoshoe/36/10008150b2.jpg\n/color/img/Tehnoshoe/36/10008150b3.jpg\n/color/img/Tehnoshoe/36/10008150b4.jpg\n/color/img/Tehnoshoe/36/10008150b5.jpg\n'),
(16, 36, 'Телевизор Sony KDL40WD653', '/color/img/Tehnoshoe/36/10009964b.jpg\n/color/img/Tehnoshoe/36/10009964b1.jpg\n/color/img/Tehnoshoe/36/10009964b2.jpg\n/color/img/Tehnoshoe/36/10009964b3.jpg\n/color/img/Tehnoshoe/36/10009964b4.jpg\n/color/img/Tehnoshoe/36/10009964b5.jpg\n/color/img/Tehnoshoe/36/10009964b.jpg\n/color/img/Tehnoshoe/36/10009964b1.jpg\n/color/img/Tehnoshoe/36/10009964b2.jpg\n/color/img/Tehnoshoe/36/10009964b3.jpg\n/color/img/Tehnoshoe/36/10009964b4.jpg\n/color/img/Tehnoshoe/36/10009964b5.jpg\n');

-- --------------------------------------------------------

--
-- Структура таблицы `link_items`
--

CREATE TABLE `link_items` (
  `id` int(11) NOT NULL,
  `id_parser` int(11) DEFAULT NULL,
  `url` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `list_parser`
--

CREATE TABLE `list_parser` (
  `id` int(11) NOT NULL,
  `value` varchar(145) DEFAULT NULL,
  `id_source` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `list_parser`
--

INSERT INTO `list_parser` (`id`, `value`, `id_source`) VALUES
(1, 'Комплектующие', 10),
(17, 'Смартфоны', 7),
(19, 'Смарт-часы', 6),
(21, 'Смарт-часы', 8),
(23, 'Бытовая техника', 10),
(24, 'Смартфоны', 10),
(29, 'Компьютеры', 10),
(30, 'Игровые приставки', 10),
(31, 'Телевизор', 3),
(32, 'Компьютеры', 3),
(36, 'Телевизор', 9);

-- --------------------------------------------------------

--
-- Структура таблицы `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `version` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`version`) VALUES
(0);

-- --------------------------------------------------------

--
-- Структура таблицы `prop_parser`
--

CREATE TABLE `prop_parser` (
  `id` int(11) NOT NULL,
  `id_parser` int(11) DEFAULT NULL,
  `value` text,
  `name_property` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `prop_parser`
--

INSERT INTO `prop_parser` (`id`, `id_parser`, `value`, `name_property`) VALUES
(14, 23, 'link', 'url'),
(15, 23, 'items', 'class_item'),
(16, 23, 'page', 'next_link'),
(17, 23, 'h1', 'name_item'),
(18, 23, 'code', 'code_item'),
(19, 23, 'exec', 'exceptions'),
(20, 23, 'templates', 'link_reviews'),
(21, 23, 'rew', 'class_review'),
(30, 30, 'link', 'url'),
(31, 30, 'items', 'class_item'),
(32, 30, 'page', 'next_link'),
(33, 30, 'h1', 'name_item'),
(34, 30, 'code', 'code_item'),
(35, 30, 'exec', 'exceptions'),
(36, 30, 'templates', 'link_reviews'),
(37, 30, 'rew', 'class_review'),
(38, 0, 'link', 'url'),
(39, 0, 'items', 'class_item'),
(40, 0, 'page', 'next_link'),
(41, 0, 'h1', 'name_item'),
(42, 0, 'code', 'code_item'),
(43, 0, 'exec', 'exceptions'),
(44, 0, 'templates', 'link_reviews'),
(45, 0, 'rew', 'class_review'),
(46, 1, 'link', 'url'),
(47, 1, 'items', 'class_item'),
(48, 1, 'page', 'next_link'),
(49, 1, 'h1', 'name_item'),
(50, 1, 'code1', 'code_item'),
(51, 1, 'exec', 'exceptions'),
(52, 1, 'templates', 'link_reviews'),
(53, 1, 'rew', 'class_review'),
(62, 22, 'http://www.mvideo.ru/smartfony-i-svyaz/smartfony-205', 'url'),
(63, 22, 'a.product-tile-title-link', 'class_item'),
(64, 22, 'a.font-icon.icon-right-open.ico-pagination-next', 'next_link'),
(65, 22, 'h1', 'name_item'),
(66, 22, 'p.product-code', 'code_item'),
(67, 22, 'Код  ', 'exceptions'),
(68, 22, '/sitebuilder/blocks/browse/product-detail/tabs/product-reviews.jsp?productId=id_pars_item&sortBy=-published&page=1', 'link_reviews'),
(69, 22, '.product-review-content p', 'class_review'),
(78, 34, 'http://www.mvideo.ru/televizory-i-cifrovoe-tv/televizory-65/f/category=zhk-led-televizory-990', 'url'),
(79, 34, 'a.product-tile-title-link', 'class_item'),
(80, 34, 'a.font-icon.icon-right-open.ico-pagination-next', 'next_link'),
(81, 34, 'h1', 'name_item'),
(82, 34, 'p.product-code', 'code_item'),
(83, 34, 'Код  ', 'exceptions'),
(84, 34, '/sitebuilder/blocks/browse/product-detail/tabs/product-reviews.jsp?productId=id_pars_item&sortBy=-published&page=1', 'link_reviews'),
(85, 34, '.product-review-content p', 'class_review'),
(86, 34, 'li.pagination-item.active', 'class_page_rev'),
(108, 22, 'next', 'class_page_rev'),
(109, 22, '/color/img/10007817b.jpg', 'img_filter'),
(110, 19, 'link_dns', 'url'),
(111, 19, '/color/img/439666ae726cb2719942298252b282b94f5a8171eec8933668c029976f6d1350.jpg', 'img_filter'),
(114, 21, 'http://www.mvideo.ru/televizory-i-cifrovoe-tv/televizory-65/f/category=zhk-led-televizory-990', 'url'),
(115, 21, 'a.product-tile-title-link', 'class_item'),
(116, 21, 'a.font-icon.icon-right-open.ico-pagination-next', 'next_link'),
(117, 21, 'h1', 'name_item'),
(118, 21, 'p.product-code', 'code_item'),
(119, 21, 'Код  ', 'exceptions'),
(120, 21, '/sitebuilder/blocks/browse/product-detail/tabs/product-reviews.jsp?productId=id_pars_item&sortBy=-published&page=1', 'link_reviews'),
(121, 21, '.product-review-content p', 'class_review'),
(122, 21, 'li.pagination-item.active', 'class_page_rev'),
(129, 36, '36', 'id_parser'),
(130, 36, 'http://www.mvideo.ru/televizory-i-cifrovoe-tv/televizory-65/f/category=zhk-led-televizory-990', 'url'),
(131, 36, 'a.product-tile-title-link', 'class_item'),
(132, 36, 'a.font-icon.icon-right-open.ico-pagination-next', 'next_link'),
(133, 36, 'h1', 'name_item'),
(134, 36, 'p.product-code', 'code_item'),
(135, 36, 'Код  ', 'exceptions'),
(136, 36, '/sitebuilder/blocks/browse/product-detail/tabs/product-reviews.jsp?productId=id_pars_item&sortBy=-published&page=1', 'link_reviews'),
(137, 36, '.product-review-content p', 'class_review'),
(138, 36, 'li.pagination-item.active', 'class_page_rev'),
(139, 36, '/color/img/001.jpg', 'img_filter'),
(140, 36, 'a.wrapper[href]', 'link_img'),
(141, 36, 'table.table.table-striped.product-details-table tr', 'table_property');

-- --------------------------------------------------------

--
-- Структура таблицы `property_items`
--

CREATE TABLE `property_items` (
  `id` int(11) NOT NULL,
  `id_parser` int(11) DEFAULT NULL,
  `name` text,
  `value` text,
  `tr_name` text,
  `id_item` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `property_items`
--

INSERT INTO `property_items` (`id`, `id_parser`, `name`, `value`, `tr_name`, `id_item`) VALUES
(34, 36, 'Гарантия', 'Не сломается', NULL, NULL),
(35, 36, 'Страна', 'Страна', NULL, NULL),
(36, 36, 'Диагональ экрана', 'Диагональ экрана', NULL, NULL),
(37, 36, 'Разрешение экрана', 'Разрешение экрана', NULL, NULL),
(38, 36, 'Технология', 'Технология', NULL, NULL),
(39, 36, 'Цифровой ТВ тюнер', 'Цифровой тюнер', NULL, NULL),
(40, 36, 'Воспр. медиа с USB', 'Воспр. с USB', NULL, NULL),
(41, 36, 'Настенное крепление', 'Настенное крепление', NULL, NULL),
(42, 36, 'Габаритные размеры (В*Ш*Г)', 'Габаритные размеры', NULL, NULL),
(368, NULL, 'Не сломается', '1 год', NULL, 2),
(369, NULL, 'Страна', 'Малайзия', NULL, 2),
(370, NULL, 'Диагональ экрана', '32"(81.2 см)', NULL, 2),
(371, NULL, 'Разрешение экрана', '1366x768 Пикс (HD Ready)', NULL, 2),
(372, NULL, 'Технология', '200 Гц', NULL, 2),
(373, NULL, 'Цифровой тюнер', 'DVB-T/T2/C', NULL, 2),
(374, NULL, 'Запись с ТВ на USB устройство', 'Да', NULL, 2),
(375, NULL, 'Воспр. с USB', 'Да', NULL, 2),
(459, NULL, 'Настенное крепление', 'доп.опция (VESA 200)', NULL, 2),
(498, NULL, 'Не сломается', '1 год', NULL, 3),
(499, NULL, 'Страна', 'Беларусь', NULL, 3),
(500, NULL, 'Диагональ экрана', '24"(60.9 см)', NULL, 3),
(501, NULL, 'Разрешение экрана', '1366x768 Пикс (HD Ready)', NULL, 3),
(502, NULL, 'Настенное крепление', 'доп.опция (VESA 100)', NULL, 3),
(503, NULL, 'Габаритные размеры (без подставки)', '32*55*8 см', NULL, 3),
(504, NULL, 'Не сломается', '1 год', NULL, 4),
(505, NULL, 'Страна', 'Беларусь', NULL, 4),
(506, NULL, 'Диагональ экрана', '19"(48.2 см)', NULL, 4),
(507, NULL, 'Разрешение экрана', '1366x768 Пикс (HD Ready)', NULL, 4),
(508, NULL, 'Цифровой тюнер', 'DVB-T2/C', NULL, 4),
(509, NULL, 'Настенное крепление', 'доп.опция (VESA 100)', NULL, 4),
(510, NULL, 'Габаритные размеры (без подставки)', '26.2*43.8*4.1см', NULL, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `rev_table`
--

CREATE TABLE `rev_table` (
  `id` int(11) NOT NULL,
  `id_items` int(11) DEFAULT NULL,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `rev_table`
--

INSERT INTO `rev_table` (`id`, `id_items`, `value`) VALUES
(1, 1, 'В прошлом месяце им обзавелся - ну очень нравится! Круто показывает, не тянет картинку по сторонам, очень хорошая резкость и контраст, я, по большому счету, особо и не настраивал, только режим звука подходящий выбрал, а экран и на дефолте отлично справляется со своими задачами)) Смарт-Тв идет без вислова, текст русифицирован, так что легко разобраться с тем, что происходит с настройками или когда сообщение какое-то всплывает. Только дэушка мне показалась хлипковатой, но это уже дело вкуса. Итог - соответствие качества и заявленной цены тут очень неплохое))'),
(2, 2, 'Классный телик с модной подставкой, внешне мне больше всего приглянулся из предложенных вариантов от Соньки) Экран не выглядит маленьким, хотя диагональ у него не самая большая - матчи футбольные смотреть удобно с дивана при расстоянии в метра два) И цвета отличные, блеклости не заметил. Нравится очень, что рамка темная по периметру экрана отсутствует, а то сталкивался уже с теликами, которые урезали изображение за счет этого конкретно. Вот только не заметил, чтобы шумоподавление как-то особо на звук влияло, ну да ладно. Доволен приобретением, служит уже полгода и ничего тьфу-тьфу не сломалось)'),
(3, 3, 'Плоский и очень симпатичный по дизайну телевизор, присматривались к Элджи, но муж выбрал этот, как оказалось, совсем не зря! Очень функциональный и удобный в управлении, воспроизводит скачанные с торрентов фильмы на ура, мы всю видеотеку почти в divx держим, так проблем с проигрыванием кино пока не возникало. И музыку в мп3 я на нем постоянно слушаю, благо звук тут огого - объемный такой, на всю квартиру слышно)) Единственный минус - сильно пыль притягивает, почти каждый день его протираю, но это реально незначительный недостаток, все остальное у телевизора в полном порядке. Могу сказать, что денежку свою отрабатывает по полной)'),
(4, 4, 'Нам его подарили на свадьбу, вполне приличное качество - ничем не хуже зарубежных марок, как оказалось)) Удобно регулируется дэушкой, изображение под себя можно настроить - опций для этого предостаточно) Несмотря на то, что динамики у него расположены сзади - звучит он классно, во всяком случае в гостиной на 15 квадратов звук на максимум выставлять не приходится. Внешне он простой, без наворотов, но смотрится аккуратно, мы его как раз в гарнитурную нишу поставили и он поместился там идеально. Из функций ну очень понравилась фишка с записью на юсб, все телешоу теперь записываю, если смотреть нету времени)) В целом - нареканий нет, производитель не подкачал с характеристиками)'),
(5, 5, 'Отличный телевизор, как по мне, если нужен простой функционал с неплохой картинкой) Показывает четко, нет эффекта размытых лиц или дрожания, что сразу порадовало. Разрешение, конечно, не фул-эйчди, но картинка хорошая, цвета соответствуют реальности и четкость высокая, вдобавок черный цвет не искажается в сторону серого, короче - глаза ничего не режет. Есть блики в солнечную погоду, но за такую стоимость это простительно, стараюсь штору приспособить просто, чтобы солнце на экран не падало. Диапазон звука вполне нормальный, чтобы все слышно было, на большой громкости нет шипения или гула. Взял его для съемной квартиры, не хотелось тратиться на что-то супер-раскрученное, а этот телик вполне достойный внимания, мне лично подошел)'),
(6, 6, 'Решил родителей обрадовать новым телевизором. Смотрят они его реально часто, но у них достаточно старенькая модель была, так что прикупил им такую Супру. Совершенно не жалуются, они в полном восторге. Мама так вообще. Говорит что все ее передачи чуть ли не окрасились в более естественные цвета, а отец говорит, что все настолько четко отображается, что он вообще не щурится. У обоих глаза не болят при длительном просмотре. С пультом управления никаких проблем нет, телевизор шустро откликается на него и переключает каналы. Обращал внимание и на то, чтобы телевизор был русифицирован, потому что мои родители совсем не знают иностранных языков. С динамиками тут тоже кстати все ок, родители еще не жаловались на звук никогда.'),
(7, 7, 'Привыкнуть к пульту, и настроить под себя. Пока не много приложений в смарт тв. Всё работает давольно шустро, даже инт.эксплорер. '),
(8, 7, 'Не покупайте. Купили samsung ue40j6330, привезли домой, установили, вроде работал smart тупил страшно пульт маленький не удобный, wifi ловит отвратительно. Мало того что он глючит так через 1,5 часа после покупки сломался и вообще перестал работать. Хорошо что м видео было не все равно и они поменялинам его. Это уже второй телевизор samsung который мы сдали до этого у нас был ue40h6203ak проработал этот телевизор всего 5 месяцев.'),
(9, 7, 'Купил не давно, хороший телевизор. Проблем никаких не возникло. Качество картинки и звука на высшем уровне. Сразу бросается в глаза наличие быстрого процессора, каналы очень быстро переключаются, даже HD, без малейших задержек.'),
(10, 7, 'Купили вчера весь вечер с ним игрались! Куча полезных функций, очень довольны!!! Полностью синхронизируется с телефоном и управляется им же.'),
(11, 7, 'Пользуемся уже полгода. Отличный телевизор! Картинка супер четкая. Каналы переключает быстро. Wi-Fi ловит отлично. Настроили сами быстро. К пульту надо привыкнуть, последнее время стал притормаживать(грешу на то, что дочка роняет часто), но это не страшно. За свои деньги - отличный телевизор.'),
(12, 7, 'Вчера купили, сегодня доставили. За 3 минуты собрали и подключили, от аналоговой антенны нашел 20 каналов цифровых и обычных. Картинка супер, качество отменное, пульт легко освоили, ничего сложного. Получаем удовольствие от просмотра. Выбор стоял между лыжами и Самсунг, почитав отзывы в интернете, взвесив все за и против, остались довольны покупкой. Рекомендую!'),
(13, 7, 'Спасибо М.Видео, порекомендовали отличный телевизор по акции. Четкая картинка, быстро разобрались в меню (к пульту нужно привыкнуть), интернет в телевизоре нам настроили в магазине, дома сразу подключились к wi-fi без проблем. Смотрели онлайн фильмы, пользовались skype, все работает очень быстро. Очень довольны покупкой!'),
(14, 7, 'Крайне рад покупке, спасибо огромное продавцу!!! М.Видео СПАСИБО!!! Телевизор отличный, очень удобный пульт, картинка клёвая!!!'),
(15, 7, 'Купил в ноябре 2015, прочитал очень много отзывов, обзоров, телек супер! Smart tv не тупой, работает все хорошо, гонял уже во всем, берите не задумываясь, в соотношении до 45 лучший выбор. '),
(16, 7, 'В целом доволен. в первый день не мог нарадоваться и минусов не увидел.НО. Одно кинцо правда смутило в FullHD. но подумал запись не очень. А потом и правда стал замечать грешок такой: когда фильмы с диска смотрю, ощущения как будто слишком быстро показывает. как будто перемотка небольшая. кажется что много кадров промотал, а потом чуть замедлил их, чтобы со звуком синхронизация осталась. в общем не плавно идет фильм. не знаю как еще описать. Причем чем лучше качество фильма, тем заметнее эффект. на другом телике(тоже 40, но фирма др.) такого нет. рядом поставил 2 телика и разница прям заметна была.Расстроился( сейчас чето искать буду, может можно как-то настроить, прошивку мб новую.'),
(17, 7, 'Телевизор достойный! Особено понравилось сенсорная кнопка на пульте. Очень современно. Быстро включается. Интернет хорошо работает. Пока все нормально.'),
(18, 7, 'Всем Привет. Данным товаром пользуюсь уже 1.5 года, из всех плюсов, могу сказать, что 4-ядерный проц. весьма хорошо работает в сети. Смотрю фильмы прям в онлайн-формате без скачивания на внешние носители, чтобы не тратить время. Картинка прям живая, смотреть ужасы очень круто!  '),
(19, 7, 'телеком доволен полностью особенно звук радует.'),
(20, 7, 'Экран глянцевый (не матовый) - об этом нигде не сказано.  В нём отсвечивает окно, люстра. Пульт неудобно держать в руке - изогнут, маленький. На пульте присутствует микрофон, но телевизор его не поддерживает.  Skype поддерживается только при наличии веб камеры фирмы производителя. В чатовом и голосовом режиме скайп не работает, а так же не поддерживаются веб камеры сторонних производителей. За такие деньги - дороговат...'),
(21, 7, 'Купил данный телевизор, знакомство прошло на ура! Легкий в использовании, настройка каналов автоматическая проходит очень быстро, подключил стандартную антенну поймал 20 цифровых каналов, качество изображений шикарное! Вот для данных телевизоров камеры для Skype дороговаты, а так телевизор оправдал свою стоимость! Для людей не очень продвинутых могут встретиться трудности с пультом, но это только первое время, а если не привыкните подходит любой пульт  от стареньких самсунгов))'),
(22, 7, 'Телевизор мне понравился. Отличная картинка, хороший звук. Хорошо ловит Wi-Fi. Фильмы в HD качестве смотреть одно удовольствие. Подключил жесткий диск на 1 терабайт. Телевизор обнаружил его без проблем, смотрю фильмы с него. К пульту надо привыкать. Вообще-то хотелось бы как у LG, там в комплекте 2 пульта. В итоге я пользуюсь штатным для интернета, а для просмотра ТВ я беру обычный пульт от другого моего Самсунга. Из минусов я бы отметил родную операционку Tizer. Не так много приложений, как на Андроид, не всё видео показывает из интернета.'),
(23, 7, 'Вчера купила этот телевизор все нравиться отличный выбор советую '),
(24, 7, 'купил сегодня телевизор долго выбирал отличный выбор '),
(25, 7, 'Соответствие цена качество на отлично. Время эксплуатации 1,5 месяца '),
(26, 7, 'Телевизор купил в начале марта. Выбирал телевизор в спальню. Рассматривал только модели с 40 диагональю и Smart TV. От тарелки Триколор ТВ наловил более 200 каналов. Качество изображения просто идеальное. Особенно на каналах идущих в формате FULL HD. У меня дома 3 телевизора, но на этом разница в картинке формата FULL HD и HD видится наиболее заметно. Для просмотра спортивных трансляций советую переводить изображение в формат спорт. Цвета и звук становятся ещё более насыщенные. С интернетом пришлось немного повозиться. Но это из-за качества сигнала связи. Проблему решил купив в М.Видеоретранслятор Wi-Fi сигнала TP-LINK TL-WA860RE(EU). Кстати тоже рекомендую. Просто воткнул в розетку и сигнал стал ловиться на максимальной отметке. Из первых впечатлений можно сказать Smart довольно шустрый. Отклик происходит практически без задержек. Пульт действительно непривычный, но прикольный. Через час пользования можно освоится, было бы желание. На пульте имеется микрофон, но телевизор его почему то не поддерживает. Наверное оставили эту фишку для очень дорогих моделей. Для Skype можно использовать только веб-камеру фирмы производителя. Конечно это немного дороговато. Да, чуть не забыл. Специально для тех, кто хочет приобрести телевизор подешевле рекомендую делать покупку во время каких либо акций, через интернет-магазин и производить обязательно онлайн оплату (скидка 5%). По моему неплохо за отличный телевизор. Рекомендую. '),
(27, 7, 'Брали телевизор в подарок мама, после одного дня пользования решили купить такой же себе! Понравилось все'),
(28, 7, 'Телевизор отличный , но с последним обновлением от самсунга  можно устанавливать виджеты только из самсунг апп а там для операционки тайзен мало что есть полезного'),
(29, 7, 'Месяц в эксплуатации.Ужасный ТВ,тупит.При нажатии кнопок иногда не реагирует(на лентяйке и  на самом ТВ).'),
(30, 7, 'Купил этот телевизор неделю назад.От коллективной антенны сразу поймал 10 цифровых и 40 аналоговых каналов.Показывает идеально.Интернет настроил меньше минуты.Непривычный пульт,но через пару дней освоился.Очень удобно,что можно настроить предустановленные режимы изображения.Приложения работают хорошо,надо только привыкнуть к работе с пультом.Резюме:Хороший смарт телевизор за не очень огромные  деньги!'),
(31, 7, 'Купил телевизор две недели назад. Показывает идеально. Интернет настроил быстро и без проблем, в меню всё понятно написано. Пульт прикольный, хоть и освоил его но всё равно путаюсь, кнопок почти нету. Смарт Хаб работает отлично, виджитов поставил много всё работает и ничего не виснет. Я очень доволен что купил именно этот телевизор, рекомендую всем.Недостатки: пока не обнаружил.Резюме: Хороший смарт телевизор за приемлемые деньги! '),
(32, 7, 'Самсунг есть самсунг! Сочная картинка, эффект пресутствия. Простое , удобное меню, можно быстро отсортировать каналы, по сравнению с прошлыми моделями. Необычный пульт указка, удобно, просто и ново. Смарт ТВ, функция конект - полезно если есть саундбар самсунг(а он есть), аппаратура подключается без проводов  и звучит достойно. И все это управляется одним пультом!! Минусы, ну если ТВ стоит на подставке, то usb выходы высоко расположены, провод от жёсткого диска не дотягивается. Нет в комплекте углового штекера. '),
(33, 7, 'Изначально присмотрел другой телевизор, но придя в магазин за покупкой, решил сравнить с другими телевизорами в той же категории. Samsung UE40J6330AU явно превосходил своих конкурентов. Более насыщенные цвета, четкие контуры на изображениях. Пульт  действительно современный, минимум кнопок, просто приятно держать в руке.  Все остальное делает виртуальная указка, просто водите  по экрану как мышкой компьютера и выбираете что надо. Для тех у кого есть WI-FI это находка. В итоге выбрал этот телевизор .   Одним словом -новое поколение.Продавцам-консультантам благодарность за подробную информацию.«М.Видео» это масса возможностей, акции бонусы скидки.  Рекомендую.'),
(34, 7, 'Телевизор супер!Нареканий не каких.Картинка супер,играю PS4 просто божественно!'),
(35, 8, '	Купили 2 недели назад классный телевизор для кухни. Мы очень довольны, беленький, отлично показывает, все функции которые нам необходимы есть. WiFi, куча приложений через интернет, просмотр меню и настройки просто чудо, описание инструкции можно найти в самом телевизоре и очень подробно. Установили на угол кухни горизонтальный поворотный кронштейн, закрепили спец.устройством, которое использовали для бывшего телевизора. Подключения всех входов с боку, что нам очень удобно. Отличный выбор! Купите не пожалеете. Есть маленькие минусы, с пультом, но это мелочь, можно привыкнуть. В общем это супер!!! Мини компьютер и с ним надо на вы!!! Спасибо производителям!'),
(36, 8, '	Сегодня купили на кухню. Хороший телек. Картинка радует глаз. Антенна - обычная У, ловит неплохо. Пока изучаем. Нравится. Больше на кухню 10,5 кв.м. и не надо. Цифровое ТВ показывает замечательно!!! Универсальное крепление - подставка - здорово! Хочешь на стол ставь, хочешь вешай на стену (дополнительное крепление в комплекте!).'),
(37, 8, '	Покупал в комнату ребенку. Цвет белый. Все функции работают на отлично! Ivi рулит, куча дополнительных приложений, к которым можно настроить быстрый доступ. wifi работает без нареканий. Картинка отличная, закрепил на стену стандартными крепежом, ничем не уступает приобретаемым дополнительно, только нет поворота, а мне и не нужен. Короче говоря, рекомендую, отличный смартфон телевизор. Кстати, есть возможность им управлять, смотреть видео и фотки с apple, для этого достаточно скачать приложения, пример: videobrowser, flipps или iMediaShare. Кстати это у меня единственный телевизор, который через стандартное меню настроил цифровые каналы!!!!! Картинка супер!'),
(38, 8, '	Сразу все настроилось автоматические: цифровое ТВ, интернет и т.д. Довольно быстрый SmartTV с кучей сервисов (большинство не нужных). Всем рекомендую, особенно классно смотрится на кухне.'),
(39, 8, 'Немного разобравшись с TV,пришел к выводу, что для детской спальни, равно как и для кухни (там у нас Sony KDL 26EX553) это наилучший выбор. Комплектный кронштейн на стену очень хорош своей миниатюрностью (покрасил из баллончика все его черные части в белый цвет), анахронизм громоздкого адаптера решен- в задней панели есть ниша, по размерам как раз под него, на двойной скотч. К пульту Sony мы давно привыкли. Телевизор собран в Словакии, подкупил тонкой рамкой с острыми углами. Работает четко. Количество заявленных пикселей не пересчитывал. Цена вполне приемлемая. Рекомендую.'),
(40, 8, '	При отклонении на 45 градусов от перпендикуляра картинка отвратительно блёклая. И этот дефект заметен при минимальном (какие уж там 45*) уходе в сторону. Посему, поворотный кронштейн необходим, вот только его не купить. Поскольку устройство используется исключительно как кухонный телевизор, о других его талантах мнения не имею, и к недостаткам, в дополнение, могу добавить разве что чересчур завышенную цену -  и стойкое ощущение, что имеешь дело с ОЕМ-продуктом под лейблом Сони.'),
(41, 8, '	При отклонении 45град от оси экрана картинка осталась на SONY и еще на одном! Но внешний вид W605A просто поразил. Ничего лишнего. Оказалось, и внутри всё на месте - картинка, звук, понятные настройки, море возможностей. Тюнер стандарта Т2. В общем, почти идеал - если бы не цена.'),
(42, 8, '	Показывает отлично! Хороший смарт контент. Но, на угловой кронштейн повесить невозможно! Так и на любой другой, например, наклонный. Сони очень скромно выпустило комплект-переходник для VESA кронштейнов. '),
(43, 8, '	Телевизор просто изумительный !!!! Качество изображения супер!!! Читает все с флешки, инет работает,звук у него оказался очень достойный, присутствует даже небольшой бас - проверял в магазине и сравнивал с другими производителями в этой диагонали телевизоров. Работает очень шустро и без нареканий. Я остался очень доволен - брал на кухню !!! Рекомендую, он реально стоит своих денег.'),
(44, 8, 'Отличный телевизор, купила в феврале! Не пожалела еще ни разу! Очень красивый, шустрый, качество изображения великолепное, звук - как в кинотеатре! Выходит в интернет без проблем! Для кухни - лучше не найти!!! Всем советую!!!'),
(45, 8, 'Телевизор отличный, картинка хорошая, доп.память читает на ура, а дублирование экрана, это вообще вещь просто класс, часто ей пользуемся. Единственный минус это подвес, долго искали, думали как его крепить, но нам посоветовали купить обычный поворотно-разворотный подвес и докупить винты длинее, и чтобы тв можно было поворачивать, вам понадобится два болта и 4 гайки, одной гайкой затягиваем болт (вкрученный до упора) к тв, а второй -подвес к шапке болта.'),
(46, 8, '	Насчёт крепления TV на поворотном кронштейне - не проблема, я чуть-чуть по-кулибиничал!!! Приобретаете поворотный кронштейн, берёте слоёную фанеру, прикрепляете её к кронштейну (на 4 шт. болта, болты покупаете отдельно), а затем к фанере крепите телевизор с помощью кронштейна, который идёт в комплекте с теликом. Телек вешал на кухне и диагональю 32 см, держится!!! :)'),
(47, 8, '	Специально приехал в магазин, чтобы проверить угол обзора - все нормально, сразу купил. Техника Sony всегда была качественной и всегда покупаю только ее. Работает все четко и быстро. Доволен'),
(48, 8, '	Все хорошо в этой модели ТВ. Но этот телевизор решительно не знает что такое углы обзора. Отходишь в сторону на 35-40 градусов, картинка становится совершенно блеклой. По этой причине, наверно, я его и сдам обратно.'),
(49, 8, 'Телевизор отличный но дорогой в связи с курсом брал по акции два месяца назад . Особенно понравился звук и беспроводное подключение , планшет подключается к нему быстрее чем  к более современному  42 телевизору sony . Комьпютер на windows 10 нашел его в сети и добавил как устройство что удобно можно на него отправлять видео аудио и фото контент очень удобно . с стольным соглашусь с предыдущими  кометами хороший звук  отличное изображение но с хорошей наценкой на бренд ))))'),
(50, 8, 'Купили телевизор sony bravia kdl-24w605a белый цвет на кухню очень довольны, можно его использовать как компьютер. Спасибо менеджерам за совет по выбору телевизора'),
(51, 8, 'в октября 2013 брали за 15 000 телек шикарный порадовала функция встроенного модуля эфирное цифровое тв, на момент покупке не нужно было а сейчас как раз трансляция идет никакая приставка не понадобилась, вайфай и длна работает отлично, смотрим видео через планшет, в общем хороший выбор, но маловат для спальни  хочеться побольше.'),
(52, 8, 'Сегодня купил. Очень доволен покупкой. Даже выключенный смотрится стильно. Пока занимаюсь настройкой. Много лет покупаю всю бытовую технику в Мвидио. Очень доволен персоналом и представленным товаром.'),
(53, 8, 'В двух словах - лучше не бывает!!! Все что комментах- правда! Купил сначала себе,  потом тут же родителям. Цена полностью соответствует содержанию, но телек реально лучший среди всех для кухни.'),
(54, 8, 'Этим телевизором пользуемся порядка полугода. Хотели до этого купить другой, но в магазине увидели эту соньку, увидели очень красивую и яркую картинку и не смогли отказать себе в покупке этого мальца.Итак, по-порядку. В каждом телевизоре самая главная его часть - это дисплей. Тут это отличная 24-дюймовая матовая IPS матрица с HD-разрешением 1366x768 и углом обзора 176 градусов. Телевизор выдает просто невероятно сочную и красивую картинку, поэтому смотреть на нем канал Дискавери, фильмы и другие телепередачи просто одно удовольствие! Кроме того, благодаря технологии Motionflow XR 200 Гц, на экране отображается очень четкое и не режущее глаз изображение (технология добавляет между стандартными 24 кадрами в секунду дополнительные изображения, удаляя эффекты дрожания и размытости и повышая их количество до 200 кадров в секунду). Несмотря на все новшества, телевизор очень экономный и тратит не более 25 Ватт в час!Отдельно стоит отметить у телевизора большой функционал. Sony KDL-24W605A принимает эфирное(DVB-T/T2), кабельное (DVB-C) и спутниковое (DVB-S/S2) телевидение. Разъем DVB CAM присутствует на задней части телевизора. У нас же он был подключен через HDMI-порт (всего в телевизоре два порта, а не три, как указано в описании на сайте) к ТВ-приставке от интернет-провайдера. При необходимости можно подключить любые видео-приставки/DVD-проигрыватели через компонентный и/или композитный входы, а также SCART. Для любителей цифровых носителей есть USB 2.0 Type A разъем. Пробовала несколько флешек и пару жестких дисков на 1Тб - все работает прекрасно и без проблем. Кроме того телевизор имеет в наличии LAN-разъем, Wi-Fi-модуль на борту. Достаточно удобно один раз настроить телевизору доступ в интернет, после чего он сам обновляет прошивку без особого вмешательства пользователя (достаточно нажать OK при уведомлении о новой версии ПО). Для обладателей хорошей акустики имеется оптический аудио-выход. Выход на наушники 3.5 мм также присутствует.SmartTV у Sony не самый лучший среди конкурентов, однако можно найти достаточно много полезных приложений. У меня наиболее популярным был просмотр YouTube-роликов прямо с телевизора. Есть возможность подключения камеры к ТВ для скайпа.Крепление на стену у Sony KDL-24W605A нестандартное, идет в комплекте. Это ножка, на которой телевизор стоит при установке его на стол, которая прикручивается к задней части телевизора для его установки на стену. При этом телевизор не имеет осей вращения, направлен прямо и чуть вниз.Покупкой очень довольны. У Sony KDL-24W605A много плюсов. Это и невероятно привлекательная картинка, и хорошая цветопередача, и большой набор разъемов на любой вкус для любой техники, и возможность доступа в интернет прямо через телевизор без компьютера, и очень красивый и в тоже время простой дизайн, который впишется в любой интерьер. Из минусов можно отметить нестандартное крепление на стену и не самый богатый выбор приложений Sony SmartTV. Если для Вас это не критично и Вам нужен небольшой, красивый, а главное надежный друг - смело берите! Этой покупкой вы будете довольны каждую минуту просмотра телепередач!'),
(55, 8, 'Эту модель телевизора присмотрела два года назад, планировала установить на кухне после ремонта. Свершилось, досадно, что цена выросла на 50%. Перечислять все технические возможности не буду, ибо таковые были уже здесь озвучены. Остановлюсь на настенном креплении. Хоть я и женщина, мне не составило труда с помощью электродрели и отвертки установить телевизор на стену. Кронштейн установила рядом с розетками, так чтобы верхний край телевизора совпал с верхним краем блока розеток (питание и TV).  Адаптер питания комфортно расположился между телевизором и стеной (на задней панели есть ниша). Крепление на стену отнюдь не хлипкое. '),
(56, 8, 'Моя девушка купила у вас этот телевизор и очень благодарна вам! У нас с этим телевизором связана целая история! Благодаря ему я познакомился со своей девушкой! Я увидел как красивая и хрупкая девушка несла этот тяжолый телевизор, я подошёл к ней и спросил Девушка, может вам помочь? она согласилась на мою помощь! Я ей помог дотащить этот телевизор к ней домой, помог его установить, настроить телевиденье, она продолжила мне чай и мы вместе сидели смотрели телевизор! Так у нас с ней все закрутилось! Я хочу вам сказать огромное СПАСИБО!!!!!!!!!'),
(57, 8, 'Пришла в магазин за телевизором Samsung UE22H5610AK белого цвета, продавец посоветовал купить Sony KDL24W605A, обратив внимание, что разрешение экрана 1920x1080 (FullHD) у Samsung и 1366x768 (HD Ready) у Sony при такой диагонали не существенно, а качество картинки отличное, сборка Малазийская. Рамка тонкая, не глянцевая, а шершавая, углы острые со швами, гибрид компьютера с телевизором. О наличии кирпича-адаптера в комплектации меня не предупредили. Из плюсов - хороший звук и изображение, углы обзора и снизу и сбоку,  нижняя подсветка в темноте красиво освещает подставку, в выключенном состоянии не горит лампочка. Из минусов - широкая нижняя часть, вплотную повесить на стену не получится, хлипкий подвес в комплекте. Пульт черного цвета, что не логично для белого телевизора, инструкция состоит из каких то отдельный страничек, информации минимум. Прочитать о настройках и обозначение кнопок можно только непосредственно в меню телевизора. Для модели 2013 года - цена завышена. '),
(58, 8, 'Отличный телевизор, цена, конечно не маленькая, но и платишь за качество и комфорт. Теперь, когда все спят, ночные футбольные матчи смотрю на кухне с удовольствием! Все функции приличного смарт-тв есть.'),
(59, 9, 'Покупался для кухни)....отличный телевизор никаких тормозов, качество картинки достойное, скорость, звук......всё на 5+..... в комнате стоит 50 Samsung 6й серии....на кухню хотелось именно смарт. Подключается и настраивается за 2 минуты, сеть держит стабильно , приложений просто тьма в том числе и бесплатных. Единственный минус это неповоротная подставка!!!!.....ни по сторонам ни вверх вниз его не повернуть, поэтому будьте внимательны если рассчитываете ставить на тумбу. '),
(60, 9, 'Покупал для интернета,главное чтоб мы могли смотреть с внуками мультфильмы онлайн.Все прекрасно работает,отлично грузит.Рекомендую.'),
(61, 9, 'Впервые решил написать комментарий к покупке т.к. остался очень доволен покупкой и отношением персонала магазина. Выбирал телевизор по стандартным критериям 1.качественная картинка, 2. Хотелось через интернет смотреть фильмы онлайн, 3. И чтоб не дорого. Конечно, планировал чуть дешевле купить, но консультант уверено убедил брать на новой операционной системе, якобы она быстрее работает. На первый взгляд телевизор показался слегка медлительным, я даже расстроился. Вернувшись в магазин, я нашел своего продавца и высказал свое возмущение, после чего он объяснил мне, как обновить телевизор, теперь все в порядке, телевизор великолепно работает и показывает!!! И да, я даже был удивлен, когда узнал что можно бесплатно смотреть онлайн телевиденье, спасибо за подсказку продавцу!!!'),
(62, 9, 'Нормальный ящик! Прекрасно работает с мышкой и клавой! В ютубе удобно лазить, качество изображения супер! Из минусов нет андроида, не все проигрыватели воспроизводит. Так что буду покупать приставку андроид.'),
(63, 9, 'Купил около месяца назад. Картинка: естественная, чёткая, сочные цвета. Звук отличный для ТВ. Хорошо загружаются фильмы как с компьютера (через роутер), так и из интернета. С USB-флэшки фильм на 20Гб показывал без проблем. Никаких тормозов. Не пробовал пока подключать внешний жёсткий диск напрямую, но надеюсь проблем не будет. Сразу после подключения к интернету самостоятельно обновилось ПО. Очень доволен телевизором, хотя с недоверием относился к продукции Samsung. Теперь моё мнение изменилось в пользу Samsung. Нашёл только один недостаток: по какой-то неведомой причине часть подставки, которая находится за экраном, отрывается от ровной поверхности, на которой стоит, на 1-2 мм и получается, что телевизор чуть-чуть заваливается вперёд, на зрителя. И ещё: телевизор произведён в России. Для меня это плюс.'),
(64, 9, 'супер ! уже сколько пользуюсь ! всем рекомендую'),
(65, 9, 'отличный во всем. все прекрасно работает хороший отклик програм не зависаний ни сбоев '),
(66, 9, 'Покупал в декабре 2015. Отлично показывает цифровое кабельное ТВ, аналог естественно размазанно, но все равно достойно. Тюнер ловит много каналов. Отчетливо прослеживается неоднородность чёрной картинки и смазанность динамических сцен (думаю, это болезнь всех телевизоров в этом ценовом диапазоне) СмартТВ очень тормозной, лучше пользоваться отдельной приставкой от известных производителей. Пульт перегружен кнопками, функции которых дублируются.'),
(67, 9, 'Купил данный аппарат сегодня, буду использовать в качестве монитора к компу, в принципе как показывает ТВ и прочее сказать не могу :) Но покупкой в целом доволен :)'),
(68, 9, 'Телевизор, просто супер, покупал его по отзывам и не прогадал. Картинка четкая, красочная, такое чувство, что все живое.  Интернет на телевизоре, работает без тормозов, включаю детям мультики и просто радуюсь, качеству картинки. Советую всем не пожалеете. '),
(69, 9, 'Пользуюсь данным Смарт ТВ две недели. Как телек, UE40J6200 меня устраивает полностью!!!Захотелось мне использовать возможности скайпа. После консультации с Тех. поддержкой САМСУНГА купил недешёвую веб камеру VG STC-5000, но она так и не заработала. Четыре дня и понадобилось разным консультантам из ТЕХ.ПОДДЕРКИ САМСУНГА, чтобы понять, что данная камера для этого ТВ не подходит. Спасибо менеджеру магазина «Формула ТВ», где я брал данную камеру, выслушал меня, вошел в мое положение и, несмотря на то, что «косяк» был не магазина, а САМСУНГА (камера была абсолютно исправная), произвел возврат товара. Кстати данная камера в магазине включилась только у одного телевизора из шести, стоящих на полках. Кроме того, менеджер бесплатно напоил меня кофе, рассказал и показал как пользоваться камерой смартфона совместно с данным ТВ для использования скайпа. Спасибо «Формула ТВ» и позор Самсунгу.Прежде чем покупать смарт ТВ Самсунг разберитесь со всеми его возможностями и характеристиками, возможны сюрпризы.'),
(70, 9, 'Купил телевизор для спальни. Подключение к аналогу Дом.ру.Показывает отвратительно - артефакты на всех аналоговых каналах, картинка постоянно рассыпается  на квадраты, мелкие и не очень, помехи в виде точек. Исправление дефектов в настройках не помогает, половина пунктов меню на улучшение картинки не активны.Другие телевизоры ( 3 шт., диагональ 25, 37, 47) таких дефектов не имеют. Как радиотехник могу сказать что аналоговый тюнер плохой, обработка сигнала вытянуть картинку не может.Купился на высокий рейтинг в отзывах и рекомендации продавца. В реальности на аналоговом кабельном все плохо. Буду сдавать однозначно.'),
(71, 9, 'Отличный телевизор. Не тормозит. Уже забыли когда смотрели обычные каналы. Все время в интернете. Классный, современный изогнктый экран. Цены в МВидео тоже . '),
(72, 9, 'Техника самсунг мне нравится с детства не скажу что у меня все приборы самсунг но все же телевизоры только самсунг данная модель для меня это просто сказка и телевизор и музыкальный центр и компьютер ну в общем три в одном ну а детям так это вообще супер благодаря смарт тв мультики на любой вкус.Моей дочке четыре годика она управляет данной техникой сама.Легок в управлении все просто и легко.Смотрите и наслаждайтесь.Всем советую.Не пожалеете.'),
(73, 9, 'Пришло время купить домой второй телевизор. Первый тоже Самсунг 32 6727 с 3D которое ни разу не посмотрели:) при выборе решил, что эта функция для меня не актуальна.По качеству картинки очень понравился, звук тоже хороший. Smart tv стал быстрее, но не комп и не планшет:) wifi стал ловить быстрее. Если честно купил телик даже не видя его в живую и не разочарован! Телик классный. '),
(74, 9, 'вот это да. выбирал особо не задумываясь. был опыт владения самунгом. Но я даже не мог представить, что покупаю такое чудо. с этим телевизором хочется смотреть наши малоинтересные каналы снова и снова. хочется просто держать в руках этот приятный на ощупь пульт. стоит отметить, что качество картинки просто превосходное.  звук не поддается описанию ( не могу подобрать нужный слов восхищения им). пожалуй, это лучший телевизор на рынке по такой цене. я рекомендую этот телевизор. он подойдет как и бабушке, так и заядлому игроку в плойку или мыльницу '),
(75, 9, 'Приобретали год назад, с тех пор не возникало проблем ни разу. Отличная картинка, прекрасный громкий четкий звук. Выход в Internet  через wifi - это очень удобно. Иногда смотрим 3D. Очень понравилось то, что он на хромовой ножке, красиво. Весьма легок для крепления на стену'),
(76, 9, 'Долго выбирали телевизор, подбирали по размеру в нишу для тв. Консультант посоветовал самсунги 6 серии, тк там картинка 200г. Мы сомневались, тк цены разнились, но тут попали под акцию. Привезли это чудо домой. меню настроек интуитивное. Картинка высший класс. Пересматривали фильмы советские (девчата и тд) как будто вживую все. Увидели даже те вещи на картинке, которые раньше и не замечали. Кстати, смотрим через встроенное приложение мегого. А звук... нет слов. В общем, всем советуем. За 2 дня недостатков не обнаружено'),
(77, 9, 'Очень-очень сильно тормозит!'),
(78, 9, 'Плюсы ТВ:Данный телевизор имеет матрицу в 100Гц разогнанную до 200Гц, что позволяет по настоящему ощутить всю красоту картинки .Экран в 40 позволяет расслабиться на диване и не напрягаюсь управлять всем из далека.Отличный товар для игровых консолей.я подбирал телевизор именно для консоли PS4, данный телевизор максимально справляется с резкой сменой кадров и позволяет без напряжения на глаза проводить часами перед экраном!в своём отзыве ,я бы хотел отметить ,что данная модель полностью соответствует цена/качество и именно этот телевизор будет вашим хорошим другом и впишется в любой интерьерМинусы ТВ:В данном телевизоре имеется функция SmartTV, именно эта функция является главным минусомДело в том, что как и у всех, он начинает лагать со временем, и ничего с этим сделать, как я понял, нельзяПо сути я им и не пользуюсь, играю только в игры, а каналы не смотрюОбщее решение:Поставил бы 4,5 но на сайте нет такой возможности, поэтому 5 Всем советую взять данную модель,не пожалеете !'),
(79, 9, 'Очень доволен покупкой. Нареканий нет. Фильмы с компа,  игры на xbox все идёт замечательно!'),
(80, 9, 'Много лет пользуемся техникой Samsung и ни разу она не подвела! Это уже  5-ый телевизор и все предыдущие работают до сих пор без замечаний. Правильный выбор. Рекомендую.'),
(81, 10, 'Телевизором доволен. Качественная картинка.  Имеется Wi-Fi, поможет без проводов использовать интернет, т.к. у ТВ есть поддержка Smart .'),
(82, 10, 'качество картинки+++++++++++++лучшее по сравнению с 5ой серией'),
(83, 10, 'Решил купить для своего офиса такой телевизор, а то частенько работники говорили, что хочется как-то порой отвлечься, посмотреть чего-нибудь в перерывах. Вот примерно так и описав ситуацию и сказав примерные размеры телевизора, которые бы мне хотелось видеть, ваш персонал мне показал эту модель. В принципе на первый взгляд этот телевизор мне понравился, выглядит качественно и так сказать лаконично - в нем нет ничего лишнего, только полезные вещи. К тому же фирма как-никак Самсунг, уже автоматически говорит о том, что модель не хухры-мухры. Подставка на деле оказалась очень крепкая, я волновался поначалу, что мало ли, телевизор шататься будет, или неустойчиво держаться, но на деле эти все мысли развеялись. Качество передачи картинки у этого телевизора реально высокое, такие цвета естественные и насыщенные, получше, чем на любом нашем офисном мониторе если честно. Теперь мой персонал постоянно за этим телевизором в перерывах, сидят пьют кофе и смотрят что угодно, но все равно с удовольствием. Еще и такой изогнутый экран, с любой точки все видно будет. Всем понравилось главное, а значит, и я доволен.'),
(84, 10, 'Телевизор неплохой. Модный и показывает хорошо. Гнутый экран и Wi-Fi только в преимущества, но вот качество телевизоров в целом у этого бренда заметно упало. Тупит и глючит. Как смарт ТВ вообще никакой. Вообщем я недоволен. До этого было несколько ТВ этого бренда. Предпочитал только их - был доволен. '),
(85, 10, 'Неплохой телевизор, но для таких размеров гнутый экран абсолютно - это лишнее. Пустой наворот, который стоит несколько тысяч рублей. '),
(86, 10, 'Купил по акции за 29490р., использую как монитор и крайне ДОВОЛЕН!!! Берите, телевизор БОМБА!!! Картинка изумительная!!! Очень доволен покупкой, спасибо м.видео!!!'),
(87, 10, 'все  хорошо  одно  меня  не  устраивает  за  эту  цену  почему  пульт  старого  образца  а  не  сенсорный  вот  это  не  понятно'),
(88, 10, 'Телевизор очень понравился, купили для кухни. Качество картинки на уровне. Смарт ТВ хорошая вещь, если знать что с ней делать, приложения которые в магазине предоставляют платный контент. Нашел сайт getsapp.ru , много приложений сторонних, фильмы, тв и тд. всё бесплатно., рекомендую'),
(89, 10, 'лучше 6330 взять хоть экран прямой зато 40 дюймов'),
(90, 10, 'Вот и появилось вчера первое огорчение от Samsung, вообще недолюбливал как то эту марку, приверженец Philips (в гостиной и на кухне). Пришло время взять TV в детскую комнату, выбор пал на данную модель, судя по отзывам о картинке и смарт тв, подключил Wi-Fi, повесил, ребенок не нарадуется смотреть мультики. А вчера пришел с работы и взгляд упал на нижнею кромку корпуса TV и я был шокирован.... Она отклеилась и виден двухсторонний скотч, щель, что монету засунуть можно. 100% этого не было, т.к когда вешал весь корпус был осмотрен на предмет царапин и т.д, TV естественно не ронял и т.д. Завтра поеду обменивать, если повториться буду брать модель с прямым экраном, скорее всего причина в изогнутом экране, пластик корпуса пытается выправиться!   '),
(91, 10, 'Муж такой навороченный телевизор нам домой в гостиную купил. Честно говоря, никогда не сталкивалась с такими изогнутыми экранами раньше и первое время даже не могла привыкнуть к такому, но тэо все оказалось делом привычки. Уже спустя некоторое время я поняла, насколько это удобно и что можно разглядеть картинку с достаточно разных углов, причем все равно все будет четко видно. Вообще картинка мне тут нравится, все очень ярко, естетсвенно и красочно. Любим смотреть передачи особенно про животных, так там такая динамика прям появляется, мне понравилось. Разьемов тут куча полезных, пока конечно все не пробовали, но недавно сын решил посмотреть что-то, пока мывсе спали, в наушниках, говорит звук ему очень понравился. В принципе мы все остались в итоге довольны такой техникой.'),
(92, 10, 'Всем привет,сегодня купили этот Samsung,телевизор супер,загляденье,все работает,не лагает,если даже то так се,бывает,сами знаете это интернет и у всех по разному,но вот качество в порядке,я не могу сказать за всех,это мое мнение,всем спасибо,всем советую,хороший ящик))))))'),
(93, 10, 'Телевизор полностью себя оправдал. Смотреть кино через smart одно удовольствие!!!звук,режим спорт все класс'),
(94, 10, 'Телек хороший,шустрый  НО ЗАСВЕТЫ по углам на светлом фоне ,аналог показывает прилично, гнутый экран на такой размер это  лишнее .'),
(95, 10, 'Хороший телевизор, купили неделю назад, все нравиться. Могли бы сделать сенсорный пульт. Все остальное просто супер. Изображение отличное, соображает быстро.'),
(96, 10, 'Качество отличное, красивый дизайн. Закрепили его на стене, это сэкономило пространство в комнате.'),
(97, 10, 'Очень понравился! Каналы HD очень четко показывает! Еще не всем овладела, но покупкой довольна.'),
(98, 10, 'Тв очень удобный, качество супер, не знаю лучше по моему некуда . Разобрался всем что настроено, всю себя оправдал и даже больше. Купил себе в спальную, подошло идеально. Флэшки, играв-приставки, доп-экран. Можно подключить к тв все что угодно, тем он и практичен. Я думаю прослужит ни мало лет. В прочем как и вся техника из Мвидео!'),
(99, 10, 'Приобрели данную модель телевизора из-за изогнутого экрана. До сих пор не разочарованы.Самые главные достоинства на мой взгляд:1. Функция Smart TV. Подключили телевизор к интернету (через Wi-Fi) и теперь смотрим онлайн все что захотим. Имеется полноценный Интернет браузер, отлично работают все приложения. 2. Есть HDMI выход, USB-разъемы.  Читаются все форматы видео.3. Отлично  настроил все каналы.4. Очень четкая и красочная картинка с любого угла обзора, изогнутый экран дает более глубокую картинку.'),
(100, 10, 'Телевизором очень доволен, хорошая картинка, хороший звук, единственный минус очень сильно бикует'),
(101, 10, 'Купил перед Новым годом.  Выбирал в магазине, сравнивая качество изображения у разных моделей. Настройку делал дома сам. Все оказалось очень просто и понятно.  Качество изображения вопросов не вызывает. Приложения работают.  Очень удобно смотреть фотографии с фотоаппарата через беспроводное подключение. Еще использую как дополнительный монитор для ноутбука (через WiFi).Минусов пока не обнаружил.'),
(102, 10, 'Телевизор среднего качества. Смарт иногда тупит, цифровой тюнер отловил только половину каналов, хотя такие же Самсунги  6 серии диагональю 48 и 55 дюймов нашли гораздо больше каналов с этого же антенного разъёма. Корпус собран наспех, при изъятии телевизора из упаковки поранился об острую (плохо зашлифованную) пластмассу! Изображение на четвёрочку, но!!! УЖАСНЫЕ ЗАСВЕТЫ, вернее затемнения по углам экрана на светлом фоне и белёсые разводы ПО ВСЕМУ ЭКРАНУ при тёмном фоне! При диагонали в 32 дюйма это очень и очень портит картинку экрана. На двух других Самсунгах 48 и 55 дюймах таких болячек  и в помине нет. Пару раз сам по себе заикался звук, при этом переставала работать регулировка звука с пульта, лечилось нажатием кнопки mute. Сам пульт не удобен, огромное количество тесно расположеных кнопок, бывает промахиваешься. Владею телевизором всего пять дней и уже созрел обменять его, так как качество изображения хорошее в центре экрана и ужасное из за засветов по углам.'),
(103, 11, 'Стильный дизайн, рамка AL узенькая в глаза сильно не бросается, звук отличный. Покупал в маленькую комнату смотреть фильмы и не пожалел, глаза не устают. Качество картинки реалистичное по цветопередаче и четкости, много различных настроек. Аналоговое телевидение на четверочку  в принципе хорошо, при настройке тв каналов потратил много времени, переключение каналов тв происходит с маленькой задержкой, у пульта кнопки очень мягкие и реагируют на легкое нажатие, через usb порты  медиа файлы читает шустро. WI-FI держит стабильно не рвется, но если подключены другие девайсы то канала не хватает но оно и понятно делится скорость, по кабелю проблем нет, через роутер объединяет все подключенные устройства в одну сеть и позволяет просматривать фото видео с расшаренных ресурсов. Андроид пятой версии, приложений не  очень много , но  для работы и развлечения все есть соответственно  платные и бесплатные, 8,7 Гб. встроенной свободной памяти. Очень доволен данным телевизором и не пожалел что его купил, быстро привык к пульту и меню до этого был телевизор другого бренда. '),
(104, 11, 'Купили этот телевизор в декабре 2015 года, сделали себе новогодний подарок. В инструкцию я ни разу не заглянула, все понятно интуитивно. Главное отличие этого телевизора от Смартов - он на андроиде! Это конечно имеет свои преимущества. Огромный выбор фильмов из специально скачанных программ, есть возможность смотреть кино прямо из браузера (опера) в телевизоре, также ролики из Ю-тюб. С этим телевизором точно не заскучаешь.Плюс конечно очень яркие сочные цвета, шикарное качество HD (если видео в этом качестве, конечно).Из минусов (которые в общем не портят общего впечатления) - на мой взгляд не очень быстрый отклик на переключение каналов, а также при просмотре аналогового ТВ из-за большого размера экрана бывает, что видео не очень хорошего качества - но это, скорее, проблема телеканалов. А вообще, телевизор отличный - рекомендую!'),
(105, 11, 'Отличный новый продукт от легендарного SONY, сложно передать словами попробуйте сами '),
(106, 11, 'Маргарита, эта модель без 3D и возможность подключения клавиатуры так же отсутствует. Рекомендую обратить внимание на эту модель http://www.mvideo.ru/products/televizor-sony-kdl43w808c-10008192#overview'),
(107, 11, 'на этом телевизоре есть 3д и возможность подсключения клавиатуры? '),
(108, 11, 'Купили этот ТВ и не пожалели ! Очень быстро все настроили! Картинка отличная да извук хороший! Минусов не увидела! СПАСИБО!'),
(109, 11, 'пользовался не так много времени но пару мнений для себя сделал 1 картинка отличная 2 смарт на 3 3 цифровое телевидение не плохое вроде есть какая та фишка на счет улучшения самого качества так что смотреть самой простой антенны можно спокойно .4 вай фай приемник на 4 не плоха не отлично . бывает когда даже с маленького расстояния не ловит и скорость слабая . 5 пульт и меню одним словом не оченьобщий итог сони славиться хорошей картинкой и самим качеством .'),
(110, 11, 'Давно хотел купить этот телевизор . И вот наконец ! КУПИЛ!! телевизор супер  , качество отличное играл на нем в PS4 просто супер как будто это в реальной жизни ! Глаз радуется смотреть и играть на этом телевизоре ! Все программы есть YOUTUBE ,IVI !!ВСЕ СУПЕР !!!!!!!! ОЧЕНЬ доволен покупкой !!  '),
(111, 11, 'Купили телевизор Sony KDL43W756C неделю назад. Телевизор просто супер! Изображение очень крутое!!! Android TV — очень крутая тема. Теперь на телевизор, прямо как на здоровенный планшет, можно загружать приложения и игры. Установка сторонних приложений. Настолько крутая фишка, что она заслуживает отдельного упоминания: можно скачивать не только аппы из маркета Google, но и просто apk-файлы. Например, благодаря этому можно смотреть кучу каналов в HD с приложением для IP TV без тарелок. Мелкие, но приятные фишки — управление голосом, передача данных через Google Cast и так далее. Вообщем купили и не чуть не пожалели!!!'),
(112, 11, 'Купили ТВ всё отлично ! Очень классный телевизор  ,советую .'),
(113, 11, 'М. видео — супер! Всегда буду здесь покупать! Доставили точно в срок, предварительно позвонили, помогли подключить.  Телевизор - отличный! Был бы в рассрочку, взяла еще и в комнату!) '),
(114, 11, 'Предлагаю покупать его , очен тонкие рамки , яркий экран , большое удовольствиеот просмотра фильмов, по доступной цене в м.видео'),
(115, 11, 'Вошла я в комнату к себе,Чего-то не хватает.По сторонам смотрю вокруг,Не чувствую тебя я!Не ощущаю шума,звук,Прекрасное звучание,Широкий,золотой экран,Полярное сияние.О,телевизор SONY мой,Куда ж тебя девали?Метнулась я по сторонам,И выхватив компьютер,С любовью написала Вам:Прошу Вас, вышлите мне,Сказочный,божественный экран!'),
(116, 11, 'Телевизор рулит по всем направлениям! Единственное  у меня мало времени остаётся для просмотра.И всему вина повседневная работа!'),
(117, 11, 'ДостоинстваВеликолепные цвета. Очень четкие черный и белые оттенки. Обзор ,как и заявлен. Четкость линий.Просмотр каждого волоска.Во-первых, по визуальным характеристикам телевизоры Sony традиционно обскакивают конкурентов, так случилось и здесь: картинка отличнейшая, а цвета — просто наслаждение для глаз. Во-вторых, главный плюс этой системы - это сама система: работает потрясающе, удобство в использовании в общем - прекрасный телевизор!'),
(118, 11, 'Очень классный телевизор. Стильный дизайн, интересная хромированная подставка, которую встретишь не у каждого телевизора. Очень яркие, насыщенные цвета. Удобное управление. В меню легко разобраться и без инструкции. Очень хорошо вписался в домашнюю обстановку. Конечно по карману ударила высокая цена, но за качество всегда надо платить!'),
(119, 11, 'Пол года назад приобрел этот телевизор, цена соответствует качеству! Вообще очень нравится фирма Sony, зарекомендовала себя с хорошей стороны, в спальню купил Sony Bravia, этот купил в зал, к телевизору взял веб камеру, решил попробовать  просмотр футбола в компании друзей с использованием веб камеры (у друга такой же телевизор), функция огонь. Практически перестал пользоваться компьютером; интернет, фильмы онлайн, даже видео с YouTube смотрю не слезая с дивана, главное теперь не обзавестись лишним весом)))Из минусов: лично мне не нравятся родные пульты ДУ (не именно у этого телевизора, а вообще у фирмы Sony). На ряду с другими фирмами качество изображения на порядок выше. Покупкой остался очень доволен, кто подыскивает себе новый телевизор, берите этот, не пожалеете!'),
(120, 11, 'Телевизор показывает идеальную картинку (в сравнении с другими брендами). Иногда при включении не ловит wi-fi (помогает перезагрузка), но в целом супер телевизор!'),
(121, 11, 'Это  лучший  из  телевизоров, можно  смотреть  все  что  угодно,  качество  картинки  превосходное,  отличный  дизайн... в  комнате  как  живая  картина.'),
(122, 11, 'Купили недавно для дочки,супер вещь!Картинка супер,все четко,очень ярко и реалистично!');
INSERT INTO `rev_table` (`id`, `id_items`, `value`) VALUES
(123, 11, 'Sony KDL-43W756С про-во Малайзия (серебристая алюминиевая рамка)Начну отзыв с качества изображения, ради которого в общем-то и был сделан выбор в пользу данного ТВ.1) Картинка - изумительная и при одновременном сравнении с конкурентами (зал магазина) LG, Philips, Samsung притягивает к себе. Лично на мой глаз - у Сони наиболее правильная цветопередача изображения, которая в совокупности с четкостью и вызывает такой эффект. По крайней мере я выбирал по правилу: поставил в ряд, запустил одинаковый контент на всех участниках сравнения и, погоняв в разных режимах, выбрал по своему восприятию (на вкус и цвет...)2) Качество исполнения/сборки (идентичность): у Сони оно практически безупречное и это еще один весомый плюс в сравнении с конкурентами. Дизайн - один из лучших в сегменте. Выносной блок питания лично я считаю также плюсом данной модели/серии.3) Качество звука: читая разные обзоры, сделал для себя простой вывод, что ожидать чего-то сверхестественного от тонкой ЖК-панели - глупо. Тем не менее, Сони звучит очень достойно (несмотря на свои 8+8 Ватт против конкурентов) и при этом неплохо настраивается.4) Медиаплеер: как и ожидалось из обзоров/отзывов - он мягко говоря не очень. Неудобное, запутанное меню в купе с такой же неудобной навигацией делают его весьма посредственным при постоянном использовании, хотя и вполне возможным.5) Смарт ТВ: мне лично много тут не требуется, а потому главный критерий для меня скорость работы, которую можно назвать хорошей.6) Сцены изображения и звука. Режим футбол - интересен, но пока не могу утверждать, что именно он и будет для меня оптимальной настройкой при просмотре спортивных передач (формула-1, футбол, хоккей, теннис...) - а хотелось бы.Могу лишь отметить, что стандартных настроек (присетов) по картинке не так много. Универсальный режим лучше настроить индивидуально, лично я брал за основу предложенные настройки от Игоря с этого форума. Важным моментом тут наверное стоит сказать, что я сильно не заморачивался с этими настройками и пользуюсь практически тем что есть из коробки. Умерший Sharp LC-37LE320 по картинке не сильно уступал этому Сони.Имеющихся присетов звука достаточно для ТВ, режим музыка по-мне наиболее сбалансирован, можно лишь включить звуковой бустер, который по умолчанию - выкл.7) Улучшалок изображения много - пока не до конца с ними разобрался. Режим для сглаживания динамических сцен присутствует led motion, но при активации оного изображение совсем несмотрибельно.Теперь перейдем к ложке дегтя.1) ужасное меню телевизора, которое многим может оказаться весьма сложным в восприятии. Самсунги тут рулят, если говорить про интуитивно-понятный интерфейс.2) пульт управления - в дополнение к меню столь же ужасный и запутанный, в нем много ненужных кнопок, а вот необходимые (быстрый выбор канала, сцены, списка и т.п.) - отсутствуют. Печалька однако.3) при подключении HDD в USB-1 навязчиво предлагается зарегистрировать его для будущих записей. Пришлось просто подключиться к другому слоту.В итоге: хороший, сбалансированный ТВ, который можно смело рекомендовать к покупке.'),
(124, 12, 'Алексей, попробуйте обновить телевизор до актуальной версии ПО, сделайте сброс настроек до заводских. '),
(125, 12, 'Телевизор отличный. Только одна проблема: при подключении к нему беспроводной мышки перестает работать подключение к интернету через wi-fi. Подскажите как исправить это?'),
(126, 12, 'Мне лично его дизайн приглянулся - хотела в первую очередь стильный телевизор, чтобы смотрелся презентабельно и не был хлипким, этот замечательно собран и внешне красавец, поставили его с мужем на тумбу в спальне, комната сразу с ним преобразилась!)) Настроек много, но с ними легко разобраться, я в технике полный чайник, методом втыка получилось почти все протестировать с первого раза, удобно, что нет никаких премудростей)) Самое важное, что экран цвета не искажает, нет кислотных оттенков, изображение очень качественное. Устойчиво держится на подставке, не заваливается, когда я вокруг пыль вытираю. А еще очень здорово, что он умеет считывать файлы с юэсбишки, смотрели фотки с поездок - впечатления совсем другие, чем от просмотра на экране компа, качество намного лучше! На мой взгляд, телевизор замечательный, муж тоже очень доволен его функциями, теперь второй такой собираемся взять, чтобы на стенку в детской повесить. Качество цене на сто процентов соответствует!'),
(127, 12, 'ТЕЛЕК отличный ,,с помощью wi-fi удобно просматривать любимые сериалы,фильмы,клипы в HD КАЧЕСТВЕ с помощью доступных приложений в телеке,вообщем это планшет на базе android только большой)))'),
(128, 12, 'Телевизор не плох,но меню очень тормозное.Прошивка не помогла.Перед покупкой рекомендую посмотреть его в живую.'),
(129, 12, 'Телевизор просто отличный, за эту цену устраивает полностью, все необходимые функции присутствуют. Куча дополнительных входов, 3 юсби и 3 HDMI безусловно радуют. Картинка шикарная, цветопередача то что надо. Внешний вид очень радует, дизайн 5 баллов, стильный телевизор, доставляет визуальное удовольствие.'),
(130, 12, 'Отзыв пишу по напоминанию от МВидео на мою электроную почту.Купил неделю назад. В целом нравится. Благодаря CI+ модулю позволяет начать смотреть Триколор за 7000р, а не за 11000р, если тарелка уже есть, конечно. Пульт теперь один - спутниковый модуль ведь в самом телике. Телик умный (Smart), но немного медленный при запуске приложений WebOS. Потребляет 50Вт всего. Цвета качественные. Замыленности нет, но цветовая температура меняется при смене угла просмотра (при взгляде сбоку экран хотя и равномерно но сине-зеленеет). LG как и Samsung последнее время вполне хороши.'),
(131, 12, 'Подозреваю, что цена у него одна из наиболее адекватных на такие большие телевизоры с ЛЕД-подсветкой и хорошей технологией IPS только потому, что он русский. Хочу именно подсветку отметить. Человеческий глаз иногда частое мерцание не замечает, но когда снимаешь видео, например, то на записи это сразу заметно. Тут я точно проверил, что даже при настраивании яркости нет этого мерцания, которое утомляет глаза и вызывает ухудшение зрения и мигрени. IPS панель увеличивает углы обзора чуть ли не до 180 градусов, что дает возможность смотреть фильм из любого положения в комнате. Кстати, необязательно его на тумбу или подставку устанавливать, он и на стену крепится. Телевизор современен не только в области экрана, но и в том, что касается технологий. Он поддерживает функцию просмотра фильмов он-лайн по вай-фай и воспроизведение видео и прочих файлов с накопителей по USB. Меню проще простого к тому же есть специальный помощник, внятно объясняющий, что да как надо делать для выполнения той или иной задачи. Для фанатов именно телевизионных передач подарком станет крутой тюнер. Все каналы показывает в цифровом качестве без ряби, помех, шума картинки и с нормальным звуком.'),
(132, 12, 'Телевизор с большим набором функций, с поставленными задачами справляется на ура! Но есть небольшой недостаток, смотреть в темноте не очень комфортно лично для меня, левый нижний угол засвет дает на темных сценах больше чем остальные стороны, иногда бросается в глаза сильно. Через 1-1,5 месяца начал издавать щелчки или треск, что то похоже на треск расширения пластмассы при нагревании, заметно при включении и временами при самой работе телевизора.'),
(133, 12, 'Нам его консультант в магазине посоветовал, мол, популярная модель и нас не разочарует, в общем, он был прав - телевизором вся семья довольна! Функций в нем немало, но все вполне понятно и доступно показано в меню, особых сложностей я лично с управлением не ощутила, хотя не скажу, что я в технике спец))) Сигнал он держит очень уверенно, качественно передает изображение на цифре, но и аналоговые идут без помех. Отлично, что через юсб-вход можно к нему другое устройство подключить, муж пробовал ноутбук и планшет, все получилось на ура))) Со звуком никаких проблем нет, очень обширный диапазон громкости, мы его на максимум вообще еще ни разу не выставляли за ненадобностью)) Старшая дочь на нем обожает ролики из Ютьюба смотреть, мы его к Интернету подключили и теперь если я вдруг вечерний эфир передачи пропустила, могу его в сети найти и посмотреть, когда время есть - безусловно очень удобно, что есть такая возможность. Покупка себя оправдала))'),
(134, 12, 'Купили мы его совсем недавно. Выбирали долго, так как искали хороший телевизор с расширенными возможностями и конечно же, с поддержкой Smart TV.С первых минут настройки он не перестает радовать нас своими возможностями и прекрасным качеством рисунка. Руководство пользователя  с подробными описаниями, плюс подсказки в картинках. меню простое и понятное, удобный пульт. Wifi работает хорошо, смотрим фильмы через Smart TV.  Также телевизор воспроизводит любые файлы через флешку. Есть возможность закрепить на стену. Ну и конечно же отличный звук . Покупкой остались довольны, всем рекомендую!'),
(135, 12, 'Никогда не думал, что смарт тв такая крутая штуковина!!! Много чего можно смотреть прямо из интырнэта без всяких флэшечек! Картинка не реально крутая.'),
(136, 12, 'Классный телевизор, очень рад, что купил его! Дизайн симпатичный, ничего лишнего и в то же время всё продумано до мельчайших деталей. Отличная диагональ экрана, отличное разрешение, очень понравилась цветопередача. Вообще с разнообразием цветов и оттенков здесь полный порядок! Экран сделан удачно, глаза от него не устают. Углы обзора хорошие, всё видно с любого ракурса. Никаких помех, картинка чёткая, изображение детальное. Текст не двоится. Звук порадовал, я сначала думал, что придётся дополнительно покупать акустическую систему, чтобы кино смотреть и с хорошей картинкой, и с хорошим звуком, но потом решил, что звук вполне нормальный сам по себе. Wifi имеется и работает на удивление быстро. Телевизор отлично воспроизводит любые файлы через флешку, не тормозит и не обрывает связь. Спокойно ест многие форматы, в том числе, DivX. Ничего конвертировать не нужно, что приятно, конечно. Меню понятное и простое, управление удобное, всё делаю через пульт. Куча разных входов и разъёмов. Есть даже HDMI и оптический выход. Легко крепится на стену. В комплекте ещё настольная подставка есть, но мне удобнее было телевизор на стену повесить. '),
(137, 12, 'Телевизор крутой весьма и весьма! Меня вообще поразил поначалу его размер! До этого был стандартный Неплоский телевизор с не самой большой диагональю, так и на ней все время были видны какие-то огрехи - то пиксель битый, то светящиеся полоски по краям, в месте где экран встречается с рамкой!! А здесь при таких-то немаленьких габаритах никаких ни малейших просто недостатков у экрана я не обнаружила (ну, как и остальные домашние). Любим всей семьей в количестве четырех человек вечером посмотреть какой-нибудь новый фильм. И раньше приходилось всем сидеть впритык друг к другу, потому что иначе тем, кто по бокам восседал, ничего толком не было видно! картинка преломлялась и были сильные дефекты изображения! А здесь настолько крутые углы обзора, что не рассмотреть какие-то детали толком можно, наверное, только за него зайдя! Все цвета соответствуют действительности, нет перебора, как на старом, где газон был неоново-салатовым) С контрастностью тоже все в полном порядке. вызывает у всех гостей восхищение! красавец просто! Один у него минус - все прилипают к нему и беседу с трудом поддерживают)) В целом я могу только спасибо сказать производителю за такую крутую модель!'),
(138, 12, 'До этого был опыт с 55 дюймовым LG LA серии. У данной модели гораздо лучше качество дисплея-лучшее за такие деньги. Очень хорошие углы обзора и богатые цвета. Нет засветов на черных  сценах. Отличный встроенный звук. Ничего не хрипит. Понравилось качество сборки-ничего не скрипит, все подогнано. А вот web os тормозит, по сравнению с классической операционной системой от LG. Причём заметно. О плавности переключения приложений стоит видимо забыть лет на 7-10. Но терпимо конечно, хотя все должно летать-21 век на дворе. Очень хороший коннект с консолью и планшетом, ну плюс телефон. 3d было не нужно-выбирал для спальни. Добротный телевизор, лучший из всех за свои деньги. Я долго выбирал, и вам его советую однозначно, причём именно 43 дюйма.'),
(139, 12, 'Отличный телевизор. Настройка без проблем. Звук отличный. Собран качественно. Рекомендую!!!)))'),
(140, 12, 'Купила недавно. Картинка замечательная. К управлению привыкаю. Wifi работает хорошо. По инету ребенок гуляет без проблем. Фильмы смотрим на ура. Купили беспроводную клавиатуру с тачпадом (TOUCHBARD MT-525) и отдельно подключили мышку, работает и то и другое одновременно.Рекомендую!!!!!!!!!!!!!!!!'),
(141, 12, 'Купили этот телевизор 2 недели назад. За это время разобрались в нем, поэтому могу дать некоторые рекомендации, возможно кому-то пригодятся. При первом просмотре телевизора сильно болели глаза, очень расстроилась, но, если убавить яркость и контрастность в настройках, глаза перестают болеть. Смарт ТВ после обновления начал тормозить, пришлось удалить ненужные приложения. Вай фай работает отлично, сама настройка  достаточно понятная и не вызвала особых проблем. Если смотреть фильмы с контакта, не разворачивает видео на весь экран, на других сайтах нормально. Лучше сразу подключить мышку, пультом не очень удобно управлять. Разъем для наушников есть (не во всех моделях оказывается он есть). Качество картинки на высшем уровне, особенно в full hd качестве. Звук отличный. Вердикт: пересмотрели много моделей телевизоров LG с диагональю больше 32, эта модель наиболее удачна. Другие бренды не рассматривали, так как они уступают LG. Насчет бюджетных телевизоров ULTRA HD, брать их пока смысла нет, да и параметры там хуже. Берите, не пожалеете!'),
(142, 12, 'Телевизор очень хороший - звук, качество картинки, смарт - все на высшем уровне.Поддержка цифрового ТВ. Идеальное изображение, большой угол обзора - сижу на кухне, экран телевизора повернут почти на 90* от меня, но все равно на расстоянии 6 м видно, что там происходит. Был Филипс, вешали на стену - сбоку стоя не было ничего видно, хотя покупали не дешево. От смарта все в восторге, особенно дети - возможность смотреть любые мультфильмы и теперь их трудно выпроводить из нашей комнаты. Очень простое управление - ребенок в 2 года сам научился включать себе любые программы)). Советую!'),
(143, 12, 'Качество картинки тот личное.управлением простое.функционала максимальный.приём сигнала цифрового тв-отличный. Сеть wifi-без проблем. Фильмы и интернет-без проблем.трансляция с планшета тот личная. '),
(144, 13, 'Нормальный телевизор картинка четкая, сочная фильмы смотреть даже в 720p  одно удовольствие уже не говоря про 1080. Смарт очень быстрый  всё таки 4 ядра. Иногда только когда в настройки заходиш в мои приложения ничего не отображается но лечится выключением и включением ТВ, думаю нужно обновить прошиву.  А вообще теливизор классный. )))'),
(145, 13, 'Купили 2 недели назад, на обратной стороне написано произведен 09.2015 модель новая,  если  нет цифрового или HD телевидения, а обычное аналоговое то не стоит вообще покупать большой телевизор. Каналы HD показывает идеально, иногда ретуширует лица не очень приятно, но все зависит от сигнала или качества фильма который смотрите, смарт тв вообще шустрый по сравнению с моделями 2014 года где все подтормаживало. Дизайн на 5, скорость переключания каналов 1 секунда где то, обновляйте сразу прошивку. Брали по акции за 30990 за такую цену щас не найдешь вообще ни чего!Советую!'),
(146, 13, 'Скажу сразу я поклонник фирмы Samsung, вся техника дома этой фирмы кроме холодильника, уж больно дорогие у Samsung они. Smart tv работает отлично без каких либо нареканий. Картинка чёткая, звук хороший.'),
(147, 13, 'Телевизор выбирался только из соображения дизайна - нужна была белая рамка + SMART TV. Телевизор выдает хорошую картинку, SMART не тормозит, DLNA работает. Но затакие деньги хотелось бы диагональ побольше.'),
(148, 13, 'Купили  в комнату такой тв,выбор был среди белых цветов корпуса у тв.Остановились на нем.Прекрасный тв,показывает картинку отлично,нареканий нет.Из минусов только было заторможенность в управлении,помогло обновление телевизора до свежей прошивки.'),
(149, 13, 'Покупали для спальни. Искали именно белую модель. Сборка хорошая, дизайн современный. Интернет летает, хорошо проработанный интерфейс. Единственный минус это тормоза первые 10 секунд включения. Не картинки а именно интерфейса. Видимо раз он на андроиде, то нужно время для полной загрузки. Далее работает без тормозов. Сначала не нашел цифровых каналов. Помогло обновление системы. Так что после покупки до всех настроек подключайте к интернету и обновляйте систему'),
(150, 13, 'Тв просто бомба...настроить и подключить инет легко.Картинка отличная.Радуемся и изучаем.Искали именно белую рамку..смотрится красиво и сильно.Нам пока все нравится'),
(151, 13, 'Телевизор будет хорош только для просмотра телевидения стандартного.Что касается HD или игр с ПК/PS/XBox, речи вообще быть не должно о покупке данного телевизора.Для размера 40 дюймов (101,6 см) , разрешения 1920/1080 очень мало!Моё мнение, за данный телевизор, с такими характеристиками 34к - это слишком много! 24-28 крайняя цена.'),
(152, 13, 'Отличный телевизор! Звук и изображение качественные. Радует наличие USB и подключение к интернету.Не виснет, работает шустро.'),
(153, 13, 'Покупал телевизор по следующим критериям:1. Без 3D;2. Взамен пожилого LG 32,3.Не очень дорогой.Покупкой полностью доволен: поддерживает формат цифрового ТВ Т2, есть слот для  smart карты спутникового ТВ C+, удобный пульт, сочная картинка, отличный стерео звук. За одного  купил карту доступа спутникового ТВ НТВ 2, все настроил без ресивера '),
(154, 13, 'Внешность супер. Показывает хорошо, нареканий никаких. Как смарт тв не используется, т.к. в основном все фильмы платные, приходится подключать ноутбук и использовать как большой монитор.'),
(155, 13, 'Телевизором очень довольны - отличная картинка, яркие цвета, удобное меню. Прекрасно вписался в интерьер (телевизор нужен был именно белого цвета). '),
(156, 13, 'Впервые пишу отзыв о технике, потому что хочу этот телевизор по-настоящему порекомендовать!Модель новая, смарт очень шустрый, картинка и звук - все на отличном уровне.Был старый телек - принимал по кабельному около 50 каналов, этот сразу нашел около 200, из них около 150 - HD!!!Соглашусь, что ради аналоговых каналов такой телевизор не нужен.Подключал флешку 8 гб, потом жесткий диск на 500 Гб - все читается на ура!!!Пульт удобный, меню логичное - все понятно!В основном пытаюсь смотреть фильмы 1080...все тянет, картинка потрясающая!Спорт смотреть тоже на 5+...100 Гц даёт о себе знать!!!'),
(157, 13, 'После поломки телевизора LG LV3700 SMART(накрылась материнка после трёх лет эксплуатации), решил  рассмотреть в качестве замены  бренд Самсунг.  Приоритетно искал с белой рамкой. Данный девайс хорошо вписался в кухню.  Летающий интернет, сопряжение со смартфоном, планшетом моментальное через скачанную программу AllShare на Андроидмаркете, краски очень сочные, звук хороший не бубнит как у некоторых моделей. '),
(158, 13, 'Телевизор очень классный. Белая рамка смотрится очень стильно. Мне очень понравился, краски яркие. Рекомендую.'),
(159, 13, 'Телевизор очень функциональный, быстрый, каждую неделю бывают обновления,  большой выбор приложений в магазине (большинство из них бесплатные). По стилю тоже нет претензий . Подойдет под любой интерьер. Идеальный телевизор я в него влюблен.'),
(160, 13, 'Отличный телевизор советую всем есть небольшие  затемнения по углам но в общем своих денег он стоит '),
(161, 13, 'Приобретением довольна. Искала именно белый и достаточно бюджетный. Отлично вписался. Тут писали, что не используют как смарт, у нас наоборот. Зачем подключать ноут к смарт телевизору вообще не понятно, если с него так же как и с компьютера можно выходить в интернет. Настройки  все элементарные. Единственный пожалуй минус - когда выключаю он как бы потрескивает немного, остывает чтоли? а может мы много сморим телевизор?))) '),
(162, 14, 'Купили этот телевизор три недели назад. Теперь могу сказать, что выбор оказался правильным. Искали доступный телевизор диагональю 32 дюйма с разрешением FullHD без доступа к Интернету и другим навороченным функциям. Philips 32PFT4100 подошёл как нельзя кстати. Картинка хорошая, насыщенная, контрастная. Есть автоматические и ручные настройки. Удобное меню. Интерфейс быстрый. Ничего нигде не виснет и не тупить, как в некоторых Смарт ТВ. Сам телевизор выглядит хорошо. Конечно, видно, что это бюджетная модель, но сборка хорошая. ТВ-подставка пластиковая, но очень устойчивая. Можно также крепить к стене. Единственный недочёт могу поставить за звук. Он громкий, чёткий, но плоский. Нет стереоэффекта и эффекта объёмности, какой был на старом ТВ. Особенно сильно это чувствуется на фильмовых и музыкальных каналах. Так что, если нужен дешевый телевизор с FullHD, Philips 32PFT4100 - хороший выбор.'),
(163, 14, 'По стечению обстоятельств оказались в магазине М.Видео и увидели этот шедевр. Прекрасная и четкая картинка поразили. Мы давно присматривали с женой телевизор, не хотелось брать что то вычурное и слишком дорогое, а эта модель воплощение простоты и комфорта. Если вам нужен не мудрёный и удобный в использовании ТВ, то это то что вы ищете.  Покупку совершили стихийно и ни разу не пожалели.  Отличный выбор.'),
(164, 14, 'Классный тв! цена, качество))'),
(165, 14, 'Купил два таких телевизора,потому что телевизор просто обалденный,картинка супер.У меня ещё два телевизора филипс дорогие модели но показывают они похуже.Всем советую эту модель!'),
(166, 14, 'Хороший телевизор по приемлемой цене. Работает уже третий месяц, ни каких проблем пока не возникало. Работает как на антенну, так и со спутникового ресивера. Иногда использую записи фильмов с флешки. Нареканий нет.'),
(167, 14, 'Выбор хороший. Свои деньги он стоит, как телевизор на кухню просто идеален. Картинка четкая, звук хороший громкий. При настройке каналов для России нашел всего два цифровых и 46 аналоговых, поставил на Турцию и все 89 цифровых каналов были найдены. Из минусов могу сказать только о его толщине, уж больно большая для современных телевизоров и непонятном дизайнерском ходе в виде отростка в нижней части где написана марка.   '),
(168, 14, 'Беру уже второй телевизор от Филиппса, есть 5507, для Мамы взял эту модель, с настройками чуть повозился главное в настройках Финляндию (Башинформсвязь 159 цифр. и 70 аналог.) ставить иначе по Российским настройкам выйдет печалька( 14 цифр. 70 аналог.с картинкой слабой) сам чуть не расстроился,  картинка отличная, проверил на чтение флешки 32 гб. форматы видео  720 1080 с размером 8 гб. фильмы тянет и даже не плохо перематывает доволен этим теликом и надеюсь Мама тоже.'),
(169, 14, 'За свою цену получил супер легкий и качественный ТВ.С флешки читает видео и аудио файлы. Вообще супер телек.НD со стороны видно.покупкой доволен, тем более дешевый такой.Настройки приветственные очень просты, на интуиции все делаешь.Один минус, пахнет пластиком.'),
(170, 14, 'телевизор честно заслуживает 5 балов  обновил по телевизора он стал показывать лучше 200 герц'),
(171, 14, 'За ту цену что была по акции после наступления нового 2016 года лучшего ничего не купишь. Главное - цифра идёт на ура! Твёрдая 5. Если обычная антенна, то купите кинескоп 90-х и кайфуйте. Про углы обзора не пиликайте. Они отличные. Относительно долгий запуск с высвечиванием названия фирмы - не минус, а дело привычки. Замороченные настройки? Вы замороченных настроек не видели. Не хуже, а местами и лучше чем у Самсуньга. Повторюсь. Телек для цифрового изображения. Если по кабельному у вас на нём плохая картинка, то вас обманывают - это не цифра. Купите пакет HD каналов и наконец поймите, что не прогадали с телевайзером. '),
(172, 14, 'Купил 324100 по акции. Это был единственный плюс )- Сразу подцепил цифру  , в сравнении с LG такой-же ценовой показывает ХУЖЕ. Пульт реагирует коряво .Настройка НЕ интуитивная , пришлось повозиться . Углы экрана затемняет .При просмотре с флешки не запоминает , где ты остановился ,приходится перематывать до нужного момента.Если бы не лэйбл , он бы стоил 10-12к , на уровне супры ) +Но что вы хотели за такую цену? '),
(173, 14, 'ДОСТОИНСТВА: Невероятная чёткость картинки - это неоспоримо! Чувствительный цифровой тюнер. Малая цена. НЕДОСТАТКИ: Настройка  меню, по сложности, похожа на компьютерное программирование. Многие пункты меню имеют неправильное название (например фоновая подсветка названа контрастностью) из-за чего например, имеется две настройки контрастности.  100 Гц развёртка не позволяет плавности в динамичных сценах. Картинка идёт рывками и смазывается. Угол обзора в пределах 30 градусов, дальше контрастность меняется. И главный для меня недостаток это direct LED подсветка. Увы она сейчас почти везде. Если вы смотрели минуту не отрываясь на горящий светофор, то поймёте, что происходит с глазами, после часового просмотра такого экрана. Я просто от него слепну. А при убавлении яркости и контрастности, картинка становится блеклой и несмотрибельной.ВЫВОД: Если есть средства, лучше добавить 10 тыс. и купить LG на IPS матрице, или Samsung на 200Гц.  Это и зрение сохранит, и плавность движений в кадре будет на высоте.'),
(174, 14, 'Выбрал телевизор на кухню в гостиной стоит самсунг смарт честно скажу нету отличия по качеству изображения и звука! Очень доволен покупкой.    '),
(175, 14, 'Очень хорошая модель этого телевизора. Купили на дачу, смотрим его с удовольствием, качество отличное, то что надо!!!'),
(176, 14, 'Хороший экран под любым углом не выцветает . Нормальный звук не хрипит и громкости достаточно даже для пожилых. Есть два HDMI и USB который проигрывал все форматы которые я запускал. Удобная подставка центральная, мне было важно. К недостаткам  можно отнести только отсутствие тюльпанного входа и медленное включение и переключение каналов . У меня два таких телевизора пока проблем не возникало '),
(177, 14, 'Модель доступна по цене, удобна в обращении.  Цифровое изображение отличное. Пользуемся около трех месяцев. Пока все устраивает.'),
(178, 14, 'Отличный телевизор. Мне особенно пригодилась функция, когда его можно использовать как монитор. Тонкий, стильный. Качественная передача цвета. '),
(179, 16, 'Не нарадуемся нашим новым телеком - и звучит великолепно, и показывает супер-четко! Каналы шустренько переключаются, даже Смарт-тв начал как-то быстрее работать. Угол обзора классный, можно комфортно устроиться на диване в любом положении и не подстраиваться под телик) Есть режимчик записи, пару раз его опробовала уже - все записывает без пропусков! С интернетом, правда, случаются мимолетные глюки, но не критично. Довольны покупкой на все 200))');

-- --------------------------------------------------------

--
-- Структура таблицы `source_pars`
--

CREATE TABLE `source_pars` (
  `id` int(11) NOT NULL,
  `value` varchar(145) NOT NULL,
  `tr_name` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `source_pars`
--

INSERT INTO `source_pars` (`id`, `value`, `tr_name`) VALUES
(3, 'Эльдорадо', 'Eldorado'),
(6, 'DNS', 'DNS'),
(8, 'М-видео', 'M-video'),
(9, 'Техношое', 'Tehnoshoe'),
(10, 'Техношок', 'Tehnoshok');

-- --------------------------------------------------------

--
-- Структура таблицы `table_test`
--

CREATE TABLE `table_test` (
  `id` int(11) NOT NULL,
  `name` varchar(145) NOT NULL,
  `surname` varchar(145) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `table_test`
--

INSERT INTO `table_test` (`id`, `name`, `surname`) VALUES
(1, 'ciel', 'phantomhive');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`) VALUES
(1, '127.0.0.1', 'administrator', '$2a$07$SeBknntpZror9uyftVopmu61qg0ms8Qv1yV6FG.kQOSM.9QhmTo36', '', 'admin@admin.com', '', NULL, NULL, NULL, 1268889823, 1464292473, 1, 'Admin', 'istrator', 'ADMIN', '0'),
(2, '127.0.0.1', NULL, '$2y$08$x/AV.GDKCM6F1FoDSdTs/OqBXdQ4cX.QhaV9fEXCpg5YLyI39UgYe', NULL, 'alex453542026@yandex.ru', NULL, NULL, NULL, NULL, 1458722044, 1458737244, 1, 'ciel', 'phantomhive', '0', '0');

-- --------------------------------------------------------

--
-- Структура таблицы `users_groups`
--

CREATE TABLE `users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(6, 2, 2);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `default_property`
--
ALTER TABLE `default_property`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `item_rev`
--
ALTER TABLE `item_rev`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `link_items`
--
ALTER TABLE `link_items`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `list_parser`
--
ALTER TABLE `list_parser`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `prop_parser`
--
ALTER TABLE `prop_parser`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `property_items`
--
ALTER TABLE `property_items`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `rev_table`
--
ALTER TABLE `rev_table`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `source_pars`
--
ALTER TABLE `source_pars`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `table_test`
--
ALTER TABLE `table_test`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  ADD KEY `fk_users_groups_users1_idx` (`user_id`),
  ADD KEY `fk_users_groups_groups1_idx` (`group_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `default_property`
--
ALTER TABLE `default_property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT для таблицы `item_rev`
--
ALTER TABLE `item_rev`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT для таблицы `link_items`
--
ALTER TABLE `link_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `list_parser`
--
ALTER TABLE `list_parser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT для таблицы `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `prop_parser`
--
ALTER TABLE `prop_parser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;
--
-- AUTO_INCREMENT для таблицы `property_items`
--
ALTER TABLE `property_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=511;
--
-- AUTO_INCREMENT для таблицы `rev_table`
--
ALTER TABLE `rev_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=180;
--
-- AUTO_INCREMENT для таблицы `source_pars`
--
ALTER TABLE `source_pars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT для таблицы `table_test`
--
ALTER TABLE `table_test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;--
-- База данных: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;

DELIMITER $$
--
-- Процедуры
--
CREATE DEFINER=`` PROCEDURE `AddGeometryColumn` (`catalog` VARCHAR(64), `t_schema` VARCHAR(64), `t_name` VARCHAR(64), `geometry_column` VARCHAR(64), `t_srid` INT)  begin
  set @qwe= concat('ALTER TABLE ', t_schema, '.', t_name, ' ADD ', geometry_column,' GEOMETRY REF_SYSTEM_ID=', t_srid); PREPARE ls from @qwe; execute ls; deallocate prepare ls; end$$

CREATE DEFINER=`` PROCEDURE `DropGeometryColumn` (`catalog` VARCHAR(64), `t_schema` VARCHAR(64), `t_name` VARCHAR(64), `geometry_column` VARCHAR(64))  begin
  set @qwe= concat('ALTER TABLE ', t_schema, '.', t_name, ' DROP ', geometry_column); PREPARE ls from @qwe; execute ls; deallocate prepare ls; end$$

DELIMITER ;
--
-- База данных: `test2`
--
CREATE DATABASE IF NOT EXISTS `test2` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `test2`;

-- --------------------------------------------------------

--
-- Структура таблицы `default_property`
--

CREATE TABLE `default_property` (
  `id` int(11) NOT NULL,
  `lvl_property` int(11) DEFAULT NULL,
  `type_property` varchar(255) DEFAULT NULL,
  `class_property` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `placeholder_property` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `default_property`
--

INSERT INTO `default_property` (`id`, `lvl_property`, `type_property`, `class_property`, `value`, `placeholder_property`) VALUES
(1, 1, 'text', 'name_source', '', 'Название источника'),
(2, 2, 'text', 'name_parser', '', 'Название категории'),
(3, 3, 'textarea', 'url', '', 'Ссылка на сайт'),
(4, 4, 'text', 'class_item', '', 'Класс элемента'),
(5, 5, 'text', 'next_link', '', 'класс paginator''a'),
(6, 6, 'text', 'name_item', '', 'название товара'),
(7, 7, 'text', 'code_item', '', 'код товара'),
(8, 8, 'textarea', 'exceptions', '', 'исключения'),
(9, 9, 'textarea', 'link_reviews', '', 'шаблон ссылки на отзывы'),
(10, 10, 'text', 'class_review', '', 'класс текста отзыва');

-- --------------------------------------------------------

--
-- Структура таблицы `groups`
--

CREATE TABLE `groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'members', 'General User'),
(1, 'admin', 'Administrator'),
(2, 'members', 'General User'),
(1, 'admin', 'Administrator'),
(2, 'members', 'General User'),
(1, 'admin', 'Administrator'),
(2, 'members', 'General User'),
(1, 'admin', 'Administrator'),
(2, 'members', 'General User');

-- --------------------------------------------------------

--
-- Структура таблицы `link_items`
--

CREATE TABLE `link_items` (
  `id` int(11) NOT NULL,
  `url` varchar(1000) DEFAULT NULL,
  `id_parser` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `link_items`
--

INSERT INTO `link_items` (`id`, `url`, `id_parser`) VALUES
(372, '/products/smartfon-samsung-galaxy-core-prime-ve-sm-g361h-gray-30022654', 1),
(373, '/products/smartfon-lg-g4-h818-black-leather-30022404', 1),
(374, '/products/smartfon-lenovo-vibe-shot-z90a40-red-30022729', 1),
(375, '/products/smartfon-microsoft-lumia-640-ds-white-30022417', 1),
(376, '/products/smartfon-samsung-galaxy-a3-2016-sm-a310-pink-gold-30024250', 1),
(377, '/products/smartfon-lg-k10-3g-k410-white-30024310', 1),
(378, '/products/smartfon-samsung-galaxy-s6-ss-32gb-sm-g920f-white-pearl-30022040', 1),
(379, '/products/smartfon-samsung-galaxy-s7-edge-32gb-ds-sm-g935fd-silver-titanium-30024654', 1),
(380, '/products/smartfon-lenovo-vibe-p1m-black-30023771', 1),
(381, '/products/smartfon-samsung-galaxy-a3-2016-sm-a310-white-30024251', 1),
(382, '/products/smartfon-sony-xperia-z5-e6653-pink-30024321', 1),
(383, '/products/smartfon-samsung-galaxy-a7-2016-sm-a710-gold-30024213', 1),
(384, '/products/smartfon-samsung-galaxy-s7-edge-32gb-ds-sm-g935fd-gold-platinum-30024652', 1),
(385, '/products/smartfon-samsung-galaxy-s7-32gb-ds-sm-g930fd-silver-titanium-30024650', 1),
(386, '/products/smartfon-asus-zenfone-5-a502cg-2b066ru-white-30021923', 1),
(387, '/products/smartfon-huawei-nexus-6p-64gb-silver-30024153', 1),
(388, '/products/smartfon-prestigio-muze-d3-psp-3530-duo-gold-30024432', 1),
(389, '/products/smartfon-samsung-galaxy-s6-edge-32gb-sm-g925f-green-30023050', 1),
(390, '/products/smartfon-htc-desire-620g-dual-sim-matt-grey-orange-trim-30022333', 1),
(391, '/products/smartfon-sony-xperia-m4-aqua-lte-e2303-white-30022701', 1),
(392, '/products/smartfon-samsung-galaxy-s6-edge-128gb-sm-g925f-platinum-gold-30022130', 1),
(393, '/products/smartfon-sony-xperia-m4-aqua-lte-e2303-coral-30022874', 1),
(394, '/products/smartfon-htc-desire-620g-dual-sim-matt-grey-light-grey-trim-30022332', 1),
(395, '/products/smartfon-htc-desire-620g-dual-sim-gloss-white-light-grey-trim-30022331', 1),
(396, '/products/smartfon-htc-one-m9-eea-gunmetal-gray-30022376', 1),
(397, '/products/smartfon-samsung-galaxy-note-5-sm-n920-64gb-gold-30023757', 1),
(398, '/products/smartfon-lg-class-h650e-silver-30024150', 1),
(399, '/products/smartfon-samsung-galaxy-s6-edge-128gb-sm-g925f-black-sapphire-30022125', 1),
(400, '/products/smartfon-lenovo-vibe-p1m-white-30023831', 1),
(401, '/products/smartfon-sony-xperia-z5-e6653-white-30023597', 1),
(402, '/products/smartfon-sony-xperia-z3-lte-e6553-white-30022870', 1),
(403, '/products/smartfon-microsoft-lumia-640-ds-bright-orange-30022415', 1),
(404, '/products/smartfon-samsung-galaxy-s6-edge-64gb-sm-g925f-white-pearl-30022124', 1),
(405, '/products/smartfon-htc-desire-526g-dualsim-stealth-black-30022384', 1),
(406, '/products/smartfon-asus-zenfone-selfie-zd551kl-32gb-white-1b130ru-30023486', 1),
(407, '/products/smartfon-huawei-shotx-ath-ul01-gold-30023971', 1),
(408, '/products/smartfon-samsung-galaxy-j1-2016-sm-j120-gold-30024594', 1),
(409, '/products/smartfon-sony-xperia-z5-premium-dual-e6883-black-30023849', 1),
(410, '/products/smartfon-asus-zenfone-2-selfie-zd551kl-32gb-1i131ru-pink-30023781', 1),
(411, '/products/smartfon-sony-xperia-z3-d6603-white-30021019', 1),
(412, '/products/smartfon-asus-zenfone-2-selfie-zd551kl-32gb-1k132ru-blue-30023782', 1),
(413, '/products/smartfon-samsung-galaxy-s6-duos-64gb-sm-g920fd-white-pearl-30022122', 1),
(414, '/products/smartfon-sony-xperia-z5-e6653-gold-30023598', 1),
(415, '/products/smartfon-sony-xperia-z3-lte-e6553-copper-30022871', 1),
(416, '/products/smartfon-htc-desire-816g-dual-sim-white-30022340', 1),
(417, '/products/smartfon-huawei-ascend-y6-black-scl-u31-30023925', 1),
(418, '/products/smartfon-huawei-ascend-y6-white-scl-u31-30023924', 1),
(419, '/products/smartfon-philips-s396-black-30023869', 1),
(420, '/products/smartfon-acer-liquid-z220-black-30022402', 1),
(421, '/products/smartfon-sony-xperia-z5-compact-e5823-coral-30023548', 1),
(422, '/products/smartfon-asus-zenfone-2-selfie-zd551kl-32gb-6j135ru-silver-30023785', 1),
(423, '/products/smartfon-asus-zenfone-2-selfie-zd551kl-32gb-6c133ru-red-30023783', 1),
(424, '/products/smartfon-lg-nexus-5x-16gb-white-30023930', 1),
(425, '/products/smartfon-lg-h324-leon-white-30024100', 1),
(426, '/products/smartfon-philips-s616-dark-grey-30024291', 1),
(427, '/products/smartfon-lg-nexus-5x-16gb-mint-30023929', 1),
(428, '/products/smartfon-asus-zenfone-selfie-zd551kl-16gb-6g128ru-gold-30024225', 1),
(429, '/products/smartfon-htc-one-a9-opal-silver-30024205', 1),
(430, '/products/smartfon-htc-one-a9-carbon-grey-30024204', 1),
(431, '/products/smartfon-htc-one-m9-gold-on-silver-30024206', 1),
(432, '/products/smartfon-htc-one-m9-gold-on-gold-30024198', 1),
(433, '/products/smartfon-sony-xperia-m4-aqua-dual-lte-e2333-black-30022698', 1),
(434, '/products/smartfon-huawei-ascend-y6-white-scl-l21-30023923', 1),
(435, '/products/smartfon-htc-desire-326g-dual-sim-white-birch-30023902', 1),
(436, '/products/smartfon-htc-desire-626g-dual-sim-white-30023732', 1),
(437, '/products/smartfon-philips-xenium-i908-black-30021086', 1),
(438, '/products/smartfon-philips-xenium-v526-navy-30023880', 1),
(439, '/products/smartfon-huawei-ascend-g7-silver-30021926', 1),
(440, '/products/smartfon-lenovo-vibe-shot-z90a40-white-30023798', 1),
(441, '/products/smartfon-asus-zenfone-2-selfie-zd551kl-16gb-6j129ru-silver-30023780', 1),
(442, '/products/smartfon-asus-zenfone-2-selfie-zd551kl-16gb-6c127ru-red-30023779', 1),
(443, '/products/smartfon-asus-zenfone-selfie-zd551kl-16gb-1i125ru-pink-30023777', 1),
(444, '/products/smartfon-asus-zenfone-2-selfie-zd551kl-16gb-1b124ru-white-30023776', 1),
(445, '/products/smartfon-htc-desire-820g-dual-sim-white-30023904', 1),
(446, '/products/smartfon-sony-xperia-z5-compact-e5823-yellow-30023547', 1),
(447, '/products/smartfon-sony-xperia-z3-dual-d6633-white-30021040', 1),
(448, '/products/smartfon-huawei-honor-4c-black-30022341', 1),
(449, '/products/smartfon-samsung-galaxy-a5-sm-a500f-gold-30021706', 1),
(450, '/products/smartfon-yotaphone-2-black-yd201-30021990', 1),
(451, '/products/smartfon-samsung-galaxy-grand-prime-sm-g531h-gray-30022658', 1),
(452, '/products/smartfon-samsung-galaxy-s6-edge-32gb-sm-g925f-platinum-gold-30022123', 1),
(453, '/products/smartfon-microsoft-lumia-640-ds-black-30022416', 1),
(454, '/products/smartfon-samsung-galaxy-a3-sm-a300f-gold-30021726', 1),
(455, '/products/smartfon-lg-k10-3g-k410-dark-blue-30024309', 1),
(456, '/products/smartfon-samsung-galaxy-a5-sm-a500f-white-30021628', 1),
(457, '/products/smartfon-samsung-galaxy-a3-2016-sm-a310-gold-30024249', 1),
(458, '/products/smartfon-huawei-honor-7-16gb-grey-plk-l01-30023365', 1),
(459, '/products/smartfon-samsung-galaxy-a5-2016-sm-a510-gold-30024244', 1),
(460, '/products/smartfon-samsung-galaxy-a5-2016-sm-a510-pink-gold-30024245', 1),
(461, '/products/smartfon-lenovo-a5000-black-30022329', 1),
(462, '/products/smartfon-samsung-galaxy-s6-ss-32gb-sm-g920f-black-sapphire-30022041', 1),
(463, '/products/smartfon-lenovo-a1000-dual-sim-3g-white-30023852', 1),
(464, '/products/smartfon-huawei-honor-5x-grey-kiw-l21-30024277', 1),
(465, '/products/smartfon-alcatel-onetouch-pop-3-5015d-soft-silver-black-30023760', 1),
(466, '/products/smartfon-lenovo-a319-white-30021935', 1),
(467, '/products/smartfon-sony-xperia-z5-compact-e5823-white-30023545', 1),
(468, '/products/smartfon-samsung-galaxy-s7-32gb-ds-sm-g930fd-black-onyx-30024649', 1),
(469, '/products/smartfon-alcatel-onetouch-pop-3-5015d-soft-gold-black-30023761', 1),
(470, '/products/smartfon-samsung-galaxy-a3-2016-sm-a310-black-30024248', 1),
(471, '/products/smartfon-lg-g4s-h736-silver-30022659', 1),
(472, '/products/smartfon-samsung-galaxy-a3-sm-a300f-white-30021724', 1),
(473, '/products/smartfon-asus-zenfone-2-laser-ze500kg-1a067ru-black-30023786', 1),
(474, '/products/smartfon-htc-desire-626g-dual-sim-eea-blue-30022514', 1),
(475, '/products/smartfon-lenovo-a2010a-dual-sim-lte-white-30023434', 1),
(476, '/products/smartfon-sony-xperia-c4-e5303-black-30022699', 1),
(477, '/products/smartfon-sony-xperia-z5-e6653-graphite-black-30023596', 1),
(478, '/products/smartfon-samsung-galaxy-s7-32gb-ds-sm-g930fd-gold-platinum-30024651', 1),
(479, '/products/smartfon-lg-g4-h818-brown-leather-30022403', 1),
(480, '/products/smartfon-fly-era-nano-2-iq239-black-30023581', 1),
(481, '/products/smartfon-samsung-galaxy-s6-duos-64gb-sm-g920fd-black-sapphire-30022120', 1),
(482, '/products/smartfon-sony-xperia-z5-compact-e5823-black-30023546', 1),
(483, '/products/smartfon-asus-zenfone-2-laser-ze550kl-1a047ru-black-30024227', 1),
(484, '/products/smartfon-alcatel-onetouch-pop-2-4045d-white-30022593', 1),
(485, '/products/smartfon-htc-desire-526g-dualsim-terra-white-and-glasser-blue-30022385', 1),
(486, '/products/smartfon-htc-one-m9-silver-gold-30022433', 1),
(487, '/products/smartfon-huawei-honor-7-silver-plk-l01-30023364', 1),
(488, '/products/smartfon-sony-xperia-z3-lte-e6553-black-30022872', 1),
(489, '/products/smartfon-huawei-ascend-y6-black-scl-l21-30023922', 1),
(490, '/products/smartfon-samsung-galaxy-a7-2016-sm-a710-black-30024212', 1),
(491, '/products/smartfon-texet-x-quad-tm-4503-30022728', 1),
(492, '/products/smartfon-texet-x-smart-tm-4071-black-30022722', 1),
(493, '/products/smartfon-philips-s309-black-30023437', 1),
(494, '/products/smartfon-samsung-galaxy-s6-edge-32gb-sm-g925f-white-pearl-30022042', 1),
(495, '/products/smartfon-lg-l-fino-d295-black-30021928', 1),
(496, '/products/smartfon-samsung-galaxy-s6-edge-64gb-sm-g925f-black-sapphire-30022127', 1),
(497, '/products/smartfon-samsung-galaxy-grand-prime-sm-g531h-white-30022657', 1),
(498, '/products/smartfon-lenovo-a536-black-30021192', 1),
(499, '/products/smartfon-samsung-galaxy-a3-sm-a300f-black-30021725', 1),
(500, '/products/smartfon-samsung-galaxy-ace-4-neo-sm-g318h-ds-black-30022656', 1),
(501, '/products/smartfon-microsoft-lumia-640-lte-ds-black-30022525', 1),
(502, '/products/smartfon-lenovo-a2010a-dual-sim-lte-black-30023433', 1),
(503, '/products/smartfon-lg-h422-spirit-30022457', 1),
(504, '/products/smartfon-microsoft-lumia-950-ds-black-30023992', 1),
(505, '/products/smartfon-prestigio-muze-a3-3452-duo-black-30022144', 1),
(506, '/products/smartfon-prestigio-wize-d3-3505-duo-30022743', 1),
(507, '/products/smartfon-lg-g3-stylus-d690-black-30021158', 1),
(508, '/products/smartfon-samsung-galaxy-a5-2016-sm-a510-black-30024246', 1),
(509, '/products/smartfon-lg-nexus-5x-16gb-black-30023858', 1),
(510, '/products/smartfon-lenovo-a5000-white-30022328', 1),
(511, '/products/smartfon-samsung-galaxy-ace-4-neo-sm-g318h-ds-white-30022655', 1),
(512, '/products/smartfon-prestigio-muze-c3-3504-duo-black-30023763', 1),
(513, '/products/smartfon-samsung-galaxy-a5-2016-sm-a510-white-30024247', 1),
(514, '/products/smartfon-lg-h324-leon-black-titan-30022458', 1),
(515, '/products/smartfon-samsung-galaxy-s6-ss-32gb-sm-g920f-gold-platinum-30022129', 1),
(516, '/products/smartfon-samsung-galaxy-core-2-ds-sm-g355-black-30020755', 1),
(517, '/products/smartfon-lenovo-vibe-shot-z90a40-grey-30022740', 1),
(518, '/products/smartfon-samsung-galaxy-s6-edge-plus-32gb-platinum-gold-30022910', 1),
(519, '/products/smartfon-lenovo-a536-white-30022425', 1),
(520, '/products/smartfon-lg-h502-magna-black-30022276', 1),
(521, '/products/smartfon-sony-xperia-z3-compact-d5803-white-30021014', 1),
(522, '/products/smartfon-samsung-galaxy-a5-sm-a500f-black-30021705', 1),
(523, '/products/smartfon-alcatel-onetouch-pop-star-3g-5022d-white-green-yellow-30023883', 1),
(524, '/products/smartfon-samsung-galaxy-s7-edge-32gb-ds-sm-g935fd-black-onyx-30024653', 1),
(525, '/products/smartfon-samsung-galaxy-s6-edge-64gb-sm-g925f-platinum-gold-30022128', 1),
(526, '/products/smartfon-asus-zenfone-2-laser-ze550kl-1b048ru-white-30023790', 1),
(527, '/products/smartfon-lg-class-h650e-shiny-gold-30024066', 1),
(528, '/products/smartfon-samsung-galaxy-a7-2016-sm-a710-white-30024214', 1),
(529, '/products/smartfon-lg-ray-x190-silver-30023970', 1),
(530, '/products/smartfon-sony-xperia-m4-aqua-lte-e2303-black-30022702', 1),
(531, '/products/smartfon-lg-h324-leon-black-gold-30023765', 1),
(532, '/products/smartfon-lenovo-a1000-dual-sim-3g-black-30023814', 1),
(533, '/products/smartfon-samsung-galaxy-note-5-sm-n920-64gb-black-sapphire-30023758', 1),
(534, '/products/smartfon-fly-nimbus-1-black-fs451-30022797', 1),
(535, '/products/smartfon-texet-x-style-tm-4515-black-30022751', 1),
(536, '/products/smartfon-fly-stratus-1-black-fs401-30022796', 1),
(537, '/products/smartfon-htc-desire-816g-dual-sim-gray-30022338', 1),
(538, '/products/smartfon-philips-s307-black-yellow-30023868', 1),
(539, '/products/smartfon-sony-xperia-c5-ultra-dual-e5533-black-30023431', 1),
(540, '/products/smartfon-philips-s308-black-30020449', 1),
(541, '/products/smartfon-asus-zenfone-2-ze500kg-1c069ru-red-30023640', 1),
(542, '/products/smartfon-lenovo-a6010-dual-sim-8gb-lte-black-30024335', 1),
(543, '/products/smartfon-samsung-galaxy-j-mini-sm-j105-black-30024621', 1),
(544, '/products/smartfon-huawei-honor-5x-silver-kiw-l21-30024275', 1),
(545, '/products/smartfon-asus-zenfone-go-zc500tg-1c049ru-30024229', 1),
(546, '/products/smartfon-asus-zenfone-go-zc500tg-1b048ru-30024230', 1),
(547, '/products/smartfon-asus-zenfone-2-selfie-zd551kl-16gb-1k126ru-blue-30023778', 1),
(548, '/products/smartfon-huawei-y5c-black-30022560', 1),
(549, '/products/smartfon-sony-xperia-z2-d6503-black-bez-garnitur-30020766', 1),
(550, '/products/smartfon-lenovo-p70-dark-blue-30022282', 1),
(551, '/products/smartfon-lg-g4c-h522y-silver-30022769', 1),
(552, '/products/smartfon-lenovo-a319-black-30021914', 1),
(553, '/products/smartfon-samsung-galaxy-s6-edge-32gb-sm-g925f-black-sapphire-30022043', 1),
(554, '/products/smartfon-samsung-galaxy-s6-edge-plus-32gb-black-sapphire-30022909', 1),
(555, '/products/smartfon-microsoft-lumia-550-black-30023993', 1),
(556, '/products/smartfon-texet-x-line-tm-5006-30022776', 1),
(557, '/products/smartfon-samsung-galaxy-s6-edge-special-ed-128gb-sm-g925f-green-30022623', 1),
(558, '/products/smartfon-alcatel-onetouch-pop-3-5015d-black-leather-30024177', 1),
(559, '/products/smartfon-texet-x-mega-tm-5503-30022778', 1),
(560, '/products/smartfon-asus-zenfone-2-laser-ze500kg-6j071ru-silver-30023787', 1),
(561, '/products/smartfon-fly-nimbus-4-black-fs551-30022799', 1),
(562, '/products/smartfon-asus-zenfone-2-selfie-zd551kl-32gb-6g134ru-gold-30023784', 1),
(563, '/products/smartfon-lenovo-vibe-s1-dual-sim-lte-white-30023987', 1),
(564, '/products/smartfon-sony-xperia-z3-compact-d5803-black-30021016', 1),
(565, '/products/smartfon-sony-xperia-z3-d6603-black-30021018', 1),
(566, '/products/smartfon-lenovo-vibe-z2-pro-k920-titanium-30021633', 1),
(567, '/products/smartfon-samsung-galaxy-j1-sm-j100f-black-30022696', 1),
(568, '/products/smartfon-samsung-galaxy-j1-sm-j100f-blue-30022697', 1),
(569, '/products/smartfon-asus-zenfone-go-zc500tg-1a047ru-30024231', 1),
(570, '/products/smartfon-lenovo-a319-red-30021760', 1),
(571, '/products/smartfon-texet-x-style-tm-4515-white-30022752', 1),
(572, '/products/smartfon-moto-x-style-lte-black-30024646', 1),
(573, '/products/smartfon-samsung-galaxy-j-mini-sm-j105-white-30024623', 1),
(574, '/products/smartfon-4good-s450m-3g-black-30024345', 1),
(575, '/products/smartfon-4good-s501m-3g-black-30024344', 1),
(576, '/products/smartfon-alcatel-pop-star-3g-5022d-classy-white-gold-silver-30023884', 1),
(577, '/products/smartfon-asus-zc451tg-zenfone-go-8gb-black-30024675', 1),
(578, '/products/smartfon-asus-zc451tg-zenfone-go-8gb-pink-30024677', 1),
(579, '/products/smartfon-asus-zc451tg-zenfone-go-8gb-white-30024668', 1),
(580, '/products/smartfon-asus-zc550kl-zenfone-max-16gb-black-30024673', 1),
(581, '/products/smartfon-asus-zc550kl-zenfone-max-16gb-white-30024674', 1),
(582, '/products/smartfon-asus-ze601kl-zenfone-2-laser-32gb-gold-30024672', 1),
(583, '/products/smartfon-asus-ze601kl-zenfone-2-laser-32gb-red-30024671', 1),
(584, '/products/smartfon-asus-zenfone-2-laser-ze500kg-1b068ru-white-30024178', 1),
(585, '/products/smartfon-asus-zenfone-2-laser-ze550kl-1c049ru-red-30024228', 1),
(586, '/products/smartfon-asus-zenfone-2-laser-ze601kl-6j039ru-silver-30024343', 1),
(587, '/products/smartfon-asus-zx551ml-zenfone-2-zoom-128gb-black-30024669', 1),
(588, '/products/smartfon-fly-nimbus-3-white-fs501-30024615', 1),
(589, '/products/smartfon-htc-desire-326g-ds-black-onyx-30024199', 1),
(590, '/products/smartfon-htc-desire-620g-ds-gloss-white-blue-trim-30024220', 1),
(591, '/products/smartfon-htc-desire-728g-ds-purple-myst-30024207', 1),
(592, '/products/smartfon-htc-desire-728g-ds-white-luxury-30024203', 1),
(593, '/products/smartfon-htc-one-e9-dual-sim-delicate-rose-30023901', 1),
(594, '/products/smartfon-htc-one-e9-dual-sim-slick-silver-30023900', 1),
(595, '/products/smartfon-huawei-honor-7-premium-gold-plk-l01-30024678', 1),
(596, '/products/smartfon-huawei-nexus-6p-32gb-silver-30024152', 1),
(597, '/products/smartfon-huawei-shotx-ath-ul01-white-30023972', 1),
(598, '/products/smartfon-lenovo-a2010a-dual-sim-lte-red-30024333', 1),
(599, '/products/smartfon-lenovo-a6010-dual-sim-8gb-lte-red-30024336', 1),
(600, '/products/smartfon-lenovo-a6010-dual-sim-8gb-lte-white-30024334', 1),
(601, '/products/smartfon-lenovo-vibe-s1-dual-sim-lte-dark-blue-30024383', 1),
(602, '/products/smartfon-lenovo-vibe-s1-dual-sim-lte-gold-30024384', 1),
(603, '/products/smartfon-lg-v10-black-30024280', 1),
(604, '/products/smartfon-moto-g-lte-black-30024641', 1),
(605, '/products/smartfon-moto-g-lte-white-30024642', 1),
(606, '/products/smartfon-moto-x-force-lte-black-30024643', 1),
(607, '/products/smartfon-moto-x-play-lte-black-30024644', 1),
(608, '/products/smartfon-moto-x-play-lte-white-30024645', 1),
(609, '/products/smartfon-philips-s309-8gb-1-black-30024771', 1),
(610, '/products/smartfon-prestigio-psp-3519-duo-yellow-30024379', 1),
(611, '/products/smartfon-samsung-galaxy-a3-sm-a300f-silver-30021727', 1),
(612, '/products/smartfon-samsung-galaxy-j-mini-sm-j105-gold-30024622', 1),
(613, '/products/smartfon-samsung-galaxy-j1-2016-sm-j120-black-30024596', 1),
(614, '/products/smartfon-samsung-galaxy-j3-sm-j320-black-30024751', 1),
(615, '/products/smartfon-samsung-galaxy-j3-sm-j320-gold-30024754', 1),
(616, '/products/smartfon-samsung-galaxy-j3-sm-j320-white-30024755', 1),
(617, '/products/smartfon-samsung-galaxy-note-5-sm-n920c-64gb-pink-30024308', 1),
(618, '/products/smartfon-texet-x-mini-2-tm-3500-30024337', 1),
(619, '/products/smartfon-samsung-galaxy-note-4-sm-n910c-black-30021152', 1),
(620, '/products/smartfon-alcatel-onetouch-idol-3-6039y-4g-lte-dark-grey-30022464', 1),
(621, '/products/smartfon-samsung-galaxy-a7-sm-a700fd-black-30021804', 1),
(622, '/products/smartfon-asus-zenfone-5-a501cg-2c258rus-red-30020587', 1),
(623, '/products/smartfon-lg-g3-s-d724-white-30020699', 1),
(624, '/products/smartfon-asus-zenfone-4-a450cg-1d202ru-blue-30021090', 1),
(625, '/products/smartfon-sony-xperia-m5-e5603-black-30023430', 1),
(626, '/products/smartfon-sony-xperia-z1-c6903-purple-30018925', 1),
(627, '/products/smartfon-sony-xperia-e4-e2105-white-30021979', 1),
(628, '/products/smartfon-asus-zenfone-5-a502cg-2a065ru-black-30021922', 1),
(629, '/products/smartfon-sony-xperia-z3-compact-d5803-green-30021017', 1),
(630, '/products/smartfon-asus-zenfone-2-ze551ml-6a176ru-30022542', 1),
(631, '/products/smartfon-sony-xperia-z2-d6503-white-garnitura-30020032', 1),
(632, '/products/smartfon-sony-xperia-t2-ultra-dual-d5322-white-30019806', 1),
(633, '/products/smartfon-huawei-honor-3c-lite-black-30022435', 1),
(634, '/products/smartfon-huawei-ascend-y520-white-30022031', 1),
(635, '/products/smartfon-samsung-galaxy-note-4-sm-n910c-pink-30021119', 1),
(636, '/products/smartfon-lenovo-a6000-black-30022325', 1),
(637, '/products/smartfon-sony-xperia-e4-e2105-black-30021978', 1),
(638, '/products/smartfon-asus-zenfone-4-a450cg-1b200ru-white-30021089', 1),
(639, '/products/smartfon-acer-liquid-jade-z-s57-white-30022391', 1),
(640, '/products/smartfon-sony-xperia-m2-d2303-white-30020117', 1),
(641, '/products/smartfon-fly-iq436i-era-nano-9-black-30021604', 1),
(642, '/products/smartfon-samsung-galaxy-s-iii-duos-gt-i9300i-white-30020383', 1),
(643, '/products/smartfon-huawei-honor-3c-lite-black-white-30022434', 1),
(644, '/products/smartfon-sony-xperia-e4g-dual-e2033-white-30022119', 1),
(645, '/products/smartfon-huawei-honor-g620s-black-30021971', 1),
(646, '/products/smartfon-asus-zenfone-4-a400cg-1e359rus-yellow-30021046', 1),
(647, '/products/smartfon-acer-liquid-z220-white-30022401', 1),
(648, '/products/smartfon-htc-desire-816g-dual-sim-matt-blue-30022339', 1),
(649, '/products/smartfon-htc-desire-820-darkgray-lightgray-30022334', 1),
(650, '/products/smartfon-asus-zenfone-2-ze551ml-6g179ru-30022490', 1),
(651, '/products/smartfon-asus-zenfone-4-a450cg-1e201ru-yellow-30021088', 1),
(652, '/products/smartfon-asus-zenfone-5-a502cg-2c067ru-red-30021924', 1),
(653, '/products/smartfon-htc-desire-820-darkgray-orange-30022335', 1),
(654, '/products/smartfon-htc-desire-820-white-gray-30022337', 1),
(655, '/products/smartfon-sony-xperia-z1-c6903-white-30018691', 1),
(656, '/products/smartfon-lenovo-a316i-black-30020090', 1),
(657, '/products/smartfon-samsung-galaxy-s3-ss-gt-i9301i-onyx-black-30021486', 1),
(658, '/products/smartfon-lenovo-s850-white-30020680', 1),
(659, '/products/smartfon-samsung-galaxy-s3-ss-gt-i9301i-ceramic-white-30021487', 1),
(660, '/products/smartfon-lg-l70-d325-dual-black-30019798', 1),
(661, '/products/smartfon-samsung-galaxy-core-prime-sm-g360-gray-30021665', 1),
(662, '/products/smartfon-lg-l90-d410-black-30020197', 1),
(663, '/products/smartfon-lenovo-a800-30017870', 1),
(664, '/products/smartfon-microsoft-lumia-535-ds-bright-green-30021500', 1),
(665, '/products/smartfon-samsung-galaxy-s-iii-duos-gt-i9300i-black-30020380', 1),
(666, '/products/smartfon-lenovo-s850-pink-30020669', 1),
(667, '/products/smartfon-asus-zenfone-2-ze551ml-6a147ru-30022541', 1),
(668, '/products/smartfon-samsung-galaxy-s6-duos-64gb-sm-g920fd-platinum-gold-30022121', 1),
(669, '/products/smartfon-nokia-lumia-930-black-30020748', 1),
(670, '/products/smartfon-huawei-honor-4s-gold-snm-u01-30024346', 1),
(671, '/products/smartfon-samsung-galaxy-a7-sm-a700fd-gold-30022157', 1),
(672, '/products/smartfon-sony-xperia-c3-d2533-black-30021036', 1),
(673, '/products/smartfon-acer-liquid-z520-hm-hlueu-002-30022600', 1),
(674, '/products/smartfon-asus-zenfone-5-a501cg-2a226rus-black-30020585', 1),
(675, '/products/smartfon-asus-padfone-s-pf500kl-white-30021855', 1),
(676, '/products/smartfon-ritmix-rmp-405-30020639', 1),
(677, '/products/smartfon-fly-iq4505-quad-era-life-7-black-30021607', 1),
(678, '/products/smartfon-lg-g3-s-d724-gold-30021954', 1),
(679, '/products/smartfon-huawei-honor-g620s-white-30021950', 1),
(680, '/products/smartfon-lg-l60-x145-white-30022151', 1),
(681, '/products/smartfon-asus-zenfone-2-ze551ml-6j177ru-30022466', 1),
(682, '/products/smartfon-samsung-galaxy-a5-sm-a500f-black-vnesh-akk-eb-pg900bbegr-30021816', 1),
(683, '/products/smartfon-texet-x-medium-tm-4572-black-30018734', 1),
(684, '/products/smartfon-sony-xperia-z1-c6903-black-30018690', 1),
(685, '/products/smartfon-keneksi-wind-black-30020611', 1),
(686, '/products/smartfon-lenovo-s850-blue-30020929', 1),
(687, '/products/smartfon-lenovo-a328-black-30021146', 1),
(688, '/products/smartfon-prestigio-multiphone-psp5453-duo-black-30020792', 1),
(689, '/products/smartfon-lg-g3-s-d724-titan-30020730', 1),
(690, '/products/smartfon-ritmix-rmp-471-30022369', 1),
(691, '/products/smartfon-microsoft-lumia-535-ds-bright-orange-30021501', 1),
(692, '/products/smartfon-keneksi-sun-black-30020613', 1),
(693, '/products/smartfon-lg-l70-d325-dual-white-30019797', 1),
(694, '/products/smartfon-prestigio-multiphone-psp5453-duo-metal-30022175', 1),
(695, '/products/smartfon-microsoft-lumia-430-bright-orange-30022273', 1),
(696, '/products/smartfon-texet-x4-tm-5082-blask-30022513', 1),
(697, '/products/smartfon-sony-xperia-z3-compact-d5803-orange-30021015', 1),
(698, '/products/smartfon-asus-zenfone-5-a501cg-2b257rus-white-30020586', 1),
(699, '/products/smartfon-lg-l60-x145-black-30021951', 1),
(700, '/products/smartfon-asus-zenfone-4-a400cg-1b360rus-white-30021047', 1),
(701, '/products/smartfon-lenovo-s90-32gb-gray-30021915', 1),
(702, '/products/smartfon-microsoft-lumia-430-black-30022274', 1),
(703, '/products/smartfon-htc-desire-820-white-blue-30022336', 1),
(704, '/products/smartfon-texet-tm-3521-x-alpha-black-30021503', 1),
(705, '/products/smartfon-texet-tm-5172-x-maxi-qhd-30020525', 1),
(706, '/products/smartfon-microsoft-lumia-535-ds-black-30022421', 1),
(707, '/products/smartfon-huawei-p8-lite-black-30022422', 1),
(708, '/products/smartfon-asus-zenfone-4-a400cg-1a356rus-black-30020589', 1),
(709, '/products/smartfon-samsung-galaxy-grand-prime-sm-g530h-white-30021735', 1),
(710, '/products/smartfon-lenovo-s60-graphite-grey-30022327', 1),
(711, '/products/smartfon-nokia-xl-ds-black-30020081', 1),
(712, '/products/smartfon-texet-x-basic-2-tm-4272-white-30020212', 1),
(713, '/products/smartfon-htc-desire-310-ss-blue-30020233', 1),
(714, '/products/smartfon-sony-xperia-m2-dual-d2302-black-30021326', 1),
(715, '/products/smartfon-htc-desire-310-ss-white-30020234', 1),
(716, '/products/smartfon-ritmix-rmp-470-black-30022437', 1),
(717, '/products/smartfon-explay-tornado-white-30021580', 1),
(718, '/products/smartfon-texet-x-basic-2-tm-4272-black-30020179', 1),
(719, '/products/smartfon-samsung-galaxy-star-advance-sm-g350e-white-30020520', 1),
(720, '/products/smartfon-lenovo-a369i-black-30022310', 1),
(721, '/products/smartfon-lg-g3-stylus-d690-white-30022150', 1),
(722, '/products/smartfon-fly-iq4490i-era-nano-10-black-30021606', 1),
(723, '/products/smartfon-samsung-galaxy-note-edge-32gb-sm-n915f-white-30021508', 1),
(724, '/products/smartfon-alcatel-one-touch-hero-8030y-30021457', 1),
(725, '/products/smartfon-fly-iq4490i-era-nano-10-white-30021579', 1),
(726, '/products/smartfon-asus-zenfone-4-a400cg-1c357rus-red-30021044', 1),
(727, '/products/smartfon-asus-zenfone-4-a400cg-1d358rus-blue-30021045', 1),
(728, '/products/smartfon-fly-iq436i-era-nano-9-white-30021605', 1),
(729, '/products/smartfon-fly-iq4416-era-life-5-black-30021600', 1),
(730, '/products/smartfon-fly-iq4504-quad-evo-energy-5-black-30021601', 1),
(731, '/products/smartfon-lenovo-a369i-white-30022311', 1),
(732, '/products/smartfon-lenovo-a369i-yellow-30022312', 1),
(733, '/products/smartfon-lg-nexus-5-d821-16gb-red-30021008', 1),
(734, '/products/smartfon-samsung-galaxy-note-4-sm-n910c-gold-30021150', 1),
(735, '/products/smartfon-sony-xperia-m2-aqua-d2403-black-30021325', 1),
(736, '/products/smartfon-sony-xperia-t3-d5103-black-30020682', 1),
(737, '/products/smartfon-samsung-galaxy-grand-prime-lte-sm-g531f-white-30024279', 1),
(738, '/products/smartfon-lg-x155-silver-titan-30023028', 1),
(739, '/products/smartfon-samsung-galaxy-grand-prime-lte-sm-g531f-gold-30024278', 1),
(740, '/products/smartfon-samsung-galaxy-s4-mini-ds-gt-i9192i-black-30023889', 1),
(741, '/products/smartfon-samsung-galaxy-grand-prime-lte-sm-g531-gray-30024292', 1),
(742, '/products/smartfon-samsung-galaxy-j1-2016-sm-j120-white-30024595', 1),
(743, '/products/televizor-lg-32lf562u-10007884', 1),
(744, '/products/televizor-lg-42lf562v-10007851', 1),
(745, '/products/televizor-sony-kdl43w756c-10008170', 1),
(746, '/products/televizor-samsung-ue55ju6790u-10007923', 1),
(747, '/products/televizor-samsung-ue48j6500au-10007917', 1),
(748, '/products/televizor-samsung-ultra-hd-ue55ju7500u-10007781', 1),
(749, '/products/televizor-lg-55lf653v-10007963', 1),
(750, '/products/televizor-samsung-ue55j6330au-10007939', 1),
(751, '/products/televizor-supra-stv-lc19t880wl-10009113', 1),
(752, '/products/televizor-sony-kdl40r453c-10008055', 1),
(753, '/products/televizor-lg-42lf550v-10008163', 1),
(754, '/products/televizor-samsung-ue55j6500au-10007918', 1),
(755, '/products/televizor-samsung-ue40s9au-10008599', 1),
(756, '/products/televizor-lg-49lf634v-10007975', 1),
(757, '/products/televizor-lg-65uf850v-10007960', 1),
(758, '/products/televizor-lg-40lf570v-10007852', 1),
(759, '/products/televizor-lg-32lf560u-10008160', 1),
(760, '/products/televizor-samsung-ultra-hd-ue78js9500t-10007815', 1),
(761, '/products/televizor-sony-kd75x9405c-10008288', 1),
(762, '/products/televizor-samsung-ue48j5510au-10007893', 1),
(763, '/products/televizor-sony-kd65x9305c-10008175', 1),
(764, '/products/televizor-samsung-ue32j4000ak-10008573', 1),
(765, '/products/televizor-samsung-ue55js8500t-10007925', 1),
(766, '/products/televizor-samsung-ue65ju6400u-10007849', 1),
(767, '/products/televizor-samsung-ue55ju7000u-10007769', 1),
(768, '/products/televizor-lg-ultra-hd-84ub980v-10006523', 1),
(769, '/products/televizor-lg-ultra-hd-79ub980v-10006524', 1),
(770, '/products/televizor-samsung-ue55js7200u-10008712', 1),
(771, '/products/televizor-lg-55ef950v-10008565', 1),
(772, '/products/televizor-sony-kdl65w855c-10008129', 1),
(773, '/products/televizor-lg-65ug870v-10008081', 1),
(774, '/products/televizor-samsung-ue65ju7500u-10007772', 1),
(775, '/products/televizor-philips-55pft6510-60-10009367', 1),
(776, '/products/televizor-supra-stv-lc40t882fl-10009224', 1),
(777, '/products/televizor-orion-olt-19100-10007068', 1),
(778, '/products/televizor-samsung-ue50js7200u-10008716', 1),
(779, '/products/televizor-akai-les-50v46m-10009141', 1),
(780, '/products/televizor-lg-32lf550u-10008139', 1),
(781, '/products/televizor-lg-65uf950v-10007961', 1),
(782, '/products/televizor-philips-ultra-hd-55pus9109-60-10007120', 1),
(783, '/products/televizor-samsung-ue65ju7000u-10007780', 1),
(784, '/products/televizor-samsung-ue85ju7000u-10008037', 1),
(785, '/products/televizor-samsung-ue78ju7500u-10008012', 1),
(786, '/products/televizor-samsung-ue75ju6400u-10007877', 1),
(787, '/products/televizor-samsung-ue32s9au-10008585', 1),
(788, '/products/televizor-samsung-ue48j5200au-10009097', 1),
(789, '/products/televizor-telefunken-tf-led32s32t2-10009329', 1),
(790, '/products/televizor-horizont-43le5173d-10009294', 1),
(791, '/products/televizor-samsung-ue60js7200u-10008718', 1),
(792, '/products/televizor-lg-49lf510v-10009402', 1),
(793, '/products/televizor-samsung-ue48j5000au-10009095', 1),
(794, '/products/televizor-samsung-ultra-hd-ue55hu8700t-10006649', 1),
(795, '/products/televizor-supra-stv-lc24t880wl-10009232', 1),
(796, '/products/televizor-samsung-ue65ju6000u-10008468', 1),
(797, '/products/televizor-samsung-ue55ju6600u-10007901', 1),
(798, '/products/televizor-supra-stv-lc24500wl-10008614', 1),
(799, '/products/televizor-supra-stv-lc55t950ul-10008755', 1),
(800, '/products/televizor-supra-stv-lc55st990ul00-10008756', 1),
(801, '/products/televizor-sony-kdl43w808c-10008192', 1),
(802, '/products/televizor-lg-55eg960v-10008297', 1),
(803, '/products/televizor-samsung-ue50ju6400u-10007841', 1),
(804, '/products/televizor-lg-42lb675v-10006071', 1),
(805, '/products/televizor-samsung-ue22h5610ak-10006402', 1),
(806, '/products/televizor-sony-kdl40r353c-10008482', 1),
(807, '/products/televizor-lg-32lf630v-10007854', 1),
(808, '/products/televizor-samsung-ue22h5600ak-10006422', 1),
(809, '/products/televizor-samsung-ultra-hd-ue105s9wat-10006894', 1),
(810, '/products/televizor-lg-42lf653v-10007861', 1),
(811, '/products/televizor-sony-kdl24w605a-white-10005116', 1),
(812, '/products/televizor-lg-40lf630v-10007853', 1),
(813, '/products/televizor-lg-43uf640v-10008442', 1),
(814, '/products/televizor-samsung-ue40j5510au-10007943', 1),
(815, '/products/televizor-lg-55lb675v-10006064', 1),
(816, '/products/televizor-samsung-ue32j6500au-10008042', 1),
(817, '/products/televizor-samsung-ue40j6200au-10007913', 1),
(818, '/products/televizor-lg-42lb677v-10006072', 1),
(819, '/products/televizor-samsung-ue40ju6790u-10007908', 1),
(820, '/products/televizor-sony-kdl50w805c-10008150', 1),
(821, '/products/televizor-lg-43lf630v-10007755', 1),
(822, '/products/televizor-philips-40pft4100-60-10007990', 1),
(823, '/products/televizor-philips-32pft4100-60-10007978', 1),
(824, '/products/televizor-samsung-ue40j6500au-10007941', 1),
(825, '/products/televizor-lg-32lf562v-10007859', 1),
(826, '/products/televizor-sony-kdl32w705c-10008001', 1),
(827, '/products/televizor-haier-le32b8000t-10008680', 1),
(828, '/products/televizor-philips-32pht4100-60-10008326', 1),
(829, '/products/televizor-samsung-ue48j5550au-10007894', 1),
(830, '/products/televizor-samsung-ue48j6330au-10007876', 1),
(831, '/products/televizor-sony-kdl55w808c-10008191', 1),
(832, '/products/televizor-lg-32lf620u-10007856', 1),
(833, '/products/televizor-samsung-ue48j6200au-10007848', 1),
(834, '/products/televizor-supra-stv-lc16741wl-10006440', 1),
(835, '/products/televizor-lg-49lf630v-10007937', 1),
(836, '/products/televizor-lg-22lf450u-10007872', 1),
(837, '/products/televizor-samsung-ue32j5500au-10007946', 1),
(838, '/products/televizor-haier-le24b8000t-10008332', 1),
(839, '/products/televizor-samsung-ue32j4100au-10007947', 1),
(840, '/products/televizor-lg-32lf560v-10008161', 1),
(841, '/products/televizor-samsung-ue40ju6600u-10007927', 1),
(842, '/products/televizor-lg-24lf450u-10007871', 1),
(843, '/products/televizor-samsung-ue28j4100ak-10007817', 1),
(844, '/products/televizor-samsung-ue48ju6790u-10007922', 1),
(845, '/products/televizor-lg-55ec930v-10006983', 1),
(846, '/products/televizor-lg-28lf450u-10007870', 1),
(847, '/products/televizor-samsung-ue40j5500au-10007944', 1),
(848, '/products/televizor-lg-55eg910v-10008564', 1),
(849, '/products/televizor-samsung-ue24h4070au-10006755', 1),
(850, '/products/televizor-lg-42lf580v-10007850', 1),
(851, '/products/televizor-samsung-ue48js9000t-10007802', 1),
(852, '/products/televizor-lg-55uf8537-10008471', 1),
(853, '/products/televizor-haier-le40b8000tf-10008333', 1),
(854, '/products/televizor-lg-49uf640v-10008788', 1),
(855, '/products/televizor-hisense-lhd32d50ts-10008662', 1),
(856, '/products/televizor-sony-kdl24w605a-black-10005115', 1),
(857, '/products/televizor-supra-stv-lc40t800fl-10008612', 1),
(858, '/products/televizor-lg-42lf620v-10007862', 1),
(859, '/products/televizor-samsung-ultra-hd-ue48ju7000u-10007768', 1),
(860, '/products/televizor-samsung-ue48j5500au-10007892', 1),
(861, '/products/televizor-sony-kdl48w705c-10008039', 1),
(862, '/products/televizor-samsung-ue48ju6600u-10007902', 1),
(863, '/products/televizor-samsung-ue48ju6610u-10007921', 1),
(864, '/products/televizor-orion-olt-16100-10007067', 1),
(865, '/products/televizor-samsung-ue32j5120ak-10007818', 1),
(866, '/products/televizor-lg-55lf630v-10007936', 1),
(867, '/products/televizor-samsung-ue48j5100au-10008330', 1),
(868, '/products/televizor-hisense-40k321uw-10008791', 1),
(869, '/products/televizor-samsung-ue55ju6400u-10008089', 1),
(870, '/products/televizor-samsung-ue40ju6610u-10007909', 1),
(871, '/products/televizor-samsung-ue48js8500t-10007919', 1),
(872, '/products/televizor-hisense-ltdn50k2204wteu-10008705', 1),
(873, '/products/televizor-supra-stv-lc40t880fl-10008862', 1),
(874, '/products/televizor-lg-32lf650v-10008162', 1),
(875, '/products/televizor-lg-42lf560v-10008164', 1),
(876, '/products/televizor-sony-kd55x9005c-10008355', 1),
(877, '/products/televizor-samsung-ultra-hd-ue55js9000t-10007800', 1),
(878, '/products/televizor-sony-kdl32r303c-10008483', 1),
(879, '/products/televizor-philips-24pht4000-60-10007952', 1),
(880, '/products/televizor-philips-65pft6520-60-10008815', 1),
(881, '/products/televizor-loewe-art-40-a52435o85-mocha-10005516', 1),
(882, '/products/televizor-supra-stv-lc32440wl-10005921', 1),
(883, '/products/televizor-sony-kdl40w705c-10008041', 1),
(884, '/products/televizor-samsung-ue40j6330au-10007928', 1),
(885, '/products/televizor-samsung-ue32j5200ak-10008393', 1),
(886, '/products/televizor-samsung-ue40ju7000u-10007874', 1),
(887, '/products/televizor-samsung-ue40j5550au-10007932', 1),
(888, '/products/televizor-samsung-ue40h5303ak-10006677', 1),
(889, '/products/televizor-haier-le32k5000t-10008104', 1),
(890, '/products/televizor-lg-32lf653v-10007855', 1),
(891, '/products/televizor-samsung-ue40j5120au-10007828', 1),
(892, '/products/televizor-samsung-ue40ju6530u-10008043', 1),
(893, '/products/televizor-lg-49uf8537-10008470', 1),
(894, '/products/televizor-samsung-ue22h5000ak-10006430', 1),
(895, '/products/televizor-samsung-ue32j6300au-10008630', 1),
(896, '/products/televizor-haier-le24b8000f-10008631', 1),
(897, '/products/televizor-samsung-ue48ju6530u-10007982', 1),
(898, '/products/televizor-lg-32lf580u-10007857', 1),
(899, '/products/televizor-haier-le48m7000cf-10008091', 1),
(900, '/products/televizor-lg-49lf640v-10008080', 1),
(901, '/products/televizor-hisense-ltdn40d50ts-10008663', 1),
(902, '/products/televizor-sony-kdl32r503c-10007809', 1),
(903, '/products/televizor-lg-32lf580v-10007858', 1),
(904, '/products/televizor-samsung-ue48ju6400u-10007840', 1),
(905, '/products/televizor-lg-42lf650v-10008165', 1),
(906, '/products/televizor-lg-43lf510v-10008744', 1),
(907, '/products/televizor-lg-32lf510u-10008371', 1),
(908, '/products/televizor-aiwa-24le7021-10007043', 1),
(909, '/products/televizor-samsung-ue40ju6400u-10007824', 1),
(910, '/products/televizor-samsung-ue40ju6000u-10008654', 1),
(911, '/products/televizor-sony-kd43x8305c-10008148', 1),
(912, '/products/televizor-samsung-ultra-hd-ue65js9000t-10007813', 1),
(913, '/products/televizor-philips-48pfs8209-60-10006788', 1),
(914, '/products/televizor-lg-55ug870v-10008363', 1),
(915, '/products/televizor-samsung-ue65js9500t-10007783', 1),
(916, '/products/televizor-lg-28lf498u-10008030', 1),
(917, '/products/televizor-supra-stv-lc32450wl-10009019', 1),
(918, '/products/televizor-supra-stv-lc22t880fl-10009205', 1),
(919, '/products/televizor-telefunken-tf-led24s21t2-10009331', 1),
(920, '/products/televizor-samsung-ue43ju6000u-10009020', 1),
(921, '/products/televizor-philips-24pht5619-60-10006493', 1),
(922, '/products/televizor-samsung-ue32j5550au-10007945', 1),
(923, '/products/televizor-sony-kdl40r553c-10007890', 1),
(924, '/products/televizor-haier-le40k5000tf-10008105', 1),
(925, '/products/televizor-sony-kdl43w807c-10008171', 1),
(926, '/products/televizor-supra-stv-lc16740wl-10006439', 1),
(927, '/products/televizor-philips-ultra-hd-55pus7909-60-10007066', 1),
(928, '/products/televizor-samsung-ue19h4000ak-10006500', 1),
(929, '/products/televizor-philips-22pft4000-60-10007935', 1),
(930, '/products/televizor-samsung-ue88js9500t-10008034', 1),
(931, '/products/televizor-supra-stv-lc32t880wl-10008844', 1),
(932, '/products/televizor-lg-49uf771v-10008885', 1),
(933, '/products/televizor-philips-48pft4100-60-10008480', 1),
(934, '/products/televizor-supra-stv-lc50t950ul-10008757', 1),
(935, '/products/televizor-supra-stv-lc32t882wl-10009233', 1),
(936, '/products/televizor-samsung-ue40j5200au-10009099', 1),
(937, '/products/televizor-supra-stv-lc42t910fl-10008783', 1),
(938, '/products/televizor-samsung-ue55ju6530u-10008040', 1),
(939, '/products/televizor-haier-le42b8000tf-10008880', 1),
(940, '/products/televizor-lg-55uf771v-10008884', 1),
(941, '/products/televizor-haier-le22m600f-10005229', 1),
(942, '/products/televizor-philips-ultra-hd-55pus8809-60-10006850', 1),
(943, '/products/televizor-haier-le32m600-10005241', 1),
(944, '/products/televizor-philips-40put6400-60-10008462', 1),
(945, '/products/televizor-aiwa-20le7011-10007041', 1),
(946, '/products/televizor-akai-lea-19v02s-10006955', 1),
(947, '/products/televizor-samsung-ue32j4500ak-10008695', 1),
(948, '/products/televizor-aiwa-32le7021-10008785', 1),
(949, '/products/televizor-samsung-ue24h4080au-10006954', 1),
(950, '/products/televizor-hisense-lhd32k2204wteu-10008704', 1),
(951, '/products/televizor-philips-24pht5210-60-10008463', 1),
(952, '/products/televizor-samsung-ue82s9wat-10008717', 1),
(953, '/products/televizor-orion-olt-22212-10008642', 1),
(954, '/products/oborudovanie-i-aksessuar-loewe-69474b00-10002045', 1),
(955, '/products/oborudovanie-i-aksessuar-loewe-71133081-10002164', 1),
(956, '/products/oborudovanie-i-aksessuar-loewe-cid-comfort-55-71632b00-10004198', 1),
(957, '/products/oborudovanie-i-aksessuar-loewe-equipment-board-floor-stand-cid-chrome-silver-10003124', 1),
(958, '/products/oborudovanie-i-aksessuar-loewe-floor-stand-cid-silver-10003126', 1),
(959, '/products/oborudovanie-i-aksessuar-loewe-stand-cid-dynamic-chrome-silver-10003123', 1),
(960, '/products/televizor-akai-lea-32l34p-10009532', 1),
(961, '/products/televizor-akai-lea-50v35m-10009142', 1),
(962, '/products/televizor-akai-lea-55v36m-10009140', 1),
(963, '/products/televizor-hisense-55k321uw-10008790', 1),
(964, '/products/televizor-horizont-32le3181-10009295', 1),
(965, '/products/televizor-horizont-32le5161d-10009332', 1),
(966, '/products/televizor-horizont-49le5161d-10009296', 1),
(967, '/products/televizor-lg-55uf950v-10007899', 1),
(968, '/products/televizor-lg-65eg960v-10008434', 1),
(969, '/products/televizor-lg-70uf771v-10008586', 1),
(970, '/products/televizor-loewe-art-40-52435u85-white-10005517', 1),
(971, '/products/televizor-loewe-art-40-uhd-54457w80-black-10008671', 1),
(972, '/products/televizor-loewe-connect-32-54446w85-black-black-10009003', 1),
(973, '/products/televizor-loewe-connect-id-40-52463v85-beige-black-10007196', 1),
(974, '/products/televizor-loewe-one-55-55402u70-white-10009112', 1),
(975, '/products/televizor-orion-olt-24112-10007058', 1),
(976, '/products/televizor-orion-olt-32202-10008640', 1),
(977, '/products/televizor-orion-olt-32302-10009652', 1),
(978, '/products/televizor-orion-olt-40000-10009653', 1),
(979, '/products/televizor-philips-48pus7600-60-10008641', 1),
(980, '/products/televizor-philips-49pus7100-60-10009365', 1),
(981, '/products/televizor-philips-49pus7150-60-10009366', 1),
(982, '/products/televizor-philips-50put6400-60-10009369', 1),
(983, '/products/televizor-philips-55pft6300-60-10008135', 1),
(984, '/products/televizor-philips-55put6400-60-10009368', 1),
(985, '/products/televizor-samsung-ue40j5000au-10009098', 1),
(986, '/products/televizor-samsung-ue48ju6000u-10008481', 1),
(987, '/products/televizor-samsung-ue50j5500au-10007948', 1),
(988, '/products/televizor-samsung-ue55j5500au-10007981', 1),
(989, '/products/televizor-samsung-ue55j6390au-10007970', 1),
(990, '/products/televizor-samsung-ue55ju6000u-10008467', 1),
(991, '/products/televizor-samsung-ue65js8500t-10008050', 1),
(992, '/products/televizor-samsung-ue65ju6800u-10008571', 1),
(993, '/products/televizor-sony-kd55x9305c-10008183', 1),
(994, '/products/televizor-sony-kd65x9005c-10008353', 1),
(995, '/products/televizor-telefunken-tf-led28s12-10009345', 1),
(996, '/products/televizor-telefunken-tf-led32s21t2-10009328', 1),
(997, '/products/televizor-philips-48pft6300-60-10008134', 1),
(998, '/products/televizor-supra-stv-lc32t871wl-10007061', 1),
(999, '/products/televizor-lg-28lf491u-10008031', 1),
(1000, '/products/televizor-samsung-ue48j6390au-10007916', 1),
(1001, '/products/televizor-samsung-ue40ju6490u-10007940', 1),
(1002, '/products/televizor-lg-98ub980v-10007524', 1),
(1003, '/products/televizor-sony-ultra-hd-kd65s9005b-10007035', 1),
(1004, '/products/televizor-samsung-ue75ju7000u-10007912', 1),
(1005, '/products/televizor-sony-kdl60w605b-10006549', 1),
(1006, '/products/televizor-loewe-art-40-52435t85-chrome-silver-10005444', 1),
(1007, '/products/televizor-loewe-art-40-52435w85-black-10005339', 1),
(1008, '/products/akusticheskaya-sistema-loewe-51205b00-silver-10002640', 1),
(1009, '/products/televizor-lg-105uc9v-10007767', 1),
(1010, '/products/televizor-panasonic-smart-viera-tx-pr65vt60-10004751', 1),
(1011, '/products/televizor-lg-ultra-hd-49ub820v-10006637', 1),
(1012, '/products/televizor-lg-42lb671v-10006336', 1),
(1013, '/products/televizor-samsung-ultrahd-ue55hu9000t-10006132', 1),
(1014, '/products/televizor-samsung-ue40j6390au-10007942', 1),
(1015, '/products/televizor-lg-42ub828v-10007860', 1),
(1016, '/products/televizor-philips-48pfs8159-60-10007410', 1),
(1017, '/products/televizor-haier-le40m600f-10006476', 1),
(1018, '/products/televizor-samsung-ue32-eh5300w-10002921', 1),
(1019, '/products/televizor-aiwa-24le7020-10007042', 1),
(1020, '/products/televizor-loewe-art-60-52437w85-black-10005440', 1),
(1021, '/products/televizor-philips-ultra-hd-65pus9809-60-10007407', 1),
(1022, '/products/televizor-lg-ultra-hd-42ub820v-10006730', 1),
(1023, '/products/televizor-lg-49ub828v-10008118', 1),
(1024, '/products/televizor-philips-48pfs8109-60-10006787', 1),
(1025, '/products/televizor-philips-ultra-hd-49pus7809-60-10006386', 1),
(1026, '/products/televizor-philips-55pft6569-60-10006418', 1),
(1027, '/products/televizor-lg-47lb720v-10006139', 1),
(1028, '/products/televizor-haier-le32f6000t-10007774', 1),
(1029, '/products/televizor-lg-32-cs560-10002549', 1),
(1030, '/products/televizor-lg-55ub828v-10008117', 1),
(1031, '/products/televizor-haier-le28f6000t-10007773', 1),
(1032, '/products/televizor-lg-49uf850v-10008082', 1),
(1033, '/products/televizor-samsung-ue48ju6490u-10007920', 1),
(1034, '/products/televizor-samsung-le-32-e420m2w-10002480', 1),
(1035, '/products/televizor-philips-ultrahd-55pus7809-60-10006417', 1),
(1036, '/products/televizor-philips-47pft5209-60-10006653', 1),
(1037, '/products/televizor-philips-40pft6300-60-10008133', 1),
(1038, '/products/televizor-bbk-led2278f-10005209', 1),
(1039, '/products/televizor-supra-stv-lc19t860wl-10007762', 1),
(1040, '/products/televizor-aiwa-20le7010-10007040', 1),
(1041, '/products/televizor-lg-55uf853v-10008136', 1),
(1042, '/products/televizor-loewe-individual-55-52403p43-alu-titan-10005214', 1),
(1043, '/products/akusticheskaya-sistema-loewe-66201l00-black-10002776', 1),
(1044, '/products/akusticheskaya-sistema-loewe-compact-50212w00-bl-10002260', 1),
(1045, '/products/akusticheskaya-sistema-loewe-individual-stand-speaker-sl-69204u10-white-10007885', 1),
(1046, '/products/akusticheskaya-sistema-loewe-sound-projector-individual-sl-69205u80-white-10005397', 1),
(1047, '/products/akusticheskaya-sistema-loewe-speaker-2go-52231l00-black-10005392', 1),
(1048, '/products/akusticheskaya-sistema-loewe-stereo-speaker-i40-52205u00-white-10005385', 1),
(1049, '/products/akusticheskaya-sistema-loewe-stereo-speaker-i55-52207p00-titan-10005396', 1),
(1050, '/products/akusticheskaya-sistema-loewe-subwoofer-525-art-no-69211u30-white-10005387', 1),
(1051, '/products/video-tehnika-loewe-blutech-vision-3d-53504l02-black-10005398', 1),
(1052, '/products/video-tehnika-loewe-blutech-vision-3d-53504t02-chrome-silver-10005399', 1),
(1053, '/products/oborudovanie-i-aksessuar-loewe-51495q00-10002044', 1),
(1054, '/products/oborudovanie-i-aksessuar-loewe-70994q00-10002046', 1),
(1055, '/products/oborudovanie-i-aksessuar-loewe-70996b00-10002047', 1),
(1056, '/products/oborudovanie-i-aksessuar-loewe-70997b00-10002048', 1),
(1057, '/products/oborudovanie-i-aksessuar-loewe-89644b10-silver-10002249', 1),
(1058, '/products/oborudovanie-i-aksessuar-loewe-active-glasses-3d-71133082-black-10005579', 1),
(1059, '/products/oborudovanie-i-aksessuar-loewe-floor-stand-reference-55-mu-72203b00-alu-silver-10008588', 1),
(1060, '/products/oborudovanie-i-aksessuar-loewe-floor-stand-universal-32-55-72190b00-alu-silver-10007888', 1),
(1061, '/products/oborudovanie-i-aksessuar-loewe-rotation-unit-floor-i-40-55-71524b00-10005351', 1),
(1062, '/products/oborudovanie-i-aksessuar-loewe-rotation-unit-floor-i-40-55-mu-sp-71782b00-10005355', 1),
(1063, '/products/oborudovanie-i-aksessuar-loewe-rotation-unit-table-i-40-55-71510b00-10005356', 1),
(1064, '/products/oborudovanie-i-aksessuar-loewe-screen-floor-cross-i-40-46-71520q00-10005352', 1),
(1065, '/products/oborudovanie-i-aksessuar-loewe-screen-floor-plate-i-46-55-71523b00-chrome-10007887', 1),
(1066, '/products/oborudovanie-i-aksessuar-loewe-screen-table-plate-i-40-71671b00-10005357', 1),
(1067, '/products/oborudovanie-i-aksessuar-loewe-table-stand-cid-comfort-10003127', 1),
(1068, '/products/oborudovanie-i-aksessuar-loewe-wall-mount-3d-orchestra-speaker-71775001-10005389', 1),
(1069, '/products/oborudovanie-i-aksessuar-loewe-wall-mount-isoflex-32-55-71363b00-10005371', 1),
(1070, '/products/oborudovanie-i-aksessuar-loewe-wall-mount-slim-vesa-size-400-71361t20-chrome-10007886', 1),
(1071, '/products/oborudovanie-i-aksessuar-loewe-wall-mount-wm-67-72115w80-black-10008589', 1),
(1072, '/products/televizor-loewe-art-32-52434o85-mocha-10007810', 1),
(1073, '/products/televizor-loewe-art-32-52434u85-white-10007779', 1),
(1074, '/products/televizor-loewe-art-48-54458t80-chrome-silver-10008590', 1),
(1075, '/products/televizor-loewe-art-48-54458w80-black-10008331', 1),
(1076, '/products/televizor-loewe-art-50-52436u85-white-10005515', 1),
(1077, '/products/televizor-loewe-art-55-54459w80-black-10007895', 1),
(1078, '/products/televizor-loewe-connect-22-50405u80-white-10002330', 1),
(1079, '/products/televizor-loewe-connect-22-50405w80-black-10002066', 1),
(1080, '/products/televizor-loewe-connect-40-51409u82-white-10002345', 1),
(1081, '/products/televizor-loewe-connect-40-51409w82-black-10002346', 1),
(1082, '/products/televizor-loewe-connect-id-32-51462w64-black-black-10005151', 1),
(1083, '/products/televizor-loewe-connect-id-40-51463w84-black-black-10004408', 1),
(1084, '/products/televizor-loewe-connect-id-40-51463y84-white-black-hgl-10003113', 1),
(1085, '/products/televizor-loewe-connect-id-46-51464v84-beige-black-hgl-10003122', 1),
(1086, '/products/televizor-loewe-connect-id-46-51464y84-white-black-hgl-10003119', 1),
(1087, '/products/televizor-loewe-connect-id-55-51465z84-black-white-10004197', 1),
(1088, '/products/televizor-loewe-connect-id-55-dr-54443o50-cappuccino-black-10007442', 1),
(1089, '/products/televizor-loewe-individual-40-52401u43-white-10005200', 1),
(1090, '/products/televizor-loewe-individual-46-52402u43-white-10005204', 1),
(1091, '/products/televizor-loewe-reference-55-54433b40-alu-silver-10008559', 1),
(1092, '/products/televizor-philips-55pus7100-60-10008644', 1),
(1093, '/products/televizor-philips-55pus7150-60-10008674', 1),
(1094, '/products/televizor-samsung-ue55j6200au-10007938', 1),
(1095, '/products/televizor-sony-kd75x8505c-10008237', 1),
(1096, '/products/televizor-philips-50pft5300-60-10008833', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `list_parser`
--

CREATE TABLE `list_parser` (
  `id` int(11) NOT NULL,
  `value` varchar(145) DEFAULT NULL,
  `id_source` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `list_parser`
--

INSERT INTO `list_parser` (`id`, `value`, `id_source`) VALUES
(1, 'Комплектующие', 10),
(17, 'Смартфоны', 7),
(19, 'Смарт-часы', 6),
(21, 'Смарт-часы', 8),
(22, 'Бытовая техника', 9),
(23, 'Бытовая техника', 10),
(24, 'Смартфоны', 10),
(29, 'Компьютеры', 10),
(30, 'Игровые приставки', 10),
(31, 'Телевизор', 3),
(32, 'Компьютеры', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `version` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`version`) VALUES
(0);

-- --------------------------------------------------------

--
-- Структура таблицы `prop_parser`
--

CREATE TABLE `prop_parser` (
  `id` int(11) NOT NULL,
  `id_parser` int(11) DEFAULT NULL,
  `value` text,
  `name_property` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `prop_parser`
--

INSERT INTO `prop_parser` (`id`, `id_parser`, `value`, `name_property`) VALUES
(14, 23, 'link', 'url'),
(15, 23, 'items', 'class_item'),
(16, 23, 'page', 'next_link'),
(17, 23, 'h1', 'name_item'),
(18, 23, 'code', 'code_item'),
(19, 23, 'exec', 'exceptions'),
(20, 23, 'templates', 'link_reviews'),
(21, 23, 'rew', 'class_review'),
(22, 29, '', 'url'),
(23, 29, '', 'class_item'),
(24, 29, '', 'next_link'),
(25, 29, '', 'name_item'),
(26, 29, 'hz', 'code_item'),
(27, 29, '', 'exceptions'),
(28, 29, '', 'link_reviews'),
(29, 29, '', 'class_review'),
(30, 30, 'link', 'url'),
(31, 30, 'items', 'class_item'),
(32, 30, 'page', 'next_link'),
(33, 30, 'h1', 'name_item'),
(34, 30, 'code', 'code_item'),
(35, 30, 'exec', 'exceptions'),
(36, 30, 'templates', 'link_reviews'),
(37, 30, 'rew', 'class_review'),
(38, 0, 'link', 'url'),
(39, 0, 'items', 'class_item'),
(40, 0, 'page', 'next_link'),
(41, 0, 'h1', 'name_item'),
(42, 0, 'code', 'code_item'),
(43, 0, 'exec', 'exceptions'),
(44, 0, 'templates', 'link_reviews'),
(45, 0, 'rew', 'class_review'),
(46, 1, 'link', 'url'),
(47, 1, 'items', 'class_item'),
(48, 1, 'page', 'next_link'),
(49, 1, 'h1', 'name_item'),
(50, 1, 'code1', 'code_item'),
(51, 1, 'exec', 'exceptions'),
(52, 1, 'templates', 'link_reviews'),
(53, 1, 'rew', 'class_review'),
(54, 32, 'link', 'url'),
(55, 32, '', 'class_item'),
(56, 32, '', 'next_link'),
(57, 32, '', 'name_item'),
(58, 32, 'code', 'code_item'),
(59, 32, '', 'exceptions'),
(60, 32, '', 'link_reviews'),
(61, 32, '', 'class_review');

-- --------------------------------------------------------

--
-- Структура таблицы `source_pars`
--

CREATE TABLE `source_pars` (
  `id` int(11) NOT NULL,
  `value` varchar(145) NOT NULL,
  `tr_name` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `source_pars`
--

INSERT INTO `source_pars` (`id`, `value`, `tr_name`) VALUES
(3, 'Эльдорадо', 'Eldorado'),
(6, 'DNS', 'DNS'),
(8, 'М-видео', 'M-video'),
(9, 'Техношое', 'Tehnoshoe'),
(10, 'Техношок', 'Tehnoshok');

-- --------------------------------------------------------

--
-- Структура таблицы `table_test`
--

CREATE TABLE `table_test` (
  `id` int(11) NOT NULL,
  `name` varchar(145) NOT NULL,
  `surname` varchar(145) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `table_test`
--

INSERT INTO `table_test` (`id`, `name`, `surname`) VALUES
(1, 'ciel', 'phantomhive');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`) VALUES
(1, '127.0.0.1', 'administrator', '$2a$07$SeBknntpZror9uyftVopmu61qg0ms8Qv1yV6FG.kQOSM.9QhmTo36', '', 'admin@admin.com', '', NULL, NULL, NULL, 1268889823, 1461818514, 1, 'Admin', 'istrator', 'ADMIN', '0'),
(2, '127.0.0.1', NULL, '$2y$08$x/AV.GDKCM6F1FoDSdTs/OqBXdQ4cX.QhaV9fEXCpg5YLyI39UgYe', NULL, 'alex453542026@yandex.ru', NULL, NULL, NULL, NULL, 1458722044, 1458737244, 1, 'ciel', 'phantomhive', '0', '0');

-- --------------------------------------------------------

--
-- Структура таблицы `users_groups`
--

CREATE TABLE `users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(6, 2, 2);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `default_property`
--
ALTER TABLE `default_property`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `list_parser`
--
ALTER TABLE `list_parser`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `prop_parser`
--
ALTER TABLE `prop_parser`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `source_pars`
--
ALTER TABLE `source_pars`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `table_test`
--
ALTER TABLE `table_test`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  ADD KEY `fk_users_groups_users1_idx` (`user_id`),
  ADD KEY `fk_users_groups_groups1_idx` (`group_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `default_property`
--
ALTER TABLE `default_property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT для таблицы `list_parser`
--
ALTER TABLE `list_parser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT для таблицы `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `prop_parser`
--
ALTER TABLE `prop_parser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;
--
-- AUTO_INCREMENT для таблицы `source_pars`
--
ALTER TABLE `source_pars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT для таблицы `table_test`
--
ALTER TABLE `table_test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;--
-- База данных: `use_reviews`
--
CREATE DATABASE IF NOT EXISTS `use_reviews` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `use_reviews`;

-- --------------------------------------------------------

--
-- Структура таблицы `autor`
--

CREATE TABLE `autor` (
  `ID_autor` int(11) NOT NULL,
  `name_autor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_autor` text COLLATE utf8_unicode_ci,
  `birthday_autor` date DEFAULT NULL,
  `sex_autor` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country_autor` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city_autor` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_autor` text COLLATE utf8_unicode_ci,
  `tel_autor` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vk_autor` text COLLATE utf8_unicode_ci,
  `ok_autor` text COLLATE utf8_unicode_ci,
  `m_autor` text COLLATE utf8_unicode_ci,
  `fb_autor` text COLLATE utf8_unicode_ci,
  `gl_autor` text COLLATE utf8_unicode_ci,
  `tw_autor` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `autor`
--

INSERT INTO `autor` (`ID_autor`, `name_autor`, `image_autor`, `birthday_autor`, `sex_autor`, `country_autor`, `city_autor`, `email_autor`, `tel_autor`, `vk_autor`, `ok_autor`, `m_autor`, `fb_autor`, `gl_autor`, `tw_autor`) VALUES
(1, 'Анастасия', NULL, '1991-04-18', 'ж', 'Россия', 'Череповец', 'aaa@aaa.com', '22-57-97', 'https://vk.com/mia', NULL, NULL, NULL, NULL, NULL),
(2, 'Владимир', NULL, '1987-04-23', 'м', 'Россия', 'Астрахань', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'Кракозябра', NULL, '1993-04-21', NULL, 'Россия', NULL, NULL, '8 999 000 11 22', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `category1`
--

CREATE TABLE `category1` (
  `ID_category1` int(11) NOT NULL,
  `name_category1` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `category1`
--

INSERT INTO `category1` (`ID_category1`, `name_category1`) VALUES
(1, 'Бытовая техника'),
(2, 'Цифровая техника'),
(3, 'Книги'),
(4, 'Фильмы'),
(5, 'Игры');

-- --------------------------------------------------------

--
-- Структура таблицы `category2`
--

CREATE TABLE `category2` (
  `ID_category1` int(11) NOT NULL,
  `ID_category2` int(11) NOT NULL,
  `name_category2` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type_category2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `category2`
--

INSERT INTO `category2` (`ID_category1`, `ID_category2`, `name_category2`, `type_category2`) VALUES
(1, 1, 'Холодильник', 'вид'),
(1, 2, 'Стиральная машина', 'вид'),
(1, 3, 'Микроволновая печь', 'вид'),
(2, 4, 'Смартфон', 'вид'),
(2, 5, 'Фотоаппарат', 'вид'),
(2, 6, 'MP3-плеер', 'вид'),
(3, 7, 'Бестселлер', 'жанр'),
(3, 8, 'Научная фантастика', 'жанр'),
(3, 9, 'Фэнтези', 'жанр'),
(4, 10, 'Боевик', 'жанр'),
(4, 11, 'Мелодрама', 'жанр'),
(4, 12, 'Фантастика', 'жанр'),
(5, 13, 'для детей', 'возраст'),
(5, 14, 'для взрослых', 'возраст'),
(5, 15, 'для подростков', 'возраст');

-- --------------------------------------------------------

--
-- Структура таблицы `category3`
--

CREATE TABLE `category3` (
  `ID_category2` int(11) NOT NULL,
  `ID_category3` int(11) NOT NULL,
  `name_category3` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type_category3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `category3`
--

INSERT INTO `category3` (`ID_category2`, `ID_category3`, `name_category3`, `type_category3`) VALUES
(1, 1, 'Samsung', 'производитель'),
(1, 2, 'Whirpool', 'производитель'),
(2, 3, 'Whirpool', 'производитель'),
(2, 4, 'Samsung', 'производитель'),
(3, 5, 'Airflex', 'производитель'),
(4, 6, 'Samsung', 'производитель'),
(4, 7, 'Apple', 'производитель'),
(4, 8, 'Black Berry', 'производитель'),
(5, 9, 'Canon', 'производитель'),
(5, 10, 'Nikon', 'производитель'),
(6, 11, 'Texet', 'производитель'),
(6, 12, 'Sony', 'производитель'),
(7, 13, '1970 г', 'год'),
(7, 14, '1893 г', 'год'),
(8, 15, '2013 г', 'год'),
(8, 16, '1764 г', 'год'),
(9, 17, '1999 г', 'год'),
(9, 18, '1932 г', 'год'),
(10, 19, '2001 г', 'год'),
(10, 20, '2007 г', 'год'),
(11, 21, '2016 г', 'год'),
(11, 22, '2009 г', 'год'),
(12, 23, '2012 г', 'год'),
(12, 24, '2000 г', 'год'),
(13, 25, 'Развивающие', 'жанр'),
(13, 26, 'Гонки', 'жанр'),
(14, 27, 'MMO', 'жанр'),
(14, 28, 'Стратегии', 'жанр'),
(15, 29, 'Шутеры', 'жанр'),
(15, 30, 'Гонки', 'жанр');

-- --------------------------------------------------------

--
-- Структура таблицы `comment`
--

CREATE TABLE `comment` (
  `ID_review` int(11) DEFAULT NULL,
  `ID_autor` int(11) DEFAULT NULL,
  `ID_comment` int(11) NOT NULL,
  `text_comment` text COLLATE utf8_unicode_ci,
  `date_comment` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `comment`
--

INSERT INTO `comment` (`ID_review`, `ID_autor`, `ID_comment`, `text_comment`, `date_comment`) VALUES
(1, 1, 1, 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей!', '2016-04-22'),
(2, 3, 2, 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей!', '2016-04-25'),
(4, 2, 3, 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей!', '2016-04-24'),
(5, 3, 4, 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей!', '2016-04-23'),
(6, 1, 5, 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей!', '2016-04-26'),
(7, 2, 6, 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей!', '2016-04-27'),
(8, 2, 7, 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей!', '2016-04-25'),
(8, 3, 8, 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей!', '2016-04-28'),
(9, 1, 9, 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей!', '2016-04-21'),
(2, 2, 10, 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей!', '2016-04-29'),
(10, 1, 11, 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей!', '2016-04-25'),
(11, 3, 12, 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей!', '2016-04-28'),
(12, 2, 13, 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей!', '2016-04-18'),
(13, 1, 14, 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей!', '2016-04-18'),
(14, 1, 15, 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей!', '2016-04-17'),
(15, 3, 16, 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей!', '2016-04-21'),
(16, 2, 17, 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей!', '2016-04-25'),
(17, 1, 18, 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей!', '2016-04-27'),
(18, 1, 19, 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей!', '2016-04-23'),
(19, 3, 20, 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей!', '2016-04-14'),
(20, 2, 21, 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей!', '2016-04-24'),
(21, 2, 22, 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей!', '2016-04-23'),
(22, 1, 23, 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей!', '2016-04-18'),
(23, 3, 24, 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей!', '2016-04-22'),
(24, 3, 25, 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей!', '2016-04-28'),
(25, 2, 26, 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей!', '2016-04-19'),
(26, 1, 27, 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей!', '2016-04-25'),
(27, 2, 28, 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей!', '2016-04-29'),
(28, 3, 29, 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей!', '2016-04-26'),
(29, 1, 30, 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей!', '2016-04-20'),
(30, 2, 31, 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей!', '2016-04-25'),
(31, 3, 32, 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей!', '2016-04-22'),
(32, 2, 33, 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей!', '2016-04-17'),
(33, 1, 34, 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей!', '2016-04-18'),
(34, 1, 35, 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей!', '2016-04-18'),
(35, 1, 36, 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей!', '2016-04-18'),
(35, 2, 37, 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей!', '2016-04-20'),
(35, 3, 38, 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей!', '2016-04-22');

-- --------------------------------------------------------

--
-- Структура таблицы `compare`
--

CREATE TABLE `compare` (
  `ID_autor` int(11) NOT NULL,
  `ID_product` int(11) NOT NULL,
  `ID_compare` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `compare`
--

INSERT INTO `compare` (`ID_autor`, `ID_product`, `ID_compare`) VALUES
(1, 2, 1),
(1, 4, 2),
(2, 8, 3),
(2, 2, 4),
(3, 1, 5),
(3, 7, 6),
(3, 4, 7);

-- --------------------------------------------------------

--
-- Структура таблицы `footer_menu`
--

CREATE TABLE `footer_menu` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` text COLLATE utf8_unicode_ci,
  `class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `class_div` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `footer_menu`
--

INSERT INTO `footer_menu` (`id`, `name`, `link`, `class`, `class_div`) VALUES
(1, 'О проекте', 'about-project', NULL, NULL),
(2, 'Правила', 'rules', NULL, NULL),
(3, 'Реклама', 'ad', NULL, NULL),
(4, 'Помощь', '#', 'help_project_show', 'help_progect'),
(5, 'Россия', '#', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `image`
--

CREATE TABLE `image` (
  `ID_product` int(11) NOT NULL,
  `link_image` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `link` text COLLATE utf8_unicode_ci NOT NULL,
  `class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `class_div` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `menu`
--

INSERT INTO `menu` (`id`, `name`, `link`, `class`, `class_div`) VALUES
(1, 'Оставить отзыв', '#', 'give_recall_show', 'give_recall'),
(2, 'Поделиться', '#', 'tell-friends_show', 'tell-friends'),
(3, 'Заметки', 'notes', NULL, NULL),
(4, 'Сравнения', 'compare-products', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `notes`
--

CREATE TABLE `notes` (
  `ID_autor` int(11) NOT NULL,
  `ID_product` int(11) NOT NULL,
  `ID_note` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `notes`
--

INSERT INTO `notes` (`ID_autor`, `ID_product`, `ID_note`) VALUES
(1, 8, 1),
(1, 3, 2),
(1, 7, 3),
(2, 9, 4),
(2, 1, 5);

-- --------------------------------------------------------

--
-- Структура таблицы `price`
--

CREATE TABLE `price` (
  `ID_product` int(11) NOT NULL,
  `ID_shop` int(11) NOT NULL,
  `link_product` text COLLATE utf8_unicode_ci NOT NULL,
  `price_product` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `product`
--

CREATE TABLE `product` (
  `ID_category3` int(11) NOT NULL,
  `ID_product` int(11) NOT NULL,
  `name_product` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description_product` text COLLATE utf8_unicode_ci,
  `instructions_product` text COLLATE utf8_unicode_ci,
  `link_overview` text COLLATE utf8_unicode_ci,
  `logo_brand` text COLLATE utf8_unicode_ci,
  `barcode_product` text COLLATE utf8_unicode_ci,
  `qrcode_product` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `product`
--

INSERT INTO `product` (`ID_category3`, `ID_product`, `name_product`, `description_product`, `instructions_product`, `link_overview`, `logo_brand`, `barcode_product`, `qrcode_product`) VALUES
(1, 1, 'Холодильник Samsung GT888888', 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей! На сайте BlinkyReviews.ru вы найдете миллионы отзывов об электронике, бытовой технике, стройматериалах, автомобилях, книгах, фильмах, играх, отелях и гостиницах...', 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей! На сайте BlinkyReviews.ru вы найдете миллионы отзывов об электронике, бытовой технике, стройматериалах, автомобилях, книгах, фильмах, играх, отелях и гостиницах...', NULL, NULL, NULL, NULL),
(2, 2, 'Холодильник Whirpool Agata 2000', 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей! На сайте BlinkyReviews.ru вы найдете миллионы отзывов об электронике, бытовой технике, стройматериалах, автомобилях, книгах, фильмах, играх, отелях и гостиницах...', NULL, NULL, NULL, NULL, NULL),
(2, 3, 'Холодильник Whirpool Main Lt88', NULL, NULL, NULL, NULL, NULL, NULL),
(4, 4, 'Стиральная машина Samsung blabla0000', 'gsgggsf fgfbagat lsjiojija', NULL, NULL, NULL, NULL, NULL),
(6, 5, 'Смартфон Samsung togogogo', 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей! На сайте BlinkyReviews.ru вы найдете миллионы отзывов об электронике, бытовой технике, стройматериалах, автомобилях, книгах, фильмах, играх, отелях и гостиницах...', 'gggg ggg ggg g', NULL, NULL, NULL, NULL),
(7, 6, 'Смартфон Apple tototo', 'lalala', 'bububu', NULL, NULL, NULL, NULL),
(9, 7, 'Фотоаппарат Canon igogo', 'fufufu', 'agu', NULL, NULL, NULL, NULL),
(11, 8, 'MP3-плеер Texet toratata', 'omg', 'kuku', NULL, NULL, NULL, NULL),
(11, 9, 'MP3-плеер Texet tololo', 'trololo', NULL, NULL, NULL, NULL, NULL),
(14, 10, 'Бестселлер 1893 г pipipi', 'kokoko', NULL, NULL, NULL, NULL, NULL),
(19, 11, 'Боевик 2001 г 999', 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей! На сайте BlinkyReviews.ru вы найдете миллионы отзывов об электронике, бытовой технике, стройматериалах, автомобилях, книгах, фильмах, играх, отелях и гостиницах...', 'fdfsd wdawdawdam', NULL, NULL, NULL, NULL),
(23, 12, 'Фантастика 2012 г tigr', 'vvvvvvvvv', 'bbbbbbb', NULL, NULL, NULL, NULL),
(23, 13, 'Фантастика 2012 г butterfly', 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей! На сайте BlinkyReviews.ru вы найдете миллионы отзывов об электронике, бытовой технике, стройматериалах, автомобилях, книгах, фильмах, играх, отелях и гостиницах...', 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей! На сайте BlinkyReviews.ru вы найдете миллионы отзывов об электронике, бытовой технике, стройматериалах, автомобилях, книгах, фильмах, играх, отелях и гостиницах...', NULL, NULL, NULL, NULL),
(23, 14, 'Фантастика 2012 г togovo', 'hsjrtnsl', 'atetbae ghghds2', NULL, NULL, NULL, NULL),
(24, 15, 'Фантастика 2000 г tomissury', 'abracadabra', 'trahtibidoh', NULL, NULL, NULL, NULL),
(24, 16, 'Фантастика 2000 г argentina www', 'хороший продукт', 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей! На сайте BlinkyReviews.ru вы найдете миллионы отзывов об электронике, бытовой технике, стройматериалах, автомобилях, книгах, фильмах, играх, отелях и гостиницах...', NULL, NULL, NULL, NULL),
(25, 17, 'для детей Развивающие навсикая', '3+', 'впыппп', NULL, NULL, NULL, NULL),
(26, 18, 'для детей Гонки Need For Speed', 'lala', 'bubu', NULL, NULL, NULL, NULL),
(27, 19, 'для взрослых MMO toAion', 'Действие блабла', 'муму', NULL, NULL, NULL, NULL),
(28, 20, 'для взрослых Стратегии Моя любимая ферма', NULL, 'дададада', NULL, NULL, NULL, NULL),
(29, 21, 'для подростков Шутеры Кококо', 'гыгыгы', 'бебебе', NULL, NULL, NULL, NULL),
(30, 22, 'для подростков Гонки Трататататат', NULL, 'ааааа бдыщ', NULL, NULL, NULL, NULL),
(30, 23, 'для подростков Гонки Кукареку', 'ваооаим апитыа птыа ', 'дыдыщ', NULL, NULL, NULL, NULL),
(30, 24, 'для подростков Гонки Ниганига', 'ыпыппиы', 'пыыпиыапы', NULL, NULL, NULL, NULL),
(22, 25, 'Мелодрама 2009 г лалала', 'парвапрап', 'ыпиыпиыапи', NULL, NULL, NULL, NULL),
(22, 26, 'Мелодрама 2009 г бубубу', 'пчрртчртч', 'аптчатчатча', NULL, NULL, NULL, NULL),
(22, 27, 'Мелодрама 2009 г кря', 'пипияпя', 'пияапияпиф', NULL, NULL, NULL, NULL),
(22, 28, 'Мелодрама 2009 г fgdfgdf', 'ghdfh', 'fgxfgbxfg22', NULL, NULL, NULL, NULL),
(22, 29, 'Мелодрама 2009 г gssfs', 'thszrthsr', 'tsrhsrthshbzg', NULL, NULL, NULL, NULL),
(22, 30, 'Мелодрама 2009 г dgzgz', 'zgbzfgbzfg', 'dfb`dfbdfbd', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `review`
--

CREATE TABLE `review` (
  `ID_product` int(11) NOT NULL,
  `ID_review` int(11) NOT NULL,
  `ID_autor` int(11) NOT NULL,
  `plus_review` text COLLATE utf8_unicode_ci,
  `minus_review` text COLLATE utf8_unicode_ci,
  `text_review` text COLLATE utf8_unicode_ci NOT NULL,
  `date_review` date NOT NULL,
  `star_review` int(11) DEFAULT NULL,
  `like_review` int(11) DEFAULT NULL,
  `dislike_review` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `review`
--

INSERT INTO `review` (`ID_product`, `ID_review`, `ID_autor`, `plus_review`, `minus_review`, `text_review`, `date_review`, `star_review`, `like_review`, `dislike_review`) VALUES
(1, 1, 1, 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей! На сайте BlinkyReviews.ru вы найдете миллионы отзывов об электронике, бытовой технике, стройматериалах, автомобилях, книгах, фильмах, играх, отелях и гостиницах...', 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей! На сайте BlinkyReviews.ru вы найдете миллионы отзывов об электронике, бытовой технике, стройматериалах, автомобилях, книгах, фильмах, играх, отелях и гостиницах...', 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей! На сайте BlinkyReviews.ru вы найдете миллионы отзывов об электронике, бытовой технике, стройматериалах, автомобилях, книгах, фильмах, играх, отелях и гостиницах...', '2016-04-01', NULL, 9, 4),
(1, 2, 2, '', NULL, 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей! На сайте BlinkyReviews.ru вы найдете миллионы отзывов об электронике, бытовой технике, стройматериалах, автомобилях, книгах, фильмах, играх, отелях и гостиницах...', '2016-04-02', NULL, 13, 8),
(1, 3, 3, NULL, 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей! На сайте BlinkyReviews.ru вы найдете миллионы отзывов об электронике, бытовой технике, стройматериалах, автомобилях, книгах, фильмах, играх, отелях и гостиницах...', 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей! На сайте BlinkyReviews.ru вы найдете миллионы отзывов об электронике, бытовой технике, стройматериалах, автомобилях, книгах, фильмах, играх, отелях и гостиницах...', '2016-04-03', NULL, 17, 10),
(2, 4, 1, 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей! На сайте BlinkyReviews.ru вы найдете миллионы отзывов об электронике, бытовой технике, стройматериалах, автомобилях, книгах, фильмах, играх, отелях и гостиницах...', 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей! На сайте BlinkyReviews.ru вы найдете миллионы отзывов об электронике, бытовой технике, стройматериалах, автомобилях, книгах, фильмах, играх, отелях и гостиницах...', 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей! На сайте BlinkyReviews.ru вы найдете миллионы отзывов об электронике, бытовой технике, стройматериалах, автомобилях, книгах, фильмах, играх, отелях и гостиницах...', '2016-04-04', NULL, 2, 5),
(2, 5, 3, 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей! На сайте BlinkyReviews.ru вы найдете миллионы отзывов об электронике, бытовой технике, стройматериалах, автомобилях, книгах, фильмах, играх, отелях и гостиницах...', 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей! На сайте BlinkyReviews.ru вы найдете миллионы отзывов об электронике, бытовой технике, стройматериалах, автомобилях, книгах, фильмах, играх, отелях и гостиницах...', 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей! На сайте BlinkyReviews.ru вы найдете миллионы отзывов об электронике, бытовой технике, стройматериалах, автомобилях, книгах, фильмах, играх, отелях и гостиницах...', '2016-04-10', NULL, 5, 3),
(3, 6, 1, NULL, NULL, 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей! На сайте BlinkyReviews.ru вы найдете миллионы отзывов об электронике, бытовой технике, стройматериалах, автомобилях, книгах, фильмах, играх, отелях и гостиницах...', '2016-04-11', NULL, 7, 8),
(4, 7, 2, NULL, NULL, 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей! На сайте BlinkyReviews.ru вы найдете миллионы отзывов об электронике, бытовой технике, стройматериалах, автомобилях, книгах, фильмах, играх, отелях и гостиницах...', '2016-04-05', NULL, 1, 5),
(5, 8, 3, NULL, NULL, 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей! На сайте BlinkyReviews.ru вы найдете миллионы отзывов об электронике, бытовой технике, стройматериалах, автомобилях, книгах, фильмах, играх, отелях и гостиницах...', '2016-04-19', NULL, 3, 8),
(6, 9, 2, NULL, NULL, 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей! На сайте BlinkyReviews.ru вы найдете миллионы отзывов об электронике, бытовой технике, стройматериалах, автомобилях, книгах, фильмах, играх, отелях и гостиницах...', '2016-04-18', NULL, 4, 6),
(7, 10, 1, NULL, NULL, 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей! На сайте BlinkyReviews.ru вы найдете миллионы отзывов об электронике, бытовой технике, стройматериалах, автомобилях, книгах, фильмах, играх, отелях и гостиницах...', '2016-04-15', NULL, 7, 5),
(8, 11, 3, NULL, NULL, 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей! На сайте BlinkyReviews.ru вы найдете миллионы отзывов об электронике, бытовой технике, стройматериалах, автомобилях, книгах, фильмах, играх, отелях и гостиницах...', '2016-04-06', NULL, 46, 3),
(9, 12, 3, NULL, NULL, 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей! На сайте BlinkyReviews.ru вы найдете миллионы отзывов об электронике, бытовой технике, стройматериалах, автомобилях, книгах, фильмах, играх, отелях и гостиницах...', '2016-04-10', NULL, 4, 9),
(10, 13, 1, NULL, NULL, 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей! На сайте BlinkyReviews.ru вы найдете миллионы отзывов об электронике, бытовой технике, стройматериалах, автомобилях, книгах, фильмах, играх, отелях и гостиницах...', '2016-04-07', NULL, 6, 5),
(11, 14, 1, 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей! На сайте BlinkyReviews.ru вы найдете миллионы отзывов об электронике, бытовой технике, стройматериалах, автомобилях, книгах, фильмах, играх, отелях и гостиницах...', NULL, 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей! На сайте BlinkyReviews.ru вы найдете миллионы отзывов об электронике, бытовой технике, стройматериалах, автомобилях, книгах, фильмах, играх, отелях и гостиницах...', '2016-04-04', NULL, 3, 3),
(12, 15, 3, NULL, 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей! На сайте BlinkyReviews.ru вы найдете миллионы отзывов об электронике, бытовой технике, стройматериалах, автомобилях, книгах, фильмах, играх, отелях и гостиницах...', 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей! На сайте BlinkyReviews.ru вы найдете миллионы отзывов об электронике, бытовой технике, стройматериалах, автомобилях, книгах, фильмах, играх, отелях и гостиницах...', '2016-04-12', NULL, 2, 2),
(13, 16, 2, 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей! На сайте BlinkyReviews.ru вы найдете миллионы отзывов об электронике, бытовой технике, стройматериалах, автомобилях, книгах, фильмах, играх, отелях и гостиницах...', 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей! На сайте BlinkyReviews.ru вы найдете миллионы отзывов об электронике, бытовой технике, стройматериалах, автомобилях, книгах, фильмах, играх, отелях и гостиницах...', 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей! На сайте BlinkyReviews.ru вы найдете миллионы отзывов об электронике, бытовой технике, стройматериалах, автомобилях, книгах, фильмах, играх, отелях и гостиницах...', '2016-04-07', NULL, 7, 5),
(14, 17, 1, NULL, NULL, 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей! На сайте BlinkyReviews.ru вы найдете миллионы отзывов об электронике, бытовой технике, стройматериалах, автомобилях, книгах, фильмах, играх, отелях и гостиницах...', '2016-04-10', NULL, 8, 7),
(15, 18, 2, NULL, NULL, 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей! На сайте BlinkyReviews.ru вы найдете миллионы отзывов об электронике, бытовой технике, стройматериалах, автомобилях, книгах, фильмах, играх, отелях и гостиницах...', '2016-04-13', NULL, 3, 4),
(16, 19, 1, NULL, NULL, 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей! На сайте BlinkyReviews.ru вы найдете миллионы отзывов об электронике, бытовой технике, стройматериалах, автомобилях, книгах, фильмах, играх, отелях и гостиницах...', '2016-04-17', NULL, 9, 7),
(17, 20, 3, 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей! На сайте BlinkyReviews.ru вы найдете миллионы отзывов об электронике, бытовой технике, стройматериалах, автомобилях, книгах, фильмах, играх, отелях и гостиницах...', NULL, 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей! На сайте BlinkyReviews.ru вы найдете миллионы отзывов об электронике, бытовой технике, стройматериалах, автомобилях, книгах, фильмах, играх, отелях и гостиницах...', '2016-04-11', NULL, 5, 5),
(18, 21, 2, NULL, NULL, 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей! На сайте BlinkyReviews.ru вы найдете миллионы отзывов об электронике, бытовой технике, стройматериалах, автомобилях, книгах, фильмах, играх, отелях и гостиницах...', '2016-04-10', NULL, 3, 3),
(19, 22, 1, NULL, NULL, 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей! На сайте BlinkyReviews.ru вы найдете миллионы отзывов об электронике, бытовой технике, стройматериалах, автомобилях, книгах, фильмах, играх, отелях и гостиницах...', '2016-04-08', NULL, 6, 9),
(20, 23, 3, NULL, NULL, 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей! На сайте BlinkyReviews.ru вы найдете миллионы отзывов об электронике, бытовой технике, стройматериалах, автомобилях, книгах, фильмах, играх, отелях и гостиницах...', '2016-04-13', NULL, 2, 3),
(21, 24, 2, NULL, NULL, 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей! На сайте BlinkyReviews.ru вы найдете миллионы отзывов об электронике, бытовой технике, стройматериалах, автомобилях, книгах, фильмах, играх, отелях и гостиницах...', '2016-04-07', NULL, 1, 5),
(22, 25, 1, NULL, NULL, 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей! На сайте BlinkyReviews.ru вы найдете миллионы отзывов об электронике, бытовой технике, стройматериалах, автомобилях, книгах, фильмах, играх, отелях и гостиницах...', '2016-04-15', NULL, 6, 6),
(23, 26, 1, NULL, NULL, 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей! На сайте BlinkyReviews.ru вы найдете миллионы отзывов об электронике, бытовой технике, стройматериалах, автомобилях, книгах, фильмах, играх, отелях и гостиницах...', '2016-04-09', NULL, 4, 3),
(24, 27, 3, NULL, NULL, 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей! На сайте BlinkyReviews.ru вы найдете миллионы отзывов об электронике, бытовой технике, стройматериалах, автомобилях, книгах, фильмах, играх, отелях и гостиницах...', '2016-04-11', NULL, 3, 5),
(25, 28, 1, NULL, NULL, 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей! На сайте BlinkyReviews.ru вы найдете миллионы отзывов об электронике, бытовой технике, стройматериалах, автомобилях, книгах, фильмах, играх, отелях и гостиницах...', '2016-04-12', NULL, 7, 3),
(26, 29, 2, NULL, NULL, 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей! На сайте BlinkyReviews.ru вы найдете миллионы отзывов об электронике, бытовой технике, стройматериалах, автомобилях, книгах, фильмах, играх, отелях и гостиницах...', '2016-04-16', NULL, 3, 2),
(27, 30, 3, NULL, NULL, 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей! На сайте BlinkyReviews.ru вы найдете миллионы отзывов об электронике, бытовой технике, стройматериалах, автомобилях, книгах, фильмах, играх, отелях и гостиницах...', '2016-04-04', NULL, 7, 6),
(28, 31, 1, NULL, NULL, 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей! На сайте BlinkyReviews.ru вы найдете миллионы отзывов об электронике, бытовой технике, стройматериалах, автомобилях, книгах, фильмах, играх, отелях и гостиницах...', '2016-04-01', NULL, 5, 2),
(29, 32, 2, NULL, NULL, 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей! На сайте BlinkyReviews.ru вы найдете миллионы отзывов об электронике, бытовой технике, стройматериалах, автомобилях, книгах, фильмах, играх, отелях и гостиницах...', '2016-04-04', NULL, 6, 7),
(30, 33, 1, NULL, NULL, 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей! На сайте BlinkyReviews.ru вы найдете миллионы отзывов об электронике, бытовой технике, стройматериалах, автомобилях, книгах, фильмах, играх, отелях и гостиницах...', '2016-04-10', NULL, 9, 3),
(30, 34, 2, NULL, NULL, 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей! На сайте BlinkyReviews.ru вы найдете миллионы отзывов об электронике, бытовой технике, стройматериалах, автомобилях, книгах, фильмах, играх, отелях и гостиницах...', '2016-04-02', NULL, 3, 7),
(30, 35, 3, NULL, NULL, 'Мы тратим массу времени, чтобы выбрать тот или иной товар. Узнать, что сделано хорошо, а что не очень. Лучший способ оценить товар - прочитать отзывы покупателей! На сайте BlinkyReviews.ru вы найдете миллионы отзывов об электронике, бытовой технике, стройматериалах, автомобилях, книгах, фильмах, играх, отелях и гостиницах...', '2016-04-18', NULL, 6, 5);

-- --------------------------------------------------------

--
-- Структура таблицы `shop`
--

CREATE TABLE `shop` (
  `ID_shop` int(11) NOT NULL,
  `link_shop` text COLLATE utf8_unicode_ci NOT NULL,
  `logo_shop` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `specifications`
--

CREATE TABLE `specifications` (
  `ID_product` int(11) NOT NULL,
  `name_specifications` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value_specifications` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`ID_autor`);

--
-- Индексы таблицы `category1`
--
ALTER TABLE `category1`
  ADD PRIMARY KEY (`ID_category1`);

--
-- Индексы таблицы `category2`
--
ALTER TABLE `category2`
  ADD PRIMARY KEY (`ID_category2`);

--
-- Индексы таблицы `category3`
--
ALTER TABLE `category3`
  ADD PRIMARY KEY (`ID_category3`);

--
-- Индексы таблицы `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`ID_comment`);

--
-- Индексы таблицы `compare`
--
ALTER TABLE `compare`
  ADD PRIMARY KEY (`ID_compare`);

--
-- Индексы таблицы `footer_menu`
--
ALTER TABLE `footer_menu`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`ID_note`);

--
-- Индексы таблицы `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ID_product`);

--
-- Индексы таблицы `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`ID_review`);

--
-- Индексы таблицы `shop`
--
ALTER TABLE `shop`
  ADD PRIMARY KEY (`ID_shop`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `autor`
--
ALTER TABLE `autor`
  MODIFY `ID_autor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `category1`
--
ALTER TABLE `category1`
  MODIFY `ID_category1` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT для таблицы `category2`
--
ALTER TABLE `category2`
  MODIFY `ID_category2` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT для таблицы `category3`
--
ALTER TABLE `category3`
  MODIFY `ID_category3` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT для таблицы `comment`
--
ALTER TABLE `comment`
  MODIFY `ID_comment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT для таблицы `compare`
--
ALTER TABLE `compare`
  MODIFY `ID_compare` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT для таблицы `footer_menu`
--
ALTER TABLE `footer_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT для таблицы `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `notes`
--
ALTER TABLE `notes`
  MODIFY `ID_note` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT для таблицы `product`
--
ALTER TABLE `product`
  MODIFY `ID_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT для таблицы `review`
--
ALTER TABLE `review`
  MODIFY `ID_review` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT для таблицы `shop`
--
ALTER TABLE `shop`
  MODIFY `ID_shop` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
