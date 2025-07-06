-- 1️⃣ Create the Employees table
CREATE TABLE IF NOT EXISTS Employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    salary DECIMAL(10,2)
);

-- 2️⃣ Change delimiter to allow multi-statement blocks
DELIMITER $$

-- 3️⃣ Create a stored procedure to insert a new employee
CREATE PROCEDURE AddEmployee (
    IN emp_name VARCHAR(50),
    IN emp_salary DECIMAL(10,2)
)
BEGIN
    INSERT INTO Employees (name, salary) VALUES (emp_name, emp_salary);
END $$

-- 4️⃣ Create a function to calculate annual salary
CREATE FUNCTION CalculateAnnualSalary (
    monthly_salary DECIMAL(10,2)
) RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN monthly_salary * 12;
END $$

-- 5️⃣ Reset delimiter back to ;
DELIMITER ;

-- 6️⃣ Test the procedure
CALL AddEmployee('Alice', 6000.00);
CALL AddEmployee('Bob', 7000.00);
CALL AddEmployee('Charlie', 8000.00);

-- 7️⃣ Test the function using SELECT
SELECT id, name, salary, CalculateAnnualSalary(salary) AS AnnualSalary FROM Employees;
