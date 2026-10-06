-- Lesson 31 - Numeric Functions - Mod, Truncate, Pow
-- Video: https://www.youtube.com/watch?v=AXsB-n7n3O8

-- MySQL Numeric & Math Functions Syntax:

-- MOD(Number, Divisor)      -- باقي القسمة
-- POW(Number, Power)        -- الأس
-- TRUNCATE(Number, Decimal) -- يقص الرقم ويترك عددا محددا من الأرقام بعد الفاصلة، وانتبه: هو لا يقرب

-- ============================================================

-- تجهيز
CREATE DATABASE IF NOT EXISTS test;
USE test;
DROP TABLE IF EXISTS try;
CREATE TABLE try(id INT UNIQUE AUTO_INCREMENT, number DOUBLE);
INSERT INTO try(number) VALUES(1.5), (1.955), (1.346645);

SELECT number, TRUNCATE(number, 2) AS NumberTruncate FROM try;

-- +----------+----------------+
-- | number   | NumberTruncate |
-- +----------+----------------+
-- |      1.5 |            1.5 |
-- |    1.955 |           1.95 |
-- | 1.346645 |           1.34 |
-- +----------+----------------+

-- ممكن أستخدمها أثناء إدخال البيانات

INSERT INTO try(number) VALUES(TRUNCATE(12.54562, 3));

SELECT number FROM try WHERE id = 4;

-- +--------+
-- | number |
-- +--------+
-- | 12.545 |
-- +--------+

-- لاحظ هو ما بقرب (لو قرب لكانت 12.546)، هو فقط يقص الأرقام الزائدة

-- --------------------------------------

DELETE FROM try;
INSERT INTO try(number) VALUES(3), (2), (4);

SELECT number, POW(number, 2) AS NumberPow2 FROM try;

-- +--------+------------+
-- | number | NumberPow2 |
-- +--------+------------+
-- |      3 |          9 |
-- |      2 |          4 |
-- |      4 |         16 |
-- +--------+------------+

-- --------------------------------------

SELECT number, MOD(number, 3) AS NumberMod3 FROM try;

-- +--------+------------+
-- | number | NumberMod3 |
-- +--------+------------+
-- |      3 |          0 |
-- |      2 |          2 |
-- |      4 |          1 |
-- +--------+------------+

SELECT MOD(35, 4);

-- +------------+
-- | MOD(35, 4) |
-- +------------+
-- |          3 |
-- +------------+
