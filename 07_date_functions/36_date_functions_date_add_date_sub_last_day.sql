-- Lesson 36 - Date Functions - Date_Add, Date_Sub, Last_Day
-- Video: https://www.youtube.com/watch?v=r7IxZzX9J8k

-- Date & Time Function Syntax:

-- LAST_DAY(Date)                                -- آخر يوم في شهر التاريخ
-- DATE_ADD(Date, INTERVAL Expression TimeUnit)  -- (+) إضافة مدة على التاريخ
-- DATE_SUB(Date, INTERVAL Expression TimeUnit)  -- (-) طرح مدة من التاريخ

-- INTERVAL:    الفترة
-- Expression:  العدد
-- TimeUnit:    وحدة الوقت التي سأزيدها مثل DAY و MONTH و YEAR

-- مثال: INTERVAL 1 DAY تعني فترة يوم واحد

-- لمعرفة وحدات الوقت يمكنك زيارة موقع اللغة
-- https://dev.mysql.com/doc/refman/8.0/en/expressions.html#temporal-intervals

-- DATE_ADD: تستخدم بشكل شائع في حساب الفترات الزمنية، أو تطبيق فلتر معين على فترة زمنية

-- =================================================================

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

SELECT name, date, LAST_DAY(date), DAYNAME(LAST_DAY(date)) FROM try;

-- +----------+---------------------+----------------+-------------------------+
-- | name     | date                | LAST_DAY(date) | DAYNAME(LAST_DAY(date)) |
-- +----------+---------------------+----------------+-------------------------+
-- | Mohammed | 2019-03-14 16:10:42 | 2019-03-31     | Sunday                  |
-- | Mostafa  | 2022-12-09 02:40:25 | 2022-12-31     | Saturday                |
-- | Albasha  | 2021-08-22 11:00:00 | 2021-08-31     | Tuesday                 |
-- | Gamal    | 2026-02-21 00:00:00 | 2026-02-28     | Saturday                |
-- +----------+---------------------+----------------+-------------------------+

-- يعرض آخر يوم في الشهر واسمه

-- =================================================================

UPDATE try SET date = DATE_ADD(date, INTERVAL 10 DAY);

SELECT * FROM try;

-- +----+----------+---------------------+
-- | id | name     | date                |
-- +----+----------+---------------------+
-- |  1 | Mohammed | 2019-03-24 16:10:42 |
-- |  2 | Mostafa  | 2022-12-19 02:40:25 |
-- |  3 | Albasha  | 2021-09-01 11:00:00 |
-- |  4 | Gamal    | 2026-03-03 00:00:00 |
-- +----+----------+---------------------+

-- لاحظ زاد 10 أيام على كل تاريخ
-- ولاحظ أنه انتقل للشهر التالي تلقائيا عند الحاجة، مثل 2021-08-22 أصبح 2021-09-01

-- --------------------------------------------

UPDATE try SET date = DATE_ADD(date, INTERVAL 1 MONTH);

SELECT * FROM try;

-- +----+----------+---------------------+
-- | id | name     | date                |
-- +----+----------+---------------------+
-- |  1 | Mohammed | 2019-04-24 16:10:42 |
-- |  2 | Mostafa  | 2023-01-19 02:40:25 |
-- |  3 | Albasha  | 2021-10-01 11:00:00 |
-- |  4 | Gamal    | 2026-04-03 00:00:00 |
-- +----+----------+---------------------+

-- لاحظ زاد شهرا على كل تاريخ
-- وفي التاريخ الثاني (شهر 12) لما زاد عليه انتقل إلى سنة جديدة

-- --------------------------------------------

UPDATE try SET date = DATE_SUB(date, INTERVAL 2 YEAR);

SELECT * FROM try;

-- +----+----------+---------------------+
-- | id | name     | date                |
-- +----+----------+---------------------+
-- |  1 | Mohammed | 2017-04-24 16:10:42 |
-- |  2 | Mostafa  | 2021-01-19 02:40:25 |
-- |  3 | Albasha  | 2019-10-01 11:00:00 |
-- |  4 | Gamal    | 2024-04-03 00:00:00 |
-- +----+----------+---------------------+

-- نقص سنتين من كل تاريخ
