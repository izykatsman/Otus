// Первый пример функции осуществляющей поиск по категориям, производителю и цене. Для пагинации был добавлено ограничение и смещение. Сама функции не реализованна до конца, так как не известна структура базы данных.
DELIMITER //
CREATE PROCEDURE get_orders(IN _group_by VARCHAR(45), IN _category VARCHAR(45), IN _manufacture VARCHAR(45), 
IN low_price DECIMAL, IN high_price DECIMAL, 
IN _limit INT, IN _offset)
BEGIN
    CASE _group_by
    WHEN "product"
    THEN
        SELECT *
        FROM
        WHERE _category = category and low_price <= price and high_price >= price and _manufacture = manufacture
        ORDER BY product
        LIMIT _limit OFFSET _offset
    END CASE;
END //
DELIMITER ;


// Второй пример функции осуществляющей поиск с группировкой. Сама функции не реализованна до конца, так как не известна структура базы данных.
DELIMITER //
CREATE PROCEDURE get_orders(IN group_by VARCHAR(45), IN period DATE)
BEGIN
    CASE group_by
    WHEN "product"
    THEN
        SELECT SUM(sale) as "Продано", COUNT(sale) as "Количество"
        FROM
        group by product
        HAVING date < NOW() - period;
    WHEN "category"
    THEN
        SELECT SUM(sale) as "Продано", COUNT(sale) as "Количество"
        FROM
        group by category
        HAVING date < NOW() - period;
    WHEN "manufacturer"
    THEN
        SELECT SUM(sale) as "Продано", COUNT(sale) as "Количество"
        FROM
        group by manufacturer
        HAVING date < NOW() - period;
    END CASE;
END //
DELIMITER ;