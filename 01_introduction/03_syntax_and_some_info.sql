-- Lesson 03 - Syntax & Some Info
-- Video: https://www.youtube.com/watch?v=9p7ugFU9dvs

/* Create Database osama Without Check */
CREATE DATABASE osama;

/* Create Database osama If Its Not Exists */
-- لو قاعدة البيانات موجودة ما بعطي خطأ، بس بعطي تحذير وما بعمل إشي
CREATE DATABASE IF NOT EXISTS osama;

/* Delete Database osama Without Check */
DROP DATABASE osama;

/* Delete Database osama If Its Exists */
DROP DATABASE IF EXISTS osama;

-- ==================================================

/* Test Syntax For Multiple Line Query */
-- الأمر الواحد ممكن ينكتب على أكثر من سطر، والمهم أنه ينتهي بفاصلة منقوطة
-- هذا مثال على الشكل فقط، لأن الجدول والأعمدة غير موجودة

-- SELECT
--     name, email, info
-- FROM
--     osama
-- WHERE
--     id = 100
-- AND
--     xx = "zz"
-- ORDER BY
--     id
-- LIMIT
--     1;

/* Select All Records From Items Table */
-- العلامة ` حول اسم الجدول اختيارية، وتفيد لو كان الاسم كلمة محجوزة في اللغة
-- SELECT * FROM `items`;
