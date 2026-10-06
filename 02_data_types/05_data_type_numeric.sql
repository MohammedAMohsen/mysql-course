-- Lesson 05 - Data Type - Numeric
-- Video: https://www.youtube.com/watch?v=eOxMy_iDitI

-- Numeric Data Types
-- ==================================================
-- Tiny     TINYINT   => -128 To 127
-- Small    SMALLINT  => -32,768 To 32,767
-- Medium   MEDIUMINT => -8,388,608 To 8,388,607
-- Integer  INT       => -2,147,483,648 To 2,147,483,647
-- Big      BIGINT    => -9,223,372,036,854,775,808 To 9,223,372,036,854,775,807
-- ==================================================

-- الفكرة في الاختيار بينهم هي التكلفة
-- كل نوع يحجز مساحة ثابتة لكل قيمة، مهما كانت القيمة صغيرة
-- TINYINT  => 1 Byte
-- SMALLINT => 2 Bytes
-- INT      => 4 Bytes
-- BIGINT   => 8 Bytes
-- يعني عمود فيه مليون قيمة من نوع BIGINT يحجز حوالي 8 ميجا، ومن نوع TINYINT حوالي 1 ميجا فقط
-- لذلك اختار أصغر نوع يكفي للقيم التي ستخزنها

-- ==================================================

-- DECIMAL -> يستخدم للمعاملات الحسابية الدقيقة مثل الأسعار، لأنه يحفظ الرقم كما هو بدون تقريب
-- FLOAT   -> أكثر مرونة، لكنه يحفظ الرقم بشكل تقريبي وأحيانا يقربه
-- DOUBLE  -> مثل FLOAT لكن أكبر وأدق
-- REAL    -> اسم آخر للنوع DOUBLE
-- BOOLEAN -> يتعامل معه على أنه TINYINT(1)، وقيمته 1 للصح و 0 للخطأ

-- ==================================================
-- Example Boolean:
-- ==================================================

CREATE DATABASE IF NOT EXISTS test;
USE test;
DROP TABLE IF EXISTS skills;

CREATE TABLE skills(id BOOLEAN);

SHOW COLUMNS FROM skills;

-- +-------+------------+------+-----+---------+-------+
-- | Field | Type       | Null | Key | Default | Extra |
-- +-------+------------+------+-----+---------+-------+
-- | id    | tinyint(1) | YES  |     | NULL    |       |
-- +-------+------------+------+-----+---------+-------+

-- لاحظ النوع أصبح tinyint(1)

INSERT INTO skills(id) VALUES(TRUE);
INSERT INTO skills(id) VALUES(TRUE);
INSERT INTO skills(id) VALUES(FALSE);
INSERT INTO skills(id) VALUES(TRUE);
INSERT INTO skills(id) VALUES(FALSE);

SELECT * FROM skills;

-- +----+
-- | id |
-- +----+
-- |  1 |
-- |  1 |
-- |  0 |
-- |  1 |
-- |  0 |
-- +----+

-- لاحظ الصح أصبح 1، والخطأ أصبح 0
