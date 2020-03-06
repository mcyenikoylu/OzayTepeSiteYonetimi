USE [SiteDB]
GO
/****** Object:  StoredProcedure [dbo].[S_OdemeTipi]    Script Date: 2020-03-03 4:39:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		mcy
-- Create date: 2.3.2020
-- Description:	ödeme tipi
-- =============================================
ALTER PROCEDURE [dbo].[S_OdemeTipi]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from OdemeTipi
END
