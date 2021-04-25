CREATE OR REPLACE TRIGGER add_notification_guest BEFORE
    INSERT ON guest
    FOR EACH ROW
DECLARE BEGIN
    INSERT INTO notification (
        house_no,
        message
    ) VALUES (
        :new.house_no,
        'You have a guest'
    );

END add_notification_guest;