USE [Music]
GO

DELETE FROM [dbo].[PlaylistSong];

/****** Object:  Database [Music].[dbo].[PlaylistSong] ******/
DECLARE @Playlist INT = 0;
DECLARE @PlaylistMax INT = 0;
DECLARE @Song INT = 0;
DECLARE @SongMax INT = 0;
DECLARE @PlaySong INT = 1;
DECLARE @ListenDate DateTime;

SELECT @PlaylistMax = MAX([PlaylistId]) FROM [dbo].[Playlist] WITH(NOLOCK)
SELECT @SongMax = MAX([SongId]) FROM [dbo].[Song] WITH(NOLOCK)


WHILE @PlaySong < 1000
BEGIN
    WHILE  @Playlist = 0
        BEGIN
            SELECT @Playlist = [PlaylistId] from [dbo].[Playlist] where [PlaylistId] =  FLOOR(RAND() * @PlaylistMax);
        END;

    WHILE  @Song = 0
        BEGIN
            SELECT @Song = [SongId] from [dbo].[Song] where [SongId] =  FLOOR(RAND() * @SongMax);
        END;

    INSERT INTO [dbo].[PlaylistSong]
        (
           [PlaylistId], [SongId], [PlaylistOrder]
        )
    VALUES
        (
            @Playlist, @Song, (select count([PlaylistId]) from [dbo].[PlaylistSong] where [PlaylistId] = @Playlist)
        )

   SET @PlaySong = @PlaySong + 1;
   SET @Playlist =0;
   SET @Song = 0;
END;
GO
