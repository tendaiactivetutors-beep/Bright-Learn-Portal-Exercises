select * from `workspace`.`default`.`employees` limit 100;

---Query 1: COUNT() Function - Write a SQL query to find the total number of employees in the company.
SELECT COUNT(*) AS total_employees
FROM `workspace`.`default`.`employees`;


---Query 2: SUM() Function - Write a SQL query to find the total salary paid to all employees in the IT department.

SELECT SUM(salary) AS total_salary
FROM  `workspace`.`default`.`employees`
WHERE department = 'IT';


---Query 3. AVG() Function - Write a SQL query to calculate the average salary of employees in the HR department.
SELECT AVG(salary) AS average_salary
FROM `workspace`.`default`.`employees`
WHERE department = 'HR';


--- Query 4. MIN() and MAX() Functions- Write a SQL query to find the highest and lowest salary in the company
SELECT MAX(salary) AS highest_salary,
    MIN(salary) AS lowest_salary
FROM `workspace`.`default`.`employees`;

---Query 5: GROUP BY Statement - Write a SQL query to group employees by department and display the total salary paid in each department.
SELECT  department,
    SUM(salary) AS total_salary
FROM `workspace`.`default`.`employees`
GROUP BY department;

---Query 6: GROUP BY and COUNT()  - Write a SQL query to count how many employees work in each city.
SELECT city,
    COUNT(*) AS employee_count
FROM `workspace`.`default`.`employees`
GROUP BY city;

---Query 7: GROUP BY and ORDER BY - Write a SQL query to group employees by department, calculate the average salary in each department, and order the results in descending order of average salary   

SELECT department,
    AVG(salary) AS average_salary
FROM `workspace`.`default`.`employees`
GROUP BY department
ORDER BY average_salary DESC;

---Query 8: HAVING Clause - Write a SQL query to find departments where the total salary paid exceeds 100,000. (Use GROUP BY and HAVING)

SELECT department,
    SUM(salary) AS total_salary
FROM `workspace`.`default`.`employees`
GROUP BY department
HAVING SUM(salary) > 100000;


---Query 9: Combining GROUP BY, HAVING, and ORDER BY - Write a SQL query to list cities where more than one employee works, ordered by the number of employees in descending order.
SELECT city,
    COUNT(*) AS employee_count
FROM `workspace`.`default`.`employees`
GROUP BY city
HAVING COUNT(*) > 1
ORDER BY employee_count DESC;

---Query 10 - Combining Aggregate Functions - Write a SQL query to find the department with the highest average salary  
SELECT department,
    AVG(salary) AS average_salary
FROM `workspace`.`default`.`employees`
GROUP BY department
ORDER BY average_salary DESC :param_1
LIMIT 1;
