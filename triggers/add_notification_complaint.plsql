CREATE OR REPLACE TRIGGER add_notification_complaint AFTER
    UPDATE ON complaint
    FOR EACH ROW
DECLARE
    nam VARCHAR2(50);
BEGIN
    SELECT
        person.name
    INTO nam
    FROM
        staff
        JOIN person ON person_id = :new.staff_id;

    IF :new.status = 'Pending' THEN
        INSERT INTO notification (
            house_no,
            message
        ) VALUES (
            :new.house_no,
            'Your complaint has been assigned to ' || nam
        );

    ELSIF :new.status = 'Resolved' THEN
        INSERT INTO notification (
            house_no,
            message
        ) VALUES (
            :new.house_no,
            'Your complaint "'
            || :new.subject
            || '" has been resolved.'
        );

    END IF;

EXCEPTION
    WHEN too_many_rows THEN
        dbms_output.put_line('too many rows');
    WHEN no_data_found THEN
        dbms_output.put_line('no data found');
END add_notification_complaint;