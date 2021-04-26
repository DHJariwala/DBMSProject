CREATE OR REPLACE TRIGGER add_notification_trigger AFTER
    INSERT OR UPDATE ON notice
    FOR EACH ROW
DECLARE
    PRAGMA autonomous_transaction;
BEGIN
    FOR x IN (
        SELECT
            house_no
        FROM
            house
    ) LOOP
        add_notification(x.house_no, 'New notice: ' || :new.subject);

    END LOOP;

    COMMIT;
END add_notification_trigger;