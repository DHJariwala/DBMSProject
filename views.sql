-- Route : /admin/cmanage and /staff/complaints
-- Complaint table + Owner name + Staff name
-- Reason: To give owner name and staff name along with complaint details
-- Delete the current view by 'drop materialized view complaint_view;'
create or replace view complaint_view as
select t1.Complaint_ID,
    C_TimeStamp,
    Subject,
    Description,
    Status,
    House_No,
    Owner_name,
    Staff_ID,
    Staff_name
from (
        select Complaint_ID,
            Status,
            C_TimeStamp,
            Subject,
            Description,
            Complaint.House_No,
            Person.Name as Owner_name
        from Complaint
            join House on Complaint.House_No = House.House_No
            join Person on House.Owner_ID = Person.Person_Id
    ) t1
    left outer join (
        select Complaint_ID,
            Complaint.Staff_ID,
            Person.Name as Staff_name
        from Complaint
            join Person on Complaint.Staff_ID = Person.Person_ID
    ) t2 on t1.Complaint_ID = t2.Complaint_ID;

-- Route: /staff/search
-- Residents info with house no
-- Reason: Can be used for search without Joining resident with person always
create view Resident_search_view as
select house_no,
    person_id,
    phone_no
from (
        (
            select person_id,
                name,
                phone_no
            from person
        )
        join (
            select house_no,
                resident_id
            from resident
        ) on person_id = resident_id
    );
    
-- Route: 
-- Residnets info from Person, discarding Staff
create view Preson_without_Staff as
select *
from Person
where Person_ID not in (
        select Staff_ID
        from Staff
    );