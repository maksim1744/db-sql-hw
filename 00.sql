DROP TABLE comp;

CREATE TABLE comp (person_id INT, superior INT, name VARCHAR(255));

INSERT INTO comp VALUES(1, -1, "a");
INSERT INTO comp VALUES(2, 1, "b");
INSERT INTO comp VALUES(4, 1, "d");
INSERT INTO comp VALUES(5, 4, "e");
INSERT INTO comp VALUES(6, 4, "f");
