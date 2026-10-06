-- Lesson 18 - Constraint - Foreign Key Update, Delete
-- Video: https://www.youtube.com/watch?v=pFAVhHvjMk8

/*
============
FOREIGN KEY:
============
-- CASCADE
-- SET NULL
-- RESTRICT
-- NO ACTION
============
*/

-- نتعامل مع جدول العملاء على أنه الأب (Parent)
-- وجدول الطلبات على أنه الابن (Child)

-- +----+----------+----------------+     +----------+-------+-----------+
-- | id | username | email          |     | order_id | price | client_id |
-- +----+----------+----------------+     +----------+-------+-----------+
-- |  1 | Ahmed    | ad@example.com |     |        1 | $100  |         1 |
-- |  2 | Osama    | os@example.com |     |        2 | $1430 |         1 |
-- |    |          |                |     |        3 | $1430 |         2 |
-- +----+----------+----------------+     +----------+-------+-----------+

-- الأب Ahmed عنده طفلان: الطلبان 1 و 2
-- الأب Osama عنده طفل واحد: الطلب 3

-- =====================================================================
-- CASCADE: أي حذف أو تحديث للصف في جدول الآباء، اعمل نفسه في جدول الأبناء
-- =====================================================================

-- تجهيز: الجدولان بالبيانات السابقة، والعلاقة من نوع CASCADE
CREATE DATABASE IF NOT EXISTS shop;
USE shop;
DROP TABLE IF EXISTS shopmember, cards, comments, orders, clients;
CREATE TABLE clients(id INT NOT NULL PRIMARY KEY, username VARCHAR(255) UNIQUE, email VARCHAR(255) UNIQUE);
CREATE TABLE orders(order_id INT NOT NULL PRIMARY KEY, price VARCHAR(255), client_id INT NULL);
INSERT INTO clients VALUES(1, 'Ahmed', 'ad@example.com'), (2, 'Osama', 'os@example.com');
INSERT INTO orders VALUES(1, '$100', 1), (2, '$1430', 1), (3, '$1430', 2);

ALTER TABLE orders
ADD CONSTRAINT ordering
FOREIGN KEY(client_id) REFERENCES clients(id)
ON UPDATE CASCADE
ON DELETE CASCADE;

UPDATE clients SET id = 10 WHERE id = 1;

SELECT * FROM clients;

-- +----+----------+----------------+
-- | id | username | email          |
-- +----+----------+----------------+
-- |  2 | Osama    | os@example.com |
-- | 10 | Ahmed    | ad@example.com |
-- +----+----------+----------------+

SELECT * FROM orders;

-- +----------+-------+-----------+
-- | order_id | price | client_id |
-- +----------+-------+-----------+
-- |        1 | $100  |        10 |  <==
-- |        2 | $1430 |        10 |  <==
-- |        3 | $1430 |         2 |
-- +----------+-------+-----------+

-- عدلت id من 1 إلى 10 في جدول العملاء، ونفس الأمر تعدل client_id في جدول الطلبات
-- وكذلك أمر الحذف، لو حذفت العميل هيحذف جميع الطلبات المتعلقة به

-- =====================================================================
-- SET NULL: أي حذف أو تحديث للصف في جدول الآباء، ضع NULL مكانه في جدول الأبناء
-- =====================================================================

-- لتغيير نوع العلاقة لازم أحذف المفتاح الأجنبي باسم القيد الذي كتبته، ثم أنشئه من جديد
-- اسم القيد يكتب بدون علامات تنصيص
ALTER TABLE orders DROP FOREIGN KEY ordering;

ALTER TABLE orders
ADD CONSTRAINT ordering
FOREIGN KEY(client_id) REFERENCES clients(id)
ON UPDATE SET NULL
ON DELETE SET NULL;

UPDATE clients SET id = 4 WHERE id = 10;

SELECT * FROM orders;

-- +----------+-------+-----------+
-- | order_id | price | client_id |
-- +----------+-------+-----------+
-- |        1 | $100  |      NULL |  <==
-- |        2 | $1430 |      NULL |  <==
-- |        3 | $1430 |         2 |
-- +----------+-------+-----------+

-- لما غيرت id من 10 إلى 4 في جدول العملاء، وضع NULL في الحقول المرتبطة به في جدول الطلبات
-- انتبه: SET NULL يعمل فقط لو كان العمود client_id يقبل NULL
-- لذلك أنشأته في التجهيز بدون NOT NULL، ولو كان NOT NULL سيرفض إنشاء القيد

-- =====================================================================
-- RESTRICT: امنع أي حذف أو تحديث للصف في جدول الآباء إذا كان له أبناء في جدول الأبناء
-- =====================================================================

ALTER TABLE orders DROP FOREIGN KEY ordering;

ALTER TABLE orders
ADD CONSTRAINT ordering
FOREIGN KEY(client_id) REFERENCES clients(id)
ON UPDATE RESTRICT
ON DELETE RESTRICT;

-- DELETE FROM clients WHERE id = 2;
-- ERROR 1451 (23000): Cannot delete or update a parent row: a foreign key constraint fails (`shop`.`orders`, CONSTRAINT `ordering` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT)

-- رفض حذف العميل Osama لأن له طلبا مرتبطا به

DELETE FROM clients WHERE id = 4;

SELECT * FROM clients;

-- +----+----------+----------------+
-- | id | username | email          |
-- +----+----------+----------------+
-- |  2 | Osama    | os@example.com |
-- +----+----------+----------------+

-- أما العميل رقم 4 فانحذف بدون مشاكل، لأنه لم يعد له طلبات (طلباته أصبحت NULL في المثال السابق)

-- =====================================================================
-- NO ACTION
-- =====================================================================

-- RESTRICT و NO ACTION في MySQL مع المحرك InnoDB يعملان بنفس الطريقة: يمنعان الحذف والتعديل
-- لو لم أكتب نوع العلاقة أصلا، القيمة الافتراضية هي NO ACTION، وهي عمليا مثل RESTRICT
