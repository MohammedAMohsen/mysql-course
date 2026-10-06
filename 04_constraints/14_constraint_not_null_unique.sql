-- Lesson 14 - Constraint - Not Null, Unique
-- Video: https://www.youtube.com/watch?v=VnR4ElaU3c0

-- تجهيز: جدول الطلاب
CREATE DATABASE IF NOT EXISTS Albasha;
USE Albasha;
DROP TABLE IF EXISTS students;
CREATE TABLE students(id INT, name VARCHAR(255), email VARCHAR(255), password CHAR(50), username VARCHAR(255) NOT NULL);

SHOW COLUMNS FROM students;

-- +----------+--------------+------+-----+---------+-------+
-- | Field    | Type         | Null | Key | Default | Extra |
-- +----------+--------------+------+-----+---------+-------+
-- | id       | int          | YES  |     | NULL    |       |
-- | name     | varchar(255) | YES  |     | NULL    |       |
-- | email    | varchar(255) | YES  |     | NULL    |       |
-- | password | char(50)     | YES  |     | NULL    |       |
-- | username | varchar(255) | NO   |     | NULL    |       |
-- +----------+--------------+------+-----+---------+-------+

-- ==============================================================

-- UNIQUE: نوع من أنواع القيود، يعني الحقل فريد من نوعه ولا يقبل التكرار

-- مع العلم أنه لو بدي أعمل القيد UNIQUE لعمود معين وكان بداخله بيانات مكررة
-- سيخرج لي خطأ ولن يتم عمل القيد
-- يجب أن يكون العمود فارغا أو لا يوجد به بيانات مكررة حتى يتم عمل القيد

-- -------------------------------------------------------------------
-- مثال إدخال بيانات مكررة (قبل) عمل قيد على العمود اسم المستخدم
-- -------------------------------------------------------------------

INSERT INTO students VALUES(1, 'Mohammed', 'mo@example.com', '1234', 'mohammed');
INSERT INTO students VALUES(2, 'Ali', 'al@example.com', '1234', 'mohammed');

SELECT * FROM students;

-- +----+----------+----------------+----------+----------+
-- | id | name     | email          | password | username |
-- +----+----------+----------------+----------+----------+
-- |  1 | Mohammed | mo@example.com | 1234     | mohammed |
-- |  2 | Ali      | al@example.com | 1234     | mohammed |
-- +----+----------+----------------+----------+----------+

-- لاحظ قبل اسم المستخدم المكرر بدون مشاكل

-- ALTER TABLE students ADD UNIQUE(username);
-- ERROR 1062 (23000): Duplicate entry 'mohammed' for key 'students.username'

-- لاحظ رفض عمل القيد لأن العمود فيه قيمة مكررة
-- نحذف الصف المكرر أولا، ثم نعمل القيد

DELETE FROM students WHERE id = 2;

-- -------------------------------------------------------------------
-- مثال إدخال بيانات مكررة (بعد) عمل قيد على العمود اسم المستخدم
-- -------------------------------------------------------------------

ALTER TABLE students ADD UNIQUE(username); -- يعني أن اسم المستخدم فريد من نوعه ولا يجب تكراره

SHOW COLUMNS FROM students;

-- +----------+--------------+------+-----+---------+-------+
-- | Field    | Type         | Null | Key | Default | Extra |
-- +----------+--------------+------+-----+---------+-------+
-- | id       | int          | YES  |     | NULL    |       |
-- | name     | varchar(255) | YES  |     | NULL    |       |
-- | email    | varchar(255) | YES  |     | NULL    |       |
-- | password | char(50)     | YES  |     | NULL    |       |
-- | username | varchar(255) | NO   | PRI | NULL    |       |
-- +----------+--------------+------+-----+---------+-------+

-- INSERT INTO students VALUES(2, 'Ali', 'al@example.com', '1234', 'mohammed');
-- ERROR 1062 (23000): Duplicate entry 'mohammed' for key 'students.username'

-- لاحظ بقلي العمود username موجود فيه نفس القيمة مسبقا، أي أنه لا يقبل التكرار

SELECT * FROM students;

-- +----+----------+----------------+----------+----------+
-- | id | name     | email          | password | username |
-- +----+----------+----------------+----------+----------+
-- |  1 | Mohammed | mo@example.com | 1234     | mohammed |
-- +----+----------+----------------+----------+----------+

-- ==============================================================

ALTER TABLE students DROP INDEX username;

-- يقوم بإزالة القيد UNIQUE من العمود username

-- ==============================================================

ALTER TABLE students ADD test VARCHAR(255) NULL UNIQUE;

-- طريقة إضافة القيد UNIQUE أثناء إنشاء العمود
-- كتبت NULL لأن الجدول فيه صف، ولو كان العمود NOT NULL سيأخذ الصف نصا فارغا
-- وأي صف جديد بدون قيمة سيأخذ نفس النص الفارغ، فيصبح مكررا ويرفضه القيد

SHOW COLUMNS FROM students;

-- +----------+--------------+------+-----+---------+-------+
-- | Field    | Type         | Null | Key | Default | Extra |
-- +----------+--------------+------+-----+---------+-------+
-- | id       | int          | YES  |     | NULL    |       |
-- | name     | varchar(255) | YES  |     | NULL    |       |
-- | email    | varchar(255) | YES  |     | NULL    |       |
-- | password | char(50)     | YES  |     | NULL    |       |
-- | username | varchar(255) | NO   |     | NULL    |       |
-- | test     | varchar(255) | YES  | UNI | NULL    |       |  <==
-- +----------+--------------+------+-----+---------+-------+
