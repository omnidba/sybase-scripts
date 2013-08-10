select @@version

select @@maxpagesize

select @@boottime

sp_helpdb

sp_helpdevice

select address_info as "host/port",host_name() as "hostname",@@servername as "servername",db_name() as "current_dbname" from master..syslisteners

use testdb
go
sp_spaceused syslogs
go

disk init name="sandbox_data", physname="/opt/sybase/devices/sandbox/log_dev1.dat", size="10M", dsync=false, directio=true

disk init name="sandbox_log", physname="/opt/sybase/devices/sandbox/log_dev1.dat", size="10M", dsync=false, directio=true

create database sandbox on sandbox_data="5M" log on sandbox_log="5M"

use master
sp_dboption "sandbox", "allow nulls by default", true

select * from sysusages where dbid=db_id("sales_db1")
