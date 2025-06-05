-- =============================================
-- Author:		RDS
-- Create date: 05/06/2025
-- Description:	Return Most Popular Artist
-- =============================================
CREATE PROCEDURE [dbo].[GetMostPopularArtist]
	
AS
BEGIN
	SET NOCOUNT ON;

	SELECT 
		ar.[ArtistName], COUNT(ph.[SongId]) PlayCount
	FROM 
		[dbo].[PlayHistory] ph WITH(NOLOCK)
		JOIN [dbo].[Song] so WITH(NOLOCK) on ph.[SongId] = so.[SongId]
		JOIN [dbo].[Artist] ar WITH(NOLOCK) on so.[ArtistId] = ar.[ArtistId]
	GROUP BY
		ar.[ArtistName]
	ORDER BY
		[PlayCount] DESC

END