-- Lesson 15 - Constraint - Primary Key
-- Video: https://www.youtube.com/watch?v=Q37DX3-tuVg

-- Primary Key:

-- عبارة عن حقل فريد من نوعه يميز كل صف في الجدول
-- يكون UNIQUE و NOT NULL في نفس الوقت
-- يختلف عن UNIQUE في أنه لا يقبل NULL
-- الجدول يمكن أن يحتوي على أكثر من قيد UNIQUE
-- أما المفتاح الأساسي فيكون واحدا فقط في الجدول
-- لكن هذا المفتاح الواحد ممكن يتكون من أكثر من عمود، ويسمى مفتاحا مركبا (سنراه في الدرس 21)

-- تجهيز: جدول الطلاب من الدرس السابق، وفيه طالب واحد
CREATE DATABASE IF NOT EXISTS Albasha;
USE Albasha;
DROP TABLE IF EXISTS students, classes, teachers;
CREATE TABLE students(id INT, name VARCHAR(255), email VARCHAR(255), password CHAR(50), username VARCHAR(255) NOT NULL UNIQUE);
INSERT INTO students VALUES(1, 'Mohammed', 'mo@example.com', '1234', 'mohammed');

-- ===============================================================
/* Create Table classes With Two Fields: الطريقة الأولى لتعيين مفتاح أساسي */

CREATE TABLE classes(
    cid INT NOT NULL PRIMARY KEY,
    name VARCHAR(255) UNIQUE
);

SHOW COLUMNS FROM classes;

-- +-------+--------------+------+-----+---------+-------+
-- | Field | Type         | Null | Key | Default | Extra |
-- +-------+--------------+------+-----+---------+-------+
-- | cid   | int          | NO   | PRI | NULL    |       |
-- | name  | varchar(255) | YES  | UNI | NULL    |       |
-- +-------+--------------+------+-----+---------+-------+

-- ===============================================================
/* Create Table teachers With 2 Fields: الطريقة الثانية بعد الانتهاء من تعريف الأعمدة */

CREATE TABLE teachers(
    tid INT NOT NULL,
    name VARCHAR(255),
    PRIMARY KEY(tid)
);

SHOW COLUMNS FROM teachers;

-- +-------+--------------+------+-----+---------+-------+
-- | Field | Type         | Null | Key | Default | Extra |
-- +-------+--------------+------+-----+---------+-------+
-- | tid   | int          | NO   | PRI | NULL    |       |
-- | name  | varchar(255) | YES  |     | NULL    |       |
-- +-------+--------------+------+-----+---------+-------+

-- ===============================================================
/* Make students id field Primary Key: الطريقة الثالثة من خلال التعديل على الجدول بعد إنشائه */

ALTER TABLE students ADD PRIMARY KEY(id);

SHOW COLUMNS FROM students;

-- +----------+--------------+------+-----+---------+-------+
-- | Field    | Type         | Null | Key | Default | Extra |
-- +----------+--------------+------+-----+---------+-------+
-- | id       | int          | NO   | PRI | NULL    |       |  <==
-- | name     | varchar(255) | YES  |     | NULL    |       |
-- | email    | varchar(255) | YES  |     | NULL    |       |
-- | password | char(50)     | YES  |     | NULL    |       |
-- | username | varchar(255) | NO   | UNI | NULL    |       |
-- +----------+--------------+------+-----+---------+-------+

-- لاحظ أصبح العمود id لا يقبل NULL تلقائيا

-- ماذا لو حاولت أعمل مفتاحا أساسيا ثانيا لعمود آخر في نفس الجدول؟

-- ALTER TABLE students ADD PRIMARY KEY(name);
-- ERROR 1068 (42000): Multiple primary key defined

-- خطأ: لا يمكن أن يكون في الجدول أكثر من مفتاح أساسي واحد
-- لتغييره يجب حذف المفتاح الأول ثم إضافة الجديد

-- ===============================================================
/* Get Table Indexes */

SHOW INDEXES FROM students;

-- +----------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
-- | Table    | Non_unique | Key_name | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
-- +----------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
-- | students |          0 | PRIMARY  |            1 | id          | A         |           1 |     NULL | NULL   |      | BTREE      |         |               | YES     | NULL       |
-- | students |          0 | username |            1 | username    | A         |           1 |     NULL | NULL   |      | BTREE      |         |               | YES     | NULL       |
-- +----------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+

-- يظهر المفاتيح وبعض القيود مثل PRIMARY KEY و UNIQUE

-- ===============================================================
/* Drop Primary Key From students Table: إزالة المفتاح الأساسي من الجدول */

ALTER TABLE students DROP PRIMARY KEY;

SHOW COLUMNS FROM students;

-- +----------+--------------+------+-----+---------+-------+
-- | Field    | Type         | Null | Key | Default | Extra |
-- +----------+--------------+------+-----+---------+-------+
-- | id       | int          | NO   |     | NULL    |       |
-- | name     | varchar(255) | YES  |     | NULL    |       |
-- | email    | varchar(255) | YES  |     | NULL    |       |
-- | password | char(50)     | YES  |     | NULL    |       |
-- | username | varchar(255) | NO   | PRI | NULL    |       |
-- +----------+--------------+------+-----+---------+-------+

-- لاحظ اختفى PRI من العمود id، لكنه بقي NOT NULL
