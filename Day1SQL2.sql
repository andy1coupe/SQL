use bank;
select amount as amnt, payments as pymt, amount-payments as debt from loan;

select distinct card.type from card;
select * from district;
select A2 as districtname, A3 as districtregion from district
limit 10;

select type as type_of_card, issued as issue_date from card as bc;

#operators and logical clauses +-* / == >= <= != <>
select loan_id, amount/1000 as amountk from loan;

#only loans where staatus is A or begin
select * from loan
where status= 'A' or status = 'B';
#or where status not in ('A','B')

select * from loan
where status <>'B' and status <> 'A';

select * from loan
where status = 'B' and amount > 10000 and duration <=24
order by amount desc;

#the biggest and smallest loan amount
select max(amount), min(amount) from loan;

#round, ceiling, floor
select round(avg(amount),2), ceiling(avg(amount)), floor(avg(amount)) from bank.order;

#useful string functions - lower, upper, length, concat, left, right, ltrim, rtrim
select A2, left(A2,5) from district;
select ltrim('.  praha');  #removing spaces from left of praha


select A2 as districtname, A11 as average_salary from district
where A11 > 10000;

select * from card
where card.type = 'junior';

select amount, payments, loan_id, account_id, amount-payments as debt from loan;

select round((A4*A10)/100) as urban_population, A2 as district_name from district
where A10 <=50;

#dates convert(int,date), substring_index(), date_format()
select *, convert(account.date,date) as mydate from bank.account;

select *, substring_index(issued, ' ',1) from bank.card;
select *, convert(substring_index(issued, ' ',1),date) from bank.card;


select *, date_format(convert(loan.date, date), '%y-%m-%d') as newdate from bank.loan;


#nulls is null()

#case - we have done tablaeu, case when, then, else, end
select* from loan;
select *,
case status
when 'A' then 'good paid off loan'
when 'B' then 'contract ended loan not paid'
when 'C' then 'good running'
else 'running default'
end as description
from loan;


