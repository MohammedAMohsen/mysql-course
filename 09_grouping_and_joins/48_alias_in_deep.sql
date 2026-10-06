-- Lesson 48 - Alias In Deep
-- Video: https://www.youtube.com/watch?v=EiGbfJwf3CU

-- ---------------
-- Alias In Deep :
-- ---------------

-- تجهيز: نفس جداول الدرس السابق
CREATE DATABASE IF NOT EXISTS test;
USE test;
DROP TABLE IF EXISTS users, langs;
CREATE TABLE langs(lang_id INT PRIMARY KEY, lang_name VARCHAR(255));
CREATE TABLE users(user_id INT PRIMARY KEY, user_name VARCHAR(255), lang_id INT);
INSERT INTO langs VALUES(1, 'Python'), (2, 'Html'), (3, 'C#'), (4, 'Java'), (5, 'Pascal');
INSERT INTO users VALUES(1, 'Osama', 1), (2, 'Ahmed', 1), (3, 'Mohammed', 4);

-- ────────────────────────────────────────────────────────────────────────────────────────────────

-- SELECT lang_id FROM users, langs WHERE langs.lang_id = users.lang_id;
-- ERROR 1052 (23000): Column 'lang_id' in field list is ambiguous

-- لأن في عمودين بنفس الاسم في الجدولين، وما بيعرف أي واحد فيهم يعرض، لازم أحدد من أي جدول

-- ────────────────────────────────────────────────────────────────────────────────────────────────

SELECT
    users.user_id,
    users.user_name,
    langs.lang_name
FROM
    users,
    langs
WHERE langs.lang_id = users.lang_id;

-- +---------+-----------+-----------+
-- | user_id | user_name | lang_name |
-- +---------+-----------+-----------+
-- |       1 | Osama     | Python    |
-- |       2 | Ahmed     | Python    |
-- |       3 | Mohammed  | Java      |
-- +---------+-----------+-----------+

-- ---------------------------------------------------------------------------------------
-- أستطيع إعطاء أسماء مختصرة للجداول (Alias) حتى يسهل علي كتابة الاستعلام كالتالي
-- ---------------------------------------------------------------------------------------

SELECT
    u.user_id,
    u.user_name,
    l.lang_name
FROM
    users u,
    langs l
WHERE
    l.lang_id = u.lang_id;

-- +---------+-----------+-----------+
-- | user_id | user_name | lang_name |
-- +---------+-----------+-----------+
-- |       1 | Osama     | Python    |
-- |       2 | Ahmed     | Python    |
-- |       3 | Mohammed  | Java      |
-- +---------+-----------+-----------+

-- -------------------------------------
-- أستطيع إعطاء أسماء للأعمدة أيضا
-- -------------------------------------

SELECT
    u.user_id UserId,
    u.user_name UserName,
    l.lang_name Fav_lang
FROM
    users u,
    langs l
WHERE
    l.lang_id = u.lang_id;

-- +--------+----------+----------+
-- | UserId | UserName | Fav_lang |
-- +--------+----------+----------+
-- |      1 | Osama    | Python   |
-- |      2 | Ahmed    | Python   |
-- |      3 | Mohammed | Java     |
-- +--------+----------+----------+

-- كلمة AS اختيارية: u.user_id UserId مثل u.user_id AS UserId
