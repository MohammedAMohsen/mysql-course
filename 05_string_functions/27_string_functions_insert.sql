-- Lesson 27 - String Functions - Insert
-- Video: https://www.youtube.com/watch?v=-zd9gcP0_Cw

-- MySQL String Functions Syntax:

-- INSERT(String, Position, Length, New String)
-- تختلف كليا عن أمر الإضافة INSERT INTO، هذه دالة تستبدل جزءا من النص

-- =============================================================

-- تجهيز
CREATE DATABASE IF NOT EXISTS test;
USE test;
DROP TABLE IF EXISTS try;
CREATE TABLE try(id INT UNIQUE AUTO_INCREMENT, text VARCHAR(255));
INSERT INTO try(text) VALUES('Gaza'), ('Hebron'), ('Egypt'), ('syria');

SELECT * FROM try;

-- +----+--------+
-- | id | text   |
-- +----+--------+
-- |  1 | Gaza   |
-- |  2 | Hebron |
-- |  3 | Egypt  |
-- |  4 | syria  |
-- +----+--------+

-- ------------------------------------

SELECT text, INSERT(text, 3, 2, 'Mohammed') AS InsertText FROM try;

-- +--------+--------------+
-- | text   | InsertText   |
-- +--------+--------------+
-- | Gaza   | GaMohammed   |
-- | Hebron | HeMohammedon |
-- | Egypt  | EgMohammedt  |
-- | syria  | syMohammeda  |
-- +--------+--------------+

-- من الموضع 3، استبدل حرفين بالنص 'Mohammed'
-- Ga(Mohammed)       <- حذف za
-- He(Mohammed)on     <- حذف br
-- Eg(Mohammed)t      <- حذف yp
-- sy(Mohammed)a      <- حذف ri

-- =============================================================

-- مثال واقعي من الحياة العملية: تغيير جزء من الرقم التسلسلي للمنتجات

DROP TABLE IF EXISTS product;
CREATE TABLE product(id INT UNIQUE AUTO_INCREMENT, PNumber VARCHAR(255), PName VARCHAR(255));
INSERT INTO product(PNumber, PName) VALUES('2020-Albasha-3454546', 'PRO#'), ('2020-Albasha-2345423', 'PRO#'), ('2020-Albasha-1466666', 'PRO#');

SELECT * FROM product;

-- +----+----------------------+-------+
-- | id | PNumber              | PName |
-- +----+----------------------+-------+
-- |  1 | 2020-Albasha-3454546 | PRO#  |
-- |  2 | 2020-Albasha-2345423 | PRO#  |
-- |  3 | 2020-Albasha-1466666 | PRO#  |
-- +----+----------------------+-------+

-- أريد تغيير المقطع Albasha في الرقم التسلسلي إلى اسم آخر
-- يوجد العديد من الطرق والدوال التي أقدر أعدل فيها الرقم
-- لكن نريد استعمال الدالة INSERT

UPDATE product SET PNumber = INSERT(PNumber, 6, 7, 'PUBGE');

SELECT * FROM product;

-- +----+--------------------+-------+
-- | id | PNumber            | PName |
-- +----+--------------------+-------+
-- |  1 | 2020-PUBGE-3454546 | PRO#  |
-- |  2 | 2020-PUBGE-2345423 | PRO#  |
-- |  3 | 2020-PUBGE-1466666 | PRO#  |
-- +----+--------------------+-------+

-- ------------------------------------

UPDATE product SET PName = INSERT(PName, 4, 1, id);

SELECT * FROM product;

-- +----+--------------------+-------+
-- | id | PNumber            | PName |
-- +----+--------------------+-------+
-- |  1 | 2020-PUBGE-3454546 | PRO1  |
-- |  2 | 2020-PUBGE-2345423 | PRO2  |
-- |  3 | 2020-PUBGE-1466666 | PRO3  |
-- +----+--------------------+-------+

-- غيرنا اسم المنتج بإضافة رقم id بدل علامة الهاش
