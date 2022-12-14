select * from CART;
select * from CART_VIEW;


select * from ORDERS;
select *  from ORDER_DETAIL;

select * from ORDER_VIEW
where mname like '%%%';

select ORDERS_SEQ.currval from dual;

select * from  user_sequences;
select last_number from user_sequences
where sequence_name ='ORDERS_SEQ';

select * from product;


select * from order_view
where mname like '%±è³ª¸®%';


select * from ORDER_DETAIL;

select * from member 
where name like '%³ª¸®%' 
order by indate desc;


select * from qna 
order by indate desc;





