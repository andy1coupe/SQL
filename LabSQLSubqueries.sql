select * from rental;

select * from inventory;

select * from loan;

#How many copies of the film Hunchback Impossible exist in the inventory system?
select title, count(distinct inventory_id) from film
join inventory using (film_id)
where title = 'Hunchback Impossible';

#List all films whose length is longer than the average of all the films
select avg(length) from film;
#avg length 115.2720
select title from film
where length > 115.272;

#Use subqueries to display all actors who appear in the film Alone Trip
select first_name, last_name from actor where actor_id in
(select actor_id from film_actor where film_id =
(select film_id from film where title= 'Alone Trip'));

select * from category;


#Sales have been lagging among young families, and you wish to target all 
#family movies for a promotion. Identify all movies categorized as family films
select title, name, category_id from film 
join film_category using (film_id)
join category using (category_id)
where name = 'Family';

#Get name and email from customers from Canada using subqueries. Do the same 
#with joins. Note that to create a join, you will have to identify the correct
# tables with their primary keys and foreign keys, that will help you get the 
#relevant information

#better subquery
select c.first_name, c.last_name, c.email, country from customer as c
join sakila.address using(address_id)
join sakila.city using(city_id)
inner join (select * from country where country ='Canada') can 
using(country_id);

#sians answer - not finished 
select first name, last name, email from sakila.customer
where customer_id
select customter_id from customer 
join customer using (customer_id)
where country = 'Canada';

#Which are films starred by the most prolific actor? Most prolific actor is defined 
#as the actor that has acted in the most number of films. First you will have to find 
#the most prolific actor and then use that actor_id to find the different films that 
#he/she starred
#outer query 
#select films if actor is...

#inner query
#-----or select actor id from ...  window functions
#join to film table to get titles
#inner query
#select actor in most films
#count films - group by actor
#------- or window function - rank or row number
#order by no of films, and pick the biggest

#or to join to query as table 
select title from film 
join film_actor using (film_id)
where actor_id 
=(
select actor_id from 
(select actor_id, count(film_id) #inner query
from film_actor
group by actor_id
order by count(film_id) desc 
limit 1) af
);

#Films rented by most profitable customer. You can use the customer table and payment
# table to find the most profitable customer ie the customer that has made the largest 
#sum of payments

select title from film
join inventory using (film_id)
join rental using(inventory_id)
where customer_id = (
select customer_id from 
(select customer_id, sum(amount) from payment
group by customer_id
order by sum(amount) desc
limit 1) s) #needs an alias as its a derived table
;

#Get the client_id and the total_amount_spent of those clients who spent 
#more than the average of the total_amount spent by each client

select customer_id, sum(amount) 
from payment
group by customer_id having sum(amount)>
(select avg(amnt) from 
(select customer_id, sum(amount) as amnt from payment
group by customer_id) s);
