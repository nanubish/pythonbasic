show databases;

use python;    # 파이선 데이터베이스를 쓰겠다 선언

create table test (          # 들여쓰기 강제하지 않음
   id int auto_increment primary key
   );
   
   desc test;
   
insert into test values(); 
   # insert into뒤에 컬럼번호를 쓸수 있음 (col1, col2,,), 모든 컬럼에 적용할때는 생략가능
   # values() 안에도 컬럼수만큼 밸류값을 써야함, 테이블을 생성할때 autu_increment로 넣었기 때문에 생략가능alter
select * from test;    # *는 모든 필드에대해 조회한다는 뜻, 필드명(id, name 등)으로 대체하면 특정 필드를 조회한다는 뜻 / test는 테이블 이릅
					   #  1이 생성된게 보이면 innsert into test values()여러번 실행시켜서 다시보면 늘어난게 보임alter
 
select max(id) from test;  # id에서 가장 큰값 확인 

insert into test values(150);    # 맥스값 설정
select * from test;
 
delete from test where id = 10;   # 필드를 지우는건 수정이고, 행응 지울때는 delete
select * from test;

insert into test values();  
select * from test; 


delete from test;   # 테이블 전부다 삭제됨  rollback으로 되살림
					# safety 모드를 끄고헤야 에러발생안함. 상단 edit->preference->sql editor-> 하단에 safe update값 체크해제 -> 다시 껐다가 다시시작해서 
select * from test;  # 다 지워짐 확인


insert into test values();   # 지워진 행 이후로 값이 들어감 확인
select * from test;

show table status where name='test2';
show table status;
show table status where name='test';  # auto increment에 값이 112로 지정되어있어서임
-- where name='test2';   주석처리

alter table test auto_increment=1;   # 다시 value 값을 1로 바꿈 단 데이터가 없어야함
show table status;



set @count=0;     # auto_increment 값을 초기값으로 수정
update test set id=@count:=@count+1;   -- id 필드 값으로 set해줌
select * from test;
insert into test values();   
select * from test;



create table table1 (
column1 varchar(100),
column2 varchar(100),
column3 varchar(100)
);
desc table1;     

# [데이터넣기]
insert into table1 (column1, column2, column3) values ('a','aa','aaa');
select*from table1;
insert into table1 (column4, column5) values ('b','bb');
select*from table1;

update table1 set column1='z';   # 특정 컬럼값 변경  
   -- 특정 컬럼만 업데이트 update table1 set column1='x'where column2='aa';
select*from table1;
update table1 set column1='x'where column2='aa';
select*from table1;

--update table1
--set column1='y',


# 테이블 삭제
delete from table1 where column1='z';
select*from table1;

delete from table1;
----------------------------------------------------------------

drop table if exists day_visitor_realtime;   # 기존 테이블 삭제(테이블 존재시)

create table if not exists day_visitor_realtime (
ipaddress varchar(16),
iptime_first datetime,
before_url varchar(250),
device_info varchar(40),
os_info varchar(40),
session_id varchar(80));
select*from day_visitor_realtime;

insert into day_visitor_realtime (
ipaddress, iptime_first, before_url, device_info)
values ('192.168.00.1', '2023-2-23 11:38:22' , 'localhost','pc'),
('192.168.00.2', '2023-2-23 11:35:22','localhost','ipphone');
select * from day_visitor_realtime;
desc day_visitor_realtime;

insert into day_visitor_realtime (
ipaddress, iptime_first, before_url, device_info)
         # varchar(16)
values('1234567890123456','2023-02-22 11:34:22','localhost','pc');
   # varchar(16)의 17자리의 값을 넣어서 에러 발생
   
 insert into day_visitor_realtime (session_id) values   # row단위 추가
 ('12345.67890');
  insert into day_visitor_realtime (session_id) values  
 ('1234.567890');
 insert into day_visitor_realtime (session_id) values  
 ('123'); 
  insert into day_visitor_realtime (session_id) values  
 ('12345');
  insert into day_visitor_realtime (session_id) values  
 ('67890');
 select*from day_visitor_realtime;
 
 
insert into day_visitor_realtime (
ipaddress, iptime_first, before_url, device_info)
values('567890123456','2023-02-22 11:34:22','localhost','galaxy');
select * from day_visitor_realtime


create table if not exists day_visitor_realtime (
ipaddress varchar(16) not null,  # 값이 null이 되지않게 강제함
iptime_first datetime,
before_url varchar(250),
device_info varchar(40),
os_info varchar(40),
session_id varchar(80));
select*from day_visitor_realtime;

DROP TABLE IF EXISTS day_visitor_realtime;
CREATE TABLE day_visitor_realtime (
  id INT,                       
  ipaddress varchar(16),
  iptime_first datetime,
  before_url varchar(250),
  device_info varchar(40),
  os_info varchar(40),
  session_id varchar(80),
  PRIMARY KEY(id)     # id를 pk로 지정, 테이블당 하나만 지정되므로 컬럼이름이 업어도 구분가능
);


-------------------------------------------------------
# FK(foreign key) : pk이거나 unique한 컬럼만 가능

CREATE TABLE orders (
  order_id INT,
  customer_id INT,
  order_date DATETIME,
  PRIMARY KEY(order_id)
);

insert into orders (1,1,now());
insert into orders (2,1,now());
insert into orders (3,1,now());
 select*from orders;
 
 CREATE TABLE order_detail (
  order_id INT,
  product_id INT,
  product_name VARCHAR(200),
  order_date DATETIME,
  CONSTRAINT FK_ORDERS_ORDERID FOREIGN KEY (order_id) REFERENCES orders(order_id),
       # FK_ORDERS_ORDERID  <- FK 이름임
  PRIMARY KEY(order_id, product_id)
);

insert into order_detail (order_id, product_id, product_nama)
 values(1,100,'iphone')
      ,(1,101,'ipad');
      




