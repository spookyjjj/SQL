select rand(); -- 0~1 사이의 랜덤값
select round(123.123, 2); 
select floor(1.5555); -- 젤 가까운 작은 정수
select ceil(1.2222); -- 젤 가까운 큰 정수

select abs(-55); -- 절대값
select pow(2, 8); -- pow(제곱수, 제곱할 횟수)
select pi();

-- 주사위 1~6사이의 난수 생성
select ceil(rand() * 6);