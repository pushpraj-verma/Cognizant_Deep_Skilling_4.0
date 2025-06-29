DECLARE
    CURSOR loan_cursor IS
        SELECT LoanID, InterestRate FROM Loans;

    increment CONSTANT NUMBER := 0.5;
BEGIN
    FOR loan IN loan_cursor LOOP
        UPDATE Loans
        SET InterestRate = loan.InterestRate + increment
        WHERE LoanID = loan.LoanID;

        DBMS_OUTPUT.PUT_LINE('Interest rate updated for Loan ID: ' || loan.LoanID);
    END LOOP;

    COMMIT;
END;
/
