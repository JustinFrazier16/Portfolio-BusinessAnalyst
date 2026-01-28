-- Lab 4 - Part 1
CREATE SCHEMA IF NOT EXISTS csci5000lab4;

USE csci5000lab4;

-- Lab 4 - Part 2
CREATE TABLE Persons (

	PersonID		INT PRIMARY KEY,
	FirstName		VARCHAR(30),
	LastName		VARCHAR(35),
	Email			VARCHAR(50) UNIQUE

);

CREATE TABLE Addresses (

	AddressID		INT PRIMARY KEY,
	PersonID		INT,
    Street			VARCHAR(40),
    City			VARCHAR(25),
    State			CHAR(2),
    ZipCode			VARCHAR(7),
    
    FOREIGN KEY (PersonID) REFERENCES Persons(PersonID)

);

-- Lab 4 - Part 3
INSERT INTO Persons 
VALUES	(1, 'Justin', 'Frazier', 'FrazierJB@etsu.edu'),
		(2, 'Louie', 'Frasier', 'MyDogLouie@etsu.edu'),
        (3, 'Allie', 'Frazier', 'MyCatAllie@etsu.edu'),
        (4, 'Joe', 'Smores', 'JoeSmoe@etsu.edu'),
        (5, 'Tim', 'Hensen', 'HensenT@polyphia.com');
        
INSERT INTO Addresses
VALUES	(1, 1, '127 Justin Street', 'Piney Flats', 'TN', '37686'),
		(2, 2, '685 Dog Boulevard', 'Piney Flats', 'TN', '37686'),
        (3, 3, '73 AllieCat Rd', 'Bristol', 'TN', '37620'),
        (4, 4, '123 Smoe Rd', 'Somewhere', 'NY', '57624'),
        (5, 5, '1 Polyphia Ln', 'Los Angeles', 'CA', '90001');
        
-- Lab 4 - Part 4 - a
SELECT * 
FROM Persons;

SELECT *
FROM Addresses;

-- Lab 4 - Part 4 - b
UPDATE Persons
	SET LastName = 'Smoe'
    WHERE PersonID = 4;
    
UPDATE Persons
	SET LastName = 'Frazier'
    WHERE PersonID = 2;

-- Lab 4 - Part 4 - c
DELETE 
	FROM Addresses
    WHERE PersonID >= 4;

DELETE 
	FROM Addresses
    WHERE PersonID = 2;
-- Lab 4 - Part 4 - d
INSERT INTO Addresses 
VALUES	(4, 4, '123 Smoe Rd', 'Somewhere', 'NY', '57624'),
        (5, 5, '1 Polyphia Ln', 'Los Angeles', 'CA', '90001');
        
INSERT INTO Addresses 
VALUES	(2, 2, '685 Dog Boulevard', 'Piney Flats', 'TN', '37686');

-- Lab 4 - Part 4 - e
SELECT LastName, FirstName, Email
	FROM Persons
	WHERE LastName LIKE 'F%';
    
SELECT p.LastName, p.FirstName, a.Street, a.City
	FROM Persons p
	JOIN Addresses a on p.PersonID = a.PersonID
    WHERE a.ZipCode <= 37686;
    
SELECT FirstName, LastName
	FROM Persons
    WHERE PersonID > 1 AND PersonID < 5; 
    
-- Lab 4 - Part 4 - f
SELECT p.LastName, p.FirstName, a.Street, a.City, a.State, a.ZipCode
	FROM Persons p
	JOIN Addresses a on p.PersonID = a.PersonID
    ORDER BY a.ZipCode DESC, p.LastName, p.FirstName;
    
SELECT FirstName, LastName
	FROM Persons
    ORDER BY PersonID DESC;
    
SELECT p.FirstName, p.LastName, a.Street, a.City, a.State, p.Email
	FROM Persons p
    JOIN Addresses a ON p.PersonID = a.PersonID
    ORDER BY p.Email;
    



