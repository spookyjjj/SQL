select * from country;
select * from country limit 1 offset 2; -- offset은 건너뛰기 =2개 건너뛰고 1개 출력
select * from country limit 2, 1; -- 줄여서 적을 수 있는데, 대신 offset 수가 먼저 나옴! =2개 건너뛰고 1개 출력

-- page 나누기 = paging
select * from country limit 10 offset 0;
select * from country limit 10 offset 10;
select * from country limit 10 offset 20; -- 이렇게 10개 단위로 끊어서 보기가 가능~

-- 세션(session) 변수(valiable) : 한 번의 접속동안 유지되는 변수
set @myVal := 10; -- 변수이름앞에 @를 붙인다~ // 할당 시, 대입연산자는 :=
select @myVal * 10 + 5; -- 변수이름조차도 대소문자 구분이 없다

-- 239행을 가지는 country 테이블을, 각 페이지별 행의 개수로 나누고.. 보고자 하는 페이지 번호를 정하면 해당 row들을 조회할 수 있는 select 문을 작성해보기
-- set @rowCount := 239;
-- set @pageNumber := 2; -- 보고싶은 페이지 번호
-- set @pagePer := 10; -- 한 페이지 당 행 개수
-- set @totalPage := (@rowCount / @pagePer) + 1; -- 직접 계산

-- prepare stmt from 'set @totalPage := (? / ?) + 1';
-- execute stmt using @rowCount, @pagePer;

-- prepare stmt from 'select * from country limit ? offset (? - 1) * ?';
-- execute stmt using @pagePer, @pageNumber, @pagePer;

