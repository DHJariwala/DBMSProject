CREATE OR REPLACE FUNCTION is_staff (
    sid IN VARCHAR2
) RETURN BOOLEAN IS
    bool  BOOLEAN;
    temp  VARCHAR2(20);
BEGIN
    SELECT
        staff_id
    INTO temp
    FROM
        staff
    WHERE
        staff_id = sid;

    bool := SQL%found;
    RETURN bool;
EXCEPTION
    WHEN too_many_rows THEN
        RETURN false;
    WHEN no_data_found THEN
        RETURN false;
END is_staff;