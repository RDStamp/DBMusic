USE [Music]
GO

DELETE FROM [dbo].[PlayHistory];

DECLARE @Listener INT = 0;
DECLARE @ListenerMax INT = 0;
DECLARE @Song INT = 0;
DECLARE @SongMax INT = 0;
DECLARE @PlayHistory INT = 1;
DECLARE @ListenDate DateTime;

SELECT @ListenerMax = MAX([ListenerId]) FROM [dbo].[Listener] WITH(NOLOCK)
SELECT @SongMax = MAX([SongId]) FROM [dbo].[Song] WITH(NOLOCK)


WHILE @PlayHistory < 15000
BEGIN
    WHILE  @Listener = 0
        BEGIN
            SELECT @Listener = [ListenerId] from [dbo].[Listener] where [ListenerId] =  FLOOR(RAND() * @ListenerMax);
        END;

    WHILE  @Song = 0
        BEGIN
            SELECT @Song = [SongId] from [dbo].[Song] where [SongId] =  FLOOR(RAND() * @SongMax);
        END;

   SELECT
    @ListenDate = DATEADD(day, FLOOR(RAND() * 500), al.[ReleaseDate])
   FROM 
    [dbo].[Song] so WITH(NOLOCK)
    JOIN [dbo].[Album] al WITH(NOLOCK) ON so.[AlbumId] = al.[AlbumId]
   WHERE 
    so.[SongId] = @Song;

    INSERT INTO [dbo].[PlayHistory]
        (
           [ListenerId], [SongId], [PlayDate]
        )
    VALUES
        (
            @Listener, @Song, @ListenDate
        )

   SET @PlayHistory = @PlayHistory + 1;
   SET @Listener =0;
   SET @Song = 0;
END;
GO
