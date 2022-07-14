-- hr 데이터베이스 사용하기 명령어 작성
-- employees(직원) 테이블의 구조(어떠한 컬럼이 있는지)를 조회해 보세요
-- employees(직원) 테이블의 모든 행의 모든 열을 조회해 보세요
-- 직원 테이블의 first_name(이름) 열의 값이 John인 직원을 조회해 보세요
-- 직원 테이블의 last_name(성) 열의 값이 John을 포함하는 직원 조회해 보세요
-- 직원 테이블의 이름의 값이 6글자인 직원 조회
-- 직원 테이블 salary(연봉) 열의 값이 10000 ~ 15000인 직원 조회
-- 직원테이블의 이름, 성, 연봉 컬럼과 연봉의 6%를 연산하여 tax라는 별명의 컬럼으로 조회하세요

show databases;
use hr; -- hr 데이터베이스 사용하기 명령어 작성
show tables;
describe employees; -- employees(직원) 테이블의 구조(어떠한 컬럼이 있는지)를 조회해 보세요
select * from employees; -- employees(직원) 테이블의 모든 행의 모든 열을 조회해 보세요
select * from employees where first_name = 'john'; -- 직원 테이블의 first_name(이름) 열의 값이 John인 직원을 조회해 보세요
select * from employees where last_name like '%john%'; -- 직원 테이블의 last_name(성) 열의 값이 John을 포함하는 직원 조회해 보세요
select * from employees where first_name like '______'; -- 직원 테이블의 이름의 값이 6글자인 직원 조회
select * from employees where salary between 10000 and 15000; -- 직원 테이블 salary(연봉) 열의 값이 10000 ~ 15000인 직원 조회
select first_name as '이름', last_name as '성', salary as '연봉', round (salary * 0.06, 1) as 'tax' from employees; -- 직원테이블의 이름, 성, 연봉 컬럼과 연봉의 6%를 연산하여 tax라는 별명의 컬럼으로 조회하세요
