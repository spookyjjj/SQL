-- 학생 테이블 (이름:가변길이문자열10, 나이:정수, 학점:실수)
create table student (
	name varchar(10),
    age int, -- bigInt라는 것도 있는데 long과 유사~
    score double
);
insert into student (name, age, score) values ("길동", 20, 3.3);
insert into student (name, age, score) values ("둘리", 20.5, 3); -- 20.5를 어떻게든 정수형으로 해석하려고 해서 반올림 됨
select * from student;

insert into student (name, age, score) values ("길동", 21, 2.6);

delete from student where name = '둘리';
