use world;
show tables;
select * from country;

select case when 10 > 5 then '10은 5보다 큽니다' else '왼쪽이 오른쪽보다 작거나 같습니다' end; -- case end 사용!
-- case when 조건식 then 참일 때 출력 else 거짓일 때 출력 end;
select case when 10 > 5 then '왼쪽'
			when 10 = 5 then '같음'
            when 10 < 5 then '오른쪽'
            end as '비교';
            
-- lifeexpectancy 값이 null인 경우, 특정 값(0.0)으로 대체해서 표현하고픔            
select name, 
lifeexpectancy 
from country;
select name, 
case when lifeexpectancy is null then 0.0 else lifeexpectancy end as life 
from country;

-- 직원이름(이름+성)해서 fullname
-- 전화번호가 011으로 시작하면 개인전화 그외는 내선번호..별명은 분류라고..
use hr;
select * from employees;
select concat(First_name, " ", last_name) as fullname, 
case when phone_number like '011%' then '개인전화' else '내선번호' end as 분류 
from employees;

