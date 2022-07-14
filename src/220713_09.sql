-- 각 직원들의 이름과 연봉, 평균연봉과의 차를 조회해 보세요
-- 최고 연봉직원과 최저 연봉 직원의 이름을 조회해 보세요
-- 평균 연봉보다 높게 받는 직원 조회
-- 부서명이 it로 시작하는 직원들의 수를 조회해 보세요
-- douglas grant의 이메일을 'dog@naver.com'으로 변경해보세요
-- ellen abel과 같은 부서에 근무하는 직원을 연봉 내림차순으로 정렬해서 조회해 보세요
-- 부서명이 it로 시작하는 부서에서 근무하는 최고연봉자보다 높은 연봉을 받는 직원 조회 
-- 자기가 속한 부서의 평균보다 많이 받는 직원 조회

select * from employees;

-- 각 직원들의 이름과 연봉, 평균연봉과의 차를 조회해 보세요
select first_name, salary, (
	salary - (select avg(SALARY) from employees)
) as 연봉차 from employees;

-- 최고 연봉직원과 최저 연봉 직원의 이름을 조회해 보세요
select first_name, last_name, SALARY from employees 
where SALARY = (
	select max(SALARY) from employees
) or salary = (
	select min(SALARY) from employees
);
select first_name, last_name, SALARY from employees  -- 선생님 풀이
where SALARY in ((select max(SALARY) from employees), (select min(SALARY) from employees));

-- 평균 연봉보다 높게 받는 직원 조회
select * from employees where SALARY >= (
	select avg(SALARY) from employees
);

select * from departments;
-- 부서명이 it로 시작하는 직원들의 수를 조회해 보세요
select count(*) from employees where department_id in (
	select department_id from departments where department_name like 'it%' -- 60, 210, 230
);

-- douglas grant의 이메일을 'dog@naver.com'으로 변경해보세요
update employees set email = 'dog@naver.com' where first_name = 'douglas' and last_name = 'grant';

-- ellen abel과 같은 부서에 근무하는 직원을 연봉 내림차순으로 정렬해서 조회해 보세요
select * from employees where DEPARTMENT_ID = (
	select department_id from employees where first_name = 'ellen' and last_name = 'abel'
) order by salary desc;

-- 부서명이 it로 시작하는 부서에서 근무하는 최고연봉자보다 높은 연봉을 받는 직원 오름차순 조회 
select * from employees where salary >= (
	select max(SALARY) from (
		select * from employees where department_id in (
			select department_id from departments where department_name like 'it%'
		)
    ) as a
) order by salary asc;
select * from employees where salary >= ( -- 선생님 풀이
	select max(SALARY) from employees where department_id in (
			select department_id from departments where department_name like 'it%'
    ) 
) order by salary asc;

-- 자기가 속한 부서의 평균보다 많이 받는 직원 조회??? 오늘 배울거임
select * from employees where SALARY >= (
	select avg(SALARY) from (
		select * from employees where DEPARTMENT_ID = (
			select DEPARTMENT_ID
        )
    ) as a
);