-- Lesson 20 - Constraint - Foreign Key One To Many
-- Video: https://www.youtube.com/watch?v=cDPIFF7f-pw

-- Types Of Relationships Between Tables:
-- ----------------------
-- One  To One
-- One  To Many   <== مثل علاقة العميل بالطلبات (كل عميل له أكثر من طلب)
-- Many To One    <== نفس العلاقة السابقة لكن بالعكس (أكثر من تعليق مرتبط بمستخدم واحد)
-- Many To Many

-- تجهيز: العملاء والطلبات والتعليقات
CREATE DATABASE IF NOT EXISTS shop;
USE shop;
DROP TABLE IF EXISTS shopmember, cards, comments, orders, clients;
CREATE TABLE clients(id INT NOT NULL PRIMARY KEY, username VARCHAR(255) UNIQUE, email VARCHAR(255) UNIQUE);
CREATE TABLE orders(
    order_id INT NOT NULL PRIMARY KEY, price VARCHAR(255), client_id INT NOT NULL,
    FOREIGN KEY(client_id) REFERENCES clients(id) ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE TABLE comments(
    c_id INT NOT NULL PRIMARY KEY, comment VARCHAR(255), client_id INT,
    FOREIGN KEY(client_id) REFERENCES clients(id) ON UPDATE CASCADE ON DELETE CASCADE
);
INSERT INTO clients VALUES(1, 'Ahmed', 'ad@example.com');
INSERT INTO orders VALUES(10, '$100', 1), (20, '$1430', 1), (30, '$230', 1);
INSERT INTO comments VALUES(1, 'Thank You', 1), (2, 'Good :)', 1), (3, 'I Love You ^_^', 1);

-- =====================================================================

-- +-----------+--------------+------+-----+     +----------+--------------+------+-----+     +-----------+--------------+------+-----+
-- | Field     | Type         | Null | Key |     | Field    | Type         | Null | Key |     | Field     | Type         | Null | Key |
-- +-----------+--------------+------+-----+     +----------+--------------+------+-----+     +-----------+--------------+------+-----+
-- | c_id      | int          | NO   | PRI |  +->| id       | int          | NO   | PRI |<-+  | order_id  | int          | NO   | PRI |
-- | comment   | varchar(255) | YES  |     |  |  | username | varchar(255) | YES  | UNI |  |  | price     | varchar(255) | YES  |     |
-- | client_id | int          | YES  | MUL |<-+  | email    | varchar(255) | YES  | UNI |  +->| client_id | int          | NO   | MUL |
-- +-----------+--------------+------+-----+     +----------+--------------+------+-----+     +-----------+--------------+------+-----+

-- =====================================================================

-- Example 1

SELECT * FROM orders JOIN clients ON clients.id = orders.client_id;

-- +----------+-------+-----------+----+----------+----------------+
-- | order_id | price | client_id | id | username | email          |
-- +----------+-------+-----------+----+----------+----------------+
-- |       10 | $100  |         1 |  1 | Ahmed    | ad@example.com |
-- |       20 | $1430 |         1 |  1 | Ahmed    | ad@example.com |
-- |       30 | $230  |         1 |  1 | Ahmed    | ad@example.com |
-- +----------+-------+-----------+----+----------+----------------+

-- لاحظ المستخدم Ahmed له أكثر من طلب

-- =====================================================================

-- Example 2

SELECT * FROM comments JOIN clients ON clients.id = comments.client_id;

-- +------+----------------+-----------+----+----------+----------------+
-- | c_id | comment        | client_id | id | username | email          |
-- +------+----------------+-----------+----+----------+----------------+
-- |    1 | Thank You      |         1 |  1 | Ahmed    | ad@example.com |
-- |    2 | Good :)        |         1 |  1 | Ahmed    | ad@example.com |
-- |    3 | I Love You ^_^ |         1 |  1 | Ahmed    | ad@example.com |
-- +------+----------------+-----------+----+----------+----------------+

-- لاحظ المستخدم Ahmed له أكثر من تعليق

-- =====================================================================

DELETE FROM clients WHERE id = 1;

SELECT * FROM orders JOIN clients ON clients.id = orders.client_id;

-- Empty set

SELECT * FROM comments JOIN clients ON clients.id = comments.client_id;

-- Empty set

-- لاحظ بعد حذف المستخدم Ahmed انحذفت جميع طلباته من جدول الطلبات
-- وجميع التعليقات المرتبطة به في جدول التعليقات
