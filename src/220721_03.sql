CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `sumavgcountemp` AS
    SELECT 
        SUM(`employees`.`SALARY`) AS `sum(salary)`,
        AVG(`employees`.`SALARY`) AS `avg(salary)`,
        COUNT(0) AS `count(*)`
    FROM
        `employees`