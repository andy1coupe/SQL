#DDL data definition language & DML data maniuplation language
#create alter drop truncate rename update

create database booksauthors;  #creates database, #drop database booksauthors 
use booksauthors;

drop table authors;  #deletes the table incase you have already made it avoid warning
create table authors   #create the table authors 
(
author_id int auto_increment not null, #creates the table 
authorname varchar(30), #creates part of the table and each value can have a max of 30 characters
country varchar(30),
primary key (author_id)
);

drop table books;
create table books    #creates the table books
(
book_id int auto_increment not null,
author_id int not null,
bookname varchar(50) default null,
primary key (book_id),
key idx_fk_author_id(author_id), #setting up the foreign key_block_size
constraint fk_author_id foreign key (author_id) #set constraint of foregin key - dont add book and author if author doesnt exist in book table
references authors(author_id) on delete restrict on update cascade # sets up what we are referncing 
);

#now you have created the structure  we fill it with information

insert into authors (authorname,country) 
values('charles bukowski', 'USA'), ('john pilger', 'Australia'), 
('charles bukowski','USA'),('george orwell','england'), ('mark seal','USA');

## populate with data now books
drop table books;
create table books;
insert into books (bookname, author_id)
values('post office',1), ('the new rulers of the world',2), ('factotum',3), ('nineteen eighty four',4), 
('the man in the rockerfeller suit',5);

select * from books
right join authors
using(author_id);

#update authors set country='uk' where author_id in (2,4,5) - if need to make a change 
#insert into authors()...
#update authors set country='uk' where author_id ('4');

#CTES - common table expressions
#subqueries
#views
#more window fx - optional





