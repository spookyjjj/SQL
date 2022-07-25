select 1, 2, 3
union
select 4, 5, 6
union
select 7, 8, 9
union -- ★중복되는 행은 distinct처럼 무시됨!!
select 1, 2, 3
union all -- ★애는 중복되는 행도 같이 합해줌
select 1, 2, 3; 

select * from my_db.book;

select * from book where price between 1000 and 10000
union
select * from book where title like '책%';

select title, price, bookid from book where price between 1000 and 10000
union
select * from book where title like '책%'; -- 칼럼의 개수, 순서, 타입이 다른데 붙이면 개판나니 주의 필요,,
-- mySql이 좀 대책도 없고 그럼,,

select * from persons;
select * from test;
select * from persons, test; -- 곱집합(cross join) persons의 모든 행에 test의 모든 행이 있게 된다 

select * from menu;
select * from restaurant; 
-- 애초에 쪼개져 있는 이유? 한 쪽 데이터의 수정, 삭제, 등록에 다른 쪽이 영향을 받으므로 따로 테이블을 관리한다~

-- 그럼 두 테이블의 결합은? 외래키를 이용해 join시켜준다~
select * from menu as a left join restaurant as b on a.restid = b.id; -- outter join ('기준'  : left, right)
select * from restaurant as a left join menu as b on a.id = b.restid; -- '기준'은 무조건 다 나오는 쪽!

select * from restaurant as a inner join menu as b on a.id = b.restid; -- inner join (null값 빼줌)

select * from persons;
select * from book;
select * from book as a join persons as b on a.owner = b.personid;
select a.*, b.firstname, b.lastname from book as a join persons as b on a.owner = b.personid;