CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_loop`(in num int)
BEGIN
	declare i int; -- declare은 무조건 프로시저 윗부분에 위치
    declare sum int default 0; -- 선언과 초기화를 동시에 가능
    set i = 0;
    
    -- repeat
		-- set sum = sum + i;
        -- set i = i + 1;
	-- until i > num end repeat; -- 참이 될때가지 반복하기!!!
    -- 즉, 참이 되면 반복이 끝난다~ java와 반대 java는 참이 되면 반복됨
    
    while i < num do -- 참일 때 반복!!! like java의 while!!
	  set sum = sum + i;
      set i = i + 1;
      end while;
    
    select sum;
END