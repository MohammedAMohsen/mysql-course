# Lesson 04 - Connect With PDO + Examples
# Video: https://www.youtube.com/watch?v=ctZ4r3OfD1Y

# ملاحظة: الدرس الأصلي في الدورة يتصل بقاعدة البيانات عن طريق PHP (PDO)
# أنا طبقت نفس الفكرة بلغة بايثون باستخدام المكتبة mysql-connector-python

# أمر التثبيت من الطرفية
# pip install mysql-connector-python

import os
import mysql.connector  # Import The Package After Installing It With pip

try:  # Try To Connect To The Database

    # Start A New Connection With MySQL Connector Package
    db = mysql.connector.connect(
        host="localhost",                           # Host
        user="root",                                # The User To Connect
        password=os.getenv("MYSQL_PASSWORD", ""),   # Password Of This User
        charset="utf8mb4"                           # UTF-8 Unicode Encoding (أفضل ترميز)
    )

    # لا تكتب كلمة المرور الحقيقية داخل الكود أبدا، خاصة إذا كنت سترفعه على الإنترنت
    # الأفضل قراءتها من متغير في النظام، قبل التشغيل اكتب في الطرفية
    # export MYSQL_PASSWORD="your_password"

    print("Connected To The Database Successfully :)")

    # cursor => All Operations In SQL Are Done By The Cursor, Not The Connection Itself
    cr = db.cursor()

    # Create The Database If It Does Not Exist, Then Use It
    cr.execute("CREATE DATABASE IF NOT EXISTS ecom")
    cr.execute("USE ecom")

    # Create The Table And Fields:
    cr.execute("CREATE TABLE IF NOT EXISTS product(id INT PRIMARY KEY AUTO_INCREMENT, name VARCHAR(255))")

    # Inserting Data:
    # cr.execute("INSERT INTO product(name) VALUES('PS4')") # ممكن بدون ما أكتب id لأنه AUTO_INCREMENT
    cr.execute("INSERT INTO product(name) VALUES(%s)", ("سماعات",))  # نفس الفكرة لكن هذه الطريقة أأمن

    # %s مكان القيمة، والقيمة نفسها نرسلها وحدها في tuple
    # هكذا تتعامل المكتبة معها كبيانات فقط، وتحمينا من حقن قاعدة البيانات (SQL Injection)

    # Save (Commit) Changes:
    # هذا الأمر مهم جدا، عشان يحفظ التغييرات التي أجريتها على قاعدة البيانات
    db.commit()

    # Fetch Data From Database:
    cr.execute("SELECT * FROM product")

    # Print Result:
    print(cr.fetchall())  # [(1, 'سماعات')] -> كل تشغيل جديد يضيف صفا جديدا

    # Close The Cursor And The Database:
    cr.close()
    db.close()

except mysql.connector.Error as er:  # General Error

    print("Connection Failed :(")
    print(er)  # Print The Error Message
