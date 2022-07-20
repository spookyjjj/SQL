CREATE DEFINER=`root`@`localhost` FUNCTION `hello`(name varchar(10)) RETURNS varchar(20) CHARSET utf8mb4
BEGIN
RETURN concat("hello, ", name);
-- 이만큼이 바디임
END