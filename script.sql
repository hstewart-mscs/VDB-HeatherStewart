USE [master]
GO
/****** Object:  Database [AnimalAdoptions]    Script Date: 9/24/2023 7:34:49 PM ******/
CREATE DATABASE [AnimalAdoptions]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AnimalAdoptions', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AnimalAdoptions.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AnimalAdoptions_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AnimalAdoptions_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [AnimalAdoptions] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AnimalAdoptions].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AnimalAdoptions] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AnimalAdoptions] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AnimalAdoptions] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AnimalAdoptions] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AnimalAdoptions] SET ARITHABORT OFF 
GO
ALTER DATABASE [AnimalAdoptions] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AnimalAdoptions] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AnimalAdoptions] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AnimalAdoptions] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AnimalAdoptions] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AnimalAdoptions] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AnimalAdoptions] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AnimalAdoptions] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AnimalAdoptions] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AnimalAdoptions] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AnimalAdoptions] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AnimalAdoptions] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AnimalAdoptions] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AnimalAdoptions] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AnimalAdoptions] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AnimalAdoptions] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AnimalAdoptions] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AnimalAdoptions] SET RECOVERY FULL 
GO
ALTER DATABASE [AnimalAdoptions] SET  MULTI_USER 
GO
ALTER DATABASE [AnimalAdoptions] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AnimalAdoptions] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AnimalAdoptions] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AnimalAdoptions] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AnimalAdoptions] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AnimalAdoptions] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'AnimalAdoptions', N'ON'
GO
ALTER DATABASE [AnimalAdoptions] SET QUERY_STORE = OFF
GO
USE [AnimalAdoptions]
GO
/****** Object:  Table [dbo].[Adopter]    Script Date: 9/24/2023 7:34:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Adopter](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[First_Name] [varchar](50) NULL,
	[Last_Name] [varchar](50) NULL,
	[Address] [varchar](50) NULL,
	[Phone] [char](10) NULL,
	[Age] [int] NOT NULL,
	[Email] [varchar](50) NULL,
	[House_Type] [varchar](10) NOT NULL,
	[Current_Pets] [varchar](50) NOT NULL,
	[Fenced_Yard] [varchar](5) NOT NULL,
	[Animal_ID] [int] NOT NULL,
 CONSTRAINT [PK_Adopter] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Adoption_Organization]    Script Date: 9/24/2023 7:34:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Adoption_Organization](
	[Associate_ID] [int] IDENTITY(1,1) NOT NULL,
	[First_Name] [nchar](10) NOT NULL,
	[Last_Name] [nchar](10) NOT NULL,
	[Position] [nchar](10) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Animal]    Script Date: 9/24/2023 7:34:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Animal](
	[Animal_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Species] [varchar](50) NULL,
	[Breed] [varchar](50) NULL,
	[Gender] [varchar](10) NOT NULL,
	[Age] [int] NOT NULL,
	[Sterile_ID] [int] NOT NULL,
	[Adoption_Status] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Animal] PRIMARY KEY CLUSTERED 
(
	[Animal_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Interview_Progress]    Script Date: 9/24/2023 7:34:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Interview_Progress](
	[Interview_ID] [int] IDENTITY(1,1) NOT NULL,
	[Adopter_ID] [int] NOT NULL,
	[Animal_ID] [int] NOT NULL,
	[Status] [varchar](50) NOT NULL,
	[Adopted] [varchar](50) NOT NULL,
	[Associate_ID] [int] NOT NULL,
 CONSTRAINT [PK_Interview_Progress] PRIMARY KEY CLUSTERED 
(
	[Interview_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sterilization]    Script Date: 9/24/2023 7:34:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sterilization](
	[Sterile_ID] [int] IDENTITY(1,1) NOT NULL,
	[Animal_ID] [int] NOT NULL,
	[Status] [varchar](50) NOT NULL,
	[Date] [date] NULL,
 CONSTRAINT [PK_Sterilization] PRIMARY KEY CLUSTERED 
(
	[Sterile_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Adopter] ON 

INSERT [dbo].[Adopter] ([ID], [First_Name], [Last_Name], [Address], [Phone], [Age], [Email], [House_Type], [Current_Pets], [Fenced_Yard], [Animal_ID]) VALUES (1, N'Roxy', N'Rose', N'123 Main St', N'4175552325', 25, NULL, N'Condo', N'0', N'Yes', 3)
INSERT [dbo].[Adopter] ([ID], [First_Name], [Last_Name], [Address], [Phone], [Age], [Email], [House_Type], [Current_Pets], [Fenced_Yard], [Animal_ID]) VALUES (4, N'Faith', N'Jones', N'245 Jackson Ave', N'4175554685', 30, NULL, N'Townhouse', N'1', N'Yes', 2)
INSERT [dbo].[Adopter] ([ID], [First_Name], [Last_Name], [Address], [Phone], [Age], [Email], [House_Type], [Current_Pets], [Fenced_Yard], [Animal_ID]) VALUES (5, N'Johnson', N'Vorhees', N'1515 Cardinal Dr', N'4175556868', 50, N'johnson.vorhees@gmail.com', N'Apartment', N'1', N'No', 10)
INSERT [dbo].[Adopter] ([ID], [First_Name], [Last_Name], [Address], [Phone], [Age], [Email], [House_Type], [Current_Pets], [Fenced_Yard], [Animal_ID]) VALUES (6, N'Dale', N'Johnson', N'1819 Lone Elm', N'4175556452', 28, N'dale.johnson@gmail.com', N'Townhouse', N'2', N'Yes', 8)
INSERT [dbo].[Adopter] ([ID], [First_Name], [Last_Name], [Address], [Phone], [Age], [Email], [House_Type], [Current_Pets], [Fenced_Yard], [Animal_ID]) VALUES (7, N'Rose', N'Smith', N'78 Zora ', N'4175556363', 21, N'rose.smith@yahoo.com', N'Apartment', N'0', N'No', 7)
INSERT [dbo].[Adopter] ([ID], [First_Name], [Last_Name], [Address], [Phone], [Age], [Email], [House_Type], [Current_Pets], [Fenced_Yard], [Animal_ID]) VALUES (8, N'Art', N'Vandelay', N'904 W 3rd', N'4175556594', 45, NULL, N'Condo', N'1', N'Yes', 1)
INSERT [dbo].[Adopter] ([ID], [First_Name], [Last_Name], [Address], [Phone], [Age], [Email], [House_Type], [Current_Pets], [Fenced_Yard], [Animal_ID]) VALUES (9, N'Rusty', N'Shackleford', N'345 Hill Dr', N'4175558475', 35, N'rusty.shackleford@yahoo.com', N'Apartment', N'0', N'No', 4)
INSERT [dbo].[Adopter] ([ID], [First_Name], [Last_Name], [Address], [Phone], [Age], [Email], [House_Type], [Current_Pets], [Fenced_Yard], [Animal_ID]) VALUES (10, N'Pepe', N'Sylvia', N'780 Sunny Dr', N'4175551416', 42, N'pepe.sylvia@gmail.com', N'Townhouse', N'1', N'Yes', 5)
INSERT [dbo].[Adopter] ([ID], [First_Name], [Last_Name], [Address], [Phone], [Age], [Email], [House_Type], [Current_Pets], [Fenced_Yard], [Animal_ID]) VALUES (11, N'Regina', N'Phalange', N'568 Friends Lane', N'4175556898', 55, NULL, N'Townhouse', N'2', N'Yes', 6)
INSERT [dbo].[Adopter] ([ID], [First_Name], [Last_Name], [Address], [Phone], [Age], [Email], [House_Type], [Current_Pets], [Fenced_Yard], [Animal_ID]) VALUES (12, N'Dean', N'Winchester', N'29 Cornelia', N'4175553235', 41, N'dean.winchester@gmail.com', N'Condo', N'0', N'Yes', 9)
SET IDENTITY_INSERT [dbo].[Adopter] OFF
GO
SET IDENTITY_INSERT [dbo].[Adoption_Organization] ON 

INSERT [dbo].[Adoption_Organization] ([Associate_ID], [First_Name], [Last_Name], [Position]) VALUES (1, N'Heather   ', N'Stewart   ', N'Manager   ')
INSERT [dbo].[Adoption_Organization] ([Associate_ID], [First_Name], [Last_Name], [Position]) VALUES (2, N'Rachel    ', N'Budd      ', N'Associate ')
INSERT [dbo].[Adoption_Organization] ([Associate_ID], [First_Name], [Last_Name], [Position]) VALUES (3, N'Kyra      ', N'Willow    ', N'Associate ')
INSERT [dbo].[Adoption_Organization] ([Associate_ID], [First_Name], [Last_Name], [Position]) VALUES (4, N'Layla     ', N'Rose      ', N'Associate ')
INSERT [dbo].[Adoption_Organization] ([Associate_ID], [First_Name], [Last_Name], [Position]) VALUES (5, N'Harley    ', N'Joseph    ', N'Associate ')
SET IDENTITY_INSERT [dbo].[Adoption_Organization] OFF
GO
SET IDENTITY_INSERT [dbo].[Animal] ON 

INSERT [dbo].[Animal] ([Animal_ID], [Name], [Species], [Breed], [Gender], [Age], [Sterile_ID], [Adoption_Status]) VALUES (1, N'Rosey', N'Dog', N'Poodle', N'Female', 3, 1, N'Yes')
INSERT [dbo].[Animal] ([Animal_ID], [Name], [Species], [Breed], [Gender], [Age], [Sterile_ID], [Adoption_Status]) VALUES (2, N'Billy', N'Dog', N'Shepherd', N'Male', 2, 2, N'No')
INSERT [dbo].[Animal] ([Animal_ID], [Name], [Species], [Breed], [Gender], [Age], [Sterile_ID], [Adoption_Status]) VALUES (3, N'Sally', N'Cat', N'Domestic Shorthair', N'Female', 2, 3, N'No')
INSERT [dbo].[Animal] ([Animal_ID], [Name], [Species], [Breed], [Gender], [Age], [Sterile_ID], [Adoption_Status]) VALUES (4, N'Lily', N'Dog', N'Great Pyrenees', N'Female', 1, 4, N'Yes')
INSERT [dbo].[Animal] ([Animal_ID], [Name], [Species], [Breed], [Gender], [Age], [Sterile_ID], [Adoption_Status]) VALUES (5, N'Diesel', N'Dog', N'Mix', N'Male', 5, 5, N'Yes')
INSERT [dbo].[Animal] ([Animal_ID], [Name], [Species], [Breed], [Gender], [Age], [Sterile_ID], [Adoption_Status]) VALUES (6, N'Vader', N'Dog', N'Great Pyrenees', N'Male', 2, 6, N'Yes')
INSERT [dbo].[Animal] ([Animal_ID], [Name], [Species], [Breed], [Gender], [Age], [Sterile_ID], [Adoption_Status]) VALUES (7, N'Princess', N'Dog', N'Siberian Husky', N'Female', 1, 7, N'No')
INSERT [dbo].[Animal] ([Animal_ID], [Name], [Species], [Breed], [Gender], [Age], [Sterile_ID], [Adoption_Status]) VALUES (8, N'Mickey', N'Cat', N'Domestic Shorthair', N'Male', 1, 8, N'No')
INSERT [dbo].[Animal] ([Animal_ID], [Name], [Species], [Breed], [Gender], [Age], [Sterile_ID], [Adoption_Status]) VALUES (9, N'Chatty', N'Cat', N'Domestic Shorthair', N'Male', 1, 9, N'Yes')
INSERT [dbo].[Animal] ([Animal_ID], [Name], [Species], [Breed], [Gender], [Age], [Sterile_ID], [Adoption_Status]) VALUES (10, N'Onyx', N'Cat', N'Domestic Mediumhair', N'Male', 1, 10, N'No')
SET IDENTITY_INSERT [dbo].[Animal] OFF
GO
SET IDENTITY_INSERT [dbo].[Interview_Progress] ON 

INSERT [dbo].[Interview_Progress] ([Interview_ID], [Adopter_ID], [Animal_ID], [Status], [Adopted], [Associate_ID]) VALUES (1, 1, 3, N'In progress', N'No', 2)
INSERT [dbo].[Interview_Progress] ([Interview_ID], [Adopter_ID], [Animal_ID], [Status], [Adopted], [Associate_ID]) VALUES (2, 4, 2, N'In progress', N'No', 3)
INSERT [dbo].[Interview_Progress] ([Interview_ID], [Adopter_ID], [Animal_ID], [Status], [Adopted], [Associate_ID]) VALUES (3, 5, 10, N'In progress', N'No', 3)
INSERT [dbo].[Interview_Progress] ([Interview_ID], [Adopter_ID], [Animal_ID], [Status], [Adopted], [Associate_ID]) VALUES (4, 6, 8, N'In progress', N'No', 4)
INSERT [dbo].[Interview_Progress] ([Interview_ID], [Adopter_ID], [Animal_ID], [Status], [Adopted], [Associate_ID]) VALUES (5, 7, 7, N'In progress', N'No', 5)
INSERT [dbo].[Interview_Progress] ([Interview_ID], [Adopter_ID], [Animal_ID], [Status], [Adopted], [Associate_ID]) VALUES (6, 8, 1, N'Complete', N'Yes', 1)
INSERT [dbo].[Interview_Progress] ([Interview_ID], [Adopter_ID], [Animal_ID], [Status], [Adopted], [Associate_ID]) VALUES (7, 9, 4, N'Complete', N'Yes', 2)
INSERT [dbo].[Interview_Progress] ([Interview_ID], [Adopter_ID], [Animal_ID], [Status], [Adopted], [Associate_ID]) VALUES (8, 10, 5, N'Complete', N'Yes', 1)
INSERT [dbo].[Interview_Progress] ([Interview_ID], [Adopter_ID], [Animal_ID], [Status], [Adopted], [Associate_ID]) VALUES (9, 11, 6, N'Complete', N'Yes', 1)
INSERT [dbo].[Interview_Progress] ([Interview_ID], [Adopter_ID], [Animal_ID], [Status], [Adopted], [Associate_ID]) VALUES (10, 12, 9, N'Complete', N'Yes', 4)
SET IDENTITY_INSERT [dbo].[Interview_Progress] OFF
GO
SET IDENTITY_INSERT [dbo].[Sterilization] ON 

INSERT [dbo].[Sterilization] ([Sterile_ID], [Animal_ID], [Status], [Date]) VALUES (1, 1, N'Yes', CAST(N'2023-09-10' AS Date))
INSERT [dbo].[Sterilization] ([Sterile_ID], [Animal_ID], [Status], [Date]) VALUES (2, 2, N'No', NULL)
INSERT [dbo].[Sterilization] ([Sterile_ID], [Animal_ID], [Status], [Date]) VALUES (3, 3, N'Yes', CAST(N'2022-08-10' AS Date))
INSERT [dbo].[Sterilization] ([Sterile_ID], [Animal_ID], [Status], [Date]) VALUES (4, 4, N'No', NULL)
INSERT [dbo].[Sterilization] ([Sterile_ID], [Animal_ID], [Status], [Date]) VALUES (5, 5, N'Yes', CAST(N'2023-12-10' AS Date))
INSERT [dbo].[Sterilization] ([Sterile_ID], [Animal_ID], [Status], [Date]) VALUES (6, 6, N'Yes', CAST(N'2023-06-20' AS Date))
INSERT [dbo].[Sterilization] ([Sterile_ID], [Animal_ID], [Status], [Date]) VALUES (7, 7, N'Yes', CAST(N'2023-07-25' AS Date))
INSERT [dbo].[Sterilization] ([Sterile_ID], [Animal_ID], [Status], [Date]) VALUES (8, 8, N'Yes', CAST(N'2023-08-15' AS Date))
INSERT [dbo].[Sterilization] ([Sterile_ID], [Animal_ID], [Status], [Date]) VALUES (9, 9, N'Yes', CAST(N'2023-04-13' AS Date))
INSERT [dbo].[Sterilization] ([Sterile_ID], [Animal_ID], [Status], [Date]) VALUES (10, 10, N'No', NULL)
SET IDENTITY_INSERT [dbo].[Sterilization] OFF
GO
USE [master]
GO
ALTER DATABASE [AnimalAdoptions] SET  READ_WRITE 
GO
