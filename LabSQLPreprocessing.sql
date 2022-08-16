select * from actor where first_name = 'scarlett';
select count(distinct(title)) from film;
select count(distinct(rental_date)) from rental; 
select MIN(length) as min_duration, max(length)as max_duration from film;
#whats the average movie lenght in mins hours
select sec_to_time(avg(length)*60) from film;
#or
select floor(avg(length)/60) as hours, round(avg(length) % 60) as minutes from film; 
#how many distinct (different actors last names are there?
select(count(distinct last_name)) from actor;
#how many days has the company been operating
select datediff(max(rental_date), min(rental_date)) as time_operating from rental;
#show rental info with additonal columns montha and weekday, get 20 results
select *, date_format(rental_date, "%m") as month, date_format(rental_date, "%w") as day from rental limit 20;
#add an additonal column day_type with values 'weekend' and 'workday' depending on the rental day of the week
select *, 
date_format(convert(rental_date, date), '%M') as 'month',
date_format(convert(rental_date, date), '%W') as 'weekday',
case date_format(convert(rental_date, date), '%w')
when 'saturday' then 'weekend'
when 'sunday' then 'weekend'
else workday
end as day_type
from 
rental; 

#how many rentals were in the last month of activity 
select * from rental order by rental_date desc;

select date_format(max(rental_date), '%m %y') from rental; #last_month

#or
#get the last 30 day dates for the question
select date(max(rental_date)) - interval 30 day, date(max(rental_date)) from rental;

select count(*) from rental
where date(rental_date) between date('2006-01-15') and date('2006-02-14');


#or 

select count(*)
from rental where rental_date 
>= (select max(rental_date)  - interval 30 day from rental);

#or get last date month before last date
select date_sub(max(rental_date), interval 30 day) from rental;

