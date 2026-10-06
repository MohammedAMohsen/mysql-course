-- Lesson 08 - Deal With Databases
-- Video: https://www.youtube.com/watch?v=pUnWUckQuKE

-- تجهيز: نبدأ من وضع نظيف لقواعد البيانات المستخدمة في هذا الدرس
DROP DATABASE IF EXISTS Albasha;
CREATE DATABASE IF NOT EXISTS test;

-- ==================================================

CREATE DATABASE Albasha;

SHOW DATABASES;

-- +--------------------+
-- | Database           |
-- +--------------------+
-- | Albasha            |
-- | information_schema |
-- | mysql              |
-- | performance_schema |
-- | sys                |
-- | test               |
-- +--------------------+

-- ملاحظة: القائمة عندك قد تختلف حسب قواعد البيانات الموجودة على جهازك

USE Albasha; -- الدخول إلى قاعدة البيانات

-- ==================================================

-- DROP DATABASE Mohammed;
-- ERROR 1008 (HY000): Can't drop database 'Mohammed'; database doesn't exist

-- قاعد بحذف قاعدة بيانات مش موجودة، لاحظ بقلي لا يوجد قاعدة بيانات باسم محمد

DROP DATABASE IF EXISTS Mohammed;

-- Query OK, 0 rows affected, 1 warning

-- إذا قاعدة البيانات موجودة احذفها، لاحظ ما أعطاني خطأ مثل الاستعلام السابق ولكن أعطاني تحذيرا واحدا
-- ليش بستعمل الشرط السابق؟ الشرط مهم حتى لا يتوقف البرنامج بسبب الأخطاء

-- ==================================================

DROP DATABASE IF EXISTS test;

-- Query OK, 2 rows affected

SHOW DATABASES;

-- +--------------------+
-- | Database           |
-- +--------------------+
-- | Albasha            |
-- | information_schema |
-- | mysql              |
-- | performance_schema |
-- | sys                |
-- +--------------------+

-- لاحظ حذف قاعدة البيانات test

-- ==================================================

-- CREATE DATABASE Albasha;
-- ERROR 1007 (HY000): Can't create database 'Albasha'; database exists
-- بقلي إن قاعدة البيانات موجودة بالفعل

CREATE DATABASE IF NOT EXISTS Albasha; -- إنشاء قاعدة البيانات إذا كانت مش موجودة

-- Query OK, 1 row affected, 1 warning

-- ==================================================

SHOW DATABASES LIKE 'Albasha'; -- اعرض قاعدة البيانات التي اسمها Albasha

-- +--------------------+
-- | Database (Albasha) |
-- +--------------------+
-- | Albasha            |
-- +--------------------+

SHOW DATABASES LIKE 'Mohammed';

-- Empty set
-- ما في قاعدة بيانات بهذا الاسم
