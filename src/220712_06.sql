select * from country limit 5; -- 위의 5행만 보여줌

-- 인구수가 가장 많은 국가 조회하기
select * from country order by population desc limit 1;
-- 면적이 가장 넓은 국가 top 5 조회
select * from country order by SurfaceArea desc limit 5;
-- continent가 asia인 국가들 중 면적이 좁은 top 10
select * from country 
where continent = 'asia'
order by SurfaceArea asc
limit 10;
-- region이 -africa로 끝나는 국가들 중 독립년도가 가장 최근인 10개 국가
select * from country 
where region like '%africa'
order by IndepYear desc
limit 10;
-- 인구당 면적 최상위 10개 국가 조회
select * from country 
order by Population / SurfaceArea desc
limit 10;
-- gnp 변화량 상위 10개 국가 조회
select * from country 
order by gnp - gnpold desc
limit 10;