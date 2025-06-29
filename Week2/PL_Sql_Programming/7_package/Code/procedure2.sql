CREATE OR REPLACE PACKAGE EmployeeManagement AS
    PROCEDURE HireEmployee(p_id NUMBER, p_name VARCHAR2, p_position VARCHAR2, p_salary NUMBER, p_dept VARCHAR2);
    PROCEDURE UpdateEmployee(p_id NUMBER, p_salary NUMBER);
    FUNCTION CalculateAnnualSalary(p_id NUMBER) RETURN NUMBER;
END EmployeeManagement;
/

CREATE OR REPLACE PACKAGE BODY EmployeeManagement AS

    PROCEDURE HireEmployee(p_id NUMBER, p_name VARCHAR2, p_position VARCHAR2, p_salary NUMBER, p_dept VARCHAR2) IS
    BEGIN
        INSERT INTO Employees(EmployeeID, Name, Position, Salary, Department, HireDate)
        VALUES(p_id, p_name, p_position, p_salary, p_dept, SYSDATE);
    END;

    PROCEDURE UpdateEmployee(p_id NUMBER, p_salary NUMBER) IS
    BEGIN
        UPDATE Employees SET Salary = p_salary WHERE EmployeeID = p_id;
    END;

    FUNCTION CalculateAnnualSalary(p_id NUMBER) RETURN NUMBER IS
        annual_salary NUMBER;
    BEGIN
        SELECT Salary * 12 INTO annual_salary FROM Employees WHERE EmployeeID = p_id;
        RETURN annual_salary;
    END;

END EmployeeManagement;
/
