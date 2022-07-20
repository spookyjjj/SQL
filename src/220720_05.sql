CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_findbytitle`(in title varchar(50), out count int)
BEGIN
	select * from book as a where a.title = title;
    select count(*) into count from persons;
END