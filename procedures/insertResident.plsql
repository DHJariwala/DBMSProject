CREATE OR REPLACE PROCEDURE insert_resident (
    nam   IN  VARCHAR2,
    ag    IN  DATE,
    gen   IN  VARCHAR2,
    phno  IN  NUMERIC,
    hno   IN  VARCHAR2
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

    INSERT INTO resident VALUES (
        ids,
        hno
    );

END insert_resident;