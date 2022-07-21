-- 테이블 복사는 실제로 테이블이 만들어짐! -> 나중에 drop해줘야함
create table persons_copy like persons;

select * from persons_copy;
insert into persons_copy (firstname, lastname, age, email) select firstName, lastname, age, email from persons;
-- ★★values가 아니라 select한 내용이 insert된다~!!!
-- 필요한 결과만 넣은 copy가 필요하면 insert할 때 where절도 사용 가능~!!

create table persons_copy2 select * from persons;
select * from persons_copy2;
-- 아니면 아예 만들때 부터 select결과로 테이블 만듬
-- ★대신 얘는 데이터만 복사되었을 뿐 제약사항과 같은 테이블 설정은 복사가 되지 않음!!

-- 임시 테이블은 실제로 테이블이 만들어 지는것은 아님!!
-- 접속이 유지되는 동안만 존재, 세션을 끊으면 없어진다
create temporary table mytable (
	mynum int,
    mystr varchar(100)
);

select * from mytable;
insert into mytable values (1, 'a');