USE [Music]
GO

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

/****** Object:  Database [Music].[dbo].[Ganre] ******/
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

/****** Object:  Database [Music].[dbo].[Album] ******/
DECLARE @Album INT = 1;

WHILE @Album < (FLOOR(RAND() * 10) + 5)
BEGIN

    INSERT INTO [dbo].[Album]
        (
            [AlbumName], [ReleaseDate], [RecordLabel]
        )
    VALUES
        (
            'Album' + convert(nvarchar(10), @Album), DATEADD(month, FLOOR(RAND() * 10), DATEADD(year, @Album, '01 Jan 2000')), 'Record Label' + convert(nvarchar(10), @Album)
        )

   SET @Album = @Album + 1;
END;
GO

/****** Object:  Database [Music].[dbo].[Song] ******/
DECLARE @Song INT = 0;
DECLARE @Album INT = 0;
DECLARE @Artist INT = 0;
DECLARE @Ganre INT = 0;
DECLARE @GanreSelect INT = 0;

DECLARE @AlbumMax INT = 0;
DECLARE @ArtistMax INT = 0;
DECLARE @GanreMax INT = 0;

SELECT @AlbumMax = MAX([AlbumId]) FROM [dbo].[Album] WITH(NOLOCK)
SELECT @ArtistMax = MAX([ArtistId]) FROM [dbo].[Artist] WITH(NOLOCK)
SELECT @GanreMax = MAX([GanreId]) FROM [dbo].[Ganre] WITH(NOLOCK)

WHILE @Song < 5000
BEGIN
    WHILE  @Album = 0
        BEGIN
            SELECT @Album = [AlbumId] from [dbo].[Album] WITH(NOLOCK) where [AlbumId] =  FLOOR(RAND() * @AlbumMax);
        END;

    WHILE  @Artist = 0
        BEGIN
            SELECT @Artist = [ArtistId] from [dbo].[Artist] WITH(NOLOCK) where [ArtistId] =  FLOOR(RAND() * @ArtistMax);
        END;

    WHILE  @GanreSelect = 0
        BEGIN
            SELECT @GanreSelect = CASE 
                WHEN @Ganre < @GanreMax THEN @Ganre + 1 
                WHEN @Ganre = @GanreMax THEN 1 
                ELSE 1 
            END 
            FROM [dbo].[Ganre] WITH(NOLOCK) where [GanreId] =  FLOOR(RAND() * (SELECT  MAX([GanreId]) FROM [dbo].[Ganre] WITH(NOLOCK)));
        END;

    SET @Ganre = @GanreSelect;
    SET @GanreSelect = 0;

    INSERT INTO [dbo].[Song]
        (
           [SongName], [ArtistId], [AlbumId], [GanreId]
        )
    VALUES
        (
            'Song' + convert(nvarchar(10), @Song), @Artist, @Album, @Ganre
        )

   SET @Song = @Song + 1;
   SET @Album = 0;
   SET @Artist = 0;
END;
GO

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

/****** Object:  Database [Music].[dbo].[PlayHistory] ******/
DECLARE @Listener INT = 0;
DECLARE @Song INT = 0;
DECLARE @PlayCount INT = 0;
DECLARE @PlayCountMax INT = 0;
DECLARE @ListenDate Date;
DECLARE @Date DATE = '01 Jan 2018';
DECLARE @DateMax DATE = GETDATE();

DECLARE LISTENER_CURSOR CURSOR 
LOCAL STATIC READ_ONLY FORWARD_ONLY
FOR 
    SELECT
        [ListenerId] 
    FROM 
        [dbo].[Listener] WITH(NOLOCK)
OPEN LISTENER_CURSOR
FETCH NEXT FROM LISTENER_CURSOR INTO @Listener
WHILE @@FETCH_STATUS = 0
    BEGIN 
        DECLARE SONG_CURSOR CURSOR 
        LOCAL STATIC READ_ONLY FORWARD_ONLY
        FOR 
            SELECT 
                so.[SongId], al.[ReleaseDate]  
            FROM 
                [dbo].[Song] so WITH(NOLOCK)
                JOIN [dbo].[Album] al WITH(NOLOCK) ON so.[AlbumId] = al.[AlbumId]
        OPEN SONG_CURSOR
        FETCH NEXT FROM SONG_CURSOR INTO @Song, @Date
        WHILE @@FETCH_STATUS = 0
            BEGIN 
                    SET @ListenDate = @Date;

                    WHILE @ListenDate < @DateMax
                        BEGIN
                            SET @PlayCount = 0;
                            SET @PlayCountMax = 5 - DATEDIFF(day, @Date, @ListenDate)
                            WHILE (@PlayCount < FLOOR(RAND() * @PlayCountMax) AND @PlayCountMax > 0)
                                BEGIN
                                    INSERT INTO [dbo].[PlayHistory]
                                        (
                                            [ListenerId], [SongId], [PlayDate]
                                        )
                                    VALUES
                                        (
                                            @Listener, @Song, DATEADD(minute, FLOOR(RAND() * 10), DATEADD(hour, FLOOR(RAND() * 10), CONVERT(DATETIME, @ListenDate)))
                                        );

                                    SET @PlayCount = @PlayCount + 1;
                                END;
                            SET @ListenDate = DATEADD(day, 1, @ListenDate);
                         END;       
                FETCH NEXT FROM SONG_CURSOR INTO @Song, @Date
            END
        CLOSE SONG_CURSOR
        DEALLOCATE SONG_CURSOR

        FETCH NEXT FROM LISTENER_CURSOR INTO @Listener
    END;
CLOSE LISTENER_CURSOR
DEALLOCATE LISTENER_CURSOR;
