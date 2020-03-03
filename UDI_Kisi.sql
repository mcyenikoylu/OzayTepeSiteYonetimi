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
-- Create date: 3.3.2020
-- Description:	kişi ekle
-- =============================================
CREATE PROCEDURE UDI_Kisi 
	@IslemTipi int -- 1:insert/update 2:delete
	,@ID int -- kişi id
	,@AdiSoyadi nvarchar(50)
	,@BlokAdiID int
	,@DaireAdiID int
	,@KiraciEvsahibi bit
	,@KayitTarihi date
	,@DaireGirisTarihi date
	,@DaireCikisTarihi date
	,@OturuyorAyrildi bit
	,@Notlar nvarchar(500)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    if @IslemTipi = 1
	begin
		if @ID > 0
		begin
			update Kisiler set AdiSoyadi = @AdiSoyadi,
			BlokAdiID = @BlokAdiID,
			DaireAdiID = @DaireAdiID,
			KiraciEvsahibi = @KiraciEvsahibi,
			KayitTarihi = @KayitTarihi,
			DaireGirisTarihi = @DaireGirisTarihi,
			DaireCikisTarihi = @DaireCikisTarihi,
			OturuyorAyrildi = @OturuyorAyrildi,
			Notlar = @Notlar
			where ID = @ID
		end
		else
		begin
			insert Kisiler (AdiSoyadi,BlokAdiID,DaireAdiID,
			KiraciEvsahibi,KayitTarihi,DaireGirisTarihi,DaireCikisTarihi,
			OturuyorAyrildi,Notlar) 
			values (@AdiSoyadi,@BlokAdiID,@DaireAdiID,@KiraciEvsahibi,
			@KayitTarihi,@DaireGirisTarihi,@DaireCikisTarihi,
			@OturuyorAyrildi,@Notlar)
		end
	end
	else if @IslemTipi = 2
	begin
		update Kisiler set IsDeleted = 1 where ID = @ID
	end

END
GO
