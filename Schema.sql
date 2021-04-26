CREATE TABLE admin (
    admin_id  VARCHAR2(50) NOT NULL,
    password  VARCHAR2(128) NOT NULL,
    CONSTRAINT admin_pk PRIMARY KEY ( admin_id )
);
create table Person(
    Person_ID varchar2(20),
    Name varchar2(50) not null,
    DOB date not null,
    Age decimal not null,
    Gender varchar2(6) not null,
    Phone_No numeric(10),
    Constraint person_id_pk Primary key (Person_ID),
    Constraint gender_enum check(Gender in ('Male','Female')),
    Constraint proper_ph_no check(Phone_No >=1000000000 and Phone_No <= 9999999999)
);

CREATE TABLE house (
    house_no  VARCHAR2(10),
    password  VARCHAR2(128) NOT NULL,
    owner_id  VARCHAR2(10) NOT NULL,
    Constraint house_no_pk Primary key (house_no),
    Constraint owned_by
    FOREIGN KEY ( owner_id )
        REFERENCES person ( person_id )
            ON DELETE CASCADE
);

CREATE TABLE staff (
    staff_id  VARCHAR2(20),
    password  VARCHAR2(128) NOT NULL,
    salary    INT NOT NULL,
    Constraint staf_id_pk Primary key (staff_id),
    Constraint staff_isa_person
    FOREIGN KEY ( staff_id )
        REFERENCES person ( person_id )
            ON DELETE CASCADE
);

CREATE TABLE resident (
    resident_id  VARCHAR2(20),
    house_no     VARCHAR2(10) NOT NULL,
    Constraint resident_id_pk primary key (resident_id),
    Constraint resident_lives_in
    FOREIGN KEY ( house_no )
        REFERENCES house ( house_no ),
    Constraint resident_isa_person
    FOREIGN KEY ( resident_id )
        REFERENCES person ( person_id )
            ON DELETE CASCADE
);
CREATE TABLE Complaint(
    Complaint_ID varchar2(10),
    C_TimeStamp timestamp default localtimestamp not null,
    Subject varchar2(200) NOT NULL,
    Description varchar2(2000) NOT NULL,
    Status varchar2(30) DEFAULT 'Unassigned',
    House_No varchar2(20) NOT NULL,
    Staff_ID varchar2(20),
    Constraint complaint_id_pk primary key (Complaint_ID),
    Constraint complaint_status_enum check(Status in ('Unassigned','Pending','Resolved')),
    Constraint complaint_lodged_by FOREIGN KEY (House_No) REFERENCES House (House_No) on delete cascade,
    Constraint complaint_assigned_to FOREIGN KEY (Staff_ID) REFERENCES Staff (Staff_ID) on delete set null
);

CREATE TABLE Maintenance_Fee(
    House_No varchar2(20),
    M_Date Date default localtimestamp not null,
    Fees int NOT NULL,
    Fine int DEFAULT 0,
    Status varchar2(10) DEFAULT 'Due',569
    Constraint Maintenance_status_enum check(Status in ('Paid','Due')),
    Constraint maintenance_hno_date_pk PRIMARY KEY(House_No, M_Date),
    Constraint maintenance_to_be_payed_by FOREIGN KEY (House_No) REFERENCES House (House_No)

CREATE TABLE guest (
    guest_id     VARCHAR2(20),
    g_timestamp  TIMESTAMP DEFAULT current_timestamp NOT NULL,
    details      VARCHAR2(1000) NOT NULL,
    staff_id     VARCHAR2(10),
    house_no     VARCHAR2(10) NOT NULL,
    Constraint guest_id_pk Primary key (Guest_ID),
    Constraint guest_visits 
    FOREIGN KEY ( house_no )
        REFERENCES house ( house_no )
            ON DELETE CASCADE,
    Constraint guest_added_by_staff
    FOREIGN KEY ( staff_id )
        REFERENCES staff ( staff_id )
            ON DELETE SET NULL
);

CREATE TABLE notice (
    n_timestamp  TIMESTAMP DEFAULT localtimestamp NOT NULL,
    admin_id     VARCHAR2(20) NOT NULL,
    subject      VARCHAR2(200) NOT NULL,
    description  VARCHAR2(2000) NOT NULL,
    Constraint notice_admin_timestamp_pk PRIMARY KEY ( n_timestamp,
                  admin_id ),
    Constraint notice_posted_by
    FOREIGN KEY ( admin_id )
        REFERENCES admin ( admin_id )
);

CREATE TABLE notification (
    house_no       VARCHAR2(50),
    message        VARCHAR2(500),
    not_timestamp  TIMESTAMP DEFAULT localtimestamp,
    Constraint notification_house_no_timestamp_pk PRIMARY KEY ( house_no,
                  not_timestamp ),
    Constraint notification_given_to
    FOREIGN KEY ( house_no )
        REFERENCES house ( house_no )
);
