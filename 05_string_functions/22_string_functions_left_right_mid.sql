-- Lesson 22 - String Functions - Left, Right, Mid
-- Video: https://www.youtube.com/watch?v=tUArSgsi9tA

-- MySQL String Functions Syntax:

-- LEFT(String, Length)          -- يعطيني عددا من الأحرف من بداية النص حسب الطول الذي أحدده
-- MID(String, Position, Length) -- نفس الفكرة، لكن أحدد المكان الذي يبدأ منه عن طريق Position
-- RIGHT(String, Length)         -- نفس فكرة LEFT، لكن يجيب الأحرف من نهاية النص

-- =============================================================

-- تجهيز: جدول تجارب فيه أسماء ثلاث مدن
CREATE DATABASE IF NOT EXISTS test;
USE test;
DROP TABLE IF EXISTS try;

CREATE TABLE try(id INT UNIQUE AUTO_INCREMENT, text VARCHAR(255));

INSERT INTO try(text) VALUES('GAZA'), ('Hebron'), ('Egypt');

SELECT * FROM try;

-- +----+--------+
-- | id | text   |
-- +----+--------+
-- |  1 | GAZA   |
-- |  2 | Hebron |
-- |  3 | Egypt  |
-- +----+--------+

-- ----------------

SELECT LEFT(text, 2) FROM try;

-- +---------------+
-- | LEFT(text, 2) |
-- +---------------+
-- | GA            |
-- | He            |
-- | Eg            |
-- +---------------+

-- -----------------

SELECT RIGHT(text, 3) FROM try;

-- +----------------+
-- | RIGHT(text, 3) |
-- +----------------+
-- | AZA            |
-- | ron            |
-- | ypt            |
-- +----------------+

-- -----------------

SELECT MID(text, 3, 4) FROM try;

-- +-----------------+
-- | MID(text, 3, 4) |
-- +-----------------+
-- | ZA              |
-- | bron            |
-- | ypt             |
-- +-----------------+

-- من الموضع 3 في النص اقرأ 4 أحرف
-- لاحظ GAZA أعطت ZA فقط، لأن النص انتهى قبل أن يكمل 4 أحرف
