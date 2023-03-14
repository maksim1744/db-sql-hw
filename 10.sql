DROP PROCEDURE IF EXISTS get_path;

DELIMITER #
CREATE PROCEDURE get_path(a INT, b INT)
BEGIN
    CREATE TEMPORARY TABLE IF NOT EXISTS res (person_id int, ord int);
    TRUNCATE TABLE res;

    SET @ha = get_depth(a);
    SET @hb = get_depth(b);

    WHILE @ha > @hb DO
        INSERT INTO res VALUES (a, -@ha);
        SELECT superior FROM comp WHERE person_id = a INTO a;
        SET @ha = @ha - 1;
    END WHILE;

    WHILE @hb > @ha DO
        INSERT INTO res VALUES (b, @hb);
        SELECT superior FROM comp WHERE person_id = b INTO b;
        SET @hb = @hb - 1;
    END WHILE;

    WHILE a != b DO
        INSERT INTO res VALUES (a, -@ha);
        INSERT INTO res VALUES (b, @hb);
        SET @ha = @ha - 1;
        SELECT superior FROM comp WHERE person_id = a INTO a;
        SELECT superior FROM comp WHERE person_id = b INTO b;
    END WHILE;

    INSERT INTO res VALUES (a, -@ha);

    SELECT person_id FROM res ORDER BY ord;
END #
DELIMITER ;

CALL get_path(2, 6);
CALL get_path(6, 2);
