CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_countBooks`()
BEGIN
	select count(*) as '개수' from book;
END