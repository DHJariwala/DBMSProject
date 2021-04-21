-- Complaint table + Owner name + Staff name
create or replace view complaint_view as
select t1.Complaint_ID,Status,C_TimeStamp,Description,House_No,Owner_name,Staff_ID,Staff_name from
(select Complaint_ID,Status,C_TimeStamp,Description,Complaint.House_No,Person.Name as Owner_name 
from Complaint
join House
on Complaint.House_No = House.House_No
join Person 
on House.Owner_ID = Person.Person_Id) t1
left outer join
(select Complaint_ID,Complaint.Staff_ID, Person.Name as Staff_name
from Complaint
join Person
on Complaint.Staff_ID = Person.Person_ID) t2
on t1.Complaint_ID = t2.Complaint_ID;