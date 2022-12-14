--scott 계정으러 진행
show user;

drop table employee2;

 CREATE TABLE employee2 (
    id int PRIMARY KEY ,
     name varchar(50) ,
    email varchar(50) UNIQUE,
    date2 date DEFAULT NULL,
    working_days int NOT NULL
);


          
insert into employee2(id,name,email,date2,working_days)
values(1,'jino','jino@test',sysdate,30 );      
insert into employee2(id,name,email,date2,working_days)
values(2,'jino2','jino2@test',sysdate,40 );
insert into employee2(id,name,email,date2,working_days)
values(3,'jino3','jino3@test',sysdate,15 );
insert into employee2(id,name,email,date2,working_days)
values(4,'jino4','jino4@test',sysdate,15 );
commit;

select * from employee2;


