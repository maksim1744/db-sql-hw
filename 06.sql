DROP PROCEDURE IF EXISTS print_deparment;

DELIMITER #
CREATE PROCEDURE print_deparment(parent INT)
BEGIN
    CREATE TEMPORARY TABLE IF NOT EXISTS cur (person_id int);
    TRUNCATE TABLE cur;
    CREATE TEMPORARY TABLE IF NOT EXISTS nxt (person_id int);
    TRUNCATE TABLE nxt;

    SET @prev_cnt = 0;

    INSERT INTO cur SELECT person_id FROM comp WHERE person_id = parent;

    SELECT COUNT(*) FROM cur INTO @cnt;

    WHILE @prev_cnt != @cnt DO
        SET @prev_cnt = @cnt;
        TRUNCATE TABLE nxt;

        INSERT INTO nxt
        SELECT DISTINCT b.person_id as person_id
        FROM cur as a
        INNER JOIN comp as b
        ON a.person_id = b.superior;

        INSERT INTO cur SELECT * FROM nxt;

        TRUNCATE nxt;
        INSERT INTO nxt SELECT DISTINCT person_id FROM cur;
        TRUNCATE cur;
        INSERT INTO cur SELECT * FROM nxt;

        -- SELECT * FROM cur;

        SELECT COUNT(*) FROM cur INTO @cnt;
        -- SELECT @cnt;
    END WHILE;

    SELECT @cnt;
END #
DELIMITER ;

CALL print_deparment(1);
