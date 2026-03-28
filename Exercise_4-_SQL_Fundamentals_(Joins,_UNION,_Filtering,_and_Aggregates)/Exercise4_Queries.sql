select * from `workspace`.`default`.`employees_1` limit 100;

--- Query 1.1: Retrieve all employees and their assigned projects using an INNER JOIN.
Select A.EmployeeID, A.FirstName, A.LastName, A.Department, A.Salary, B.ProjectID, B.ProjectName, B.Budget, B.Status
From `workspace`.`default`.`employees_1` AS A
INNER JOIN `workspace`.`default`.`projects` AS B
ON A.EmployeeID = B.EmployeeID;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---Query 1.2: Retrieve all employees and their assigned projects, including employees who have no projects using a LEFT JOIN
Select A.EmployeeID, A.FirstName, A.LastName, A.Department, A.Salary, B.ProjectID, B.ProjectName, B.Budget, B.Status
From `workspace`.`default`.`employees_1` AS A
LEFT JOIN `workspace`.`default`.`projects` AS B
ON A.EmployeeID = B.EmployeeID;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------

---Query 1.3: Retrieve all projects and their assigned employees, including projects that have no employees using a RIGHT JOIN.
Select B.ProjectID, B.ProjectName, B.Budget, B.Status, B.EmployeeID, A.FirstName, A.LastName, A.Department, A.Salary
From `workspace`.`default`.`employees_1`AS A
RIGHT JOIN `workspace`.`default`.`projects` AS B
ON A.EmployeeID = B.EmployeeID;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------

---Query 1.4: Retrieve all employees and projects, including those without a match in either table using a FULL OUTER JOIN.

Select A.EmployeeID, A.FirstName, A.LastName, A.Department, A.Salary, B.ProjectID, B.ProjectName, B.Budget, B.Status
From `workspace`.`default`.`employees_1`AS A
FULL OUTER JOIN `workspace`.`default`.`projects` AS B
ON A.EmployeeID = B.EmployeeID;

--------------------------------------------------------------------------------------------------------------- 
---2. UNION & UNION ALL
---1.5 Retrieve a list of all unique cities where employees are located and project statuses.
SELECT DISTINCT City AS value, 'City' AS Location
FROM `workspace`.`default`.`employees_1`
UNION
SELECT DISTINCT Status AS value, 'Status' AS Progress
FROM `workspace`.`default`.`projects`;

---------------------------------------------------------------------------------------------------------------
-----Query 1.6: Retrieve a list of all cities where employees are located and project statuses, allowing duplicates.

SELECT City AS value, 'City' AS category
FROM  `workspace`.`default`.`employees_1`

UNION ALL

SELECT Status AS value, 'Status' AS category
FROM `workspace`.`default`.`projects`;

--------------------------------------------------------------------------------------------------------------

---3. Filtering Statements
---Query 1.7: Retrieve employees who earn more than 70,000.
SELECT EmployeeID, FirstName, LastName, Department, Salary
FROM `workspace`.`default`.`employees_1`
WHERE Salary > 70000;

---------------------------------------------------------------------------------------------------------------

---Query 1.8: Retrieve employees working in either IT or Finance departments.

 Select EmployeeID, FirstName, LastName, Department, Salary
From `workspace`.`default`.`employees_1`
Where Department IN ('IT', 'Finance');

---------------------------------------------------------------------------------------------------------------

---query 9: Retrieve projects that are not yet completed
Select ProjectID, ProjectName, Budget, Status
From `workspace`.`default`.`projects`
Where Status <> 'Completed';

---------------------------------------------------------------------------------------------------------------
---Query 10: Retrieve projects that have a budget greater than 70,000 and are not completed.

Select ProjectID, ProjectName, Budget, Status
From `workspace`.`default`.`projects`
Where Budget > 70000
AND Status <> 'Completed';

---------------------------------------------------------------------------------------------------------------

---Query 11. Retrieve employees from New York OR Toronto, ordered by salary in descending order.

Select EmployeeID, FirstName, LastName, Department, Salary, City
From `workspace`.`default`.`employees_1`
Where City IN ('New York','Toronto')
ORDER BY Salary DESC;

---------------------------------------------------------------------------------------------------------------
---Query 12:Retrieve the top 3 highest-paid employees
Select EmployeeID, FirstName, LastName, Department, Salary
From `workspace`.`default`.`employees_1`
ORDER BY Salary DESC
LIMIT 3;

--------------------------------------------------------------------------------------------------------------
---4. Aggregate Functions with GROUP BY & HAVING
---Query 13: Find the total salary per department, sorted in descending order.
Select Department, SUM(Salary) as Total_Salary
From `workspace`.`default`.`employees_1`
GROUP BY Department
ORDER BY Total_Salary DESC;

--------------------------------------------------------------------------------------------------------------
---Query 14: Find the average salary per city, but only include cities where the average salary is greater than 65,000

Select City, AVG(Salary) as Average_Salary
From `workspace`.`default`.`employees_1`
GROUP BY City
HAVING AVG(Salary) > 65000;

--------------------------------------------------------------------------------------------------------------
---Query 15: Count the number of employees per department, including only departments with more than 1 employee.

Select Department, COUNT(EmployeeID) as Employee_Count
From `workspace`.`default`.`employees_1`
GROUP BY Department
HAVING COUNT(EmployeeID) >1;

--------------------------------------------------------------------------------------------------------------
---Query 16: Retrieve the number of projects per status, but only include statuses with at least 2 projects.

Select Status,COUNT(ProjectID) as ProjectCount
From `workspace`.`default`.`projects`
GROUP BY Status
HAVING COUNT(ProjectID) >=2;

--------------------------------------------------------------------------------------------------------------
---Query 17: Retrieve the total project budget per employee, but only for employees who are managing projects worth more than 150,000
Select A.EmployeeID, FirstName, LastName, SUM(Budget) as Total_Project_Budget
From `workspace`.`default`.`employees_1` AS A
JOIN `workspace`.`default`.`projects` AS B
ON A.EmployeeID = B.EmployeeID
GROUP BY A.EmployeeID, A.FirstName, A.LastName
HAVING SUM(B.Budget) > 150000;
