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
-- Create date: 5.3.2020
-- Description:	ödeme tipi tanımları
-- =============================================
CREATE PROCEDURE UDI_OdemeTipiTanimlari 
	@IslemTipi int,-- 1: insert/update 2: delete
	@KayitID int,
	@TipAdi nvarchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	  if @IslemTipi = 1
	begin
		if @KayitID > 0
		begin
			update OdemeTipi set OdemeAdi = @TipAdi where ID = @KayitID
		end
		else
		begin
			insert into OdemeTipi (OdemeAdi) values (@TipAdi)
		end
	end
	else if @IslemTipi = 2
	begin
		update OdemeTipi set IsDeleted = 1 where ID = @KayitID
	end

END
GO
