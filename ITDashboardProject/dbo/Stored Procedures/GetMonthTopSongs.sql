
-- =============================================
-- Author:		RDS
-- Create date: 
-- Description:	Find the top 5 songs with the highest play count in the last month.
-- =============================================
CREATE PROCEDURE [dbo].[GetMonthTopSongs] @EndDate Date
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @StartDate DATETIME = DATEADD(year, -1, @EndDate)

	SELECT
		TOP 5 ft.[SongName], COUNT(ft.[Id]) TotalPlayCount
	FROM
		[dbo].[FactData] ft WITH(NOLOCK)
	WHERE
		ft.[PlayDate] BETWEEN @StartDate AND @EndDate
	GROUP BY
		ft.[SongName]
	ORDER BY
		TotalPlayCount DESC
END