select assignedFyp, x.parity from tblProjectGroups as pg1
cross apply(
	select 1 where assignedFyp % 2 = 1
	union all
	select 2 where assignedFyp % 2 = 0
	union all
	select 10 where assignedFyp % 10 = 0
) as x(parity);

select PK_tblProjectGroups, assignedFyp from tblProjectGroups
where assignedFyp is not null;

--To comment, use ctrl + k, ctrl + c
--To uncomment, use ctrl + u, ctrl + c
--To close the message window, ctrl + r
