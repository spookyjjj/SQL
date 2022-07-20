CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_selectTable`(in tablename varchar(50))
BEGIN
	case when tablename = 'book' then
			select * from books;
        when tablename = 'persons' then
			select * from persons;
	end case;
END