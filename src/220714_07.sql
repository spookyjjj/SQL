select ifnull(null, '대체값'); -- ifnull(체크대상, 'null일때 대체값')

-- 1번째 값이 null이면 2번째 값으로 대체, 2번째 값 자체가 null이면 3번째 값으로 대체
select ifnull( ifnull('첫번째값', '두번째값'), '세번째값');
select coalesce('첫','두','세'); -- 위의 것과 같은건데 쭉 나열만 하면 됨

select nullif('a', 'a'); -- 두개를 비교해서 같으면 null 다르면 첫번째 값 반환
select nullif('a', 'b'); 