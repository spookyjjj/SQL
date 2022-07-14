-- select 칼럼 from 테이블 where 행조건

select * from country; -- country table에 있는 자료 다 보여주라

select * from city; -- 데이터 보여주기가 1000줄로 제한되어있어서 1000줄까지만 일단 보여줌

select Name, population from city; -- ★select 뒤에 컬럼이름만 불러서 걔만 조회하는게 가능

describe country; -- describe/desc는 테이블의 구조를 볼 수 있는 명령어

-- country 테이블에서 code열과 gnp열을 조회해 보세요
select code, gnp from country;

select * from country where code = 'KOR'; -- ★where 뒤에 행의 조건을 불러서 걔만 조회하는게 가능

-- 국가명이 Japan인 행을 조회해 보세요
select * from country where name = 'japan'; -- ''안에서도 대소문자 구분 안함
-- continent가 asia인 행을 조회해 보세요
select * from country where continent = 'asia';

select * from country where name = "south korea" or name = "japan" or name = "china"; -- or연산자를 ||대신에 or 그대로 쓰는 편임 &&도 and로,,

-- population 값이 40,000,000이상인 국가의 모든 칼럼을 조회
select * from country where Population >= 40000000;
-- population 값이 40,000,000이상이고 50,000,000이하인 국가의 모든 칼럼을 조회
select * from country where Population >= 40000000 and Population <= 50000000;
-- continent asia를 제회한 국가 목록 조회
select * from country where Continent <> 'asia';