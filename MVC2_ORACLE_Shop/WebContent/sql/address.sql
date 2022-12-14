alter table address 
drop primary key cascade;

CREATE TABLE address (
       zip_num              VARCHAR2(7) NOT NULL,
       sido                 VARCHAR2(30) NULL,
       gugun                VARCHAR2(30) NULL,
       dong                 VARCHAR2(100) NULL,
       zip_code             VARCHAR2(30) NOT NULL,
       bunji                VARCHAR2(30) NULL
);

INSERT INTO address ( zip_num, sido, gugun, dong, bunji,
zip_code ) VALUES ( 
'135-512', '서울', '강남구', '역삼2동 진달래아파트', '(10∼17동)', '446'); 
INSERT INTO address ( zip_num, sido, gugun, dong, bunji,
zip_code ) VALUES ( 
'135-918', '서울', '강남구', '역삼2동', '706∼707', '447'); 
INSERT INTO address ( zip_num, sido, gugun, dong, bunji,
zip_code ) VALUES ( 
'135-919', '서울', '강남구', '역삼2동', '708∼716', '448'); 
INSERT INTO address ( zip_num, sido, gugun, dong, bunji,
zip_code ) VALUES ( 
'135-920', '서울', '강남구', '역삼2동', '717∼724', '449'); 
INSERT INTO address ( zip_num, sido, gugun, dong, bunji,
zip_code ) VALUES ( 
'135-921', '서울', '강남구', '역삼2동', '725∼730', '450'); 
INSERT INTO address ( zip_num, sido, gugun, dong, bunji,
zip_code ) VALUES ( 
'135-514', '서울', '강남구', '역삼2동', '731∼734', '451'); 
INSERT INTO address ( zip_num, sido, gugun, dong, bunji,
zip_code ) VALUES ( 
'135-926', '서울', '강남구', '역삼2동', '754∼755', '452'); 
INSERT INTO address ( zip_num, sido, gugun, dong, bunji,
zip_code ) VALUES ( 
'135-927', '서울', '강남구', '역삼2동', '756∼768', '453'); 
INSERT INTO address ( zip_num, sido, gugun, dong, bunji,
zip_code ) VALUES ( 
'135-928', '서울', '강남구', '역삼2동', '769∼779', '454'); 
INSERT INTO address ( zip_num, sido, gugun, dong, bunji,
zip_code ) VALUES ( 
'135-515', '서울', '강남구', '역삼2동', '780∼788', '455'); 
INSERT INTO address ( zip_num, sido, gugun, dong, bunji,
zip_code ) VALUES ( 
'135-082', '서울', '강남구', '역삼2동', NULL, '456'); 

INSERT INTO address ( zip_num, sido, gugun, dong, bunji,
zip_code ) VALUES ( 
'135-080', '서울', '강남구', '역삼동', NULL, '457'); 

select * from address;
