-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Авг 15 2020 г., 16:45
-- Версия сервера: 10.3.13-MariaDB-log
-- Версия PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `hismith`
--
use munko;
-- --------------------------------------------------------

--
-- Структура таблицы `hismith_authors`
--

CREATE TABLE `hismith_authors` (
  `id` int(255) NOT NULL,
  `name` text NOT NULL,
  `amt` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `hismith_authors`
--

INSERT INTO `hismith_authors` (`id`, `name`, `amt`) VALUES
(1, 'Первый Автор Первович', 2),
(2, 'Второй Автор Вторович', 3),
(3, 'Третий Автор Третьевич', 2),
(4, 'Четвертый Автор Четвертович', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `hismith_books`
--

CREATE TABLE `hismith_books` (
  `id` int(255) NOT NULL,
  `book` text NOT NULL,
  `cost` int(255) UNSIGNED NOT NULL,
  `author_id` int(255) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `hismith_books`
--

INSERT INTO `hismith_books` (`id`, `book`, `cost`, `author_id`, `date`) VALUES
(1, 'Книга №1', 100, 1, '2020-08-14'),
(2, 'Книга №2', 200, 2, '2020-08-14'),
(3, 'Книга №3', 300, 3, '2020-08-14'),
(4, 'Книга №4', 400, 4, '2020-08-14'),
(5, 'Книга №5', 500, 1, '2020-08-14'),
(6, 'Книга №6', 600, 2, '2020-08-14'),
(7, 'Книга №7', 700, 3, '2020-08-14'),
(8, 'Книга №8', 800, 2, '2020-08-14');

--
-- Триггеры `hismith_books`
--
DELIMITER $$
CREATE TRIGGER `book_count_delete` AFTER DELETE ON `hismith_books` FOR EACH ROW update hismith_authors
set amt =
(select count(*) from hismith_books
where hismith_books.author_id=hismith_authors.id)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `book_count_insert` AFTER INSERT ON `hismith_books` FOR EACH ROW update hismith_authors
set amt =
(select count(*) from hismith_books
where hismith_books.author_id=hismith_authors.id)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `book_count_update` AFTER UPDATE ON `hismith_books` FOR EACH ROW update hismith_authors
set amt =
(select count(*) from hismith_books
where hismith_books.author_id=hismith_authors.id)
$$
DELIMITER ;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `hismith_authors`
--
ALTER TABLE `hismith_authors`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `hismith_books`
--
ALTER TABLE `hismith_books`
  ADD PRIMARY KEY (`id`),
  ADD KEY `author_id` (`author_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `hismith_authors`
--
ALTER TABLE `hismith_authors`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `hismith_books`
--
ALTER TABLE `hismith_books`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
