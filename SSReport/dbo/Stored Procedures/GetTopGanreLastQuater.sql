
-- =============================================
-- Author:		RDS
-- Create date: 
-- Description:	Identify the top 3 genres with the highest playtime across all listeners over the past quarter.
-- =============================================
CREATE PROCEDURE [dbo].[GetTopGanreLastQuater] @BaseDate Date
AS
BEGIN
	DECLARE @StartDate DATETIME = DATEADD(quarter, DATEDIFF(quarter, 0, @BaseDate) - 1, 0);
	DECLARE @EndDate DATETIME = DATEADD(day, -1, DATEADD(quarter, DATEDIFF(quarter, 0, @BaseDate), 0));

	SELECT
		TOP 3 gd.[GanreName], COUNT(ft.[Id]) TotalPlayCount
	FROM
		[dbo].[FactData] ft WITH(NOLOCK)
		JOIN [dbo].[GanreDim] gd WITH(NOLOCK) ON ft.[GanreId] = gd.[GanreId]
	WHERE
		ft.[PlayDate] BETWEEN @StartDate AND @EndDate
	GROUP BY
		gd.[GanreName]
	ORDER BY
		TotalPlayCount DESC
END