create or replace trigger ai_person
before insert on Person
for each row
declare 
x number;
begin
select max(to_number(Person_ID)) into x from Person;
:new.Person_ID := x + 1;
end;

create or replace trigger ai_guest
before insert on Guest
for each row
declare
x number;
begin
select max(to_number(Guest_ID)) into x from Guest;
:new.Guest_ID := x + 1;
end;

create or replace trigger ai_complaint
before insert on Complaint
for each row
declare
x number;
begin
select max(to_number(Complaint_ID)) into x from Complaint;
:new.Complaint_ID := x + 1;
end;

-- create or replace trigger insert_age_person
-- before insert or update on Person
-- for each row
-- declare
--     a decimal;
-- begin
--     a := extract(year from localtimestamp) - extract(year from :old.DOB);
--     dbms_output.put_line("Hi");
--     if extract(day from localtimestamp) < extract(day from :old.DOB)
--     then
--         if extract(month from localtimestamp) < extract(month from :old.DOB)
--         then
--         a := a - 1;
--         end if;
--     end if;
--     :new.Age := a;
-- end;