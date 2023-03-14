DROP FUNCTION IF EXISTS get_depth;

DELIMITER #
CREATE FUNCTION get_depth(parent INT) RETURNS INT DETERMINISTIC
BEGIN
    SET @result = -1;
    WHILE parent > -1 DO
        SELECT superior FROM comp WHERE person_id = parent INTO parent;
        SET @result = @result + 1;
    END WHILE;
    RETURN @result;
END #
DELIMITER ;

CALL get_depth(6);
