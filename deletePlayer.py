import mysql.connector

conn = mysql.connector.connect(
    user="soyeon",
    password="Thdus@0223",
    host='127.0.0.1',
    database="worldCup_21007781"
)

cursor = conn.cursor()

delete_stmt = "DELETE FROM Player WHERE playerName = %s"
data1 = ("Mariona Caldentey",)

cursor.execute(delete_stmt, data1)

# Commit the changes to the database
conn.commit()

select_stmt = "SELECT * FROM Player"
cursor.execute(select_stmt)

result = cursor.fetchall()
for row in result:
    print(row)

cursor.close()
conn.close()