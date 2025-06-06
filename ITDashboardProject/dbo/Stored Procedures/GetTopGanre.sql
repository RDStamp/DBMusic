
-- =============================================
-- Author:		RDS
-- Create date: 
-- Description:	Identify the top 3 genres with the highest playtime across all listeners
-- =============================================
CREATE PROCEDURE [dbo].[GetTopGanre]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		TOP 3 gd.[GanreName], COUNT(ft.[Id]) TotalPlayCount
	FROM
		[dbo].[FactData] ft WITH(NOLOCK)
		JOIN [dbo].[GanreDim] gd WITH(NOLOCK) ON ft.[GanreId] = gd.[GanreId]
	GROUP BY
		gd.[GanreName]
	ORDER BY
		TotalPlayCount DESC
END