#Write a query to display for each store its store ID, city and country.
use sakila;
select store_id, city, country from store
join address using (address_id)
join city using(city_id)
join country using(country_id);

use sakila;
select * from payment;

#Write a query to display how much benefit amount, in dollars, each store brought in.
use sakila;
select store_id, sum(amount) from staff
inner join payment 
using (staff_id)
group by (store_id);

#What is the average running time of films by category?
use sakila;
select avg(length), rating from film
group by rating;

#Which film categories are longest on average?
use sakila;
select avg(length), name, category_id from film
inner join film_category
using (film_id)
inner join category
using (category_id)
group by category_id;


select * from rental;

select * from inventory;

select * from film;


#Display the most frequently rented movies in descending order
select title as title_of_film, count(distinct rental_date) as rented from rental
join inventory using(inventory_id)
join film using(film_id)
group by title
order by rented desc;
