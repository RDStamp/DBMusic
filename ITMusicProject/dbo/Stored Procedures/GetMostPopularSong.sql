-- =============================================
-- Author:		RDS
-- Create date: 05/06/2025
-- Description:	Return Most Popular SONG
-- =============================================
CREATE PROCEDURE [dbo].[GetMostPopularSong]
	
AS
BEGIN
	SET NOCOUNT ON;

	SELECT 
		so.[SongName], COUNT(ph.[SongId]) PlayCount
	FROM 
		[dbo].[PlayHistory] ph WITH(NOLOCK)
		JOIN [dbo].[Song] so WITH(NOLOCK) on ph.[SongId] = so.[SongId]
	GROUP BY
		so.[SongName]
	ORDER BY
		[PlayCount] DESC

END