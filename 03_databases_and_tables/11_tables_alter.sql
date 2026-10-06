-- Lesson 11 - Tables - Alter
-- Video: https://www.youtube.com/watch?v=lt8kizMJ4dU

-- تجهيز: جدول الطلاب من الدرس السابق
CREATE DATABASE IF NOT EXISTS Albasha;
USE Albasha;
DROP TABLE IF EXISTS students;
CREATE TABLE students(id INT, name VARCHAR(255), email VARCHAR(255));

-- ===========================================================

/* Add New Password Field */
ALTER TABLE students ADD password VARCHAR(255);

SHOW COLUMNS FROM students;

-- +----------+--------------+------+-----+---------+-------+
-- | Field    | Type         | Null | Key | Default | Extra |
-- +----------+--------------+------+-----+---------+-------+
-- | id       | int          | YES  |     | NULL    |       |
-- | name     | varchar(255) | YES  |     | NULL    |       |
-- | email    | varchar(255) | YES  |     | NULL    |       |
-- | password | varchar(255) | YES  |     | NULL    |       |  <==
-- +----------+--------------+------+-----+---------+-------+

-- لاحظ أضاف العمود الجديد (password) في آخر الجدول

-- ===========================================================

/* Add Username Field After name Field */
ALTER TABLE students ADD username VARCHAR(255) AFTER name;

SHOW COLUMNS FROM students;

-- +----------+--------------+------+-----+---------+-------+
-- | Field    | Type         | Null | Key | Default | Extra |
-- +----------+--------------+------+-----+---------+-------+
-- | id       | int          | YES  |     | NULL    |       |
-- | name     | varchar(255) | YES  |     | NULL    |       |
-- | username | varchar(255) | YES  |     | NULL    |       |  <==
-- | email    | varchar(255) | YES  |     | NULL    |       |
-- | password | varchar(255) | YES  |     | NULL    |       |
-- +----------+--------------+------+-----+---------+-------+

-- أضاف العمود الجديد (username) في المكان الذي حددته، بعد العمود (name)

-- ===========================================================

/* Add test Field As First Field */
ALTER TABLE students ADD test VARCHAR(255) FIRST;

SHOW COLUMNS FROM students;

-- +----------+--------------+------+-----+---------+-------+
-- | Field    | Type         | Null | Key | Default | Extra |
-- +----------+--------------+------+-----+---------+-------+
-- | test     | varchar(255) | YES  |     | NULL    |       |  <==
-- | id       | int          | YES  |     | NULL    |       |
-- | name     | varchar(255) | YES  |     | NULL    |       |
-- | username | varchar(255) | YES  |     | NULL    |       |
-- | email    | varchar(255) | YES  |     | NULL    |       |
-- | password | varchar(255) | YES  |     | NULL    |       |
-- +----------+--------------+------+-----+---------+-------+

-- أضاف العمود الجديد (test) أول شيء في الجدول

-- ===========================================================

/* Delete Field test */
ALTER TABLE students DROP test;

SHOW COLUMNS FROM students;

-- +----------+--------------+------+-----+---------+-------+
-- | Field    | Type         | Null | Key | Default | Extra |
-- +----------+--------------+------+-----+---------+-------+
-- | id       | int          | YES  |     | NULL    |       |
-- | name     | varchar(255) | YES  |     | NULL    |       |
-- | username | varchar(255) | YES  |     | NULL    |       |
-- | email    | varchar(255) | YES  |     | NULL    |       |
-- | password | varchar(255) | YES  |     | NULL    |       |
-- +----------+--------------+------+-----+---------+-------+

-- لاحظ حذف العمود (test) الذي كان في البداية

-- ===========================================================

/* Change Field Location */
ALTER TABLE students CHANGE username username VARCHAR(255) AFTER password;

SHOW COLUMNS FROM students;

-- +----------+--------------+------+-----+---------+-------+
-- | Field    | Type         | Null | Key | Default | Extra |
-- +----------+--------------+------+-----+---------+-------+
-- | id       | int          | YES  |     | NULL    |       |
-- | name     | varchar(255) | YES  |     | NULL    |       |
-- | email    | varchar(255) | YES  |     | NULL    |       |
-- | password | varchar(255) | YES  |     | NULL    |       |
-- | username | varchar(255) | YES  |     | NULL    |       |  <==
-- +----------+--------------+------+-----+---------+-------+

-- غيرت مكان العمود (username) ووضعته بعد العمود (password)

-- ===========================================================

/* Change Field Type */
ALTER TABLE students CHANGE password password CHAR(50);

SHOW COLUMNS FROM students;

-- +----------+--------------+------+-----+---------+-------+
-- | Field    | Type         | Null | Key | Default | Extra |
-- +----------+--------------+------+-----+---------+-------+
-- | id       | int          | YES  |     | NULL    |       |
-- | name     | varchar(255) | YES  |     | NULL    |       |
-- | email    | varchar(255) | YES  |     | NULL    |       |
-- | password | char(50)     | YES  |     | NULL    |       |  <==
-- | username | varchar(255) | YES  |     | NULL    |       |
-- +----------+--------------+------+-----+---------+-------+

-- لاحظ غيرت نوع البيانات للعمود (password) إلى char

-- ممكن أغير الاسم مع تغيير النوع أيضا، لأن CHANGE يعيد تعريف العمود كاملا
-- ALTER TABLE students CHANGE password PW CHAR(50); -> هيك غيرت النوع وغيرت الاسم إلى PW أيضا

-- =====================
-- == الطريقة الثانية ==
-- =====================

/* Modify Field Type */
ALTER TABLE students MODIFY id SMALLINT;

SHOW COLUMNS FROM students;

-- +----------+--------------+------+-----+---------+-------+
-- | Field    | Type         | Null | Key | Default | Extra |
-- +----------+--------------+------+-----+---------+-------+
-- | id       | smallint     | YES  |     | NULL    |       |  <==
-- | name     | varchar(255) | YES  |     | NULL    |       |
-- | email    | varchar(255) | YES  |     | NULL    |       |
-- | password | char(50)     | YES  |     | NULL    |       |
-- | username | varchar(255) | YES  |     | NULL    |       |
-- +----------+--------------+------+-----+---------+-------+

-- لاحظ غيرت نوع البيانات للعمود (id) إلى smallint

-- الطريقة الثانية MODIFY لا تحتاج إعادة كتابة اسم العمود مرتين مثل CHANGE
-- MODIFY يغير تعريف العمود فقط، و CHANGE يستطيع تغيير الاسم والتعريف معا
