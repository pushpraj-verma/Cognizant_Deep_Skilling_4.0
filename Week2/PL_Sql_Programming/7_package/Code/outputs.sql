BEGIN
    CustomerManagement.AddCustomer(10, 'Alice', TO_DATE('1995-06-01', 'YYYY-MM-DD'), 5000);
END;
/

SELECT * FROM Customers WHERE CustomerID = 10;

BEGIN
    CustomerManagement.UpdateCustomer(10, 'Alice Thakur', TO_DATE('1995-06-01', 'YYYY-MM-DD'));
END;
/

SELECT * FROM Customers WHERE CustomerID = 10;

DECLARE
    bal NUMBER;
BEGIN
    bal := CustomerManagement.GetCustomerBalance(1);
    DBMS_OUTPUT.PUT_LINE('Customer Balance: ' || bal);
END;
/


BEGIN
    EmployeeManagement.HireEmployee(10, 'Arijit', 'Manager', 60000, 'Finance');
END;
/

SELECT * FROM Employees WHERE EmployeeID = 10;

BEGIN
    EmployeeManagement.UpdateEmployee(10, 6500);
END;
/

SELECT * FROM Employees WHERE EmployeeID = 10;

DECLARE
    annual NUMBER;
BEGIN
    annual := EmployeeManagement.CalculateAnnualSalary(101);
    DBMS_OUTPUT.PUT_LINE('Annual Salary: ' || annual);
END;
/

BEGIN
    AccountOperations.OpenAccount(10, 1, 'SAVINGS', 10000);
END;
/

SELECT * FROM Accounts WHERE AccountID = 10;

BEGIN
    AccountOperations.CloseAccount(10);
END;
/

SELECT * FROM Accounts WHERE AccountID = 2001;


DECLARE
    total NUMBER;
BEGIN
    total := AccountOperations.GetTotalBalance(1);
    DBMS_OUTPUT.PUT_LINE('Total Balance: ' || total);
END;
/
