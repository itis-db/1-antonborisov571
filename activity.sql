with recursive activity_hierarchy as (
  select
    a.activityid,
    a.activitytypeid,
    a.code,
    a.name,
    a.parentid,
    0 as areaid,
    1 as level,
    cast(at.name as VARCHAR) as hierarchy_path
  from activity a
  join activitytype as at on at.activitytypeid = a.activitytypeid
  where (a.activityid = COALESCE(:pn_activityid, 1))

  union all

  select
    a.activityid,
    a.activitytypeid,
    a.code,
    a.name,
    a.parentid,
    c.areaid,
    ah.level + 1 as level,
    concat(ah.hierarchy_path, ' -> ', at.name) as hierarchy_path
  from activity a
  join activitytype as at on at.activitytypeid = a.activitytypeid
  join activity_hierarchy ah on a.parentid = ah.activityid
  left join contract c on c.areaid = a.activityid
)
select a."name" , ah.* from activity_hierarchy ah
left join area a on a.areaid = ah.activityid
order by ah.activityid
