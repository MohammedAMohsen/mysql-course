-- Lesson 46 - Group Order And Having
-- Video: https://www.youtube.com/watch?v=BBCee4l9NNo

-- ==============================
-- === Group Order And Having ===
-- ==============================

-- تجهيز: جدول المساهمات
CREATE DATABASE IF NOT EXISTS test;
USE test;
DROP TABLE IF EXISTS contribution;
CREATE TABLE contribution(id INT UNIQUE AUTO_INCREMENT, name VARCHAR(255), points INT);
INSERT INTO contribution(name, points) VALUES
    ('mohammed', 50), ('Osama', 150), ('maha', 64), ('Sameh', 89),
    ('Ahmed', 24), ('maha', 100), ('Mohammed', 341), ('Mohammed', 21);

SELECT * FROM contribution;

-- +----+----------+--------+
-- | id | name     | points |
-- +----+----------+--------+
-- |  1 | mohammed |     50 |
-- |  2 | Osama    |    150 |
-- |  3 | maha     |     64 |
-- |  4 | Sameh    |     89 |
-- |  5 | Ahmed    |     24 |
-- |  6 | maha     |    100 |
-- |  7 | Mohammed |    341 |
-- |  8 | Mohammed |     21 |
-- +----+----------+--------+

-- بدون ORDER BY لا يوجد ترتيب مضمون، وعادة تظهر الصفوف بترتيب الإدخال

-- ───────────────────────────────────────────────────────────────

SELECT * FROM contribution ORDER BY name;

-- +----+----------+--------+
-- | id | name     | points |
-- +----+----------+--------+
-- |  5 | Ahmed    |     24 |
-- |  3 | maha     |     64 |
-- |  6 | maha     |    100 |
-- |  1 | mohammed |     50 |
-- |  7 | Mohammed |    341 |
-- |  8 | Mohammed |     21 |
-- |  2 | Osama    |    150 |
-- |  4 | Sameh    |     89 |
-- +----+----------+--------+

-- رتب حسب الاسم تصاعديا، وهي القيمة الافتراضية
-- لاحظ mohammed و Mohammed اعتبرهما نفس الاسم، لأن الترتيب الافتراضي لا يفرق بين الحروف الكبيرة والصغيرة

-- ───────────────────────────────────────────────────────────────

SELECT * FROM contribution ORDER BY name DESC;

-- +----+----------+--------+
-- | id | name     | points |
-- +----+----------+--------+
-- |  4 | Sameh    |     89 |
-- |  2 | Osama    |    150 |
-- |  1 | mohammed |     50 |
-- |  7 | Mohammed |    341 |
-- |  8 | Mohammed |     21 |
-- |  3 | maha     |     64 |
-- |  6 | maha     |    100 |
-- |  5 | Ahmed    |     24 |
-- +----+----------+--------+

-- رتب حسب الاسم تنازليا

-- ───────────────────────────────────────────────────────────────

SELECT * FROM contribution ORDER BY name, points;

-- +----+----------+--------+
-- | id | name     | points |
-- +----+----------+--------+
-- |  5 | Ahmed    |     24 |
-- |  3 | maha     |     64 |
-- |  6 | maha     |    100 |
-- |  8 | Mohammed |     21 |  <==
-- |  1 | mohammed |     50 |  <==
-- |  7 | Mohammed |    341 |  <==
-- |  2 | Osama    |    150 |
-- |  4 | Sameh    |     89 |
-- +----+----------+--------+

-- أقدر أرتب حسب عمودين مع بعض
-- يرتب أولا حسب الاسم، وإذا تكرر الاسم يرتب صفوفه حسب النقاط
-- لاحظ صفوف Mohammed الثلاثة أصبحت مرتبة حسب النقاط

-- ───────────────────────────────────────────────────────────────

-- SELECT * FROM contribution GROUP BY name;
-- ERROR 1055 (42000): Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'test.contribution.id' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by

-- خطأ لأن كل اسم مكرر له أكثر من id وأكثر من نقاط، فلا يعرف أي قيمة يعرض

SELECT name FROM contribution GROUP BY name; -- فقط اعرض الاسم

-- +----------+
-- | name     |
-- +----------+
-- | mohammed |
-- | Osama    |
-- | maha     |
-- | Sameh    |
-- | Ahmed    |
-- +----------+

-- جمع الأسماء المكررة مع بعض

-- ───────────────────────────────────────────────────────────────

SELECT name, SUM(points) FROM contribution GROUP BY name;

-- +----------+-------------+
-- | name     | SUM(points) |
-- +----------+-------------+
-- | mohammed |         412 |
-- | Osama    |         150 |
-- | maha     |         164 |
-- | Sameh    |          89 |
-- | Ahmed    |          24 |
-- +----------+-------------+

-- جمع الأسماء المكررة، وجمع النقاط لكل اسم في رقم واحد

-- ───────────────────────────────────────────────────────────────

SELECT name, SUM(points) FROM contribution GROUP BY name ORDER BY SUM(points);

-- +----------+-------------+
-- | name     | SUM(points) |
-- +----------+-------------+
-- | Ahmed    |          24 |
-- | Sameh    |          89 |
-- | Osama    |         150 |
-- | maha     |         164 |
-- | mohammed |         412 |
-- +----------+-------------+

-- مع ترتيب حسب مجموع النقاط

-- ───────────────────────────────────────────────────────────────

SELECT name, COUNT(name) AS COUNTNAME FROM contribution GROUP BY name;

-- +----------+-----------+
-- | name     | COUNTNAME |
-- +----------+-----------+
-- | mohammed |         3 |
-- | Osama    |         1 |
-- | maha     |         2 |
-- | Sameh    |         1 |
-- | Ahmed    |         1 |
-- +----------+-----------+

-- يجمع الأسماء المكررة مع بعض، ويحسب عدد تكرار كل اسم

-- ───────────────────────────────────────────────────────────────

-- HAVING: من خلالها أضيف شرطا على البيانات بعد التجميع
-- الفرق عن WHERE: الشرط WHERE يعمل على الصفوف قبل التجميع، و HAVING يعمل على النتائج بعد التجميع

SELECT name, COUNT(name) AS COUNTNAME FROM contribution GROUP BY name HAVING COUNTNAME > 1;

-- +----------+-----------+
-- | name     | COUNTNAME |
-- +----------+-----------+
-- | mohammed |         3 |
-- | maha     |         2 |
-- +----------+-----------+

-- مع شرط أن يكون تكرار الاسم أكبر من 1

-- ------------------

SELECT name, COUNT(name) AS COUNTNAME FROM contribution GROUP BY name HAVING COUNTNAME > 2;

-- +----------+-----------+
-- | name     | COUNTNAME |
-- +----------+-----------+
-- | mohammed |         3 |
-- +----------+-----------+

-- مع شرط أن يكون تكرار الاسم أكبر من 2
