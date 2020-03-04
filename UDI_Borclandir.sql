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
-- Description:	vade adedi kadar ödeme planı çıkarır.
-- =============================================
CREATE PROCEDURE UDI_Borclandir 
	-- Add the parameters for the stored procedure here
	@KisiID int,
	@OdemeTipiID int,
	@Tutar decimal(6,2),
	@VadeTarihi date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	if @KisiID > 0
	begin
		insert into Odemeler (KisiID,OdemeTipiID,Tutar,VadeTarihi) 
		values (@KisiID,@OdemeTipiID,@Tutar,@VadeTarihi)
	end
END
GO
