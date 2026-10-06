-- Lesson 19 - Constraint - Foreign Key One To One
-- Video: https://www.youtube.com/watch?v=nTwaI81AG1M

-- Types Of Relationships Between Tables:
-- ----------------------
-- One  To One    <== مثل علاقة كل مواطن ببطاقة هويته (كل مواطن له هوية خاصة به)
-- One  To Many
-- Many To One
-- Many To Many

-- تجهيز: جدول العملاء وجدول البطاقات
CREATE DATABASE IF NOT EXISTS shop;
USE shop;
DROP TABLE IF EXISTS shopmember, cards, comments, orders, clients;
CREATE TABLE clients(id INT NOT NULL PRIMARY KEY, username VARCHAR(255) UNIQUE, email VARCHAR(255) UNIQUE);
INSERT INTO clients VALUES(1, 'Ahmed', 'ad@example.com'), (2, 'Osama', 'os@example.com');

CREATE TABLE cards(
    card_id INT NOT NULL PRIMARY KEY,
    card_num VARCHAR(255) UNIQUE,
    client_id INT NOT NULL UNIQUE,
    FOREIGN KEY(client_id) REFERENCES clients(id) ON UPDATE CASCADE ON DELETE CASCADE
);

-- =====================================================================

-- +-----------+--------------+------+-----+     +----------+--------------+------+-----+
-- | Field     | Type         | Null | Key |     | Field    | Type         | Null | Key |
-- +-----------+--------------+------+-----+     +----------+--------------+------+-----+
-- | card_id   | int          | NO   | PRI |  +->| id       | int          | NO   | PRI |
-- | card_num  | varchar(255) | YES  | UNI |  |  | username | varchar(255) | YES  | UNI |
-- | client_id | int          | NO   | UNI |<-+  | email    | varchar(255) | YES  | UNI |
-- +-----------+--------------+------+-----+     +----------+--------------+------+-----+

-- =====================================================================

INSERT INTO cards VALUES(101, '120300400', 1);
INSERT INTO cards VALUES(102, '111503400', 2);

SELECT * FROM cards JOIN clients ON clients.id = cards.client_id;

-- +---------+-----------+-----------+----+----------+----------------+
-- | card_id | card_num  | client_id | id | username | email          |
-- +---------+-----------+-----------+----+----------+----------------+
-- |     101 | 120300400 |         1 |  1 | Ahmed    | ad@example.com |
-- |     102 | 111503400 |         2 |  2 | Osama    | os@example.com |
-- +---------+-----------+-----------+----+----------+----------------+

-- لاحظ لكل شخص رقم بطاقة خاص فيه
-- ورقم البطاقة خاص بشخص واحد ولا يتكرر لشخص ثان
-- العلاقة الآن واحد لواحد

-- مهم: الذي يضمن أن العلاقة واحد لواحد هو القيد UNIQUE على العمود client_id
-- بدونه أستطيع إضافة بطاقة ثانية لنفس العميل، فتصبح العلاقة واحد لأكثر

-- INSERT INTO cards VALUES(103, '999888777', 1);
-- ERROR 1062 (23000): Duplicate entry '1' for key 'cards.client_id'

-- لاحظ رفض البطاقة الثانية للعميل رقم 1 بسبب القيد UNIQUE
-- لو أردت أكثر من بطاقة للشخص الواحد، تصبح العلاقة واحد لأكثر، وهي الدرس القادم
