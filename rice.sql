USE [master]
GO
/****** Object:  Database [RiceStore]    Script Date: 6/17/2021 10:18:50 PM ******/
CREATE DATABASE [RiceStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RiceStore', FILENAME = N'D:\DBI202\MSSQL15.MSSQLSERVER\MSSQL\DATA\RiceStore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RiceStore_log', FILENAME = N'D:\DBI202\MSSQL15.MSSQLSERVER\MSSQL\DATA\RiceStore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [RiceStore] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RiceStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RiceStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RiceStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RiceStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RiceStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RiceStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [RiceStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RiceStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RiceStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RiceStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RiceStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RiceStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RiceStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RiceStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RiceStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RiceStore] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RiceStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RiceStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RiceStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RiceStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RiceStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RiceStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RiceStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RiceStore] SET RECOVERY FULL 
GO
ALTER DATABASE [RiceStore] SET  MULTI_USER 
GO
ALTER DATABASE [RiceStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RiceStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RiceStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RiceStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RiceStore] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'RiceStore', N'ON'
GO
ALTER DATABASE [RiceStore] SET QUERY_STORE = OFF
GO
USE [RiceStore]
GO
/****** Object:  Table [dbo].[ExportRice]    Script Date: 6/17/2021 10:18:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExportRice](
	[ID] [int] NOT NULL,
	[RiceID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Unit price] [int] NOT NULL,
	[Date] [date] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImportRice]    Script Date: 6/17/2021 10:18:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImportRice](
	[ID] [int] NOT NULL,
	[RiceID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Unit price] [int] NOT NULL,
	[Date] [date] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rice]    Script Date: 6/17/2021 10:18:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rice](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Net weight] [float] NOT NULL,
 CONSTRAINT [PK_Rice] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[ExportRice] ([ID], [RiceID], [Quantity], [Unit price], [Date]) VALUES (1, 4, 2, 175000, CAST(N'2021-03-25' AS Date))
INSERT [dbo].[ExportRice] ([ID], [RiceID], [Quantity], [Unit price], [Date]) VALUES (2, 1, 4, 410000, CAST(N'2021-03-26' AS Date))
INSERT [dbo].[ExportRice] ([ID], [RiceID], [Quantity], [Unit price], [Date]) VALUES (2, 2, 9, 280000, CAST(N'2021-03-26' AS Date))
INSERT [dbo].[ExportRice] ([ID], [RiceID], [Quantity], [Unit price], [Date]) VALUES (2, 1, 2, 410000, CAST(N'2021-03-26' AS Date))
INSERT [dbo].[ExportRice] ([ID], [RiceID], [Quantity], [Unit price], [Date]) VALUES (3, 1, 5, 410000, CAST(N'2021-03-29' AS Date))
INSERT [dbo].[ExportRice] ([ID], [RiceID], [Quantity], [Unit price], [Date]) VALUES (4, 10, 5, 290000, CAST(N'2021-03-30' AS Date))
INSERT [dbo].[ExportRice] ([ID], [RiceID], [Quantity], [Unit price], [Date]) VALUES (4, 9, 6, 155000, CAST(N'2021-03-30' AS Date))
INSERT [dbo].[ExportRice] ([ID], [RiceID], [Quantity], [Unit price], [Date]) VALUES (5, 5, 6, 300000, CAST(N'2021-03-31' AS Date))
INSERT [dbo].[ExportRice] ([ID], [RiceID], [Quantity], [Unit price], [Date]) VALUES (5, 10, 7, 320000, CAST(N'2021-03-31' AS Date))
INSERT [dbo].[ExportRice] ([ID], [RiceID], [Quantity], [Unit price], [Date]) VALUES (3, 4, 3, 175000, CAST(N'2021-03-26' AS Date))
GO
INSERT [dbo].[ImportRice] ([ID], [RiceID], [Quantity], [Unit price], [Date]) VALUES (1, 4, 2, 125000, CAST(N'2021-03-23' AS Date))
INSERT [dbo].[ImportRice] ([ID], [RiceID], [Quantity], [Unit price], [Date]) VALUES (2, 7, 10, 135000, CAST(N'2021-03-24' AS Date))
INSERT [dbo].[ImportRice] ([ID], [RiceID], [Quantity], [Unit price], [Date]) VALUES (2, 10, 5, 200000, CAST(N'2021-03-24' AS Date))
INSERT [dbo].[ImportRice] ([ID], [RiceID], [Quantity], [Unit price], [Date]) VALUES (3, 4, 15, 125000, CAST(N'2021-03-24' AS Date))
INSERT [dbo].[ImportRice] ([ID], [RiceID], [Quantity], [Unit price], [Date]) VALUES (4, 1, 5, 380000, CAST(N'2021-03-25' AS Date))
INSERT [dbo].[ImportRice] ([ID], [RiceID], [Quantity], [Unit price], [Date]) VALUES (4, 2, 10, 180000, CAST(N'2021-03-25' AS Date))
INSERT [dbo].[ImportRice] ([ID], [RiceID], [Quantity], [Unit price], [Date]) VALUES (5, 6, 5, 60000, CAST(N'2021-03-25' AS Date))
INSERT [dbo].[ImportRice] ([ID], [RiceID], [Quantity], [Unit price], [Date]) VALUES (6, 1, 10, 380000, CAST(N'2021-03-29' AS Date))
INSERT [dbo].[ImportRice] ([ID], [RiceID], [Quantity], [Unit price], [Date]) VALUES (6, 2, 10, 250000, CAST(N'2021-03-29' AS Date))
INSERT [dbo].[ImportRice] ([ID], [RiceID], [Quantity], [Unit price], [Date]) VALUES (7, 1, 10, 250000, CAST(N'2021-03-29' AS Date))
INSERT [dbo].[ImportRice] ([ID], [RiceID], [Quantity], [Unit price], [Date]) VALUES (8, 10, 7, 135000, CAST(N'2021-03-30' AS Date))
INSERT [dbo].[ImportRice] ([ID], [RiceID], [Quantity], [Unit price], [Date]) VALUES (9, 1005, 5, 125000, CAST(N'2021-03-30' AS Date))
INSERT [dbo].[ImportRice] ([ID], [RiceID], [Quantity], [Unit price], [Date]) VALUES (9, 7, 4, 125000, CAST(N'2021-03-30' AS Date))
INSERT [dbo].[ImportRice] ([ID], [RiceID], [Quantity], [Unit price], [Date]) VALUES (10, 1, 5, 250000, CAST(N'2021-03-31' AS Date))
INSERT [dbo].[ImportRice] ([ID], [RiceID], [Quantity], [Unit price], [Date]) VALUES (2, 8, 10, 150000, CAST(N'2021-03-24' AS Date))
INSERT [dbo].[ImportRice] ([ID], [RiceID], [Quantity], [Unit price], [Date]) VALUES (9, 5, 5, 135000, CAST(N'2021-03-30' AS Date))
INSERT [dbo].[ImportRice] ([ID], [RiceID], [Quantity], [Unit price], [Date]) VALUES (10, 6, 8, 50000, CAST(N'2021-03-31' AS Date))
INSERT [dbo].[ImportRice] ([ID], [RiceID], [Quantity], [Unit price], [Date]) VALUES (8, 5, 15, 125000, CAST(N'2021-03-30' AS Date))
INSERT [dbo].[ImportRice] ([ID], [RiceID], [Quantity], [Unit price], [Date]) VALUES (9, 10, 7, 135000, CAST(N'2021-03-30' AS Date))
INSERT [dbo].[ImportRice] ([ID], [RiceID], [Quantity], [Unit price], [Date]) VALUES (10, 10, 4, 250000, CAST(N'2021-03-31' AS Date))
INSERT [dbo].[ImportRice] ([ID], [RiceID], [Quantity], [Unit price], [Date]) VALUES (8, 1005, 10, 145000, CAST(N'2021-03-30' AS Date))
INSERT [dbo].[ImportRice] ([ID], [RiceID], [Quantity], [Unit price], [Date]) VALUES (9, 9, 13, 250000, CAST(N'2021-03-30' AS Date))
INSERT [dbo].[ImportRice] ([ID], [RiceID], [Quantity], [Unit price], [Date]) VALUES (10, 4, 5, 145000, CAST(N'2021-03-31' AS Date))
INSERT [dbo].[ImportRice] ([ID], [RiceID], [Quantity], [Unit price], [Date]) VALUES (10, 8, 2, 135000, CAST(N'2021-03-31' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Rice] ON 

INSERT [dbo].[Rice] ([ID], [Name], [Net weight]) VALUES (1, N'ST25 bác Cua 10kg', 10)
INSERT [dbo].[Rice] ([ID], [Name], [Net weight]) VALUES (2, N'ST25 bác Cua 5kg', 5)
INSERT [dbo].[Rice] ([ID], [Name], [Net weight]) VALUES (3, N'ST25 nhân giống', 10)
INSERT [dbo].[Rice] ([ID], [Name], [Net weight]) VALUES (4, N'Japonica', 10)
INSERT [dbo].[Rice] ([ID], [Name], [Net weight]) VALUES (5, N'Phương Nam', 10)
INSERT [dbo].[Rice] ([ID], [Name], [Net weight]) VALUES (6, N'Lứt đen Phúc Thọ', 1)
INSERT [dbo].[Rice] ([ID], [Name], [Net weight]) VALUES (7, N'ST24 Đắk Lắk ', 10)
INSERT [dbo].[Rice] ([ID], [Name], [Net weight]) VALUES (8, N'ST24 Sóc Trăng', 10)
INSERT [dbo].[Rice] ([ID], [Name], [Net weight]) VALUES (9, N'Hương Lài', 10)
INSERT [dbo].[Rice] ([ID], [Name], [Net weight]) VALUES (10, N'Nếp cái hoa vàng', 2)
INSERT [dbo].[Rice] ([ID], [Name], [Net weight]) VALUES (1005, N'Tám Thái', 10)
SET IDENTITY_INSERT [dbo].[Rice] OFF
GO
ALTER TABLE [dbo].[ExportRice]  WITH CHECK ADD  CONSTRAINT [FK_ExportRice_Rice] FOREIGN KEY([RiceID])
REFERENCES [dbo].[Rice] ([ID])
GO
ALTER TABLE [dbo].[ExportRice] CHECK CONSTRAINT [FK_ExportRice_Rice]
GO
ALTER TABLE [dbo].[ImportRice]  WITH CHECK ADD  CONSTRAINT [FK_ImportRice_Rice] FOREIGN KEY([RiceID])
REFERENCES [dbo].[Rice] ([ID])
GO
ALTER TABLE [dbo].[ImportRice] CHECK CONSTRAINT [FK_ImportRice_Rice]
GO
USE [master]
GO
ALTER DATABASE [RiceStore] SET  READ_WRITE 
GO
