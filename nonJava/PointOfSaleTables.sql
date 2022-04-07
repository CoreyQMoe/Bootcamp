CREATE DATABASE pointofsale;

USE pointofsale;

CREATE TABLE customer (
	custID INT(111) AUTO_INCREMENT NOT NULL PRIMARY KEY,
	firstName VARCHAR(10) NOT NULL,
	lastName VARCHAR(20) NOT NULL,
	address1e VARCHAR(50),
	address2 VARCHAR(20),
	city VARCHAR(20),
	state VARCHAR(2),
	zipCode INT(5),
	phoneNumber BIGINT(10) NOT NULL,
	email VARCHAR (50) NOT NULL DEFAULT "Declined",
	active BOOLEAN NOT NULL DEFAULT TRUE,
	created DATE NOT NULL DEFAULT CURRENT_DATE(),
	updated DATE DEFAULT CURRENT_DATE());

CREATE TABLE employee (
	empID INT(111) AUTO_INCREMENT NOT NULL,
	firstName VARCHAR(10) NOT NULL,
	lastName VARCHAR(20) NOT NULL,
	address1 VARCHAR(50) NOT NULL,
	address2 VARCHAR(20),
	city VARCHAR(20) NOT NULL,
	state VARCHAR(2) NOT NULL,
	zipCode INT(5)NOT NULL,
	phoneNumber BIGINT(10) NOT NULL,
	email VARCHAR(0) NOT NULL,
	active ENUM('Active', 'Terminated', 'On Leave'),
	reportsTO INT(111),
	created DATE NOT NULL DEFAULT CURRENT_DATE(),
	updated DATE DEFAULT CURRENT_DATE(),
	PRIMARY KEY(empID) ,
	FOREIGN KEY(reportsTo) 
		REFERENCES employee(empID));
		
CREATE TABLE passwords (
	passwordID INT(111) NOT NULL,
	empID INT(111) NOT NULL,
	PASSWORD VARCHAR(20) NOT NULL,
	created DATE NOT NULL DEFAULT CURRENT_DATE(),
	updated DATE DEFAULT CURRENT_DATE(),
	PRIMARY KEY(passwordID),
	FOREIGN KEY(empID)
		REFERENCES employee(empID));
		
CREATE TABLE departments (
	deptID INT(111) AUTO_INCREMENT NOT NULL PRIMARY KEY,
	deptName VARCHAR(20) NOT NULL DEFAULT "Need Department Name",
	created DATE NOT NULL DEFAULT CURRENT_DATE(),
	updated DATE DEFAULT CURRENT_DATE());
	
CREATE TABLE vendor (
	VendID INT(111) AUTO_INCREMENT NOT NULL PRIMARY KEY,
	vendName VARCHAR(20) NOT NULL,
	address1 VARCHAR(50),
	address2 VARCHAR(20),
	city VARCHAR(20),
	state VARCHAR(2),
	zipCode INT(5),
	phoneNumber BIGINT(10) NOT NULL,
	repFirstName VARCHAR(10) NOT NULL,
	repLastName VARCHAR(20) NOT NULL,
	repEmail VARCHAR (50) NOT NULL,
	repPhoneNumber BIGINT(10) NOT NULL,
	active BOOLEAN NOT NULL DEFAULT TRUE,
	created DATE NOT NULL DEFAULT CURRENT_DATE(),
	updated DATE DEFAULT CURRENT_DATE());

CREATE TABLE products (
	prodID INT(111) AUTO_INCREMENT NOT NULL PRIMARY KEY,
	prodName VARCHAR(25) NOT NULL,
	description VARCHAR(255) NOT NULL DEFAULT "Description Needed",
	price DECIMAL(10, 2) NOT NULL,
	cost DECIMAL(10, 2) NOT NULL,
	deptID INT(111) NOT NULL,
	active BOOLEAN NOT NULL DEFAULT TRUE,
	created DATE NOT NULL DEFAULT CURRENT_DATE(),
	updated DATE DEFAULT CURRENT_DATE(),
	FOREIGN KEY(deptID)
		REFERENCES departments(deptID));
	
CREATE TABLE transactions (
	transactionID INT(111) AUTO_INCREMENT NOT NULL,
	custID INT(111),
	empID INT(111) NOT NULL,
	created DATE NOT NULL DEFAULT CURRENT_DATE(),
	updated DATE DEFAULT CURRENT_DATE(),
	PRIMARY KEY(transactionID),
	FOREIGN KEY(custID)
		REFERENCES customer(custID),
	FOREIGN KEY(empID)
		REFERENCES employee(empID));
	
CREATE TABLE transactionDetails (
	transactionID INT(111) NOT NULL,
	prodID INT(111) NOT NULL,
	quantity INT NOT NULL CHECK(quantity > 0),
	created DATE NOT NULL DEFAULT CURRENT_DATE(),
	updated DATE DEFAULT CURRENT_DATE(),
	PRIMARY KEY(transactionID, prodID),
	FOREIGN KEY(transactionID)
		REFERENCES transactions(transactionID),
	FOREIGN KEY(prodID)
		REFERENCES products(prodID));