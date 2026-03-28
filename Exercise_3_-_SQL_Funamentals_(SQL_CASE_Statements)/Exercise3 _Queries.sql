select * from `workspace`.`default`.`products` limit 100;


----Query 1: Classify each product by price:
'Expensive' if price > 1000
'Mid-range' if price between 100 and 1000
'Budget' if price < 100

Select product_name,price,
 CASE
   WHEN price >1000 THEN 'Expensive'
   WHEN price BETWEEN 100 AND 1000 THEN 'Mid_Range'
   WHEN price <100 THEN 'Budget'
 END AS product_category
From `workspace`.`default`.`products`;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----Query 2: Label each order:
'High Value' for orders ≥ 1000
'Medium Value' for 500–999.99
'Low Value' for orders < 500

Select customer_name, amount,
  CASE
     WHEN amount >=1000 THEN 'High_Value'
     when amount BETWEEN 500 AND 999.00 THEN 'Medium_Value'
     ELSE 'Low_Value'
    END AS Order_value_category
  From `workspace`.`default`.`orders`;


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

---Query 3: Categorize employee position:
If in 'IT' and salary > 80000 → 'Senior IT'
If in 'HR' and salary > 55000 → 'Experienced HR'
Otherwise → 'Staff'

Select emp_name,department,salary,
 CASE 
   WHEN department ='IT' AND salary >80000 THEN 'Senior IT'
   WHEN department = 'HR' AND salary >55000 THEN 'Experienced HR'
   ELSE 'Staff'
 END AS position_level
From `workspace`.`default`.`Empoyees3`;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

---Query 4. Assign a letter grade:
 ≥ 90: 'A'
 80_89: 'B'
 70_79: 'C'
 60_69: 'D'
< 60: 'F'

SELECT student_name,score,
    CASE
        WHEN score >= 90 THEN 'A'
        WHEN score >= 80 THEN 'B'
        WHEN score >= 70 THEN 'C'
        WHEN score >= 60 THEN 'D'
        ELSE 'F'
    END AS grade
FROM `workspace`.`default`.`students`;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

---Query 5: Label delivery performance:
 ≤ 30 mins: 'Fast'
 31_60 mins: 'On Time'
 60 mins: 'Late'

SELECT delivery_id, delivery_time_minutes,
    CASE
        WHEN delivery_time_minutes <= 30 THEN 'Fast'
        WHEN delivery_time_minutes <= 60 THEN 'On Time'
        ELSE 'Late'
    END AS performance
FROM `workspace`.`default`.`deliveries`;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Query 6: Convert priority to labels:
 3 → 'High'
 2 → 'Medium'
 1 → 'Low'

SELECT issue_type,priority,
    CASE
        WHEN priority = 3 THEN 'High'
        WHEN priority = 2 THEN 'Medium'
        WHEN priority = 1 THEN 'Low'
        ELSE 'Unknown'
    END AS priority_label
FROM `workspace`.`default`.`tickets`;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

---Query 7. Calculate attendance % and classify:
 ≥ 90% → 'Excellent'
 75_89% → 'Good'
< 75% → 'Needs Improvement'

SELECT  student_id, (days_present * 100.0 / total_days) AS attendance_percentage,
    CASE
        WHEN (days_present * 100.0 / total_days) >= 90 THEN 'Excellent'
        WHEN (days_present * 100.0 / total_days) >= 75 THEN 'Good'
        ELSE 'Needs Improvement'
    END AS attendance_status
FROM `workspace`.`default`.`attendance`;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---Query 8: Label stock status:
 0 → 'Out of Stock'
 1_5 → 'Low Stock'
 5 → 'In Stock'

 SELECT product_id,stock_qty,
    CASE
        WHEN stock_qty = 0 THEN 'Out of Stock'
        WHEN stock_qty BETWEEN 1 AND 4 THEN 'Low Stock'
        ELSE 'In Stock'
    END AS stock_status
FROM `workspace`.`default`.`products_inventory`;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

---Query 9. Classify by size:
 ≥ 25 → 'Large'
 10_24 → 'Medium'
 < 10 → 'Small'

SELECT subject,enrolled_students,
    CASE
        WHEN enrolled_students >= 25 THEN 'Large'
        WHEN enrolled_students BETWEEN 10 AND 24 THEN 'Medium'
        ELSE 'Small'
    END AS class_size_category
FROM `workspace`.`default`.`classes`;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

---Query 10: Apply discount flag:
 If payment_method = 'Cash' and amount ≥ 200 → 'Eligible for Discount'
 Otherwise → 'Not Eligible'

 SELECT payment_id,payment_method,amount,
    CASE
        WHEN payment_method = 'Cash' AND amount >= 200 THEN 'Eligible for Discount'
        ELSE 'Not Eligible'
    END AS discount_eligibility
FROM `workspace`.`default`.`payments`;
