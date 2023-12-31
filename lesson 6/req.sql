-- Создание уникального индекса на номер телефона в таблице bot
CREATE UNIQUE unique_client_phone ON bot (phone);

-- Пример запроса для поиска по данному идексу
EXPLAIN SELECT * FROM bot where phone = 'one'

-- Индекс для поиска по юзернейму клиента, и функцией переводящей в нижний регистр.
CREATE INDEX client_lower_username_idx ON client (lower(username));
-- Для поиска по имени и фамилии
CREATE INDEX client_names_idx ON client ((name || ' ' || sername));

-- Создание полнотекстного индекса.
CREATE INDEX idx_gin_text 
ON text 
USING gin (to_tsvector('russian', "text"));

-- Полнотекстовый поиск, выведем id текста и в тексте которых есть слово "запрос", и отсортировали их по убыванию релевантности.
SELECT id, ts_rank(to_tsvector("text"), plainto_tsquery('запрос'))
FROM text
WHERE to_tsvector("text") @@ plainto_tsquery('запрос')
ORDER BY ts_rank(to_tsvector("text"), plainto_tsquery('запрос')) DESC;
