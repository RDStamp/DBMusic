USE [Music]
GO

DELETE FROM [dbo].[Listener];

DBCC CHECKIDENT ('Listener', RESEED, 0);

/****** Object:  Database [Music].[dbo].[Listener] ******/
DECLARE @Listener INT = 1;

WHILE @Listener < (FLOOR(RAND() * 50) + 50)
BEGIN

    INSERT INTO [dbo].[Listener]
        (
           [ListenerName], [Email]
        )
    VALUES
        (
            'Listener' + convert(nvarchar(10), @Listener), 'Listener' + convert(nvarchar(10), @Listener) + '@gmail.com' 
        )

   SET @Listener = @Listener + 1;
END;
GO