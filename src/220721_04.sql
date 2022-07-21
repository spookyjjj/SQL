CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `restmenu` AS
    SELECT 
        `a`.`id` AS `id`,
        `a`.`name` AS `음식점이름`,
        `a`.`tel` AS `tel`,
        `a`.`address` AS `address`,
        `b`.`menuid` AS `menuid`,
        `b`.`name` AS `메뉴이름`,
        `b`.`price` AS `price`
    FROM
        (`restaurant` `a`
        LEFT JOIN `menu` `b` ON ((`a`.`id` = `b`.`restId`)))