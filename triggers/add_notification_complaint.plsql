CREATE OR REPLACE TRIGGER add_notification_complaint AFTER
    UPDATE ON complaint
    FOR EACH ROW
DECLARE
    nam VARCHAR2(50);
    PRAGMA autonomous_transaction;
BEGIN
    IF :new.status = 'Pending' THEN
        SELECT
            person.name
        INTO nam
        FROM
            person
        WHERE
            person_id = :new.staff_id;
        add_notification(
                        :new.house_no,
                        'Your complaint '
                        || :new.subject
                        || ' has been assigned to '
                        || nam
        );

        COMMIT;
    ELSIF :new.status = 'Resolved' THEN
        add_notification(
                        :new.house_no,
                        'Your complaint "'
                        || :new.subject
                        || '" has been resolved.'
        );

        COMMIT;
    END IF;
END add_notification_complaint;