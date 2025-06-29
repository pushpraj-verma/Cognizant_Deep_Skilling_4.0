
CREATE OR REPLACE PROCEDURE UpdateSalary(
    p_emp_id IN NUMBER,
    p_percent IN NUMBER
)
IS
    v_error_msg VARCHAR2(4000);
BEGIN

    UPDATE Employees
    SET Salary = Salary + (Salary * p_percent / 100)
    WHERE EmployeeID = p_emp_id;

    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'Employee ID not found.');
    END IF;

    COMMIT;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        v_error_msg := 'UpdateSalary Error: ' || SQLERRM;
        INSERT INTO Error_Log(ErrorMessage, LogTime) 
        VALUES (v_error_msg, SYSDATE);
END;

