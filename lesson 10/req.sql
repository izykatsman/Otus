-- Json ирерархическая структура, по сути я могу полностью переделать свою базу в no-sql формат. Для примера я выбрал таблицу balance_history, где хранится история платежей и пополнений счета клиента.
-- В json может хранить коллекцию произвольных объектов, соответственно вся история будет храниться в 1 поле таблицы Client.
-- Перекладывая структуру таблицы в json формат получаем следующие ключи: sum_value, account_balance, balance_type

-- Добавление поля с типом данных json
ALTER TABLE `client` ADD `balance_history_json` JSON NOT NULL AFTER `end_of_subscription`;

-- Пример добавления
INSERT INTO `client` VALUES('username', 'name', 'sername', 0, '[{"sum_value": 0, "account_balance": 0, "balance_type": "defolt"}, {"sum_value": 0, "account_balance": 0, "balance_type": "defolt"}, {"sum_value": 100, "account_balance": 100, "balance_type": "to"}, {"sum_value": 100, "account_balance": 0, "balance_type": "from"}]');

-- Пример выбора данных:
SELECT 
json_extract(balance_history_json, '$.sum_value') AS sum_value, 
json_extract(balance_history_json, '$.account_balance') AS account_balance 
json_extract(balance_history_json, '$.balance_type') AS balance_type 
FROM client;
