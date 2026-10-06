-- Lesson 12 - Tables - Advanced
-- Video: https://www.youtube.com/watch?v=QM8YKY6-LpQ

-- تجهيز: الجداول من الدروس السابقة
CREATE DATABASE IF NOT EXISTS Albasha;
USE Albasha;
DROP TABLE IF EXISTS students, new1, new2, doctor, classes;
CREATE TABLE students(id SMALLINT, name VARCHAR(255), email VARCHAR(255), password CHAR(50), username VARCHAR(255));
CREATE TABLE new1(id INT) ENGINE = MYISAM;
CREATE TABLE new2(id INT);

SHOW TABLES;

-- +-------------------+
-- | Tables_in_Albasha |
-- +-------------------+
-- | new1              |
-- | new2              |
-- | students          |
-- +-------------------+

-- ========================================================================

ALTER TABLE new1 RENAME doctor; -- هذه طريقة لتغيير اسم الجدول داخل قاعدة البيانات

RENAME TABLE new2 TO classes; -- طريقة أخرى لتغيير اسم الجدول

SHOW TABLES;

-- +-------------------+
-- | Tables_in_Albasha |
-- +-------------------+
-- | classes           |
-- | doctor            |
-- | students          |
-- +-------------------+

-- ========================================================================

-- إضافة عمود جديد للدرجات
ALTER TABLE students ADD grade INT;

SHOW COLUMNS FROM students;

-- +----------+--------------+------+-----+---------+-------+
-- | Field    | Type         | Null | Key | Default | Extra |
-- +----------+--------------+------+-----+---------+-------+
-- | id       | smallint     | YES  |     | NULL    |       |
-- | name     | varchar(255) | YES  |     | NULL    |       |
-- | email    | varchar(255) | YES  |     | NULL    |       |
-- | password | char(50)     | YES  |     | NULL    |       |
-- | username | varchar(255) | YES  |     | NULL    |       |
-- | grade    | int          | YES  |     | NULL    |       |
-- +----------+--------------+------+-----+---------+-------+

-- ========================================================================

ALTER TABLE students MODIFY username CHAR(50), CHANGE id user_id INT;

SHOW COLUMNS FROM students;

-- +----------+--------------+------+-----+---------+-------+
-- | Field    | Type         | Null | Key | Default | Extra |
-- +----------+--------------+------+-----+---------+-------+
-- | user_id  | int          | YES  |     | NULL    |       |  <==
-- | name     | varchar(255) | YES  |     | NULL    |       |
-- | email    | varchar(255) | YES  |     | NULL    |       |
-- | password | char(50)     | YES  |     | NULL    |       |
-- | username | char(50)     | YES  |     | NULL    |       |  <==
-- | grade    | int          | YES  |     | NULL    |       |
-- +----------+--------------+------+-----+---------+-------+

-- لاحظ استخدمت أمرين في نفس ALTER
-- MODIFY: عدلت نوع بيانات العمود username
-- CHANGE: غيرت اسم العمود id إلى user_id، ونوع البيانات من smallint إلى int

-- ========================================================================

ALTER TABLE students CONVERT TO CHARACTER SET utf8mb4;

-- بهذه الطريقة أقدر أغير نوع الترميز للجدول
-- استخدم utf8mb4 وليس utf8، لأن utf8 في MySQL قديم ولا يدعم كل الرموز مثل الإيموجي
