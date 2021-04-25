CREATE OR REPLACE TRIGGER ai_complaint BEFORE
    INSERT ON complaint
    FOR EACH ROW
DECLARE
    x NUMBER;
    pragma autonomous_transaction;
BEGIN
    SELECT
        MAX(to_number(complaint_id))
    INTO x
    FROM
        complaint;

    :new.complaint_id := x + 1;
commit;
END;