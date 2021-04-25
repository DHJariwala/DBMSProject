create or replace function add_fine
(hno in varchar2)
return sys_refcursor
is 
rf_cr sys_refcursor;
begin
update Maintenance_Fee
set Fine = Fine + 500
where House_No = hno
and Status = 'Due'
and Fine = 0
and (current_date - M_Date) >= 1;
open rf_cr for
select M_Date,Fees,Fine,Status from Maintenance_Fee where House_No = hno;
return rf_cr;
end add_fine;