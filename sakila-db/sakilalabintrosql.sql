#selecting specific data
select * from actor;
select * from film;
select * from customer;
#extracting film titles:
select title from film;
#getting unique values  for language.name
select distinct language.name as language from language; 

#count how many stores
select count(distinct store_id) from store;

#how many employees does the store have
select count(distinct staff_id) from staff;

#return a list of employees first name only:
select first_name from staff;