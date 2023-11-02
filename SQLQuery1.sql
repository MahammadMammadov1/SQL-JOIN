
/* ONE TO ONE */

CREATE DATABASE TrendyolEx;
USE TrendyolEx;

CREATE TABLE Customer(
  ID INT PRIMARY KEY IDENTITY(1,1),
  Name NVARCHAR(200),
  Surname NVARCHAR(200)
);

CREATE TABLE Orders(
  OrderID INT PRIMARY KEY IDENTITY(1,1),
  OrderName NVARCHAR(200),
  CustomerId INT UNIQUE FOREIGN KEY REFERENCES Customer(ID)
);

SELECT * FROM Customer;
SELECT * FROM Orders;

INSERT INTO Customer  VALUES
('Mehemmed', 'Memmedov'),
('Eli', 'Eliyev'),
('Hesen', 'Sadiqov')

INSERT INTO Orders  VALUES
('Paltar', 1),
('Ayaqqabbi', 2),
('kastyum', 3)



/* ONE TO MANY */

CREATE DATABASE Human;
USE Human;
CREATE TABLE Person (
    PersonID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(200),
    Surname NVARCHAR(200),
	Age INT 
)
CREATE TABLE Passport (
    PassportID INT PRIMARY KEY IDENTITY(1,1),
    PassportCountry NVARCHAR(20),
    PersonID INT FOREIGN KEY REFERENCES Person(PersonID)
)


SELECT * FROM Person;
SELECT * FROM Passport;

INSERT INTO Person  VALUES
('Mehemmed', 'Memmedov',19),
('Eli', 'Eliyev',24),
('Hesen', 'Sadiqov',34)

INSERT INTO Passport  VALUES
('UNITED STATE', 1),
('TURKEY',1),
('AZERBAIJAN',1),
('NIGERIA', 2),
('RUSSIA',2),
('UKRAINE',2),
('NORWAY',3),
('CANADA',3)

INSERT INTO Passport  VALUES
('ISRAEL', NULL)

INSERT INTO Person  VALUES
('KAMIL', 'ELIYEV',19)


SELECT * FROM Person
INNER JOIN Passport
ON Person.PersonID = Passport.PersonID

SELECT * FROM Person
RIGHT JOIN Passport
ON Person.PersonID = Passport.PersonID

SELECT * FROM Person
LEFT JOIN Passport
ON Person.PersonID = Passport.PersonID

SELECT * FROM Person
FULL JOIN Passport
ON Person.PersonID = Passport.PersonID

SELECT * FROM Person
CROSS JOIN Passport

SELECT * FROM Person
JOIN Passport
ON Passport.PassportCountry = 'AZERBAIJAN' AND Person.Age = 19