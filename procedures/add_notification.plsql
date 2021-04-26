CREATE OR REPLACE PROCEDURE add_notification (
    hno  IN  VARCHAR2,
    msg  IN  VARCHAR2
) IS
BEGIN
    INSERT INTO notification (
        house_no,
        message
    ) VALUES (
        hno,
        msg
    );

    COMMIT;
END add_notification;