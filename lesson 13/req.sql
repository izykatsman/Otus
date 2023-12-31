-- В данном проекте нет полноценного поиска на несколько полей. Для этого было добавлено поле тега для текстов, с помощь. этого поля пользователь сможет помечать текста(возможно сделать данную вещь через нормализацию отдельной таблицей, но для задания оставлено так.)
SELECT bot.phone, MATCH (text, tag) AGAINST ('+Заголовок тег' IN BOOLEAN MODE) as REL
FROM bot
inner join bot_in_chat on bot.id = bot_in_chat.bot.id
inner join scheduler on scheduler.bot_in_chat_id = bot_in_chat.id
inner join message on scheduler.message_id = message.id
inner join message_text on message.id = message_text.message.id
inner join text on message_text.text_id = text.id
WHERE chat.id = 123 and MATCH (text, tag) AGAINST ('+Заголовок тег' IN BOOLEAN MODE)
ORDER BY REL;

-- Был добавлен индекс для поиска по номеру телефона

CREATE UNIQUE unique_client_phone ON bot (phone);

-- Пример запроса для поиска по данному идексу
SELECT * FROM bot where phone = 'one'

+------+-------------+-------+-------+---------------+---------------+---------+-------+------+-------+
| id   | select_type | table | type  | possible_keys | key           | key_len | ref   | rows | Extra |
+------+-------------+-------+-------+---------------+---------------+---------+-------+------+-------+
|    1 | SIMPLE      | bot   | const | bot_phone_idx | bot_phone_idx | 402     | const | 1    |       |
+------+-------------+-------+-------+---------------+---------------+---------+-------+------+-------+


-- Создание полнотекстового индекса.
CREATE TABLE `text` (
`id` int(10) unsigned NOT NULL auto_increment,
`text` varchar(200) default NULL,
`tag`varchar(200) default NULL
PRIMARY KEY (`id`),
FULLTEXT KEY `ft1` (`text`,`tag`),
FULLTEXT KEY `ft2` (`tag`)
);