-- =============================================
-- Author:		RDS
-- Create date: 05/06/2025
-- Description:	Get Listner Count By Month For Selected Year
-- =============================================
CREATE PROCEDURE [dbo].[GetListnerCountByMonthForYear](@Year INT)
	
AS
BEGIN
	SET NOCOUNT ON;

    SELECT
		Months, COUNT([ListenerId])
	FROM
		(
			SELECT 
				DATENAME(month, ph.[PlayDate]) Months, ph.[ListenerId]
			FROM 
				[dbo].[PlayHistory] ph WITH(NOLOCK)
			WHERE
				DATENAME(year, ph.[PlayDate]) = @Year
		) rs
	GROUP BY
		Months

END