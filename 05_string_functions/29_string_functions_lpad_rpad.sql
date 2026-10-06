-- Lesson 29 - String Functions - LPad, RPad
-- Video: https://www.youtube.com/watch?v=pGhyn9Ko__g

-- MySQL String Functions Syntax:

-- LPAD(String, Length, PaddedString)
-- RPAD(String, Length, PaddedString)

-- يملأ النص بنص آخر أو مسافة أو أي شيء، حتى يصل للطول الذي أحدده
-- LPAD يضيف من اليسار (البداية)، و RPAD يضيف من اليمين (النهاية)
-- والطول Length هو طول النص الكلي الذي سيرجع في النهاية

-- ===========================================================================

-- تجهيز
CREATE DATABASE IF NOT EXISTS test;
USE test;
DROP TABLE IF EXISTS try;
CREATE TABLE try(id INT UNIQUE AUTO_INCREMENT, text VARCHAR(255));
INSERT INTO try(text) VALUES('Mohammed'), ('Osama'), ('Maha');

SELECT text AS MainText, LPAD(text, 11, '$') AS LpadText FROM try;

-- +----------+-------------+
-- | MainText | LpadText    |
-- +----------+-------------+
-- | Mohammed | $$$Mohammed |
-- | Osama    | $$$$$$Osama |
-- | Maha     | $$$$$$$Maha |
-- +----------+-------------+

-- ---------------------------

SELECT text AS MainText, RPAD(text, 11, '$') AS RpadText FROM try;

-- +----------+-------------+
-- | MainText | RpadText    |
-- +----------+-------------+
-- | Mohammed | Mohammed$$$ |
-- | Osama    | Osama$$$$$$ |
-- | Maha     | Maha$$$$$$$ |
-- +----------+-------------+

-- ---------------------------

SELECT text AS MainText, LPAD(text, 3, '$') AS LpadText FROM try;

-- +----------+----------+
-- | MainText | LpadText |
-- +----------+----------+
-- | Mohammed | Moh      |
-- | Osama    | Osa      |
-- | Maha     | Mah      |
-- +----------+----------+

-- لو كان الطول أقل من طول النص، يقص النص للطول المطلوب

-- ---------------------------

SELECT text AS MainText, RPAD(text, 6, '$') AS RpadText FROM try;

-- +----------+----------+
-- | MainText | RpadText |
-- +----------+----------+
-- | Mohammed | Mohamm   |
-- | Osama    | Osama$   |
-- | Maha     | Maha$$   |
-- +----------+----------+

-- مثال عملي: ترقيم بطول ثابت مثل 0007
SELECT LPAD(7, 4, '0') AS invoice_number;

-- +----------------+
-- | invoice_number |
-- +----------------+
-- | 0007           |
-- +----------------+
