select * from `tendai_data_analytics_file`.`default`.`employees_1` limit 100;


---Query 2: SELECT DISTINCT Statement- Write a SQL query to find all the unique departments in the employees table.
select Distinct department
From `tendai_data_analytics_file`.`default`.`employees_1`;

---Query 3:ORDER BY Statement Write a SQL query to retrieve all employees' first and last names, ordered by salary in descending order.
SELECT first_name,
       last_name,
       salary
FROM `tendai_data_analytics_file`.`default`.`employees_1`
ORDER BY salary DESC;

---Query 4: LIMIT Statement - Write a SQL query to retrieve the top 5 highest-paid employees
SELECT first_name,
       last_name,
       salary
FROM `tendai_data_analytics_file`.`default`.`employees_1`
ORDER BY salary DESC
LIMIT 5;

---Query 5. WHERE Statement -  Write a SQL query to find employees who work in the IT department
SELECT first_name,
       last_name,
       department
FROM `tendai_data_analytics_file`.`default`.`employees_1`
WHERE department = 'IT';

---Query 6.  AND Statement -  Write a SQL query to find employees who work in the Finance department AND have a salary greater than 58,000.

SELECT first_name,
       last_name,
       department,
       salary
FROM `tendai_data_analytics_file`.`default`.`employees_1`
WHERE department = 'Finance'
  AND salary > 58000;

---Query 7.  OR Statement -  Write a SQL query to find employees who work in the HR department OR the Marketing department.
SELECT first_name,
       last_name,
       department
FROM `tendai_data_analytics_file`.`default`.`employees_1`
WHERE department = 'HR'
   OR department = 'Marketing';

---Query 8.  NOT Statement - Write a SQL query to find employees who do not work in the IT department
SELECT first_name,
       last_name,
       department
FROM `tendai_data_analytics_file`.`default`.`employees_1`
WHERE department != 'IT';

---Query 9.  IN Statement -  Write a SQL query to find employees who are in the HR, IT, or Finance departments.
SELECT first_name,
       last_name,
       department
FROM `tendai_data_analytics_file`.`default`.`employees_1`
WHERE department IN ('HR', 'IT', 'Finance');

---Query 10.   Combining Conditions - Write a SQL query to find employees who are in the IT department, have a salary greater than 50,000, and are located in New York.
SELECT first_name,
      last_name,
      department,
      salary,
      city
FROM `tendai_data_analytics_file`.`default`.`employees_1`
WHERE department = 'IT'
  AND salary > 50000
  AND city = 'New York';

---Query Combining WHERE, AND, and ORDER BY - Write a SQL query to retrieve the first and last names of employees who work in the Finance or Marketing department, earn more than 52,000, and order the results by salary in descending order
SELECT first_name,
       last_name,
       department,
       salary
FROM `tendai_data_analytics_file`.`default`.`employees_1`
WHERE department IN ('Finance', 'Marketing')
  AND salary > 52000
ORDER BY salary DESC;

---Query 12.   Combining SELECT DISTINCT, WHERE, and IN - Write a SQL query to find all the unique cities where employees work, excluding those in the IT and HR departments
SELECT DISTINCT city,
                department
FROM `tendai_data_analytics_file`.`default`.`employees_1`
WHERE department NOT IN ('IT', 'HR');

---Query 13.  Combining WHERE, NOT, AND, and ORDER BY - Write a SQL query to retrieve employees who are NOT in the Finance department, have a salary greater than 50,000, and order the results by hire date in ascending order.
SELECT first_name,
       last_name,
       salary
FROM `tendai_data_analytics_file`.`default`.`employees_1`
WHERE department != 'Finance'
  AND salary > 50000
ORDER BY hire_date ASC;

---Query 14: Combining WHERE, OR, IN, and LIMIT - Write a SQL query to find the first 3 employees who work in either Chicago or Los Angeles and belong to the IT or Marketing department
SELECT first_name,
       last_name,
       city,
       department
FROM `workspace`.`default`.`employees`
WHERE city IN ('Chicago', 'Los Angeles')
AND Department IN ('IT', 'Marketing')
LIMIT 3;
