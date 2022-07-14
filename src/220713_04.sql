create table book (
	bookid int primary key auto_increment, -- auto_increment : key를 자동으로 ++해사며 할당해 주는 기능
	title varchar(30),
    price int
);
drop table book;
desc book;
insert into book (title, price) values ('책1', 2000), ('책2', 3000), ('중복이름', 2500), ('중복이름', 3000);
select * from book;

delete from book where bookid = 3;
insert into book (title, price) values ('새책', 2000); -- 빈 공간인 3에 안들어가고 5에 새로 만들어 들어감 (auto_increment는 증가만 함)