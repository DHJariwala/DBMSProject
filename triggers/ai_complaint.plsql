create or replace trigger ai_complaint
before insert on Complaint
for each row
declare
x number;
begin
select max(to_number(Complaint_ID)) into x from Complaint;
:new.Complaint_ID := x + 1;
end;