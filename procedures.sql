create or replace procedure insert_person_staff
(nam in varchar2,ag in date, 
gen in varchar2,phno in numeric,pass in varchar2,sal in int)
is
    ids number;
begin
    insert into Person (Person_ID,Name,DOB,Gender,Phone_No) values('1',nam,ag,gen,phno);
    select max(to_number(Person_ID)) into ids from Person;
    insert into Staff values(ids,pass,sal);
end insert_person_staff;

create or replace procedure insert_person_resident
(nam in varchar2,ag in date, 
gen in varchar2,phno in numeric,hno in varchar2)
is
    ids number;
begin
    insert into Person (Person_ID,Name,DOB,Gender,Phone_No) values('1',nam,ag,gen,phno);
    select max(to_number(Person_ID)) into ids from Person;
    insert into Resident values(ids,hno);
end insert_person_resident;


-- begin
-- insert_person_resident('Devil','20','Male','1122334455','201');
-- end;