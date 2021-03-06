USE [master]
GO
/****** Object:  Database [OnlineGuitarStoreCollective]    Script Date: 9/24/2020 12:08:18 PM ******/
CREATE DATABASE [OnlineGuitarStoreCollective]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OnlineGuitarStoreCollective', FILENAME = N'C:\Users\Tanne\OneDrive\Desktop\SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\OnlineGuitarStoreCollective.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OnlineGuitarStoreCollective_log', FILENAME = N'C:\Users\Tanne\OneDrive\Desktop\SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\OnlineGuitarStoreCollective_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [OnlineGuitarStoreCollective] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OnlineGuitarStoreCollective].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OnlineGuitarStoreCollective] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OnlineGuitarStoreCollective] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OnlineGuitarStoreCollective] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OnlineGuitarStoreCollective] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OnlineGuitarStoreCollective] SET ARITHABORT OFF 
GO
ALTER DATABASE [OnlineGuitarStoreCollective] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OnlineGuitarStoreCollective] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OnlineGuitarStoreCollective] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OnlineGuitarStoreCollective] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OnlineGuitarStoreCollective] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OnlineGuitarStoreCollective] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OnlineGuitarStoreCollective] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OnlineGuitarStoreCollective] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OnlineGuitarStoreCollective] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OnlineGuitarStoreCollective] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OnlineGuitarStoreCollective] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OnlineGuitarStoreCollective] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OnlineGuitarStoreCollective] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OnlineGuitarStoreCollective] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OnlineGuitarStoreCollective] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OnlineGuitarStoreCollective] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OnlineGuitarStoreCollective] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OnlineGuitarStoreCollective] SET RECOVERY FULL 
GO
ALTER DATABASE [OnlineGuitarStoreCollective] SET  MULTI_USER 
GO
ALTER DATABASE [OnlineGuitarStoreCollective] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OnlineGuitarStoreCollective] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OnlineGuitarStoreCollective] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OnlineGuitarStoreCollective] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OnlineGuitarStoreCollective] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'OnlineGuitarStoreCollective', N'ON'
GO
ALTER DATABASE [OnlineGuitarStoreCollective] SET QUERY_STORE = OFF
GO
USE [OnlineGuitarStoreCollective]
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 9/24/2020 12:08:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[InvoiceId] [int] IDENTITY(1001,1) NOT NULL,
	[StoreId] [int] NOT NULL,
	[Invoicedate] [smalldatetime] NOT NULL,
	[DueDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED 
(
	[InvoiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 9/24/2020 12:08:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[StoreId] [int] NOT NULL,
	[InstrumentType] [nvarchar](25) NOT NULL,
	[Brand] [nvarchar](25) NOT NULL,
	[SerialNumber] [nvarchar](50) NOT NULL,
	[Year] [nvarchar](4) NOT NULL,
	[Price] [smallmoney] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Receipt]    Script Date: 9/24/2020 12:08:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Receipt](
	[ReceiptId] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceId] [int] NOT NULL,
	[StoreId] [int] NOT NULL,
	[ReceiptDate] [smalldatetime] NOT NULL,
	[Amount] [smallmoney] NOT NULL,
 CONSTRAINT [PK_Receipt] PRIMARY KEY CLUSTERED 
(
	[ReceiptId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Store]    Script Date: 9/24/2020 12:08:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Store](
	[StoreId] [int] IDENTITY(1,1) NOT NULL,
	[StoreName] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[State] [nvarchar](15) NOT NULL,
	[Zip] [nchar](10) NOT NULL,
	[StoreOwnerId] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Store] PRIMARY KEY CLUSTERED 
(
	[StoreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 9/24/2020 12:08:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](12) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Invoice] ON 

INSERT [dbo].[Invoice] ([InvoiceId], [StoreId], [Invoicedate], [DueDate]) VALUES (1001, 1, CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2020-01-15T00:00:00' AS SmallDateTime))
INSERT [dbo].[Invoice] ([InvoiceId], [StoreId], [Invoicedate], [DueDate]) VALUES (1002, 1, CAST(N'2020-01-02T00:00:00' AS SmallDateTime), CAST(N'2020-01-15T00:00:00' AS SmallDateTime))
INSERT [dbo].[Invoice] ([InvoiceId], [StoreId], [Invoicedate], [DueDate]) VALUES (1003, 2, CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2020-01-05T00:00:00' AS SmallDateTime))
INSERT [dbo].[Invoice] ([InvoiceId], [StoreId], [Invoicedate], [DueDate]) VALUES (1004, 2, CAST(N'2020-01-02T00:00:00' AS SmallDateTime), CAST(N'2020-01-15T00:00:00' AS SmallDateTime))
INSERT [dbo].[Invoice] ([InvoiceId], [StoreId], [Invoicedate], [DueDate]) VALUES (1005, 3, CAST(N'2020-01-06T00:00:00' AS SmallDateTime), CAST(N'2020-01-15T00:00:00' AS SmallDateTime))
INSERT [dbo].[Invoice] ([InvoiceId], [StoreId], [Invoicedate], [DueDate]) VALUES (1006, 3, CAST(N'2020-01-16T00:00:00' AS SmallDateTime), CAST(N'2020-02-01T00:00:00' AS SmallDateTime))
INSERT [dbo].[Invoice] ([InvoiceId], [StoreId], [Invoicedate], [DueDate]) VALUES (1007, 4, CAST(N'2020-01-16T00:00:00' AS SmallDateTime), CAST(N'2020-02-01T00:00:00' AS SmallDateTime))
INSERT [dbo].[Invoice] ([InvoiceId], [StoreId], [Invoicedate], [DueDate]) VALUES (1008, 4, CAST(N'2020-03-01T00:00:00' AS SmallDateTime), CAST(N'2020-03-15T00:00:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[Invoice] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductId], [StoreId], [InstrumentType], [Brand], [SerialNumber], [Year], [Price]) VALUES (1, 1, N'Guitar', N'Martin', N'00-28', N'1928', 3400.0000)
INSERT [dbo].[Product] ([ProductId], [StoreId], [InstrumentType], [Brand], [SerialNumber], [Year], [Price]) VALUES (2, 1, N'Guitar', N'Martin', N'DXM', N'2004', 450.0000)
INSERT [dbo].[Product] ([ProductId], [StoreId], [InstrumentType], [Brand], [SerialNumber], [Year], [Price]) VALUES (3, 1, N'Guitar', N'Martin', N'000-18', N'1918', 5600.0000)
INSERT [dbo].[Product] ([ProductId], [StoreId], [InstrumentType], [Brand], [SerialNumber], [Year], [Price]) VALUES (4, 1, N'Banjo', N'GoldTone', N'BC-350', N'2017', 950.0000)
INSERT [dbo].[Product] ([ProductId], [StoreId], [InstrumentType], [Brand], [SerialNumber], [Year], [Price]) VALUES (5, 2, N'Guitar', N'Taylor', N'T-24', N'2008', 1200.0000)
INSERT [dbo].[Product] ([ProductId], [StoreId], [InstrumentType], [Brand], [SerialNumber], [Year], [Price]) VALUES (6, 2, N'Guitar', N'Martin', N'DXM-2', N'2005', 550.0000)
INSERT [dbo].[Product] ([ProductId], [StoreId], [InstrumentType], [Brand], [SerialNumber], [Year], [Price]) VALUES (7, 2, N'Violin', N'Schector', N'S-1313', N'2007', 5000.0000)
INSERT [dbo].[Product] ([ProductId], [StoreId], [InstrumentType], [Brand], [SerialNumber], [Year], [Price]) VALUES (8, 4, N'Banjo', N'Goldtone', N'BC-250', N'2011', 460.0000)
INSERT [dbo].[Product] ([ProductId], [StoreId], [InstrumentType], [Brand], [SerialNumber], [Year], [Price]) VALUES (9, 4, N'Banjo', N'Enoch', N'E-75', N'2018', 3200.0000)
INSERT [dbo].[Product] ([ProductId], [StoreId], [InstrumentType], [Brand], [SerialNumber], [Year], [Price]) VALUES (10, 4, N'Mandolin', N'Gibson', N'TG-44', N'1967', 12000.0000)
INSERT [dbo].[Product] ([ProductId], [StoreId], [InstrumentType], [Brand], [SerialNumber], [Year], [Price]) VALUES (11, 5, N'Guitar', N'Gibson', N'J-45', N'1965', 4550.0000)
INSERT [dbo].[Product] ([ProductId], [StoreId], [InstrumentType], [Brand], [SerialNumber], [Year], [Price]) VALUES (12, 5, N'Flute', N'Fluty', N'F-76', N'2020', 75.0000)
INSERT [dbo].[Product] ([ProductId], [StoreId], [InstrumentType], [Brand], [SerialNumber], [Year], [Price]) VALUES (13, 5, N'Banjo', N'Dobson', N'D-65', N'1896', 140000.0000)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Receipt] ON 

INSERT [dbo].[Receipt] ([ReceiptId], [InvoiceId], [StoreId], [ReceiptDate], [Amount]) VALUES (2, 1001, 1, CAST(N'2020-01-15T00:00:00' AS SmallDateTime), 3400.0000)
INSERT [dbo].[Receipt] ([ReceiptId], [InvoiceId], [StoreId], [ReceiptDate], [Amount]) VALUES (3, 1002, 1, CAST(N'2020-01-15T00:00:00' AS SmallDateTime), 5600.0000)
INSERT [dbo].[Receipt] ([ReceiptId], [InvoiceId], [StoreId], [ReceiptDate], [Amount]) VALUES (4, 1003, 2, CAST(N'2020-01-15T00:00:00' AS SmallDateTime), 1200.0000)
INSERT [dbo].[Receipt] ([ReceiptId], [InvoiceId], [StoreId], [ReceiptDate], [Amount]) VALUES (5, 1004, 2, CAST(N'2020-01-15T00:00:00' AS SmallDateTime), 550.0000)
INSERT [dbo].[Receipt] ([ReceiptId], [InvoiceId], [StoreId], [ReceiptDate], [Amount]) VALUES (6, 1005, 4, CAST(N'2020-01-15T00:00:00' AS SmallDateTime), 460.0000)
INSERT [dbo].[Receipt] ([ReceiptId], [InvoiceId], [StoreId], [ReceiptDate], [Amount]) VALUES (7, 1006, 4, CAST(N'2020-02-01T00:00:00' AS SmallDateTime), 12000.0000)
INSERT [dbo].[Receipt] ([ReceiptId], [InvoiceId], [StoreId], [ReceiptDate], [Amount]) VALUES (8, 1007, 5, CAST(N'2020-02-01T00:00:00' AS SmallDateTime), 4500.0000)
INSERT [dbo].[Receipt] ([ReceiptId], [InvoiceId], [StoreId], [ReceiptDate], [Amount]) VALUES (9, 1008, 5, CAST(N'2020-03-15T00:00:00' AS SmallDateTime), 75.0000)
SET IDENTITY_INSERT [dbo].[Receipt] OFF
GO
SET IDENTITY_INSERT [dbo].[Store] ON 

INSERT [dbo].[Store] ([StoreId], [StoreName], [Address], [City], [State], [Zip], [StoreOwnerId]) VALUES (1, N'Dave''s Guitar', N'201 E 5th Street', N'La Crosse', N'WI', N'54601     ', N'Dave Lerry')
INSERT [dbo].[Store] ([StoreId], [StoreName], [Address], [City], [State], [Zip], [StoreOwnerId]) VALUES (2, N'Elderly Instruments', N'43 W Concord Avenue', N'Lansing', N'MI', N'48906     ', N'Greg Daniels')
INSERT [dbo].[Store] ([StoreId], [StoreName], [Address], [City], [State], [Zip], [StoreOwnerId]) VALUES (4, N'Hardt''s', N'53 W 3rd Street', N'Winona', N'MN', N'55987     ', N'Julie Mattison')
INSERT [dbo].[Store] ([StoreId], [StoreName], [Address], [City], [State], [Zip], [StoreOwnerId]) VALUES (5, N'Capitol Guitars', N'5534 N University Avenue', N'St. Paul', N'MN', N'55104     ', N'Ben Johnson')
SET IDENTITY_INSERT [dbo].[Store] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserId], [FirstName], [LastName], [Phone], [Email]) VALUES (1, N'Tanner', N'Brethorst', N'111-111-1111', N'tbret@email.com')
INSERT [dbo].[User] ([UserId], [FirstName], [LastName], [Phone], [Email]) VALUES (2, N'Jacob', N'Wildly', N'111-111-1112', N'jwild@email.com')
INSERT [dbo].[User] ([UserId], [FirstName], [LastName], [Phone], [Email]) VALUES (3, N'Karen', N'DeBlash', N'111-111-1113', N'kdebl@email.com')
INSERT [dbo].[User] ([UserId], [FirstName], [LastName], [Phone], [Email]) VALUES (4, N'Dale', N'Blanco', N'111-111-1114', N'dblan@email.com')
INSERT [dbo].[User] ([UserId], [FirstName], [LastName], [Phone], [Email]) VALUES (5, N'Dave', N'Lerry', N'111-111-1115', N'dlerr@email.com')
INSERT [dbo].[User] ([UserId], [FirstName], [LastName], [Phone], [Email]) VALUES (6, N'Greg', N'Daniels', N'111-111-1116', N'dlerr@email.com')
INSERT [dbo].[User] ([UserId], [FirstName], [LastName], [Phone], [Email]) VALUES (7, N'Julie', N'Mattison', N'111-111-1117', N'jmatt@email.com')
INSERT [dbo].[User] ([UserId], [FirstName], [LastName], [Phone], [Email]) VALUES (8, N'Ben', N'Johnson', N'111-111-1118', N'bjohn@email.com')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
USE [master]
GO
ALTER DATABASE [OnlineGuitarStoreCollective] SET  READ_WRITE 
GO
