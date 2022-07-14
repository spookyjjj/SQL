select code as '코드', name as '이름', population as '인구' from country; -- 칼럼에 이름 붙이기가 가능

-- 위의 조회 + surface area(별명 면적) 컬럼을 추가로 조회
select code as '코드', name as '이름', population as '인구', SurfaceArea as '면적' from country;

select code as '코드', name as '이름', population as '인구', SurfaceArea as '면적', 15 + 15 from country; -- 연산이 일어난 칼럼 추가 가능

select code as '코드', name as '이름', population as '인구', SurfaceArea as '면적', 15 + 15 as '계산결과' from country; -- 위의 것에도 이름짓기 가능

select code as '코드', name as '이름', population as '인구', SurfaceArea as '면적', Population / SurfaceArea as '인구밀도' from country; -- 각 행에 맞게 계산

select name as '이름', population as '인구', SurfaceArea as '면적', round( population / SurfaceArea, 1) as '인구밀도' from country; -- round (값, 자리수)

-- surface area가 50,000이하이면서 population이 10,000,000이상인 국가의 인구밀도를 조회하세요
select name as '이름', population as '인구', SurfaceArea as '면적', round( population / SurfaceArea, 1) as '인구밀도' 
from country 
where SurfaceArea <= 50000 and Population >= 10000000; -- where 면적 <= 50000 and 인구 >= 10000000가 안먹는 이유? 순서 때문! 조건찾기 -> 선택 -> 별명짓기 순서임

select name as '이름', population as '인구', SurfaceArea as '면적', round( population / SurfaceArea, 1) as '인구밀도' 
from country
order by Population; -- 젤마지막! where이 있으면 where절 다음
-- order by 인구; 가능! 순서가 선택 -> 별명짓기 -> 정렬 

select name as '이름', population as '인구', SurfaceArea as '면적', round( population / SurfaceArea, 1) as '인구밀도' 
from country
order by 인구밀도 desc; -- asc: 오름차순 // desc: 내림차순

-- 아시아 대륙 국가들의 인구 순으로(내림차순) 조회하기
select * from country where Continent = 'asia' order by Population desc;

-- lifeExpextancy 오름차순 조회 (null값 제외)
select * from country where LifeExpectancy is not null order by LifeExpectancy asc; 

-- 국가 이름, 인구, gnp, gnpold 조회 gnpold와 gnp의 차를 구해서 같이 조회 (내림차순)
select name, population, gnp, gnpold, gnp - gnpold as 'GNP 변화량' 
from country 
where gnp is not null and gnpold is not null 
order by `gnp 변화량` desc; -- 만약 컬럼이름에 스페이스가 있다면 그냥 (GNP 변화량)으로 불러서는 찾지를 못함
-- ★따라서 sql에서 특이하게 사용하는 `이거!! tab위에 있는 이거!!``를 쓰면 객체의 이름으로 인식해서 읽어옴

-- 대륙 순으로 정렬해서 조회
select * from country order by Continent, Population; -- 정렬에 2차적 기준을 줄 수 있다

-- governmentform 오름차순, gnp내림차순 정렬 조회
select * from country order by GovernmentForm asc, gnp desc;