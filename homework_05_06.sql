CREATE DATABASE IF NOT EXISTS hw_0506;
USE hw_0506;

CREATE TABLE students (
  id int(5) PRIMARY KEY AUTO_INCREMENT,
  name varchar(128) NOT NULL,
  age int(3)
);

CREATE TABLE teachers (
  id int(5) PRIMARY KEY AUTO_INCREMENT,
  name varchar(128) NOT NULL,
  age int(3)
);

CREATE TABLE competencies (
  id int(5) PRIMARY KEY AUTO_INCREMENT,
  title varchar(128) NOT NULL
);

CREATE TABLE teachers2competencies (
  id int(5) PRIMARY KEY AUTO_INCREMENT,
  teacher_id int(5),
  competencies_id int(5)
);

CREATE TABLE courses (
  id int(5) PRIMARY KEY AUTO_INCREMENT,
  teacher_id int(5),
  title varchar(128) NOT NULL,
  headman_id int(5)
);

CREATE TABLE students2courses (
  id int(5) PRIMARY KEY AUTO_INCREMENT,
  student_id int(5),
  course_id int(5)
);

INSERT INTO students (name, age) VALUES
	('Анатолий', 29),
	('Олег', 25),
	('Семен', 27),
	('Олеся', 28),
	('Ольга', 31),
	('Иван', 22);

INSERT INTO teachers (name, age) VALUES
	('Петр', 39),
	('Максим', 35),
	('Антон', 37),
	('Всеволод', 38),
	('Егор', 41),
	('Светлана', 32);

INSERT INTO competencies (title) VALUES
	('Математика'),
	('Информатика'),
	('Программирование'),
	('Графика');

INSERT INTO teachers2competencies (teacher_id, competencies_id) VALUES
	(1, 1),
	(2, 1),
	(2, 3),
	(3, 2),
	(4, 1),
	(5, 3);

INSERT INTO courses (teacher_id, title, headman_id) VALUES
	(1, 'Алгебра логики', 2),
	(2, 'Математическая статистика', 3),
	(4, 'Высшая математика', 5),
	(5, 'Javascript', 1),
	(5, 'Базовый Python', 1);

INSERT INTO students2courses (student_id, course_id) VALUES
	(1, 1),
	(2, 1),
	(3, 2),
	(3, 3),
	(4, 5);

-- 1) Вывести имена студентов и курсы, которые они проходят
SELECT 
    s.name, c.title
FROM
    students s
        JOIN
    students2courses s2c ON s.id = s2c.student_id
        JOIN
    courses c ON s2c.course_id = c.id;

-- 2) Вывести имена всех преподавателей с их компетенциями
SELECT 
    t.name, c.title
FROM
    teachers t
        JOIN
    teachers2competencies t2c ON t.id = t2c.teacher_id
        JOIN
    competencies c ON c.id = t2c.competencies_id
ORDER BY t.id;

-- 3) Найти преподавателя, у которого нет компетенций
SELECT 
    t.id, t.name
FROM
    teachers t
        LEFT JOIN
    teachers2competencies t2c ON t.id = t2c.teacher_id
WHERE
    t2c.id IS NULL;

-- 4) Найти имена студентов, которые не проходят ни один курс
SELECT 
    s.id, s.name
FROM
    students s
        LEFT JOIN
    students2courses s2c ON s.id = s2c.student_id
WHERE
    s2c.id IS NULL;

-- 5) Найти курсы, которые не посещает ни один студент
SELECT 
    c.title
FROM
    courses c
        LEFT JOIN
    students2courses s2c ON c.id = s2c.course_id
WHERE
    s2c.id IS NULL;

-- 6) Найти компетенции, которых нет ни у одного преподавателя
SELECT 
    c.id, c.title
FROM
    competencies c
        LEFT JOIN
    teachers2competencies t2c ON c.id = t2c.competencies_id
WHERE
    t2c.id IS NULL;

-- 7) Вывести название курса и имя старосты
SELECT 
    c.title, s.name
FROM
    courses c
        JOIN
    students s ON c.headman_id = s.id;

-- 8) Вывести имя студента и имена старост, которые есть на курсах, которые он проходит
SELECT 
    s.name AS student_name, sh.name AS headman_name
FROM
    students s
        JOIN
    students2courses s2c ON s.id = s2c.student_id
        JOIN
    courses c ON c.id = s2c.course_id
        INNER JOIN
    students sh ON sh.id = c.headman_id;