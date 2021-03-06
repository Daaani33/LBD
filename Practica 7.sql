USE [master]
GO
/****** Object:  Database [LabBase]    Script Date: 14/04/2019 03:14:39 a. m. ******/
CREATE DATABASE [LabBase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LabBase', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\LabBase.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'LabBase_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\LabBase_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [LabBase] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LabBase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LabBase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LabBase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LabBase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LabBase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LabBase] SET ARITHABORT OFF 
GO
ALTER DATABASE [LabBase] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [LabBase] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [LabBase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LabBase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LabBase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LabBase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LabBase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LabBase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LabBase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LabBase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LabBase] SET  ENABLE_BROKER 
GO
ALTER DATABASE [LabBase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LabBase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LabBase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LabBase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LabBase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LabBase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LabBase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LabBase] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LabBase] SET  MULTI_USER 
GO
ALTER DATABASE [LabBase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LabBase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LabBase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LabBase] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [LabBase]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 14/04/2019 03:14:39 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Clientes](
	[idCliente] [int] IDENTITY(1,1) NOT NULL,
	[PrimNombre] [varchar](50) NOT NULL,
	[SegNombre] [varchar](50) NOT NULL,
	[PrimApellido] [varchar](50) NOT NULL,
	[SegApellido] [varchar](50) NOT NULL,
	[Edad] [int] NOT NULL,
	[Sexo] [char](1) NOT NULL,
 CONSTRAINT [idCliente] PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Computo]    Script Date: 14/04/2019 03:14:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Computo](
	[IDpc] [int] IDENTITY(1,1) NOT NULL,
	[Disponible] [char](2) NULL,
	[clientesID] [int] NULL,
 CONSTRAINT [pk_idpc] PRIMARY KEY CLUSTERED 
(
	[IDpc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cubiculos]    Script Date: 14/04/2019 03:14:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cubiculos](
	[ClientesId] [int] NULL,
	[Cubiculo] [int] NULL,
	[Disponible] [char](2) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DonacionLibro]    Script Date: 14/04/2019 03:14:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DonacionLibro](
	[Titulo] [varchar](50) NULL,
	[Genero] [varchar](30) NULL,
	[CantidadD] [tinyint] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Libro]    Script Date: 14/04/2019 03:14:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Libro](
	[idLibro] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [varchar](50) NOT NULL,
	[Descripcion] [text] NOT NULL,
	[Disponible] [char](1) NOT NULL,
	[Genero] [varchar](30) NOT NULL,
	[Cantidad] [int] NOT NULL,
 CONSTRAINT [pk_idLibro] PRIMARY KEY CLUSTERED 
(
	[idLibro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LibrosExt]    Script Date: 14/04/2019 03:14:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LibrosExt](
	[FechaExt] [varchar](20) NULL,
	[LibroP] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Mesa]    Script Date: 14/04/2019 03:14:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Mesa](
	[Mesa] [int] NULL,
	[Disponible] [varchar](2) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Multas]    Script Date: 14/04/2019 03:14:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Multas](
	[FechaPrest] [varchar](50) NOT NULL,
	[FechaLimDev] [varchar](50) NOT NULL,
	[FechaDev] [varchar](50) NOT NULL,
	[Adeudo] [int] NOT NULL,
	[ClientesID] [int] NULL,
	[LibroID] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Paqueteria]    Script Date: 14/04/2019 03:14:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paqueteria](
	[LockerID] [int] IDENTITY(1,1) NOT NULL,
	[clientesId] [int] NULL,
 CONSTRAINT [pk_idLocker] PRIMARY KEY CLUSTERED 
(
	[LockerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Prestamo]    Script Date: 14/04/2019 03:14:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Prestamo](
	[idPrestamos] [int] IDENTITY(1,1) NOT NULL,
	[idCliente] [int] NOT NULL,
	[idLibro] [int] NOT NULL,
	[FechaPrestamo] [varchar](50) NOT NULL,
	[fechaLimDev] [varchar](50) NOT NULL,
	[FechaDev] [varchar](50) NOT NULL,
 CONSTRAINT [pk_iIdPrestamos] PRIMARY KEY CLUSTERED 
(
	[idPrestamos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[vista1]    Script Date: 14/04/2019 03:14:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vista1]
as
select idCliente,Edad, Sexo from Clientes
GO
/****** Object:  View [dbo].[vista10]    Script Date: 14/04/2019 03:14:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vista10]
as
select * from Prestamo;
GO
/****** Object:  View [dbo].[vista2]    Script Date: 14/04/2019 03:14:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vista2]
as
select * from Computo;
GO
/****** Object:  View [dbo].[vista3]    Script Date: 14/04/2019 03:14:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vista3]
as
select * from Cubiculos;
GO
/****** Object:  View [dbo].[vista4]    Script Date: 14/04/2019 03:14:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vista4]
as
select * from DonacionLibro;
GO
/****** Object:  View [dbo].[vista5]    Script Date: 14/04/2019 03:14:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vista5]
as
select * from Libro;
GO
/****** Object:  View [dbo].[vista6]    Script Date: 14/04/2019 03:14:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vista6]
as
select * from LibrosExt;
GO
/****** Object:  View [dbo].[vista7]    Script Date: 14/04/2019 03:14:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vista7]
as
select * from Mesa;
GO
/****** Object:  View [dbo].[vista8]    Script Date: 14/04/2019 03:14:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vista8]
as
select * from Multas;
GO
/****** Object:  View [dbo].[vista9]    Script Date: 14/04/2019 03:14:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vista9]
as
select * from Paqueteria;
GO
ALTER TABLE [dbo].[Computo]  WITH CHECK ADD FOREIGN KEY([clientesID])
REFERENCES [dbo].[Clientes] ([idCliente])
GO
ALTER TABLE [dbo].[Cubiculos]  WITH CHECK ADD FOREIGN KEY([ClientesId])
REFERENCES [dbo].[Clientes] ([idCliente])
GO
ALTER TABLE [dbo].[LibrosExt]  WITH CHECK ADD FOREIGN KEY([LibroP])
REFERENCES [dbo].[Libro] ([idLibro])
GO
ALTER TABLE [dbo].[Multas]  WITH CHECK ADD FOREIGN KEY([ClientesID])
REFERENCES [dbo].[Clientes] ([idCliente])
GO
ALTER TABLE [dbo].[Multas]  WITH CHECK ADD FOREIGN KEY([LibroID])
REFERENCES [dbo].[Libro] ([idLibro])
GO
ALTER TABLE [dbo].[Paqueteria]  WITH CHECK ADD FOREIGN KEY([clientesId])
REFERENCES [dbo].[Clientes] ([idCliente])
GO
ALTER TABLE [dbo].[Prestamo]  WITH CHECK ADD  CONSTRAINT [fk_fIdCiente] FOREIGN KEY([idCliente])
REFERENCES [dbo].[Clientes] ([idCliente])
GO
ALTER TABLE [dbo].[Prestamo] CHECK CONSTRAINT [fk_fIdCiente]
GO
ALTER TABLE [dbo].[Prestamo]  WITH CHECK ADD  CONSTRAINT [fk_fIdLibro] FOREIGN KEY([idLibro])
REFERENCES [dbo].[Libro] ([idLibro])
GO
ALTER TABLE [dbo].[Prestamo] CHECK CONSTRAINT [fk_fIdLibro]
GO
USE [master]
GO
ALTER DATABASE [LabBase] SET  READ_WRITE 
GO
