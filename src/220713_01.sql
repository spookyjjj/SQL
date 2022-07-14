create database my_db; -- database 만들기

show databases;

use my_db;

show tables; -- 지금은 암것도 없음

-- 사람테이블 생성 -> 칼럼 2개 1. 이름(문자열) 2. 나이(정수))
create table persons ( -- 괄호 안에 칼럼 속성들 적어주면 됨
	name varchar(10), -- sql의 경우, 문자열의 길이도 신경써줘야 함
    age int
); 

show tables;
desc persons; -- 확인해보기
select * from persons;

-- 행넣기 메소드 insert into 테이블이름 (칼럼 순서) valuse (값 순서);
insert into persons (name, age) values ("홍길동", 23);
insert into persons (name, age) values ("스티븐킹", 40);
insert into persons (age, name) values (30, "브루스리"); -- 순서에만 맞게 넣어주면 됨
-- select * from persons; 

insert into persons (name, age) values ("철수", 20), ("철수", 30), ("철수", 40); -- 여러줄 동시에 집어넣기도 가능
-- select * from persons; 

delete from persons; -- 테이블의 모든 행이 전부 제거됨, 테이블은 남아있음
-- select * from persons; 

drop table persons; -- 테이블 자체도 제거
-- show tables; 

-- 책 테이블 작성 (제목: 문자열, 가격: 정수)
create table book (
	title varChar(20),
    price int
);
insert into book (title, price) value ("파워자바", 25000);
insert into book (title, price) value ("하늘과 바람과 별과 시", 15000);
insert into book (title, price) value ("꽃을 보듯 너를 본다", 12000);
select * from book;

-- 문자열 표현
-- char(5); -- 고정길이 : 모자란 만큼은 공란으로 채운다
-- varChar(5); -- 가변길이

create table testChar (
	fixLength char(5),
    varLength varChar(5)
);
insert into testChar (fixlength, varlength) values ('a', 'a');
-- set sql_mode = 'pad_char_to_full_length'; -- mysql의 char 최적화 끄는 메소드~
select char_length(fixlength), char_length(varlength) from testChar;
select concat(fixlength, 'b') from testChar;

-- 최적화 없는 db쓸때는 데이터 낭비를 줄이기 위해 빈칸 제거하기 필요
select 'a                      ';
select rtrim('a                      '); -- rtrim 오른쪽 공백 제거, 기본적으로는 우측에 공백 생기니깐 이거쓰면 됨
select ltrim('                      a'); -- ltrim 왼쪽 공백 제거
