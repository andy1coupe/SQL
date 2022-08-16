#dates CONVERT(int.date), SUBSTRING_INDEX(), DATE_FORMAT(%y)

#converting date to date
SELECT *, CONVERT(account.date,date) as mydate from bank.account;


select *,
date_format(convert(loan.date,date), '%y-%m-%d') as newdate,
date_format(convert(loan.date,date), '%y-%m') as yearmonth
from loan


#nulls is null eg where is not null

#case - we have done in tableau



