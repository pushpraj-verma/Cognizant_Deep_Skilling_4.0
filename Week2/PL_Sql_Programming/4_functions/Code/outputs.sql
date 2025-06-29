SELECT CalculateAge(1) AS Age FROM DUAL;

SELECT CalculateMonthlyInstallmentFromLoan(1) AS EMI FROM DUAL;

DECLARE
    result BOOLEAN;
BEGIN
    result := HasSufficientBalance(1, 500);
    IF result THEN
        DBMS_OUTPUT.PUT_LINE('Sufficient balance');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Insufficient balance');
    END IF;
END;
/
