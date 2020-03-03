USE [SiteDB]
GO
/****** Object:  StoredProcedure [dbo].[S_Kisiler]    Script Date: 2020-03-03 4:37:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		mcy
-- Create date: 1.3.2020
-- Description:	kişiler
-- =============================================
ALTER PROCEDURE [dbo].[S_Kisiler] 
	@ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    if @ID > 0
	begin
		select * from Kisiler where ID = @ID
	end
	else
	begin
		select * from Kisiler
	end

END
