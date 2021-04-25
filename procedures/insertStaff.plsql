CREATE OR REPLACE PROCEDURE insert_staff (
    nam   IN  VARCHAR2,
    ag    IN  DATE,
    gen   IN  VARCHAR2,
    phno  IN  NUMERIC,
    pass  IN  VARCHAR2,
    sal   IN  INT
) IS
    ids NUMBER;
BEGIN
    INSERT INTO person (
        person_id,
        name,
        dob,
        gender,
        phone_no
    ) VALUES (
        '1',
        nam,
        ag,
        gen,
        phno
    );

    SELECT
        MAX(to_number(person_id))
    INTO ids
    FROM
        person;

    INSERT INTO staff VALUES (
        ids,
        pass,
        sal
    );

END insert_staff;