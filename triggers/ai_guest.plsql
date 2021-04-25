create or replace trigger ai_guest
before insert on Guest
for each row
declare
x number;
begin
select max(to_number(Guest_ID)) into x from Guest;
:new.Guest_ID := x + 1;
end;