create or replace trigger add_notification_guest
before insert on Guest
for each row
declare
begin
    insert into Notification (House_No,Message) values(:new.House_No,'You have a guest');
end add_notification_guest;