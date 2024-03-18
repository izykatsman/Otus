Самый частый запрос в моей базе данных - выборка данных из планировщика задач:

Select `scheduler`.`send_date, `text`.`text`, `file`.`path` from `scheduler`
inner join `message` on `scheduler`.`message_id` = `message`.`id`
inner join `message_group` on `message_group`.`id` = `message`.`group_id`
inner join `message_text` on `message_text`.`message_id`
inner join `text` on `text`.`id` = `message_text`.`text_id`
inner join `message_file` on `message_file`.`message_id` = `message_id`
inner join `file` on `file`.`id` = `message_file`.`file_id`
where `message_group`.`id` = 1, `send_date` beatween 12 and 14


В данном запросе все весь поиск идет по ключам, кроме `send_date` beatween 12 and 14. На данном запросе, при выборке более чем в 1.000.000 записей запрос отрабатывал порядка 1.5 минуты.
Для выявления узкого места, был использован EXPLAIN, который показа, что для поиск по дате была просканирована вся таблица целиком. Для решения данной проблемы было решено ввести индексацию по дате. решение считается приемлемым, так как вставка в данную таблицу производится batch и происходит достаточно редко.