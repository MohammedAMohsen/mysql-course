-- Lesson 25 - String Functions - Repeat, Reverse, Replace
-- Video: https://www.youtube.com/watch?v=htxX3l6D39s

-- MySQL String Functions Syntax:

-- REPEAT(String, Number Of Repeats) -- يكرر النص الذي أعطيه إياه بعدد معين
-- REPLACE(String, From, To)         -- يستبدل جزءا من النص بنص آخر أعطيه إياه
-- REVERSE(String)                   -- يعكس النص الذي أعطيه إياه

-- =============================================================

-- تجهيز
CREATE DATABASE IF NOT EXISTS test;
USE test;
DROP TABLE IF EXISTS try;
CREATE TABLE try(id INT UNIQUE AUTO_INCREMENT, text VARCHAR(255));
INSERT INTO try(text) VALUES('Gaza'), ('Hebron'), ('Egypt'), ('syria');

SELECT * FROM try;

-- +----+--------+
-- | id | text   |
-- +----+--------+
-- |  1 | Gaza   |
-- |  2 | Hebron |
-- |  3 | Egypt  |
-- |  4 | syria  |
-- +----+--------+

-- -----------------------------

SELECT text, REPEAT(text, 3) AS Repeated FROM try;

-- +--------+--------------------+
-- | text   | Repeated           |
-- +--------+--------------------+
-- | Gaza   | GazaGazaGaza       |
-- | Hebron | HebronHebronHebron |
-- | Egypt  | EgyptEgyptEgypt    |
-- | syria  | syriasyriasyria    |
-- +--------+--------------------+

-- =============================================================

SELECT text, REPLACE(text, 'Gaza', 'USA') AS Replaced FROM try;

-- +--------+----------+
-- | text   | Replaced |
-- +--------+----------+
-- | Gaza   | USA      |  <==
-- | Hebron | Hebron   |
-- | Egypt  | Egypt    |
-- | syria  | syria    |
-- +--------+----------+

-- -------------------------------

SELECT text, REPLACE(text, 'y', '&') AS Replaced FROM try;

-- +--------+----------+
-- | text   | Replaced |
-- +--------+----------+
-- | Gaza   | Gaza     |
-- | Hebron | Hebron   |
-- | Egypt  | Eg&pt    |  <==
-- | syria  | s&ria    |  <==
-- +--------+----------+

-- =============================================================

SELECT text, REVERSE(text) AS Reversed FROM try;

-- +--------+----------+
-- | text   | Reversed |
-- +--------+----------+
-- | Gaza   | azaG     |
-- | Hebron | norbeH   |
-- | Egypt  | tpygE    |
-- | syria  | airys    |
-- +--------+----------+

-- =============================================================

-- -----------------------------------------------------
-- استعمال الدالة بشكل فعال في تحديث البيانات
-- -----------------------------------------------------

-- الناتج من الدالة مع SELECT لا يغير البيانات ولا يحدثها، فقط يعرضها
-- لو بدي أغير البيانات نفسها، أستخدم الدالة مع UPDATE
-- مثال: بدي أغير عناوين المواقع من http إلى https

INSERT INTO try(text) VALUES('http://www.example.com'), ('http://www.facebook.com');

SELECT * FROM try WHERE id IN (5, 6);

-- +----+-------------------------+
-- | id | text                    |
-- +----+-------------------------+
-- |  5 | http://www.example.com  |
-- |  6 | http://www.facebook.com |
-- +----+-------------------------+

-- -------------------------------

UPDATE try SET text = REPLACE(text, 'http', 'https');

SELECT * FROM try WHERE id IN (5, 6);

-- +----+--------------------------+
-- | id | text                     |
-- +----+--------------------------+
-- |  5 | https://www.example.com  |
-- |  6 | https://www.facebook.com |
-- +----+--------------------------+

-- -------------------------------

UPDATE try SET text = REPLACE(text, 'https://www.', '');

SELECT * FROM try WHERE id IN (5, 6);

-- +----+--------------+
-- | id | text         |
-- +----+--------------+
-- |  5 | example.com  |
-- |  6 | facebook.com |
-- +----+--------------+

-- انتبه: الأمر UPDATE هنا بدون WHERE، يعني يمر على كل الصفوف
-- الصفوف التي لا تحتوي على النص المطلوب تبقى كما هي، لكن في الحالات الحقيقية حدد الصفوف بـ WHERE
