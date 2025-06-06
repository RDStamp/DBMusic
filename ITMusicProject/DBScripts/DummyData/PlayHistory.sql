USE [Music]
GO

DELETE FROM [dbo].[PlayHistory];

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
