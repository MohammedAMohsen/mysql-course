-- Lesson 32 - Date Functions - Curtime, Curdate, Now
-- Video: https://www.youtube.com/watch?v=oqM7x7TWRhU

-- Date & Time Function Syntax:

-- CURTIME()
-- CURRENT_TIME()
-- CURRENT_TIME
-- جميعهم يعبرون عن الوقت الحالي
-- Time Format Default >> HH:MM:SS

-- CURDATE()
-- CURRENT_DATE()
-- CURRENT_DATE
-- جميعهم يعبرون عن اليوم الحالي
-- Date Format Default >> YYYY-MM-DD

-- NOW()
-- CURRENT_TIMESTAMP()
-- CURRENT_TIMESTAMP
-- جميعهم يعبرون عن اليوم والوقت الحالي
-- DateTime Format Default >> YYYY-MM-DD HH:MM:SS

-- =========================================

-- نثبت الوقت الحالي على وقت تسجيل الدرس، حتى تطابق النتائج المكتوبة
-- احذف هذا السطر لترى التاريخ والوقت الحقيقي عندك
SET TIMESTAMP = UNIX_TIMESTAMP('2026-04-16 12:49:43');

SELECT CURTIME();

-- +-----------+
-- | CURTIME() |
-- +-----------+
-- | 12:49:43  |
-- +-----------+
SELECT CURRENT_TIME();
SELECT CURRENT_TIME;

-- ---------------------------

SELECT CURDATE();

-- +------------+
-- | CURDATE()  |
-- +------------+
-- | 2026-04-16 |
-- +------------+
SELECT CURRENT_DATE();
SELECT CURRENT_DATE;

-- ---------------------------

SELECT NOW();

-- +---------------------+
-- | NOW()               |
-- +---------------------+
-- | 2026-04-16 12:49:43 |
-- +---------------------+
SELECT CURRENT_TIMESTAMP();
SELECT CURRENT_TIMESTAMP;

-- الأوامر الثلاثة في كل مجموعة تعطي نفس الناتج، لذلك كتبت ناتج الأول فقط

SET TIMESTAMP = DEFAULT; -- إرجاع الوقت الحقيقي
