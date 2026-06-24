-- Create Customer and Loans Tables.

CREATE TABLE Customers (
    CustomerID NUMBER PRIMARY KEY,
    CustomerName VARCHAR2(50),
    Age NUMBER,
    Balance NUMBER(10,2),
    IsVIP VARCHAR2(5) DEFAULT 'FALSE'
);

CREATE TABLE Loans (
    LoanID NUMBER PRIMARY KEY,
    CustomerID NUMBER,
    InterestRate NUMBER(5,2),
    DueDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Customers VALUES(101, 'Ramesh', 65, 15000, 'FALSE');
INSERT INTO Customers VALUES(102, 'Suresh', 45, 8000, 'FALSE');
INSERT INTO Customers VALUES(103, 'Priya', 70, 12000, 'FALSE');
INSERT INTO Customers VALUES(104, 'Anjali', 30, 5000, 'FALSE');
INSERT INTO Customers VALUES(105, 'Kiran', 62, 20000, 'FALSE');
COMMIT;

INSERT INTO Loans VALUES(201, 101, 10.5, SYSDATE + 15);
INSERT INTO Loans VALUES(202, 102, 11.0, SYSDATE + 45);
INSERT INTO Loans VALUES(203, 103, 9.5, SYSDATE + 20);
INSERT INTO Loans VALUES(204, 104, 12.0, SYSDATE + 10);
INSERT INTO Loans VALUES(205, 105, 10.0, SYSDATE + 25);
COMMIT;


-- Scenario - 1

DECLARE
    CURSOR customer_cursor IS
        SELECT c.CustomerID, c.CustomerName, l.LoanID, l.InterestRate
        FROM Customers c
        JOIN Loans l ON c.CustomerID = l.CustomerID
        WHERE c.Age > 60;

BEGIN
    FOR rec IN customer_cursor LOOP
        UPDATE Loans
        SET InterestRate = InterestRate - 1
        WHERE LoanID = rec.LoanID;
        DBMS_OUTPUT.PUT_LINE(
            '1% discount applied to Loan ID ' || rec.LoanID || ' of Customer ' || rec.CustomerName
        );
    END LOOP;
    COMMIT;
END;
/
SELECT * FROM Loans;


-- Scenario - 2

DECLARE
    CURSOR customer_cursor IS
        SELECT CustomerID, CustomerName, Balance FROM Customers;

BEGIN
    FOR rec IN customer_cursor LOOP
        IF rec.Balance > 10000 THEN
            UPDATE Customers
            SET IsVIP = 'TRUE'
            WHERE CustomerID = rec.CustomerID;
            DBMS_OUTPUT.PUT_LINE(rec.CustomerName || ' has been promoted to VIP.');
        END IF;
    END LOOP;
    COMMIT;
END;
/
SELECT CustomerID, CustomerName, Balance, IsVIP FROM Customers;


-- Scenario - 3


SET SERVEROUTPUT ON;

DECLARE
    CURSOR loan_cursor IS
        SELECT c.CustomerName, l.LoanID, l.DueDate
        FROM Customers c
        JOIN Loans l ON c.CustomerID = l.CustomerID
        WHERE l.DueDate BETWEEN SYSDATE AND SYSDATE + 30;

BEGIN
    FOR rec IN loan_cursor LOOP

        DBMS_OUTPUT.PUT_LINE('Reminder: Dear ' || rec.CustomerName || ', your Loan ID ' || rec.LoanID || ' is due on ' || TO_CHAR(rec.DueDate,'DD-MON-YYYY'));

    END LOOP;
END;
/
