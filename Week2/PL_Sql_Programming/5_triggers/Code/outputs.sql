SELECT * FROM Customers WHERE CustomerID = 1;

UPDATE Customers SET Name = 'Divyanshu Thakur' WHERE CustomerID = 1;

SELECT LastModified FROM Customers WHERE CustomerID = 1;

INSERT INTO Transactions (TransactionID, AccountID, TransactionDate, Amount, TransactionType)
VALUES (4, 1, SYSDATE, 500, 'DEPOSIT');

SELECT * FROM AuditLog WHERE TransactionID = 4;

INSERT INTO Transactions (TransactionID, AccountID, TransactionDate, Amount, TransactionType)
VALUES (5, 1, SYSDATE, 1000, 'DEPOSIT');

INSERT INTO Transactions (TransactionID, AccountID, TransactionDate, Amount, TransactionType)
VALUES (6, 1, SYSDATE, 999999, 'WITHDRAWAL');
