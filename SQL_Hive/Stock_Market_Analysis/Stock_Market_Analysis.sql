SET SQL_SAFE_UPDATES = 0;
SET sql_mode='';

# creating a new schema called Assigment
create database Assignment;

use Assignment;

# Importing and looking into all the tables after using import wizard

-- Bajaj
select * from bajaj_auto1;
select count(*) from bajaj_auto1;

-- Eicher Motors
select * from eicher_motors1;
select count(*) from eicher_motors1;

-- Hero Motorcorp
select * from hero_motocorp1;
select count(*) from hero_motocorp1;

-- Infosys
select * from infosys1;
select count(*) from infosys1;

-- TCS
select * from tcs1;
select count(*) from tcs1;

-- TVS Motors
select * from tvs_motors1;
select count(*) from tvs_motors1;

-- /  we see we have same number of count for all the tables i.e. 889



#  Now we will create 20 day MA and 50 day MA for all the 6 stocks

-- **BAJAJ
create table BAJAJ_MA as 
select date, `close price`, 
row_number() over () as num,
avg(`Close Price`) over (order by date asc rows 19 preceding) as 20_day_MA,
avg(`Close Price`) over (order by date asc rows 49 preceding) as 50_day_MA
from bajaj_auto1
order by date asc;

-- Setting the intial 20 days and 50 days value as null

update bajaj_ma
set 20_day_MA = NULL
where num > (
	select count(*)
    from bajaj_auto1) -20;

update bajaj_ma
set 50_day_MA = NULL
where num > (
	select count(*)
    from bajaj_auto1) -50;

alter table bajaj_ma
drop num;


-- **EICHER MOTORS
create table EICHER_MA as 
select date, `close price`, 
row_number() over () as num,
avg(`Close Price`) over (order by date asc rows 19 preceding) as 20_day_MA,
avg(`Close Price`) over (order by date asc rows 49 preceding) as 50_day_MA
from eicher_motors1
order by date asc;

-- Setting the intial 20 days and 50 days value as null

update EICHER_MA
set 20_day_MA = NULL
where num > (
	select count(*)
    from eicher_motors1) -20;

update EICHER_MA
set 50_day_MA = NULL
where num > (
	select count(*)
    from eicher_motors1) -50;

alter table EICHER_MA
drop num;

-- **HERO MOTORCORP
create table HERO_MA as 
select date, `close price`, 
row_number() over () as num,
avg(`Close Price`) over (order by date asc rows 19 preceding) as 20_day_MA,
avg(`Close Price`) over (order by date asc rows 49 preceding) as 50_day_MA
from hero_motocorp1
order by date asc;

-- Setting the intial 20 days and 50 days value as null

update HERO_MA
set 20_day_MA = NULL
where num > (
	select count(*)
    from hero_motocorp1) -20;

update HERO_MA
set 50_day_MA = NULL
where num > (
	select count(*)
    from hero_motocorp1) -50;

alter table HERO_MA
drop num;

-- **INFOSYS
create table INFOSYS_MA as
select date, `close price`, 
row_number() over () as num,
avg(`Close Price`) over (order by date asc rows 19 preceding) as 20_day_MA,
avg(`Close Price`) over (order by date asc rows 49 preceding) as 50_day_MA
from hero_motocorp1
order by date asc;

-- Setting the intial 20 days and 50 days value as null

update INFOSYS_MA
set 20_day_MA = NULL
where num > (
	select count(*)
    from infosys1) -20;

update INFOSYS_MA
set 50_day_MA = NULL
where num > (
	select count(*)
    from infosys1) -50;

alter table INFOSYS_MA
drop num;


-- **TCS
create table TCS_MA as 
select date, `close price`, 
row_number() over () as num,
avg(`Close Price`) over (order by date asc rows 19 preceding) as 20_day_MA,
avg(`Close Price`) over (order by date asc rows 49 preceding) as 50_day_MA
from tcs1
order by date asc;

-- Setting the intial 20 days and 50 days value as null

update TCS_MA
set 20_day_MA = NULL
where num > (
	select count(*)
    from tcs1) -20;

update TCS_MA
set 50_day_MA = NULL
where num > (
	select count(*)
    from tcs1) -50;

alter table TCS_MA
drop num;

-- **TVS MOTORS
create table TVS_MA
select date, `close price`, 
row_number() over () as num,
avg(`Close Price`) over (order by date asc rows 19 preceding) as 20_day_MA,
avg(`Close Price`) over (order by date asc rows 49 preceding) as 50_day_MA
from tvs_motors1
order by date asc;

-- Setting the intial 20 days and 50 days value as null

update TVS_MA
set 20_day_MA = NULL
where num > (
	select count(*)
    from tvs_motors1) -20;

update TVS_MA
set 50_day_MA = NULL
where num > (
	select count(*)
    from tvs_motors1) -50;

alter table TVS_MA
drop num;


-- All the moving averages tables

select * from bajaj_ma;
select * from eicher_ma;
select * from hero_ma;
select * from infosys_ma;
select * from tcs_ma;
select * from tvs_ma;


# Creating a Master Table

create table Master_table as
select ba.`date`, ba.`close price` as Bajaj_Auto, em.`close price` as Eicher_Motors, hm.`close price` as hero_Motocorp,
i.`close price` as infosys, tc.`close price` as TCS, tm.`close price` as TVS_MOTORS
from bajaj_auto1 ba inner join eicher_motors1 em using (date)
inner join hero_motocorp1 hm using (date)
inner join infosys1 i using  (date)
inner join tcs1 tc using (Date)
inner join tvs_motors1 tm using (date);


select * from master_table;

# Creating a tables to generate by signal for all the 6 stocks


-- **BAJAJ
create table bajaj_auto_signal as
select `date`, `close price`, 
	(case
		when 20_day_ma > 50_day_ma and lag(20_day_MA) over() < lag(50_day_MA) over() then 'Buy'
        when 50_day_ma > 20_day_ma and lag(20_day_ma) over() > lag(50_day_ma) over() then 'Sell'
        else 'Hold'
	end) as `Signal`
from bajaj_ma;

select * from bajaj_auto_signal;


-- **EICHER MOTORS
create table EICHER_MOTORS_signal as
select `date`, `close price`, 
	(case
		when 20_day_ma > 50_day_ma and lag(20_day_MA) over() < lag(50_day_MA) over() then 'Buy'
        when 50_day_ma > 20_day_ma and lag(20_day_ma) over() > lag(50_day_ma) over() then 'Sell'
        else 'Hold'
	end) as `Signal`
from eicher_ma;

select * from EICHER_MOTORS_signal;


-- **HERO MOTOCORP
create table HERO_MOTOCORP_signal as
select `date`, `close price`, 
	(case
		when 20_day_ma > 50_day_ma and lag(20_day_MA) over() < lag(50_day_MA) over() then 'Buy'
        when 50_day_ma > 20_day_ma and lag(20_day_ma) over() > lag(50_day_ma) over() then 'Sell'
        else 'Hold'
	end) as `Signal`
from hero_ma;

select * from HERO_MOTOCORP_signal;


-- **INFOSYS
create table INFOSYS_signal as
select `date`, `close price`, 
	(case
		when 20_day_ma > 50_day_ma and lag(20_day_MA) over() < lag(50_day_MA) over() then 'Buy'
        when 50_day_ma > 20_day_ma and lag(20_day_ma) over() > lag(50_day_ma) over() then 'Sell'
        else 'Hold'
	end) as `Signal`
from infosys_ma;

select * from INFOSYS_signal;


-- **TCS
create table TCS_signal as
select `date`, `close price`, 
	(case
		when 20_day_ma > 50_day_ma and lag(20_day_MA) over() < lag(50_day_MA) over() then 'Buy'
        when 50_day_ma > 20_day_ma and lag(20_day_ma) over() > lag(50_day_ma) over() then 'Sell'
        else 'Hold'
	end) as `Signal`
from tcs_ma;

select * from TCS_signal;


-- **TVS MOTORS
create table TVS_MOTORS_signal as
select `date`, `close price`, 
	(case
		when 20_day_ma > 50_day_ma and lag(20_day_MA) over() < lag(50_day_MA) over() then 'Buy'
        when 50_day_ma > 20_day_ma and lag(20_day_ma) over() > lag(50_day_ma) over() then 'Sell'
        else 'Hold'
	end) as `Signal`
from tvs_ma;

select * from TVS_MOTORS_signal;


# Creating User defined function which takes date as input and genrates signal

delimiter $$

create function signal_generator (set_date varchar(20))
returns varchar(10) deterministic

begin
	declare output_value varchar(10);
    select `signal` into output_value from bajaj_auto_signal
    where date = str_to_date(set_date, "%Y-%m-%d");
    return output_value;
end; $$

delimiter ;

-- Example
select signal_generator('2015-05-18') as `Signal`