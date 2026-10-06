-- Lesson 50 - Left And Right Join
-- Video: https://www.youtube.com/watch?v=qoNLQxqNkVo

-- =====================
-- = Left & Right Join =
-- =====================

-- LEFT JOIN  -- يجيب جميع بيانات الجدول الأول، ومن الجدول الثاني فقط البيانات المتطابقة
-- RIGHT JOIN -- العكس: جميع بيانات الجدول الثاني، ومن الجدول الأول فقط البيانات المتطابقة
-- وإذا لم يجد تطابقا، يضع NULL مكان بيانات الجدول الآخر

-- ==============================================================

-- تجهيز
CREATE DATABASE IF NOT EXISTS test;
USE test;
DROP TABLE IF EXISTS users, langs;
CREATE TABLE langs(lang_id INT PRIMARY KEY, lang_name VARCHAR(255));
CREATE TABLE users(user_id INT PRIMARY KEY, user_name VARCHAR(255), lang_id INT);
INSERT INTO langs VALUES(1, 'Python'), (2, 'Html'), (3, 'C#'), (4, 'Java'), (5, 'Pascal');
INSERT INTO users VALUES(1, 'Osama', 1), (2, 'Ahmed', 1), (3, 'Mohammed', 4), (4, 'Albasha', NULL),
    (5, 'Maha', NULL), (6, 'Gamal', 5), (7, 'Ayman', 1);

-- ───────────────────────────────────────────────────────────────

SELECT
    u.user_id,
    u.user_name,
    l.lang_name
FROM
    users u
LEFT JOIN
    langs l
ON
    l.lang_id = u.lang_id;

-- +---------+-----------+-----------+
-- | user_id | user_name | lang_name |
-- +---------+-----------+-----------+
-- |       1 | Osama     | Python    |
-- |       2 | Ahmed     | Python    |
-- |       3 | Mohammed  | Java      |
-- |       4 | Albasha   | NULL      |
-- |       5 | Maha      | NULL      |
-- |       6 | Gamal     | Pascal    |
-- |       7 | Ayman     | Python    |
-- +---------+-----------+-----------+

-- جاب كل المستخدمين، حتى الذين ليس لهم لغة (ظهرت لغتهم NULL)

-- ───────────────────────────────────────────────────────────────

SELECT
    u.user_id,
    u.user_name,
    l.lang_name
FROM
    users u
RIGHT JOIN
    langs l
ON
    l.lang_id = u.lang_id
ORDER BY
    l.lang_id;

-- +---------+-----------+-----------+
-- | user_id | user_name | lang_name |
-- +---------+-----------+-----------+
-- |       7 | Ayman     | Python    |
-- |       2 | Ahmed     | Python    |
-- |       1 | Osama     | Python    |
-- |    NULL | NULL      | Html      |
-- |    NULL | NULL      | C#        |
-- |       3 | Mohammed  | Java      |
-- |       6 | Gamal     | Pascal    |
-- +---------+-----------+-----------+

-- جاب كل اللغات، حتى التي لا يستخدمها أحد (ظهر المستخدم NULL مثل Html و C#)

-- ───────────────────────────────────────────────────────────────

-- Example Advanced: حساب عدد مرات استخدام كل لغة

SELECT
    l.lang_name,
    COUNT(l.lang_id) AS How_Much_Use
FROM
    users u
INNER JOIN
    langs l
ON
    l.lang_id = u.lang_id
GROUP BY
    l.lang_id;

-- +-----------+--------------+
-- | lang_name | How_Much_Use |
-- +-----------+--------------+
-- | Python    |            3 |
-- | Java      |            1 |
-- | Pascal    |            1 |
-- +-----------+--------------+

-- -----------------------------

-- معلومة على الماشي:

-- ON
--     l.lang_id = u.lang_id

-- بنلاحظ أن اسم العمود متشابه في الجدولين
-- لذلك أقدر أختصر الشرط باستخدام USING بدل ON

SELECT
    l.lang_name,
    COUNT(l.lang_id) AS How_Much_Use
FROM
    users u
INNER JOIN
    langs l
USING
    (lang_id)
GROUP BY
    l.lang_id;

-- +-----------+--------------+
-- | lang_name | How_Much_Use |
-- +-----------+--------------+
-- | Python    |            3 |
-- | Java      |            1 |
-- | Pascal    |            1 |
-- +-----------+--------------+

-- والنتيجة نفسها، فقط اختصرت الكود وجعلته أكثر ترتيبا
