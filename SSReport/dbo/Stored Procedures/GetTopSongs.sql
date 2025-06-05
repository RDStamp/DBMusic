
-- =============================================
-- Author:		RDS
-- Create date: 
-- Description:	Identify the top 5 songs with the highest playtime across all listeners
-- =============================================
CREATE PROCEDURE [dbo].[GetTopSongs]
AS
BEGIN
	SELECT
		TOP 5 ft.[SongName], COUNT(ft.[Id]) TotalPlayCount
	FROM
		[dbo].[FactData] ft WITH(NOLOCK)
	GROUP BY
		ft.[SongName]
	ORDER BY
		TotalPlayCount DESC
END