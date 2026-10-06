-- Lesson 33 - Date Functions - Day, Dayname
-- Video: https://www.youtube.com/watch?v=xHtEP_KurzQ

-- Date & Time Function Syntax:

-- DAYNAME(Date)    -- اسم اليوم
-- DAYOFMONTH(Date) -- رقم اليوم في الشهر
-- DAYOFWEEK(Date)  -- رقم اليوم في الأسبوع، ويبدأ من الأحد = 1
-- DAYOFYEAR(Date)  -- رقم اليوم في السنة

SELECT DAYNAME('2026-04-16'), DAYOFMONTH('2026-04-16'), DAYOFWEEK('2026-04-16'), DAYOFYEAR('2026-04-16');

-- +-----------------------+--------------------------+-------------------------+-------------------------+
-- | DAYNAME('2026-04-16') | DAYOFMONTH('2026-04-16') | DAYOFWEEK('2026-04-16') | DAYOFYEAR('2026-04-16') |
-- +-----------------------+--------------------------+-------------------------+-------------------------+
-- | Thursday              |                       16 |                       5 |                     106 |
-- +-----------------------+--------------------------+-------------------------+-------------------------+

-- =============================================================

-- نثبت اليوم الحالي على تاريخ تسجيل الدرس. احذف السطر لترى تاريخ اليوم عندك
SET TIMESTAMP = UNIX_TIMESTAMP('2026-04-16 12:00:00');

SELECT CURDATE() AS Today, DAYNAME(CURDATE()) AS TodayName;

-- +------------+-----------+
-- | Today      | TodayName |
-- +------------+-----------+
-- | 2026-04-16 | Thursday  |
-- +------------+-----------+

SET TIMESTAMP = DEFAULT;

-- -----------------------------

-- تجهيز
CREATE DATABASE IF NOT EXISTS test;
USE test;
DROP TABLE IF EXISTS try;
CREATE TABLE try(id INT UNIQUE AUTO_INCREMENT, name VARCHAR(255), date DATE);
INSERT INTO try(name, date) VALUES('Mohammed', '2019-03-14'), ('Mostafa', '2022-12-09'), ('Albasha', '2021-08-22');

SELECT * FROM try;

-- +----+----------+------------+
-- | id | name     | date       |
-- +----+----------+------------+
-- |  1 | Mohammed | 2019-03-14 |
-- |  2 | Mostafa  | 2022-12-09 |
-- |  3 | Albasha  | 2021-08-22 |
-- +----+----------+------------+

-- -----------------------------

SELECT name, date, DAYNAME(date) AS DN, DAYOFWEEK(date) AS DW, DAYOFMONTH(date) AS DM, DAYOFYEAR(date) AS DY FROM try;

-- +----------+------------+----------+----+----+-----+
-- | name     | date       | DN       | DW | DM | DY  |
-- +----------+------------+----------+----+----+-----+
-- | Mohammed | 2019-03-14 | Thursday |  5 | 14 |  73 |
-- | Mostafa  | 2022-12-09 | Friday   |  6 |  9 | 343 |
-- | Albasha  | 2021-08-22 | Sunday   |  1 | 22 | 234 |
-- +----------+------------+----------+----+----+-----+
