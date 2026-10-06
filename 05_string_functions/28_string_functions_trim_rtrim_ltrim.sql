-- Lesson 28 - String Functions - Trim, Rtrim, Ltrim
-- Video: https://www.youtube.com/watch?v=_8C0nVIL5Gk

-- MySQL String Functions Syntax:

-- LTRIM(String) -- يزيل المسافات من بداية النص فقط (من اليسار، Left)
-- RTRIM(String) -- يزيل المسافات من نهاية النص فقط (من اليمين، Right)

-- TRIM([LEADING | TRAILING | BOTH] [Remove String] FROM String)

-- يزيل أي نص أحدده من بداية النص أو من نهايته أو من الجهتين
-- [LEADING | TRAILING | BOTH] -> الوضع الافتراضي BOTH إذا لم أحدد الجهة
-- [Remove String]              -> إذا لم أكتبه، يزيل المسافات
-- [String]                     -> النص الذي أمرره للدالة حتى يزيل منه

-- =============================================================

-- تجهيز: نص فيه 5 مسافات قبله و4 بعده، ونص فيه 4 مسافات بعده فقط
CREATE DATABASE IF NOT EXISTS test;
USE test;
DROP TABLE IF EXISTS try;
CREATE TABLE try(id INT UNIQUE AUTO_INCREMENT, text VARCHAR(255));
INSERT INTO try(text) VALUES('     Mohammed    '), ('Albasha    ');

SELECT text, LENGTH(text) AS ALT, TRIM(BOTH FROM text) AS TextWithoutSpace, LENGTH(TRIM(BOTH FROM text)) AS BLT FROM try;

-- +-------------------+-----+------------------+-----+
-- | text              | ALT | TextWithoutSpace | BLT |
-- +-------------------+-----+------------------+-----+
-- |      Mohammed     |  17 | Mohammed         |   8 |
-- | Albasha           |  11 | Albasha          |   7 |
-- +-------------------+-----+------------------+-----+

-- استعلام أقدر من خلاله ملاحظة الفرق بحساب طول النص قبل الإزالة (ALT) وبعدها (BLT)
-- لاحظ أزال المسافات من الجهتين

-- استخدم BOTH كقيمة افتراضية لأني ما حددت الجهة
-- وأزال المسافات لأني ما حددت شو هو النص الذي يزيله
-- النتيجة نفسها لو كتبت TRIM(text) فقط

-- =============================================================

SELECT text, LENGTH(text) AS ALT, TRIM(LEADING FROM text) AS TextWithoutSpace, LENGTH(TRIM(LEADING FROM text)) AS BLT FROM try;

-- +-------------------+-----+------------------+-----+
-- | text              | ALT | TextWithoutSpace | BLT |
-- +-------------------+-----+------------------+-----+
-- |      Mohammed     |  17 | Mohammed         |  12 |
-- | Albasha           |  11 | Albasha          |  11 |
-- +-------------------+-----+------------------+-----+

-- يزيل المسافات من البداية فقط
-- لاحظ طول الكلمة الثانية بقي كما هو، لأنه لا يوجد مسافات في بدايتها

-- =============================================================

SELECT text, LENGTH(text) AS ALT, TRIM(TRAILING FROM text) AS TextWithoutSpace, LENGTH(TRIM(TRAILING FROM text)) AS BLT FROM try;

-- +-------------------+-----+------------------+-----+
-- | text              | ALT | TextWithoutSpace | BLT |
-- +-------------------+-----+------------------+-----+
-- |      Mohammed     |  17 |      Mohammed    |  13 |
-- | Albasha           |  11 | Albasha          |   7 |
-- +-------------------+-----+------------------+-----+

-- يزيل المسافات من النهاية فقط

-- =============================================================

-- نفس النتائج السابقة باستخدام LTRIM و RTRIM

SELECT text, LENGTH(LTRIM(text)) AS LTRIM_Length, LENGTH(RTRIM(text)) AS RTRIM_Length FROM try;

-- +-------------------+--------------+--------------+
-- | text              | LTRIM_Length | RTRIM_Length |
-- +-------------------+--------------+--------------+
-- |      Mohammed     |           12 |           13 |
-- | Albasha           |           11 |            7 |
-- +-------------------+--------------+--------------+

-- =============================================================

INSERT INTO try(text) VALUES('@@Maha@');

SELECT text, TRIM(LEADING '@' FROM text) AS TrimText FROM try WHERE id = 3;

-- +---------+----------+
-- | text    | TrimText |
-- +---------+----------+
-- | @@Maha@ | Maha@    |
-- +---------+----------+

-- أزال علامة @ من البداية فقط

-- -----------------------------

SELECT text, TRIM('@' FROM text) AS TrimText FROM try WHERE id = 3;

-- +---------+----------+
-- | text    | TrimText |
-- +---------+----------+
-- | @@Maha@ | Maha     |
-- +---------+----------+

-- أزال علامة @ من البداية ومن النهاية
