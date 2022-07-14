select * from employees;

select rtrim('a           ');
select ltrim('         a');
select trim('     a        ');

select lower('ABCDE');
select upper('asdf');

select reverse('qwer');

select '문자열' + '결합' + '안됨';
select concat('문자열', '결합', '함수'); -- 이걸로 해야한다
select concat('결합', null, '값이 있으면?'); -- 하나라도 null이면 null값을 반환

select char_length('문자열의 길이');

select replace('원본 문자열에서 변환합니다', '변환', 'replace'); -- replace(원본, 찾을문자, 바꿀문자)
select replace(1234, '1', '5'); -- 숫자는 자동으로 문자열로 변환되서 적용됨

select substring('employees', 5); -- substring(원본, 자를 시작위치) -> ★1부터 시작한다~!
select substring('employees', 5, 2); -- substring(원본, 자를 시작위치, 개수)
select substring('employees', -3); -- 음수일 때는 끝에서부터 위치를 세어나가서 우측으로 자름 -> 여전히 시작은 -1부터
select substring('employees', -3, 2); -- -3부터 시작해서 우측으로 자르는데 2칸까지만

select lpad(123, 5, '0'); -- lpad(원본, 총 길이(공란은 왼쪽), 공란 채울 문자)
select rpad('456', 5, '*'); -- rpad(원본, 총 길이(공란은 오른쪽), 공란 채울 문자)

select repeat("반복", 3); -- repeat(반복대상, 횟수)

select locate('d', 'abcdefg');  -- locate(찾을 문자, 원본) -> 역시 1부터 시작
select locate('k', 'asdkwerke', 7); -- locate(찾을 문자, 원본, 시작점) 

-- '515.123.4567'를 .기준으로 각각 잘라보기
select locate('.', '515.123.4567'); -- 4
select substring('515.123.4567', 1, 3);
select substring('515.123.4567', 5, 3);
select substring('515.123.4567', 9, 4);

-- 직원 테이블 전화번호 앞자리 3개로 그룹지어 개수내기
select substring(phone_number, 1, 3), count(*) from employees
group by substring(phone_number, 1, 3);