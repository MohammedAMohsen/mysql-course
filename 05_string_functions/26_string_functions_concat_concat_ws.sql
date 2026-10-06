-- Lesson 26 - String Functions - Concat, Concat_Ws
-- Video: https://www.youtube.com/watch?v=1ohrgf-72y0

-- MySQL String Functions Syntax:

-- CONCAT(String, String, String, ....)              -- يربط النصوص مع بعض
-- CONCAT_WS(Separator, String, String, ....)        -- يربط النصوص ويضع الفاصل بين كل نص والذي بعده

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

-- ___________________________________________________

SELECT text, CONCAT(text, ' Added By Me') AS MyText FROM try;

-- +--------+--------------------+
-- | text   | MyText             |
-- +--------+--------------------+
-- | Gaza   | Gaza Added By Me   |
-- | Hebron | Hebron Added By Me |
-- | Egypt  | Egypt Added By Me  |
-- | syria  | syria Added By Me  |
-- +--------+--------------------+

-- ___________________________________________________

SELECT text, CONCAT('First ', text, ' Last') AS MyText FROM try;

-- +--------+-------------------+
-- | text   | MyText            |
-- +--------+-------------------+
-- | Gaza   | First Gaza Last   |
-- | Hebron | First Hebron Last |
-- | Egypt  | First Egypt Last  |
-- | syria  | First syria Last  |
-- +--------+-------------------+

-- ___________________________________________________

SELECT text, CONCAT('The Country Is ', text, ' And Its ID Is ', id) AS MyTextWithId FROM try;

-- +--------+---------------------------------------+
-- | text   | MyTextWithId                          |
-- +--------+---------------------------------------+
-- | Gaza   | The Country Is Gaza And Its ID Is 1   |
-- | Hebron | The Country Is Hebron And Its ID Is 2 |
-- | Egypt  | The Country Is Egypt And Its ID Is 3  |
-- | syria  | The Country Is syria And Its ID Is 4  |
-- +--------+---------------------------------------+

-- ___________________________________________________

SELECT text, CONCAT_WS(',', text, 'Word') AS MyText FROM try;

-- +--------+-------------+
-- | text   | MyText      |
-- +--------+-------------+
-- | Gaza   | Gaza,Word   |
-- | Hebron | Hebron,Word |
-- | Egypt  | Egypt,Word  |
-- | syria  | syria,Word  |
-- +--------+-------------+

-- ___________________________________________________

SELECT text, CONCAT_WS(' / ', text, 'Word') AS MyText FROM try;

-- +--------+---------------+
-- | text   | MyText        |
-- +--------+---------------+
-- | Gaza   | Gaza / Word   |
-- | Hebron | Hebron / Word |
-- | Egypt  | Egypt / Word  |
-- | syria  | syria / Word  |
-- +--------+---------------+

-- ___________________________________________________

SELECT text, CONCAT_WS(', ', id, text) AS MyText FROM try;

-- +--------+-----------+
-- | text   | MyText    |
-- +--------+-----------+
-- | Gaza   | 1, Gaza   |
-- | Hebron | 2, Hebron |
-- | Egypt  | 3, Egypt  |
-- | syria  | 4, syria  |
-- +--------+-----------+

-- ___________________________________________________

SELECT text, CONCAT_WS(',', id, CONCAT(' ', text)) AS MyText FROM try;

-- +--------+-----------+
-- | text   | MyText    |
-- +--------+-----------+
-- | Gaza   | 1, Gaza   |
-- | Hebron | 2, Hebron |
-- | Egypt  | 3, Egypt  |
-- | syria  | 4, syria  |
-- +--------+-----------+

-- نفس الناتج السابق، لكن الطريقة التي قبلها أبسط من استعمال دالتين مع بعض

-- ___________________________________________________

SELECT text, CONCAT_WS(',', id, REPEAT(text, 2)) AS MyText FROM try;

-- +--------+----------------+
-- | text   | MyText         |
-- +--------+----------------+
-- | Gaza   | 1,GazaGaza     |
-- | Hebron | 2,HebronHebron |
-- | Egypt  | 3,EgyptEgypt   |
-- | syria  | 4,syriasyria   |
-- +--------+----------------+

-- ___________________________________________________

SELECT text, REVERSE(CONCAT(id, text)) AS MyText FROM try;

-- +--------+---------+
-- | text   | MyText  |
-- +--------+---------+
-- | Gaza   | azaG1   |
-- | Hebron | norbeH2 |
-- | Egypt  | tpygE3  |
-- | syria  | airys4  |
-- +--------+---------+

-- ___________________________________________________

-- فرق مهم: لو أحد القيم NULL، الدالة CONCAT ترجع NULL كاملة
-- أما CONCAT_WS فتتجاهل القيمة NULL وتكمل

SELECT CONCAT('A', NULL, 'B') AS concat_result, CONCAT_WS('-', 'A', NULL, 'B') AS concat_ws_result;

-- +---------------+------------------+
-- | concat_result | concat_ws_result |
-- +---------------+------------------+
-- | NULL          | A-B              |
-- +---------------+------------------+
