use uni;
select 'transactions' = @@TRANCOUNT;
begin tran
update department set budget = budget + 500000
where dept_name = 'Comp.Sci.';
select * from department where dept_name = 'Comp.Sci.';
rollback tran