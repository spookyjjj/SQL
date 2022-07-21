-- view는 select문에 이름 붙여놓은거라고 think

select * from new_view;

SELECT * FROM new_view where employee_id = 100; -- 조건 가능

select count(*) from new_view; -- 집계함수 가능

select * from new_view A left Join locations B on A.LOCATION_ID = B.LOCATION_ID; -- join도 가능

select * from sumavgcountemp; -- view호출!! 더 빠르고 쉽게 가공된 테이블에 접근 가능

select * from restmenu where 음식점이름 = '영자면옥';