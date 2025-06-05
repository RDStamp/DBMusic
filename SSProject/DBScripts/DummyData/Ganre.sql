USE [Music]
GO

DBCC CHECKIDENT ('Ganre', RESEED, 0);

DELETE FROM [dbo].[Ganre];

DECLARE @Ganre INT = 1;

WHILE @Ganre < (FLOOR(RAND() * 10) + 5)
BEGIN

    INSERT INTO [dbo].[Ganre]
        (
            [GanreName]
        )
    VALUES
        (
            'Ganre' + convert(nvarchar(10), @Ganre)
        )

   SET @Ganre = @Ganre + 1;
END;
GO
