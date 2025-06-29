CREATE OR REPLACE FUNCTION CalculateMonthlyInstallmentFromLoan(p_loan_id IN NUMBER)
RETURN NUMBER
IS
    v_amount       NUMBER;
    v_rate         NUMBER;
    v_years        NUMBER;
    v_monthly_rate NUMBER;
    v_months       NUMBER;
    v_emi          NUMBER;
BEGIN
    SELECT LoanAmount, InterestRate, MONTHS_BETWEEN(EndDate, StartDate)/12
    INTO v_amount, v_rate, v_years
    FROM Loans
    WHERE LoanID = p_loan_id;

    v_monthly_rate := v_rate / (12 * 100);
    v_months := v_years * 12;

    v_emi := (v_amount * v_monthly_rate * POWER(1 + v_monthly_rate, v_months)) /
             (POWER(1 + v_monthly_rate, v_months) - 1);

    RETURN ROUND(v_emi, 2);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
END;
/
