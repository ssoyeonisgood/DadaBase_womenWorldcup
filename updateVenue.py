import mysql.connector

conn = mysql.connector.connect(
    user="soyeon",
    password="Thdus@0223",
    host='127.0.0.1',
    database="worldCup_21007781"
)

cursor = conn.cursor()

update_stmt = "UPDATE Venue SET capacity = %s where venueName = %s"
data1 = (44330, "Accor Stadium")

cursor.execute(update_stmt, data1)

conn.commit()

select_stmt = "SELECT * FROM Venue"
cursor.execute(select_stmt)

result = cursor.fetchall()
for row in result:
    print(row)

cursor.close()
conn.close()
