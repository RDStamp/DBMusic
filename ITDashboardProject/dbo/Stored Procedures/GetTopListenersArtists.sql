-- =============================================
-- Author:		RDS
-- Create date: 
-- Description:	Identify the top 3 listeners who have played the most songs from the top 5 most popular artists
-- =============================================
CREATE PROCEDURE [dbo].[GetTopListenersArtists]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		DISTINCT ld.[ListenerName], ad.[ArtistName]
	FROM
		[dbo].[FactData] ft WITH(NOLOCK)
		JOIN [dbo].[ListenerDim] ld  WITH(NOLOCK) ON ft.[ListenerId] = ld.[ListenerId]
		JOIN [dbo].[ArtistDim] ad ON ft.[ArtistId] = ad.[ArtistId]
	WHERE
		ft.[ArtistId] IN (
			SELECT
				TOP 5 ad.[ArtistId]
			FROM
				[dbo].[FactData] ft WITH(NOLOCK)
				JOIN [dbo].[ArtistDim] ad ON ft.[ArtistId] = ad.[ArtistId]
			GROUP BY
				ad.[ArtistId]
			ORDER BY
				COUNT(ft.[Id]) DESC
		)
		AND ft.[ListenerId] IN (
			SELECT
				TOP 3 ld.[ListenerId]
			FROM
				[dbo].[FactData] ft WITH(NOLOCK)
				JOIN [dbo].[ListenerDim] ld WITH(NOLOCK) on ft.[ListenerId] = ld.[ListenerId] 
			GROUP BY
				ld.[ListenerId]
			ORDER BY
				COUNT(ft.[Id])  DESC
		)
		ORDER BY
			ld.[ListenerName], ad.[ArtistName]
END