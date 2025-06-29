
SELECT * FROM Error_Log ORDER BY LogTime DESC;

BEGIN
    SafeTransferFunds(p_from_acct => 1, p_to_acct => 2, p_amount => 3000);
END;

SELECT * FROM Error_Log ORDER BY LogTime DESC;

BEGIN
    SafeTransferFunds(p_from_acct => 1, p_to_acct => 2, p_amount => 500);
END;

SELECT AccountID, Balance FROM Accounts WHERE AccountID IN (1, 2);

BEGIN
    UpdateSalary(4, 10);  
END;

SELECT * FROM Error_Log ORDER BY LogTime DESC;

BEGIN
    UpdateSalary(2, 10);  
END;

SELECT EmployeeID, Salary FROM Employees WHERE EmployeeID = 2;

BEGIN
    AddNewCustomer(3, 'Divyanshu', TO_DATE('1990-01-01', 'YYYY-MM-DD'), 2500);
END;

SELECT * FROM Error_Log ORDER BY LogTime DESC;

BEGIN
    AddNewCustomer(5, 'Abdul', TO_DATE('1980-04-01', 'YYYY-MM-DD'), 2500);
END;

SELECT * FROM Customers WHERE CustomerID = 5;