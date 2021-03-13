CREATE TABLE Emps (
Employee_Id NUMBER(6) PRIMARY KEY,
First_Name VARCHAR2(20),
Last_Name VARCHAR2(25) NOT NULL,
Email VARCHAR2(25) NOT NULL,
Phone_Number VARCHAR2(15),
Hire_Date DATE NOT NULL,
Job_Id VARCHAR2(10) NOT NULL,
Salary NUMBER(8,2),
Commission_pct NUMBER(2,2),
Manager_id NUMBER(6),
Department_Id NUMBER(4));