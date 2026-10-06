-- Lesson 16 - Constraint - Foreign Key Intro
-- Video: https://www.youtube.com/watch?v=7nq3k6iPnY0

-- FOREIGN KEY:

-- عبارة عن عمود يشير إلى المفتاح الأساسي في جدول آخر
-- أي أن العمود موجود في الأصل في جدول آخر ويكون مفتاحا أساسيا
-- وهذا العمود مكرر في جدولي الحالي ويكون مفتاحا أجنبيا

-- بالمختصر:
-- عبارة عن عمود أو مجموعة أعمدة تشير إلى عمود في جدول ثان ويكون مفتاحا أساسيا

-- تجهيز: قاعدة بيانات جديدة للمتجر
DROP DATABASE IF EXISTS shop;
CREATE DATABASE shop;
USE shop;

-- ===============================================================
/* Create Table clients With 3 Fields */

CREATE TABLE clients(
    id INT NOT NULL,
    username VARCHAR(255) UNIQUE,
    email VARCHAR(255) UNIQUE,
    PRIMARY KEY(id)
) ENGINE = InnoDB;

SHOW COLUMNS FROM clients;

-- +----------+--------------+------+-----+---------+-------+
-- | Field    | Type         | Null | Key | Default | Extra |
-- +----------+--------------+------+-----+---------+-------+
-- | id       | int          | NO   | PRI | NULL    |       |
-- | username | varchar(255) | YES  | UNI | NULL    |       |
-- | email    | varchar(255) | YES  | UNI | NULL    |       |
-- +----------+--------------+------+-----+---------+-------+

-- ===============================================================
/* Create Table orders With 3 Fields */

CREATE TABLE orders(
    order_id INT NOT NULL,
    price VARCHAR(255),
    client_id INT NOT NULL,
    PRIMARY KEY(order_id),
    FOREIGN KEY(client_id) REFERENCES clients(id)
) ENGINE = InnoDB;

SHOW COLUMNS FROM orders;

-- +-----------+--------------+------+-----+---------+-------+
-- | Field     | Type         | Null | Key | Default | Extra |
-- +-----------+--------------+------+-----+---------+-------+
-- | order_id  | int          | NO   | PRI | NULL    |       |
-- | price     | varchar(255) | YES  |     | NULL    |       |
-- | client_id | int          | NO   | MUL | NULL    |       |
-- +-----------+--------------+------+-----+---------+-------+

-- ===============================================================

-- FOREIGN KEY(client_id) REFERENCES clients(id)

-- FOREIGN KEY(client_id): بعرف المفتاح الأجنبي
-- REFERENCES clients(id): بأشر على الجدول الي هياخذ منه المفتاح الأساسي، وبكتب اسم المفتاح الأساسي

-- +--------------------------------------+
-- | orders.client_id -> clients.id       |
-- +--------------------------------------+

-- ملاحظة: المفاتيح الأجنبية تعمل فقط مع المحرك InnoDB، لذلك كتبناه صراحة
