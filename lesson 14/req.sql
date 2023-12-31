-- Вывод все информации и поля, показывающего на на сколько осталось подписок у пользователя
SELECT *, 
CASE
	WHEN amount_balance < 1000 
        THEN 'Не хватает на подписку'
    WHEN amount_balance >= 1000 and amount_balance < 2000
        THEN 'На 1 месяц'
    WHEN amount_balance = >2000 and amount_balance < 3000
        THEN 'На 2 месяца'
    WHEN amount_balance >= 3000 
        THEN 'На 3 месяца и больше'
END AS Monthes
FROM balance_history;

-- Пример на моей базе данных
SELECT SUM(balance_history.sum_value) FROM clinet
inner join balance_history on client.id = balance_history.client_id
where balance_history.balance_type_id = 2
Group by client.id WITH ROLLUP

-- Дальше идут примеры на выдуманной базе данных, с применением группировки.
SELECT MAX(price), MIN(price), COUNT(id) FROM product
GROUP by product.id

SELECT MAX(price), MIN(price) FROM product
inner join product_category on product.id = product_category.product_id
inner join category on category.id = product_category.category_id
GROUP by category.id

SELECT COUNT(product.id) FROM product
inner join products_category on products.id = products_category.products_id
inner join category on category.id = products_category.category_id
GROUP by category.id WITH ROLLUP
