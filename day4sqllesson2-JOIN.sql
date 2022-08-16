
use bank;
create or replace view clients_loans_combo as
select c.client_id, c.district_id, l.loan_id, l.status, l.amount, 
l.duration, l.payments, l.date as loan_date
from client c
join disp dp using(client_id)
join account a using(account_id)
join loan l using(account_id)
where dp.type = 'owner';

#subquery = a query inside a query
#---step 2 outer query
#---step 1 (inner query) - check it
#---eg which loans are bigger than average
select avg(amount) from loan;
##'151410.1760' - to compare the next result 
select * from loan where amount >
(select avg(amount) from loan);

#onve value ( 
select avg(transact) from
(select account_id, count(trans_id) as transact from trans group by account_id) as s;

#option1 - create view then query view
select avg(transact) from acctrans; #if i have created a view

#otpion2 - create subquery
select ceiling(avg(transact)) as avg_trans_overall
from 
(select account_id, count(trans_id) as transact from trans group by account_id) as s;

#get a list of accounts from central bohemia using a subquery
#rewrite the previous as a join query

select account_id from account where district_id in
(select a1 from district where a3 like 'central Bohemia');

#rewritten as join query 

select account_id from account
join district
on account.district_id=district.a1
where a3 like 'c%Bohemia';


#CTE's (common table expressions) - we wanyto join x + y but x doesnt exist
#transactions table - get the total amount for each account and any acc info
#then draw on that table to get information or use that table to join to another 

with cte_trans as #creating temporary table called cte trans
(select )

select ct.field, ct.field, ct.field 
from cte_trans as ct;

#get the biggest and smallest trans with trans id for those transactions

select max(amount), min(amount), trans_id from trans
where amount <>0
group by trans_id;





with cte_loan as (select * from loan)
select loan_id from cte_loan
where status = 'B';

