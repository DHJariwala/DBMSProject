-- Route : /admin/cmanage and /staff/complaints
-- Complaint table + Owner name + Staff name
-- Reason: To give owner name and staff name along with complaint details
-- Delete the current view by 'drop materialized view complaint_view;'
CREATE OR REPLACE VIEW complaint_view AS
    SELECT
        t1.complaint_id complaint_id,
        c_timestamp,
        subject,
        description,
        status,
        house_no,
        owner_name,
        staff_id,
        staff_name
    FROM
        (
            SELECT
                complaint_id,
                status,
                c_timestamp,
                subject,
                description,
                complaint.house_no,
                person.name AS owner_name
            FROM
                complaint
                JOIN house ON complaint.house_no = house.house_no
                JOIN person ON house.owner_id = person.person_id
        )  t1
        LEFT OUTER JOIN (
            SELECT
                complaint_id,
                complaint.staff_id,
                person.name AS staff_name
            FROM
                complaint
                JOIN person ON complaint.staff_id = person.person_id
        )  t2 ON t1.complaint_id = t2.complaint_id;

-- Route: /staff/search
-- Residents info with house no
-- Reason: Can be used for search without Joining resident with person always
CREATE OR REPLACE VIEW resident_search_view AS
    SELECT
        house_no,
        name,
        phone_no
    FROM
        (
            (
                SELECT
                    person_id,
                    name,
                    phone_no
                FROM
                    person
            )
            JOIN (
                SELECT
                    house_no,
                    resident_id
                FROM
                    resident
            ) ON person_id = resident_id
        );
    