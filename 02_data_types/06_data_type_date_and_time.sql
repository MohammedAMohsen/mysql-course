-- Lesson 06 - Data Type - Date & Time
-- Video: https://www.youtube.com/watch?v=_-FjFtMPZAc

/*
Date      => YYYY-MM-DD           From 1000-01-01 To 9999-12-31
Datetime  => YYYY-MM-DD HH:MI:SS
Timestamp => YYYY-MM-DD HH:MI:SS  From 1970 To 2038
Time      => HH:MM:SS
Year      => YYYY | YY -> Allowed Values Are 70 (1970) To 69 (2069), Or 1901 To 2155, And 0000
*/

-- تجهيز: جدول بعمود واحد نضيف عليه أعمدة التاريخ واحدا واحدا
CREATE DATABASE IF NOT EXISTS test;
USE test;
DROP TABLE IF EXISTS skills;
CREATE TABLE skills(id INT);

-- ---------------------------------------
-- DATE
-- ---------------------------------------

ALTER TABLE skills ADD `date` DATE;

INSERT INTO skills(date) VALUES(20000520);
INSERT INTO skills(date) VALUES(20260405);
INSERT INTO skills(date) VALUES('1980-08-20');

-- INSERT INTO skills(date) VALUES(202645);
-- ERROR 1292 (22007): Incorrect date value: '202645' for column 'date' at row 1
-- لازم التاريخ يكون كاملا: سنة بأربعة أرقام، وشهر برقمين، ويوم برقمين

-- بدون علامات التنصيص يعتبرها عملية طرح: 1980 - 8 - 20 = 1952، وهو ليس تاريخا
-- INSERT INTO skills(date) VALUES(1980-08-20);
-- ERROR 1292 (22007): Incorrect date value: '1952' for column 'date' at row 1

SELECT date FROM skills;

-- +------------+
-- | date       |
-- +------------+
-- | 2000-05-20 |
-- | 2026-04-05 |
-- | 1980-08-20 |
-- +------------+

-- ---------------------------------------
-- DATETIME
-- ---------------------------------------

DELETE FROM skills; -- نفرغ الجدول قبل المثال التالي
ALTER TABLE skills ADD `datetime` DATETIME;

INSERT INTO skills(datetime) VALUES(20160201083559);
INSERT INTO skills(datetime) VALUES(20251219201019);
INSERT INTO skills(datetime) VALUES('2010-07-01 10:50:40');

SELECT datetime FROM skills;

-- +---------------------+
-- | datetime            |
-- +---------------------+
-- | 2016-02-01 08:35:59 |
-- | 2025-12-19 20:10:19 |
-- | 2010-07-01 10:50:40 |
-- +---------------------+

-- ---------------------------------------
-- TIMESTAMP
-- ---------------------------------------

DELETE FROM skills;
ALTER TABLE skills ADD `timestamp` TIMESTAMP;

INSERT INTO skills(timestamp) VALUES(20161212);

SELECT timestamp FROM skills;

-- +---------------------+
-- | timestamp           |
-- +---------------------+
-- | 2016-12-12 00:00:00 |
-- +---------------------+

-- ميزة الوقت الحالي: لو أعطينا العمود قيمة افتراضية CURRENT_TIMESTAMP
-- يسجل وقت إضافة الصف تلقائيا إذا لم نكتب قيمة

-- نثبت الوقت الحالي على تاريخ تسجيل الدرس، حتى يطابق الناتج المكتوب. احذف هذا السطر لترى وقتك أنت
SET TIMESTAMP = UNIX_TIMESTAMP('2026-04-05 14:12:48');

ALTER TABLE skills ADD created TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

INSERT INTO skills(id) VALUES(1);

SELECT timestamp, created FROM skills;

-- +---------------------+---------------------+
-- | timestamp           | created             |
-- +---------------------+---------------------+
-- | 2016-12-12 00:00:00 | 2026-04-05 14:12:48 |
-- | NULL                | 2026-04-05 14:12:48 |
-- +---------------------+---------------------+

-- لاحظ الصف الأول أخذ وقت إضافة العمود، والصف الثاني أخذ وقت إضافته هو
SET TIMESTAMP = DEFAULT;

-- ---------------------------------------
-- TIME
-- ---------------------------------------

DELETE FROM skills;
ALTER TABLE skills ADD `time` TIME;

INSERT INTO skills(time) VALUES(234011);
INSERT INTO skills(time) VALUES(062055);
INSERT INTO skills(time) VALUES('20:20:20');

SELECT time FROM skills;

-- +----------+
-- | time     |
-- +----------+
-- | 23:40:11 |
-- | 06:20:55 |
-- | 20:20:20 |
-- +----------+

-- ---------------------------------------
-- YEAR
-- ---------------------------------------

DELETE FROM skills;
ALTER TABLE skills ADD `year` YEAR;

INSERT INTO skills(year) VALUES(1960);
INSERT INTO skills(year) VALUES(60);
INSERT INTO skills(year) VALUES(20);
INSERT INTO skills(year) VALUES(2040);
INSERT INTO skills(year) VALUES(76);
INSERT INTO skills(year) VALUES(70);

SELECT year FROM skills;

-- +------+
-- | year |
-- +------+
-- | 1960 |
-- | 2060 |
-- | 2020 |
-- | 2040 |
-- | 1976 |
-- | 1970 |
-- +------+

-- السنة برقمين: من 70 إلى 99 يحسبها 1970 إلى 1999
-- ومن 0 إلى 69 يحسبها 2000 إلى 2069
-- ويفضل أن تستخدم السنة بأربعة أرقام دائما
