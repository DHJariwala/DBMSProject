CREATE OR REPLACE TRIGGER add_notification_guest BEFORE
    INSERT ON guest
    FOR EACH ROW
DECLARE
    PRAGMA autonomous_transaction;
BEGIN
    add_notification(:new.house_no,'You have a guest');
    COMMIT;
END add_notification_guest;