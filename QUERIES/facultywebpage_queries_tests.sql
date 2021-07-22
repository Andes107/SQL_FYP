select CONSTRAINT_NAME
from information_schema.table_constraints
where table_schema='dbo' and table_name='tblSupervises';
/*
https://stackoverflow.com/questions/1307990/why-use-the-include-clause-when-creating-an-index
*/

alter index IX_tblFyp_title on tblFyp disable;
alter index IX_tblFyp_title on tblFyp rebuild;
/*
	https://www.brentozar.com/archive/2013/02/disabling-vs-dropping-indexes/
*/

SELECT cplan.usecounts, cplan.objtype, qtext.text
FROM sys.dm_exec_cached_plans AS cplan
CROSS APPLY sys.dm_exec_sql_text(plan_handle) AS qtext
CROSS APPLY sys.dm_exec_query_plan(plan_handle) AS qplan
ORDER BY cplan.usecounts DESC;

DBCC FreeProcCache;

SELECT creation_time
FROM sys.dm_exec_query_stats WITH (NOLOCK)
ORDER BY creation_time;