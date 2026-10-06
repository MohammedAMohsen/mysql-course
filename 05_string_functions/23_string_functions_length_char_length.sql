-- Lesson 23 - String Functions - Length, Char_Length
-- Video: https://www.youtube.com/watch?v=McOxD4jcG6o

-- MySQL String Functions Syntax:

-- LENGTH(String)
-- CHAR_LENGTH(String), CHARACTER_LENGTH(String) -- الاثنتان نفس الشيء

-- وظيفتهم حساب طول النص

-- ==============================================================

-- تجهيز
CREATE DATABASE IF NOT EXISTS test;
USE test;
DROP TABLE IF EXISTS try;
CREATE TABLE try(id INT UNIQUE AUTO_INCREMENT, text VARCHAR(255));
INSERT INTO try(text) VALUES('Gaza'), ('Hebron'), ('Egypt');

SELECT * FROM try;

-- +----+--------+
-- | id | text   |
-- +----+--------+
-- |  1 | Gaza   |
-- |  2 | Hebron |
-- |  3 | Egypt  |
-- +----+--------+

-- ------------------

SELECT text, LENGTH(text) AS count FROM try;

-- +--------+-------+
-- | text   | count |
-- +--------+-------+
-- | Gaza   |     4 |
-- | Hebron |     6 |
-- | Egypt  |     5 |
-- +--------+-------+

-- أعطيت اسما للعمود الذي يظهر فيه ناتج الدالة: count

-- ==============================================================

-- من ميزات حساب طول النص أني أقدر أرتب الصفوف حسب طول النص

SELECT text, CHAR_LENGTH(text) AS count FROM try ORDER BY CHAR_LENGTH(text);

-- +--------+-------+
-- | text   | count |
-- +--------+-------+
-- | Gaza   |     4 |
-- | Egypt  |     5 |
-- | Hebron |     6 |
-- +--------+-------+

SELECT text, CHAR_LENGTH(text) AS count FROM try ORDER BY count DESC;

-- +--------+-------+
-- | text   | count |
-- +--------+-------+
-- | Hebron |     6 |
-- | Egypt  |     5 |
-- | Gaza   |     4 |
-- +--------+-------+

-- ==============================================================

-- ما الفرق بين LENGTH و CHAR_LENGTH؟

INSERT INTO try(text) VALUES('€');

SELECT text, LENGTH(text) AS count FROM try;

-- +--------+-------+
-- | text   | count |
-- +--------+-------+
-- | Gaza   |     4 |
-- | Hebron |     6 |
-- | Egypt  |     5 |
-- | €      |     3 |
-- +--------+-------+

SELECT text, CHAR_LENGTH(text) AS count FROM try;

-- +--------+-------+
-- | text   | count |
-- +--------+-------+
-- | Gaza   |     4 |
-- | Hebron |     6 |
-- | Egypt  |     5 |
-- | €      |     1 |
-- +--------+-------+

-- لاحظ الفرق: LENGTH حسبت الرمز € على أنه 3، أما CHAR_LENGTH فحسبته 1
-- السبب: LENGTH تحسب عدد البايتات (Bytes) التي يأخذها النص في الذاكرة
-- و CHAR_LENGTH تحسب عدد الحروف فقط
-- الحروف الإنجليزية تأخذ بايتا واحدا لكل حرف، فتتساوى الدالتان معها
-- أما الرموز والحروف العربية فتأخذ أكثر من بايت، فيظهر الفرق

SELECT LENGTH('محمد') AS bytes, CHAR_LENGTH('محمد') AS chars;

-- +-------+-------+
-- | bytes | chars |
-- +-------+-------+
-- |     8 |     4 |
-- +-------+-------+
