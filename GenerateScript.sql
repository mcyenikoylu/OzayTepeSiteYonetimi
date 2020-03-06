USE [master]
GO
/****** Object:  Database [SiteDB]    Script Date: 2020-03-06 10:07:07 PM ******/
CREATE DATABASE [SiteDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SiteDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\SiteDB.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SiteDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\SiteDB_log.ldf' , SIZE = 1792KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SiteDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SiteDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SiteDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SiteDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SiteDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SiteDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SiteDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [SiteDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SiteDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SiteDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SiteDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SiteDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SiteDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SiteDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SiteDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SiteDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SiteDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SiteDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SiteDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SiteDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SiteDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SiteDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SiteDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SiteDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SiteDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SiteDB] SET  MULTI_USER 
GO
ALTER DATABASE [SiteDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SiteDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SiteDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SiteDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SiteDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [SiteDB]
GO
/****** Object:  Table [dbo].[Bloklar]    Script Date: 2020-03-06 10:07:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bloklar](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BlokAdi] [nchar](10) NULL,
	[IsDeleted] [bit] NULL CONSTRAINT [DF_Bloklar_IsDeleted]  DEFAULT ((0)),
 CONSTRAINT [PK_Bloklar] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Daireler]    Script Date: 2020-03-06 10:07:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Daireler](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DaireNo] [char](10) NULL,
	[IsDeleted] [bit] NULL CONSTRAINT [DF_Daireler_IsDeleted]  DEFAULT ((0)),
 CONSTRAINT [PK_Daireler] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Kisiler]    Script Date: 2020-03-06 10:07:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kisiler](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AdiSoyadi] [nvarchar](50) NULL,
	[BlokAdiID] [int] NULL,
	[DaireAdiID] [int] NULL,
	[KiraciEvsahibi] [bit] NULL,
	[KayitTarihi] [date] NULL,
	[DaireGirisTarihi] [date] NULL,
	[DaireCikisTarihi] [date] NULL,
	[OturuyorAyrildi] [bit] NULL,
	[Notlar] [nvarchar](500) NULL,
	[IsDeleted] [bit] NULL CONSTRAINT [DF_Kisiler_IsDeleted]  DEFAULT ((0)),
 CONSTRAINT [PK_Kisiler] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Odemeler]    Script Date: 2020-03-06 10:07:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Odemeler](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Ay] [nchar](2) NULL,
	[Yil] [nchar](4) NULL,
	[OdemeTarihi] [date] NULL,
	[KayitTarihi] [date] NULL,
	[Aciklama] [nvarchar](250) NULL,
	[Tutar] [decimal](6, 2) NULL,
	[KisiID] [int] NULL,
	[OdemeTipiID] [int] NULL,
	[VadeTarihi] [date] NULL,
	[GuncellemeTarihi] [date] NULL,
	[IsDeleted] [bit] NULL CONSTRAINT [DF_Odemeler_IsDeleted]  DEFAULT ((0)),
 CONSTRAINT [PK_Odemeler] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OdemeTipi]    Script Date: 2020-03-06 10:07:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OdemeTipi](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OdemeAdi] [nvarchar](50) NULL,
	[IsDeleted] [bit] NULL CONSTRAINT [DF_OdemeTipi_IsDeleted]  DEFAULT ((0)),
 CONSTRAINT [PK_OdemeTipi] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Bloklar] ON 

GO
INSERT [dbo].[Bloklar] ([ID], [BlokAdi], [IsDeleted]) VALUES (1, N'A         ', 0)
GO
INSERT [dbo].[Bloklar] ([ID], [BlokAdi], [IsDeleted]) VALUES (2, N'B         ', 0)
GO
INSERT [dbo].[Bloklar] ([ID], [BlokAdi], [IsDeleted]) VALUES (3, N'C         ', 0)
GO
INSERT [dbo].[Bloklar] ([ID], [BlokAdi], [IsDeleted]) VALUES (4, N'D         ', 0)
GO
INSERT [dbo].[Bloklar] ([ID], [BlokAdi], [IsDeleted]) VALUES (5, N'E         ', 0)
GO
INSERT [dbo].[Bloklar] ([ID], [BlokAdi], [IsDeleted]) VALUES (6, N'F         ', 0)
GO
INSERT [dbo].[Bloklar] ([ID], [BlokAdi], [IsDeleted]) VALUES (7, N'ds        ', 1)
GO
INSERT [dbo].[Bloklar] ([ID], [BlokAdi], [IsDeleted]) VALUES (8, N's         ', 1)
GO
INSERT [dbo].[Bloklar] ([ID], [BlokAdi], [IsDeleted]) VALUES (9, N'cvb       ', 1)
GO
SET IDENTITY_INSERT [dbo].[Bloklar] OFF
GO
SET IDENTITY_INSERT [dbo].[Daireler] ON 

GO
INSERT [dbo].[Daireler] ([ID], [DaireNo], [IsDeleted]) VALUES (1, N'1         ', 0)
GO
INSERT [dbo].[Daireler] ([ID], [DaireNo], [IsDeleted]) VALUES (2, N'2         ', 0)
GO
INSERT [dbo].[Daireler] ([ID], [DaireNo], [IsDeleted]) VALUES (3, N'3         ', 0)
GO
INSERT [dbo].[Daireler] ([ID], [DaireNo], [IsDeleted]) VALUES (4, N'4         ', 0)
GO
INSERT [dbo].[Daireler] ([ID], [DaireNo], [IsDeleted]) VALUES (5, N'5         ', 0)
GO
INSERT [dbo].[Daireler] ([ID], [DaireNo], [IsDeleted]) VALUES (6, N'6         ', 0)
GO
INSERT [dbo].[Daireler] ([ID], [DaireNo], [IsDeleted]) VALUES (7, N'7         ', 0)
GO
INSERT [dbo].[Daireler] ([ID], [DaireNo], [IsDeleted]) VALUES (8, N'8         ', 0)
GO
INSERT [dbo].[Daireler] ([ID], [DaireNo], [IsDeleted]) VALUES (9, N'9         ', 0)
GO
INSERT [dbo].[Daireler] ([ID], [DaireNo], [IsDeleted]) VALUES (10, N'10        ', 0)
GO
INSERT [dbo].[Daireler] ([ID], [DaireNo], [IsDeleted]) VALUES (11, N'11        ', 0)
GO
INSERT [dbo].[Daireler] ([ID], [DaireNo], [IsDeleted]) VALUES (12, N'12        ', 0)
GO
INSERT [dbo].[Daireler] ([ID], [DaireNo], [IsDeleted]) VALUES (13, N'13        ', 0)
GO
INSERT [dbo].[Daireler] ([ID], [DaireNo], [IsDeleted]) VALUES (14, N'14        ', 0)
GO
INSERT [dbo].[Daireler] ([ID], [DaireNo], [IsDeleted]) VALUES (15, N'15        ', 0)
GO
INSERT [dbo].[Daireler] ([ID], [DaireNo], [IsDeleted]) VALUES (16, N'16        ', 0)
GO
INSERT [dbo].[Daireler] ([ID], [DaireNo], [IsDeleted]) VALUES (17, N'17        ', 0)
GO
INSERT [dbo].[Daireler] ([ID], [DaireNo], [IsDeleted]) VALUES (18, N'18        ', 0)
GO
INSERT [dbo].[Daireler] ([ID], [DaireNo], [IsDeleted]) VALUES (19, N'19        ', 0)
GO
INSERT [dbo].[Daireler] ([ID], [DaireNo], [IsDeleted]) VALUES (20, N'20        ', 0)
GO
INSERT [dbo].[Daireler] ([ID], [DaireNo], [IsDeleted]) VALUES (21, N'222       ', 1)
GO
SET IDENTITY_INSERT [dbo].[Daireler] OFF
GO
SET IDENTITY_INSERT [dbo].[Kisiler] ON 

GO
INSERT [dbo].[Kisiler] ([ID], [AdiSoyadi], [BlokAdiID], [DaireAdiID], [KiraciEvsahibi], [KayitTarihi], [DaireGirisTarihi], [DaireCikisTarihi], [OturuyorAyrildi], [Notlar], [IsDeleted]) VALUES (1, N'Cenker Yenikoylu', 1, 5, 0, CAST(N'2020-03-05' AS Date), CAST(N'2020-02-29' AS Date), NULL, 1, N'', 0)
GO
INSERT [dbo].[Kisiler] ([ID], [AdiSoyadi], [BlokAdiID], [DaireAdiID], [KiraciEvsahibi], [KayitTarihi], [DaireGirisTarihi], [DaireCikisTarihi], [OturuyorAyrildi], [Notlar], [IsDeleted]) VALUES (2, N'Cenk Yenikoylu', 1, 15, 1, CAST(N'2020-03-05' AS Date), CAST(N'2020-03-18' AS Date), NULL, 1, N'', 0)
GO
INSERT [dbo].[Kisiler] ([ID], [AdiSoyadi], [BlokAdiID], [DaireAdiID], [KiraciEvsahibi], [KayitTarihi], [DaireGirisTarihi], [DaireCikisTarihi], [OturuyorAyrildi], [Notlar], [IsDeleted]) VALUES (3, N'Ahmet Tatar', 1, 4, 1, CAST(N'2020-03-06' AS Date), CAST(N'2020-03-11' AS Date), NULL, 1, N'fsdfsd', 0)
GO
INSERT [dbo].[Kisiler] ([ID], [AdiSoyadi], [BlokAdiID], [DaireAdiID], [KiraciEvsahibi], [KayitTarihi], [DaireGirisTarihi], [DaireCikisTarihi], [OturuyorAyrildi], [Notlar], [IsDeleted]) VALUES (4, N'Berk Yeniköylü', 2, 6, 1, CAST(N'2020-03-06' AS Date), CAST(N'2020-03-18' AS Date), NULL, 1, N'fdgvsadafdd', 0)
GO
INSERT [dbo].[Kisiler] ([ID], [AdiSoyadi], [BlokAdiID], [DaireAdiID], [KiraciEvsahibi], [KayitTarihi], [DaireGirisTarihi], [DaireCikisTarihi], [OturuyorAyrildi], [Notlar], [IsDeleted]) VALUES (5, N'Tolga Batur', 2, 13, 1, CAST(N'2020-03-06' AS Date), CAST(N'2020-03-16' AS Date), NULL, 1, N'ergfwreg', 0)
GO
INSERT [dbo].[Kisiler] ([ID], [AdiSoyadi], [BlokAdiID], [DaireAdiID], [KiraciEvsahibi], [KayitTarihi], [DaireGirisTarihi], [DaireCikisTarihi], [OturuyorAyrildi], [Notlar], [IsDeleted]) VALUES (6, N'Onur Keser', 2, 17, 1, CAST(N'2020-03-06' AS Date), CAST(N'2020-03-09' AS Date), NULL, 1, N'fw43rtr4', 0)
GO
INSERT [dbo].[Kisiler] ([ID], [AdiSoyadi], [BlokAdiID], [DaireAdiID], [KiraciEvsahibi], [KayitTarihi], [DaireGirisTarihi], [DaireCikisTarihi], [OturuyorAyrildi], [Notlar], [IsDeleted]) VALUES (7, N'Şenol Yavaş', 3, 20, 1, CAST(N'2020-03-06' AS Date), CAST(N'2020-01-14' AS Date), NULL, 1, N'wergwerg', 0)
GO
INSERT [dbo].[Kisiler] ([ID], [AdiSoyadi], [BlokAdiID], [DaireAdiID], [KiraciEvsahibi], [KayitTarihi], [DaireGirisTarihi], [DaireCikisTarihi], [OturuyorAyrildi], [Notlar], [IsDeleted]) VALUES (8, N'İsmail Arabacı', 3, 11, 0, CAST(N'2020-03-06' AS Date), CAST(N'2020-03-15' AS Date), NULL, 1, N'rferf', 0)
GO
INSERT [dbo].[Kisiler] ([ID], [AdiSoyadi], [BlokAdiID], [DaireAdiID], [KiraciEvsahibi], [KayitTarihi], [DaireGirisTarihi], [DaireCikisTarihi], [OturuyorAyrildi], [Notlar], [IsDeleted]) VALUES (9, N'Kazım Susak', 3, 4, 1, CAST(N'2020-03-06' AS Date), CAST(N'2020-03-11' AS Date), NULL, 1, N'ertgertg', 0)
GO
INSERT [dbo].[Kisiler] ([ID], [AdiSoyadi], [BlokAdiID], [DaireAdiID], [KiraciEvsahibi], [KayitTarihi], [DaireGirisTarihi], [DaireCikisTarihi], [OturuyorAyrildi], [Notlar], [IsDeleted]) VALUES (10, N'Mustafa Kemal', 4, 6, 1, CAST(N'2020-03-06' AS Date), CAST(N'2020-03-18' AS Date), NULL, 1, N'', 0)
GO
INSERT [dbo].[Kisiler] ([ID], [AdiSoyadi], [BlokAdiID], [DaireAdiID], [KiraciEvsahibi], [KayitTarihi], [DaireGirisTarihi], [DaireCikisTarihi], [OturuyorAyrildi], [Notlar], [IsDeleted]) VALUES (11, N'Emel Semiz', 4, 4, 1, CAST(N'2020-03-06' AS Date), CAST(N'2020-03-06' AS Date), NULL, 1, N'', 0)
GO
INSERT [dbo].[Kisiler] ([ID], [AdiSoyadi], [BlokAdiID], [DaireAdiID], [KiraciEvsahibi], [KayitTarihi], [DaireGirisTarihi], [DaireCikisTarihi], [OturuyorAyrildi], [Notlar], [IsDeleted]) VALUES (12, N'Adam Olimpos', 4, 2, 1, CAST(N'2020-03-06' AS Date), CAST(N'2020-03-19' AS Date), NULL, 1, N'', 0)
GO
INSERT [dbo].[Kisiler] ([ID], [AdiSoyadi], [BlokAdiID], [DaireAdiID], [KiraciEvsahibi], [KayitTarihi], [DaireGirisTarihi], [DaireCikisTarihi], [OturuyorAyrildi], [Notlar], [IsDeleted]) VALUES (13, N'Refresh', 4, 4, 0, CAST(N'2020-03-03' AS Date), CAST(N'2020-03-18' AS Date), NULL, 0, N'', 1)
GO
INSERT [dbo].[Kisiler] ([ID], [AdiSoyadi], [BlokAdiID], [DaireAdiID], [KiraciEvsahibi], [KayitTarihi], [DaireGirisTarihi], [DaireCikisTarihi], [OturuyorAyrildi], [Notlar], [IsDeleted]) VALUES (14, N'Refresh2', 2, 4, 0, CAST(N'2020-03-03' AS Date), CAST(N'2020-03-13' AS Date), NULL, 0, N'', 1)
GO
INSERT [dbo].[Kisiler] ([ID], [AdiSoyadi], [BlokAdiID], [DaireAdiID], [KiraciEvsahibi], [KayitTarihi], [DaireGirisTarihi], [DaireCikisTarihi], [OturuyorAyrildi], [Notlar], [IsDeleted]) VALUES (15, N'Hotel California', 5, 4, 0, CAST(N'2020-03-06' AS Date), CAST(N'2020-03-13' AS Date), NULL, 1, N'', 0)
GO
INSERT [dbo].[Kisiler] ([ID], [AdiSoyadi], [BlokAdiID], [DaireAdiID], [KiraciEvsahibi], [KayitTarihi], [DaireGirisTarihi], [DaireCikisTarihi], [OturuyorAyrildi], [Notlar], [IsDeleted]) VALUES (16, N'Serkan Kahveci', 5, 6, 0, CAST(N'2020-03-06' AS Date), CAST(N'2020-03-13' AS Date), NULL, 1, N'', 0)
GO
INSERT [dbo].[Kisiler] ([ID], [AdiSoyadi], [BlokAdiID], [DaireAdiID], [KiraciEvsahibi], [KayitTarihi], [DaireGirisTarihi], [DaireCikisTarihi], [OturuyorAyrildi], [Notlar], [IsDeleted]) VALUES (17, N'Anıl Yalçın', 5, 2, 0, CAST(N'2020-03-06' AS Date), CAST(N'2020-03-13' AS Date), NULL, 1, N'', 0)
GO
INSERT [dbo].[Kisiler] ([ID], [AdiSoyadi], [BlokAdiID], [DaireAdiID], [KiraciEvsahibi], [KayitTarihi], [DaireGirisTarihi], [DaireCikisTarihi], [OturuyorAyrildi], [Notlar], [IsDeleted]) VALUES (18, N'Cranberries Promises', 6, 4, 1, CAST(N'2020-03-06' AS Date), CAST(N'2020-03-13' AS Date), NULL, 1, N'', 0)
GO
INSERT [dbo].[Kisiler] ([ID], [AdiSoyadi], [BlokAdiID], [DaireAdiID], [KiraciEvsahibi], [KayitTarihi], [DaireGirisTarihi], [DaireCikisTarihi], [OturuyorAyrildi], [Notlar], [IsDeleted]) VALUES (19, N'Placebo Bitter', 6, 3, 1, CAST(N'2020-03-06' AS Date), CAST(N'2020-03-18' AS Date), NULL, 1, N'ewfgwerg', 0)
GO
INSERT [dbo].[Kisiler] ([ID], [AdiSoyadi], [BlokAdiID], [DaireAdiID], [KiraciEvsahibi], [KayitTarihi], [DaireGirisTarihi], [DaireCikisTarihi], [OturuyorAyrildi], [Notlar], [IsDeleted]) VALUES (20, N'Atatürk', 6, 1, 1, CAST(N'2020-03-05' AS Date), CAST(N'2020-03-05' AS Date), NULL, 1, N'', 0)
GO
SET IDENTITY_INSERT [dbo].[Kisiler] OFF
GO
SET IDENTITY_INSERT [dbo].[Odemeler] ON 

GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (1, N'02', N'2020', CAST(N'2020-02-05' AS Date), CAST(N'2020-02-29' AS Date), N'subat ayı aidatı', CAST(80.00 AS Decimal(6, 2)), 1, 1, CAST(N'2020-12-31' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (2, N'02', N'2020', CAST(N'2020-02-07' AS Date), CAST(N'2020-02-29' AS Date), N'ocak ve subat aidatı ödedi.', CAST(160.00 AS Decimal(6, 2)), 2, 1, NULL, NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (3, N'03', N'2020', CAST(N'2020-03-30' AS Date), CAST(N'2020-03-30' AS Date), N'mart ayı ödemesi', CAST(80.00 AS Decimal(6, 2)), 1, 1, NULL, NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (4, N'03', N'2020', CAST(N'2020-03-04' AS Date), CAST(N'2020-03-04' AS Date), N'sdfsdf', NULL, 1, 2, CAST(N'2020-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (5, N'03', N'2020', CAST(N'2020-03-03' AS Date), CAST(N'2020-03-04' AS Date), N'sdfasd', CAST(120.00 AS Decimal(6, 2)), 1, 2, CAST(N'2020-03-03' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (6, N'03', N'2021', CAST(N'2021-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 1, 1, CAST(N'2021-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (7, N'03', N'2021', CAST(N'2021-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 1, 1, CAST(N'2021-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (8, N'03', N'2021', CAST(N'2021-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 1, 1, CAST(N'2021-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (9, N'03', N'2021', CAST(N'2021-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 1, 1, CAST(N'2021-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (10, N'03', N'2021', CAST(N'2021-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 1, 1, CAST(N'2021-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (11, N'03', N'2021', CAST(N'2021-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 1, 1, CAST(N'2021-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (12, N'03', N'2021', CAST(N'2021-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 1, 1, CAST(N'2021-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (13, N'03', N'2021', CAST(N'2021-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 1, 1, CAST(N'2021-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (14, N'03', N'2021', NULL, CAST(N'2020-03-04' AS Date), N'bu', CAST(80.00 AS Decimal(6, 2)), 1, 1, CAST(N'2021-03-04' AS Date), CAST(N'2020-03-05' AS Date), 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (15, N'03', N'2021', CAST(N'2021-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 1, 1, CAST(N'2021-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (16, N'03', N'2021', CAST(N'2021-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 1, 1, CAST(N'2021-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (17, N'03', N'2021', CAST(N'2021-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 1, 1, CAST(N'2021-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (18, N'06', N'2020', CAST(N'2020-06-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 2, 1, CAST(N'2020-06-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (19, N'06', N'2020', CAST(N'2020-06-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 2, 1, CAST(N'2020-06-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (20, N'06', N'2020', CAST(N'2020-06-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 2, 1, CAST(N'2020-06-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (21, N'03', N'2021', CAST(N'2021-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 3, 1, CAST(N'2021-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (22, N'03', N'2021', CAST(N'2021-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 3, 1, CAST(N'2021-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (23, N'03', N'2021', CAST(N'2021-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 3, 1, CAST(N'2021-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (24, N'03', N'2021', CAST(N'2021-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 3, 1, CAST(N'2021-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (25, N'03', N'2021', CAST(N'2021-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 3, 1, CAST(N'2021-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (26, N'03', N'2021', CAST(N'2021-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 3, 1, CAST(N'2021-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (27, N'03', N'2021', CAST(N'2021-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 3, 1, CAST(N'2021-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (28, N'03', N'2021', CAST(N'2021-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 3, 1, CAST(N'2021-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (29, N'03', N'2021', CAST(N'2021-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 3, 1, CAST(N'2021-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (30, N'03', N'2021', CAST(N'2021-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 3, 1, CAST(N'2021-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (31, N'03', N'2021', CAST(N'2021-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 3, 1, CAST(N'2021-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (32, N'03', N'2021', CAST(N'2021-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 3, 1, CAST(N'2021-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (33, N'03', N'2020', CAST(N'2020-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 4, 1, CAST(N'2020-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (34, N'03', N'2020', CAST(N'2020-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 4, 1, CAST(N'2020-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (35, N'03', N'2020', CAST(N'2020-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 4, 1, CAST(N'2020-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (36, N'03', N'2020', CAST(N'2020-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 4, 1, CAST(N'2020-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (37, N'03', N'2020', CAST(N'2020-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 4, 1, CAST(N'2020-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (38, N'03', N'2020', CAST(N'2020-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 4, 1, CAST(N'2020-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (39, N'03', N'2020', CAST(N'2020-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 4, 1, CAST(N'2020-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (40, N'03', N'2020', CAST(N'2020-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 4, 1, CAST(N'2020-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (41, N'03', N'2020', CAST(N'2020-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 4, 1, CAST(N'2020-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (42, N'03', N'2020', CAST(N'2020-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 4, 1, CAST(N'2020-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (43, N'03', N'2020', CAST(N'2020-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 4, 1, CAST(N'2020-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (44, N'03', N'2020', CAST(N'2020-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 4, 1, CAST(N'2020-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (45, N'03', N'2020', CAST(N'2020-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 5, 1, CAST(N'2020-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (46, N'03', N'2020', CAST(N'2020-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 5, 1, CAST(N'2020-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (47, N'03', N'2020', CAST(N'2020-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 5, 1, CAST(N'2020-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (48, N'03', N'2020', CAST(N'2020-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 5, 1, CAST(N'2020-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (49, N'03', N'2020', CAST(N'2020-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 5, 1, CAST(N'2020-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (50, N'03', N'2020', CAST(N'2020-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 5, 1, CAST(N'2020-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (51, N'03', N'2020', CAST(N'2020-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 5, 1, CAST(N'2020-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (52, N'03', N'2020', CAST(N'2020-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 5, 1, CAST(N'2020-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (53, N'03', N'2020', CAST(N'2020-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 5, 1, CAST(N'2020-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (54, N'03', N'2020', CAST(N'2020-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 5, 1, CAST(N'2020-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (55, N'03', N'2020', CAST(N'2020-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 5, 1, CAST(N'2020-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (56, N'03', N'2020', CAST(N'2020-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 5, 1, CAST(N'2020-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (57, N'03', N'2021', CAST(N'2021-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 6, 1, CAST(N'2021-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (58, N'03', N'2021', CAST(N'2021-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 6, 1, CAST(N'2021-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (59, N'03', N'2021', CAST(N'2021-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 6, 1, CAST(N'2021-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (60, N'03', N'2021', CAST(N'2021-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 6, 1, CAST(N'2021-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (61, N'03', N'2021', CAST(N'2021-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 6, 1, CAST(N'2021-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (62, N'03', N'2021', CAST(N'2021-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 6, 1, CAST(N'2021-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (63, N'03', N'2021', CAST(N'2021-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 6, 1, CAST(N'2021-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (64, N'03', N'2021', CAST(N'2021-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 6, 1, CAST(N'2021-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (65, N'03', N'2021', CAST(N'2021-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 6, 1, CAST(N'2021-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (66, N'03', N'2021', CAST(N'2021-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 6, 1, CAST(N'2021-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (67, N'03', N'2021', CAST(N'2021-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 6, 1, CAST(N'2021-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (68, N'03', N'2021', CAST(N'2021-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 6, 1, CAST(N'2021-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (69, N'03', N'2021', CAST(N'2021-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 7, 1, CAST(N'2021-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (70, N'03', N'2020', CAST(N'2020-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 8, 1, CAST(N'2020-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (71, N'03', N'2020', CAST(N'2020-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 8, 1, CAST(N'2020-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (72, N'03', N'2020', CAST(N'2020-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 8, 1, CAST(N'2020-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (73, N'03', N'2020', CAST(N'2020-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 8, 1, CAST(N'2020-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (74, N'03', N'2020', CAST(N'2020-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 8, 1, CAST(N'2020-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (75, N'03', N'2020', CAST(N'2020-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 8, 1, CAST(N'2020-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (76, N'03', N'2020', CAST(N'2020-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 8, 1, CAST(N'2020-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (77, N'03', N'2020', CAST(N'2020-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 8, 1, CAST(N'2020-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (78, N'03', N'2020', CAST(N'2020-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 8, 1, CAST(N'2020-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (79, N'03', N'2020', CAST(N'2020-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 8, 1, CAST(N'2020-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (80, N'03', N'2020', CAST(N'2020-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 8, 1, CAST(N'2020-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (81, N'03', N'2020', CAST(N'2020-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 8, 1, CAST(N'2020-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (82, N'03', N'2020', CAST(N'2020-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 9, 1, CAST(N'2020-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (83, N'03', N'2020', CAST(N'2020-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 9, 1, CAST(N'2020-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (84, N'03', N'2020', CAST(N'2020-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 9, 1, CAST(N'2020-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (85, N'03', N'2020', CAST(N'2020-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 9, 1, CAST(N'2020-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (86, N'03', N'2020', CAST(N'2020-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 9, 1, CAST(N'2020-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (87, N'03', N'2020', CAST(N'2020-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 9, 1, CAST(N'2020-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (88, N'03', N'2020', CAST(N'2020-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 9, 1, CAST(N'2020-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (89, N'03', N'2020', CAST(N'2020-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 9, 1, CAST(N'2020-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (90, N'03', N'2020', CAST(N'2020-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 9, 1, CAST(N'2020-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (91, N'03', N'2020', CAST(N'2020-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 9, 1, CAST(N'2020-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (92, N'03', N'2020', CAST(N'2020-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 9, 1, CAST(N'2020-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (93, N'03', N'2020', CAST(N'2020-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 9, 1, CAST(N'2020-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (94, N'03', N'2020', CAST(N'2020-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 10, 1, CAST(N'2020-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (95, N'03', N'2020', CAST(N'2020-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 11, 1, CAST(N'2020-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (96, N'03', N'2020', CAST(N'2020-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 11, 1, CAST(N'2020-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (97, N'03', N'2020', CAST(N'2020-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 11, 1, CAST(N'2020-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (98, N'03', N'2020', CAST(N'2020-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 11, 1, CAST(N'2020-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (99, N'03', N'2020', CAST(N'2020-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 11, 1, CAST(N'2020-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (100, N'03', N'2020', CAST(N'2020-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 11, 1, CAST(N'2020-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (101, N'03', N'2020', CAST(N'2020-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 11, 1, CAST(N'2020-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (102, N'03', N'2020', CAST(N'2020-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 11, 1, CAST(N'2020-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (103, N'03', N'2020', CAST(N'2020-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 11, 1, CAST(N'2020-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (104, N'03', N'2020', CAST(N'2020-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 11, 1, CAST(N'2020-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (105, N'03', N'2020', CAST(N'2020-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 11, 1, CAST(N'2020-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (106, N'03', N'2020', CAST(N'2020-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 11, 1, CAST(N'2020-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (107, N'03', N'2020', CAST(N'2020-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 12, 1, CAST(N'2020-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (108, N'04', N'2020', CAST(N'2020-04-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 12, 1, CAST(N'2020-04-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (109, N'04', N'2020', CAST(N'2020-04-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 12, 1, CAST(N'2020-04-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (110, N'04', N'2020', CAST(N'2020-04-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 12, 1, CAST(N'2020-04-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (111, N'04', N'2020', CAST(N'2020-04-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 12, 1, CAST(N'2020-04-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (112, N'04', N'2020', CAST(N'2020-04-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 12, 1, CAST(N'2020-04-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (113, N'04', N'2020', CAST(N'2020-04-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 12, 1, CAST(N'2020-04-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (114, N'04', N'2020', CAST(N'2020-04-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 12, 1, CAST(N'2020-04-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (115, N'04', N'2020', CAST(N'2020-04-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 12, 1, CAST(N'2020-04-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (116, N'04', N'2020', CAST(N'2020-04-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 12, 1, CAST(N'2020-04-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (117, N'04', N'2020', CAST(N'2020-04-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 12, 1, CAST(N'2020-04-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (118, N'04', N'2020', CAST(N'2020-04-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 12, 1, CAST(N'2020-04-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (119, N'03', N'2020', CAST(N'2020-03-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 15, 1, CAST(N'2020-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (120, N'04', N'2020', CAST(N'2020-04-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 15, 1, CAST(N'2020-04-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (121, N'05', N'2020', CAST(N'2020-05-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 15, 1, CAST(N'2020-05-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (122, N'06', N'2020', CAST(N'2020-06-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 15, 1, CAST(N'2020-06-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (123, N'07', N'2020', CAST(N'2020-07-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 15, 1, CAST(N'2020-07-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (124, N'08', N'2020', CAST(N'2020-08-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 15, 1, CAST(N'2020-08-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (125, N'09', N'2020', CAST(N'2020-09-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 15, 1, CAST(N'2020-09-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (126, N'10', N'2020', CAST(N'2020-10-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 15, 1, CAST(N'2020-10-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (127, N'11', N'2020', CAST(N'2020-11-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 15, 1, CAST(N'2020-11-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (128, N'12', N'2020', CAST(N'2020-12-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 15, 1, CAST(N'2020-12-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (129, N'01', N'2021', CAST(N'2021-01-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 15, 1, CAST(N'2021-01-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (130, N'02', N'2021', CAST(N'2021-02-04' AS Date), CAST(N'2020-03-04' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 15, 1, CAST(N'2021-02-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (131, NULL, NULL, NULL, NULL, NULL, CAST(80.00 AS Decimal(6, 2)), 16, 1, CAST(N'2020-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (132, NULL, NULL, NULL, NULL, NULL, CAST(80.00 AS Decimal(6, 2)), 16, 1, CAST(N'2020-04-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (133, NULL, NULL, NULL, NULL, NULL, CAST(80.00 AS Decimal(6, 2)), 16, 1, CAST(N'2020-05-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (134, NULL, NULL, NULL, NULL, NULL, CAST(80.00 AS Decimal(6, 2)), 16, 1, CAST(N'2020-06-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (135, NULL, NULL, NULL, NULL, NULL, CAST(80.00 AS Decimal(6, 2)), 16, 1, CAST(N'2020-07-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (136, NULL, NULL, NULL, NULL, NULL, CAST(80.00 AS Decimal(6, 2)), 16, 1, CAST(N'2020-08-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (137, NULL, NULL, NULL, NULL, NULL, CAST(80.00 AS Decimal(6, 2)), 16, 1, CAST(N'2020-09-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (138, NULL, NULL, NULL, NULL, NULL, CAST(80.00 AS Decimal(6, 2)), 16, 1, CAST(N'2020-10-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (139, NULL, NULL, CAST(N'2020-03-26' AS Date), NULL, N'', CAST(0.00 AS Decimal(6, 2)), 16, 1, CAST(N'2020-11-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (140, NULL, NULL, CAST(N'2020-03-19' AS Date), NULL, N'', CAST(0.00 AS Decimal(6, 2)), 16, 1, CAST(N'2020-12-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (141, NULL, NULL, NULL, NULL, N'', CAST(0.00 AS Decimal(6, 2)), 16, 1, CAST(N'2021-01-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (142, NULL, NULL, CAST(N'2020-03-05' AS Date), NULL, N'', CAST(0.00 AS Decimal(6, 2)), 16, 1, CAST(N'2021-02-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (143, N'03', N'2020', CAST(N'2020-03-04' AS Date), CAST(N'2020-03-04' AS Date), N'dfgsdfg', CAST(100.00 AS Decimal(6, 2)), 1, 2, CAST(N'2020-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (144, N'03', N'2020', CAST(N'2020-03-04' AS Date), CAST(N'2020-03-04' AS Date), N'as asdasd', CAST(120.00 AS Decimal(6, 2)), 1, 2, CAST(N'2020-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (145, N'03', N'2020', CAST(N'2020-03-04' AS Date), CAST(N'2020-03-04' AS Date), N'dqawdwq', CAST(2345.00 AS Decimal(6, 2)), 1, 2, CAST(N'2020-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (146, N'03', N'2020', CAST(N'2020-03-04' AS Date), CAST(N'2020-03-04' AS Date), N'dqwwqdqw', CAST(123.00 AS Decimal(6, 2)), 1, 2, CAST(N'2020-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (147, N'03', N'2020', CAST(N'2020-03-04' AS Date), CAST(N'2020-03-04' AS Date), N'rgfergf', CAST(9789.00 AS Decimal(6, 2)), 1, 2, CAST(N'2020-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (148, N'03', N'2020', CAST(N'2020-03-04' AS Date), CAST(N'2020-03-04' AS Date), N'sdasd', CAST(1.00 AS Decimal(6, 2)), 1, 2, CAST(N'2020-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (149, N'03', N'2020', CAST(N'2020-03-04' AS Date), CAST(N'2020-03-04' AS Date), N'456', CAST(456.00 AS Decimal(6, 2)), 1, 2, CAST(N'2020-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (150, N'03', N'2020', CAST(N'2020-03-05' AS Date), CAST(N'2020-03-04' AS Date), N'sdf', CAST(324.00 AS Decimal(6, 2)), 1, 2, CAST(N'2020-03-05' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (151, N'03', N'2020', CAST(N'2020-03-04' AS Date), CAST(N'2020-03-04' AS Date), N'asdf', CAST(120.00 AS Decimal(6, 2)), 16, 2, CAST(N'2020-03-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (152, NULL, NULL, NULL, NULL, NULL, CAST(90.00 AS Decimal(6, 2)), 17, 1, CAST(N'2020-03-05' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (153, NULL, NULL, NULL, NULL, NULL, CAST(90.00 AS Decimal(6, 2)), 17, 1, CAST(N'2020-04-05' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (154, NULL, NULL, NULL, NULL, NULL, CAST(90.00 AS Decimal(6, 2)), 17, 1, CAST(N'2020-05-05' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (155, NULL, NULL, NULL, NULL, NULL, CAST(90.00 AS Decimal(6, 2)), 17, 1, CAST(N'2020-06-05' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (156, NULL, NULL, NULL, NULL, NULL, CAST(90.00 AS Decimal(6, 2)), 17, 1, CAST(N'2020-07-05' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (157, NULL, NULL, NULL, NULL, NULL, CAST(90.00 AS Decimal(6, 2)), 17, 1, CAST(N'2020-08-05' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (158, NULL, NULL, NULL, NULL, NULL, CAST(90.00 AS Decimal(6, 2)), 17, 1, CAST(N'2020-09-05' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (159, NULL, NULL, NULL, NULL, NULL, CAST(90.00 AS Decimal(6, 2)), 17, 1, CAST(N'2020-10-05' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (160, NULL, NULL, NULL, NULL, NULL, CAST(90.00 AS Decimal(6, 2)), 17, 1, CAST(N'2020-11-05' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (161, NULL, NULL, NULL, NULL, NULL, CAST(90.00 AS Decimal(6, 2)), 17, 1, CAST(N'2020-12-05' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (162, NULL, NULL, NULL, NULL, NULL, CAST(90.00 AS Decimal(6, 2)), 17, 1, CAST(N'2021-01-05' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (163, NULL, NULL, NULL, NULL, NULL, CAST(90.00 AS Decimal(6, 2)), 17, 1, CAST(N'2021-02-05' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (164, N'03', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(98.00 AS Decimal(6, 2)), 18, 1, CAST(N'2020-03-12' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (165, N'04', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(98.00 AS Decimal(6, 2)), 18, 1, CAST(N'2020-04-12' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (166, N'05', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(98.00 AS Decimal(6, 2)), 18, 1, CAST(N'2020-05-12' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (167, N'06', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(98.00 AS Decimal(6, 2)), 18, 1, CAST(N'2020-06-12' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (168, N'07', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(98.00 AS Decimal(6, 2)), 18, 1, CAST(N'2020-07-12' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (169, N'08', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(98.00 AS Decimal(6, 2)), 18, 1, CAST(N'2020-08-12' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (170, N'09', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(98.00 AS Decimal(6, 2)), 18, 1, CAST(N'2020-09-12' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (171, N'10', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(98.00 AS Decimal(6, 2)), 18, 1, CAST(N'2020-10-12' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (172, N'11', N'2020', CAST(N'2020-03-19' AS Date), CAST(N'2020-03-05' AS Date), N'', CAST(98.00 AS Decimal(6, 2)), 18, 1, CAST(N'2020-11-12' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (173, N'12', N'2020', CAST(N'2020-03-12' AS Date), CAST(N'2020-03-05' AS Date), N'', CAST(98.00 AS Decimal(6, 2)), 18, 1, CAST(N'2020-12-12' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (174, N'01', N'2021', CAST(N'2020-03-05' AS Date), CAST(N'2020-03-05' AS Date), N'', CAST(98.00 AS Decimal(6, 2)), 18, 1, CAST(N'2021-01-12' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (175, N'02', N'2021', CAST(N'2020-03-04' AS Date), CAST(N'2020-03-05' AS Date), N'', CAST(98.00 AS Decimal(6, 2)), 18, 1, CAST(N'2021-02-12' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (176, N'03', N'2020', CAST(N'2020-03-05' AS Date), CAST(N'2020-03-05' AS Date), N'ödendi', CAST(340.00 AS Decimal(6, 2)), 19, 1, CAST(N'2020-03-12' AS Date), CAST(N'2020-03-05' AS Date), 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (177, N'04', N'2020', CAST(N'2020-03-02' AS Date), CAST(N'2020-03-05' AS Date), N'ödendi', CAST(340.00 AS Decimal(6, 2)), 19, 1, CAST(N'2020-04-12' AS Date), CAST(N'2020-03-05' AS Date), 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (178, N'05', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(340.00 AS Decimal(6, 2)), 19, 1, CAST(N'2020-05-12' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (179, N'06', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(340.00 AS Decimal(6, 2)), 19, 1, CAST(N'2020-06-12' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (180, N'07', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(340.00 AS Decimal(6, 2)), 19, 1, CAST(N'2020-07-12' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (181, N'08', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(340.00 AS Decimal(6, 2)), 19, 1, CAST(N'2020-08-12' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (182, N'09', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(340.00 AS Decimal(6, 2)), 19, 1, CAST(N'2020-09-12' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (183, N'10', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(340.00 AS Decimal(6, 2)), 19, 1, CAST(N'2020-10-12' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (184, N'11', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(340.00 AS Decimal(6, 2)), 19, 1, CAST(N'2020-11-12' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (185, N'12', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(340.00 AS Decimal(6, 2)), 19, 1, CAST(N'2020-12-12' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (186, N'01', N'2021', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(340.00 AS Decimal(6, 2)), 19, 1, CAST(N'2021-01-12' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (187, N'02', N'2021', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(340.00 AS Decimal(6, 2)), 19, 1, CAST(N'2021-02-12' AS Date), NULL, 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (188, N'03', N'2020', CAST(N'2020-03-05' AS Date), CAST(N'2020-03-05' AS Date), N'cam 2', CAST(120.00 AS Decimal(6, 2)), 19, 2, CAST(N'2020-03-05' AS Date), CAST(N'2020-03-05' AS Date), 1)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (189, N'03', N'2020', CAST(N'2020-03-05' AS Date), CAST(N'2020-03-05' AS Date), N'ödedi', CAST(80.00 AS Decimal(6, 2)), 1, 1, CAST(N'2020-03-05' AS Date), CAST(N'2020-03-05' AS Date), 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (190, N'04', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 1, 1, CAST(N'2020-04-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (191, N'05', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 1, 1, CAST(N'2020-05-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (192, N'06', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 1, 1, CAST(N'2020-06-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (193, N'07', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 1, 1, CAST(N'2020-07-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (194, N'08', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 1, 1, CAST(N'2020-08-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (195, N'09', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 1, 1, CAST(N'2020-09-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (196, N'10', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 1, 1, CAST(N'2020-10-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (197, N'11', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 1, 1, CAST(N'2020-11-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (198, N'12', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 1, 1, CAST(N'2020-12-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (199, N'01', N'2021', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 1, 1, CAST(N'2021-01-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (200, N'02', N'2021', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 1, 1, CAST(N'2021-02-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (201, N'03', N'2020', CAST(N'2020-03-06' AS Date), CAST(N'2020-03-05' AS Date), N'ödedi', CAST(80.00 AS Decimal(6, 2)), 2, 1, CAST(N'2020-03-05' AS Date), CAST(N'2020-03-06' AS Date), 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (202, N'04', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 2, 1, CAST(N'2020-04-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (203, N'05', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 2, 1, CAST(N'2020-05-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (204, N'06', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 2, 1, CAST(N'2020-06-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (205, N'07', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 2, 1, CAST(N'2020-07-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (206, N'08', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 2, 1, CAST(N'2020-08-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (207, N'09', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 2, 1, CAST(N'2020-09-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (208, N'10', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 2, 1, CAST(N'2020-10-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (209, N'11', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 2, 1, CAST(N'2020-11-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (210, N'12', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 2, 1, CAST(N'2020-12-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (211, N'01', N'2021', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 2, 1, CAST(N'2021-01-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (212, N'02', N'2021', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 2, 1, CAST(N'2021-02-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (213, N'03', N'2020', CAST(N'2020-03-06' AS Date), CAST(N'2020-03-05' AS Date), N'ödedi', CAST(80.00 AS Decimal(6, 2)), 3, 1, CAST(N'2020-03-05' AS Date), CAST(N'2020-03-06' AS Date), 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (214, N'04', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 3, 1, CAST(N'2020-04-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (215, N'05', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 3, 1, CAST(N'2020-05-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (216, N'06', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 3, 1, CAST(N'2020-06-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (217, N'07', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 3, 1, CAST(N'2020-07-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (218, N'08', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 3, 1, CAST(N'2020-08-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (219, N'09', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 3, 1, CAST(N'2020-09-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (220, N'10', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 3, 1, CAST(N'2020-10-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (221, N'11', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 3, 1, CAST(N'2020-11-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (222, N'12', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 3, 1, CAST(N'2020-12-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (223, N'01', N'2021', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 3, 1, CAST(N'2021-01-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (224, N'02', N'2021', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 3, 1, CAST(N'2021-02-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (225, N'03', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 4, 1, CAST(N'2020-03-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (226, N'04', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 4, 1, CAST(N'2020-04-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (227, N'05', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 4, 1, CAST(N'2020-05-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (228, N'06', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 4, 1, CAST(N'2020-06-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (229, N'07', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 4, 1, CAST(N'2020-07-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (230, N'08', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 4, 1, CAST(N'2020-08-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (231, N'09', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 4, 1, CAST(N'2020-09-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (232, N'10', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 4, 1, CAST(N'2020-10-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (233, N'11', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 4, 1, CAST(N'2020-11-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (234, N'12', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 4, 1, CAST(N'2020-12-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (235, N'01', N'2021', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 4, 1, CAST(N'2021-01-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (236, N'02', N'2021', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 4, 1, CAST(N'2021-02-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (237, N'03', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 5, 1, CAST(N'2020-03-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (238, N'04', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 5, 1, CAST(N'2020-04-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (239, N'05', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 5, 1, CAST(N'2020-05-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (240, N'06', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 5, 1, CAST(N'2020-06-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (241, N'07', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 5, 1, CAST(N'2020-07-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (242, N'08', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 5, 1, CAST(N'2020-08-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (243, N'09', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 5, 1, CAST(N'2020-09-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (244, N'10', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 5, 1, CAST(N'2020-10-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (245, N'11', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 5, 1, CAST(N'2020-11-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (246, N'12', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 5, 1, CAST(N'2020-12-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (247, N'01', N'2021', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 5, 1, CAST(N'2021-01-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (248, N'02', N'2021', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 5, 1, CAST(N'2021-02-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (249, N'03', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 6, 1, CAST(N'2020-03-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (250, N'04', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 6, 1, CAST(N'2020-04-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (251, N'05', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 6, 1, CAST(N'2020-05-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (252, N'06', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 6, 1, CAST(N'2020-06-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (253, N'07', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 6, 1, CAST(N'2020-07-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (254, N'08', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 6, 1, CAST(N'2020-08-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (255, N'09', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 6, 1, CAST(N'2020-09-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (256, N'10', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 6, 1, CAST(N'2020-10-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (257, N'11', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 6, 1, CAST(N'2020-11-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (258, N'12', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 6, 1, CAST(N'2020-12-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (259, N'01', N'2021', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 6, 1, CAST(N'2021-01-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (260, N'02', N'2021', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 6, 1, CAST(N'2021-02-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (261, N'03', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 7, 1, CAST(N'2020-03-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (262, N'04', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 7, 1, CAST(N'2020-04-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (263, N'05', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 7, 1, CAST(N'2020-05-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (264, N'06', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 7, 1, CAST(N'2020-06-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (265, N'07', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 7, 1, CAST(N'2020-07-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (266, N'08', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 7, 1, CAST(N'2020-08-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (267, N'09', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 7, 1, CAST(N'2020-09-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (268, N'10', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 7, 1, CAST(N'2020-10-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (269, N'11', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 7, 1, CAST(N'2020-11-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (270, N'12', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 7, 1, CAST(N'2020-12-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (271, N'01', N'2021', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 7, 1, CAST(N'2021-01-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (272, N'02', N'2021', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 7, 1, CAST(N'2021-02-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (273, N'03', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 8, 1, CAST(N'2020-03-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (274, N'04', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 8, 1, CAST(N'2020-04-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (275, N'05', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 8, 1, CAST(N'2020-05-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (276, N'06', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 8, 1, CAST(N'2020-06-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (277, N'07', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 8, 1, CAST(N'2020-07-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (278, N'08', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 8, 1, CAST(N'2020-08-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (279, N'09', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 8, 1, CAST(N'2020-09-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (280, N'10', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 8, 1, CAST(N'2020-10-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (281, N'11', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 8, 1, CAST(N'2020-11-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (282, N'12', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 8, 1, CAST(N'2020-12-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (283, N'01', N'2021', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 8, 1, CAST(N'2021-01-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (284, N'02', N'2021', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 8, 1, CAST(N'2021-02-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (285, N'03', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 9, 1, CAST(N'2020-03-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (286, N'04', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 9, 1, CAST(N'2020-04-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (287, N'05', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 9, 1, CAST(N'2020-05-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (288, N'06', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 9, 1, CAST(N'2020-06-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (289, N'07', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 9, 1, CAST(N'2020-07-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (290, N'08', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 9, 1, CAST(N'2020-08-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (291, N'09', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 9, 1, CAST(N'2020-09-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (292, N'10', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 9, 1, CAST(N'2020-10-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (293, N'11', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 9, 1, CAST(N'2020-11-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (294, N'12', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 9, 1, CAST(N'2020-12-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (295, N'01', N'2021', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 9, 1, CAST(N'2021-01-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (296, N'02', N'2021', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 9, 1, CAST(N'2021-02-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (297, N'03', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 10, 1, CAST(N'2020-03-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (298, N'04', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 10, 1, CAST(N'2020-04-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (299, N'05', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 10, 1, CAST(N'2020-05-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (300, N'06', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 10, 1, CAST(N'2020-06-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (301, N'07', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 10, 1, CAST(N'2020-07-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (302, N'08', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 10, 1, CAST(N'2020-08-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (303, N'09', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 10, 1, CAST(N'2020-09-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (304, N'10', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 10, 1, CAST(N'2020-10-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (305, N'11', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 10, 1, CAST(N'2020-11-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (306, N'12', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 10, 1, CAST(N'2020-12-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (307, N'01', N'2021', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 10, 1, CAST(N'2021-01-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (308, N'02', N'2021', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 10, 1, CAST(N'2021-02-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (309, N'03', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 11, 1, CAST(N'2020-03-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (310, N'04', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 11, 1, CAST(N'2020-04-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (311, N'05', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 11, 1, CAST(N'2020-05-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (312, N'06', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 11, 1, CAST(N'2020-06-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (313, N'07', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 11, 1, CAST(N'2020-07-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (314, N'08', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 11, 1, CAST(N'2020-08-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (315, N'09', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 11, 1, CAST(N'2020-09-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (316, N'10', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 11, 1, CAST(N'2020-10-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (317, N'11', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 11, 1, CAST(N'2020-11-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (318, N'12', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 11, 1, CAST(N'2020-12-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (319, N'01', N'2021', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 11, 1, CAST(N'2021-01-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (320, N'02', N'2021', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 11, 1, CAST(N'2021-02-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (321, N'03', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 12, 1, CAST(N'2020-03-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (322, N'04', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 12, 1, CAST(N'2020-04-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (323, N'05', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 12, 1, CAST(N'2020-05-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (324, N'06', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 12, 1, CAST(N'2020-06-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (325, N'07', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 12, 1, CAST(N'2020-07-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (326, N'08', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 12, 1, CAST(N'2020-08-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (327, N'09', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 12, 1, CAST(N'2020-09-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (328, N'10', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 12, 1, CAST(N'2020-10-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (329, N'11', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 12, 1, CAST(N'2020-11-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (330, N'12', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 12, 1, CAST(N'2020-12-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (331, N'01', N'2021', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 12, 1, CAST(N'2021-01-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (332, N'02', N'2021', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 12, 1, CAST(N'2021-02-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (333, N'03', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 15, 1, CAST(N'2020-03-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (334, N'04', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 15, 1, CAST(N'2020-04-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (335, N'05', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 15, 1, CAST(N'2020-05-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (336, N'06', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 15, 1, CAST(N'2020-06-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (337, N'07', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 15, 1, CAST(N'2020-07-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (338, N'08', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 15, 1, CAST(N'2020-08-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (339, N'09', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 15, 1, CAST(N'2020-09-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (340, N'10', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 15, 1, CAST(N'2020-10-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (341, N'11', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 15, 1, CAST(N'2020-11-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (342, N'12', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 15, 1, CAST(N'2020-12-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (343, N'01', N'2021', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 15, 1, CAST(N'2021-01-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (344, N'02', N'2021', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 15, 1, CAST(N'2021-02-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (345, N'03', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 16, 1, CAST(N'2020-03-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (346, N'04', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 16, 1, CAST(N'2020-04-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (347, N'05', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 16, 1, CAST(N'2020-05-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (348, N'06', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 16, 1, CAST(N'2020-06-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (349, N'07', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 16, 1, CAST(N'2020-07-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (350, N'08', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 16, 1, CAST(N'2020-08-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (351, N'09', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 16, 1, CAST(N'2020-09-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (352, N'10', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 16, 1, CAST(N'2020-10-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (353, N'11', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 16, 1, CAST(N'2020-11-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (354, N'12', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 16, 1, CAST(N'2020-12-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (355, N'01', N'2021', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 16, 1, CAST(N'2021-01-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (356, N'02', N'2021', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 16, 1, CAST(N'2021-02-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (357, N'03', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 17, 1, CAST(N'2020-03-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (358, N'04', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 17, 1, CAST(N'2020-04-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (359, N'05', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 17, 1, CAST(N'2020-05-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (360, N'06', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 17, 1, CAST(N'2020-06-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (361, N'07', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 17, 1, CAST(N'2020-07-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (362, N'08', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 17, 1, CAST(N'2020-08-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (363, N'09', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 17, 1, CAST(N'2020-09-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (364, N'10', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 17, 1, CAST(N'2020-10-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (365, N'11', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 17, 1, CAST(N'2020-11-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (366, N'12', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 17, 1, CAST(N'2020-12-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (367, N'01', N'2021', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 17, 1, CAST(N'2021-01-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (368, N'02', N'2021', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 17, 1, CAST(N'2021-02-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (369, N'03', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 18, 1, CAST(N'2020-03-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (370, N'04', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 18, 1, CAST(N'2020-04-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (371, N'05', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 18, 1, CAST(N'2020-05-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (372, N'06', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 18, 1, CAST(N'2020-06-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (373, N'07', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 18, 1, CAST(N'2020-07-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (374, N'08', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 18, 1, CAST(N'2020-08-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (375, N'09', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 18, 1, CAST(N'2020-09-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (376, N'10', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 18, 1, CAST(N'2020-10-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (377, N'11', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 18, 1, CAST(N'2020-11-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (378, N'12', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 18, 1, CAST(N'2020-12-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (379, N'01', N'2021', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 18, 1, CAST(N'2021-01-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (380, N'02', N'2021', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 18, 1, CAST(N'2021-02-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (381, N'03', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 19, 1, CAST(N'2020-03-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (382, N'04', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 19, 1, CAST(N'2020-04-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (383, N'05', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 19, 1, CAST(N'2020-05-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (384, N'06', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 19, 1, CAST(N'2020-06-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (385, N'07', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 19, 1, CAST(N'2020-07-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (386, N'08', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 19, 1, CAST(N'2020-08-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (387, N'09', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 19, 1, CAST(N'2020-09-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (388, N'10', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 19, 1, CAST(N'2020-10-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (389, N'11', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 19, 1, CAST(N'2020-11-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (390, N'12', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 19, 1, CAST(N'2020-12-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (391, N'01', N'2021', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 19, 1, CAST(N'2021-01-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (392, N'02', N'2021', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 19, 1, CAST(N'2021-02-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (393, N'03', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 20, 1, CAST(N'2020-03-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (394, N'04', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 20, 1, CAST(N'2020-04-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (395, N'05', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 20, 1, CAST(N'2020-05-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (396, N'06', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 20, 1, CAST(N'2020-06-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (397, N'07', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 20, 1, CAST(N'2020-07-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (398, N'08', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 20, 1, CAST(N'2020-08-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (399, N'09', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 20, 1, CAST(N'2020-09-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (400, N'10', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 20, 1, CAST(N'2020-10-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (401, N'11', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 20, 1, CAST(N'2020-11-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (402, N'12', N'2020', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 20, 1, CAST(N'2020-12-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (403, N'01', N'2021', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 20, 1, CAST(N'2021-01-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (404, N'02', N'2021', NULL, CAST(N'2020-03-05' AS Date), NULL, CAST(80.00 AS Decimal(6, 2)), 20, 1, CAST(N'2021-02-05' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (405, N'03', N'2020', CAST(N'2020-03-06' AS Date), CAST(N'2020-03-06' AS Date), N'cam kirildi', CAST(120.00 AS Decimal(6, 2)), 1, 2, CAST(N'2020-03-06' AS Date), NULL, 0)
GO
INSERT [dbo].[Odemeler] ([ID], [Ay], [Yil], [OdemeTarihi], [KayitTarihi], [Aciklama], [Tutar], [KisiID], [OdemeTipiID], [VadeTarihi], [GuncellemeTarihi], [IsDeleted]) VALUES (406, N'02', N'2020', NULL, CAST(N'2020-02-01' AS Date), NULL, CAST(40.00 AS Decimal(6, 2)), 1, 1, CAST(N'2020-02-01' AS Date), NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[Odemeler] OFF
GO
SET IDENTITY_INSERT [dbo].[OdemeTipi] ON 

GO
INSERT [dbo].[OdemeTipi] ([ID], [OdemeAdi], [IsDeleted]) VALUES (1, N'Aidat', 0)
GO
INSERT [dbo].[OdemeTipi] ([ID], [OdemeAdi], [IsDeleted]) VALUES (2, N'Masraf', 0)
GO
INSERT [dbo].[OdemeTipi] ([ID], [OdemeAdi], [IsDeleted]) VALUES (3, N'asd123', 1)
GO
SET IDENTITY_INSERT [dbo].[OdemeTipi] OFF
GO
/****** Object:  StoredProcedure [dbo].[S_Bloklar]    Script Date: 2020-03-06 10:07:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		mcy
-- Create date: 1.3.2020
-- Description:	kişiler
-- =============================================
CREATE PROCEDURE [dbo].[S_Bloklar]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from Bloklar
END

GO
/****** Object:  StoredProcedure [dbo].[S_CariIslemler]    Script Date: 2020-03-06 10:07:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		mcy
-- Create date: 5.4.2020
-- Description:	cari işlemler formu
-- =============================================
CREATE PROCEDURE [dbo].[S_CariIslemler] 
	
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
      ,(case when isnull(O.[OdemeTarihi],'1900-01-01') = '1900-01-01' then cast(0 as decimal) else O.[Tutar] end) as Tutar 
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
/****** Object:  StoredProcedure [dbo].[S_Daireler]    Script Date: 2020-03-06 10:07:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		mcy
-- Create date: 1.3.2020
-- Description:	kişiler
-- =============================================
CREATE PROCEDURE [dbo].[S_Daireler]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from Daireler
END

GO
/****** Object:  StoredProcedure [dbo].[S_Kisiler]    Script Date: 2020-03-06 10:07:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		mcy
-- Create date: 1.3.2020
-- Description:	kişiler
-- =============================================
CREATE PROCEDURE [dbo].[S_Kisiler] 
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

GO
/****** Object:  StoredProcedure [dbo].[S_KisilerListesi]    Script Date: 2020-03-06 10:07:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		mcy
-- Create date: 5.4.2020
-- Description:	kişiler listesi
-- =============================================
CREATE PROCEDURE [dbo].[S_KisilerListesi] 

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
  FROM [Kisiler] 
  where IsDeleted = 0
  and OturuyorAyrildi = 1

END

GO
/****** Object:  StoredProcedure [dbo].[S_Odemeler]    Script Date: 2020-03-06 10:07:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		mcy
-- Create date: 2.3.2020
-- Description:	ödemeler
-- =============================================
CREATE PROCEDURE [dbo].[S_Odemeler]
	@KisiID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    if @KisiID > 0
	begin
		select * from Odemeler where KisiID = @KisiID
	end
	else
	begin
		select * from Odemeler
	end

END

GO
/****** Object:  StoredProcedure [dbo].[S_OdemelerSablon]    Script Date: 2020-03-06 10:07:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		mcy
-- Create date: 4.3.2020
-- Description:	iList datagrid için şablon olarak tablo şemasını çekiyorum
-- =============================================
CREATE PROCEDURE [dbo].[S_OdemelerSablon]
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
/****** Object:  StoredProcedure [dbo].[S_OdemeTipi]    Script Date: 2020-03-06 10:07:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		mcy
-- Create date: 2.3.2020
-- Description:	ödeme tipi
-- =============================================
CREATE PROCEDURE [dbo].[S_OdemeTipi]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from OdemeTipi
END

GO
/****** Object:  StoredProcedure [dbo].[UDI_BlokTanimlari]    Script Date: 2020-03-06 10:07:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		mcy
-- Create date: 4.3.2020
-- Description:	blok ekle
-- =============================================
CREATE PROCEDURE [dbo].[UDI_BlokTanimlari]
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
/****** Object:  StoredProcedure [dbo].[UDI_Borclandir]    Script Date: 2020-03-06 10:07:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		mcy
-- Create date: 4.3.2020
-- Description:	vade adedi kadar ödeme planı çıkarır.
-- =============================================
CREATE PROCEDURE [dbo].[UDI_Borclandir] 
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
			--insert into Odemeler (KisiID,OdemeTipiID,Tutar,VadeTarihi) 
			--values (@KisiID,@OdemeTipiID,@Tutar,@VadeTarihi)

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

GO
/****** Object:  StoredProcedure [dbo].[UDI_DaireTanimlari]    Script Date: 2020-03-06 10:07:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		mcy
-- Create date: 5.3.2020
-- Description:	daire tanımları
-- =============================================
CREATE PROCEDURE [dbo].[UDI_DaireTanimlari] 
	@IslemTipi int,-- 1: insert/update 2: delete
	@KayitID int,
	@DaireNo char(10)
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
			update Daireler set DaireNo = @DaireNo where ID = @KayitID
		end
		else
		begin
			insert into Daireler (DaireNo) values (@DaireNo)
		end
	end
	else if @IslemTipi = 2
	begin
		update Daireler set IsDeleted = 1 where ID = @KayitID
	end
END

GO
/****** Object:  StoredProcedure [dbo].[UDI_Kisi]    Script Date: 2020-03-06 10:07:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		mcy
-- Create date: 3.3.2020
-- Description:	kişi ekle
-- =============================================
CREATE PROCEDURE [dbo].[UDI_Kisi] 
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
			DaireCikisTarihi = cast(NULLIF(@DaireCikisTarihi,'') AS DATE),
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
			@KayitTarihi,@DaireGirisTarihi,cast(NULLIF(@DaireCikisTarihi,'') AS DATE),
			@OturuyorAyrildi,@Notlar)
		end
	end
	else if @IslemTipi = 2
	begin
		update Kisiler set IsDeleted = 1 where ID = @ID
	end

END

GO
/****** Object:  StoredProcedure [dbo].[UDI_OdemeEkle]    Script Date: 2020-03-06 10:07:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		mcy
-- Create date: 4.3.2020
-- Description:	ödeme ekle
-- =============================================
CREATE PROCEDURE [dbo].[UDI_OdemeEkle]
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
/****** Object:  StoredProcedure [dbo].[UDI_OdemeTipiTanimlari]    Script Date: 2020-03-06 10:07:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		mcy
-- Create date: 5.3.2020
-- Description:	ödeme tipi tanımları
-- =============================================
CREATE PROCEDURE [dbo].[UDI_OdemeTipiTanimlari] 
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
USE [master]
GO
ALTER DATABASE [SiteDB] SET  READ_WRITE 
GO
