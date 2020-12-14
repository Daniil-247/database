import os
import mysql.connector
import keyboard
import config

selected = 1

def show_menu():
    global selected
    print("\nДоступные действия:")
    print("{0} 1. Отобразить список студентов {1}".format(">" if selected == 1 else " ", "<" if selected == 1 else " "))
    print("{0} 2. Отобразить список групп {1}".format(">" if selected == 2 else " ", "<" if selected == 2 else " "))
    print("{0} 3. Изменить сведения о студенте {1}".format(">" if selected == 3 else " ", "<" if selected == 3 else " "))
    print("{0} 4. Добавить нового студента {1}".format(">" if selected == 4 else " ", "<" if selected == 4 else " "))
    print("{0} 5. Выйти из программы {1}".format(">" if selected == 5 else " ", "<" if selected == 5 else " "))

def up():
    global selected
    if selected == 1:
        return
    selected -= 1
    os.system('clear')
    show_menu()

def down():
    global selected
    if selected == 5:
        return
    selected += 1
    os.system('clear')
    show_menu()

def space():
    os.system('clear')
    global selected
    if selected == 1:
        selectStudents()
    if selected == 2:
        selectGroups()
    if selected == 3:
        updateStudents()
    if selected == 4:
        insertStudents()
    if selected == 5:
        os._exit(os.EX_OK)
    show_menu()

def selectStudents():
    mydb = mysql.connector.connect(
        host=config.dbhost,
        port=config.dbport,
        user=config.dbuser,
        password=config.dbpass,
        database=config.dbname
    )
    mycursor = mydb.cursor()
    mycursor.execute("SELECT concat('№', s.number), concat(p.first_name, ' ', p.middle_name, ' ', " \
            "p.last_name), CASE WHEN p.is_male = 1 THEN 'М' ELSE 'Ж' END, " \
            "CASE WHEN s.is_internally = 1 THEN 'очно' ELSE 'заочно' END, " \
            "concat('№', g.number), concat(sp.code, ': ', sp.info, '. ', d.info) " \
       "FROM mydb.student s " \
       "JOIN mydb.person p ON p.id = s.person " \
       "JOIN mydb.group g ON g.id = s.group " \
       "JOIN mydb.specialty sp ON sp.id = g.specialty " \
       "JOIN mydb.department d ON d.id = sp.department;")
    myresult = mycursor.fetchall()
    for x in myresult:
        print("\nСтуденческий билет: {0}".format(x[0]))
        print("ФИО: {0} ({1})".format(x[1], x[2]))
        print("Группа: {0} ({1})".format(x[4], x[3]))
        print("Направление: {0}".format(x[5]))
    mycursor.close()
    mydb.close

def selectGroups():
    mydb = mysql.connector.connect(
        host=config.dbhost,
        port=config.dbport,
        user=config.dbuser,
        password=config.dbpass,
        database=config.dbname
    )
    mycursor = mydb.cursor()
    mycursor.execute("SELECT concat('№', g.number), concat(sp.code, ': ', sp.info, '. ', d.info) " \
        "FROM mydb.group g " \
        "JOIN mydb.specialty sp ON sp.id = g.specialty " \
        "JOIN mydb.department d ON d.id = sp.department;")
    myresult = mycursor.fetchall()
    for x in myresult:
        print("\nГруппа: {0}".format(x[0]))
        print("Направление: {0}".format(x[1]))
    mycursor.close()
    mydb.close

def updateStudents():
    input("Введите данные:")
    num = input("номер билета: ")
    f_name = input("имя: ")
    m_name = input("отчество: ")
    l_name = input("фамилию: ")
    group = input("номер группы: ")
    if not(f_name.isalpha()) or not(m_name.isalpha()) or not(l_name.isalpha()) or not(group.isdigit()):
        print("Ошибка ввода данных")
        return
    mydb = mysql.connector.connect(
        host=config.dbhost,
        port=config.dbport,
        user=config.dbuser,
        password=config.dbpass,
        database=config.dbname
    )
    mycursor = mydb.cursor()
    mycursor.execute("SELECT concat('№', s.number), concat(p.first_name, ' ', p.middle_name, ' ', " \
            "p.last_name), CASE WHEN p.is_male = 1 THEN 'М' ELSE 'Ж' END, " \
            "CASE WHEN s.is_internally = 1 THEN 'очно' ELSE 'заочно' END, " \
            "concat('№', g.number), concat(sp.code, ': ', sp.info, '. ', d.info), p.id, s.id " \
       "FROM mydb.student s " \
       "JOIN mydb.person p ON p.id = s.person " \
       "JOIN mydb.group g ON g.id = s.group " \
       "JOIN mydb.specialty sp ON sp.id = g.specialty " \
       "JOIN mydb.department d ON d.id = sp.department WHERE s.number = '{0}';".format(num))
    myresult = mycursor.fetchall()
    if len(myresult) == 0:
        print("Не найден номер билета")
        return
    for x in myresult:
        print("\nСтуденческий билет: {0}".format(x[0]))
        print("ФИО: {0} ({1})".format(x[1], x[2]))
        print("Группа: {0} ({1})".format(x[4], x[3]))
        print("Направление: {0}".format(x[5]))
        prsn = x[6]
        stdnt = x[7]
    mycursor.execute("UPDATE mydb.person SET first_name = '{0}', middle_name = '{1}', last_name = '{2}' WHERE id = {3};".format(f_name, m_name, l_name, prsn))
    mydb.commit()
    mycursor.execute("SELECT id FROM mydb.group WHERE `number` = {0};".format(group))
    myresult = mycursor.fetchall()
    if len(myresult) == 0:
        print("Ошибка в номере группы")
        return
    grp = myresult[0][0]
    mycursor.execute("UPDATE mydb.student SET `group` = {0} WHERE id = {1};".format(grp, stdnt))
    mydb.commit()
    mycursor.execute("SELECT concat('№', s.number), concat(p.first_name, ' ', p.middle_name, ' ', " \
            "p.last_name), CASE WHEN p.is_male = 1 THEN 'М' ELSE 'Ж' END, " \
            "CASE WHEN s.is_internally = 1 THEN 'очно' ELSE 'заочно' END, " \
            "concat('№', g.number), concat(sp.code, ': ', sp.info, '. ', d.info) " \
       "FROM mydb.student s " \
       "JOIN mydb.person p ON p.id = s.person " \
       "JOIN mydb.group g ON g.id = s.group " \
       "JOIN mydb.specialty sp ON sp.id = g.specialty " \
       "JOIN mydb.department d ON d.id = sp.department WHERE s.id = {0};".format(stdnt))
    myresult = mycursor.fetchall()
    for x in myresult:
        print("\nСтуденческий билет: {0}".format(x[0]))
        print("ФИО: {0} ({1})".format(x[1], x[2]))
        print("Группа: {0} ({1})".format(x[4], x[3]))
        print("Направление: {0}".format(x[5]))
    mycursor.close()
    mydb.close

def insertStudents():
    input("Введите данные:")
    f_name = input("имя: ")
    m_name = input("отчество: ")
    l_name = input("фамилию: ")
    gender = input("пол (М/Ж): ")
    group = input("номер группы: ")
    if not(f_name.isalpha()) or not(m_name.isalpha()) or not(l_name.isalpha()) or not(gender.isalpha()) or not(group.isdigit()):
        print("Ошибка ввода данных")
        return
    mydb = mysql.connector.connect(
        host=config.dbhost,
        port=config.dbport,
        user=config.dbuser,
        password=config.dbpass,
        database=config.dbname
    )
    mycursor = mydb.cursor()
    mycursor.execute("INSERT INTO mydb.person(first_name, middle_name, last_name, is_male) " \
        "VALUES('{0}','{1}','{2}',CASE WHEN '{3}' = 'М' THEN TRUE ELSE FALSE END);".format(f_name, m_name, l_name, gender))
    mydb.commit()
    mycursor.execute("SELECT last_insert_id();")
    myresult = mycursor.fetchall()
    if len(myresult) == 0:
        print("Ошибка добавления персональных данных")
        return
    prsn = myresult[0][0]
    mycursor.execute("SELECT id FROM mydb.group WHERE number = {0};".format(group))
    myresult = mycursor.fetchall()
    if len(myresult) == 0:
        print("Ошибка в номере группы")
        return
    grp = myresult[0][0]
    mycursor.execute("INSERT INTO mydb.student(`number`, person, is_internally, `group`) " \
        "VALUES(concat(FLOOR(RAND()*1000),'-',FLOOR(RAND()*10000)), {0}, 1, {1});".format(prsn, grp))
    mydb.commit()
    mycursor.execute("SELECT last_insert_id();")
    myresult = mycursor.fetchall()
    if len(myresult) == 0:
        print("Ошибка добавления студента")
        return
    id = myresult[0][0]
    mycursor.execute("SELECT concat('№', s.number), concat(p.first_name, ' ', p.middle_name, ' ', " \
            "p.last_name), CASE WHEN p.is_male = 1 THEN 'М' ELSE 'Ж' END, " \
            "CASE WHEN s.is_internally = 1 THEN 'очно' ELSE 'заочно' END, " \
            "concat('№', g.number), concat(sp.code, ': ', sp.info, '. ', d.info) " \
       "FROM mydb.student s " \
       "JOIN mydb.person p ON p.id = s.person " \
       "JOIN mydb.group g ON g.id = s.group " \
       "JOIN mydb.specialty sp ON sp.id = g.specialty " \
       "JOIN mydb.department d ON d.id = sp.department WHERE s.id = {0};".format(id))
    myresult = mycursor.fetchall()
    for x in myresult:
        print("\nСтуденческий билет: {0}".format(x[0]))
        print("ФИО: {0} ({1})".format(x[1], x[2]))
        print("Группа: {0} ({1})".format(x[4], x[3]))
        print("Направление: {0}".format(x[5]))
    mycursor.close()
    mydb.close

def main():
    """
    Главная функция программы, отображает меню с доступными функциями.
    """
    os.system('clear')
    show_menu()
    keyboard.add_hotkey('up', up)
    keyboard.add_hotkey('down', down)
    keyboard.add_hotkey('space', space)
    keyboard.wait()

if __name__ == '__main__':
    main()
