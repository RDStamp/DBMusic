USE [Music]
GO

DELETE FROM [dbo].[Album];

DBCC CHECKIDENT ('Album', RESEED, 0);

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