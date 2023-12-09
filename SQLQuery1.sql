CREATE DATABASE Sale
GO

USE Sale

CREATE TABLE Users(
ID int IDENTITY PRIMARY KEY,
FirstName nvarchar(50),
LastName nvarchar(50),
Email nvarchar(50) UNIQUE,
[Password] nvarchar(30),
IsActive bit
)

INSERT INTO Users VALUES
('Khalil','Kheyrulla','khalil@gmail.com','ASDasdasdasd_213',1),
('Ali','Khalil','ali@gmail.com','Prodsyta12',1),
('Behram','Abdulov','behram@gmail.com','beatssidiiuf',0),
('Mehman','Ramazonov','mako@code.edu.az','Makomano666',1),
('Vahid','Vahidli','vahid@code.edu.az','tarttaiue510',1),
('Rufet','Babayev','babayev@code.edu.az','Rusiudoofh_3456',0),
('Nemet','Nemtli','nemo@gmail.com','Rastorai_666',1)

CREATE TABLE UserDetails(
ID int IDENTITY PRIMARY KEY,
UserID int NOT NULL UNIQUE FOREIGN KEY REFERENCES Users(ID),
PhoneNumber nvarchar (20),
Address nvarchar(50)
)

INSERT INTO UserDetails VALUES
(2, '055-259-25-46', 'Baki s, Eliyev street'),
(4, '055-818-55-66', 'Gence s, Eliyev street'),
(1, '050-621-56-41', 'Ismayilli s, Eliyev street'),
(7, '050-252-66-66', 'Yevlax s, Eliyev street'),
(5, '055-255-25-36', 'Ismayilli d, Eliyev street')

CREATE TABLE Products(
ID int IDENTITY PRIMARY KEY,
Name nvarchar(30),
Price numeric
)

INSERT INTO Products VALUES
('Iphone12', 2500.99),
('IphoneXs', 355.00),
(' REdmi', 999.99),
('Flash', 85.99),
('Flash Card', 36.00),
('Samsungs5', 250.00),
('Flash128', 79.79),
('Mobilephone', 987.99)

CREATE TABLE Orders(
ID int IDENTITY PRIMARY KEY,
UserID int FOREIGN KEY REFERENCES Users(ID),
ExecutedDate datetime
)

INSERT INTO Orders VALUES
(1, GETDATE()),
(2, '2023-11-09'),
(4, GETDATE()),
(5, GETDATE()),
(7, '2023-11-14'),
(1, '2023-11-11'),
(2, GETDATE()),
(4, '2022-02-05'),
(5, '2023-10-13'),
(7, GETDATE())


CREATE TABLE ProductOrder(
ID int IDENTITY,
ProductID int FOREIGN KEY REFERENCES Products(ID),
OrderID int FOREIGN KEY REFERENCES Orders(ID),
)

INSERT INTO ProductOrder VALUES
(1,1),
(3,4),
(1,5),
(2,1),
(6,7),
(8,3),
(4,6),
(5,8)

select * from Users where FirstName LIKE 'T%'
select * from Products where Price > 30
select * from Orders where YEAR(ExecutedDate) = 2023 AND MONTH(ExecutedDate) = 11