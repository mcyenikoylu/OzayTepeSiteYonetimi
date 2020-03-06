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
-- Create date: 4.3.2020
-- Description:	iList datagrid için şablon olarak tablo şemasını çekiyorum
-- =============================================
CREATE PROCEDURE S_OdemelerSablon
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT -1 as [ID]
      ,'' as [Ay]
      ,'' as [Yil]
      ,null as  [OdemeTarihi]
      ,null as [KayitTarihi]
      ,''as[Aciklama]
      ,CAST(0 AS DECIMAL(6,2)) AS[Tutar]
      ,-1 as[KisiID]
      ,-1 as[OdemeTipiID]
      ,null[VadeTarihi]
      ,null[GuncellemeTarihi]
      ,CAST(0 AS BIT) AS[IsDeleted]
END
GO
