select 1, 2, 3
union
select 4, 5, 6
union
select 7, 8, 9
union -- 중복되는 행은 distinct처럼 무시됨!!
select 1, 2, 3
union all -- 애는 중복되는 행도 같이 합해줌
select 1, 2, 3; 

select * from my_db.book;

select * from book where price between 1000 and 10000
union
select * from book where title like '책%';

select title, price, bookid from book where price between 1000 and 10000
union
select * from book where title like '책%'; -- 이렇게 순서 개판되는 경우가 있으니 주의 필요,, mySql이 좀 그럼,,

select * from persons;
select * from test;
select * from persons, test; -- 곱집합(cross),, persons의 모든 행에 test의 모든 행이 있게 된다 

select * from menu;
select * from restaurant; 

-- 외래키의 id와 기본키의 id가 같을때 결합
select * from menu as a left join restaurant as b on a.restid = b.id; -- outter join (left, right)
select * from restaurant as a left join menu as b on a.id = b.restid;

select * from restaurant as a inner join menu as b on a.id = b.restid; -- inner join (null값 빼줌)

select * from persons;
select * from book;
select * from book as a join persons as b on a.owner = b.personid;
select a.*, b.firstname, b.lastname from book as a join persons as b on a.owner = b.personid;

/*
부서 -- (emloyee.department_id) ->(참조)-> (department.department_id)
직책 -- (employees.job_id) ->(참조)-> (job.job_id)
매니저 -- (departments.manager_id) ->(참조)-> (employees.employee_id)
위치 -- (department_id.location_id) ->(참조)-> (location.location_id)
-- 1. 모든 부서의 부서명과 관리자의 이름 (외래키 MANAGER_ID -> employees (employee_id 참조))의 이름
-- 2. 부서명이 IT로 시작하는 부서명과 근무하는 직원들의 이름 조회
-- 3. 모든 직원들의 이름과 직책(JOB_TITLE) 조회
-- 4. 직원의 해당 직책의 JOBS 테이블에 책정된 최대 연봉(MAX_SALARY)이상의 연봉을 받는 직원이름, 현재연봉, 최대연봉 조회
-- 5. 부서의(COUNTRY_ID)가 'US'인 부서에서 근무하는 직원명과 부서명 조회
*/

-- 1. 모든 부서의 부서명과 관리자의 이름 (외래키 MANAGER_ID -> employees (employee_id 참조))의 이름
select a.DEPARTMENT_NAME, b.FIRST_NAME, b.LAST_NAME from departments as a
left join employees as b on a.MANAGER_ID = b.EMPLOYEE_ID;

-- 2. 부서명이 IT로 시작하는 부서명과 근무하는 직원들의 이름 조회
select * from departments as a where department_name like 'it%';
select * from employees where department_id in (60, 210, 230);
select a.department_name, b.FIRST_NAME, b.LAST_NAME from (
	select * from departments as a where department_name like 'it%'
) as a
left join employees as b on a.department_id = b.department_id;

-- 3. 모든 직원들의 이름과 직책(JOB_TITLE) 조회
select a.FIRST_NAME, a.LAST_NAME, b.JOB_TITLE from employees as a
left join jobs as b on a.JOB_id = b.JOB_id;

-- 4. 직원의 해당 직책의 JOBS 테이블에 책정된 최대 연봉(MAX_SALARY)이상의 연봉을 받는 직원이름, 현재연봉, 최대연봉 조회
select a.FIRST_NAME, a.LAST_NAME, a.SALARY, b.JOB_TITLE, b.MAX_SALARY from employees as a
left join jobs as b on a.JOB_id = b.JOB_id
where c.SALARY >= c.MAX_SALARY;
select FIRST_NAME, LAST_NAME, SALARY, MAX_SALARY from (
	select a.FIRST_NAME, a.LAST_NAME, a.SALARY, b.JOB_TITLE, b.MAX_SALARY from employees as a
	left join jobs as b on a.JOB_id = b.JOB_id
) as c 
where c.SALARY >= c.MAX_SALARY; -- 굳이 이렇게 할 필요 없이 표 붙이고서 바로 where절 쓰면 된다~

-- 5. 부서의(COUNTRY_ID)가 'US'인 부서에서 근무하는 직원명과 부서명 조회
select a.FIRST_NAME, a.LAST_NAME, b.department_name, c.location_id, c.COUNTRY_ID from employees as a
left join departments as b on a.DEPARTMENT_ID = b.DEPARTMENT_ID
left join locations as c on b.location_id = c.location_id
where c.country_id = 'us';
