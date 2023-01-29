/*Створити таблицю workers:
- id
- name
- salary,
- birthday

1. Додайте робітника з ім'ям Олег, з/п 300
2. Додайте робітницю Ярославу, з/п 350
3. Додайте двох нових працівників одним запитом - 
    Сашу, з/п 1000
    Машу, з/п 200
4. Встановити Олегу з/п 500
5. Всім, у кого з/п більше 500, врізати з/п до 400
6. Вибрати всіх робітників, чия з/п більше 400
7. Вибрати робітника з id = 4
8. Дізнатися з/п та вік Жені
9. Знайти робітника з ім'ям "Petya"
10. Вибрати робітників у віці 27 років або з з/п > 800
11. Вибрати всіх робітників у віці від 25 до 28 років
12. Вибрати всіх співробітників, що народились у вересні
13. Видалити робітника з id = 4
14. Видалити Олега
15. Видалити всіх робітників старших за 30 років*/

DROP TABLE workers;

CREATE TABLE workers(
    id serial PRIMARY KEY,
    name varchar(256) NOT NULL CHECK (name != ''),
    salary int NOT NULL CHECK (salary > 0),
    birthday int NOT NULL CHECK (salary >= 0)
);

INSERT INTO workers (name, salary, birthday) VALUES
('Олег', 300, 1992);

INSERT INTO workers (name, salary, birthday) VALUES
('Ярослава', 350, 1995);

INSERT INTO workers (name, salary, birthday) VALUES
('Саша', 1000, 1998),
('Маша', 200, 1990);

UPDATE workers
SET salary = 500;

SELECT * FROM workers
WHERE salary >= 400 AND salary <= 1000;

SELECT * FROM workers
WHERE id = 4;

INSERT INTO workers (name, salary, birthday) VALUES
('Женя', 400, 1995);

ALTER TABLE workers
ADD COLUMN age int CHECK (age >=0);

UPDATE workers
SET age = 28
WHERE id = 5;

INSERT INTO workers (name, salary, birthday) VALUES
('Petya', 450, 2001);

SELECT age, avg(age) FROM workers       /*Средний возраст*/
GROUP BY id;

SELECT first_name, last_name, birthday, extract('years' from age(birthday)) FROM users
WHERE extract('years' from age(birthday)) BETWEEN 25 AND 28;

SELECT * FROM users
WHERE extract('month' from birthday) = 9;