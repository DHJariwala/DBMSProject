create table Admin(
    Admin_ID varchar2(50) not null,
    Password varchar2(128) not null,
    constraint admin_pk primary key (Admin_ID)
);
create table Person(
    Person_ID varchar2(20) Primary Key,
    Name varchar2(50) not null,
    DOB date not null,
    Age decimal,
    Gender varchar2(6) check( Gender in ('Male','Female')),
    Phone_No numeric(10) check(Phone_No >=1000000000 and Phone_No <= 9999999999)
);
CREATE TABLE House(
    House_No varchar2(10) PRIMARY KEY,
    Password varchar2(128) NOT NULL,
    Owner_ID varchar2(10) NOT NULL,
    FOREIGN KEY (Owner_ID) REFERENCES Person (Person_ID) on delete cascade
);
CREATE TABLE Staff(
    Staff_ID varchar2(20) PRIMARY KEY,
    Password varchar2(128) NOT NULL,
    Salary int NOT NULL,
    FOREIGN KEY (Staff_Id) REFERENCES Person (Person_ID) on delete cascade
);  
CREATE TABLE Resident(
    Resident_ID varchar2(20) PRIMARY KEY,
    House_No varchar2(10) NOT NULL,
    FOREIGN KEY (House_No) REFERENCES House (House_No),
    FOREIGN KEY (Resident_Id) REFERENCES Person (Person_ID) on delete cascade
); 
CREATE TABLE Guest(
    Guest_ID varchar2(20) PRIMARY KEY,
    G_TimeStamp timestamp default current_timestamp not null,
    Details varchar2(1000) NOT NULL,
    Staff_ID varchar2(10),
    House_No varchar2(10) NOT NULL,
    FOREIGN KEY (House_No) REFERENCES House (House_No) on delete cascade,
    FOREIGN KEY (Staff_ID) REFERENCES Staff (Staff_ID) on delete set null
);
CREATE TABLE Notice(
    N_TimeStamp timestamp default localtimestamp not null ,
    Admin_ID varchar2(20) not null,
    Subject varchar2(200) NOT NULL,
    Description varchar2(2000) NOT NULL,
    PRIMARY KEY(N_TimeStamp, Admin_ID),
    FOREIGN KEY (Admin_ID) REFERENCES Admin (Admin_ID) 
);
CREATE TABLE Complaint(
    Complaint_ID varchar2(10) PRIMARY KEY,
    C_TimeStamp timestamp default localtimestamp not null,
    Subject varchar2(200) NOT NULL,
    Description varchar2(2000) NOT NULL,
    Status varchar2(30) DEFAULT 'Unassigned' check(Status in ('Unassigned','Pending','Resolved')),
    House_No varchar2(20) NOT NULL,
    Staff_ID varchar2(20),
    FOREIGN KEY (House_No) REFERENCES House (House_No) on delete cascade,
    FOREIGN KEY (Staff_ID) REFERENCES Staff (Staff_ID) on delete set null
);
CREATE TABLE Maintenance_Fee(
    House_No varchar2(20),
    M_Date Date default localtimestamp not null,
    Fees int NOT NULL,
    Fine int DEFAULT 0,
    Status varchar2(10) DEFAULT 'Due' check(Status in ('Paid','Due')),
    PRIMARY KEY(House_No, M_Date),
    FOREIGN KEY (House_No) REFERENCES House (House_No)
);
CREATE TABLE Notification(
    House_No varchar2(50),
    Message varchar2(500),
    Not_Timestamp timestamp default localtimestamp,
    primary key(House_No,Not_Timestamp),
    foreign key (House_No) References House (House_No)
);