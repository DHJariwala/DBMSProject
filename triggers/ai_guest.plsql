CREATE OR REPLACE TRIGGER ai_guest BEFORE
    INSERT ON guest
    FOR EACH ROW
DECLARE
    x NUMBER;
    pragma autonomous_transaction;
BEGIN
    SELECT
        MAX(to_number(guest_id))
    INTO x
    FROM
        guest;

    :new.guest_id := x + 1;
commit;
END;