USE [master]
GO
/****** Object:  Database [Labarator20]    Script Date: 08.05.2024 8:25:56 ******/
CREATE DATABASE [Labarator20]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Labarator20', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Labarator20.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Labarator20_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Labarator20_log.ldf' , SIZE = 1280KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Labarator20] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Labarator20].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Labarator20] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Labarator20] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Labarator20] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Labarator20] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Labarator20] SET ARITHABORT OFF 
GO
ALTER DATABASE [Labarator20] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Labarator20] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Labarator20] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Labarator20] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Labarator20] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Labarator20] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Labarator20] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Labarator20] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Labarator20] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Labarator20] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Labarator20] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Labarator20] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Labarator20] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Labarator20] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Labarator20] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Labarator20] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Labarator20] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Labarator20] SET RECOVERY FULL 
GO
ALTER DATABASE [Labarator20] SET  MULTI_USER 
GO
ALTER DATABASE [Labarator20] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Labarator20] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Labarator20] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Labarator20] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Labarator20] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Labarator20]
GO
/****** Object:  Table [dbo].[users]    Script Date: 08.05.2024 8:25:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[login] [nvarchar](255) NULL,
	[password] [nvarchar](255) NULL,
	[ip] [nvarchar](255) NULL,
	[lastenter] [date] NULL,
	[services] [nvarchar](255) NULL,
	[type] [int] NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Бухгалтер]    Script Date: 08.05.2024 8:25:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Бухгалтер](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[выставленныеСчетаСтрахКомпаниями] [int] NULL,
	[НаборУслуг] [int] NULL,
	[id_user] [int] NULL,
 CONSTRAINT [PK_Бухгалтер] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Выставленые счета страховой компании]    Script Date: 08.05.2024 8:25:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Выставленые счета страховой компании](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Название страховой компании] [int] NULL,
	[Сумма] [money] NULL,
 CONSTRAINT [PK_Выставленые счета страховой компании] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Данные анализатора]    Script Date: 08.05.2024 8:25:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Данные анализатора](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Название] [nvarchar](255) NULL,
 CONSTRAINT [PK_Данные о работе анализатора] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Данные лаборантов]    Script Date: 08.05.2024 8:25:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Данные лаборантов](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[НаборУслуг] [int] NULL,
	[id_user] [int] NULL,
 CONSTRAINT [PK_Данные лаборантов] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ДанныеСтраховыхКомпаний]    Script Date: 08.05.2024 8:25:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ДанныеСтраховыхКомпаний](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[insurance_name] [nvarchar](255) NULL,
	[country] [nvarchar](255) NULL,
	[insurance_address] [nvarchar](255) NULL,
	[insurance_inn] [int] NULL,
	[ipadress] [nvarchar](255) NULL,
	[insurance_p/c] [int] NULL,
	[insurance_bik] [int] NULL,
 CONSTRAINT [PK_ДанныеСтраховыхКомпаний] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Заказ]    Script Date: 08.05.2024 8:25:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Заказ](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[patient] [int] NULL,
	[barcode] [varbinary](max) NULL,
	[date] [datetime] NULL,
	[accepted] [bit] NOT NULL,
	[status] [nvarchar](255) NULL,
	[finished] [datetime] NULL,
	[service] [int] NULL,
 CONSTRAINT [PK_Заказ] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ОказаниеУслуг]    Script Date: 08.05.2024 8:25:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ОказаниеУслуг](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[service] [int] NULL,
	[result] [float] NULL,
	[analyzer] [int] NULL,
	[user] [int] NULL,
 CONSTRAINT [PK_ОказаниеУслуг] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Пациент]    Script Date: 08.05.2024 8:25:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Пациент](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[login] [nvarchar](255) NULL,
	[pwd] [nvarchar](255) NULL,
	[birthdate] [date] NULL,
	[passport_s] [int] NULL,
	[passport_n] [int] NULL,
	[phone] [nvarchar](255) NULL,
	[email] [nvarchar](255) NULL,
	[social_sec_number] [int] NULL,
	[ein] [nvarchar](255) NULL,
	[страховая компания] [int] NULL,
	[guid] [nvarchar](255) NULL,
 CONSTRAINT [PK_Пациент] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Роль]    Script Date: 08.05.2024 8:25:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Роль](
	[id_Роль] [int] NOT NULL,
	[Наименование] [nvarchar](50) NULL,
 CONSTRAINT [PK_Роль] PRIMARY KEY CLUSTERED 
(
	[id_Роль] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Услуги_лаборатории]    Script Date: 08.05.2024 8:25:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Услуги_лаборатории](
	[id] [int] NOT NULL,
	[Наименование] [varchar](max) NULL,
	[Стоимость] [money] NULL,
	[Срок выполнения] [nvarchar](50) NULL,
	[Среднее отклонение] [int] NULL,
 CONSTRAINT [PK_Услуги_лаборатории] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (1, N'Clareta Hacking', N'4tzqHdkqzo4', N'4tzqHdkqzo4', N'147.231.50.234', NULL, N'[{"code":557},{"code":836},{"code":287}]', 1)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (2, N'Northrop Mably', N'nmably1', N'ukM0e6', N'22.32.15.211', NULL, N'[{"code":855},{"code":619},{"code":557},{"code":836},{"code":548}]', 2)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (3, N'Fabian Rolf', N'frolf2', N'7QpCwac0yi', N'113.92.142.29', NULL, N'[{"code":543},{"code":836}]', 1)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (4, N'Lauree Raden', N'lraden3', N'5Ydp2mz', N'39.24.146.52', NULL, N'[{"code":855},{"code":258}]', 1)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (5, N'Barby Follos', N'bfollos4', N'ckmAJPQV', N'87.232.97.3', NULL, N'[{"code":543},{"code":415},{"code":619},{"code":557}]', 1)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (6, N'Mile Enterle', N'menterle5', N'0PRom6i', N'85.121.209.6', NULL, N'[{"code":557},{"code":836},{"code":229}]', 2)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (7, N'Midge Peaker', N'mpeaker6', N'0Tc5oRc', N'196.39.132.128', NULL, N'[{"code":287},{"code":619},{"code":548},{"code":346}]', 2)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (8, N'Manon Robichon', N'mrobichon7', N'LEwEjMlmE5X', N'143.159.207.105', NULL, N'[{"code":415},{"code":311},{"code":176},{"code":855}]', 2)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (9, N'Stavro Robken', N'srobken8', N'Cbmj3Yi', N'12.154.73.196', NULL, N'[{"code":323},{"code":548},{"code":346}]', 3)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (10, N'Bryan Tidmas', N'btidmas9', N'dYDHbBQfK', N'24.42.134.21', NULL, N'[{"code":229},{"code":346},{"code":501},{"code":548}]', 3)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (11, N'Jeannette Fussie', N'jfussiea', N'EGxXuLQ9', N'98.194.112.137', NULL, N'[{"code":287}]', 2)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (12, N'Stephen Antonacci', N'santonaccib', N'YcXAhY3Pja', N'198.146.255.15', NULL, N'[{"code":619},{"code":258},{"code":229},{"code":557},{"code":797}]', 2)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (13, N'Niccolo Bountiff', N'nbountiffc', N'5xfyjS9ZULGA', N'231.78.246.229', NULL, N'[{"code":323},{"code":311},{"code":557}]', 1)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (14, N'Clemente Benjefield', N'cbenjefieldd', N'tQOsP0ei9TuD', N'88.126.93.246', NULL, N'[{"code":855},{"code":176},{"code":176},{"code":855}]', 3)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (15, N'Orlan Corbyn', N'ocorbyne', N'bG1ZIzwIoU', N'232.175.48.179', NULL, N'[{"code":229},{"code":836},{"code":287},{"code":619}]', 3)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (16, N'Coreen Stickins', N'cstickinsf', N'QRYADbgNj', N'64.30.175.158', NULL, N'[{"code":557}]', 1)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (17, N'Daveta Clarage', N'dclarageg', N'Yp59ZIDnWe', N'139.88.229.111', NULL, N'[{"code":346},{"code":836},{"code":346}]', 3)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (18, N'Javier McCawley', N'jmccawleyh', N'g58zLcmCYON', N'14.199.67.32', NULL, N'[{"code":619},{"code":258}]', 3)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (19, N'Daile Band', N'dbandi', N'yFAaYuVW', N'206.105.148.56', NULL, N'[{"code":176},{"code":543},{"code":855},{"code":258}]', 3)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (20, N'Angil Buttery', N'abutteryj', N'ttOFbWWGtD', N'192.158.7.138', NULL, N'[{"code":323},{"code":855},{"code":659},{"code":287}]', 2)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (21, N'Kyla Kinman', N'kkinmank', N'qUr6fdWP6L5G', N'134.99.243.113', NULL, N'[{"code":346},{"code":855},{"code":323},{"code":557},{"code":501}]', 1)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (22, N'Selena Skepper', N'sskepperl', N'jHYN0v3', N'52.90.89.126', NULL, N'[{"code":855},{"code":287}]', 3)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (23, N'Alyson Yeoland', N'ayeolandm', N'QQezRBV9', N'239.7.55.187', NULL, N'[{"code":836},{"code":836},{"code":229},{"code":258},{"code":836}]', 3)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (24, N'Claudie Speeding', N'cspeedingn', N'UCLYITfw2Vo', N'127.37.194.127', NULL, N'[{"code":548},{"code":557},{"code":176}]', 2)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (25, N'Alaric Scarisbrick', N'ascarisbricko', N'fzBcv6GbyCp', N'97.227.15.172', NULL, N'[{"code":543},{"code":836}]', 3)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (26, N'Marie Thurby', N'mthurbyp', N'wg0uIskqei', N'94.70.148.135', NULL, N'[{"code":548},{"code":855}]', 1)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (27, N'Cloe Roxbrough', N'croxbroughq', N'67CVVym', N'185.110.201.36', NULL, N'[{"code":501},{"code":797},{"code":797}]', 2)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (28, N'Pegeen McCotter', N'pmccotterr', N'QG5tdzRpGZJ2', N'22.179.187.229', NULL, N'[{"code":176},{"code":855}]', 3)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (29, N'Iggie Calleja', N'icallejas', N'aeDvZk8o9', N'67.237.123.227', NULL, N'[{"code":836},{"code":176},{"code":619},{"code":258}]', 2)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (30, N'Nelle Brosch', N'nbroscht', N'DmPJt2', N'251.1.59.65', NULL, N'[{"code":346}]', 3)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (31, N'Shae Allsepp', N'sallseppu', N't0ko0854Cpvv', N'88.20.74.85', NULL, N'[{"code":548},{"code":229},{"code":258},{"code":619}]', 2)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (32, N'Eldridge Abbatucci', N'eabbatucciv', N'gUtNdsDu', N'52.44.134.126', NULL, N'[{"code":836},{"code":836},{"code":797}]', 2)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (33, N'Skip Garnham', N'sgarnhamw', N'eml6RqbK', N'100.17.131.54', NULL, N'[{"code":548}]', 2)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (34, N'Ric Kitchenside', N'rkitchensidex', N'xaa7miQ7yB', N'29.100.76.146', NULL, N'[{"code":501},{"code":258},{"code":659},{"code":501},{"code":659}]', 2)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (35, N'Urbanus Di Meo', N'udiy', N'dHqu78cU6NOP', N'90.30.202.251', NULL, N'[{"code":797},{"code":287},{"code":855},{"code":346}]', 2)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (36, N'Monty Beidebeke', N'mbeidebekez', N'F5T5spAU9A4O', N'3.32.202.92', CAST(N'2020-05-02' AS Date), N'[{"code":415},{"code":543},{"code":836}]', 2)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (37, N'Byrann Savins', N'bsavins10', N'l6sYf29NLN', N'123.187.14.103', NULL, N'[{"code":836}]', 2)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (38, N'Sonnie Riby', N'sriby11', N'Va34LYqFh', N'16.81.16.23', NULL, N'[{"code":501}]', 2)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (39, N'Sherill Birney', N'sbirney12', N'Ggygo2ePsETs', N'144.76.193.237', NULL, N'[{"code":836},{"code":258},{"code":619}]', 1)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (40, N'Indira Kleanthous', N'ikleanthous13', N'3H0GS7a', N'169.108.108.88', NULL, N'[{"code":797},{"code":346},{"code":543},{"code":501},{"code":258}]', 2)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (41, N'Maison Skerme', N'mskerme14', N'wy1HWA', N'143.177.136.232', CAST(N'2020-10-02' AS Date), N'[{"code":176},{"code":619}]', 2)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (42, N'Hanan Cahey', N'hcahey15', N'NSXcG9khd', N'18.127.87.158', NULL, N'[{"code":501},{"code":258}]', 3)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (43, N'Tore Rusling', N'trusling16', N'abol9dYC8e', N'142.216.95.251', NULL, N'[{"code":619}]', 2)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (44, N'Jeddy De Souza', N'jde17', N'gK6Hsl8Q', N'229.104.255.175', NULL, N'[{"code":415},{"code":619}]', 2)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (45, N'Flossi McLeoid', N'fmcleoid18', N'B9zr0N7cJw', N'90.207.38.179', NULL, N'[{"code":543}]', 2)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (46, N'Nikoletta Megainey', N'nmegainey19', N'gph7QurFf', N'172.249.218.50', NULL, N'[{"code":415}]', 2)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (47, N'Adan Bliven', N'abliven1a', N'vVxlf94KpeX', N'49.101.94.118', NULL, N'[{"code":323},{"code":548}]', 3)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (48, N'Mohandis Rossoni', N'mrossoni1b', N'nLXj2lS', N'161.5.132.42', NULL, N'[{"code":176},{"code":659},{"code":287}]', 3)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (49, N'Nappie Redington', N'nredington1c', N'DCbOb1SX', N'174.42.8.3', CAST(N'2020-06-05' AS Date), N'[{"code":548}]', 2)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (50, N'Lenka Francie', N'lfrancie1d', N'DoGeHWuAAM', N'182.2.128.34', NULL, N'[{"code":659},{"code":501},{"code":415}]', 2)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (51, N'Ashley Blowin', N'ablowin1e', N'aQygVtMjN', N'73.212.243.168', NULL, N'[{"code":176},{"code":311},{"code":855},{"code":176}]', 2)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (52, N'Vale Goroni', N'vgoroni1f', N'bWr0QU', N'93.126.120.134', NULL, N'[{"code":287},{"code":287},{"code":659}]', 3)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (53, N'Suki Grafom', N'sgrafom1g', N'JcNcVDAouYzA', N'9.26.5.107', NULL, N'[{"code":797},{"code":323},{"code":548}]', 3)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (54, N'Justis Gianneschi', N'jgianneschi1h', N'oieX5u3sUfpD', N'139.241.156.87', NULL, N'[{"code":836},{"code":543},{"code":548},{"code":311}]', 3)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (55, N'Emilie Collett', N'ecollett1i', N'Y0uMyKB0W', N'47.0.240.7', CAST(N'2019-07-10' AS Date), N'[{"code":543},{"code":287},{"code":258}]', 2)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (56, N'Byrom Terrell', N'bterrell1j', N'hswseW', N'157.21.33.53', NULL, N'[{"code":287},{"code":557},{"code":543}]', 1)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (57, N'Daphne Bifield', N'dbifield1k', N'oYAQ4URihIA', N'24.185.229.169', NULL, N'[{"code":619},{"code":323},{"code":855},{"code":229}]', 1)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (58, N'Blanca Staig', N'bstaig1l', N'MygqEtjMtUbC', N'171.78.28.229', NULL, N'[{"code":176},{"code":855}]', 3)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (59, N'Adriaens Kennsley', N'akennsley1m', N'CTUdBfJsy6qF', N'208.81.128.179', NULL, N'[{"code":836},{"code":548}]', 3)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (60, N'Emlyn Bartak', N'ebartak1n', N'y3t4H1', N'130.247.20.138', NULL, N'[{"code":543}]', 1)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (61, N'Victoria Willshire', N'vwillshire1o', N'VFSLc2t', N'243.230.165.161', CAST(N'2020-03-09' AS Date), N'[{"code":557},{"code":287},{"code":836},{"code":287}]', 1)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (62, N'Egon Savin', N'esavin1p', N'axnJY9s', N'40.140.160.210', NULL, N'[{"code":346},{"code":258},{"code":543},{"code":323},{"code":176}]', 2)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (63, N'Phillie Elsom', N'pelsom1q', N'OXzMECG', N'253.7.8.82', CAST(N'2020-01-01' AS Date), N'[{"code":323},{"code":501},{"code":501}]', 2)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (64, N'Adan Semaine', N'asemaine1r', N'MdJRkHor5SP', N'76.252.15.218', CAST(N'2019-05-10' AS Date), N'[{"code":258}]', 2)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (65, N'Constantino Northrop', N'cnorthrop1s', N'UIwCvTA7MRS0', N'119.130.24.85', CAST(N'2019-12-10' AS Date), N'[{"code":176},{"code":229}]', 1)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (66, N'Rodie Easson', N'reasson1t', N'3J0jgg9RWlXs', N'212.248.119.232', NULL, N'[{"code":855},{"code":287},{"code":797}]', 2)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (67, N'Alida Boleyn', N'aboleyn1u', N'3q2mQdDRmtr', N'181.14.56.184', NULL, N'[{"code":229},{"code":323},{"code":501},{"code":258},{"code":415}]', 3)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (68, N'Hill Scholfield', N'hscholfield1v', N'1Pbs3K6qXYB', N'15.7.205.224', NULL, N'[{"code":619},{"code":258},{"code":501},{"code":287}]', 2)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (69, N'Cordell Cowpe', N'ccowpe1w', N'VHr417Ft0', N'237.236.173.63', NULL, N'[{"code":346},{"code":311},{"code":346},{"code":176}]', 3)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (70, N'Alexandro Eldon', N'aeldon1x', N'rrywOQRmFKyh', N'4.174.11.210', CAST(N'2019-04-12' AS Date), N'[{"code":836},{"code":346},{"code":836}]', 1)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (71, N'Kayle Collin', N'kcollin1y', N'Q0ZV21vew0', N'52.19.142.168', NULL, N'[{"code":346}]', 1)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (72, N'Inesita Larkins', N'ilarkins1z', N'DEFNpHtU', N'3.26.42.188', CAST(N'2019-05-12' AS Date), N'[{"code":548},{"code":258},{"code":311},{"code":229}]', 1)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (73, N'Waylin Lound', N'wlound20', N'a2G4Ihh2o', N'31.243.68.215', NULL, N'[{"code":619},{"code":659},{"code":346}]', 1)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (74, N'Mechelle Gillogley', N'mgillogley21', N'EjUHfCUFqF', N'79.38.53.53', CAST(N'2020-01-05' AS Date), N'[{"code":346},{"code":176},{"code":176},{"code":415},{"code":415}]', 2)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (75, N'Donal Muccino', N'dmuccino22', N'E4okVgx', N'109.138.101.234', CAST(N'2020-02-04' AS Date), N'[{"code":176},{"code":619},{"code":287},{"code":311},{"code":619}]', 3)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (76, N'Joye Leadbetter', N'jleadbetter23', N'ZNsaKdgb', N'51.245.190.167', CAST(N'2020-02-05' AS Date), N'[{"code":548},{"code":543},{"code":548},{"code":855}]', 2)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (77, N'Gianina Trump', N'gtrump24', N'6XXY7IS26Ci', N'11.191.37.17', CAST(N'2020-03-08' AS Date), N'[{"code":258}]', 3)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (78, N'Read LeEstut', N'rleestut25', N'zq3C4rUR', N'119.247.100.162', CAST(N'2020-11-09' AS Date), N'[{"code":323},{"code":287},{"code":659},{"code":176}]', 1)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (79, N'Jill Anscott', N'janscott26', N'5maCRrCZLu', N'104.85.178.46', NULL, N'[{"code":287}]', 3)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (80, N'Bud Douch', N'bdouch27', N'KAkwrli', N'72.132.101.188', CAST(N'2020-06-02' AS Date), N'[{"code":287}]', 1)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (81, N'Cicily Ossenna', N'cossenna28', N'vfKJkCeohOzZ', N'230.85.180.186', CAST(N'2020-06-01' AS Date), N'[{"code":501},{"code":176},{"code":176}]', 3)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (82, N'Hew Izzat', N'hizzat29', N'Uifdtu', N'143.246.125.169', NULL, N'[{"code":287},{"code":501},{"code":287},{"code":311}]', 1)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (83, N'Eddie Gimeno', N'egimeno2a', N'oF1hbmKlZ', N'60.57.115.125', NULL, N'[{"code":659},{"code":543},{"code":501},{"code":659},{"code":548}]', 3)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (84, N'Sybyl Fierro', N'sfierro2b', N'VjUrQ2', N'250.233.247.215', NULL, N'[{"code":415},{"code":323},{"code":346},{"code":311}]', 2)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (85, N'Nicol Troup', N'ntroup2c', N'KmDDYf1Pu', N'121.7.142.165', NULL, N'[{"code":415},{"code":176},{"code":836},{"code":287}]', 2)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (86, N'Bondy Pattenden', N'bpattenden2d', N'IOUkHpOn', N'45.121.26.90', NULL, N'[{"code":836},{"code":229},{"code":346},{"code":346}]', 1)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (87, N'Angus Cockman', N'acockman2e', N'fDKhK7OK', N'167.9.255.77', CAST(N'2020-06-01' AS Date), N'[{"code":323},{"code":229},{"code":258},{"code":258},{"code":415}]', 1)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (88, N'Mord Hanscome', N'mhanscome2f', N'xBHzpa7eP0u', N'121.181.10.230', CAST(N'2020-10-07' AS Date), N'[{"code":346},{"code":548},{"code":548}]', 2)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (89, N'Susy Leblanc', N'sleblanc2g', N'T2et1U5M', N'118.164.120.202', NULL, N'[{"code":855},{"code":619}]', 2)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (90, N'Gerard Ciccoloi', N'gciccoloi2h', N'w4dZ3hxiCiAg', N'71.235.27.27', CAST(N'2020-03-02' AS Date), N'[{"code":548},{"code":311},{"code":346},{"code":311}]', 1)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (91, N'Seamus Sayburn', N'ssayburn2i', N'1hTM7EVKaS', N'75.194.92.114', NULL, N'[{"code":557},{"code":548},{"code":557},{"code":323},{"code":557}]', 2)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (92, N'Washington Gentiry', N'wgentiry2j', N'z2X9UH5', N'188.49.78.185', CAST(N'2020-10-04' AS Date), N'[{"code":323},{"code":855},{"code":229}]', 1)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (93, N'Rebekkah Westall', N'rwestall2k', N'xLgunbO9x6', N'212.150.81.93', CAST(N'2020-02-02' AS Date), N'[{"code":501},{"code":501},{"code":855},{"code":797},{"code":501}]', 2)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (94, N'Court Kulic', N'ckulic2l', N'FLHYRN', N'154.121.193.131', NULL, N'[{"code":323}]', 1)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (95, N'Lorilee Roux', N'lroux2m', N'98cCxHeeK31', N'229.187.60.106', CAST(N'2020-12-06' AS Date), N'[{"code":415},{"code":543}]', 3)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (96, N'Modestine Rolinson', N'mrolinson2n', N'faGzyW8hEca', N'9.203.185.188', NULL, N'[{"code":311},{"code":855},{"code":797},{"code":855}]', 1)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (97, N'Shelbi Ellgood', N'sellgood2o', N'3do5MME', N'199.226.26.7', NULL, N'[{"code":176},{"code":836},{"code":346},{"code":501},{"code":176}]', 3)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (98, N'Barbabra Retchless', N'bretchless2p', N'WraGihh', N'86.66.23.203', CAST(N'2019-09-11' AS Date), N'[{"code":229},{"code":415},{"code":258},{"code":619}]', 2)
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (99, N'Robinetta Jerzak', N'rjerzak2q', N'hAp8jki', N'205.158.144.210', CAST(N'2019-11-12' AS Date), N'[{"code":659}]', 2)
GO
INSERT [dbo].[users] ([id], [name], [login], [password], [ip], [lastenter], [services], [type]) VALUES (100, N'Vance Boots', N'vboots2r', N'bgJfSDEVEQm6', N'91.73.40.29', CAST(N'2020-07-09' AS Date), N'[{"code":548},{"code":346},{"code":311}]', 2)
SET IDENTITY_INSERT [dbo].[users] OFF
GO
SET IDENTITY_INSERT [dbo].[Данные анализатора] ON 

INSERT [dbo].[Данные анализатора] ([id], [Название]) VALUES (1, N'1')
SET IDENTITY_INSERT [dbo].[Данные анализатора] OFF
GO
SET IDENTITY_INSERT [dbo].[ДанныеСтраховыхКомпаний] ON 

INSERT [dbo].[ДанныеСтраховыхКомпаний] ([id], [insurance_name], [country], [insurance_address], [insurance_inn], [ipadress], [insurance_p/c], [insurance_bik]) VALUES (1, N'1', N'1', N'1', 1, N'1', 1, 1)
SET IDENTITY_INSERT [dbo].[ДанныеСтраховыхКомпаний] OFF
GO
SET IDENTITY_INSERT [dbo].[Заказ] ON 

INSERT [dbo].[Заказ] ([id], [patient], [barcode], [date], [accepted], [status], [finished], [service]) VALUES (5, 3, NULL, CAST(N'2001-01-01T00:00:00.000' AS DateTime), 1, N'1', CAST(N'2001-01-01T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Заказ] ([id], [patient], [barcode], [date], [accepted], [status], [finished], [service]) VALUES (6, NULL, 0x313233, CAST(N'2024-05-07T18:02:54.123' AS DateTime), 0, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Заказ] OFF
GO
SET IDENTITY_INSERT [dbo].[ОказаниеУслуг] ON 

INSERT [dbo].[ОказаниеУслуг] ([id], [service], [result], [analyzer], [user]) VALUES (5, 176, 1, 1, 2)
SET IDENTITY_INSERT [dbo].[ОказаниеУслуг] OFF
GO
SET IDENTITY_INSERT [dbo].[Пациент] ON 

INSERT [dbo].[Пациент] ([id], [Name], [login], [pwd], [birthdate], [passport_s], [passport_n], [phone], [email], [social_sec_number], [ein], [страховая компания], [guid]) VALUES (3, N'1', N'1', N'1', CAST(N'2001-01-01' AS Date), 1, 1, N'1', N'1', 1, N'1', 1, N'1')
SET IDENTITY_INSERT [dbo].[Пациент] OFF
GO
INSERT [dbo].[Роль] ([id_Роль], [Наименование]) VALUES (1, N'Администратор')
INSERT [dbo].[Роль] ([id_Роль], [Наименование]) VALUES (2, N'Лаборант')
INSERT [dbo].[Роль] ([id_Роль], [Наименование]) VALUES (3, N'Бухгалтер')
GO
INSERT [dbo].[Услуги_лаборатории] ([id], [Наименование], [Стоимость], [Срок выполнения], [Среднее отклонение]) VALUES (176, N'Билирубин общий', 102.8500, NULL, NULL)
INSERT [dbo].[Услуги_лаборатории] ([id], [Наименование], [Стоимость], [Срок выполнения], [Среднее отклонение]) VALUES (229, N'СПИД', 341.7800, NULL, NULL)
INSERT [dbo].[Услуги_лаборатории] ([id], [Наименование], [Стоимость], [Срок выполнения], [Среднее отклонение]) VALUES (258, N'Креатинин', 143.2200, NULL, NULL)
INSERT [dbo].[Услуги_лаборатории] ([id], [Наименование], [Стоимость], [Срок выполнения], [Среднее отклонение]) VALUES (287, N'Волчаночный антикоагулянт', 290.1100, NULL, NULL)
INSERT [dbo].[Услуги_лаборатории] ([id], [Наименование], [Стоимость], [Срок выполнения], [Среднее отклонение]) VALUES (311, N'Амилаза', 361.8800, NULL, NULL)
INSERT [dbo].[Услуги_лаборатории] ([id], [Наименование], [Стоимость], [Срок выполнения], [Среднее отклонение]) VALUES (323, N'Глюкоза', 447.6500, NULL, NULL)
INSERT [dbo].[Услуги_лаборатории] ([id], [Наименование], [Стоимость], [Срок выполнения], [Среднее отклонение]) VALUES (346, N'Общий белок', 396.0300, NULL, NULL)
INSERT [dbo].[Услуги_лаборатории] ([id], [Наименование], [Стоимость], [Срок выполнения], [Среднее отклонение]) VALUES (415, N'Кальций общий', 419.9000, NULL, NULL)
INSERT [dbo].[Услуги_лаборатории] ([id], [Наименование], [Стоимость], [Срок выполнения], [Среднее отклонение]) VALUES (501, N'Гепатит В', 176.8300, NULL, NULL)
INSERT [dbo].[Услуги_лаборатории] ([id], [Наименование], [Стоимость], [Срок выполнения], [Среднее отклонение]) VALUES (543, N'Гепатит С', 289.9900, NULL, NULL)
INSERT [dbo].[Услуги_лаборатории] ([id], [Наименование], [Стоимость], [Срок выполнения], [Среднее отклонение]) VALUES (548, N'Альбумин', 234.0900, NULL, NULL)
INSERT [dbo].[Услуги_лаборатории] ([id], [Наименование], [Стоимость], [Срок выполнения], [Среднее отклонение]) VALUES (557, N'ВИЧ', 490.7700, NULL, NULL)
INSERT [dbo].[Услуги_лаборатории] ([id], [Наименование], [Стоимость], [Срок выполнения], [Среднее отклонение]) VALUES (619, N'TSH', 262.7100, NULL, NULL)
INSERT [dbo].[Услуги_лаборатории] ([id], [Наименование], [Стоимость], [Срок выполнения], [Среднее отклонение]) VALUES (659, N'Сифилис RPR', 443.6600, NULL, NULL)
INSERT [dbo].[Услуги_лаборатории] ([id], [Наименование], [Стоимость], [Срок выполнения], [Среднее отклонение]) VALUES (797, N'АТ и АГ к ВИЧ 1/2', 370.6200, NULL, NULL)
INSERT [dbo].[Услуги_лаборатории] ([id], [Наименование], [Стоимость], [Срок выполнения], [Среднее отклонение]) VALUES (836, N'Железо', 105.3200, NULL, NULL)
INSERT [dbo].[Услуги_лаборатории] ([id], [Наименование], [Стоимость], [Срок выполнения], [Среднее отклонение]) VALUES (855, N'Ковид IgM', 209.7800, NULL, NULL)
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_users_Роль] FOREIGN KEY([type])
REFERENCES [dbo].[Роль] ([id_Роль])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_users_Роль]
GO
ALTER TABLE [dbo].[Бухгалтер]  WITH CHECK ADD  CONSTRAINT [FK_Бухгалтер_users] FOREIGN KEY([id_user])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[Бухгалтер] CHECK CONSTRAINT [FK_Бухгалтер_users]
GO
ALTER TABLE [dbo].[Бухгалтер]  WITH CHECK ADD  CONSTRAINT [FK_Бухгалтер_Выставленые счета страховой компании] FOREIGN KEY([выставленныеСчетаСтрахКомпаниями])
REFERENCES [dbo].[Выставленые счета страховой компании] ([id])
GO
ALTER TABLE [dbo].[Бухгалтер] CHECK CONSTRAINT [FK_Бухгалтер_Выставленые счета страховой компании]
GO
ALTER TABLE [dbo].[Выставленые счета страховой компании]  WITH CHECK ADD  CONSTRAINT [FK_Выставленые счета страховой компании_ДанныеСтраховыхКомпаний] FOREIGN KEY([Название страховой компании])
REFERENCES [dbo].[ДанныеСтраховыхКомпаний] ([id])
GO
ALTER TABLE [dbo].[Выставленые счета страховой компании] CHECK CONSTRAINT [FK_Выставленые счета страховой компании_ДанныеСтраховыхКомпаний]
GO
ALTER TABLE [dbo].[Данные лаборантов]  WITH CHECK ADD  CONSTRAINT [FK_Данные лаборантов_users] FOREIGN KEY([id_user])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[Данные лаборантов] CHECK CONSTRAINT [FK_Данные лаборантов_users]
GO
ALTER TABLE [dbo].[Данные лаборантов]  WITH CHECK ADD  CONSTRAINT [FK_Данные лаборантов_Услуги_лаборатории] FOREIGN KEY([НаборУслуг])
REFERENCES [dbo].[Услуги_лаборатории] ([id])
GO
ALTER TABLE [dbo].[Данные лаборантов] CHECK CONSTRAINT [FK_Данные лаборантов_Услуги_лаборатории]
GO
ALTER TABLE [dbo].[Заказ]  WITH CHECK ADD  CONSTRAINT [FK_Заказ_ОказаниеУслуг] FOREIGN KEY([service])
REFERENCES [dbo].[ОказаниеУслуг] ([id])
GO
ALTER TABLE [dbo].[Заказ] CHECK CONSTRAINT [FK_Заказ_ОказаниеУслуг]
GO
ALTER TABLE [dbo].[Заказ]  WITH CHECK ADD  CONSTRAINT [FK_Заказ_Пациент] FOREIGN KEY([patient])
REFERENCES [dbo].[Пациент] ([id])
GO
ALTER TABLE [dbo].[Заказ] CHECK CONSTRAINT [FK_Заказ_Пациент]
GO
ALTER TABLE [dbo].[ОказаниеУслуг]  WITH CHECK ADD  CONSTRAINT [FK_ОказаниеУслуг_Данные анализатора] FOREIGN KEY([analyzer])
REFERENCES [dbo].[Данные анализатора] ([id])
GO
ALTER TABLE [dbo].[ОказаниеУслуг] CHECK CONSTRAINT [FK_ОказаниеУслуг_Данные анализатора]
GO
ALTER TABLE [dbo].[ОказаниеУслуг]  WITH CHECK ADD  CONSTRAINT [FK_ОказаниеУслуг_Услуги_лаборатории] FOREIGN KEY([service])
REFERENCES [dbo].[Услуги_лаборатории] ([id])
GO
ALTER TABLE [dbo].[ОказаниеУслуг] CHECK CONSTRAINT [FK_ОказаниеУслуг_Услуги_лаборатории]
GO
ALTER TABLE [dbo].[Пациент]  WITH CHECK ADD  CONSTRAINT [FK_Пациент_ДанныеСтраховыхКомпаний] FOREIGN KEY([страховая компания])
REFERENCES [dbo].[ДанныеСтраховыхКомпаний] ([id])
GO
ALTER TABLE [dbo].[Пациент] CHECK CONSTRAINT [FK_Пациент_ДанныеСтраховыхКомпаний]
GO
USE [master]
GO
ALTER DATABASE [Labarator20] SET  READ_WRITE 
GO
