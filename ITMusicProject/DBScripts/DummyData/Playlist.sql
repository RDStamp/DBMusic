USE [Music]
GO

DELETE FROM [dbo].[Playlist];

DBCC CHECKIDENT ('Playlist', RESEED, 0);

/****** Object:  Database [Music].[dbo].[Playlist] ******/
DECLARE @Listener INT = 0;
DECLARE @ListenerMax INT = 0;
DECLARE @Playlist INT = 1;


SELECT @ListenerMax = MAX([ListenerId]) FROM [dbo].[Listener] WITH(NOLOCK)

WHILE @Playlist < 100
BEGIN
    WHILE  @Listener = 0
        BEGIN
            SELECT @Listener = [ListenerId] from [dbo].[Listener] where [ListenerId] =  FLOOR(RAND() * @ListenerMax);
        END;

    INSERT INTO [dbo].[Playlist]
        (
           [PlaylisName], [ListnerId]
        )
    VALUES
        (
            'Play List Mane' + CONVERT(NVARCHAR(10), @Playlist), @Listener
        )

   SET @Playlist = @Playlist + 1;
   SET @Listener = 0;

END;
GO