USE [SiteDB]
GO
/****** Object:  StoredProcedure [dbo].[S_Kisiler]    Script Date: 2020-03-06 12:39:09 PM ******/
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
		select *
		,(case when [KiraciEvsahibi] = 0 then 'Kiracı' else 'Ev Sahibi' end) as MulkDurumu
      ,(case when [OturuyorAyrildi] = 0 then 'Oturuyor' else 'Ayrıldı' end) as YasamDurumu
		 from Kisiler where ID = @ID
	end
	else
	begin
		select *
		,(case when [KiraciEvsahibi] = 0 then 'Kiracı' else 'Ev Sahibi' end) as MulkDurumu
      ,(case when [OturuyorAyrildi] = 0 then 'Oturuyor' else 'Ayrıldı' end) as YasamDurumu
		 from Kisiler
	end

END
