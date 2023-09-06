/*capture output*/
set echo on
spool week7_alter_output.txt


/*Task 1*/
alter table unit add unit_credit number(2,0) default 6 not null;
comment on column unit.unit_credit is 'unit credit';
alter table unit add constraint chk_unit_credit (unit_credit in (3,6,12));


drop table course cascade constraints purge;
drop table course_unit cascade constraints purge;

create table course (
crs_code char(2) not null,
crs_name varchar2(50) not null,
crs_totalpoint number(4) not null
);

alter table course add constraint course_pk primary key (crs_code);

create table course_unit (
unit_code char(7) not null,
crs_code char(3) not null
);

alter table course_unit add constraint course_unit_pk primary key (unit_code, crs_code);

alter table course_unit add constraint unit_courseunit_fk foreign key (unit_code)
references unit(unit_code);

alter table course_unit add constraint course_courseunit_fk foreign key (crs_code)
references course(crs_code);
/*end of script*/
spool off
set echo off