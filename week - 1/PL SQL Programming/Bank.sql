CREATE DATABASE Bank;
use Bank;

CREATE TABLE Customers (CustID INT PRIMARY KEY, CustName VARCHAR(50), Age INT, Balance DECIMAL(10,2), IsVIP VARCHAR(5));

CREATE TABLE Loans (LoanID INT PRIMARY KEY, CustID INT, InterestRate DECIMAL(5,2), DueDate DATE, FOREIGN KEY (CustID) REFERENCES Customers(CustID));

INSERT INTO Customers VALUES (1, 'John', 65, 15000, FALSE);
INSERT INTO Customers VALUES (2, 'Alice', 45, 8000, FALSE);
INSERT INTO Customers VALUES (3, 'Bob', 70, 20000, FALSE);
INSERT INTO Customers VALUES (4, 'David', 55, 12000, FALSE);

INSERT INTO Loans VALUES (101, 1, 10.0, CURDATE() + INTERVAL 15 DAY);
INSERT INTO Loans VALUES (102, 2, 12.0, CURDATE() + INTERVAL 45 DAY);
INSERT INTO Loans VALUES (103, 3, 9.0, CURDATE() + INTERVAL 20 DAY);
INSERT INTO Loans VALUES (104, 4, 11.0, CURDATE() + INTERVAL 10 DAY);

SELECT * FROM Customers;
SELECT * FROM Loans;

-- Scenario-1

DECLARE
    CURSOR c IS
        SELECT CustID FROM Customers WHERE Age > 60;
BEGIN
    FOR rec IN c LOOP
        UPDATE Loans SET InterestRate = InterestRate - 1 WHERE CustID = rec.CustID;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Discount Applied');
END;
/

SELECT * FROM Loans;

-- Scenario-2

DECLARE
    CURSOR c IS
        SELECT CustID
        FROM Customers;
BEGIN
    FOR rec IN c LOOP
        UPDATE Customers
        SET IsVIP = TRUE
        WHERE CustID = rec.CustID
        AND Balance > 10000;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('VIP Status Updated');
END;
/

SELECT * FROM Customers;

-- Scenario-3

DECLARE
    CURSOR c IS
        SELECT cu.Name,
               l.LoanID,
               l.DueDate
        FROM Customers cu
        JOIN Loans l
        ON cu.CustID = l.CustID
        WHERE l.DueDate <= SYSDATE + 30;
BEGIN
    FOR rec IN c LOOP
        DBMS_OUTPUT.PUT_LINE(
            'Reminder: ' ||
            rec.Name ||
            ' Loan ID ' ||
            rec.LoanID ||
            ' due on ' ||
            rec.DueDate
        );
    END LOOP;
END;
/

SELECT * FROM Customers;
SELECT * FROM Loans;