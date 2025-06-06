USE [Music]
GO

DELETE FROM [dbo].[Artist];

DBCC CHECKIDENT ('Artist', RESEED, 0);


/****** Object:  Database [Music].[dbo].[Artist] ******/
DECLARE @Artist INT = 1;

WHILE @Artist < (FLOOR(RAND() * 10) + 5)
BEGIN

    INSERT INTO [dbo].[Artist]
        (
            [ArtistName], [AgentName]
        )
    VALUES
        (
            'Artist' + convert(nvarchar(10), @Artist), 'Agent Name' + convert(nvarchar(10), 1)
        )

   SET @Artist = @Artist + 1;
END;
GO