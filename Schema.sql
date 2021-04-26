CREATE TABLE admin (
    admin_id  VARCHAR2(50) NOT NULL,
    password  VARCHAR2(128) NOT NULL,
    CONSTRAINT admin_pk PRIMARY KEY ( admin_id )
);

CREATE TABLE person (
    person_id  VARCHAR2(20) PRIMARY KEY,
    name       VARCHAR2(50) NOT NULL,
    dob        DATE NOT NULL,
    age        DECIMAL,
    gender     VARCHAR2(6) CHECK ( gender IN ( 'Male', 'Female' ) ),
    phone_no   NUMERIC(10) CHECK ( phone_no >= 1000000000
                                 AND phone_no <= 9999999999 )
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