-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		mcy
-- Create date: 5.4.2020
-- Description:	kişiler listesi
-- =============================================
CREATE PROCEDURE S_KisilerListesi 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select  [AdiSoyadi]
      ,(select top 1 BlokAdi from Bloklar where ID= [BlokAdiID]) as BlokAdi
      ,(select top 1 DaireNo from Daireler where ID= [DaireAdiID]) as DaireNo
      ,[DaireGirisTarihi]
      ,[DaireCikisTarihi]
	  ,(case when [KiraciEvsahibi] = 0 then 'Kiracı' else 'Ev Sahibi' end) as MulkDurumu
      ,(case when [OturuyorAyrildi] = 0 then 'Oturuyor' else 'Ayrıldı' end) as YasamDurumu
      ,[Notlar]    
  FROM [Kisiler] where IsDeleted = 0

END
GO
