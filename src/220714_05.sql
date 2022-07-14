-- 형변환~
select cast(10 as time);
select cast('10' as double) + 5.5; -- '10'은 문자열 5.5는 double 원래는 형이 달라 계산이 안되니깐 형변환 필요
select convert(10, time);
select convert('10',double) + 5.5;
-- 근데 mySQL은 알아서 형변환 시켜주는게 많아서 별 신경 안써도 되지만 다른 언어는 엄격할 수 있다! 배워놓아야한다!