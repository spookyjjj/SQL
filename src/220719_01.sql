select * from book;
update book set price = '1';
-- 오토커밋끄면은 트렉젝션 사용가능(시작점을 만들어 놓고 되돌릴꺼냐 말꺼냐) by gui버튼 누르기

-- 근데 명령어로도 가능함 -> 버튼이랑 상관없이 사용 가능
start transaction; -- (트렌젝션 시작점)
update book set price = '1';
rollback; -- (되돌리기)
-- read와 write만 되돌리가 가능하고 drop같은건 롤백이 안됨,,
commit; -- (완전 되돌릴수 없게 저장하기)


