-- Lesson 47 - Simulation Of Join
-- Video: https://www.youtube.com/watch?v=n0LQxLbAIVY

-- ==========================
-- === Simulation Of Join ===
-- ==========================

-- اختيار بيانات من أكثر من جدول

-- ==============================================

-- تجهيز: جدول اللغات وجدول المستخدمين، وكل مستخدم له لغة مفضلة
CREATE DATABASE IF NOT EXISTS test;
USE test;
DROP TABLE IF EXISTS users, langs;
CREATE TABLE langs(lang_id INT PRIMARY KEY, lang_name VARCHAR(255));
CREATE TABLE users(user_id INT PRIMARY KEY, user_name VARCHAR(255), lang_id INT);
INSERT INTO langs VALUES(1, 'Python'), (2, 'Html'), (3, 'C#'), (4, 'Java'), (5, 'Pascal');
INSERT INTO users VALUES(1, 'Osama', 1), (2, 'Ahmed', 1), (3, 'Mohammed', 4);

SELECT * FROM langs;

-- +---------+-----------+
-- | lang_id | lang_name |
-- +---------+-----------+
-- |       1 | Python    |
-- |       2 | Html      |
-- |       3 | C#        |
-- |       4 | Java      |
-- |       5 | Pascal    |
-- +---------+-----------+

SELECT * FROM users;

-- +---------+-----------+---------+
-- | user_id | user_name | lang_id |
-- +---------+-----------+---------+
-- |       1 | Osama     |       1 |
-- |       2 | Ahmed     |       1 |
-- |       3 | Mohammed  |       4 |
-- +---------+-----------+---------+

-- ────────────────────────────────────────────────────────────────────────────

SELECT * FROM users JOIN langs;
SELECT * FROM users, langs ORDER BY langs.lang_id, users.user_id;

-- +---------+-----------+---------+---------+-----------+
-- | user_id | user_name | lang_id | lang_id | lang_name |
-- +---------+-----------+---------+---------+-----------+
-- |       1 | Osama     |       1 |       1 | Python    |
-- |       2 | Ahmed     |       1 |       1 | Python    |
-- |       3 | Mohammed  |       4 |       1 | Python    |
-- |       1 | Osama     |       1 |       2 | Html      |
-- |       2 | Ahmed     |       1 |       2 | Html      |
-- |       3 | Mohammed  |       4 |       2 | Html      |
-- |       1 | Osama     |       1 |       3 | C#        |
-- |       2 | Ahmed     |       1 |       3 | C#        |
-- |       3 | Mohammed  |       4 |       3 | C#        |
-- |       1 | Osama     |       1 |       4 | Java      |
-- |       2 | Ahmed     |       1 |       4 | Java      |
-- |       3 | Mohammed  |       4 |       4 | Java      |
-- |       1 | Osama     |       1 |       5 | Pascal    |
-- |       2 | Ahmed     |       1 |       5 | Pascal    |
-- |       3 | Mohammed  |       4 |       5 | Pascal    |
-- +---------+-----------+---------+---------+-----------+

-- بدون شرط، يربط كل صف من الجدول الأول مع كل صف من الجدول الثاني
-- 3 مستخدمين × 5 لغات = 15 صفا، وهذا غالبا ليس ما نريده

-- ────────────────────────────────────────────────────────────────────────────

SELECT * FROM users JOIN langs ON langs.lang_id = users.lang_id;
SELECT * FROM users, langs WHERE langs.lang_id = users.lang_id;

-- +---------+-----------+---------+---------+-----------+
-- | user_id | user_name | lang_id | lang_id | lang_name |
-- +---------+-----------+---------+---------+-----------+
-- |       1 | Osama     |       1 |       1 | Python    |
-- |       2 | Ahmed     |       1 |       1 | Python    |
-- |       3 | Mohammed  |       4 |       4 | Java      |
-- +---------+-----------+---------+---------+-----------+

-- مع الشرط، يربط كل مستخدم مع لغته فقط
-- الطريقتان تعطيان نفس الناتج: JOIN مع ON، أو الفاصلة مع WHERE
