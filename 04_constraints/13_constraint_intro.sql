-- Lesson 13 - Constraint - Intro
-- Video: https://www.youtube.com/watch?v=QJx4CLYzeSI

-- =====================
-- ==== Constraint  ====
-- =====================

-- القيود: هي قواعد بتحكمك وأنت بتضيف بيانات داخل قاعدة البيانات
-- قواعد بتمشي عليها عشان ما يحصل خطأ في البيانات
-- ممكن أضيف هذه القيود أثناء إنشاء الجدول أو بعد ما أنشئ الجدول

-- NULL, NOT NULL
-- نوع من أنواع القيود الي بعرفها للعمود
-- NULL: يقبل أن تكون البيانات داخل الحقل فارغة
-- NOT NULL: لا يقبل قيمة فارغة، يعني يجب أن يكون هناك بيانات داخل الحقل

-- تجهيز: جدول الطلاب كما وصلنا له في الدرس السابق
CREATE DATABASE IF NOT EXISTS Albasha;
USE Albasha;
DROP TABLE IF EXISTS students;
CREATE TABLE students(user_id INT, name VARCHAR(255), email VARCHAR(255), password CHAR(50), username VARCHAR(255), grade INT);

-- ================================================================

SHOW COLUMNS FROM students;

-- +----------+--------------+------+-----+---------+-------+
-- | Field    | Type         | Null | Key | Default | Extra |
-- +----------+--------------+------+-----+---------+-------+
-- | user_id  | int          | YES  |     | NULL    |       |
-- | name     | varchar(255) | YES  |     | NULL    |       |
-- | email    | varchar(255) | YES  |     | NULL    |       |
-- | password | char(50)     | YES  |     | NULL    |       |
-- | username | varchar(255) | YES  |     | NULL    |       |
-- | grade    | int          | YES  |     | NULL    |       |
-- +----------+--------------+------+-----+---------+-------+

-- لاحظ جميع الأعمدة معرفة على أنها NULL = YES، أي أنها تقبل القيمة الفارغة
-- والمثال التالي يؤكد أنها تقبل القيم الفارغة: أضفت صفا بدون أي بيانات

INSERT INTO students VALUES();

SELECT * FROM students;

-- +---------+------+-------+----------+----------+-------+
-- | user_id | name | email | password | username | grade |
-- +---------+------+-------+----------+----------+-------+
-- |    NULL | NULL | NULL  | NULL     | NULL     |  NULL |
-- +---------+------+-------+----------+----------+-------+

-- لاحظ قبل الأمر بدون أي أخطاء
-- في حال ما أضفت أي بيانات، بيضيف القيمة NULL بشكل افتراضي لجميع الحقول

-- ================================================================

/* Make Username Not Null */
DELETE FROM students; -- نحذف الصف الفارغ أولا، لأن العمود لا يمكن أن يصبح NOT NULL وفيه قيم NULL
ALTER TABLE students MODIFY username VARCHAR(255) NOT NULL;

SHOW COLUMNS FROM students;

-- +----------+--------------+------+-----+---------+-------+
-- | Field    | Type         | Null | Key | Default | Extra |
-- +----------+--------------+------+-----+---------+-------+
-- | user_id  | int          | YES  |     | NULL    |       |
-- | name     | varchar(255) | YES  |     | NULL    |       |
-- | email    | varchar(255) | YES  |     | NULL    |       |
-- | password | char(50)     | YES  |     | NULL    |       |
-- | username | varchar(255) | NO   |     | NULL    |       |  <==
-- | grade    | int          | YES  |     | NULL    |       |
-- +----------+--------------+------+-----+---------+-------+

-- لاحظ تغيرت القيمة في عمود Null للعمود username إلى NO
-- يعني أنه لا يقبل القيمة NULL

-- INSERT INTO students() VALUES();
-- ERROR 1364 (HY000): Field 'username' doesn't have a default value

-- لاحظ الخطأ بقلي العمود username ليس له قيمة افتراضية، ولا يقبل NULL

-- ================================================================

INSERT INTO students(username) VALUES('');

SELECT * FROM students;

-- +---------+------+-------+----------+----------+-------+
-- | user_id | name | email | password | username | grade |
-- +---------+------+-------+----------+----------+-------+
-- |    NULL | NULL | NULL  | NULL     |          |  NULL |
-- +---------+------+-------+----------+----------+-------+

-- ليش قبل هذا الأمر مع أن القيمة فارغة، وأنا عرفته سابقا أنه لا يقبل القيمة الفارغة؟
-- التصحيح: النص الفارغ لا يساوي NULL
-- NULL تعني لا توجد قيمة أصلا، أما '' فهي قيمة موجودة لكنها نص طوله صفر
-- العمود NOT NULL لا يقبل NULL، لكنه يقبل النص الفارغ

-- ================================================================

/* Add age Not Null */
ALTER TABLE students ADD age INT NOT NULL;

SHOW COLUMNS FROM students;

-- +----------+--------------+------+-----+---------+-------+
-- | Field    | Type         | Null | Key | Default | Extra |
-- +----------+--------------+------+-----+---------+-------+
-- | user_id  | int          | YES  |     | NULL    |       |
-- | name     | varchar(255) | YES  |     | NULL    |       |
-- | email    | varchar(255) | YES  |     | NULL    |       |
-- | password | char(50)     | YES  |     | NULL    |       |
-- | username | varchar(255) | NO   |     | NULL    |       |
-- | grade    | int          | YES  |     | NULL    |       |
-- | age      | int          | NO   |     | NULL    |       |  <==
-- +----------+--------------+------+-----+---------+-------+

SELECT * FROM students;

-- +---------+------+-------+----------+----------+-------+-----+
-- | user_id | name | email | password | username | grade | age |
-- +---------+------+-------+----------+----------+-------+-----+
-- |    NULL | NULL | NULL  | NULL     |          |  NULL |   0 |
-- +---------+------+-------+----------+----------+-------+-----+

-- لاحظ الصف الموجود أخذ القيمة 0 في العمود الجديد، لأن العمود لا يقبل NULL

-- ================================================================

-- إعطاء قيمة افتراضية للعمود في حال ما أدخلت أي بيانات

ALTER TABLE students MODIFY username VARCHAR(255) NOT NULL DEFAULT 'NoName';

INSERT INTO students(age) VALUES(20);

SELECT * FROM students;

-- +---------+------+-------+----------+----------+-------+-----+
-- | user_id | name | email | password | username | grade | age |
-- +---------+------+-------+----------+----------+-------+-----+
-- |    NULL | NULL | NULL  | NULL     |          |  NULL |   0 |
-- |    NULL | NULL | NULL  | NULL     | NoName   |  NULL |  20 |
-- +---------+------+-------+----------+----------+-------+-----+

-- لاحظ الصف الجديد أخذ القيمة NoName لأني لم أكتب اسم مستخدم
