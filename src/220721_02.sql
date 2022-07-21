CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `new_view` AS
    SELECT 
        `a`.`EMPLOYEE_ID` AS `EMPLOYEE_ID`,
        `a`.`FIRST_NAME` AS `FIRST_NAME`,
        `a`.`LAST_NAME` AS `LAST_NAME`,
        `a`.`EMAIL` AS `EMAIL`,
        `a`.`PHONE_NUMBER` AS `PHONE_NUMBER`,
        `a`.`HIRE_DATE` AS `HIRE_DATE`,
        `a`.`JOB_ID` AS `JOB_ID`,
        `a`.`SALARY` AS `SALARY`,
        `a`.`COMMISSION_PCT` AS `COMMISSION_PCT`,
        `a`.`MANAGER_ID` AS `MANAGER_ID`,
        `a`.`DEPARTMENT_ID` AS `DEPARTMENT_ID`,
        `b`.`DEPARTMENT_NAME` AS `department_name`,
        `b`.`MANAGER_ID` AS `부서매니저`,
        `b`.`LOCATION_ID` AS `location_id`
    FROM
        (`employees` `a`
        LEFT JOIN `departments` `b` ON ((`a`.`DEPARTMENT_ID` = `b`.`DEPARTMENT_ID`)))