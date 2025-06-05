-- =============================================
-- Author:		RDS
-- Create date: 05/06/2025
-- Description:	Return Total Count Of Listeners
-- =============================================
CREATE PROCEDURE [dbo].[GetListnerCountTotal]
	
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
		COUNT([ListenerId])
	FROM 
		[dbo].[Listener] WITH(NOLOCK)

END