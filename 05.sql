DROP PROCEDURE IF EXISTS print_superiors;

DELIMITER #
CREATE PROCEDURE print_superiors(parent INT)
BEGIN
    WHILE parent > -1 DO
        SELECT parent;
        SELECT superior FROM comp WHERE person_id = parent INTO parent;
    END WHILE;
END #
DELIMITER ;

CALL print_superiors(6);
