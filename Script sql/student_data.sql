SET FOREIGN_KEY_CHECKS = 0; 
TRUNCATE mydb.student;
TRUNCATE mydb.person;
TRUNCATE mydb.group;
TRUNCATE mydb.specialty;
TRUNCATE mydb.department;
SET FOREIGN_KEY_CHECKS = 1;

ALTER TABLE mydb.department AUTO_INCREMENT = 1;
ALTER TABLE mydb.specialty AUTO_INCREMENT = 1;
ALTER TABLE mydb.group AUTO_INCREMENT = 1;
ALTER TABLE mydb.person AUTO_INCREMENT = 1;
ALTER TABLE mydb.student AUTO_INCREMENT = 1;

INSERT INTO mydb.department(parent, info) VALUES (NULL, "Организации");
INSERT INTO mydb.department(parent, info) VALUES (1, "Институты");
INSERT INTO mydb.department(parent, info) VALUES (2, "Институт № 1 «Авиационная техника»");
INSERT INTO mydb.department(parent, info) VALUES (2, "Институт № 2 «Авиационные, ракетные двигатели и энергетические установки»");
INSERT INTO mydb.department(parent, info) VALUES (2, "Институт № 3 «Системы управления, информатика и электроэнергетика»");
INSERT INTO mydb.department(parent, info) VALUES (2, "Институт № 4 «Радиоэлектроника, инфокоммуникации и информационная безопасность»");
INSERT INTO mydb.department(parent, info) VALUES (2, "Институт № 5 «Инженерная экономика и гуманитарные науки»");
INSERT INTO mydb.department(parent, info) VALUES (2, "Институт № 6 «Аэрокосмический»");
INSERT INTO mydb.department(parent, info) VALUES (2, "Институт № 7 «Робототехнические и интеллектуальные системы»");
INSERT INTO mydb.department(parent, info) VALUES (2, "Институт № 8 «Информационные технологии и прикладная математика»");
INSERT INTO mydb.department(parent, info) VALUES (2, "Институт общеинженерной подготовки (Институт № 9)");
INSERT INTO mydb.department(parent, info) VALUES (2, "Институт № 10 «Иностранных языков»");
INSERT INTO mydb.department(parent, info) VALUES (2, "Институт «Материаловедение и технологии материалов» (Институт №11)");
INSERT INTO mydb.department(parent, info) VALUES (2, "Институт «Аэрокосмические наукоёмкие технологии и производства» (Институт №12)");
INSERT INTO mydb.department(parent, info) VALUES (3, "Кафедра 101 «Проектирование и сертификация авиационной техники» Института № 1 «Авиационная техника»");
INSERT INTO mydb.department(parent, info) VALUES (3, "Кафедра 102 «Проектирование вертолётов» Института № 1 «Авиационная техника»");
INSERT INTO mydb.department(parent, info) VALUES (3, "Кафедра 104 «Технологического проектирования и управления качеством» Института № 1 «Авиационная техника»");
INSERT INTO mydb.department(parent, info) VALUES (3, "Кафедра 105 «Аэродинамика летательных аппаратов» Института № 1 «Авиационная техника»");
INSERT INTO mydb.department(parent, info) VALUES (3, "Кафедра 106 «Динамика и управление летательных аппаратов» Института № 1 «Авиационная техника»");
INSERT INTO mydb.department(parent, info) VALUES (4, "Кафедра 201 «Теория воздушно-реактивных двигателей»");
INSERT INTO mydb.department(parent, info) VALUES (4, "Кафедра 202 «Ракетные двигатели»");
INSERT INTO mydb.department(parent, info) VALUES (4, "Кафедра 203 «Конструкция и проектирование двигателей»");
INSERT INTO mydb.department(parent, info) VALUES (4, "Кафедра 204 «Авиационно-космическая теплотехника»");
INSERT INTO mydb.department(parent, info) VALUES (4, "Кафедра 205 «Технология производства двигателей летательных аппаратов»");
INSERT INTO mydb.department(parent, info) VALUES (5, "Кафедра 301 «Системы автоматического и интеллектуального управления»");
INSERT INTO mydb.department(parent, info) VALUES (5, "Кафедра 304 «Вычислительные машины, системы и сети»");
INSERT INTO mydb.department(parent, info) VALUES (5, "Кафедра 305 «Автоматизированные комплексы систем ориентации и навигации»");
INSERT INTO mydb.department(parent, info) VALUES (5, "Кафедра 306 «Микроэлектронные электросистемы»");
INSERT INTO mydb.department(parent, info) VALUES (5, "Кафедра 307 «Цифровые технологии и информационные системы»");
INSERT INTO mydb.department(parent, info) VALUES (7, "Кафедра 501 «Менеджмент и маркетинг высокотехнологичных отраслей промышленности»");
INSERT INTO mydb.department(parent, info) VALUES (7, "Кафедра 502 «Экономика промышленности: учет, анализ и аудит»");
INSERT INTO mydb.department(parent, info) VALUES (7, "Кафедра 505 «Инновационная экономика, финансы и управление проектами»");
INSERT INTO mydb.department(parent, info) VALUES (7, "Кафедра 507 «Экономическая теория»");
INSERT INTO mydb.department(parent, info) VALUES (7, "Кафедра 509 «Экономика аэрокосмической промышленности»");

INSERT INTO mydb.specialty(code, info, department) VALUES ("27.03.04", "Управление в технических системах", 25);
INSERT INTO mydb.specialty(code, info, department) VALUES ("09.03.01", "Информатика и вычислительная техника", 26);

INSERT INTO mydb.group(number, year, specialty) VALUES (101, 20, 1);
INSERT INTO mydb.group(number, year, specialty) VALUES (107, 20, 2);
INSERT INTO mydb.group(number, year, specialty) VALUES (109, 20, 2);

INSERT INTO mydb.person(last_name, first_name, middle_name, is_male) VALUES ("Вишняков", "Алексей", "Викторович", 1);
INSERT INTO mydb.person(last_name, first_name, middle_name, is_male) VALUES ("Елкин", "Егор", "Александрович", 1);
INSERT INTO mydb.person(last_name, first_name, middle_name, is_male) VALUES ("Жеребцов", "Сергей", "Сергеевич", 1);
INSERT INTO mydb.person(last_name, first_name, middle_name, is_male) VALUES ("Иошина", "Полина", "Сергеевна", 0);
INSERT INTO mydb.person(last_name, first_name, middle_name, is_male) VALUES ("Исаев", "Арсений", "Павлович", 1);
INSERT INTO mydb.person(last_name, first_name, middle_name, is_male) VALUES ("Источникова", "Юлия", "Игоревна", 0);
INSERT INTO mydb.person(last_name, first_name, middle_name, is_male) VALUES ("Кияченко", "Вера", "Андреевна", 0);
INSERT INTO mydb.person(last_name, first_name, middle_name, is_male) VALUES ("Кравцов", "Александр", "Константинович", 1);
INSERT INTO mydb.person(last_name, first_name, middle_name, is_male) VALUES ("Левченя", "Роман", "Сергеевич", 1);

INSERT INTO mydb.person(last_name, first_name, middle_name, is_male) VALUES ("Резников", "Владимир", "Антонович", 1);
INSERT INTO mydb.person(last_name, first_name, middle_name, is_male) VALUES ("Репченко", "Виталий", "Сергеевич", 1);
INSERT INTO mydb.person(last_name, first_name, middle_name, is_male) VALUES ("Сатюков", "Илья", "Олегович", 1);
INSERT INTO mydb.person(last_name, first_name, middle_name, is_male) VALUES ("Цынбалова", "Ева", "Александровна", 0);
INSERT INTO mydb.person(last_name, first_name, middle_name, is_male) VALUES ("Чернов", "Даниил", "Алексеевич", 1);
INSERT INTO mydb.person(last_name, first_name, middle_name, is_male) VALUES ("Чистофат", "Кирилл", "Денисович", 1);
INSERT INTO mydb.person(last_name, first_name, middle_name, is_male) VALUES ("Давыденко", "Лев", "Евгеньевич", 1);

INSERT INTO mydb.person(last_name, first_name, middle_name, is_male) VALUES ("Абдилякимов", "Санжар", "Джанибекович", 1);
INSERT INTO mydb.person(last_name, first_name, middle_name, is_male) VALUES ("Асцатурян", "Артем", "Геннадьевич", 1);
INSERT INTO mydb.person(last_name, first_name, middle_name, is_male) VALUES ("Беликов", "Родион", "Евгеньевич", 1);
INSERT INTO mydb.person(last_name, first_name, middle_name, is_male) VALUES ("Борисов", "Артём", "Ильич", 1);
INSERT INTO mydb.person(last_name, first_name, middle_name, is_male) VALUES ("Валиев", "Сергей", "Иванович", 1);
INSERT INTO mydb.person(last_name, first_name, middle_name, is_male) VALUES ("Воропанов", "Кирилл", "Андреевич", 1);
INSERT INTO mydb.person(last_name, first_name, middle_name, is_male) VALUES ("Гончаров", "Георгий", "Николаевич", 1);

INSERT INTO mydb.student VALUES (1, "011-0001", 1, 1, 1);
INSERT INTO mydb.student VALUES (2, "011-0002", 2, 1, 1);
INSERT INTO mydb.student VALUES (3, "011-0003", 3, 1, 1);
INSERT INTO mydb.student VALUES (4, "011-0004", 4, 1, 1);
INSERT INTO mydb.student VALUES (5, "011-0005", 5, 1, 1);
INSERT INTO mydb.student VALUES (6, "011-0006", 6, 1, 1);
INSERT INTO mydb.student VALUES (7, "011-0007", 7, 1, 1);
INSERT INTO mydb.student VALUES (8, "011-0008", 8, 1, 1);
INSERT INTO mydb.student VALUES (9, "011-0009", 9, 1, 1);

INSERT INTO mydb.student VALUES (10, "021-0010", 10, 1, 2);
INSERT INTO mydb.student VALUES (11, "021-0011", 11, 1, 2);
INSERT INTO mydb.student VALUES (12, "021-0012", 12, 1, 2);
INSERT INTO mydb.student VALUES (13, "021-0013", 13, 1, 2);
INSERT INTO mydb.student VALUES (14, "021-0014", 14, 1, 2);
INSERT INTO mydb.student VALUES (15, "021-0015", 15, 1, 2);
INSERT INTO mydb.student VALUES (16, "021-0016", 16, 1, 2);

INSERT INTO mydb.student VALUES (17, "030-0017", 17, 0, 3);
INSERT INTO mydb.student VALUES (18, "030-0018", 18, 0, 3);
INSERT INTO mydb.student VALUES (19, "030-0019", 19, 0, 3);
INSERT INTO mydb.student VALUES (20, "030-0020", 20, 0, 3);
INSERT INTO mydb.student VALUES (21, "030-0021", 21, 0, 3);
INSERT INTO mydb.student VALUES (22, "030-0022", 22, 0, 3);
INSERT INTO mydb.student VALUES (23, "030-0023", 23, 0, 3);
