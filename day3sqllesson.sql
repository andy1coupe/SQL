#order by
use bank;
select * from trans  # select all from trans
where k_symbol= 'UROK' #where k_symbol= urok
and operation <> ' ' 
order by date desc, amount desc; #create a partition (by date or time) 


# like '%'  - string or substring match similar - wildcard
select * from district where
a2 like '%u%' or a2 like 'U%';  #everything that starts with a k or '%u%' - returns everyhting with a u in the middle


select * from district where
a2 like '_____'; #5 underscores -- 5 characters - returns all with 5 charachters from column a2


# where regexp ' ' 
select A2 from district 
where A2 REGEXP '[uxy]';  #looking for u x or y anywhere #INCORRECT NOT WORKING

select A2 from district
where a2 regexp 'pra?';    # looking for characters in order anywhere

select a2 from district
where a2 regexp '[:digit:]'; #check for numbers 

select a2 from district
where a2 regexp '[be|ae:]'; #check for be or ae 

#GROUP BY - always followed by aggregate  - aggregate the data by .sum, count etc .... something
#aggregates - count distinct sum min max avg
select sum(amount), duration from loan
group by duration, status;

# eg. summarise orders by account 
select account_id, count(order_id) as noorders, round(sum(amount),2) as total
from bank.order
group by account_id;  #any field that doesnt have count/min/max in front of it

#eg. summarise orders by specific accounts 
select account_id, count(order_id) as noorders, round(sum(amount),2) as total
from bank.order
where account_id in (173,96,97) #any field that doesnt have count/min/max in front of it
group by account_id
having count(order_id) >1 #with groupby
order by count(order_id) DESC;



use bank;
#window functions - aggregation - but you dont want a summary table 
#OVER is the window function to return the average and creat a new column
select count(account_id) from account
group by district_id; 

select * , round(avg(amount)OVER(),2) as avg_amount
from loan
where duration = 12;

#partition by duration

select * , round(avg(amount)OVER(partition by duration),0) as avgbydur
from loan;

#average by duration 
#partition by status then within the partition by status its making partition by duration
select * , round(avg(amount)OVER(partition by status, duration),0) as avgbydur
from loan;

#adding partition and running sum 
select account_id,
date, 
amount, 
round (sum(amount) OVER(partition by account_id order by date),0) 
as running_sum 
from trans
where account_id in (1,2,3);

