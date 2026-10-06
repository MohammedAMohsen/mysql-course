-- Lesson 42 - Control Flow Functions - If
-- Video: https://www.youtube.com/watch?v=ZWpat_A-1Q8

-- Control Flow Function

-- IF(Condition, Value If True, Value If False)

-- =========================================================

-- تجهيز: نفس الجدول مع عمود جديد للعلامات
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

SELECT id, name, IF(mark >= 60, CONCAT('Excellent - ', mark), CONCAT('Hard Luck - ', mark)) AS result FROM try;

-- +----+----------+----------------+
-- | id | name     | result         |
-- +----+----------+----------------+
-- |  1 | Mohammed | Excellent - 90 |
-- |  2 | Mostafa  | Excellent - 78 |
-- |  3 | Albasha  | Excellent - 83 |
-- |  4 | Gamal    | Hard Luck - 46 |  <==
-- |  6 | Marwa    | Excellent - 60 |
-- |  7 | Maha     | Hard Luck - 49 |  <==
-- |  8 | Mal      | Excellent - 92 |
-- |  9 | Mh       | Excellent - 88 |
-- | 10 | Sameh    | Hard Luck - 0  |  <==
-- | 11 | Samah    | Hard Luck - 32 |  <==
-- +----+----------+----------------+

-- كل من علامته 60 وما فوق يكتب له Excellent، وما دون ذلك يكتب له Hard Luck (حظ أوفر)

-- ──────────────────────────────────────────────────────────────────────────────────────

UPDATE try SET mark = IF(mark < 60, mark + 11, mark);

SELECT id, name, IF(mark >= 60, CONCAT('Excellent - ', mark), CONCAT('Hard Luck - ', mark)) AS result FROM try;

-- +----+----------+----------------+
-- | id | name     | result         |
-- +----+----------+----------------+
-- |  1 | Mohammed | Excellent - 90 |
-- |  2 | Mostafa  | Excellent - 78 |
-- |  3 | Albasha  | Excellent - 83 |
-- |  4 | Gamal    | Hard Luck - 57 |  <==
-- |  6 | Marwa    | Excellent - 60 |
-- |  7 | Maha     | Excellent - 60 |
-- |  8 | Mal      | Excellent - 92 |
-- |  9 | Mh       | Excellent - 88 |
-- | 10 | Sameh    | Hard Luck - 11 |  <==
-- | 11 | Samah    | Hard Luck - 43 |  <==
-- +----+----------+----------------+

-- عملت تحديثا للأشخاص الذين علامتهم أقل من 60، وزدت لهم 11 علامة
-- لاحظ الطالبة Maha نجحت، كانت علامتها 49 قبل الزيادة وأصبحت 60
