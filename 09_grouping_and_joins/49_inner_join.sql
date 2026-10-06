-- Lesson 49 - Inner Join
-- Video: https://www.youtube.com/watch?v=UmmI7FJquRc

-- ==============
-- = Inner Join = -- يجيب البيانات التي تتطابق بين الجدولين فقط
-- ==============

-- SELECT
--     Column
-- FROM
--     table1
-- INNER JOIN
--     table2
-- ON
--     table1.col = table2.col

-- ==============================================================

-- تجهيز: أضفنا مستخدمين ليس لهم لغة مفضلة (NULL)
CREATE DATABASE IF NOT EXISTS test;
USE test;
DROP TABLE IF EXISTS users, langs;
CREATE TABLE langs(lang_id INT PRIMARY KEY, lang_name VARCHAR(255));
CREATE TABLE users(user_id INT PRIMARY KEY, user_name VARCHAR(255), lang_id INT);
INSERT INTO langs VALUES(1, 'Python'), (2, 'Html'), (3, 'C#'), (4, 'Java'), (5, 'Pascal');
INSERT INTO users VALUES(1, 'Osama', 1), (2, 'Ahmed', 1), (3, 'Mohammed', 4), (4, 'Albasha', NULL), (5, 'Maha', NULL);

SELECT * FROM users;

-- +---------+-----------+---------+
-- | user_id | user_name | lang_id |
-- +---------+-----------+---------+
-- |       1 | Osama     |       1 |
-- |       2 | Ahmed     |       1 |
-- |       3 | Mohammed  |       4 |
-- |       4 | Albasha   |    NULL |
-- |       5 | Maha      |    NULL |
-- +---------+-----------+---------+

SELECT
    u.user_id,
    u.user_name,
    l.lang_name
FROM
    users u
INNER JOIN
    langs l
ON
    l.lang_id = u.lang_id;

-- +---------+-----------+-----------+
-- | user_id | user_name | lang_name |
-- +---------+-----------+-----------+
-- |       1 | Osama     | Python    |
-- |       2 | Ahmed     | Python    |
-- |       3 | Mohammed  | Java      |
-- +---------+-----------+-----------+

-- لو كان عندي مستخدمون ما عندهم لغات برمجة، مش هيعرضهم في الاستعلام السابق
-- لأن INNER JOIN يجيب فقط الصفوف التي تحقق الشرط في الجدولين
-- وكلمة JOIN وحدها تعني INNER JOIN
