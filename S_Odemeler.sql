USE [SiteDB]
GO
/****** Object:  StoredProcedure [dbo].[S_Odemeler]    Script Date: 2020-03-03 4:39:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		mcy
-- Create date: 2.3.2020
-- Description:	ödemeler
-- =============================================
ALTER PROCEDURE [dbo].[S_Odemeler]
	@KisiID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    if @KisiID > 0
	begin
		select * from Odemeler where KisiID = @KisiID
	end
	else
	begin
		select * from Odemeler
	end

END
