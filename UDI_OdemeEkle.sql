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
-- Description:	ödeme ekle
-- =============================================
CREATE PROCEDURE UDI_OdemeEkle
	@IsDeleted int, -- 1:insert/update 2:deleted  
	@KisiID int,
	@KayitID int,
	@Tarih date,
	@OdemeTipiID int,
	@Tutar decimal(7,2),
	@Aciklama nvarchar(250)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    if @IsDeleted = 1
	begin
		if @KayitID > 0 -- kayıt düzenlenecekse
		begin
			update Odemeler set Tutar = @Tutar 
			where ID = @KayitID
		end
		else -- yeni kayıt eklenecekse
		begin
			insert into Odemeler (KisiID,OdemeTarihi,VadeTarihi,KayitTarihi,OdemeTipiID,Aciklama,Ay,Yil,Tutar) 
			values (@KisiID,@Tarih,@Tarih,GETDATE(),@OdemeTipiID,@Aciklama,
			case when len(MONTH(@Tarih)) < 2 then cast('0'+cast(MONTH(@Tarih)as char)as char) else cast(MONTH(@Tarih) as char) end,--len'i tek gelirse başına sıfır ekliyorum
			cast(year(@Tarih)as char),@Tutar)
		end
	end
	else if @IsDeleted = 2
	begin
		update Odemeler set IsDeleted = 1 where ID = @KayitID
	end
END
GO
