drop database world;
create database world;
use world;

create table books (   
book_id  int not null primary key,
author varchar(40) not null,
author_id int not null,
title varchar(40) not null,
price int not null,
available varchar(40) not null 
 );
 
create table members (
member_id  int not null primary key,
name varchar(40) not null,
address varchar(40) not null,
gender  varchar (40) not null
);

create table author (
author_id  int not null primary key,
name  varchar(40) not null,
address varchar(40) not null 
);

create table orders (
order_id  int not null primary key,
book_id  int not null,
member_id int not null ,
order_date date not null,
author_id int not null,
price int not null
);

/*insert statements*/
insert into books values("yes",	2,	"becoming",	202409,	"michelle obama"	,930593 );
insert into books values("no",	5,	"my vanishing country",	503030,	"bakarisellers"	,603958 );
insert into books values("yes",	6,	"relationship goals",	684959,	"todd michael"	, 156039);
insert into books values("yes",	4,	"the book of v",	396595,	"annasolomon"	,693504 );
insert into members values(946955,"john","21.keury.st","male");
insert into members values(330596,"lila","101.white.st","female");
insert into members values(436445,"micon","50.harvard.st","male");
insert into members values(530595,"nicky","211.gaffar.st","female");
insert into author values (530594	 , "macarena"  ,"21.keury.st");
insert into author values (204305	 , "Alphonso davis"  ,"101.white.st");
insert into author values (104949	 , "neymar"  ,"50.harvard.st");
insert into author values (034949	 ,"wanda de monda"  ,"21.keury.st");
insert into orders values(650494,9305398,330596,"2020/1/2",530594,2);
insert into orders values(604504,603958,436445,"2020/3/26",204305,5);
insert into orders values(329698,15039,530595,"2020/5/5",104949,6);


/*select statements*/


SELECT * FROM Books;
SELECT upper(author) FROM Books;
SELECT substring(author,1,3) FROM Books;
SELECT RTRIM(Name) FROM author;
SELECT LTRIM(Name) FROM author;
SELECT upper(Name) FROM author;
SELECT * FROM Members;
SELECT Name, Address FROM Members;
SELECT * FROM author where Name like "%m%";
SELECT * FROM author where Name like "%a";
SELECT * FROM author where Name like "a";
SELECT order_Date FROM orders;
SELECT COUNT(*) FROM Books WHERE Price > 4;
SELECT COUNT(*) FROM Members WHERE Gender = "male";
SELECT COUNT(*) FROM Books WHERE Price >= 4;
SELECT MAX(Price) FROM Books;
SELECT SUM(price)from Books;
SELECT Name ,member_id FROM Members WHERE Name ="Lila";
SELECT Available FROM Books WHERE Available="yes";
SELECT *,MIN(Price) FROM Books;


/*subquery*/

Select title from Books where Book_id in (select Book_id from orders where Order_date="2020/2/1");
Select title from Books where Book_id in (select Book_id from orders where Order_date="2020/2/1");
Select title from Books where Book_id in (select Book_id from orders where Price>="5");


/*count and group funcations*/

SELECT COUNT(*) FROM Books WHERE Price > 4;
SELECT Order_id, MAX(Order_date) FROM Orders GROUP BY Order_id;



/*Joins*/
SELECT * FROM Orders right JOIN Books ON Orders.Book_id=Books.Book_id WHERE title="becoming" ;

SELECT * FROM Orders LEFT JOIN author ON Orders.author_id =author.author_id WHERE price=5;
SELECT * FROM Orders right JOIN Books ON Orders.Book_id=Books.Book_id WHERE title="becoming";

SELECT * FROM Orders LEFT JOIN author ON Orders.author_id=author.author_id where price=2;


/* Update */

UPDATE Orders SET Order_date="2020/2/1" WHERE Order_id=650494;

UPDATE Books SET author="leonardo" WHERE Book_id=156039;

UPDATE Members SET Name="Mosa" WHERE  Member_id=330596;

UPDATE author SET Address="51.harvard.st" WHERE author_id=104949;

UPDATE Books SET title="Makarina" WHERE Book_id=603958;

/*Delete Statement*/

DELETE from books  WHERE Price <5;

DELETE  from members WHERE Member_id =330596;

DELETE  from orders WHERE Order_id =329698;

DELETE  from author WHERE author_id =104949;

DELETE  from books WHERE Book_id=603958;
