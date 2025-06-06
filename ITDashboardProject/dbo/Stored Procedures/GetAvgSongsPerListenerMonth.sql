-- =============================================
-- Author:		RDS
-- Create date: 
-- Description:	Find the average number of songs played per listener per month.
-- =============================================
CREATE PROCEDURE GetAvgSongsPerListenerMonth
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		rset2.[YearNumber], rset2.[MonthName], rset2.[PlayCount]/rset3.[ListenerCount] AvgPlayCount
	FROM
		(
			SELECT
				COUNT(ft.[Id]) PlayCount, dd.[MonthNumber], dd.[MonthName], dd.[YearNumber]
			FROM
				[dbo].[FactData] ft WITH(NOLOCK)
				JOIN [dbo].[DateDim] dd WITH(NOLOCK) ON ft.[PlayDay] = dd.[DateValue]
			GROUP BY
				dd.[YearNumber], dd.[MonthNumber], dd.[MonthName]
		) rset2
		JOIN (
			SELECT
				COUNT(rset1.[ListenerId]) ListenerCount, rset1.[MonthNumber], rset1.[MonthName], rset1.[YearNumber]
			FROM
				(
					SELECT
						DISTINCT ld.[ListenerId], dd.[MonthNumber], dd.[MonthName], dd.[YearNumber]
					FROM
						[dbo].[FactData] ft WITH(NOLOCK)
						JOIN [dbo].[ListenerDim] ld  WITH(NOLOCK) ON ft.[ListenerId] = ld.[ListenerId]
						JOIN [dbo].[DateDim] dd WITH(NOLOCK) ON ft.[PlayDay] = dd.[DateValue]
				) rset1
			GROUP BY
				rset1.[YearNumber], rset1.[MonthNumber], rset1.[MonthName]
		) rset3 ON rset2.[MonthName] = rset3.[MonthName]
	ORDER BY
		rset2.[YearNumber], rset2.[MonthNumber] 
END