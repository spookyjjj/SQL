create table persons (
	personid int primary key auto_increment,
	firstname varchar(10) not null, -- null값을 허용하지 않는다는 제약을 개별적으로 설정 가능
    lastname varchar(10) not null,
    age int not null,
    email varchar(50) not null unique -- 중복을 허용하지 않는다는 제약을 개별적으로 설정 가능
);
select * from persons;
drop table persons;

insert into persons (firstname, lastname, age, email) values (null, null, null, null); -- not null 걸려있어서 에러 뜸
insert into persons (firstname, lastname, age, email) values ('길동', '홍', 42, '길동@홍길동.com');
insert into persons (firstname, lastname, age, email) values ('길동', '고', 40, '길동@홍길동.com'); -- 이메일이 중복이라서 에러 뜸
insert into persons (firstname, lastname, age, email) values ('길동', '고', 40, '길동@고길동.com');