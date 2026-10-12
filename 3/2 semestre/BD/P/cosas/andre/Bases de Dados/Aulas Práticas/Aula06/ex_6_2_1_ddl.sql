CREATE TABLE department (
  Dname VARCHAR(30),
  Dnumber INT PRIMARY KEY,
  Mgr_ssn CHAR(9),
  Mgr_start_date DATE

  primary key (Dnumber)
);

CREATE TABLE employee (
  Fname VARCHAR(20),
  Minit CHAR(1),
  Lname VARCHAR(30),
  Ssn CHAR(9) PRIMARY KEY,
  Bdate DATE,
  [Address] VARCHAR(50),
  Sex CHAR(1),
  Salary DECIMAL(10, 2),
  Super_ssn CHAR(9),
  Dno INT,

  primary key (Ssn),			
	foreign key (Dno) references Department (Dnumber)
);

CREATE TABLE dept_location (
  Dnumber INT,
  Dlocation VARCHAR(30),

  primary key (Dnumber,Dlocation),
	foreign key (Dnumber) references Department(Dnumber)
);

CREATE TABLE project (
  Pname VARCHAR(30),
  Pnumber INT PRIMARY KEY,
  Plocation VARCHAR(30),
  Dnum INT,

  primary key (Pnumber),
	foreign key (Dnum) references Department (Dnumber)
);

CREATE TABLE works_on (
  Essn CHAR(9),
  Pno INT,
  [Hours] DECIMAL(4, 1),

  primary key (Essn,Pno),
	foreign key (Pno) references Project (Pnumber),
	foreign key (Essn) references Employee (Ssn)
);

CREATE TABLE dependent (
  Essn CHAR(9),
  Dependent_name VARCHAR(20),
  Sex CHAR(1),
  Bdate DATE,
  Relationship VARCHAR(20)

  primary key (Essn,Dependent_name),
	foreign key (Essn) references Employee (Ssn)
);