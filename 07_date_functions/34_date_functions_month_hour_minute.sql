-- Lesson 34 - Date Functions - Month, Hour, Minute
-- Video: https://www.youtube.com/watch?v=lnoizliyD0U

-- Date & Time Function Syntax:

-- MONTH(Date)      -- رقم الشهر
-- MONTHNAME(Date)  -- اسم الشهر
-- HOUR(Date)       -- الساعة
-- MINUTE(Date)     -- الدقيقة

-- نثبت الوقت الحالي على وقت تسجيل الدرس. احذف السطر لترى وقتك أنت
SET TIMESTAMP = UNIX_TIMESTAMP('2026-04-16 18:42:00');

SELECT MONTH(NOW()), MONTHNAME(NOW()), HOUR(NOW()), MINUTE(NOW());

-- +--------------+------------------+-------------+---------------+
-- | MONTH(NOW()) | MONTHNAME(NOW()) | HOUR(NOW()) | MINUTE(NOW()) |
-- +--------------+------------------+-------------+---------------+
-- |            4 | April            |          18 |            42 |
-- +--------------+------------------+-------------+---------------+

SET TIMESTAMP = DEFAULT;

-- =================================================================

-- تجهيز: نفس جدول الدرس السابق
CREATE DATABASE IF NOT EXISTS test;
USE test;
DROP TABLE IF EXISTS try;
CREATE TABLE try(id INT UNIQUE AUTO_INCREMENT, name VARCHAR(255), date DATE);
INSERT INTO try(name, date) VALUES('Mohammed', '2019-03-14'), ('Mostafa', '2022-12-09'), ('Albasha', '2021-08-22');

ALTER TABLE try MODIFY date DATETIME; -- غيرت نوع العمود من DATE إلى DATETIME

SELECT * FROM try;

-- +----+----------+---------------------+
-- | id | name     | date                |
-- +----+----------+---------------------+
-- |  1 | Mohammed | 2019-03-14 00:00:00 |
-- |  2 | Mostafa  | 2022-12-09 00:00:00 |
-- |  3 | Albasha  | 2021-08-22 00:00:00 |
-- +----+----------+---------------------+

-- لاحظ التواريخ الموجودة أخذت الوقت 00:00:00، فنضيف لها أوقاتا

UPDATE try SET date = '2019-03-14 16:10:42' WHERE id = 1;
UPDATE try SET date = '2022-12-09 02:40:25' WHERE id = 2;
UPDATE try SET date = '2021-08-22 11:00:00' WHERE id = 3;

SELECT * FROM try;

-- +----+----------+---------------------+
-- | id | name     | date                |
-- +----+----------+---------------------+
-- |  1 | Mohammed | 2019-03-14 16:10:42 |
-- |  2 | Mostafa  | 2022-12-09 02:40:25 |
-- |  3 | Albasha  | 2021-08-22 11:00:00 |
-- +----+----------+---------------------+

-- ------------------------------------

SELECT date, MONTH(date), MONTHNAME(date), HOUR(date), MINUTE(date) FROM try;

-- +---------------------+-------------+-----------------+------------+--------------+
-- | date                | MONTH(date) | MONTHNAME(date) | HOUR(date) | MINUTE(date) |
-- +---------------------+-------------+-----------------+------------+--------------+
-- | 2019-03-14 16:10:42 |           3 | March           |         16 |           10 |
-- | 2022-12-09 02:40:25 |          12 | December        |          2 |           40 |
-- | 2021-08-22 11:00:00 |           8 | August          |         11 |            0 |
-- +---------------------+-------------+-----------------+------------+--------------+
