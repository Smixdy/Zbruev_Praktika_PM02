USE [master]
GO
/****** Object:  Database [Labarator20]    Script Date: 17.05.2024 13:07:27 ******/
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
/****** Object:  Table [dbo].[users]    Script Date: 17.05.2024 13:07:27 ******/
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
/****** Object:  Table [dbo].[Бухгалтер]    Script Date: 17.05.2024 13:07:27 ******/
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
/****** Object:  Table [dbo].[Выставленые_счета_страховой_компании]    Script Date: 17.05.2024 13:07:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Выставленые_счета_страховой_компании](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Название страховой компании] [int] NULL,
	[Сумма] [money] NULL,
 CONSTRAINT [PK_Выставленые счета страховой компании] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Данные_анализатора]    Script Date: 17.05.2024 13:07:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Данные_анализатора](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Название] [nvarchar](255) NULL,
 CONSTRAINT [PK_Данные о работе анализатора] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Данные_лаборантов]    Script Date: 17.05.2024 13:07:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Данные_лаборантов](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[НаборУслуг] [int] NULL,
	[id_user] [int] NULL,
 CONSTRAINT [PK_Данные лаборантов] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Данные_страховых_компаний]    Script Date: 17.05.2024 13:07:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Данные_страховых_компаний](
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
/****** Object:  Table [dbo].[Заказ]    Script Date: 17.05.2024 13:07:27 ******/
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
/****** Object:  Table [dbo].[Оказание услуг]    Script Date: 17.05.2024 13:07:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Оказание услуг](
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
/****** Object:  Table [dbo].[Пациент]    Script Date: 17.05.2024 13:07:27 ******/
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
/****** Object:  Table [dbo].[Роль]    Script Date: 17.05.2024 13:07:27 ******/
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
/****** Object:  Table [dbo].[Услуги_лаборатории]    Script Date: 17.05.2024 13:07:27 ******/
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
REFERENCES [dbo].[Выставленые_счета_страховой_компании] ([id])
GO
ALTER TABLE [dbo].[Бухгалтер] CHECK CONSTRAINT [FK_Бухгалтер_Выставленые счета страховой компании]
GO
ALTER TABLE [dbo].[Выставленые_счета_страховой_компании]  WITH CHECK ADD  CONSTRAINT [FK_Выставленые счета страховой компании_ДанныеСтраховыхКомпаний] FOREIGN KEY([Название страховой компании])
REFERENCES [dbo].[Данные_страховых_компаний] ([id])
GO
ALTER TABLE [dbo].[Выставленые_счета_страховой_компании] CHECK CONSTRAINT [FK_Выставленые счета страховой компании_ДанныеСтраховыхКомпаний]
GO
ALTER TABLE [dbo].[Данные_лаборантов]  WITH CHECK ADD  CONSTRAINT [FK_Данные лаборантов_users] FOREIGN KEY([id_user])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[Данные_лаборантов] CHECK CONSTRAINT [FK_Данные лаборантов_users]
GO
ALTER TABLE [dbo].[Данные_лаборантов]  WITH CHECK ADD  CONSTRAINT [FK_Данные лаборантов_Услуги_лаборатории] FOREIGN KEY([НаборУслуг])
REFERENCES [dbo].[Услуги_лаборатории] ([id])
GO
ALTER TABLE [dbo].[Данные_лаборантов] CHECK CONSTRAINT [FK_Данные лаборантов_Услуги_лаборатории]
GO
ALTER TABLE [dbo].[Заказ]  WITH CHECK ADD  CONSTRAINT [FK_Заказ_ОказаниеУслуг] FOREIGN KEY([service])
REFERENCES [dbo].[Оказание услуг] ([id])
GO
ALTER TABLE [dbo].[Заказ] CHECK CONSTRAINT [FK_Заказ_ОказаниеУслуг]
GO
ALTER TABLE [dbo].[Заказ]  WITH CHECK ADD  CONSTRAINT [FK_Заказ_Пациент] FOREIGN KEY([patient])
REFERENCES [dbo].[Пациент] ([id])
GO
ALTER TABLE [dbo].[Заказ] CHECK CONSTRAINT [FK_Заказ_Пациент]
GO
ALTER TABLE [dbo].[Оказание услуг]  WITH CHECK ADD  CONSTRAINT [FK_ОказаниеУслуг_Данные анализатора] FOREIGN KEY([analyzer])
REFERENCES [dbo].[Данные_анализатора] ([id])
GO
ALTER TABLE [dbo].[Оказание услуг] CHECK CONSTRAINT [FK_ОказаниеУслуг_Данные анализатора]
GO
ALTER TABLE [dbo].[Оказание услуг]  WITH CHECK ADD  CONSTRAINT [FK_ОказаниеУслуг_Услуги_лаборатории] FOREIGN KEY([service])
REFERENCES [dbo].[Услуги_лаборатории] ([id])
GO
ALTER TABLE [dbo].[Оказание услуг] CHECK CONSTRAINT [FK_ОказаниеУслуг_Услуги_лаборатории]
GO
ALTER TABLE [dbo].[Пациент]  WITH CHECK ADD  CONSTRAINT [FK_Пациент_ДанныеСтраховыхКомпаний] FOREIGN KEY([страховая компания])
REFERENCES [dbo].[Данные_страховых_компаний] ([id])
GO
ALTER TABLE [dbo].[Пациент] CHECK CONSTRAINT [FK_Пациент_ДанныеСтраховыхКомпаний]
GO
USE [master]
GO
ALTER DATABASE [Labarator20] SET  READ_WRITE 
GO
