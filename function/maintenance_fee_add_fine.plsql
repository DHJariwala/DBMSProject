CREATE OR REPLACE FUNCTION add_fine (
    hno IN VARCHAR2
) RETURN SYS_REFCURSOR IS
    rf_cr SYS_REFCURSOR;
BEGIN
    UPDATE maintenance_fee
    SET
        fine = 500
    WHERE
        house_no = hno
        AND status = 'Due'
        AND fine = 0
        AND months_between(
            current_date, m_date
        ) >= 1;

    OPEN rf_cr FOR SELECT
                      m_date,
                      fees,
                      fine,
                      status
                  FROM
                      maintenance_fee
                  WHERE
                      house_no = hno
                  ORDER BY
                      status;

    RETURN rf_cr;
END add_fine;