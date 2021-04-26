create or replace procedure add_notification
(hno in varchar2,msg in varchar2) is
begin
insert into Notification (House_No,Message) values(hno,msg);
end add_notification;