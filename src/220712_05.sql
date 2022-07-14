-- 패턴검색
select * from country
where name like '%korea%'; -- like는 범위 설정하게 해줌 %안의 단어%들어갔다면 다 찾아줌

select * from country
where name like '%k%'; -- k 포함된 놈 다 찾아

select * from country
where name like '%k'; -- k로 끝나는 놈 다 찾아

select * from country
where name like 'k%'; -- k로 시작하는 놈 다 찾아

-- 국가 이름이 a로 시작하고 a로 끝나는 국가 조회
select * from country
where name like 'A%A';
-- 국가 이름이 a로 시작하고 a로 끝나는 국가 조회 (6자)
select * from country
where name like 'A____A'; -- 언더바로 글자수 지정도 가능함
-- 국가 이름이 -ria로 끝나는 국가 조회
select * from country
where name like '%ria';
-- region 칼럼이 north- 로 시작하는 국가 조회
select * from country
where region like 'north%';
-- region 칼럼이 a로 시작해서 a로 끝나는 명칭을 포함하지 않는 국가 조회
select * from country
where region not like '%a%a' and region not like 'a%a%'; -- 부정은 not like

