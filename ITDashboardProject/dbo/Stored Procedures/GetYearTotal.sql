
-- =============================================
-- Author:		RDS
-- Create date: 
-- Description:	Calculate the total number of songs played by listeners who joined in the last year
-- =============================================
CREATE PROCEDURE [dbo].[GetYearTotal] @EndDate Date
	
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @StartDate DATETIME = DATEADD(year, -1, @EndDate)

	SELECT
		COUNT(ft.[Id]) TotalPlayCount
	FROM
		[dbo].[FactData] ft WITH(NOLOCK)
		JOIN [dbo].[ListenerDim] ld ON ft.[ListenerId] = ld.[ListenerId]
	WHERE
		ld.[RegistrationDate] BETWEEN @StartDate AND @EndDate
	ORDER BY
		TotalPlayCount DESC
END