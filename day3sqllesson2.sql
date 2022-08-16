#Create a query to show for each rating the average movie length (displayed as Mean_length). 
#Sort the results in descending order of Mean_length.

use sakilla;
select rating, avg(length) as mean_length from film
group by rating 
order by mean_length desc; 

#Create a query to show for each movie the following data (in this order): rating,title, length
# mean length by rating displayed as Mean_length_by_rating 
#ranking displayed as Ranking (showing from the longest to the shortest movie 
#within the same rating).
#This means sorting the results by rating and descending order of movie length.

select rating, title, length, 
avg(length) over (partition by rating) as mean_length_rat, 
rank() over(partition by rating order by length desc) as ranking
from film
