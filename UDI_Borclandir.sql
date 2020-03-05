USE [SiteDB]
GO
/****** Object:  StoredProcedure [dbo].[UDI_Borclandir]    Script Date: 2020-03-05 6:51:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		mcy
-- Create date: 4.3.2020
-- Description:	vade adedi kadar ödeme planı çıkarır.
-- =============================================
ALTER PROCEDURE [dbo].[UDI_Borclandir] 
	-- Add the parameters for the stored procedure here
	@KisiID int,
	@OdemeTipiID int,
	@Tutar decimal(6,2),
	@VadeTarihi date,
	@IslemTipi int, --1:insert 2:update
	@OdemeTarihi date,
	@KayitID int,
	@Aciklama nvarchar(250)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
		if @IslemTipi = 1
		begin
			insert into Odemeler (KisiID,OdemeTarihi,VadeTarihi,KayitTarihi,OdemeTipiID,Aciklama,Ay,Yil,Tutar) 
			values (@KisiID,null,@VadeTarihi,GETDATE(),@OdemeTipiID,@Aciklama,
			case when len(MONTH(@VadeTarihi)) < 2 then cast('0'+cast(MONTH(@VadeTarihi)as char)as char) else cast(MONTH(@VadeTarihi) as char) end,--len'i tek gelirse başına sıfır ekliyorum
			cast(year(@VadeTarihi)as char),@Tutar)
		end
		else
		begin
			update Odemeler set OdemeTarihi = cast(NULLIF(@OdemeTarihi,'') AS DATE), Aciklama = @Aciklama, GuncellemeTarihi = GETDATE()
			where ID = @KayitID
		end
	
END
