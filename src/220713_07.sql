-- hr의 부서테이블의 모든 행과 열 조회alter
use hr;
select * from departments;
-- 부서명이 it로 시작하는 부서들 조회
select * from departments where department_name like 'it%';
-- -> department_id가 60, 210, 230임
-- 해당 부서의 직원들 불러오기 by department_id
select * from employees where department_id in (60, 210, 230);

-- ★위의 과정을 한 단계로 줄이기
select * from employees where department_id in (
	select department_id from departments where department_name like 'it%' -- 서브쿼리를 이용!
);

-- 연봉 내림차순 조회 -> 연봉 top10을 보는데, 걔들을 오름차순으로 보고싶당ㅎㅎ 얘도 서브쿼리 이용!
select * from employees order by salary desc limit 10; -- 이 결과같이 테이블 형태다~ 그 점을 이용하면,
select * from (
	select * from employees order by salary desc limit 10
) as a -- ★테이블에 별명을 붙여줘야함 안하면 에러,, 따옴표 없이 바로 쓴다~ 따옴표 쓰면 오히려 안됨;;;
order by salary asc; 

-- 직원들 중에 david austin의 연봉과 같은 연봉을 받는 직원들 조회
select * from employees where salary = (
	select salary from employees where first_name = 'david' and last_name = 'austin' -- 4800임
);
