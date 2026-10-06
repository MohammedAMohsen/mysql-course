-- Lesson 07 - Data Type - String
-- Video: https://www.youtube.com/watch?v=CpBZVbtKgCc

-- ======================
-- === MySQL Datatype ===
-- ======================

-- CHAR => Character:
-- - Store Fixed Length Value (للقيم الثابتة الطول)
-- - Max Characters 255
-- - Faster Than VARCHAR
-- - Use Static Memory (استهلاك الذاكرة ثابت)

-- ==================================================

-- VARCHAR => Variable Character:
-- - Store Variable Length Value (للقيم المتغيرة الطول)
-- - Max Characters (v 5.0.3 And Before => 255 | After v 5.0.3 => 65,535)
-- - Slower Than CHAR
-- - Use Dynamic Memory (استهلاك الذاكرة متغير)

-- ==================================================
-- Example Cost
-- ==================================================

-- CHAR:
-- لو حجزت CHAR(100) وخزنت كلمة من 5 حروف، يحسب عليك 100 حرف كاملة
-- يعني يستهلك ذاكرة أكثر، لأن المساحة محجوزة سواء استعملتها أو لا
-- مثال: 500 سجل في كل سجل 100 حرف، تكون المساحة حوالي 50 كيلوبايت حتى لو الكلمات قصيرة

-- VARCHAR:
-- نفس المثال السابق، يحسب عليك فقط ما استعملته فعلا، مع بايت إضافي لحفظ الطول
-- لو الكلمة 5 حروف، يحسب 5 حروف فقط حتى لو حجزت 100
-- لذلك يستهلك ذاكرة أقل لما تختلف أطوال القيم

-- ==================================================

-- TEXT => Store String:
-- - Deal & Compared Depend On Charset
-- - Store Long Strings
-- - يستخدم في تخزين النصوص الكبيرة مثل التعليقات والمقالات

-- MEDIUMTEXT, LONGTEXT:
-- - نفس فكرة TEXT لكن تتسع لنصوص أكبر

-- ==================================================

-- BLOB => Binary Large Object:
-- - Has No Charset
-- - Deal & Compared Depend On Numeric Value Of The Bytes
-- - Use To Store Images & Files
-- - هذا النوع ليس له ترميز، ويخزن البيانات على شكل بايتات
-- - ويستخدم لتخزين الصور والملفات

-- ==================================================

-- ENUM:
-- - مجموعة قيم أحددها أثناء الإنشاء، وأستطيع اختيار قيمة واحدة فقط منها أثناء الإضافة

-- SET:
-- - نفس فكرة ENUM، والفرق أني أستطيع اختيار أكثر من قيمة في نفس الحقل

-- -------------
-- Example ENUM:
-- -------------

CREATE DATABASE IF NOT EXISTS test;
USE test;
DROP TABLE IF EXISTS skills;

CREATE TABLE skills(string ENUM('Fire Fox', 'Chrome', 'Opera', 'Safari'));

INSERT INTO skills VALUES('Chrome');
INSERT INTO skills VALUES('Fire Fox');
INSERT INTO skills VALUES('Safari');

-- INSERT INTO skills VALUES('Explorer');
-- ERROR 1265 (01000): Data truncated for column 'string' at row 1
-- خطأ لأن القيمة ليست ضمن القائمة

SELECT * FROM skills;

-- +----------+
-- | string   |
-- +----------+
-- | Chrome   |
-- | Fire Fox |
-- | Safari   |
-- +----------+

-- لو أضفت البيانات من برنامج رسومي مثل DBeaver أو Workbench
-- هتلاحظ ظهور القائمة التي عرفتها، وتختار منها مباشرة

-- -------------
-- Example SET:
-- -------------

DROP TABLE IF EXISTS browsers;

CREATE TABLE browsers(list SET('Fire Fox', 'Chrome', 'Opera', 'Safari'));

INSERT INTO browsers VALUES('Chrome,Opera');

SELECT * FROM browsers;

-- +--------------+
-- | list         |
-- +--------------+
-- | Chrome,Opera |
-- +--------------+

-- لاحظ الحقل الواحد أخذ قيمتين
