START TRANSACTION;
select price, durattion from subscription
	where id = 2;
insert into transaction_history (sum_value, account_balance, balance_type_id, transaction_date, subscription_id, balance_type_id client_id) 
VALUES(price, account_balance -= price, UNIX_TIMESTAMP(NOW()), 1, client_id)
COMMIT;

-- Для загрузки данных я использовал следующий скрипт.
--Все значения разделены символом ',', не все строки обрамлены '"' и в конце строки перенос коретки с помощью '\n'
mysqlimport --fields-terminated-by=',' --fields-optionally-enclosed-by='"' --lines-terminated-by='\n'