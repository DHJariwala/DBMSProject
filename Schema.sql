CREATE TABLE admin (
    admin_id  VARCHAR2(50) NOT NULL,
    password  VARCHAR2(128) NOT NULL,
    CONSTRAINT admin_pk PRIMARY KEY ( admin_id )
);
create table Person(
    Person_ID varchar2(20) Primary Key,
    Name varchar2(50) not null,
    DOB date not null,
    Age decimal not null,
    Gender varchar2(6) not null,
    Phone_No numeric(10),
    Constraint gender_enum check(Gender in ('Male','Female')),
    Constraint proper_ph_no check(Phone_No >=1000000000 and Phone_No <= 9999999999)
);

CREATE TABLE house (
    house_no  VARCHAR2(10) PRIMARY KEY,
    password  VARCHAR2(128) NOT NULL,
    owner_id  VARCHAR2(10) NOT NULL,
    FOREIGN KEY ( owner_id )
        REFERENCES person ( person_id )
            ON DELETE CASCADE
);

CREATE TABLE staff (
    staff_id  VARCHAR2(20) PRIMARY KEY,
    password  VARCHAR2(128) NOT NULL,
    salary    INT NOT NULL,
    FOREIGN KEY ( staff_id )
        REFERENCES person ( person_id )
            ON DELETE CASCADE
);

CREATE TABLE resident (
    resident_id  VARCHAR2(20) PRIMARY KEY,
    house_no     VARCHAR2(10) NOT NULL,
    FOREIGN KEY ( house_no )
        REFERENCES house ( house_no ),
    FOREIGN KEY ( resident_id )
        REFERENCES person ( person_id )
            ON DELETE CASCADE
);
<<<<<<< HEAD
CREATE TABLE Complaint(
    Complaint_ID varchar2(10) PRIMARY KEY,
    C_TimeStamp timestamp default localtimestamp not null,
    Subject varchar2(200) NOT NULL,
    Description varchar2(2000) NOT NULL,
    Status varchar2(30) DEFAULT 'Unassigned',
    House_No varchar2(20) NOT NULL,
    Staff_ID varchar2(20),
    Constraint complaint_status_enum check(Status in ('Unassigned','Pending','Resolved')),
    FOREIGN KEY (House_No) REFERENCES House (House_No) on delete cascade,
    FOREIGN KEY (Staff_ID) REFERENCES Staff (Staff_ID) on delete set null
);
CREATE TABLE Maintenance_Fee(
    House_No varchar2(20),
    M_Date Date default localtimestamp not null,
    Fees int NOT NULL,
    Fine int DEFAULT 0,
    Status varchar2(10) DEFAULT 'Due',
    Constraint Maintenance_status_enum check(Status in ('Paid','Due')),
    PRIMARY KEY(House_No, M_Date),
    FOREIGN KEY (House_No) REFERENCES House (House_No)
=======

CREATE TABLE guest (
    guest_id     VARCHAR2(20) PRIMARY KEY,
    g_timestamp  TIMESTAMP DEFAULT current_timestamp NOT NULL,
    details      VARCHAR2(1000) NOT NULL,
    staff_id     VARCHAR2(10),
    house_no     VARCHAR2(10) NOT NULL,
    FOREIGN KEY ( house_no )
        REFERENCES house ( house_no )
            ON DELETE CASCADE,
    FOREIGN KEY ( staff_id )
        REFERENCES staff ( staff_id )
            ON DELETE SET NULL
);

CREATE TABLE notice (
    n_timestamp  TIMESTAMP DEFAULT localtimestamp NOT NULL,
    admin_id     VARCHAR2(20) NOT NULL,
    subject      VARCHAR2(200) NOT NULL,
    description  VARCHAR2(2000) NOT NULL,
    PRIMARY KEY ( n_timestamp,
                  admin_id ),
    FOREIGN KEY ( admin_id )
        REFERENCES admin ( admin_id )
>>>>>>> 924149f8226ca32c3a8407820459cd75b443850a
);

CREATE TABLE complaint (
    complaint_id  VARCHAR2(10) PRIMARY KEY,
    c_timestamp   TIMESTAMP DEFAULT localtimestamp NOT NULL,
    subject       VARCHAR2(200) NOT NULL,
    description   VARCHAR2(2000) NOT NULL,
    status        VARCHAR2(30) DEFAULT 'Unassigned' CHECK ( status IN ( 'Unassigned', 'Pending', 'Resolved' ) ),
    house_no      VARCHAR2(20) NOT NULL,
    staff_id      VARCHAR2(20),
    FOREIGN KEY ( house_no )
        REFERENCES house ( house_no )
            ON DELETE CASCADE,
    FOREIGN KEY ( staff_id )
        REFERENCES staff ( staff_id )
            ON DELETE SET NULL
);

CREATE TABLE maintenance_fee (
    house_no  VARCHAR2(20),
    m_date    DATE DEFAULT localtimestamp NOT NULL,
    fees      INT NOT NULL,
    fine      INT DEFAULT 0,
    status    VARCHAR2(10) DEFAULT 'Due' CHECK ( status IN ( 'Paid', 'Due' ) ),
    PRIMARY KEY ( house_no,
                  m_date ),
    FOREIGN KEY ( house_no )
        REFERENCES house ( house_no )
);

CREATE TABLE notification (
    house_no       VARCHAR2(50),
    message        VARCHAR2(500),
    not_timestamp  TIMESTAMP DEFAULT localtimestamp,
    PRIMARY KEY ( house_no,
                  not_timestamp ),
    FOREIGN KEY ( house_no )
        REFERENCES house ( house_no )
);
