-- Lesson 44 - Arithmetic Operators
-- Video: https://www.youtube.com/watch?v=EhSLy9WtdK8

-- Arithmetic Operators

SELECT 2 * 2;

-- +-------+
-- | 2 * 2 |
-- +-------+
-- |     4 |
-- +-------+

SELECT ((2 + 2) * 50) / 4;

-- +--------------------+
-- | ((2 + 2) * 50) / 4 |
-- +--------------------+
-- |            50.0000 |
-- +--------------------+

-- لاحظ القسمة تعطي ناتجا بعلامة عشرية

SELECT ROUND(((2 + 2) * 50) / 4);

-- +---------------------------+
-- | ROUND(((2 + 2) * 50) / 4) |
-- +---------------------------+
-- |                        50 |
-- +---------------------------+

-- استخدمت ROUND عشان يكون الناتج بدون علامة عشرية

SELECT 100 DIV 2;

-- +-----------+
-- | 100 DIV 2 |
-- +-----------+
-- |        50 |
-- +-----------+

-- DIV تعطي ناتج القسمة بدون علامة عشرية مباشرة، بدون ما أستخدم ROUND

SELECT 21 % 2;

-- +--------+
-- | 21 % 2 |
-- +--------+
-- |      1 |
-- +--------+

-- العلامة % تعطي باقي القسمة، مثل MOD

-- ======================================================

-- تجهيز: جدول الموظفين
CREATE DATABASE IF NOT EXISTS test;
USE test;
DROP TABLE IF EXISTS Company;
CREATE TABLE Company(id INT UNIQUE AUTO_INCREMENT, user VARCHAR(255), days INT, daysalary INT);
INSERT INTO Company(user, days, daysalary) VALUES('Albasha', 8, 50), ('Mohammed', 4, 30), ('Maha', 10, 70), ('Ahmed', 9, 60), ('Faten', 15, 100);

SELECT * FROM Company;

-- +----+----------+------+-----------+
-- | id | user     | days | daysalary |
-- +----+----------+------+-----------+
-- |  1 | Albasha  |    8 |        50 |
-- |  2 | Mohammed |    4 |        30 |
-- |  3 | Maha     |   10 |        70 |
-- |  4 | Ahmed    |    9 |        60 |
-- |  5 | Faten    |   15 |       100 |
-- +----+----------+------+-----------+

-- ──────────────────────────────────────────────────────────────────────────────────────

SELECT user, days AS DaysOfWork, daysalary AS dayRate, (days * daysalary) AS TotalSalary FROM Company;

-- +----------+------------+---------+-------------+
-- | user     | DaysOfWork | dayRate | TotalSalary |
-- +----------+------------+---------+-------------+
-- | Albasha  |          8 |      50 |         400 |
-- | Mohammed |          4 |      30 |         120 |
-- | Maha     |         10 |      70 |         700 |
-- | Ahmed    |          9 |      60 |         540 |
-- | Faten    |         15 |     100 |        1500 |
-- +----------+------------+---------+-------------+

-- عدد الأيام التي اشتغلها، وراتب كل يوم، والمجموع الكلي لراتبه

-- ──────────────────────────────────────────────────────────────────────────────────────

SELECT
    user,
    days AS DaysOfWork,
    daysalary AS dayRate,
    (days * daysalary) AS TotalSalary,
    (days * daysalary) + 100 AS TotalSalaryAndBonus
FROM Company;

-- +----------+------------+---------+-------------+---------------------+
-- | user     | DaysOfWork | dayRate | TotalSalary | TotalSalaryAndBonus |
-- +----------+------------+---------+-------------+---------------------+
-- | Albasha  |          8 |      50 |         400 |                 500 |
-- | Mohammed |          4 |      30 |         120 |                 220 |
-- | Maha     |         10 |      70 |         700 |                 800 |
-- | Ahmed    |          9 |      60 |         540 |                 640 |
-- | Faten    |         15 |     100 |        1500 |                1600 |
-- +----------+------------+---------+-------------+---------------------+

-- نفس السابق مع مكافأة 100 لكل موظف
