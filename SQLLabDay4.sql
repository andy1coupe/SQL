use sakila;
select distinct(staff_id) from rental;
#how many rentals were processed by each employee
select staff_id, count(distinct rental_id) from rental group by staff_id;
#how many films were released
select count(distinct title) from film;
#how many films were released by rating 
select rating, count(distinct film_id) from film group by rating order by count(distinct film_id) desc;
#what kind of moves have a a mean duration of more than two hours
select rating, avg(length), count(distinct film_id) from film 
group by rating
having avg(length) > 120;

