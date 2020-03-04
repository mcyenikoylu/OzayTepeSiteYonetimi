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
-- Description:	blok ekle
-- =============================================
alter PROCEDURE UDI_BlokTanimlari
	@IslemTipi int,-- 1: insert/update 2: delete
	@KayitID int,
	@BlokAdi char(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    if @IslemTipi = 1
	begin
		if @KayitID > 0
		begin
			update Bloklar set BlokAdi = @BlokAdi where ID = @KayitID
		end
		else
		begin
			insert into Bloklar (BlokAdi) values (@BlokAdi)
		end
	end
	else if @IslemTipi = 2
	begin
		update Bloklar set IsDeleted = 1 where ID = @KayitID
	end
	
END
GO
