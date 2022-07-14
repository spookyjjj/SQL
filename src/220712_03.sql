select * from country where name = "south korea" or name = "japan" or name = "china"; -- 이런거 자주쓰니깐
select * from country where name in ('south korea', 'japan', 'china'); -- 이렇게 in을 이용해서 표현가능~
select * from country where name not in ('south korea', 'japan', 'china'); -- 부정은 not in

select * from country where Population >= 40000000 and Population <= 50000000; -- 이것도 자주쓰니깐
select * from country where Population between 40000000 and 50000000; -- 이렇게 between and를 이용해서 표현가능~
select * from country where Population not between 40000000 and 50000000; -- 부정은 not between

-- continent 칼럼 값이 north america, europe, asia를 제외한 국가들 중
-- gnp 값이 100이상 1000이하인 국가 목록 조회하기
select * from country where Continent not in ("north america", "europe", "asia") and gnp between 100 and 1000;

select * from country where IndepYear = null; -- 안나온다!! = + - <> % 다 안먹는다 결과가 null로 나와버림ㅎㅎ

select * from country where IndepYear is null; -- null만은 연산자 대신에 is를 쓴다~

select * from country where IndepYear is not null; -- 부정은 is not

select * from country where IndepYear != 'null'; -- 이렇게 해도 되기는 하는데,, 표준어는 아니다~~