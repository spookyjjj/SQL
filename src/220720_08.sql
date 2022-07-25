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
select a.*, b.FIRST_NAME, b.LAST_NAME from departments as a
left outer join employees as b on a.MANAGER_ID = b.EMPLOYEE_ID;

-- 2. 부서명이 IT로 시작하는 부서명과 근무하는 직원들의 이름 조회
select a.department_name, b.FIRST_NAME, b.LAST_NAME from (
	select * from departments as a where department_name like 'it%'
) as a
left join employees as b on a.department_id = b.department_id;
select * 
from departments a
left join employees b on a.department_id = b.department_id -- 일단 a와 b를 전부 붙인 후에
where department_name like 'it%'; -- it로 시작하는 애들만 골라냄 (조건은 join한 후에 적용되니깐~!)

-- 3. 모든 직원들의 이름과 직책(JOB_TITLE) 조회
select a.FIRST_NAME, a.LAST_NAME, b.JOB_TITLE from employees as a
left join jobs as b on a.JOB_id = b.JOB_id;

-- 4. 직원의 해당 직책의 JOBS 테이블에 책정된 최대 연봉(MAX_SALARY)이상의 연봉을 받는 직원이름, 현재연봉, 최대연봉 조회
select FIRST_NAME, LAST_NAME, SALARY, MAX_SALARY from (
	select a.FIRST_NAME, a.LAST_NAME, a.SALARY, b.JOB_TITLE, b.MAX_SALARY from employees as a
	left join jobs as b on a.JOB_id = b.JOB_id
) as c 
where c.SALARY >= c.MAX_SALARY; -- 굳이 이렇게 할 필요 없이 표 붙이고서 바로 where절 쓰면 된다~
select a.FIRST_NAME, a.LAST_NAME, a.SALARY, b.JOB_TITLE, b.MAX_SALARY from employees as a
left join jobs as b on a.JOB_id = b.JOB_id
where a.SALARY >= b.MAX_SALARY;
select a.FIRST_NAME, a.LAST_NAME, a.SALARY, b.JOB_TITLE, b.MAX_SALARY from employees as a
inner join jobs as b on a.JOB_id = b.JOB_id and a.salary >= b.max_salary; -- and 붙이고 이너조인써도 됨! 

-- 5. 부서의(COUNTRY_ID)가 'US'인 부서에서 근무하는 직원명과 부서명 조회
select a.FIRST_NAME, a.LAST_NAME, b.department_name, c.location_id, c.COUNTRY_ID from employees as a
left join departments as b on a.DEPARTMENT_ID = b.DEPARTMENT_ID
left join locations as c on b.location_id = c.location_id
where c.country_id = 'us'; -- 조건은 join하여 테이블 다 완성 후에 적용