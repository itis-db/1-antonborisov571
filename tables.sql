create table if not exists activitytype
(
	activitytypeid integer primary key,
	name text not null,
	sysname text not null
)

create table if not exists activity
(
	activityid integer primary key,
	activitytypeid integer not null,
	code text not null,
	name text not null,
	parentid integer unique not null,
	constraint fk_activity_activitytype foreign key (activitytypeid) references activitytype(activitytypeid) on delete cascade,
	constraint fk_activity_parent foreign key (parentid) references activity(activityid) on delete cascade
)

create table if not exists program
(
    programid integer primary key,
    indexnum integer,
    yearstart integer,
    yearfinish integer,
    constraint fk_program_activity foreign key (programid) references activity(parentid) on delete cascade
);

create table if not exists subprogram
(
    subprogramid integer primary key,
    indexnum integer,
    constraint fk_subprogram_activity foreign key (subprogramid) references activity(parentid) on delete cascade
);

create table if not exists project
(
    projectid integer primary key,
    targetdescr integer,
    constraint fk_project_activity foreign key (projectid) references activity(parentid) on delete cascade
);

create table if not exists area
(
    areaid integer primary key,
    name text not null
);

create table if not exists contract
(
    contractid integer primary key,
    areaid integer not null,
    constraint fk_contract_area foreign key (areaid) references area(areaid) on delete cascade,
    constraint fk_contract_activity foreign key (contractid) references activity(parentid) on delete cascade
);

create table if not exists point
(
    pointid integer primary key,
    plandate date not null,
    factdate date,
    constraint fk_point_activity foreign key (pointid) references activity(parentid) on delete cascade
);










