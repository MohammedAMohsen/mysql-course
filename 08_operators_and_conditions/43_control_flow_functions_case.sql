-- Lesson 43 - Control Flow Functions - Case
-- Video: https://www.youtube.com/watch?v=wkuKvWOoagQ

-- Control Flow Function

-- الطريقة الأولى:
-- CASE
--     WHEN Condition THEN Result
--     WHEN Condition THEN Result
--     ELSE Result
-- END

-- الطريقة الثانية:
-- CASE Expression
--     WHEN Value THEN Result
--     WHEN Value THEN Result
--     ELSE Result
-- END

-- -------------

-- الفرق بين الطريقتين:
-- الطريقة الأولى (CASE بدون تعبير بعدها): كل WHEN فيها شرط كامل، فأقدر أستخدم أكبر من وأصغر من وهكذا
-- الطريقة الثانية (CASE ثم تعبير): تقارن قيمة التعبير بقيم ثابتة مباشرة، يعني تساوي فقط

-- ==========================================================

-- تجهيز: الجدول بعد تحديث العلامات في الدرس السابق
CREATE DATABASE IF NOT EXISTS test;
USE test;
DROP TABLE IF EXISTS try;
CREATE TABLE try(id INT UNIQUE AUTO_INCREMENT, name VARCHAR(255), date DATETIME, number INT);
INSERT INTO try(name, date, number) VALUES
    ('Mohammed', '2017-04-24 16:10:42', 1),
    ('Mostafa', '2021-01-19 02:40:25', 2),
    ('Albasha', '2019-10-01 11:00:00', 3),
    ('Gamal', '2024-04-03 00:00:00', 4),
    ('Shamah', '2026-04-18 12:51:06', 5),
    ('Marwa', '2025-05-03 00:00:00', 6);
INSERT INTO try(name, date, number) VALUES
    ('Maha', '2026-04-19 00:00:00', 2),
    ('Mal', '2026-04-19 00:00:00', 8),
    ('Mh', '2026-04-19 14:23:22', 1),
    ('Sameh', '2026-04-19 14:32:10', 11),
    ('Samah', '2026-04-19 14:32:18', 11);
DELETE FROM try WHERE id = 5; -- حذفت الصف رقم 5 قبل هذا الدرس
ALTER TABLE try ADD mark INT;
UPDATE try SET mark = CASE id
    WHEN 1 THEN 90 WHEN 2 THEN 78 WHEN 3 THEN 83 WHEN 4 THEN 46 WHEN 6 THEN 60
    WHEN 7 THEN 49 WHEN 8 THEN 92 WHEN 9 THEN 88 WHEN 10 THEN 0 WHEN 11 THEN 32 END;
UPDATE try SET mark = IF(mark < 60, mark + 11, mark);

SELECT id, name, mark,
CASE
    WHEN mark >= 90 THEN 'Excellent'
    WHEN mark >= 80 THEN 'Very Good'
    WHEN mark >= 70 THEN 'Good'
    WHEN mark >= 60 THEN 'Accept'
    ELSE 'Fail'
END
AS GRADE FROM try;

-- +----+----------+------+-----------+
-- | id | name     | mark | GRADE     |
-- +----+----------+------+-----------+
-- |  1 | Mohammed |   90 | Excellent |
-- |  2 | Mostafa  |   78 | Good      |
-- |  3 | Albasha  |   83 | Very Good |
-- |  4 | Gamal    |   57 | Fail      |
-- |  6 | Marwa    |   60 | Accept    |
-- |  7 | Maha     |   60 | Accept    |
-- |  8 | Mal      |   92 | Excellent |
-- |  9 | Mh       |   88 | Very Good |
-- | 10 | Sameh    |   11 | Fail      |
-- | 11 | Samah    |   43 | Fail      |
-- +----+----------+------+-----------+

-- ──────────────────────────────────────────────────────────────────

SELECT id, name,
CASE id
    WHEN 1 THEN 'None'
    WHEN 3 THEN 'None'
    WHEN 6 THEN 'None'
    WHEN 10 THEN 'None'
    ELSE id
END AS GRADE
FROM try;

-- +----+----------+-------+
-- | id | name     | GRADE |
-- +----+----------+-------+
-- |  1 | Mohammed | None  |
-- |  2 | Mostafa  | 2     |
-- |  3 | Albasha  | None  |
-- |  4 | Gamal    | 4     |
-- |  6 | Marwa    | None  |
-- |  7 | Maha     | 7     |
-- |  8 | Mal      | 8     |
-- |  9 | Mh       | 9     |
-- | 10 | Sameh    | None  |
-- | 11 | Samah    | 11    |
-- +----+----------+-------+
