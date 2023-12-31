-- Пример inner join. Запрос показывает клиентов, у кого бот с определенным номером телефона
SELECT `client`.`id` FROM client
inner join bot_in_client on client.id = bot_in_client.client_id
inner join bot on bot_in_client.bt_id = bot.id
where phone = 123123

-- Пример left join.
SELECT `bot`.`id`, `client`.`id` FROM `bot`
left join `bot_in_client` on `bot`.`id` = `bot_in_chat`.`bot_id`

-- Вывести всех пользоватетлей, чьи боты не состоят в чате ChatName
SELECT `client`.`name`, `client`.`id` FROM client
inner join bot_in_client on client.id = bot_in_client.client_id
inner join bot on bot_in_client.bt_id = bot.id
inner join bot_in_chat on bot.id = bot_in_chat.bot_id
inner join chat on chat.id = bot_in_chat.chat_id
where chat.username <> 'ChatName'

-- Вывести все сообщения в промежутке указанных дат
SELECT `message`.`id` FROM `message`
inner join `scheduler` on `message`.`id` = `scheduler`.`message_id`
where `scheduler`.`send_date` > 0 and `scheduler`.`send_date` < 20

-- Вывести всех клиентов, у кого закончилась подписка
SELECT `client`.`name`, `client`.`id` FROM `client`
where end_of_subscription < 10

-- Вывести всех клиентов, у кого есть рассылка на 18 вечера любого дня
SELECT `client`.`id` FROM
inner join `calendar` on `client`.`id` = `calendar`.`client_id`
inner join `task_time` on `calendar`.`task_time_id` = `task_time`.`id`
where `calendar`.`hour` = 18 and `calendar`.`minute` = 0

-- Вывести все текста и id сообщений, где текущий текст, рандомный(0)
SELECT `text`.`text`, `message`.`id` FROM `text`
inner join `text_message` on `text`.`id` = `text_message`.`text_id`
inner join `message` on `text_message`.`message_id` = `messsage`.`id`
where message.current_message_id = 0