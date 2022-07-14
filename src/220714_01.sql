-- 부서 id가 90인 직원들의 인원 수
select count(*) from employees where DEPARTMENT_ID = 90;
-- 부서 id가 60인 직원들의 인원 수
select count(*) from employees where DEPARTMENT_ID = 60;
-- 부서 id가 30인 직원들의 인원 수
select count(*) from employees where DEPARTMENT_ID = 30;

-- 이렇게 일일이 하지 않고 부서별로 인원 수를 싹다 구하는 법? -> group by!!
select department_id, count(*) from employees group by DEPARTMENT_ID;
-- 부서별 최고 연봉, 최저 연봉, 평균 연봉, 연봉 합? <- group by는 집계함수와 쿵짝이 잘 맞음
select DEPARTMENT_ID, max(salary), min(salary), avg(salary), sum(salary) from employees group by DEPARTMENT_ID;
-- job_id를 중복없이 보고싶음 <- 이럴때도 group by사용가능
select job_id from employees group by JOB_ID;
select distinct job_id from employees; -- 근데 보통 distinct를 많이 사용
-- 둘의 차이점?
select job_id, last_name from employees group by JOB_ID; -- group by : 그룹 당 맨 위의 1명을 델꼬옴 포인트가 JOB_ID별로 그룹 나누는거니깐
select distinct job_id, last_name from employees; -- distinct : 완벽하게 동일해야 중복으로 여겨서 제거한다

-- 직원 테이블 last_name 중복 제거하고 조회
select distinct last_name from employees;
-- 직원 테이블 last_name 그룹 별로 인원 수 조회
select last_name, count(*) from employees group by last_name;

-- last_name 그룹의 카운트가 2 이상인 행들만 조회
select last_name, count(*)
from employees 
-- where(X) : ★where절은 from에서 테이블 가져올 때 동작한다 -> where절 안에서는 count(*)의 존재를 모음
group by last_name 
having count(*) > 1; -- having절은 group 지어지고 난 후에 동작한다

-- 위의 성을 가지는 직원 목록 조회 -> 서브쿼리 이용
select * from employees where last_name in (
	select last_name
	from employees 
	group by last_name 
	having count(*) > 1
);

-- 5번째로 연봉을 적게 받는 직원들 목록 조회
select distinct salary from employees order by salary asc limit 1 offset 4; -- 5번째 로 연봉을 적게 받는거 2600
select * from employees where salary = ( -- 서브쿼리로 집어넣어서 구해냄
	select distinct salary from employees order by salary asc limit 1 offset 4
);

-- 상위 연봉 50명(후순위는 이름)에 대해서 부서별로 몇 명씩 있는지
select * from employees order by salary desc, first_name asc limit 50;
select department_id, count(*) from (
	select * from employees order by salary desc, first_name asc limit 50
) as top50
group by department_id;