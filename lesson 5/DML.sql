-- ������ �������� ������ id ����� � �� ������ ���������, ������� ������� � ����� � ������� � ������ chatName
SELECT `bot`.`id`, `bot`.`phone` FROM `bot`
INNER JOIN `bot_in_chat` on `bot_in_chat`.`bot_id` = `bot`.`id`
INNER JOIN `chat` on `bot_in_chat`.`chat_id` = `chat`.`id`
WHERE name ~* '%chatName%'; 

-- ��������� ����������� ����� � �����
-- � ������ ������ ������� ���������� ����������� ���� ���� ������
SELECT * FROM `chat
LEFT JOIN `bot_in_cht` on `chat`.`id` = `bot_in_chat`.`chat_id`

-- � ������ ������ ������� ���������� ������������� ����� �������, ��� ���� ����������� �������� ��� ������ ������� ����� ��� ���, ��� ��������� �������� ����� NULL
SELECT * FROM `chat
INNER JOIN `bot_in_cht` on `chat`.`id` = `bot_in_chat`.`chat_id`


INSERT INTO `chat` (`username`, `name`) 
VALUES ('1', '1'),
('2', '2'),
('3', '3'),
('4', '4') RETURNING `chat`.`id`, `chat`.`username`, `chat`.`name`;

-- ������� ��� � ������ ��������� �� id
UPDATE `calendar`
set `task_name` = 'Name2'
WHERE id = 123;

-- � ���� ���������� ��� ���������� ���� �� ������� ����� ������� ����������, �� ���� �� ����� ��������� � ����������� ��������(������ �� ������), �� ���� ���� �� ������� ��������� �������
DELETE FROM client 
USING `bot_in_client`
WHERE client.id = 123;
