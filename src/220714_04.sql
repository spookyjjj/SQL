select * from employees;
desc employees;

-- mySQL 날짜 : date
-- 시간 : time
-- 날짜 시간 : datetime / timestamp

select current_date();
select current_time();
select current_timestamp();
select date '2022-07-14';
select time '12:05:14';

-- hire_date가 1987년 6월인 직원들 목록
select * from employees where hire_date >= '1987-06-01' and HIRE_DATE <= '1987-06-30';
select * from employees where hire_date between '1987-06-01' and '1987-06-30'; -- 이걸로도 됨~
select * from employees where hire_date between '1987/06/01' and '1987/06/30'; -- 이것도 됨~ 날짜표현이라고 알아서 인식
select * from employees where hire_date between '1987@06@01' and '1987@06@30'; -- 구분자만 대충 넣어주면,,뭐,,ㅎㅎ

select date '1987-06-01' + 1; -- 합연산으로 날짜 더하기 되는가?
select date '1987-06-01' + 40; -- 안된다~~
select adddate('1987-06-01', 40); -- 이거 이용해야 날짜 더하기가 정확하게 가능
select adddate('1987-06-01', -40); -- 빼기도 가능
select subdate('1987-06-01', 40); -- 아님 아예 빼기 함수를 이용하든가
select subdate('1987-06-01', -40); -- 이러면 오히려 더해짐
select date_add('1987-06-01', interval 40 day); -- date_add('기준 date', interval 간격 day/month/year)
select date_add('1987-06-01', interval 2 month);
select '1987-06-01' + interval 1 year;
select '1987-06-30' + interval 1 day; -- 간격표현을 이용하면 합연산으로도 가능!

select dayofweek('2022-07-14'); -- 1: 일요일 ~ 

select extract(year from '2022-07-14'); -- 날짜 표현 하나하나를 뽑아내는 메소드
select extract(month from '2022-07-14');
select extract(day from '2022-07-14');

select datediff('2022-07-14', '2022-06-13'); -- datediff('최근 날짜', '예전 날짜') 둘 사이의 간격

select str_to_date('2021/06/13', '%Y/%m/%d'); -- 문자열을 date타입으로 변환! 형식문자열(%어쩌고)은 대소문자 구분
select date_format(date '2021-06-13', '%y/%M/%D'); -- 날짜 정보를 원하는 형식으로 변환! 형식문자열은 대소문자 구분
-- %Y 4자리년도, %y 2자리년도, %H 00~23, %h 00~12

-- 17일에 고용된 직원 목록
select * from employees where extract(day from hire_date) = 17; 
select * from employees where HIRE_DATE like '%17';

-- job-histroy테이블에 start_date와 end_date사이의 기간을 일수 표현으로 추가칼럼 생성
desc job_history; 
select * from job_history;
select *, datediff(end_date, start_date) as 일한기간 from job_history;
-- alter를 통해 위의 칼럼을 아예 테이블 안에 넣는것? -> 칼럼의 값들이 서로 관련이 있다면 매번 테이블 생성시 계산을 해야되게 되므로 비추천
-- 보통 테이블의 칼럼은 하나하나 독립적으로 존재하는걸로 생성하고,
-- 계산을 통해 값을 얻어내게 되는건 그때끄때 select으로 처리하는 편 