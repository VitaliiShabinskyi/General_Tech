USE w3schools;

-- Определить, сколько покупок было совершено в каждый месяц.
-- Отсортировать строки в порядке возрастания количества покупок.
-- Вывести два поля - номер месяца и количество покупок
SELECT 
    MONTH(OrderDate) AS month, COUNT(*) AS sales_count
FROM
    orders
GROUP BY month
ORDER BY sales_count DESC;

-- Определить, в какой месяц было совершено больше всего покупок. 
-- Вывести два поля - номер месяца и количество покупок
SELECT 
    MONTH(OrderDate) AS month, COUNT(*) AS sales_count
FROM
    orders
GROUP BY month
ORDER BY sales_count DESC
LIMIT 1;


USE hr;

-- Найти среднюю зарплату по компании
SELECT 
    ROUND(AVG(salary), 2)
FROM
    employees;
    
-- Найти общее количество департаментов
SELECT DISTINCT
    COUNT(department_id)
FROM
    departments;

-- Найти количество департаментов, в которых никто не работает
SELECT 
    COUNT(department_id)
FROM
    departments
WHERE
    department_id NOT IN (SELECT 
            department_id
        FROM
            employees);

-- Найти среднюю зарплату в департаменте с id 90
SELECT 
    AVG(salary)
FROM
    employees
WHERE
    department_id = 90;

-- Найти самую большую зарплату среди сотрудников, работающих в департаментах с id 70 и 80
SELECT 
    ROUND(AVG(salary), 2)
FROM
    employees
WHERE
    department_id IN (70 , 80);