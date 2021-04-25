-- To autoincrement primary key

create or replace trigger ai_person
before insert on Person
for each row
declare 
x number;
begin
select max(to_number(Person_ID)) into x from Person;
:new.Person_ID := x + 1;
end;