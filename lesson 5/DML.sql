-- ƒанным запросом ищетс€ id ботов и их номера телефонов, которые состо€т в чатах с именами с частью chatName
SELECT `bot`.`id`, `bot`.`phone` FROM `bot`
INNER JOIN `bot_in_chat` on `bot_in_chat`.`bot_id` = `bot`.`id`
INNER JOIN `chat` on `bot_in_chat`.`chat_id` = `chat`.`id`
WHERE name ~* '%chatName%'; 

-- —равнение объединений левый и общий
-- ¬ данный запрос попадут результаты пересечени€ этих двух таблиц
SELECT * FROM `chat
LEFT JOIN `bot_in_cht` on `chat`.`id` = `bot_in_chat`.`chat_id`

-- ¬ данный запрос попадут результаты принадлежащие левой таблице, где есть пересечение значени€ дл€ правой таблицу будут дл€ нее, дл€ остальных значений будет NULL
SELECT * FROM `chat
INNER JOIN `bot_in_cht` on `chat`.`id` = `bot_in_chat`.`chat_id`


INSERT INTO `chat` (`username`, `name`) 
VALUES ('1', '1'),
('2', '2'),
('3', '3'),
('4', '4') RETURNING `chat`.`id`, `chat`.`username`, `chat`.`name`;

-- ќбновил им€ в задаче календар€ по id
UPDATE `calendar`
set `task_name` = 'Name2'
WHERE id = 123;

-- ¬ моей реализации нет одинаковых имен по которым можно сделать соединение, но если бы имена совпадали в раздел€ющих таблицах(многие ко многим), то моно было бы сделать следующим образом
DELETE FROM client 
USING `bot_in_client`
WHERE client.id = 123;
