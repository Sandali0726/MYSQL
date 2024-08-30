show variables like 'event%';
set global event_scheduler = on

delimiter $$
create event yearly_delete_stale_audit_rows
on schedule
	-- at '2019-05-01'                    -- at = execute at once
    every 1 year starts'2020-01-01' ends '2022-01-01'
do begin
	delete from payments_audit
    where action_date < now() - interval 1 year;
    -- now() - interval 1 year = dateadd(now(),interval -1 year) or datesub(now(),interval 1 year)
    
end $$
delimiter ; 

show events like 'yearly%';
drop event if exists yearly_delete_stale_audit_rows;

alter event yearly_delete_stale_audit_rows enable;  -- disable