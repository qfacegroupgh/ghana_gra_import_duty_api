GO
/****** Object:  Database [GRA]    Script Date: 3/24/2021 3:48:13 AM ******/
CREATE DATABASE [GRA]

USE [GRA]
GO
/****** Object:  Table [dbo].[Taxation]    Script Date: 3/24/2021 3:48:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Taxation](
	[TaxationId] [int] IDENTITY(1000,1) NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
	[DefaultValue] [money] NOT NULL,
	[TaxationCalculationTypeId] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[CreateBy] [nvarchar](50) NOT NULL,
	[LastModifiedDate] [datetime] NOT NULL,
	[LastModifiedBy] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Taxation] PRIMARY KEY CLUSTERED 
(
	[TaxationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaxationCalculationType]    Script Date: 3/24/2021 3:48:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaxationCalculationType](
	[TaxationCalculationTypeId] [int] NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[TaxationIndex] [int] NULL,
	[CreateDate] [datetime] NOT NULL,
	[CreateBy] [nvarchar](50) NOT NULL,
	[LastModifiedDate] [datetime] NOT NULL,
	[LastModifiedBy] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TaxationCalculationType] PRIMARY KEY CLUSTERED 
(
	[TaxationCalculationTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VehicleType]    Script Date: 3/24/2021 3:48:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VehicleType](
	[VehicleTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[CreateBy] [nvarchar](50) NOT NULL,
	[LastModifiedDate] [datetime] NOT NULL,
	[LastModifiedBy] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_VehicleType] PRIMARY KEY CLUSTERED 
(
	[VehicleTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VehicleTypeTaxation]    Script Date: 3/24/2021 3:48:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VehicleTypeTaxation](
	[TaxationId] [int] NOT NULL,
	[VehicleTypeId] [int] NOT NULL,
	[Value] [money] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[CreateBy] [nvarchar](50) NOT NULL,
	[LastModifiedDate] [datetime] NOT NULL,
	[LastModifiedBy] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_VehicleTypeTaxation] PRIMARY KEY CLUSTERED 
(
	[TaxationId] ASC,
	[VehicleTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Taxation] ON 
GO
INSERT [dbo].[Taxation] ([TaxationId], [Name], [DefaultValue], [TaxationCalculationTypeId], [CreateDate], [CreateBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1000, N'Import Duty', 20.0000, 2, CAST(N'2021-03-22T18:05:13.247' AS DateTime), N'sysadmin', CAST(N'2021-03-22T18:05:13.247' AS DateTime), N'sysadmin')
GO
INSERT [dbo].[Taxation] ([TaxationId], [Name], [DefaultValue], [TaxationCalculationTypeId], [CreateDate], [CreateBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1001, N'VAT', 12.5000, 2, CAST(N'2021-03-22T18:05:35.427' AS DateTime), N'sysadmin', CAST(N'2021-03-22T18:05:35.427' AS DateTime), N'sysadmin')
GO
INSERT [dbo].[Taxation] ([TaxationId], [Name], [DefaultValue], [TaxationCalculationTypeId], [CreateDate], [CreateBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1002, N'NHIL', 2.5000, 1, CAST(N'2021-03-22T18:05:48.393' AS DateTime), N'sysadmin', CAST(N'2021-03-22T18:05:48.393' AS DateTime), N'sysadmin')
GO
INSERT [dbo].[Taxation] ([TaxationId], [Name], [DefaultValue], [TaxationCalculationTypeId], [CreateDate], [CreateBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1003, N'GETFUND LEVY', 2.5000, 1, CAST(N'2021-03-22T18:06:14.160' AS DateTime), N'sysadmin', CAST(N'2021-03-22T18:06:14.160' AS DateTime), N'sysadmin')
GO
INSERT [dbo].[Taxation] ([TaxationId], [Name], [DefaultValue], [TaxationCalculationTypeId], [CreateDate], [CreateBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1004, N'AU LEVY', 0.2000, 1, CAST(N'2021-03-22T18:07:51.813' AS DateTime), N'sysadmin', CAST(N'2021-03-22T18:07:51.813' AS DateTime), N'sysadmin')
GO
INSERT [dbo].[Taxation] ([TaxationId], [Name], [DefaultValue], [TaxationCalculationTypeId], [CreateDate], [CreateBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1005, N'ECOWAS LEVY', 0.5000, 1, CAST(N'2021-03-22T18:08:20.053' AS DateTime), N'sysadmin', CAST(N'2021-03-22T18:08:20.053' AS DateTime), N'sysadmin')
GO
INSERT [dbo].[Taxation] ([TaxationId], [Name], [DefaultValue], [TaxationCalculationTypeId], [CreateDate], [CreateBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1006, N'EXIM LEVY', 0.7500, 1, CAST(N'2021-03-22T18:08:46.753' AS DateTime), N'sysadmin', CAST(N'2021-03-22T18:08:46.753' AS DateTime), N'sysadmin')
GO
INSERT [dbo].[Taxation] ([TaxationId], [Name], [DefaultValue], [TaxationCalculationTypeId], [CreateDate], [CreateBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1007, N'PROCESSING FEE', 1.0000, 1, CAST(N'2021-03-22T18:09:04.770' AS DateTime), N'sysadmin', CAST(N'2021-03-22T18:09:04.770' AS DateTime), N'sysadmin')
GO
INSERT [dbo].[Taxation] ([TaxationId], [Name], [DefaultValue], [TaxationCalculationTypeId], [CreateDate], [CreateBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1008, N'SPECIAL IMPORT LEVY', 2.0000, 1, CAST(N'2021-03-22T18:09:31.273' AS DateTime), N'sysadmin', CAST(N'2021-03-22T18:09:31.273' AS DateTime), N'sysadmin')
GO
SET IDENTITY_INSERT [dbo].[Taxation] OFF
GO
INSERT [dbo].[TaxationCalculationType] ([TaxationCalculationTypeId], [Name], [Description], [TaxationIndex], [CreateDate], [CreateBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1, N'Sub-Total 1', N'Taxation', 1, CAST(N'2021-03-22T18:03:20.717' AS DateTime), N'sysadmin', CAST(N'2021-03-22T18:03:20.717' AS DateTime), N'sysadmin')
GO
INSERT [dbo].[TaxationCalculationType] ([TaxationCalculationTypeId], [Name], [Description], [TaxationIndex], [CreateDate], [CreateBy], [LastModifiedDate], [LastModifiedBy]) VALUES (2, N'Sub-Total 2', N'VAT', 2, CAST(N'2021-03-22T18:03:42.660' AS DateTime), N'sysadmin', CAST(N'2021-03-22T18:03:42.660' AS DateTime), N'sysadmin')
GO
SET IDENTITY_INSERT [dbo].[VehicleType] ON 
GO
INSERT [dbo].[VehicleType] ([VehicleTypeId], [Name], [CreateDate], [CreateBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1, N'AMBULANCES & HEARSE', CAST(N'2021-03-22T18:53:06.637' AS DateTime), N'sysadmin', CAST(N'2021-03-22T18:53:06.637' AS DateTime), N'sysadmin')
GO
INSERT [dbo].[VehicleType] ([VehicleTypeId], [Name], [CreateDate], [CreateBy], [LastModifiedDate], [LastModifiedBy]) VALUES (2, N'MOTOR CARS INCLUDING CROSS COUNTRY AND ESTATE CARS:  DIESEL', CAST(N'2021-03-22T18:54:21.403' AS DateTime), N'sysadmin', CAST(N'2021-03-22T18:54:21.403' AS DateTime), N'sysadmin')
GO
INSERT [dbo].[VehicleType] ([VehicleTypeId], [Name], [CreateDate], [CreateBy], [LastModifiedDate], [LastModifiedBy]) VALUES (3, N'MOTOR CARS INCLUDING CROSS COUNTRY AND ESTATE CARS:  PETROL', CAST(N'2021-03-22T18:54:29.180' AS DateTime), N'sysadmin', CAST(N'2021-03-22T18:54:29.180' AS DateTime), N'sysadmin')
GO
INSERT [dbo].[VehicleType] ([VehicleTypeId], [Name], [CreateDate], [CreateBy], [LastModifiedDate], [LastModifiedBy]) VALUES (4, N'MOTOR VEHICLE FOR THE TRANSPORT OF GOODS SUCH AS TRUCKS, TIPPING TRUCKS,VANS, REFUSE TRUCK, TANKERS  AND LORRIES', CAST(N'2021-03-22T18:54:36.843' AS DateTime), N'sysadmin', CAST(N'2021-03-22T18:54:36.843' AS DateTime), N'sysadmin')
GO
INSERT [dbo].[VehicleType] ([VehicleTypeId], [Name], [CreateDate], [CreateBy], [LastModifiedDate], [LastModifiedBy]) VALUES (5, N'OTHER VEHICLES', CAST(N'2021-03-22T18:54:44.457' AS DateTime), N'sysadmin', CAST(N'2021-03-22T18:54:44.457' AS DateTime), N'sysadmin')
GO
INSERT [dbo].[VehicleType] ([VehicleTypeId], [Name], [CreateDate], [CreateBy], [LastModifiedDate], [LastModifiedBy]) VALUES (6, N'TROOP CARRIER (13 PASSENGERS)8702', CAST(N'2021-03-22T18:54:58.277' AS DateTime), N'sysadmin', CAST(N'2021-03-22T18:54:58.277' AS DateTime), N'sysadmin')
GO
SET IDENTITY_INSERT [dbo].[VehicleType] OFF
GO
INSERT [dbo].[VehicleTypeTaxation] ([TaxationId], [VehicleTypeId], [Value], [CreateDate], [CreateBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1000, 1, 0.0000, CAST(N'2021-03-22T19:11:00.310' AS DateTime), N'sysadmin', CAST(N'2021-03-22T19:11:00.313' AS DateTime), N'sysadmin')
GO
INSERT [dbo].[VehicleTypeTaxation] ([TaxationId], [VehicleTypeId], [Value], [CreateDate], [CreateBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1000, 2, 20.0000, CAST(N'2021-03-22T19:11:00.373' AS DateTime), N'sysadmin', CAST(N'2021-03-22T19:11:00.373' AS DateTime), N'sysadmin')
GO
INSERT [dbo].[VehicleTypeTaxation] ([TaxationId], [VehicleTypeId], [Value], [CreateDate], [CreateBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1000, 3, 20.0000, CAST(N'2021-03-22T19:11:00.377' AS DateTime), N'sysadmin', CAST(N'2021-03-22T19:11:00.377' AS DateTime), N'sysadmin')
GO
INSERT [dbo].[VehicleTypeTaxation] ([TaxationId], [VehicleTypeId], [Value], [CreateDate], [CreateBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1000, 4, 20.0000, CAST(N'2021-03-22T19:11:00.377' AS DateTime), N'sysadmin', CAST(N'2021-03-22T19:11:00.377' AS DateTime), N'sysadmin')
GO
INSERT [dbo].[VehicleTypeTaxation] ([TaxationId], [VehicleTypeId], [Value], [CreateDate], [CreateBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1000, 5, 20.0000, CAST(N'2021-03-22T19:11:00.377' AS DateTime), N'sysadmin', CAST(N'2021-03-22T19:11:00.377' AS DateTime), N'sysadmin')
GO
INSERT [dbo].[VehicleTypeTaxation] ([TaxationId], [VehicleTypeId], [Value], [CreateDate], [CreateBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1000, 6, 20.0000, CAST(N'2021-03-22T19:11:00.380' AS DateTime), N'sysadmin', CAST(N'2021-03-22T19:11:00.380' AS DateTime), N'sysadmin')
GO
INSERT [dbo].[VehicleTypeTaxation] ([TaxationId], [VehicleTypeId], [Value], [CreateDate], [CreateBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1001, 1, 12.5000, CAST(N'2021-03-22T19:11:00.373' AS DateTime), N'sysadmin', CAST(N'2021-03-22T19:11:00.373' AS DateTime), N'sysadmin')
GO
INSERT [dbo].[VehicleTypeTaxation] ([TaxationId], [VehicleTypeId], [Value], [CreateDate], [CreateBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1001, 2, 12.5000, CAST(N'2021-03-22T19:11:00.373' AS DateTime), N'sysadmin', CAST(N'2021-03-22T19:11:00.373' AS DateTime), N'sysadmin')
GO
INSERT [dbo].[VehicleTypeTaxation] ([TaxationId], [VehicleTypeId], [Value], [CreateDate], [CreateBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1001, 3, 12.5000, CAST(N'2021-03-22T19:11:00.377' AS DateTime), N'sysadmin', CAST(N'2021-03-22T19:11:00.377' AS DateTime), N'sysadmin')
GO
INSERT [dbo].[VehicleTypeTaxation] ([TaxationId], [VehicleTypeId], [Value], [CreateDate], [CreateBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1001, 4, 12.5000, CAST(N'2021-03-22T19:11:00.377' AS DateTime), N'sysadmin', CAST(N'2021-03-22T19:11:00.377' AS DateTime), N'sysadmin')
GO
INSERT [dbo].[VehicleTypeTaxation] ([TaxationId], [VehicleTypeId], [Value], [CreateDate], [CreateBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1001, 5, 12.5000, CAST(N'2021-03-22T19:11:00.377' AS DateTime), N'sysadmin', CAST(N'2021-03-22T19:11:00.377' AS DateTime), N'sysadmin')
GO
INSERT [dbo].[VehicleTypeTaxation] ([TaxationId], [VehicleTypeId], [Value], [CreateDate], [CreateBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1001, 6, 12.5000, CAST(N'2021-03-22T19:11:00.380' AS DateTime), N'sysadmin', CAST(N'2021-03-22T19:11:00.380' AS DateTime), N'sysadmin')
GO
INSERT [dbo].[VehicleTypeTaxation] ([TaxationId], [VehicleTypeId], [Value], [CreateDate], [CreateBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1002, 1, 2.5000, CAST(N'2021-03-22T19:11:00.373' AS DateTime), N'sysadmin', CAST(N'2021-03-22T19:11:00.373' AS DateTime), N'sysadmin')
GO
INSERT [dbo].[VehicleTypeTaxation] ([TaxationId], [VehicleTypeId], [Value], [CreateDate], [CreateBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1002, 2, 2.5000, CAST(N'2021-03-22T19:11:00.373' AS DateTime), N'sysadmin', CAST(N'2021-03-22T19:11:00.373' AS DateTime), N'sysadmin')
GO
INSERT [dbo].[VehicleTypeTaxation] ([TaxationId], [VehicleTypeId], [Value], [CreateDate], [CreateBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1002, 3, 2.5000, CAST(N'2021-03-22T19:11:00.377' AS DateTime), N'sysadmin', CAST(N'2021-03-22T19:11:00.377' AS DateTime), N'sysadmin')
GO
INSERT [dbo].[VehicleTypeTaxation] ([TaxationId], [VehicleTypeId], [Value], [CreateDate], [CreateBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1002, 4, 2.5000, CAST(N'2021-03-22T19:11:00.377' AS DateTime), N'sysadmin', CAST(N'2021-03-22T19:11:00.377' AS DateTime), N'sysadmin')
GO
INSERT [dbo].[VehicleTypeTaxation] ([TaxationId], [VehicleTypeId], [Value], [CreateDate], [CreateBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1002, 5, 2.5000, CAST(N'2021-03-22T19:11:00.377' AS DateTime), N'sysadmin', CAST(N'2021-03-22T19:11:00.377' AS DateTime), N'sysadmin')
GO
INSERT [dbo].[VehicleTypeTaxation] ([TaxationId], [VehicleTypeId], [Value], [CreateDate], [CreateBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1002, 6, 2.5000, CAST(N'2021-03-22T19:11:00.380' AS DateTime), N'sysadmin', CAST(N'2021-03-22T19:11:00.380' AS DateTime), N'sysadmin')
GO
INSERT [dbo].[VehicleTypeTaxation] ([TaxationId], [VehicleTypeId], [Value], [CreateDate], [CreateBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1003, 1, 2.5000, CAST(N'2021-03-22T19:11:00.373' AS DateTime), N'sysadmin', CAST(N'2021-03-22T19:11:00.373' AS DateTime), N'sysadmin')
GO
INSERT [dbo].[VehicleTypeTaxation] ([TaxationId], [VehicleTypeId], [Value], [CreateDate], [CreateBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1003, 2, 2.5000, CAST(N'2021-03-22T19:11:00.373' AS DateTime), N'sysadmin', CAST(N'2021-03-22T19:11:00.373' AS DateTime), N'sysadmin')
GO
INSERT [dbo].[VehicleTypeTaxation] ([TaxationId], [VehicleTypeId], [Value], [CreateDate], [CreateBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1003, 3, 2.5000, CAST(N'2021-03-22T19:11:00.377' AS DateTime), N'sysadmin', CAST(N'2021-03-22T19:11:00.377' AS DateTime), N'sysadmin')
GO
INSERT [dbo].[VehicleTypeTaxation] ([TaxationId], [VehicleTypeId], [Value], [CreateDate], [CreateBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1003, 4, 2.5000, CAST(N'2021-03-22T19:11:00.377' AS DateTime), N'sysadmin', CAST(N'2021-03-22T19:11:00.377' AS DateTime), N'sysadmin')
GO
INSERT [dbo].[VehicleTypeTaxation] ([TaxationId], [VehicleTypeId], [Value], [CreateDate], [CreateBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1003, 5, 2.5000, CAST(N'2021-03-22T19:11:00.377' AS DateTime), N'sysadmin', CAST(N'2021-03-22T19:11:00.377' AS DateTime), N'sysadmin')
GO
INSERT [dbo].[VehicleTypeTaxation] ([TaxationId], [VehicleTypeId], [Value], [CreateDate], [CreateBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1003, 6, 2.5000, CAST(N'2021-03-22T19:11:00.380' AS DateTime), N'sysadmin', CAST(N'2021-03-22T19:11:00.380' AS DateTime), N'sysadmin')
GO
INSERT [dbo].[VehicleTypeTaxation] ([TaxationId], [VehicleTypeId], [Value], [CreateDate], [CreateBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1004, 1, 0.2000, CAST(N'2021-03-22T19:11:00.373' AS DateTime), N'sysadmin', CAST(N'2021-03-22T19:11:00.373' AS DateTime), N'sysadmin')
GO
INSERT [dbo].[VehicleTypeTaxation] ([TaxationId], [VehicleTypeId], [Value], [CreateDate], [CreateBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1004, 2, 0.2000, CAST(N'2021-03-22T19:11:00.373' AS DateTime), N'sysadmin', CAST(N'2021-03-22T19:11:00.373' AS DateTime), N'sysadmin')
GO
INSERT [dbo].[VehicleTypeTaxation] ([TaxationId], [VehicleTypeId], [Value], [CreateDate], [CreateBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1004, 3, 0.2000, CAST(N'2021-03-22T19:11:00.377' AS DateTime), N'sysadmin', CAST(N'2021-03-22T19:11:00.377' AS DateTime), N'sysadmin')
GO
INSERT [dbo].[VehicleTypeTaxation] ([TaxationId], [VehicleTypeId], [Value], [CreateDate], [CreateBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1004, 4, 0.2000, CAST(N'2021-03-22T19:11:00.377' AS DateTime), N'sysadmin', CAST(N'2021-03-22T19:11:00.377' AS DateTime), N'sysadmin')
GO
INSERT [dbo].[VehicleTypeTaxation] ([TaxationId], [VehicleTypeId], [Value], [CreateDate], [CreateBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1004, 5, 0.2000, CAST(N'2021-03-22T19:11:00.377' AS DateTime), N'sysadmin', CAST(N'2021-03-22T19:11:00.377' AS DateTime), N'sysadmin')
GO
INSERT [dbo].[VehicleTypeTaxation] ([TaxationId], [VehicleTypeId], [Value], [CreateDate], [CreateBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1004, 6, 0.2000, CAST(N'2021-03-22T19:11:00.380' AS DateTime), N'sysadmin', CAST(N'2021-03-22T19:11:00.380' AS DateTime), N'sysadmin')
GO
INSERT [dbo].[VehicleTypeTaxation] ([TaxationId], [VehicleTypeId], [Value], [CreateDate], [CreateBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1005, 1, 0.5000, CAST(N'2021-03-22T19:11:00.373' AS DateTime), N'sysadmin', CAST(N'2021-03-22T19:11:00.373' AS DateTime), N'sysadmin')
GO
INSERT [dbo].[VehicleTypeTaxation] ([TaxationId], [VehicleTypeId], [Value], [CreateDate], [CreateBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1005, 2, 0.5000, CAST(N'2021-03-22T19:11:00.373' AS DateTime), N'sysadmin', CAST(N'2021-03-22T19:11:00.373' AS DateTime), N'sysadmin')
GO
INSERT [dbo].[VehicleTypeTaxation] ([TaxationId], [VehicleTypeId], [Value], [CreateDate], [CreateBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1005, 3, 0.5000, CAST(N'2021-03-22T19:11:00.377' AS DateTime), N'sysadmin', CAST(N'2021-03-22T19:11:00.377' AS DateTime), N'sysadmin')
GO
INSERT [dbo].[VehicleTypeTaxation] ([TaxationId], [VehicleTypeId], [Value], [CreateDate], [CreateBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1005, 4, 0.5000, CAST(N'2021-03-22T19:11:00.377' AS DateTime), N'sysadmin', CAST(N'2021-03-22T19:11:00.377' AS DateTime), N'sysadmin')
GO
INSERT [dbo].[VehicleTypeTaxation] ([TaxationId], [VehicleTypeId], [Value], [CreateDate], [CreateBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1005, 5, 0.5000, CAST(N'2021-03-22T19:11:00.377' AS DateTime), N'sysadmin', CAST(N'2021-03-22T19:11:00.377' AS DateTime), N'sysadmin')
GO
INSERT [dbo].[VehicleTypeTaxation] ([TaxationId], [VehicleTypeId], [Value], [CreateDate], [CreateBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1005, 6, 0.5000, CAST(N'2021-03-22T19:11:00.380' AS DateTime), N'sysadmin', CAST(N'2021-03-22T19:11:00.380' AS DateTime), N'sysadmin')
GO
INSERT [dbo].[VehicleTypeTaxation] ([TaxationId], [VehicleTypeId], [Value], [CreateDate], [CreateBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1006, 1, 0.7500, CAST(N'2021-03-22T19:11:00.373' AS DateTime), N'sysadmin', CAST(N'2021-03-22T19:11:00.373' AS DateTime), N'sysadmin')
GO
INSERT [dbo].[VehicleTypeTaxation] ([TaxationId], [VehicleTypeId], [Value], [CreateDate], [CreateBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1006, 2, 0.7500, CAST(N'2021-03-22T19:11:00.373' AS DateTime), N'sysadmin', CAST(N'2021-03-22T19:11:00.373' AS DateTime), N'sysadmin')
GO
INSERT [dbo].[VehicleTypeTaxation] ([TaxationId], [VehicleTypeId], [Value], [CreateDate], [CreateBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1006, 3, 0.7500, CAST(N'2021-03-22T19:11:00.377' AS DateTime), N'sysadmin', CAST(N'2021-03-22T19:11:00.377' AS DateTime), N'sysadmin')
GO
INSERT [dbo].[VehicleTypeTaxation] ([TaxationId], [VehicleTypeId], [Value], [CreateDate], [CreateBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1006, 4, 0.7500, CAST(N'2021-03-22T19:11:00.377' AS DateTime), N'sysadmin', CAST(N'2021-03-22T19:11:00.377' AS DateTime), N'sysadmin')
GO
INSERT [dbo].[VehicleTypeTaxation] ([TaxationId], [VehicleTypeId], [Value], [CreateDate], [CreateBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1006, 5, 0.7500, CAST(N'2021-03-22T19:11:00.377' AS DateTime), N'sysadmin', CAST(N'2021-03-22T19:11:00.377' AS DateTime), N'sysadmin')
GO
INSERT [dbo].[VehicleTypeTaxation] ([TaxationId], [VehicleTypeId], [Value], [CreateDate], [CreateBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1006, 6, 0.7500, CAST(N'2021-03-22T19:11:00.380' AS DateTime), N'sysadmin', CAST(N'2021-03-22T19:11:00.380' AS DateTime), N'sysadmin')
GO
INSERT [dbo].[VehicleTypeTaxation] ([TaxationId], [VehicleTypeId], [Value], [CreateDate], [CreateBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1007, 1, 1.0000, CAST(N'2021-03-22T19:11:00.373' AS DateTime), N'sysadmin', CAST(N'2021-03-22T19:11:00.373' AS DateTime), N'sysadmin')
GO
INSERT [dbo].[VehicleTypeTaxation] ([TaxationId], [VehicleTypeId], [Value], [CreateDate], [CreateBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1007, 2, 1.0000, CAST(N'2021-03-22T19:11:00.373' AS DateTime), N'sysadmin', CAST(N'2021-03-22T19:11:00.373' AS DateTime), N'sysadmin')
GO
INSERT [dbo].[VehicleTypeTaxation] ([TaxationId], [VehicleTypeId], [Value], [CreateDate], [CreateBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1007, 3, 1.0000, CAST(N'2021-03-22T19:11:00.377' AS DateTime), N'sysadmin', CAST(N'2021-03-22T19:11:00.377' AS DateTime), N'sysadmin')
GO
INSERT [dbo].[VehicleTypeTaxation] ([TaxationId], [VehicleTypeId], [Value], [CreateDate], [CreateBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1007, 4, 1.0000, CAST(N'2021-03-22T19:11:00.377' AS DateTime), N'sysadmin', CAST(N'2021-03-22T19:11:00.377' AS DateTime), N'sysadmin')
GO
INSERT [dbo].[VehicleTypeTaxation] ([TaxationId], [VehicleTypeId], [Value], [CreateDate], [CreateBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1007, 5, 1.0000, CAST(N'2021-03-22T19:11:00.377' AS DateTime), N'sysadmin', CAST(N'2021-03-22T19:11:00.377' AS DateTime), N'sysadmin')
GO
INSERT [dbo].[VehicleTypeTaxation] ([TaxationId], [VehicleTypeId], [Value], [CreateDate], [CreateBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1007, 6, 1.0000, CAST(N'2021-03-22T19:11:00.380' AS DateTime), N'sysadmin', CAST(N'2021-03-22T19:11:00.380' AS DateTime), N'sysadmin')
GO
INSERT [dbo].[VehicleTypeTaxation] ([TaxationId], [VehicleTypeId], [Value], [CreateDate], [CreateBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1008, 1, 2.0000, CAST(N'2021-03-22T19:11:00.373' AS DateTime), N'sysadmin', CAST(N'2021-03-22T19:11:00.373' AS DateTime), N'sysadmin')
GO
INSERT [dbo].[VehicleTypeTaxation] ([TaxationId], [VehicleTypeId], [Value], [CreateDate], [CreateBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1008, 2, 2.0000, CAST(N'2021-03-22T19:11:00.373' AS DateTime), N'sysadmin', CAST(N'2021-03-22T19:11:00.373' AS DateTime), N'sysadmin')
GO
INSERT [dbo].[VehicleTypeTaxation] ([TaxationId], [VehicleTypeId], [Value], [CreateDate], [CreateBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1008, 3, 2.0000, CAST(N'2021-03-22T19:11:00.377' AS DateTime), N'sysadmin', CAST(N'2021-03-22T19:11:00.377' AS DateTime), N'sysadmin')
GO
INSERT [dbo].[VehicleTypeTaxation] ([TaxationId], [VehicleTypeId], [Value], [CreateDate], [CreateBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1008, 4, 2.0000, CAST(N'2021-03-22T19:11:00.377' AS DateTime), N'sysadmin', CAST(N'2021-03-22T19:11:00.377' AS DateTime), N'sysadmin')
GO
INSERT [dbo].[VehicleTypeTaxation] ([TaxationId], [VehicleTypeId], [Value], [CreateDate], [CreateBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1008, 5, 2.0000, CAST(N'2021-03-22T19:11:00.377' AS DateTime), N'sysadmin', CAST(N'2021-03-22T19:11:00.377' AS DateTime), N'sysadmin')
GO
INSERT [dbo].[VehicleTypeTaxation] ([TaxationId], [VehicleTypeId], [Value], [CreateDate], [CreateBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1008, 6, 2.0000, CAST(N'2021-03-22T19:11:00.380' AS DateTime), N'sysadmin', CAST(N'2021-03-22T19:11:00.380' AS DateTime), N'sysadmin')
GO
ALTER TABLE [dbo].[Taxation] ADD  CONSTRAINT [DF_Taxation_CreateDate]  DEFAULT (sysdatetime()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Taxation] ADD  CONSTRAINT [DF_Taxation_CreateBy]  DEFAULT ('sysadmin') FOR [CreateBy]
GO
ALTER TABLE [dbo].[Taxation] ADD  CONSTRAINT [DF_Taxation_LastModifiedDate]  DEFAULT (sysdatetime()) FOR [LastModifiedDate]
GO
ALTER TABLE [dbo].[Taxation] ADD  CONSTRAINT [DF_Taxation_LastModifiedBy]  DEFAULT ('sysadmin') FOR [LastModifiedBy]
GO
ALTER TABLE [dbo].[TaxationCalculationType] ADD  CONSTRAINT [DF_TaxationCalculationType_CreateDate]  DEFAULT (sysdatetime()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[TaxationCalculationType] ADD  CONSTRAINT [DF_TaxationCalculationType_CreateBy]  DEFAULT ('sysadmin') FOR [CreateBy]
GO
ALTER TABLE [dbo].[TaxationCalculationType] ADD  CONSTRAINT [DF_TaxationCalculationType_LastModifiedDate]  DEFAULT (sysdatetime()) FOR [LastModifiedDate]
GO
ALTER TABLE [dbo].[TaxationCalculationType] ADD  CONSTRAINT [DF_TaxationCalculationType_LastModifiedBy]  DEFAULT ('sysadmin') FOR [LastModifiedBy]
GO
ALTER TABLE [dbo].[VehicleType] ADD  CONSTRAINT [DF_VehicleType_CreateDate]  DEFAULT (sysdatetime()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[VehicleType] ADD  CONSTRAINT [DF_VehicleType_CreateBy]  DEFAULT ('sysadmin') FOR [CreateBy]
GO
ALTER TABLE [dbo].[VehicleType] ADD  CONSTRAINT [DF_VehicleType_LastModifiedDate]  DEFAULT (sysdatetime()) FOR [LastModifiedDate]
GO
ALTER TABLE [dbo].[VehicleType] ADD  CONSTRAINT [DF_VehicleType_LastModifiedBy]  DEFAULT ('sysadmin') FOR [LastModifiedBy]
GO
ALTER TABLE [dbo].[VehicleTypeTaxation] ADD  CONSTRAINT [DF_VehicleTypeTaxation_Value]  DEFAULT ((0)) FOR [Value]
GO
ALTER TABLE [dbo].[VehicleTypeTaxation] ADD  CONSTRAINT [DF_VehicleTypeTaxation_CreateDate]  DEFAULT (sysdatetime()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[VehicleTypeTaxation] ADD  CONSTRAINT [DF_VehicleTypeTaxation_CreateBy]  DEFAULT ('sysadmin') FOR [CreateBy]
GO
ALTER TABLE [dbo].[VehicleTypeTaxation] ADD  CONSTRAINT [DF_VehicleTypeTaxation_LastModifiedDate]  DEFAULT (sysdatetime()) FOR [LastModifiedDate]
GO
ALTER TABLE [dbo].[VehicleTypeTaxation] ADD  CONSTRAINT [DF_VehicleTypeTaxation_LastModifiedBy]  DEFAULT ('sysadmin') FOR [LastModifiedBy]
GO
ALTER TABLE [dbo].[Taxation]  WITH CHECK ADD  CONSTRAINT [FK_Taxation_TaxationCalculationType] FOREIGN KEY([TaxationCalculationTypeId])
REFERENCES [dbo].[TaxationCalculationType] ([TaxationCalculationTypeId])
GO
ALTER TABLE [dbo].[Taxation] CHECK CONSTRAINT [FK_Taxation_TaxationCalculationType]
GO
ALTER TABLE [dbo].[VehicleTypeTaxation]  WITH CHECK ADD  CONSTRAINT [FK_VehicleTypeTaxation_Taxation] FOREIGN KEY([TaxationId])
REFERENCES [dbo].[Taxation] ([TaxationId])
GO
ALTER TABLE [dbo].[VehicleTypeTaxation] CHECK CONSTRAINT [FK_VehicleTypeTaxation_Taxation]
GO
ALTER TABLE [dbo].[VehicleTypeTaxation]  WITH CHECK ADD  CONSTRAINT [FK_VehicleTypeTaxation_VehicleType] FOREIGN KEY([VehicleTypeId])
REFERENCES [dbo].[VehicleType] ([VehicleTypeId])
GO
ALTER TABLE [dbo].[VehicleTypeTaxation] CHECK CONSTRAINT [FK_VehicleTypeTaxation_VehicleType]
GO
USE [master]
GO
ALTER DATABASE [GRA] SET  READ_WRITE 
GO
