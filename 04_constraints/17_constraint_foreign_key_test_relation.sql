-- Lesson 17 - Constraint - Foreign Key Test Relation
-- Video: https://www.youtube.com/watch?v=NpH6MNz0UFM

-- FOREIGN KEY:
-- إنشاء المفتاح الأجنبي وعمل علاقة بين الجداول بعد إنشاء الجدول

-- تجهيز: جدول العملاء وجدول الطلبات بدون مفتاح أجنبي
CREATE DATABASE IF NOT EXISTS shop;
USE shop;
DROP TABLE IF EXISTS shopmember, cards, comments, orders, clients;
CREATE TABLE clients(id INT NOT NULL PRIMARY KEY, username VARCHAR(255) UNIQUE, email VARCHAR(255) UNIQUE);
CREATE TABLE orders(order_id INT NOT NULL PRIMARY KEY, price VARCHAR(255), client_id INT NOT NULL);

-- ===============================================================

ALTER TABLE orders
ADD CONSTRAINT ordering
FOREIGN KEY(client_id) REFERENCES clients(id)
ON UPDATE CASCADE
ON DELETE CASCADE;

-- عدلت على الجدول وأعطيت اسما للقيد ordering، وفي العادة اللغة تعطي اسما افتراضيا لو لم أكتبه
-- أنشأت المفتاح الأجنبي وخليته يأشر على الجدول والعمود الي هربطه معه
-- ON UPDATE CASCADE, ON DELETE CASCADE:
-- أي تحديث أو حذف على المفتاح الأساسي في جدول العملاء
-- يتم تطبيقه تلقائيا على المفتاح الأجنبي في جدول الطلبات

SHOW COLUMNS FROM orders;

-- +-----------+--------------+------+-----+---------+-------+
-- | Field     | Type         | Null | Key | Default | Extra |
-- +-----------+--------------+------+-----+---------+-------+
-- | order_id  | int          | NO   | PRI | NULL    |       |
-- | price     | varchar(255) | YES  |     | NULL    |       |
-- | client_id | int          | NO   | MUL | NULL    |       |  <==
-- +-----------+--------------+------+-----+---------+-------+

-- ===============================================================
/* Insert Data in Clients Table */
INSERT INTO clients VALUES(1, 'Mohammed', 'ma@example.com');
INSERT INTO clients VALUES(2, 'Ahmed', 'ad@example.com');
INSERT INTO clients VALUES(3, 'Osama', 'os@example.com');

/* Insert Data in Orders Table */
INSERT INTO orders VALUES(1, '$100', 1);
INSERT INTO orders VALUES(2, '$200', 1);
INSERT INTO orders VALUES(3, '$50', 1);
INSERT INTO orders VALUES(4, '$100', 2);
INSERT INTO orders VALUES(5, '$400', 2);

-- INSERT INTO orders VALUES(6, '$10', 10);
-- ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`shop`.`orders`, CONSTRAINT `ordering` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE)
-- خطأ لأنه لا يوجد عميل بهذا الرقم (10) في جدول العملاء

-- لو أضفت بيانات لجدول الطلبات من برنامج مثل DBeaver
-- هتلاحظ عند إدخال الحقل client_id ظهور قائمة بأرقام العملاء تختار منها

SELECT * FROM orders JOIN clients ON clients.id = orders.client_id;

-- +----------+-------+-----------+----+----------+----------------+
-- | order_id | price | client_id | id | username | email          |
-- +----------+-------+-----------+----+----------+----------------+
-- |        1 | $100  |         1 |  1 | Mohammed | ma@example.com |
-- |        2 | $200  |         1 |  1 | Mohammed | ma@example.com |
-- |        3 | $50   |         1 |  1 | Mohammed | ma@example.com |
-- |        4 | $100  |         2 |  2 | Ahmed    | ad@example.com |
-- |        5 | $400  |         2 |  2 | Ahmed    | ad@example.com |
-- +----------+-------+-----------+----+----------+----------------+

-- يعرض كل طلب مع بيانات العميل صاحبه من جدول العملاء
-- الأمر JOIN سيتم شرحه بشكل مفصل في دروس قادمة

-- ===============================================================

-- لو أنا بدي أغير الرقم id لعميل داخل جدول العملاء
-- وهذا العميل مربوط بطلبات داخل جدول الطلبات
-- هنا يجي دور الكود الي كتبناه أثناء إنشاء المفتاح الأجنبي
-- ON UPDATE CASCADE, ON DELETE CASCADE

-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

UPDATE clients SET id = 20 WHERE id = 1;

SELECT * FROM orders JOIN clients ON clients.id = orders.client_id;

-- +----------+-------+-----------+----+----------+----------------+
-- | order_id | price | client_id | id | username | email          |
-- +----------+-------+-----------+----+----------+----------------+
-- |        4 | $100  |         2 |  2 | Ahmed    | ad@example.com |
-- |        5 | $400  |         2 |  2 | Ahmed    | ad@example.com |
-- |        1 | $100  |        20 | 20 | Mohammed | ma@example.com |  <==
-- |        2 | $200  |        20 | 20 | Mohammed | ma@example.com |  <==
-- |        3 | $50   |        20 | 20 | Mohammed | ma@example.com |  <==
-- +----------+-------+-----------+----+----------+----------------+

-- حدثت بيانات العميل في جدول العملاء وغيرت id من 1 إلى 20
-- لاحظ تغير client_id في جدول الطلبات تلقائيا

-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

DELETE FROM clients WHERE id = 20;

SELECT * FROM orders JOIN clients ON clients.id = orders.client_id;

-- +----------+-------+-----------+----+----------+----------------+
-- | order_id | price | client_id | id | username | email          |
-- +----------+-------+-----------+----+----------+----------------+
-- |        5 | $400  |         2 |  2 | Ahmed    | ad@example.com |
-- |        4 | $100  |         2 |  2 | Ahmed    | ad@example.com |
-- +----------+-------+-----------+----+----------+----------------+

-- حذفت العميل صاحب id = 20 من جدول العملاء
-- لاحظ حذف الطلبات المتعلقة به من جدول الطلبات

-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

-- التحديث والحذف تم بشكل تلقائي، ليش صار هيك؟ لأن في علاقة تربط بين الجدولين
-- وهي المفتاح الأساسي في جدول العملاء والمفتاح الأجنبي في جدول الطلبات
-- مع الكود المهم الذي يسمح بالتحديث والحذف على العلاقة
-- (ON UPDATE CASCADE, ON DELETE CASCADE)
-- بدون هذا الكود، سيرفض حذف أو تعديل العميل ما دام له طلبات (انظر الدرس التالي)
