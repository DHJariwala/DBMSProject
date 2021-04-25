create or replace trigger add_notification_guest
before insert on Guest
for each row
declare
begin
    insert into Notification values(:new.House_No,'You have a guest ' || :new.Details,:new.G_TimeStamp);
end add_notification_guest;