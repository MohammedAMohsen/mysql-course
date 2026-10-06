# دورة MySQL بالعربي: ملاحظات وأمثلة مجربة

> **English:** My study notes for the free Arabic MySQL course by
> [Elzero Web School](https://www.youtube.com/playlist?list=PLDoPjvoNmBAz6DT8SzQ1CODJTH-NIA7R9).
> Every lesson is a runnable `.sql` file with explanations written in Arabic and the real result under each query.
> 51 lessons in 10 topic folders.

ملاحظاتي الكاملة على دورة MySQL المجانية من **الزيرو ويب سكول**، مرتبة ومراجعة.

- **كل درس ملف SQL يشتغل.** الشرح مكتوب بالعربي كتعليقات، والأوامر أوامر حقيقية تقدر تشغلها مباشرة.
- **كل نتيجة مكتوبة حقيقية.** شغلت كل الأوامر على خادم MySQL، والنتيجة تحت كل أمر هي الناتج الفعلي.
- **كل درس يعمل وحده.** في أول كل درس جزء تجهيز ينشئ الجداول والبيانات التي يحتاجها، فلا تحتاج تشغيل الدروس التي قبله.
- **رقم الملف هو نفس رقم الفيديو.** وجنب كل درس رابط الفيديو تبعه.

---

## المصدر

هذه الملاحظات مبنية على دورة MySQL المجانية من قناة الزيرو ويب سكول للأستاذ أسامة الزيرو.

- قائمة الفيديوهات: [MySQL على يوتيوب](https://www.youtube.com/playlist?list=PLDoPjvoNmBAz6DT8SzQ1CODJTH-NIA7R9)

ترتيب الدروس وعناوينها وأغلب الأمثلة من الدورة الأصلية. الشرح العربي والملاحظات والأمثلة الإضافية من كتابتي.
هذا المستودع لا يغني عن مشاهدة الدورة، هو مرجع للمراجعة بعد كل فيديو.

---

## كيف تستخدم الملفات

### المتطلبات

- خادم MySQL 8. الدروس مجربة على الإصدار 8.0.
- طريقة التثبيت في [الدرس 02](01_introduction/02_the_needed_tools.md).

### طريقة قراءة الملف

```sql
SELECT * FROM try WHERE number BETWEEN 2 AND 5;   -- الأمر نفسه

-- +----+---------+---------------------+--------+
-- | id | name    | date                | number |  <- النتيجة الحقيقية مكتوبة كتعليق تحت الأمر
-- +----+---------+---------------------+--------+

-- الشرح بالعربي يكون في أسطر تبدأ بـ --
```

- السهم `<==` بجانب صف في النتيجة يعني أن هذا الصف هو الذي تغير، أو هو المقصود في الشرح.
- الأوامر التي تعطي خطأ عن قصد مكتوبة كتعليق، وتحتها رسالة الخطأ الحقيقية.

### تشغيل أي درس

افتح الملف في MySQL Workbench أو DBeaver وشغله، أو من الطرفية:

```bash
mysql -u root -p < 04_constraints/15_constraint_primary_key.sql
```

أو انسخ الأوامر واحدا واحدا داخل الطرفية حتى ترى نتيجة كل أمر وحده.

### ملاحظات مهمة

- **استخدم خادما للتعلم فقط.** أجزاء التجهيز تحذف وتعيد إنشاء قواعد البيانات `test` و `Albasha` و `shop` وجداولها.
- **دروس التاريخ تثبت الوقت الحالي** على يوم تسجيل الدرس عن طريق `SET TIMESTAMP`، حتى تطابق النتائج المكتوبة. احذف هذا السطر لترى النتائج حسب تاريخ اليوم.
- **بعض النتائج تختلف عندك**، مثل أوقات إنشاء الجداول، وقائمة قواعد البيانات، ورقم الإصدار والاتصال في الدرس 45.
- **الدرس 04 بلغة بايثون** بدل PHP الموجودة في الفيديو. يحتاج تثبيت المكتبة:

```bash
pip install mysql-connector-python
```

---

## شكل المستودع

```
mysql-course/
├── 01_introduction/              المقدمة والأدوات
├── 02_data_types/                أنواع البيانات
├── 03_databases_and_tables/      قواعد البيانات والجداول
├── 04_constraints/               القيود والعلاقات
├── 05_string_functions/          دوال النصوص
├── 06_numeric_functions/         دوال الأرقام
├── 07_date_functions/            دوال التاريخ
├── 08_operators_and_conditions/  عوامل المقارنة والشروط
├── 09_grouping_and_joins/        التجميع والربط بين الجداول
└── 10_the_end/                   الخاتمة
```

---

## فهرس الدروس

### 1. المقدمة — الدروس 01 إلى 04

ما هي MySQL، والأدوات المطلوبة، وشكل الأوامر، والاتصال بقاعدة البيانات من بايثون.

| الدرس | الملف | الفيديو |
|:---:|---|:---:|
| 01 | [Intro & Whats MySQL ?](<01_introduction/01_intro_whats_mysql.md>) | [مشاهدة](https://www.youtube.com/watch?v=DftlOK7fCtc) |
| 02 | [The Needed Tools](<01_introduction/02_the_needed_tools.md>) | [مشاهدة](https://www.youtube.com/watch?v=z4j4S6GsxaU) |
| 03 | [Syntax & Some Info](<01_introduction/03_syntax_and_some_info.sql>) | [مشاهدة](https://www.youtube.com/watch?v=9p7ugFU9dvs) |
| 04 | [Connect With PDO + Examples](<01_introduction/04_connect_with_python_mysql_connector.py>) | [مشاهدة](https://www.youtube.com/watch?v=ctZ4r3OfD1Y) |

### 2. أنواع البيانات — الدروس 05 إلى 07

الأرقام، والتاريخ والوقت، والنصوص، و ENUM و SET.

| الدرس | الملف | الفيديو |
|:---:|---|:---:|
| 05 | [Data Type - Numeric](<02_data_types/05_data_type_numeric.sql>) | [مشاهدة](https://www.youtube.com/watch?v=eOxMy_iDitI) |
| 06 | [Data Type - Date & Time](<02_data_types/06_data_type_date_and_time.sql>) | [مشاهدة](https://www.youtube.com/watch?v=_-FjFtMPZAc) |
| 07 | [Data Type - String](<02_data_types/07_data_type_string.sql>) | [مشاهدة](https://www.youtube.com/watch?v=CpBZVbtKgCc) |

### 3. قواعد البيانات والجداول — الدروس 08 إلى 12

إنشاء وحذف قواعد البيانات والجداول، وتعديل الجداول وأعمدتها.

| الدرس | الملف | الفيديو |
|:---:|---|:---:|
| 08 | [Deal With Databases](<03_databases_and_tables/08_deal_with_databases.sql>) | [مشاهدة](https://www.youtube.com/watch?v=pUnWUckQuKE) |
| 09 | [Tables - Create, Drop, Show Status](<03_databases_and_tables/09_tables_create_drop_show_status.sql>) | [مشاهدة](https://www.youtube.com/watch?v=bYx8D2nQFjw) |
| 10 | [Tables - Rename, Change Type](<03_databases_and_tables/10_tables_rename_change_type.sql>) | [مشاهدة](https://www.youtube.com/watch?v=GQxTVYMf424) |
| 11 | [Tables - Alter](<03_databases_and_tables/11_tables_alter.sql>) | [مشاهدة](https://www.youtube.com/watch?v=lt8kizMJ4dU) |
| 12 | [Tables - Advanced](<03_databases_and_tables/12_tables_advanced.sql>) | [مشاهدة](https://www.youtube.com/watch?v=QM8YKY6-LpQ) |

### 4. القيود والعلاقات بين الجداول — الدروس 13 إلى 21

NOT NULL و UNIQUE والمفتاح الأساسي والمفتاح الأجنبي، وأنواع العلاقات بين الجداول.

| الدرس | الملف | الفيديو |
|:---:|---|:---:|
| 13 | [Constraint - Intro](<04_constraints/13_constraint_intro.sql>) | [مشاهدة](https://www.youtube.com/watch?v=QJx4CLYzeSI) |
| 14 | [Constraint - Not Null, Unique](<04_constraints/14_constraint_not_null_unique.sql>) | [مشاهدة](https://www.youtube.com/watch?v=VnR4ElaU3c0) |
| 15 | [Constraint - Primary Key](<04_constraints/15_constraint_primary_key.sql>) | [مشاهدة](https://www.youtube.com/watch?v=Q37DX3-tuVg) |
| 16 | [Constraint - Foreign Key Intro](<04_constraints/16_constraint_foreign_key_intro.sql>) | [مشاهدة](https://www.youtube.com/watch?v=7nq3k6iPnY0) |
| 17 | [Constraint - Foreign Key Test Relation](<04_constraints/17_constraint_foreign_key_test_relation.sql>) | [مشاهدة](https://www.youtube.com/watch?v=NpH6MNz0UFM) |
| 18 | [Constraint - Foreign Key Update, Delete](<04_constraints/18_constraint_foreign_key_update_delete.sql>) | [مشاهدة](https://www.youtube.com/watch?v=pFAVhHvjMk8) |
| 19 | [Constraint - Foreign Key One To One](<04_constraints/19_constraint_foreign_key_one_to_one.sql>) | [مشاهدة](https://www.youtube.com/watch?v=nTwaI81AG1M) |
| 20 | [Constraint - Foreign Key One To Many](<04_constraints/20_constraint_foreign_key_one_to_many.sql>) | [مشاهدة](https://www.youtube.com/watch?v=cDPIFF7f-pw) |
| 21 | [Constraint - Foreign Key Many To Many](<04_constraints/21_constraint_foreign_key_many_to_many.sql>) | [مشاهدة](https://www.youtube.com/watch?v=sczhWxKeD2s) |

### 5. دوال النصوص — الدروس 22 إلى 29

القص والطول وتغيير الحالة والاستبدال والربط وإزالة المسافات والتعبئة.

| الدرس | الملف | الفيديو |
|:---:|---|:---:|
| 22 | [String Functions - Left, Right, Mid](<05_string_functions/22_string_functions_left_right_mid.sql>) | [مشاهدة](https://www.youtube.com/watch?v=tUArSgsi9tA) |
| 23 | [String Functions - Length, Char_Length](<05_string_functions/23_string_functions_length_char_length.sql>) | [مشاهدة](https://www.youtube.com/watch?v=McOxD4jcG6o) |
| 24 | [String Functions - Upper, Lower](<05_string_functions/24_string_functions_upper_lower.sql>) | [مشاهدة](https://www.youtube.com/watch?v=10J_EjSCV_U) |
| 25 | [String Functions - Repeat, Reverse, Replace](<05_string_functions/25_string_functions_repeat_reverse_replace.sql>) | [مشاهدة](https://www.youtube.com/watch?v=htxX3l6D39s) |
| 26 | [String Functions - Concat, Concat_Ws](<05_string_functions/26_string_functions_concat_concat_ws.sql>) | [مشاهدة](https://www.youtube.com/watch?v=1ohrgf-72y0) |
| 27 | [String Functions - Insert](<05_string_functions/27_string_functions_insert.sql>) | [مشاهدة](https://www.youtube.com/watch?v=-zd9gcP0_Cw) |
| 28 | [String Functions - Trim, Rtrim, Ltrim](<05_string_functions/28_string_functions_trim_rtrim_ltrim.sql>) | [مشاهدة](https://www.youtube.com/watch?v=_8C0nVIL5Gk) |
| 29 | [String Functions - LPad, RPad](<05_string_functions/29_string_functions_lpad_rpad.sql>) | [مشاهدة](https://www.youtube.com/watch?v=pGhyn9Ko__g) |

### 6. دوال الأرقام — الدروس 30 إلى 31

التقريب للأعلى وللأدنى، والتقريب العادي، وباقي القسمة، والقص، والأس.

| الدرس | الملف | الفيديو |
|:---:|---|:---:|
| 30 | [Numeric Functions - Ceil, Floor, Round](<06_numeric_functions/30_numeric_functions_ceil_floor_round.sql>) | [مشاهدة](https://www.youtube.com/watch?v=l0Wi9OlY6sk) |
| 31 | [Numeric Functions - Mod, Truncate, Pow](<06_numeric_functions/31_numeric_functions_mod_truncate_pow.sql>) | [مشاهدة](https://www.youtube.com/watch?v=AXsB-n7n3O8) |

### 7. دوال التاريخ — الدروس 32 إلى 36

الوقت الحالي، وأجزاء التاريخ، والفرق بين تاريخين، والإضافة والطرح على التاريخ.

| الدرس | الملف | الفيديو |
|:---:|---|:---:|
| 32 | [Date Functions - Curtime, Curdate, Now](<07_date_functions/32_date_functions_curtime_curdate_now.sql>) | [مشاهدة](https://www.youtube.com/watch?v=oqM7x7TWRhU) |
| 33 | [Date Functions - Day, Dayname](<07_date_functions/33_date_functions_day_dayname.sql>) | [مشاهدة](https://www.youtube.com/watch?v=xHtEP_KurzQ) |
| 34 | [Date Functions - Month, Hour, Minute](<07_date_functions/34_date_functions_month_hour_minute.sql>) | [مشاهدة](https://www.youtube.com/watch?v=lnoizliyD0U) |
| 35 | [Date Functions - DateDiff + Examples](<07_date_functions/35_date_functions_datediff_and_examples.sql>) | [مشاهدة](https://www.youtube.com/watch?v=rfxZ_JQVFzY) |
| 36 | [Date Functions - Date_Add, Date_Sub, Last_Day](<07_date_functions/36_date_functions_date_add_date_sub_last_day.sql>) | [مشاهدة](https://www.youtube.com/watch?v=r7IxZzX9J8k) |

### 8. عوامل المقارنة والشروط — الدروس 37 إلى 44

BETWEEN و IN و LIKE، وعوامل المقارنة والمنطق، و IF و CASE، والعمليات الحسابية.

| الدرس | الملف | الفيديو |
|:---:|---|:---:|
| 37 | [Comparison Functions - Between And Not Between](<08_operators_and_conditions/37_comparison_functions_between_and_not_between.sql>) | [مشاهدة](https://www.youtube.com/watch?v=YHR6js9eHHQ) |
| 38 | [Comparison Functions - In, Not In](<08_operators_and_conditions/38_comparison_functions_in_not_in.sql>) | [مشاهدة](https://www.youtube.com/watch?v=db3skJVH3Jg) |
| 39 | [Comparison Functions - Like, Not Like](<08_operators_and_conditions/39_comparison_functions_like_not_like.sql>) | [مشاهدة](https://www.youtube.com/watch?v=rQPccnItU3g) |
| 40 | [Comparison Operators](<08_operators_and_conditions/40_comparison_operators.sql>) | [مشاهدة](https://www.youtube.com/watch?v=ukzDmri8M7A) |
| 41 | [Logical Operators - And, Or, Xor, Not](<08_operators_and_conditions/41_logical_operators_and_or_xor_not.sql>) | [مشاهدة](https://www.youtube.com/watch?v=2rXwrlrGRKc) |
| 42 | [Control Flow Functions - If](<08_operators_and_conditions/42_control_flow_functions_if.sql>) | [مشاهدة](https://www.youtube.com/watch?v=ZWpat_A-1Q8) |
| 43 | [Control Flow Functions - Case](<08_operators_and_conditions/43_control_flow_functions_case.sql>) | [مشاهدة](https://www.youtube.com/watch?v=wkuKvWOoagQ) |
| 44 | [Arithmetic Operators](<08_operators_and_conditions/44_arithmetic_operators.sql>) | [مشاهدة](https://www.youtube.com/watch?v=EhSLy9WtdK8) |

### 9. التجميع والربط بين الجداول — الدروس 45 إلى 50

دوال المعلومات، والترتيب والتجميع و HAVING، والربط بين الجداول بأنواعه.

| الدرس | الملف | الفيديو |
|:---:|---|:---:|
| 45 | [Information Functions](<09_grouping_and_joins/45_information_functions.sql>) | [مشاهدة](https://www.youtube.com/watch?v=TZZRIg_vBIU) |
| 46 | [Group Order And Having](<09_grouping_and_joins/46_group_order_and_having.sql>) | [مشاهدة](https://www.youtube.com/watch?v=BBCee4l9NNo) |
| 47 | [Simulation Of Join](<09_grouping_and_joins/47_simulation_of_join.sql>) | [مشاهدة](https://www.youtube.com/watch?v=n0LQxLbAIVY) |
| 48 | [Alias In Deep](<09_grouping_and_joins/48_alias_in_deep.sql>) | [مشاهدة](https://www.youtube.com/watch?v=EiGbfJwf3CU) |
| 49 | [Inner Join](<09_grouping_and_joins/49_inner_join.sql>) | [مشاهدة](https://www.youtube.com/watch?v=UmmI7FJquRc) |
| 50 | [Left And Right Join](<09_grouping_and_joins/50_left_and_right_join.sql>) | [مشاهدة](https://www.youtube.com/watch?v=qoNLQxqNkVo) |

### 10. الخاتمة — الدرس 51

نهاية الدورة ومراجع للمتابعة.

| الدرس | الملف | الفيديو |
|:---:|---|:---:|
| 51 | [The End And References](<10_the_end/51_the_end_and_references.md>) | [مشاهدة](https://www.youtube.com/watch?v=LyOqfnzMrHg) |

---

## عن هذا المستودع

كتبت هذه الملاحظات بيدي أثناء متابعة الدورة. بعد انتهائها راجعت كل الملفات مع مساعد ذكاء اصطناعي.
حولنا كل درس إلى ملف SQL يعمل، وأضفنا جزء التجهيز لكل درس، وشغلنا كل الأوامر على خادم حقيقي.
ثم صححنا النتائج والشرح الخاطئ، ورتبنا الملفات في مجلدات.

إذا وجدت خطأ، افتح مشكلة جديدة (Issue) في المستودع.
