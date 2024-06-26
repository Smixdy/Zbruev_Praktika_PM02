USE [master]
GO
/****** Object:  Database [Аптека]    Script Date: 14.05.2024 17:07:20 ******/
CREATE DATABASE [Аптека]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Аптека', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Аптека.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Аптека_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Аптека_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Аптека] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Аптека].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Аптека] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Аптека] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Аптека] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Аптека] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Аптека] SET ARITHABORT OFF 
GO
ALTER DATABASE [Аптека] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Аптека] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Аптека] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Аптека] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Аптека] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Аптека] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Аптека] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Аптека] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Аптека] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Аптека] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Аптека] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Аптека] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Аптека] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Аптека] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Аптека] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Аптека] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Аптека] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Аптека] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Аптека] SET  MULTI_USER 
GO
ALTER DATABASE [Аптека] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Аптека] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Аптека] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Аптека] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Аптека] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Аптека]
GO
/****** Object:  Table [dbo].[График_работы]    Script Date: 14.05.2024 17:07:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[График_работы](
	[ID_Графика] [int] NOT NULL,
	[День_недели] [nvarchar](50) NULL,
	[Время_начало] [time](7) NULL,
	[Время_окончания] [time](7) NULL,
	[ID_Кабинета] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Графика] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Договоры_на_услуги]    Script Date: 14.05.2024 17:07:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Договоры_на_услуги](
	[ID_Договора] [int] NOT NULL,
	[ID_Клиента] [int] NULL,
	[ID_Специалиста] [int] NULL,
	[Дата_заключения] [date] NULL,
	[Сумма_договора] [decimal](10, 2) NULL,
	[ID_Типа_оплаты] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Договора] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Заказ_на_поставку]    Script Date: 14.05.2024 17:07:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Заказ_на_поставку](
	[ID_Заказа] [int] NOT NULL,
	[Дата_заказа] [date] NULL,
	[Дата_отгрузки] [date] NULL,
	[ID_Поставщика] [int] NULL,
	[ID_Препарата] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Заказа] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[История_покупок]    Script Date: 14.05.2024 17:07:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[История_покупок](
	[ID_Покупки] [int] NOT NULL,
	[ID_Клиента] [int] NULL,
	[Дата_покупки] [date] NULL,
	[ID_Препарата] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Покупки] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Кабинет]    Script Date: 14.05.2024 17:07:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Кабинет](
	[ID_Кабинета] [int] NOT NULL,
	[Номер_кабинета] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Кабинета] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Категория_материала]    Script Date: 14.05.2024 17:07:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Категория_материала](
	[ID_Категории_материала] [int] NOT NULL,
	[Название] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Категории_материала] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Категория_оборудования]    Script Date: 14.05.2024 17:07:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Категория_оборудования](
	[ID_Категории_оборудования] [int] NOT NULL,
	[Название] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Категории_оборудования] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Клиент]    Script Date: 14.05.2024 17:07:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Клиент](
	[ID_Клиента] [int] NOT NULL,
	[Фамилия] [nvarchar](50) NULL,
	[Имя] [nvarchar](50) NULL,
	[Отчество] [nvarchar](50) NULL,
	[Телефон] [char](15) NULL,
	[Email] [nvarchar](50) NULL,
	[Размер_скидки] [char](3) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Клиента] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Контактное_лицо]    Script Date: 14.05.2024 17:07:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Контактное_лицо](
	[ID_Контактного_лица] [int] NOT NULL,
	[Фамилия] [nvarchar](50) NULL,
	[Имя] [nvarchar](50) NULL,
	[Отчество] [nvarchar](50) NULL,
	[Должность] [nvarchar](50) NULL,
	[Телефон] [char](15) NULL,
	[Email] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Контактного_лица] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Материал]    Script Date: 14.05.2024 17:07:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Материал](
	[ID_Материала] [int] NOT NULL,
	[Наименование] [nvarchar](50) NULL,
	[Категория] [int] NULL,
	[Максимальный_срок_хранения] [date] NULL,
	[Минимальный_остаток_на_складе] [int] NULL,
	[ID_Склада] [int] NULL,
	[Стеллаж] [char](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Материала] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Оборудование]    Script Date: 14.05.2024 17:07:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Оборудование](
	[ID_Оборудования] [int] NOT NULL,
	[Наименование] [nvarchar](50) NULL,
	[Категория] [int] NULL,
	[ID_Склада] [int] NULL,
	[Стеллаж] [char](10) NULL,
	[ID_Специалиста] [int] NULL,
	[ID_Кабинета] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Оборудования] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Поставщик]    Script Date: 14.05.2024 17:07:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Поставщик](
	[ID_Поставщика] [int] NOT NULL,
	[Юридическое_название] [nvarchar](50) NULL,
	[Юридический_адрес] [nvarchar](100) NULL,
	[ИНН] [int] NULL,
	[Номер_договора] [int] NULL,
	[Код_ОКПО] [int] NULL,
	[Телефон] [char](15) NULL,
	[ID_Контактного_лица] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Поставщика] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Препарат]    Script Date: 14.05.2024 17:07:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Препарат](
	[ID_Препарата] [int] NOT NULL,
	[Название] [nvarchar](50) NULL,
	[Количество_на_складе] [int] NULL,
	[Номер_партии] [int] NULL,
	[Цена] [decimal](10, 2) NULL,
	[Процент_социальной_скидки] [char](3) NULL,
	[ID_Поставщика] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Препарата] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Склад]    Script Date: 14.05.2024 17:07:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Склад](
	[ID_Склада] [int] NOT NULL,
	[Адрес] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Склада] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Сотрудник]    Script Date: 14.05.2024 17:07:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Сотрудник](
	[ID_Сотрудника] [int] NOT NULL,
	[Фамилия] [nvarchar](50) NULL,
	[Имя] [nvarchar](50) NULL,
	[Отчество] [nvarchar](50) NULL,
	[Адрес] [nvarchar](50) NULL,
	[Телефон] [char](15) NULL,
	[Email] [nvarchar](50) NULL,
	[Должность] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Сотрудника] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[СотрудникКабинет]    Script Date: 14.05.2024 17:07:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[СотрудникКабинет](
	[ID_Сотрудника] [int] NOT NULL,
	[ID_Кабинета] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Сотрудника] ASC,
	[ID_Кабинета] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Специализация]    Script Date: 14.05.2024 17:07:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Специализация](
	[ID_Специализации] [int] NOT NULL,
	[Название_специализации] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Специализации] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Специалист]    Script Date: 14.05.2024 17:07:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Специалист](
	[ID_Специалиста] [int] NOT NULL,
	[Фамилия] [nvarchar](50) NULL,
	[Имя] [nvarchar](50) NULL,
	[Отчество] [nvarchar](50) NULL,
	[ID_Специализации] [int] NULL,
	[График_работы] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Специалиста] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Статус_оплаты]    Script Date: 14.05.2024 17:07:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Статус_оплаты](
	[ID_Статуса_оплаты] [int] NOT NULL,
	[Название] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Статуса_оплаты] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Счет]    Script Date: 14.05.2024 17:07:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Счет](
	[ID_Счета] [int] NOT NULL,
	[ID_Договора] [int] NULL,
	[Дата_выставления] [date] NULL,
	[Сумма] [decimal](10, 2) NULL,
	[ID_Статуса_оплаты] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Счета] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Тип_оплаты]    Script Date: 14.05.2024 17:07:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Тип_оплаты](
	[ID_Типа_оплаты] [int] NOT NULL,
	[Название] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Типа_оплаты] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[График_работы]  WITH CHECK ADD FOREIGN KEY([ID_Кабинета])
REFERENCES [dbo].[Кабинет] ([ID_Кабинета])
GO
ALTER TABLE [dbo].[Договоры_на_услуги]  WITH CHECK ADD FOREIGN KEY([ID_Клиента])
REFERENCES [dbo].[Клиент] ([ID_Клиента])
GO
ALTER TABLE [dbo].[Договоры_на_услуги]  WITH CHECK ADD FOREIGN KEY([ID_Специалиста])
REFERENCES [dbo].[Специалист] ([ID_Специалиста])
GO
ALTER TABLE [dbo].[Договоры_на_услуги]  WITH CHECK ADD FOREIGN KEY([ID_Типа_оплаты])
REFERENCES [dbo].[Тип_оплаты] ([ID_Типа_оплаты])
GO
ALTER TABLE [dbo].[Заказ_на_поставку]  WITH CHECK ADD FOREIGN KEY([ID_Поставщика])
REFERENCES [dbo].[Поставщик] ([ID_Поставщика])
GO
ALTER TABLE [dbo].[Заказ_на_поставку]  WITH CHECK ADD FOREIGN KEY([ID_Препарата])
REFERENCES [dbo].[Препарат] ([ID_Препарата])
GO
ALTER TABLE [dbo].[История_покупок]  WITH CHECK ADD FOREIGN KEY([ID_Клиента])
REFERENCES [dbo].[Клиент] ([ID_Клиента])
GO
ALTER TABLE [dbo].[История_покупок]  WITH CHECK ADD FOREIGN KEY([ID_Препарата])
REFERENCES [dbo].[Препарат] ([ID_Препарата])
GO
ALTER TABLE [dbo].[Материал]  WITH CHECK ADD FOREIGN KEY([ID_Склада])
REFERENCES [dbo].[Склад] ([ID_Склада])
GO
ALTER TABLE [dbo].[Материал]  WITH CHECK ADD FOREIGN KEY([Категория])
REFERENCES [dbo].[Категория_материала] ([ID_Категории_материала])
GO
ALTER TABLE [dbo].[Оборудование]  WITH CHECK ADD FOREIGN KEY([ID_Кабинета])
REFERENCES [dbo].[Кабинет] ([ID_Кабинета])
GO
ALTER TABLE [dbo].[Оборудование]  WITH CHECK ADD FOREIGN KEY([ID_Склада])
REFERENCES [dbo].[Склад] ([ID_Склада])
GO
ALTER TABLE [dbo].[Оборудование]  WITH CHECK ADD FOREIGN KEY([ID_Специалиста])
REFERENCES [dbo].[Специалист] ([ID_Специалиста])
GO
ALTER TABLE [dbo].[Оборудование]  WITH CHECK ADD FOREIGN KEY([Категория])
REFERENCES [dbo].[Категория_оборудования] ([ID_Категории_оборудования])
GO
ALTER TABLE [dbo].[Поставщик]  WITH CHECK ADD FOREIGN KEY([ID_Контактного_лица])
REFERENCES [dbo].[Контактное_лицо] ([ID_Контактного_лица])
GO
ALTER TABLE [dbo].[Препарат]  WITH CHECK ADD FOREIGN KEY([ID_Поставщика])
REFERENCES [dbo].[Поставщик] ([ID_Поставщика])
GO
ALTER TABLE [dbo].[СотрудникКабинет]  WITH CHECK ADD FOREIGN KEY([ID_Кабинета])
REFERENCES [dbo].[Кабинет] ([ID_Кабинета])
GO
ALTER TABLE [dbo].[СотрудникКабинет]  WITH CHECK ADD FOREIGN KEY([ID_Сотрудника])
REFERENCES [dbo].[Сотрудник] ([ID_Сотрудника])
GO
ALTER TABLE [dbo].[Специалист]  WITH CHECK ADD FOREIGN KEY([ID_Специализации])
REFERENCES [dbo].[Специализация] ([ID_Специализации])
GO
ALTER TABLE [dbo].[Счет]  WITH CHECK ADD FOREIGN KEY([ID_Договора])
REFERENCES [dbo].[Договоры_на_услуги] ([ID_Договора])
GO
ALTER TABLE [dbo].[Счет]  WITH CHECK ADD FOREIGN KEY([ID_Статуса_оплаты])
REFERENCES [dbo].[Статус_оплаты] ([ID_Статуса_оплаты])
GO
USE [master]
GO
ALTER DATABASE [Аптека] SET  READ_WRITE 
GO
