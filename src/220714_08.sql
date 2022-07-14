-- execution plan을 보자~~
select * from my_db.test
where myStr = 'a'; -- pk라서 검색이 빠름 : 파란불

select * from test
where myInt = 2; -- 정렬조건도 없고 걍 맨땅에 헤딩해야 해서 검색이 느림 : 빨간불

-- pk를 여러 칼럼에 줘보자
select * from my_db.pktest;
insert into pktest (myCol1, myCol2) values('1', '1');
insert into pktest (myCol1, myCol2) values('1', '2');
insert into pktest (myCol1, myCol2) values('2', '1'); -- ★★두개 중 하나만 달라도 중복으로 안 여김
insert into pktest (myCol1, myCol2) values('1', '1'); -- 단, 두개다 같으면 중복임~
-- pk는 여러개여도 index는 하나! 왜냐면 pk끼리도 순서가 있기 때문에 1번 pk하고 2번 pk하고 like order by 기준 2개 준 것 처럼