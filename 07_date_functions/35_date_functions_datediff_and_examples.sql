-- Lesson 35 - Date Functions - DateDiff + Examples
-- Video: https://www.youtube.com/watch?v=rfxZ_JQVFzY

-- Date & Time Function Syntax:

-- DATEDIFF(Date1, Date2) -- عدد الأيام بين تاريخين (التاريخ الأول ناقص التاريخ الثاني)

-- ============================================================

-- تجهيز
CREATE DATABASE IF NOT EXISTS test;
USE test;
DROP TABLE IF EXISTS try;
CREATE TABLE try(id INT UNIQUE AUTO_INCREMENT, name VARCHAR(255), date DATETIME);
INSERT INTO try(name, date) VALUES
    ('Mohammed', '2019-03-14 16:10:42'),
    ('Mostafa', '2022-12-09 02:40:25'),
    ('Albasha', '2021-08-22 11:00:00'),
    ('Gamal', '2026-02-21 00:00:00');

-- نثبت اليوم الحالي على تاريخ تسجيل الدرس. احذف السطر لترى العدد الصحيح حسب تاريخ اليوم
SET TIMESTAMP = UNIX_TIMESTAMP('2026-04-17 12:00:00');

SELECT *, CONCAT('Registered ', DATEDIFF(CURDATE(), date), ' Days Ago.') AS NumberOfDays FROM try;

-- +----+----------+---------------------+---------------------------+
-- | id | name     | date                | NumberOfDays              |
-- +----+----------+---------------------+---------------------------+
-- |  1 | Mohammed | 2019-03-14 16:10:42 | Registered 2591 Days Ago. |
-- |  2 | Mostafa  | 2022-12-09 02:40:25 | Registered 1225 Days Ago. |
-- |  3 | Albasha  | 2021-08-22 11:00:00 | Registered 1699 Days Ago. |
-- |  4 | Gamal    | 2026-02-21 00:00:00 | Registered 55 Days Ago.   |
-- +----+----------+---------------------+---------------------------+

-- عدد الأيام من يوم ما سجلوا لليوم

SET TIMESTAMP = DEFAULT;
