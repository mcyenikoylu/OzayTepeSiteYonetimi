USE [SiteDB]
GO
/****** Object:  StoredProcedure [dbo].[S_Bloklar]    Script Date: 2020-03-03 4:39:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		mcy
-- Create date: 1.3.2020
-- Description:	bloklar
-- =============================================
ALTER PROCEDURE [dbo].[S_Bloklar]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from Bloklar
END
