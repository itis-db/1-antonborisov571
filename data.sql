insert into activitytype(activitytypeid, name, sysname)
select d.*
from (
	values(1,'Программа','Program'),
	(2,'Подпрограмма','SubProgram'),
	(3,'Проект','Project'),
	(4,'Контракт','Contract'),
	(5,'КТ','Point')
) 
as d(activitytypeid, name, sysname)
where not exists(
	select 1 from activitytype as t
	where t.activitytypeid = d.activitytypeid
);

insert into activity(activityid, activitytypeid, code, name, parentid)
select d.*
from (
    values (1, 1, 'Программа', 'Программа', null),
           (2, 2, 'Программа.Подпрограмма', 'Подпрограмма', 1),
           (3, 2, 'Программа.Подпрограмма2', 'Подпрограмма2', 1),
           (4, 3, 'Программа.Подпрограмма.Проект', 'Проект', 2),
           (5, 3, 'Программа.Подпрограмма2.Проект', 'Проект', 3),
           (6, 4, 'Программа.Подпрограмма.Проект.Kонтракт', 'Контракт', 4),
           (7, 4, 'Программа.Подпрограмма.Проект.Kонтракт2', 'Контракт2', 4),
           (8, 4, 'Программа.Подпрограмма2.Проект.Kонтракт', 'Контракт', 5),
           (9, 4, 'Программа.Подпрограмма2.Проект.Kонтракт2', 'Контракт2', 5),
           (10, 5, 'Программа.Подпрограмма.Проект.Точка', 'Точка', 4),
           (11, 5, 'Программа.Подпрограмма.Проект.Точка2', 'Точка2', 4),
           (12, 5, 'Программа.Подпрограмма2.Проект.Точка', 'Точка', 5),
           (13, 5, 'Программа.Подпрограмма2.Проект.Точка2', 'Точка2', 5),
           (14, 5, 'Программа.Подпрограмма.Проект.Kонтракт.Точка', 'Точка', 6),
           (15, 5, 'Программа.Подпрограмма.Проект.Kонтракт2.Точка2', 'Точка2', 7),
           (16, 5, 'Программа.Подпрограмма2.Проект.Kонтракт.Точка', 'Точка', 8),
           (17, 5, 'Программа.Подпрограмма2.Проект.Kонтракт2.Точка2', 'Точка2', 9),
           (18, 1, 'Программа22', 'Программа2', null),
           (19, 2, 'Программа2.Подпрограмма', 'Подпрограмма', 1),
           (20, 2, 'Программа2.Подпрограмма2', 'Подпрограмма2', 1),
           (21, 3, 'Программа2.Подпрограмма.Проект', 'Проект', 2),
           (22, 3, 'Программа2.Подпрограмма2.Проект', 'Проект', 3),
           (23, 4, 'Программа2.Подпрограмма.Проект.Kонтракт', 'Контракт', 4),
           (24, 4, 'Программа2.Подпрограмма.Проект.Kонтракт2', 'Контракт2', 4),
           (25, 4, 'Программа2.Подпрограмма2.Проект.Kонтракт', 'Контракт', 5),
           (26, 4, 'Программа2.Подпрограмма2.Проект.Kонтракт2', 'Контракт2', 5),
           (27, 5, 'Программа2.Подпрограмма.Проект.Точка', 'Точка', 4),
           (28, 5, 'Программа2.Подпрограмма.Проект.Точка2', 'Точка2', 4),
           (29, 5, 'Программа2.Подпрограмма2.Проект.Точка', 'Точка', 5),
           (30, 5, 'Программа2.Подпрограмма2.Проект.Точка2', 'Точка2', 5),
           (31, 5, 'Программа2.Подпрограмма.Проект.Kонтракт.Точка', 'Точка', 6),
           (32, 5, 'Программа2.Подпрограмма.Проект.Kонтракт2.Точка2', 'Точка2', 7),
           (33, 5, 'Программа2.Подпрограмма2.Проект.Kонтракт.Точка', 'Точка', 8),
           (34, 5, 'Программа2.Подпрограмма2.Проект.Kонтракт2.Точка2', 'Точка2', 9)
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
	(2, 1, 2000, 2049)
) 
as d(programid, indexnum, yearstart, yearfinish)
where not exists(
	select 1 from program t
	where t.programid = d.programid
);

insert into area(areaid, name)
select d.*
from (
    values(1, 'Вахитовский район'),
          (2, 'Авиастроительный район'),
          (3, 'Кировский район'),
          (4, 'Московский район'),
          (5, 'Ново-Савиновский район'),
          (6, 'Советский район'),
          (7, 'Приволжский район'),
          (8, 'Апастово'),
          (9, 'Каратун')
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
          (3, 1),
          (19, 2),
          (20, 3)
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
          (5, 'Цель 2'),
          (21, 'Цель 3'),
          (22, 'Цель 4')
) 
as d(projectid, targetdescr)
where not exists(
    select 1 from project as t
    where t.projectid = d.projectid
);

insert into contract(contractid, areaid)
select d.*
from (
    values(14, 1),
          (15, 2),
          (16, 3),
          (17, 4),
          (31, 6),
          (32, 9),
          (33, 9),
          (34, 9)
) 
as d(contractid, areaid)
where not exists(
    select 1 from contract as t
    where t.contractid = d.contractid
);

insert into point(pointid, plandate, factdate)
select d.*
from (
    values(10, current_date, current_date + 10),
          (11, date '2001-02-16', date '2001-02-16' + 365),
          (12, date '2004-09-17', date '2004-09-17' - 10),
          (13, date '2004-11-24', date '2004-11-24' + 1),
          (14, date '2004-08-05', date '2004-08-05' - 1),
          (15, date '2004-10-24', date '2004-10-24' + 10),
          (16, date '2020-11-11', date '2020-11-05' - 424),
          (17, date '2021-11-14', date '2021-11-14' + 422),
          (18, date '2022-01-01', date '2022-01-01' + 33),
          (27, date '2023-08-05', date '2023-08-05' - 4),
          (28, date '2024-08-05', date '2025-08-05'),
          (29, date '2012-12-21', date '2012-12-21' + 10000),
          (30, date '2023-10-23', date '2023-10-23' + 7),
          (31, date '2007-08-05', date '2007-08-05' + 101),
          (32, date '2020-02-20', date '2020-02-20' + 11),
          (33, date '2014-03-14', date '2014-03-14' - 730),
          (34, date '1994-03-29', date '1994-03-29' - 5)
) 
as d(pointid, plandate, factdate)
where not exists(
    select 1 from point as t
    where t.pointid = d.pointid
);

insert into contract(contractid, areaid)
select d.*
from (
    values(6, 1),
          (7, 1),
          (8, 2),
          (9, 3),
          (23, 7),
          (24, 8),
          (25, 8),
          (26, 9)
) 
as d(contractid, areaid)
where not exists(
    select 1 from contract as t
    where t.contractid = d.contractid
);

