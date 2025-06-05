-- =============================================
-- Author:		RDS
-- Create date: 05/06/2025
-- Description:	Get Listner Count By Year
-- =============================================
CREATE PROCEDURE [dbo].[GetListnerCountByYear]
	
AS
BEGIN
	SET NOCOUNT ON;

    SELECT
		Years, COUNT([ListenerId])
	FROM
		(
			SELECT 
				DISTINCT DATEPART(year, ph.[PlayDate]) Years, ph.[ListenerId]
			FROM 
				[dbo].[PlayHistory] ph WITH(NOLOCK)
		) rs
	GROUP BY
		Years
END