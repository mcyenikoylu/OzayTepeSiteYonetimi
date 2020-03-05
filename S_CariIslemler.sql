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
-- Description:	cari işlemler formu
-- =============================================
alter PROCEDURE S_CariIslemler 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT O.[ID]
      ,O.[Ay]
      ,O.[Yil]
      ,O.[OdemeTarihi]
      ,O.[KayitTarihi]
      ,O.[Aciklama]
      ,O.[Tutar]
      ,O.[KisiID]
	  ,K.AdiSoyadi
      ,O.[OdemeTipiID]
      ,O.[VadeTarihi]
      ,O.[GuncellemeTarihi]
  --    ,(select top 1 B.BlokAdi from Bloklar B where B.ID = K.BlokAdiID) BlokAdi
		,B.BlokAdi
		,D.DaireNo
		,K.OturuyorAyrildi
		,K.KiraciEvsahibi
		,K.DaireCikisTarihi
		,K.DaireGirisTarihi
		,K.Notlar
		,OT.OdemeAdi
		,(case when K.[KiraciEvsahibi] = 0 then 'Kiracı' else 'Ev Sahibi' end) as MulkDurumu
        ,(case when K.[OturuyorAyrildi] = 0 then 'Oturuyor' else 'Ayrıldı' end) as YasamDurumu
  FROM [Odemeler] O
  left outer join Kisiler K on O.KisiID = K.ID
  left outer join Bloklar B on B.ID = K.BlokAdiID
  left outer join Daireler D on D.ID = K.DaireAdiID
  left outer join OdemeTipi OT on OT.ID = O.OdemeTipiID
  where O.IsDeleted = 0
  order by K.ID

END
GO
