# user

describe mysql.user;

show full columns from mysql.user;      # full 생략가능
select host, user                       # ; 꼭 실행
	from mysql.user;                    # 실행은 ctrl+enter
create user 'test'@'localhost' identified by '1234';    # local host : 내 피씨에서만 접근할 수 있는 계정

create user 'anywhere'@'%' identified by '1234';    # @ 사용시, 누구나 접속가능함
select user, host from mysql.user;                  # 생성여부 확인

create user 'test2'@'192,168.0.%' identified by '1234';  # 특정아이피 대역에서 접속가능
select user, host from mysql.user;

create or replace user 'test'@'localhost' identified by '1234';
select user, host from mysql.user;

create user if not exists 'test'@'localhost' identified by '1234';
select user, host from mysql.user;

rename user 'test2'@'192.168.0.%' to 'test3'@'%';    # 유저명변경
select user, host from mysql.user;

set password for 'test2'@'%' = password('12345');    # 패스워드 변경
select user, host from mysql.user;

drop user 'test2'@'%';

drop user if exists 'anywhere'@'%';
select user, host from mysql.user;


show databases;     # 데이터베이스 목록 조회
create database test;   # 데이터베이스 테스트라는 이름으로 생성 (왼편 schemas에서 생성여부 확인)

# 권한
show grants for 'test'@'localhost';   # 기존 권한 확인
grant all privileges on test.* to 'test'@'localhost';  # 모든 table(test.* )의 권한 test 유저에 부여  / 여기서 test는 데이터베이스
flush privileges;

grant all privileges on *.* to 'test6'@'localhost' identified by '1234';   
    # *.* 모든 데이터베이스를 말함. 데이터베이스를 만들면서 권한까지 부여alter
show grants for 'test'@'localhost';


# 권한 뺏기
revoke all on test.* from 'test'@'localhost';  
flush privileges;    # 권한에 관한건 민감하므로 과정 하나가 더 있음
show grants for 'test'@'localhost';


# 데이터베이스
show databases;
create database test;
create database if not exists test;   # test 데이터베이스가 없을때만 만들어라

drop database `test.test`;   # 데이터베이스 삭제
show databases;

# 특수문자 사용시
# ` (esc와 tab키 중간에 있는키)로 감싸면 에러 안남  (예) `test.test`;


# [ 데이터베이스 생성]
create database python;   # use mysql; select *from user;
use python;     

# [테이블 만들기]
 create table table1 (column1 VARCHAR(100));    #column (1개의 필드 값), VARCHAR(100)-> 최대 100개 길이의 가변문자
select database();    # 현재 사용중인 데이터베이스 확인 명령어
show tables;          # 테이블 목록 조회

rename table table1 to table2;   # 테이블 이름 변경하기
show tables

drop table table2;    # 테이블 삭제
show tables;


create table test_table (
	test_column1 int,       # 컬럼 생성
    test_column2 int,
    test_column3 int
    );
    desc test_table;
    
    alter table test_table    # 테이블 컬럼 추가
    add test_column4 int;
    desc test_table;
    
    alter table test_table  
    drop test_column1;     # 컬럼1 삭제
    desc test_table;
    
    alter table test_table
    modify test_column3 int   # 컬럼 위치 변경
    first;
    desc test_table;
    
    alter table test_table
    modify test column3 int
    alter test_column4;
    desc test_table;
    
    alter table test_table
    change test_column2 test_column0 int;
    desc test_table;
    
    
    alter table test_table
    change test_column0 test_column0 varchar(10);
    desc test_table;
    
    alter table test_table
    change test_column0 test_column2 int;   # 이름, 타입변경
    desc test_table;
    
    