CREATE TRIGGER trg_AfterInsert_Teams
ON Teams
AFTER INSERT
AS
BEGIN
    DECLARE @insert_count INT;
    SET @insert_count = (SELECT COUNT(*) FROM inserted);

    INSERT INTO InsertLog (table_name, insert_count)
    VALUES ('Teams', @insert_count);
END;
GO

CREATE TRIGGER trg_AfterInsert_Players
ON Players
AFTER INSERT
AS
BEGIN
    DECLARE @insert_count INT;
    SET @insert_count = (SELECT COUNT(*) FROM inserted);

    INSERT INTO InsertLog (table_name, insert_count)
    VALUES ('Players', @insert_count);
END;
GO

CREATE TRIGGER trg_AfterInsert_Matches
ON Matches
AFTER INSERT
AS
BEGIN
    DECLARE @insert_count INT;
    SET @insert_count = (SELECT COUNT(*) FROM inserted);

    INSERT INTO InsertLog (table_name, insert_count)
    VALUES ('Matches', @insert_count);
END;
GO

CREATE TRIGGER trg_AfterInsert_Player_Statistics
ON Player_Statistics
AFTER INSERT
AS
BEGIN
    DECLARE @insert_count INT;
    SET @insert_count = (SELECT COUNT(*) FROM inserted);

    INSERT INTO InsertLog (table_name, insert_count)
    VALUES ('Player_Statistics', @insert_count);
END;
GO

CREATE TRIGGER trg_AfterInsert_Seasons
ON Seasons
AFTER INSERT
AS
BEGIN
    DECLARE @insert_count INT;
    SET @insert_count = (SELECT COUNT(*) FROM inserted);

    INSERT INTO InsertLog (table_name, insert_count)
    VALUES ('Seasons', @insert_count);
END;
GO

CREATE TRIGGER trg_AfterInsert_Referees
ON Referees
AFTER INSERT
AS
BEGIN
    DECLARE @insert_count INT;
    SET @insert_count = (SELECT COUNT(*) FROM inserted);

    INSERT INTO InsertLog (table_name, insert_count)
    VALUES ('Referees', @insert_count);
END;
GO