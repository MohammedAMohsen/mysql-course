-- Lesson 10 - Tables - Rename, Change Type
-- Video: https://www.youtube.com/watch?v=GQxTVYMf424

-- تجهيز: جدول الطلاب من الدرس السابق
CREATE DATABASE IF NOT EXISTS Albasha;
USE Albasha;
DROP TABLE IF EXISTS students, s1, s2, new1, new2;
CREATE TABLE students(id INT, name VARCHAR(255), email VARCHAR(255));

-- ==========================================================

CREATE TABLE s1(id INT);

CREATE TABLE s2(id INT);

SHOW TABLES;

-- +-------------------+
-- | Tables_in_Albasha |
-- +-------------------+
-- | s1                |
-- | s2                |
-- | students          |
-- +-------------------+

-- Change Name Of Tables s1 And s2 To New Names:

RENAME TABLE s1 TO new1, s2 TO new2;

SHOW TABLES;

-- +-------------------+
-- | Tables_in_Albasha |
-- +-------------------+
-- | new1              |
-- | new2              |
-- | students          |
-- +-------------------+

-- لاحظ تغير أسماء الجداول

-- ==========================================================

-- كيف أغير نوع Storage Engine للجدول (الافتراضي هو InnoDB)

SELECT TABLE_NAME, ENGINE FROM information_schema.TABLES WHERE TABLE_SCHEMA = 'Albasha';

-- +------------+--------+
-- | TABLE_NAME | ENGINE |
-- +------------+--------+
-- | new1       | InnoDB |
-- | new2       | InnoDB |
-- | students   | InnoDB |
-- +------------+--------+

ALTER TABLE new1 ENGINE = MYISAM; -- الأمر ALTER سيتم شرحه بشكل مفصل في دروس قادمة

SELECT TABLE_NAME, ENGINE FROM information_schema.TABLES WHERE TABLE_SCHEMA = 'Albasha';

-- +------------+--------+
-- | TABLE_NAME | ENGINE |
-- +------------+--------+
-- | new1       | MyISAM |  <==
-- | new2       | InnoDB |
-- | students   | InnoDB |
-- +------------+--------+

-- لاحظ تغير المحرك للجدول new1 من InnoDB إلى MyISAM
-- استخدمت هذا الاستعلام بدل SHOW TABLE STATUS لأنه يعرض العمودين المهمين فقط
