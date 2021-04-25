CREATE OR REPLACE TRIGGER add_notification_trigger AFTER
    INSERT OR UPDATE ON notice
    FOR EACH ROW
DECLARE 
    pragma autonomous_transaction;
BEGIN
    FOR x IN (
        SELECT
            house_no
        FROM
            house
    ) LOOP
        INSERT INTO notification (
            house_no,
            message
        ) VALUES (
            x.house_no,
            'New notice: ' || :new.subject
        );

    END LOOP;
    commit;
END add_notification_trigger;