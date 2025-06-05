
-- =============================================
-- Author:		RDS
-- Create date: 
-- Description:	Identify genres that haven’t been listened to in the last month but were listened to in the previous six months.
-- =============================================
CREATE PROCEDURE [dbo].[GetGanreOutFashion] @EndDate Date
AS
BEGIN
	DECLARE @StartDate DATETIME = DATEADD(month, -7, @EndDate);
	DECLARE @MidDate DATETIME = DATEADD(month, -1, @EndDate);

	SELECT
		gd.[GanreName],
		SUM(
			CASE 
				WHEN ft.[PlayDate] BETWEEN @StartDate AND @MidDate THEN 1
				ELSE 0
			END
		) SixMonths,
		SUM(
			CASE 
				WHEN ft.[PlayDate] BETWEEN @MidDate AND @EndDate THEN 1
				ELSE 0
			END
		) LastMonth
	FROM
		[dbo].[FactData] ft WITH(NOLOCK)
		JOIN [dbo].[GanreDim] gd WITH(NOLOCK) ON ft.[GanreId] = gd.[GanreId]
	WHERE
		ft.[PlayDate] BETWEEN @StartDate AND @EndDate
	GROUP BY
		gd.[GanreName]
	HAVING
		SUM(
			CASE 
				WHEN ft.[PlayDate] BETWEEN @StartDate AND @MidDate THEN 1
				ELSE 0
			END
		) > 0
		AND SUM(
			CASE 
				WHEN ft.[PlayDate] BETWEEN @MidDate AND @EndDate THEN 1
				ELSE 0
			END
		) = 0
END