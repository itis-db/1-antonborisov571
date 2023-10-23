insert into activitytype(activitytypeid, name, sysname)
select d.*
from (
	values(1,'Программа','Program'),
	(2,'Подпрограмма','SubProgram'),
	(3,'Территория','Area'),
	(4,'Проект','Project'),
	(5,'КТ(Проект)','Point'),
	(6,'Контракт','Contract'),
	(7,'КТ(Контракт)','Point')
) 
as d(activitytypeid, name, sysname)
where not exists(
	select 1 from activitytype as t
	where t.activitytypeid = d.activitytypeid
);

insert into activity(activityid, activitytypeid, code, name, parentid)
select d.*
from (
    values (1, 1, 'А', 'Программа', null),
           (2, 2, 'А1', 'Подпрограмма', 1),
           (3, 3, 'А1.1', 'Территория', 2),
           (4, 4, 'А1.1.1', 'Проект', 3),
           (5, 5, 'А1.1.1.1', 'КТ(Проект)', 4),
           (6, 6, 'А1.1.1.1.1', 'Контракт', 5),
           (7, 7, 'А1.1.1.1.1.1', 'КТ(Контракт)', 6),
           (8, 1, 'B', 'Программа', null),
           (9, 2, 'B1', 'Подпрограмма', 8),
           (10, 3, 'B1.1', 'Территория', 9),
           (11, 4, 'B1.1.1', 'Проект', 10),
           (12, 5, 'B1.1.1.1', 'КТ(Проект)', 11),
           (13, 6, 'B1.1.1.1.1', 'Контракт', 12),
           (14, 7, 'B1.1.1.1.1.1', 'КТ(Контракт)', 13),
           (15, 1, 'C', 'Программа', null),
           (16, 2, 'C1', 'Подпрограмма', 15),
           (17, 3, 'C1.1', 'Территория', 16),
           (18, 4, 'C1.1.1', 'Проект', 17),
           (19, 5, 'C1.1.1.1', 'КТ(Проект)', 18),
           (20, 6, 'C1.1.1.1.1', 'Контракт', 19),
           (21, 7, 'C1.1.1.1.1.1', 'КТ(Контракт)', 20)
) 
as d(activityid, activitytypeid, code, name, parentid)
where not exists(
    select 1 from activity as t
    where t.activityid = d.activityid
);

insert into program(programid, indexnum, yearstart, yearfinish)
select d.*
from (
	values(1, 0, 1972, 2000),
	(8, 1, 2000, 2049),
	(15, 2, 2010, 2089)
) 
as d(programid, indexnum, yearstart, yearfinish)
where not exists(
	select 1 from program t
	where t.programid = d.programid
);

insert into area(areaid, name)
select d.*
from (
    values(3, 'Апастово'),
          (10, 'Каратун'),
          (17, 'Вахитовский Район')
) 
as d(areaid, name)
where not exists(
    select 1 from area as t
    where t.areaid = d.areaid
);

insert into subprogram(subprogramid, indexnum)
select d.*
from (
    values(2, 0),
          (9, 1),
          (16, 2)
) 
as d(subprogramid, indexnum)
where not exists(
    select 1 from subprogram as t
    where t.subprogramid = d.subprogramid
);

insert into project(projectid, targetdescr)
select d.*
from (
    values(4, 'Цель 1'),
          (11, 'Цель 2'),
          (18, 'Цель 3')
) 
as d(projectid, targetdescr)
where not exists(
    select 1 from project as t
    where t.projectid = d.projectid
);

insert into contract(contractid, areaid)
select d.*
from (
    values(6, 3),
          (13, 10),
          (20, 17)
) 
as d(contractid, areaid)
where not exists(
    select 1 from contract as t
    where t.contractid = d.contractid
);

insert into point(pointid, plandate, factdate)
select d.*
from (
    values(5, current_date, current_date + 10),
          (7, date '2001-02-16', date '2001-02-16' + 365),
          (12, date '2004-09-17', date '2004-09-17' - 10),
          (14, date '2020-11-11', date '2020-11-05' - 424),
          (19, date '2012-12-21', date '2012-12-21' + 10000),
          (21, date '2020-02-20', date '2020-02-20' + 11)
) 
as d(pointid, plandate, factdate)
where not exists(
    select 1 from point as t
    where t.pointid = d.pointid
);

