create or replace trigger add_notification_complaint
after update on Complaint
for each row
declare
    nam varchar2(50);
begin
select Person.Name into nam from Staff join Person on Person_ID = :new.Staff_ID; 
if :new.Status = 'Pending'
then
insert into Notification (House_No,Message) values(:new.House_No,'Your complaint has been assigned to ' || nam);
elsif :new.Status = 'Resolved'
then
insert into Notification (House_No,Message) values(:new.House_No,'Your complaint " ' || :new.Subject || ' " has been resolved.',current_timestamp);
end if;
exception
    when too_many_rows then
    dbms_output.put_line('too many rows');
    when no_data_found then
    dbms_output.put_line('no data found');
end add_notification_complaint;