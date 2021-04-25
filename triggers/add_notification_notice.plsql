create or replace trigger add_notification_trigger
after insert or update on Notice
for each row
declare
begin
for x in (select House_No from House)
loop
insert into Notification (House_No,Message) values(x.House_No,'New notice: ' || :new.Subject);
end loop;
end add_notification_trigger;