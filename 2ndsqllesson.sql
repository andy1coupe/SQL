select 'hello world';
select 20+10;
select distinct(card_id) from bank.card;
select distinct card.type from card; 
select * from district;
select distinct a2 from district;  #district column was in A2 
select a2 as districtname,
a3 from district
limit 30;

#get all the types of hte card as #type of card and the issue date
#as issue date from card client 
# and alias the table bc

select type as type_of_card,
issued as issue_date from card as bc;


#operators and logical clauses 
# + - * /
# =  >= <= !=  <>
#where 
#from the bank loan, get load_id and amount in thousands
SELECT loan_id, amount/1000 as amountk from loan;

# only loans where status is A or B
SELECT * FROM loan
WHERE status ='A' or status = 'B';
# or easier 

SELECT * FROM loan
WHERE status in ('A','B' );

#to select all that arent a or b
SELECT * FROM loan
WHERE status not in ('A','B' );

#or alternativley
SELECT * FROM loan
WHERE status <> 'A' or'B';

SELECT * FROM loan
WHERE status <> 'B' AND STATUS <> 'A'; #IS NEITHER B OR A

#LETS ADD AN AND TO OUR WHERE
#STATUS IS B AND AMOUNT > 100,000
SELECT * FROM LOAN
WHERE STATUS = 'B' AND AMOUNT > 100000
ORDER BY AMOUNT DESC; #BIGGEST AT THE TOP

#ADD ANOTHER FIELD WHERE DURATION IS LESS OR EQUAL TO 24 MONTHS
SELECT * FROM LOAN
WHERE STATUS = 'B' AND AMOUNT > 100000 AND DURATION <=24
ORDER BY AMOUNT DESC; #BIGGEST AT THE TOP

# THE BIGGEST and smallest loan
SELECT max(amount) , min(amount) from loan;

#round, ceiling and floor
#average order amount
SELECT avg(amount) from bank.order;

#round, ceiling and floor
#average order amount with round(2 decimal places) 
SELECT round(avg(amount),2), ceiling(avg(amount)), floor(avg(amount))
from bank.order;

#useful string functions - LOWER, UPPER LENGHT CONCAT LEFT RIGHT LTRIM R TRIM
SELECT A2, LEFT(A2,5) FROM district;

#REMOVE WHITE SPACES FROM LEFT OF THE NAME
SELECT LTRIM('   PRAHA'); #TRIM ALL WHITE SPACE FROM LEFT

