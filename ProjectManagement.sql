USE [master]
GO
/****** Object:  Database [ProjectManagement]    Script Date: 23-Feb-24 4:18:38 PM ******/
CREATE DATABASE [ProjectManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProjectManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.QUANNGO\MSSQL\DATA\ProjectManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ProjectManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.QUANNGO\MSSQL\DATA\ProjectManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ProjectManagement] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProjectManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProjectManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProjectManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProjectManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProjectManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProjectManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProjectManagement] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ProjectManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProjectManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProjectManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProjectManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProjectManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProjectManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProjectManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProjectManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProjectManagement] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ProjectManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProjectManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProjectManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProjectManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProjectManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProjectManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProjectManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProjectManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ProjectManagement] SET  MULTI_USER 
GO
ALTER DATABASE [ProjectManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProjectManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProjectManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProjectManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProjectManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ProjectManagement] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ProjectManagement] SET QUERY_STORE = OFF
GO
USE [ProjectManagement]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 23-Feb-24 4:18:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Visa] [nvarchar](3) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Birthday] [datetime2](7) NOT NULL,
	[Version] [int] NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Groups]    Script Date: 23-Feb-24 4:18:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groups](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GroupLeaderId] [int] NOT NULL,
	[Version] [int] NOT NULL,
 CONSTRAINT [PK_Groups] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProjectEmployees]    Script Date: 23-Feb-24 4:18:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectEmployees](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProjectId] [int] NOT NULL,
	[EmployeeId] [int] NOT NULL,
 CONSTRAINT [PK_ProjectEmployees_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Projects]    Script Date: 23-Feb-24 4:18:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Projects](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GroupId] [int] NOT NULL,
	[Number] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Customer] [varchar](50) NOT NULL,
	[Status] [nvarchar](3) NOT NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[EndDate] [datetime2](7) NULL,
	[Version] [int] NOT NULL,
 CONSTRAINT [PK_Projects] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 23-Feb-24 4:18:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Address] [varchar](255) NULL,
	[Phone] [varchar](10) NULL,
	[Role] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([Id], [Visa], [FirstName], [LastName], [Birthday], [Version]) VALUES (1, N'Vin', N'Quan', N'Ngo', CAST(N'2002-01-01T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Employee] ([Id], [Visa], [FirstName], [LastName], [Birthday], [Version]) VALUES (2, N'Von', N'Dang ', N'Nguyen', CAST(N'1997-01-01T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Employee] ([Id], [Visa], [FirstName], [LastName], [Birthday], [Version]) VALUES (5, N'Ven', N'Minh ', N'Phuc', CAST(N'2024-01-29T00:00:00.0000000' AS DateTime2), 0)
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[Groups] ON 

INSERT [dbo].[Groups] ([Id], [GroupLeaderId], [Version]) VALUES (1, 1, 1)
INSERT [dbo].[Groups] ([Id], [GroupLeaderId], [Version]) VALUES (2, 2, 0)
INSERT [dbo].[Groups] ([Id], [GroupLeaderId], [Version]) VALUES (4, 5, 0)
SET IDENTITY_INSERT [dbo].[Groups] OFF
GO
SET IDENTITY_INSERT [dbo].[ProjectEmployees] ON 

INSERT [dbo].[ProjectEmployees] ([Id], [ProjectId], [EmployeeId]) VALUES (1, 8, 1)
SET IDENTITY_INSERT [dbo].[ProjectEmployees] OFF
GO
SET IDENTITY_INSERT [dbo].[Projects] ON 

INSERT [dbo].[Projects] ([Id], [GroupId], [Number], [Name], [Customer], [Status], [StartDate], [EndDate], [Version]) VALUES (8, 1, 1, N'Nam', N'string', N'str', CAST(N'2023-12-12T14:43:06.0740000' AS DateTime2), CAST(N'2023-12-12T14:43:06.0740000' AS DateTime2), 1)
INSERT [dbo].[Projects] ([Id], [GroupId], [Number], [Name], [Customer], [Status], [StartDate], [EndDate], [Version]) VALUES (19, 1, 0, N'The Golden Hill', N'An', N'INP', CAST(N'2023-11-26T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-23T00:00:00.0000000' AS DateTime2), 3)
INSERT [dbo].[Projects] ([Id], [GroupId], [Number], [Name], [Customer], [Status], [StartDate], [EndDate], [Version]) VALUES (20, 1, 10, N'The Useful', N'Nhat Quan', N'PLA', CAST(N'2023-12-01T00:00:00.0000000' AS DateTime2), CAST(N'2023-12-12T00:00:00.0000000' AS DateTime2), 26)
INSERT [dbo].[Projects] ([Id], [GroupId], [Number], [Name], [Customer], [Status], [StartDate], [EndDate], [Version]) VALUES (21, 1, 11, N'Bean', N'Lam Minh Phuc', N'NEW', CAST(N'2023-12-12T00:00:00.0000000' AS DateTime2), CAST(N'2023-12-12T00:00:00.0000000' AS DateTime2), 1)
SET IDENTITY_INSERT [dbo].[Projects] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Email], [Password], [Address], [Phone], [Role]) VALUES (1, N'admin@gmail.com', N'1', N'Sai Gon', N'0123456789', N'Admin')
INSERT [dbo].[Users] ([Id], [Email], [Password], [Address], [Phone], [Role]) VALUES (2, N'staff@gmail.com', N'1', N'Ha Noi', N'0123456789', N'Staff')
INSERT [dbo].[Users] ([Id], [Email], [Password], [Address], [Phone], [Role]) VALUES (3, N'user@gmail.com', N'1', N'Binh Duong', N'0123456789', N'User')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
/****** Object:  Index [IX_Groups_GroupLeaderId]    Script Date: 23-Feb-24 4:18:38 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Groups_GroupLeaderId] ON [dbo].[Groups]
(
	[GroupLeaderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProjectEmployees_EmployeeId]    Script Date: 23-Feb-24 4:18:38 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProjectEmployees_EmployeeId] ON [dbo].[ProjectEmployees]
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Projects_GroupId]    Script Date: 23-Feb-24 4:18:38 PM ******/
CREATE NONCLUSTERED INDEX [IX_Projects_GroupId] ON [dbo].[Projects]
(
	[GroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Projects_Number]    Script Date: 23-Feb-24 4:18:38 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Projects_Number] ON [dbo].[Projects]
(
	[Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD  CONSTRAINT [FK_Groups_Employee_GroupLeaderId] FOREIGN KEY([GroupLeaderId])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[Groups] CHECK CONSTRAINT [FK_Groups_Employee_GroupLeaderId]
GO
ALTER TABLE [dbo].[ProjectEmployees]  WITH CHECK ADD  CONSTRAINT [FK_ProjectEmployees_Employee_EmployeeId] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[ProjectEmployees] CHECK CONSTRAINT [FK_ProjectEmployees_Employee_EmployeeId]
GO
ALTER TABLE [dbo].[ProjectEmployees]  WITH CHECK ADD  CONSTRAINT [FK_ProjectEmployees_Projects_ProjectId] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Projects] ([Id])
GO
ALTER TABLE [dbo].[ProjectEmployees] CHECK CONSTRAINT [FK_ProjectEmployees_Projects_ProjectId]
GO
ALTER TABLE [dbo].[Projects]  WITH CHECK ADD  CONSTRAINT [FK_Projects_Groups_GroupId] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Groups] ([Id])
GO
ALTER TABLE [dbo].[Projects] CHECK CONSTRAINT [FK_Projects_Groups_GroupId]
GO
USE [master]
GO
ALTER DATABASE [ProjectManagement] SET  READ_WRITE 
GO
