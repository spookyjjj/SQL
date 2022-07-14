-- Ctrl + shift + enter > 전체 실행
-- Ctrl + enter > 한 줄만 실행
-- 주석은 //가 아니라 --
-- 대소문자 구분 안한다~

show databases;

use world; -- 해당 데이터가 진하게 선택되어 있는걸 확인해야 함

show tables; -- 위에서 world를 선택했으니 걔의 table을 보여준다~

select 2 * 2; -- select로 보고싶은거 선택! 산술연산 다 된다~ 

select "Hello Wrold"; -- 쌍따옴표 홑따옴표 둘다 가능

select "plus" + "possible?"; -- 하지만 문자열 합연산은 안된다~

select 10 = 10; -- 관계연산자에서 동일은 ==이 아니라 =임! true는 1 false는 0

select 10 <> 10; -- 관계연산자에서 다르다는 !=이 아니라 <>임!