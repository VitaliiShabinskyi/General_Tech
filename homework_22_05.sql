USE hr;

-- 1. Найти департаменты в которых есть работники, зарабатывающие больше 10 000. 
-- В результате выборки формируются два поля (department_id и поле со значениями 1 или 0) 
-- (использовать оператор max)
SELECT 
    department_id, salary
FROM
    employees
WHERE
    salary > 10000;
    
SELECT 
    department_id,
    CASE
        WHEN salary > 10000 THEN 1
        ELSE 0
    END AS isRich
FROM
    employees;
    
SELECT 
    department_id,
    MAX(CASE
        WHEN salary > 10000 THEN 1
        ELSE 0
    END) AS isRich
FROM
    employees;

-- 2. Найти департаменты в которых все работники зарабатывают больше 10 000. 
-- В результате выборки формируются два поля (department_id и поле со значениями 1 или 0)
-- (использовать оператор min)
select department_id, salary from employees order by department_id;
select department_id, salary from employees where salary > 10000 order by department_id;

SELECT 
    department_id,
    MIN(CASE
        WHEN salary > 10000 THEN 1
        ELSE 0
    END) AS min
FROM
    employees
WHERE
    department_id IN (SELECT 
            department_id
        FROM
            employees
        WHERE
            salary > 10000
        HAVING COUNT(*) > 0)
ORDER BY department_id;
        
-- 3. Своими словами написать за что отвечают два эти оператора
-- MIN - находит минимальное значение выборки
-- MAX - находит максимальное значение выборки