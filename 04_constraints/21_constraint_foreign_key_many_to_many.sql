-- Lesson 21 - Constraint - Foreign Key Many To Many
-- Video: https://www.youtube.com/watch?v=sczhWxKeD2s

-- Types Of Relationships Between Tables:
-- ----------------------
-- One  To One
-- One  To Many
-- Many To One
-- Many To Many   <== مثل علاقة العميل بالمتجر (العميل يشتري من أكثر من متجر، والمتجر يشتري منه أكثر من عميل)

-- تجهيز: العملاء والمتاجر
CREATE DATABASE IF NOT EXISTS shop;
USE shop;
DROP TABLE IF EXISTS shopmember, shops, cards, comments, orders, clients;
CREATE TABLE clients(id INT NOT NULL PRIMARY KEY, username VARCHAR(255) UNIQUE, email VARCHAR(255) UNIQUE);
CREATE TABLE shops(shop_id INT NOT NULL PRIMARY KEY, name VARCHAR(255));
INSERT INTO clients VALUES(101, 'Ahmed', 'ah@example.com'), (102, 'Osama', 'os@example.com'), (103, 'Maha', 'ma@example.org');
INSERT INTO shops VALUES(1, 'AL-Rantisi Cosmetics'), (2, 'O2 Restaurant'), (3, 'ALbasha Market');

-- =====================================================================

-- في العلاقة متعدد لمتعدد، لازم يكون في جدول وسيط يربط بين الجدولين

CREATE TABLE shopmember(
   client INT NOT NULL,
   shop INT NOT NULL,

   PRIMARY KEY(client, shop), -- المفتاح الأساسي عبارة عن عمودين

   CONSTRAINT cons_clients
      FOREIGN KEY(client) REFERENCES clients(id)
      ON UPDATE CASCADE ON DELETE CASCADE,

   CONSTRAINT cons_shop
      FOREIGN KEY(shop) REFERENCES shops(shop_id)
      ON UPDATE CASCADE ON DELETE CASCADE
);

-- هذا الجدول يربط بين العميل والمتجر من خلال مفتاحين أجنبيين
-- المفتاح الأجنبي الأول مرتبط بجدول العملاء
-- والمفتاح الأجنبي الثاني مرتبط بجدول المتاجر

-- المفتاح الأساسي لهذا الجدول هو العمودان معا (client, shop)، ويسمى مفتاحا مركبا
-- معناه أن نفس العميل لا يمكن أن يشترك في نفس المتجر مرتين

-- +----------+--------------+------+-----+     +--------+------+------+-----+     +---------+--------------+------+-----+
-- | Field    | Type         | Null | Key |     | Field  | Type | Null | Key |     | Field   | Type         | Null | Key |
-- +----------+--------------+------+-----+     +--------+------+------+-----+     +---------+--------------+------+-----+
-- | id       | int          | NO   | PRI |<--->| client | int  | NO   | PRI |     |         |              |      |     |
-- | username | varchar(255) | YES  | UNI |     | shop   | int  | NO   | PRI |<--->| shop_id | int          | NO   | PRI |
-- | email    | varchar(255) | YES  | UNI |     |        |      |      |     |     | name    | varchar(255) | YES  |     |
-- +----------+--------------+------+-----+     +--------+------+------+-----+     +---------+--------------+------+-----+

-- =====================================================================

INSERT INTO shopmember VALUES(101, 1);
INSERT INTO shopmember VALUES(101, 2);
INSERT INTO shopmember VALUES(101, 3);

-- المستخدم الأول مشترك في الثلاث متاجر

INSERT INTO shopmember VALUES(102, 1);
INSERT INTO shopmember VALUES(102, 2);

-- المستخدم الثاني مشترك في متجرين

INSERT INTO shopmember VALUES(103, 2);

-- المستخدم الثالث مشترك في متجر واحد

-- INSERT INTO shopmember VALUES(103, 2);
-- ERROR 1062 (23000): Duplicate entry '103-2' for key 'shopmember.PRIMARY'

-- لاحظ رفض تكرار نفس الاشتراك بسبب المفتاح المركب

-- =====================================================================

SELECT * FROM clients JOIN shopmember ON clients.id = shopmember.client;

-- +-----+----------+----------------+--------+------+
-- | id  | username | email          | client | shop |
-- +-----+----------+----------------+--------+------+
-- | 101 | Ahmed    | ah@example.com |    101 |    1 |
-- | 101 | Ahmed    | ah@example.com |    101 |    2 |
-- | 101 | Ahmed    | ah@example.com |    101 |    3 |
-- | 102 | Osama    | os@example.com |    102 |    1 |
-- | 102 | Osama    | os@example.com |    102 |    2 |
-- | 103 | Maha     | ma@example.org |    103 |    2 |
-- +-----+----------+----------------+--------+------+

-- هتلاحظ أن العميل يستطيع أن يشترك في أكثر من متجر، والمتجر نفسه يشترك فيه أكثر من عميل

-- =====================================================================

-- مطلوب الآن عمل استعلام (اعرض العملاء المشتركين في هذا المتجر)

SELECT * FROM clients JOIN shopmember ON clients.id = shopmember.client WHERE shopmember.shop = 1;

-- +-----+----------+----------------+--------+------+
-- | id  | username | email          | client | shop |
-- +-----+----------+----------------+--------+------+
-- | 101 | Ahmed    | ah@example.com |    101 |    1 |
-- | 102 | Osama    | os@example.com |    102 |    1 |
-- +-----+----------+----------------+--------+------+

-- اعرض جميع العملاء المشتركين في المتجر الأول
-- هتلاحظ أن المستخدم الأول والمستخدم الثاني مشتركان في نفس المتجر الأول

-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

SELECT * FROM clients JOIN shopmember ON clients.id = shopmember.client WHERE shopmember.shop = 2;

-- +-----+----------+----------------+--------+------+
-- | id  | username | email          | client | shop |
-- +-----+----------+----------------+--------+------+
-- | 101 | Ahmed    | ah@example.com |    101 |    2 |
-- | 102 | Osama    | os@example.com |    102 |    2 |
-- | 103 | Maha     | ma@example.org |    103 |    2 |
-- +-----+----------+----------------+--------+------+

-- اعرض جميع العملاء المشتركين في المتجر الثاني
-- هنا هتلاحظ أن العملاء الثلاثة مشتركون في المتجر الثاني

-- =====================================================================

-- مطلوب الآن عمل استعلام (اعرض المتاجر التي يشترك فيها هذا العميل)

SELECT * FROM shops JOIN shopmember ON shops.shop_id = shopmember.shop WHERE shopmember.client = 101;

-- +---------+----------------------+--------+------+
-- | shop_id | name                 | client | shop |
-- +---------+----------------------+--------+------+
-- |       1 | AL-Rantisi Cosmetics |    101 |    1 |
-- |       2 | O2 Restaurant        |    101 |    2 |
-- |       3 | ALbasha Market       |    101 |    3 |
-- +---------+----------------------+--------+------+

-- اعرض جميع المتاجر التي يشترك فيها العميل الأول id(101)
-- هتلاحظ أن العميل مشترك في ثلاثة متاجر

-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

SELECT * FROM shops JOIN shopmember ON shops.shop_id = shopmember.shop WHERE shopmember.client = 102;

-- +---------+----------------------+--------+------+
-- | shop_id | name                 | client | shop |
-- +---------+----------------------+--------+------+
-- |       1 | AL-Rantisi Cosmetics |    102 |    1 |
-- |       2 | O2 Restaurant        |    102 |    2 |
-- +---------+----------------------+--------+------+

-- اعرض جميع المتاجر التي يشترك فيها العميل الثاني id(102)
-- هتلاحظ أن العميل مشترك في متجرين فقط

-- =============

-- أي تعديل أو حذف على جدول العملاء أو جدول المتاجر يقابله تعديل على الجدول shopmember
-- بسبب ON UPDATE CASCADE ON DELETE CASCADE التي وضعتها للمفتاحين الأجنبيين
