-- 집계 함수 count(*)
select * from employees;
select count(*) from employees; -- 총 직원들의 수! 즉 employees테이블 행의 개수

-- 전화번호가 515로 시작하는 직원을 조회하는 쿼리문 & 그 직원의 수를 조회하는 쿼리문
select * from employees where PHONE_NUMBER like '515%';
select count(*) from employees where PHONE_NUMBER like '515%';

-- 집계 함수 sum()
select sum(SALARY) from employees; -- 여러행의 salary 정보를 다 더해줌

-- 집계 함수 avg()
select avg(SALARY) from employees;

-- 집계 함수 max()
select max(SALARY) from employees;

-- 집계 함수 min()
select min(SALARY) from employees;

-- 최대연봉과 최소연봉의 차를 구해봅시다
select max(salary) - min(salary) from employees;