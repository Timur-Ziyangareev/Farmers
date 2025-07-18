USE [master]
GO
/****** Object:  Database [FarmerZ]    Script Date: 04.07.2025 2:55:15 ******/
CREATE DATABASE [FarmerZ]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FarmerZ', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\DATA\FarmerZ.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FarmerZ_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\DATA\FarmerZ_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [FarmerZ] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FarmerZ].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FarmerZ] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FarmerZ] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FarmerZ] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FarmerZ] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FarmerZ] SET ARITHABORT OFF 
GO
ALTER DATABASE [FarmerZ] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FarmerZ] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FarmerZ] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FarmerZ] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FarmerZ] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FarmerZ] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FarmerZ] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FarmerZ] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FarmerZ] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FarmerZ] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FarmerZ] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FarmerZ] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FarmerZ] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FarmerZ] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FarmerZ] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FarmerZ] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FarmerZ] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FarmerZ] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FarmerZ] SET  MULTI_USER 
GO
ALTER DATABASE [FarmerZ] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FarmerZ] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FarmerZ] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FarmerZ] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FarmerZ] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FarmerZ] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [FarmerZ] SET QUERY_STORE = ON
GO
ALTER DATABASE [FarmerZ] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [FarmerZ]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 04.07.2025 2:55:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AgroActions]    Script Date: 04.07.2025 2:55:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgroActions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FieldId] [int] NOT NULL,
	[ActionTypeId] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[VolumeUsed] [float] NULL,
	[Result] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AgroActionTypes]    Script Date: 04.07.2025 2:55:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgroActionTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CropTypes]    Script Date: 04.07.2025 2:55:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CropTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fields]    Script Date: 04.07.2025 2:55:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fields](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Area] [float] NOT NULL,
	[Location] [nvarchar](255) NULL,
	[CropTypeId] [int] NOT NULL,
	[OwnerId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Harvests]    Script Date: 04.07.2025 2:55:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Harvests](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FieldId] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Volume] [float] NOT NULL,
	[Quality] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Messages]    Script Date: 04.07.2025 2:55:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FromUserId] [int] NOT NULL,
	[ToUserId] [int] NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
	[Timestamp] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 04.07.2025 2:55:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Seasons]    Script Date: 04.07.2025 2:55:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seasons](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Year] [int] NOT NULL,
	[UserId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 04.07.2025 2:55:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
	[RoleId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AgroActions] ON 

INSERT [dbo].[AgroActions] ([Id], [FieldId], [ActionTypeId], [Date], [VolumeUsed], [Result]) VALUES (1, 1, 1, CAST(N'2025-03-20' AS Date), 150, N'Успешно')
INSERT [dbo].[AgroActions] ([Id], [FieldId], [ActionTypeId], [Date], [VolumeUsed], [Result]) VALUES (2, 2, 2, CAST(N'2025-04-05' AS Date), 200, N'Увлажнение завершено')
INSERT [dbo].[AgroActions] ([Id], [FieldId], [ActionTypeId], [Date], [VolumeUsed], [Result]) VALUES (3, 3, 3, CAST(N'2025-04-12' AS Date), 50, N'Удобрено азотом')
INSERT [dbo].[AgroActions] ([Id], [FieldId], [ActionTypeId], [Date], [VolumeUsed], [Result]) VALUES (4, 4, 4, CAST(N'2025-05-01' AS Date), 30, N'Обработано инсектицидом')
INSERT [dbo].[AgroActions] ([Id], [FieldId], [ActionTypeId], [Date], [VolumeUsed], [Result]) VALUES (5, 5, 5, CAST(N'2025-05-10' AS Date), NULL, N'Ручная прополка')
INSERT [dbo].[AgroActions] ([Id], [FieldId], [ActionTypeId], [Date], [VolumeUsed], [Result]) VALUES (6, 6, 6, CAST(N'2025-06-01' AS Date), 70, N'Вспашка выполнена')
INSERT [dbo].[AgroActions] ([Id], [FieldId], [ActionTypeId], [Date], [VolumeUsed], [Result]) VALUES (7, 7, 7, CAST(N'2025-06-15' AS Date), 90, N'Опрыскано фунгицидом')
SET IDENTITY_INSERT [dbo].[AgroActions] OFF
GO
SET IDENTITY_INSERT [dbo].[AgroActionTypes] ON 

INSERT [dbo].[AgroActionTypes] ([Id], [Name]) VALUES (6, N'Культивация')
INSERT [dbo].[AgroActionTypes] ([Id], [Name]) VALUES (4, N'Обработка от вредителей')
INSERT [dbo].[AgroActionTypes] ([Id], [Name]) VALUES (7, N'Опрыскивание')
INSERT [dbo].[AgroActionTypes] ([Id], [Name]) VALUES (2, N'Орошение')
INSERT [dbo].[AgroActionTypes] ([Id], [Name]) VALUES (1, N'Посев')
INSERT [dbo].[AgroActionTypes] ([Id], [Name]) VALUES (5, N'Прополка')
INSERT [dbo].[AgroActionTypes] ([Id], [Name]) VALUES (3, N'Удобрение')
SET IDENTITY_INSERT [dbo].[AgroActionTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[CropTypes] ON 

INSERT [dbo].[CropTypes] ([Id], [Name], [Description]) VALUES (1, N'Озимая пшеница', N'Сорт с высокой урожайностью')
INSERT [dbo].[CropTypes] ([Id], [Name], [Description]) VALUES (2, N'Кукуруза', N'Для зерна и силоса')
INSERT [dbo].[CropTypes] ([Id], [Name], [Description]) VALUES (3, N'Картофель', N'Столовый сорт')
INSERT [dbo].[CropTypes] ([Id], [Name], [Description]) VALUES (4, N'Ячмень', N'Пивоваренный сорт')
INSERT [dbo].[CropTypes] ([Id], [Name], [Description]) VALUES (5, N'Подсолнечник', N'Масличный')
INSERT [dbo].[CropTypes] ([Id], [Name], [Description]) VALUES (6, N'Соя', N'Высокобелковая')
INSERT [dbo].[CropTypes] ([Id], [Name], [Description]) VALUES (7, N'Гречиха', N'Засухоустойчивая')
SET IDENTITY_INSERT [dbo].[CropTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[Fields] ON 

INSERT [dbo].[Fields] ([Id], [Name], [Area], [Location], [CropTypeId], [OwnerId]) VALUES (1, N'Южное поле', 12.5, N'Бавлы', 1, 1)
INSERT [dbo].[Fields] ([Id], [Name], [Area], [Location], [CropTypeId], [OwnerId]) VALUES (2, N'Северное поле', 8.2, N'Лениногорск', 2, 2)
INSERT [dbo].[Fields] ([Id], [Name], [Area], [Location], [CropTypeId], [OwnerId]) VALUES (3, N'Центральный участок', 6, N'Чистополь', 3, 4)
INSERT [dbo].[Fields] ([Id], [Name], [Area], [Location], [CropTypeId], [OwnerId]) VALUES (4, N'Заречный луг', 10.1, NULL, 4, 5)
INSERT [dbo].[Fields] ([Id], [Name], [Area], [Location], [CropTypeId], [OwnerId]) VALUES (5, N'Поле №5', 14.3, N'Альметьевск', 5, 1)
INSERT [dbo].[Fields] ([Id], [Name], [Area], [Location], [CropTypeId], [OwnerId]) VALUES (6, N'Дальний участок', 9.7, N'Елабуга', 6, 2)
INSERT [dbo].[Fields] ([Id], [Name], [Area], [Location], [CropTypeId], [OwnerId]) VALUES (7, N'Лесное поле', 7.4, NULL, 7, 1)
SET IDENTITY_INSERT [dbo].[Fields] OFF
GO
SET IDENTITY_INSERT [dbo].[Harvests] ON 

INSERT [dbo].[Harvests] ([Id], [FieldId], [Date], [Volume], [Quality]) VALUES (1, 1, CAST(N'2025-08-01' AS Date), 20.5, N'Отличное')
INSERT [dbo].[Harvests] ([Id], [FieldId], [Date], [Volume], [Quality]) VALUES (2, 2, CAST(N'2025-08-03' AS Date), 18.2, N'Хорошее')
INSERT [dbo].[Harvests] ([Id], [FieldId], [Date], [Volume], [Quality]) VALUES (3, 3, CAST(N'2025-08-05' AS Date), 10.7, N'Среднее')
INSERT [dbo].[Harvests] ([Id], [FieldId], [Date], [Volume], [Quality]) VALUES (4, 4, CAST(N'2025-08-07' AS Date), 12.3, N'Отличное')
INSERT [dbo].[Harvests] ([Id], [FieldId], [Date], [Volume], [Quality]) VALUES (5, 5, CAST(N'2025-08-10' AS Date), 25.6, N'Хорошее')
INSERT [dbo].[Harvests] ([Id], [FieldId], [Date], [Volume], [Quality]) VALUES (6, 6, CAST(N'2025-08-15' AS Date), 17.8, N'Хорошее')
INSERT [dbo].[Harvests] ([Id], [FieldId], [Date], [Volume], [Quality]) VALUES (7, 7, CAST(N'2025-08-20' AS Date), 14.4, N'Среднее')
SET IDENTITY_INSERT [dbo].[Harvests] OFF
GO
SET IDENTITY_INSERT [dbo].[Messages] ON 

INSERT [dbo].[Messages] ([Id], [FromUserId], [ToUserId], [Text], [Timestamp]) VALUES (1, 1, 3, N'Здравствуйте, нужна помощь с вредителями.', CAST(N'2025-07-03T22:45:54.017' AS DateTime))
INSERT [dbo].[Messages] ([Id], [FromUserId], [ToUserId], [Text], [Timestamp]) VALUES (2, 2, 3, N'Когда лучше сеять кукурузу?', CAST(N'2025-07-03T22:45:54.017' AS DateTime))
INSERT [dbo].[Messages] ([Id], [FromUserId], [ToUserId], [Text], [Timestamp]) VALUES (3, 4, 3, N'Подскажите, чем подкормить картофель?', CAST(N'2025-07-03T22:45:54.017' AS DateTime))
INSERT [dbo].[Messages] ([Id], [FromUserId], [ToUserId], [Text], [Timestamp]) VALUES (4, 5, 3, N'Есть ли данные по обработке почвы?', CAST(N'2025-07-03T22:45:54.017' AS DateTime))
INSERT [dbo].[Messages] ([Id], [FromUserId], [ToUserId], [Text], [Timestamp]) VALUES (5, 1, 3, N'Можно ли повторно обрабатывать фунгицидом?', CAST(N'2025-07-03T22:45:54.017' AS DateTime))
INSERT [dbo].[Messages] ([Id], [FromUserId], [ToUserId], [Text], [Timestamp]) VALUES (6, 6, 3, N'Как улучшить качество урожая?', CAST(N'2025-07-03T22:45:54.017' AS DateTime))
INSERT [dbo].[Messages] ([Id], [FromUserId], [ToUserId], [Text], [Timestamp]) VALUES (7, 2, 3, N'Как бороться с болезнями сои?', CAST(N'2025-07-03T22:45:54.017' AS DateTime))
SET IDENTITY_INSERT [dbo].[Messages] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Id], [Name]) VALUES (3, N'Admin')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (2, N'Agronomist')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (1, N'Farmer')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Seasons] ON 

INSERT [dbo].[Seasons] ([Id], [Year], [UserId]) VALUES (1, 2023, 1)
INSERT [dbo].[Seasons] ([Id], [Year], [UserId]) VALUES (2, 2024, 1)
INSERT [dbo].[Seasons] ([Id], [Year], [UserId]) VALUES (3, 2025, 1)
INSERT [dbo].[Seasons] ([Id], [Year], [UserId]) VALUES (4, 2025, 2)
INSERT [dbo].[Seasons] ([Id], [Year], [UserId]) VALUES (5, 2024, 4)
INSERT [dbo].[Seasons] ([Id], [Year], [UserId]) VALUES (6, 2023, 5)
INSERT [dbo].[Seasons] ([Id], [Year], [UserId]) VALUES (7, 2025, 6)
SET IDENTITY_INSERT [dbo].[Seasons] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Name], [Email], [Password], [RoleId]) VALUES (1, N'Иван Иванов', N'ivanov@farmz.local', N'hash1', 1)
INSERT [dbo].[Users] ([Id], [Name], [Email], [Password], [RoleId]) VALUES (2, N'Пётр Петров', N'petrov@farmz.local', N'hash2', 1)
INSERT [dbo].[Users] ([Id], [Name], [Email], [Password], [RoleId]) VALUES (3, N'Агния Агро', N'agronom@farmz.local', N'hash3', 2)
INSERT [dbo].[Users] ([Id], [Name], [Email], [Password], [RoleId]) VALUES (4, N'Мария Мельникова', N'maria@farmz.local', N'hash4', 1)
INSERT [dbo].[Users] ([Id], [Name], [Email], [Password], [RoleId]) VALUES (5, N'Семен Сидоров', N'sid@farmz.local', N'hash5', 1)
INSERT [dbo].[Users] ([Id], [Name], [Email], [Password], [RoleId]) VALUES (6, N'Олег Огородов', N'ogorod@farmz.local', N'hash6', 1)
INSERT [dbo].[Users] ([Id], [Name], [Email], [Password], [RoleId]) VALUES (7, N'Админ Админов', N'admin@farmz.local', N'hash7', 3)
INSERT [dbo].[Users] ([Id], [Name], [Email], [Password], [RoleId]) VALUES (8, N'Тимур', N'timurgang123@gmail.com', N'123456', 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__AgroActi__737584F681DF53AD]    Script Date: 04.07.2025 2:55:15 ******/
ALTER TABLE [dbo].[AgroActionTypes] ADD UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Roles__737584F698FD0665]    Script Date: 04.07.2025 2:55:15 ******/
ALTER TABLE [dbo].[Roles] ADD UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__A9D105349658E121]    Script Date: 04.07.2025 2:55:15 ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Messages] ADD  DEFAULT (getdate()) FOR [Timestamp]
GO
ALTER TABLE [dbo].[AgroActions]  WITH CHECK ADD FOREIGN KEY([ActionTypeId])
REFERENCES [dbo].[AgroActionTypes] ([Id])
GO
ALTER TABLE [dbo].[AgroActions]  WITH CHECK ADD FOREIGN KEY([FieldId])
REFERENCES [dbo].[Fields] ([Id])
GO
ALTER TABLE [dbo].[Fields]  WITH CHECK ADD FOREIGN KEY([CropTypeId])
REFERENCES [dbo].[CropTypes] ([Id])
GO
ALTER TABLE [dbo].[Fields]  WITH CHECK ADD FOREIGN KEY([OwnerId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Harvests]  WITH CHECK ADD FOREIGN KEY([FieldId])
REFERENCES [dbo].[Fields] ([Id])
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD FOREIGN KEY([FromUserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD FOREIGN KEY([ToUserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Seasons]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[Fields]  WITH CHECK ADD CHECK  (([Area]>(0)))
GO
ALTER TABLE [dbo].[Harvests]  WITH CHECK ADD CHECK  (([Volume]>(0)))
GO
ALTER TABLE [dbo].[Seasons]  WITH CHECK ADD CHECK  (([Year]>=(2000) AND [Year]<=(2100)))
GO
USE [master]
GO
ALTER DATABASE [FarmerZ] SET  READ_WRITE 
GO
