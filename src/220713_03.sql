drop database my_db; -- db날리기

create database my_db;

use my_db;

create table students (
	number int primary key, -- map에서 key역할을, sql에서 똑같이 number가 하게 설정~
	name varchar(10),
    age int,
    score double
);

desc students; -- 주요키에는 화살표 표시가 되어있음

insert into students (number, name, age, score) values (null, '길동', 20, 3.3); -- 특징1. key를 null하면 안받아줌;; not null!!
insert into students (number, name, age, score) values (1234, '길동', 20, 3.3);
select * from students;

insert into students (number, name, age, score) values (1234, '희동', 23, 3.5); -- 특징2. key가 중복되면 안받아줌;; not duplicate!! 유니크해야함
insert into students (number, name, age, score) values (1235, '희동', 23, 3.5);
insert into students (number, name, age, score) values (1236, '길동', 20, 3.3); -- 같은 이름인 길동이라도 key가 다르니 다른애로 특정가능