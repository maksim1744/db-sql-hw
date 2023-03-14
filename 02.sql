SET @person_id = 6;
SET @new_superior = 4;

UPDATE comp
SET superior = @new_superior
WHERE person_id = @person_id;
