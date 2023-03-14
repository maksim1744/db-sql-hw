SET @superior_id = 1;
SET @superior_name = "unknown";

SELECT name FROM comp WHERE person_id = @superior_id INTO @superior_name;
SELECT @superior_name;

SELECT * FROM comp WHERE superior = @superior_id;
