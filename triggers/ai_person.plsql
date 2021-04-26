-- To autoincrement primary key

CREATE OR REPLACE TRIGGER ai_person BEFORE
    INSERT ON person
    FOR EACH ROW
DECLARE
    x NUMBER;
    PRAGMA autonomous_transaction;
BEGIN
    SELECT
        MAX(to_number(person_id))
    INTO x
    FROM
        person;

    :new.person_id := x + 1;
    COMMIT;
END;