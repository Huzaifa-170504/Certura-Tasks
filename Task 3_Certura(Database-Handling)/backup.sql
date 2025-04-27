BEGIN TRANSACTION;
CREATE TABLE students (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    marks INTEGER
);
INSERT INTO "students" VALUES(1,'Alice',85);
INSERT INTO "students" VALUES(2,'Bob',90);
INSERT INTO "students" VALUES(3,'Charlie',78);
DELETE FROM "sqlite_sequence";
INSERT INTO "sqlite_sequence" VALUES('students',3);
COMMIT;
