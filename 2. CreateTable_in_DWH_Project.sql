CREATE TABLE DimCustomer (
	CustomerID int NOT NULL,
	CustomerName varchar(50) NOT NULL,
	Age int NOT NULL,
	Gender varchar(50) NOT NULL,
	City varchar(50) NOT NULL,
	NoHp varchar(50) NOT NULL,
	CONSTRAINT PKCustomerID PRIMARY KEY (CustomerID)
);

CREATE TABLE DimProduct (
	ProductID int NOT NULL,
	ProductName varchar(255) NOT NULL,
	ProductCategory varchar(255) NOT NULL,
	ProductUnitPrice int NOT NULL,
	CONSTRAINT PKProductID PRIMARY KEY (ProductID)
);

CREATE TABLE DimStatusOrder (
	StatusID int NOT NULL,
	StatusOrder varchar(50) NOT NULL,
	StatusOrderDesc varchar(50) NOT NULL,
	CONSTRAINT PKStatusID PRIMARY KEY (StatusID)
);

CREATE TABLE FactSalesOrder (
	OrderID int NOT NULL,
	CustomerID int NOT NULL,
	ProductID int NOT NULL,
	Quantity int NOT NULL,
	Amount int NOT NULL,
	StatusID int NOT NULL,
	OrderDate date,
	CONSTRAINT PKOrderID PRIMARY KEY (OrderID),
	CONSTRAINT FKCustomerID FOREIGN KEY (CustomerID) REFERENCES DimCustomer(CustomerID),
	CONSTRAINT FKProductID FOREIGN KEY (ProductID) REFERENCES DimProduct(ProductID),
	CONSTRAINT FKStatusID FOREIGN KEY (StatusID) REFERENCES DimStatusOrder(StatusID)
);