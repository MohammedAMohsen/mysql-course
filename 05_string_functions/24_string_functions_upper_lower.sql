-- Lesson 24 - String Functions - Upper, Lower
-- Video: https://www.youtube.com/watch?v=10J_EjSCV_U

-- MySQL String Functions Syntax:

-- UPPER(String) or UCASE(String) -- الاثنتان واحد، وتحولان النص لأحرف كبيرة
-- LOWER(String) or LCASE(String) -- الاثنتان واحد، وتحولان النص لأحرف صغيرة

-- =======================================================

-- تجهيز
CREATE DATABASE IF NOT EXISTS test;
USE test;
DROP TABLE IF EXISTS try;
CREATE TABLE try(id INT UNIQUE AUTO_INCREMENT, text VARCHAR(255));
INSERT INTO try(text) VALUES('Gaza'), ('Hebron'), ('Egypt');

SELECT * FROM try;

-- +----+--------+
-- | id | text   |
-- +----+--------+
-- |  1 | Gaza   |
-- |  2 | Hebron |
-- |  3 | Egypt  |
-- +----+--------+

-- ---------------

SELECT UPPER(text) FROM try;

-- +-------------+
-- | UPPER(text) |
-- +-------------+
-- | GAZA        |
-- | HEBRON      |
-- | EGYPT       |
-- +-------------+

-- ----------------

SELECT LCASE(text) FROM try;

-- +-------------+
-- | LCASE(text) |
-- +-------------+
-- | gaza        |
-- | hebron      |
-- | egypt       |
-- +-------------+
