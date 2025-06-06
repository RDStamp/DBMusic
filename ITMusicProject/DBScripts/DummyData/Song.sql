USE [Music]
GO

DELETE FROM [dbo].[Song];

DBCC CHECKIDENT ('Song', RESEED, 0);

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