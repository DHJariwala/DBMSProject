CREATE OR REPLACE TRIGGER add_notification_guest BEFORE
    INSERT ON guest
    FOR EACH ROW
DECLARE
    PRAGMA autonomous_transaction;
BEGIN
    INSERT INTO notification (
        house_no,
        message
    ) VALUES (
        :new.house_no,
        'You have a guest'
    );

    COMMIT;
END add_notification_guest;