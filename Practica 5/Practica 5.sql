USE [master]
GO
/****** Object:  Database [LabBase]    Script Date: 14/04/2019 01:45:10 a. m. ******/
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
/****** Object:  Table [dbo].[Clientes]    Script Date: 14/04/2019 01:45:10 a. m. ******/
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
/****** Object:  Table [dbo].[Computo]    Script Date: 14/04/2019 01:45:10 a. m. ******/
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
/****** Object:  Table [dbo].[Cubiculos]    Script Date: 14/04/2019 01:45:10 a. m. ******/
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
/****** Object:  Table [dbo].[DonacionLibro]    Script Date: 14/04/2019 01:45:10 a. m. ******/
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
/****** Object:  Table [dbo].[Libro]    Script Date: 14/04/2019 01:45:10 a. m. ******/
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
/****** Object:  Table [dbo].[LibrosExt]    Script Date: 14/04/2019 01:45:10 a. m. ******/
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
/****** Object:  Table [dbo].[Mesa]    Script Date: 14/04/2019 01:45:10 a. m. ******/
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
/****** Object:  Table [dbo].[Multas]    Script Date: 14/04/2019 01:45:10 a. m. ******/
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
/****** Object:  Table [dbo].[Paqueteria]    Script Date: 14/04/2019 01:45:10 a. m. ******/
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
/****** Object:  Table [dbo].[Prestamo]    Script Date: 14/04/2019 01:45:10 a. m. ******/
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
SET IDENTITY_INSERT [dbo].[Clientes] ON 

INSERT [dbo].[Clientes] ([idCliente], [PrimNombre], [SegNombre], [PrimApellido], [SegApellido], [Edad], [Sexo]) VALUES (1, N'Valeria', N'Alondria', N'Peña', N'Nieto', 25, N'F')
INSERT [dbo].[Clientes] ([idCliente], [PrimNombre], [SegNombre], [PrimApellido], [SegApellido], [Edad], [Sexo]) VALUES (2, N'Diego', N'Alfredo', N'Ortiz', N'Dias', 19, N'M')
INSERT [dbo].[Clientes] ([idCliente], [PrimNombre], [SegNombre], [PrimApellido], [SegApellido], [Edad], [Sexo]) VALUES (3, N'Abel', N'Estrada', N'Hernandez', N'Rodriguez', 25, N'M')
INSERT [dbo].[Clientes] ([idCliente], [PrimNombre], [SegNombre], [PrimApellido], [SegApellido], [Edad], [Sexo]) VALUES (4, N'Alvaro', N'Emiliano', N'Peña', N'Mejia', 22, N'M')
INSERT [dbo].[Clientes] ([idCliente], [PrimNombre], [SegNombre], [PrimApellido], [SegApellido], [Edad], [Sexo]) VALUES (5, N'Mia', N'Elvia', N'Ramirez', N'Lugo', 18, N'F')
INSERT [dbo].[Clientes] ([idCliente], [PrimNombre], [SegNombre], [PrimApellido], [SegApellido], [Edad], [Sexo]) VALUES (6, N'Carolina', N'Guadalupe', N'Peñuela', N'Velazquez', 46, N'F')
INSERT [dbo].[Clientes] ([idCliente], [PrimNombre], [SegNombre], [PrimApellido], [SegApellido], [Edad], [Sexo]) VALUES (7, N'Daniel', N'Emmanuel', N'Ovalle', N'Hernandez', 33, N'M')
INSERT [dbo].[Clientes] ([idCliente], [PrimNombre], [SegNombre], [PrimApellido], [SegApellido], [Edad], [Sexo]) VALUES (8, N'Mariana', N'Cinthia', N'Camberos', N'Reyes', 19, N'F')
INSERT [dbo].[Clientes] ([idCliente], [PrimNombre], [SegNombre], [PrimApellido], [SegApellido], [Edad], [Sexo]) VALUES (9, N'Erick', N'Alejandro', N'Ortiz', N'Hernandez', 23, N'M')
INSERT [dbo].[Clientes] ([idCliente], [PrimNombre], [SegNombre], [PrimApellido], [SegApellido], [Edad], [Sexo]) VALUES (10, N'Emily', N'María', N'Perez', N'Velasco', 23, N'F')
INSERT [dbo].[Clientes] ([idCliente], [PrimNombre], [SegNombre], [PrimApellido], [SegApellido], [Edad], [Sexo]) VALUES (11, N'Valeria', N'Alondria', N'Peña', N'Nieto', 25, N'F')
INSERT [dbo].[Clientes] ([idCliente], [PrimNombre], [SegNombre], [PrimApellido], [SegApellido], [Edad], [Sexo]) VALUES (12, N'Diego', N'Alfredo', N'Ortiz', N'Dias', 19, N'M')
INSERT [dbo].[Clientes] ([idCliente], [PrimNombre], [SegNombre], [PrimApellido], [SegApellido], [Edad], [Sexo]) VALUES (13, N'Abel', N'Estrada', N'Hernandez', N'Rodriguez', 25, N'M')
INSERT [dbo].[Clientes] ([idCliente], [PrimNombre], [SegNombre], [PrimApellido], [SegApellido], [Edad], [Sexo]) VALUES (14, N'Alvaro', N'Emiliano', N'Peña', N'Mejia', 22, N'M')
INSERT [dbo].[Clientes] ([idCliente], [PrimNombre], [SegNombre], [PrimApellido], [SegApellido], [Edad], [Sexo]) VALUES (15, N'Mia', N'Elvia', N'Ramirez', N'Lugo', 18, N'F')
INSERT [dbo].[Clientes] ([idCliente], [PrimNombre], [SegNombre], [PrimApellido], [SegApellido], [Edad], [Sexo]) VALUES (16, N'Carolina', N'Guadalupe', N'Peñuela', N'Velazquez', 46, N'F')
INSERT [dbo].[Clientes] ([idCliente], [PrimNombre], [SegNombre], [PrimApellido], [SegApellido], [Edad], [Sexo]) VALUES (17, N'Daniel', N'Emmanuel', N'Ovalle', N'Hernandez', 33, N'M')
INSERT [dbo].[Clientes] ([idCliente], [PrimNombre], [SegNombre], [PrimApellido], [SegApellido], [Edad], [Sexo]) VALUES (18, N'Mariana', N'Cinthia', N'Camberos', N'Reyes', 19, N'F')
INSERT [dbo].[Clientes] ([idCliente], [PrimNombre], [SegNombre], [PrimApellido], [SegApellido], [Edad], [Sexo]) VALUES (19, N'Erick', N'Alejandro', N'Ortiz', N'Hernandez', 23, N'M')
INSERT [dbo].[Clientes] ([idCliente], [PrimNombre], [SegNombre], [PrimApellido], [SegApellido], [Edad], [Sexo]) VALUES (20, N'Emily', N'María', N'Perez', N'Velasco', 23, N'F')
INSERT [dbo].[Clientes] ([idCliente], [PrimNombre], [SegNombre], [PrimApellido], [SegApellido], [Edad], [Sexo]) VALUES (21, N'Daniela', N'Julia', N'Hernandez', N'Vazquez', 21, N'F')
SET IDENTITY_INSERT [dbo].[Clientes] OFF
SET IDENTITY_INSERT [dbo].[Computo] ON 

INSERT [dbo].[Computo] ([IDpc], [Disponible], [clientesID]) VALUES (1, N'no', 2)
INSERT [dbo].[Computo] ([IDpc], [Disponible], [clientesID]) VALUES (2, N'no', 1)
INSERT [dbo].[Computo] ([IDpc], [Disponible], [clientesID]) VALUES (3, N'no', 3)
INSERT [dbo].[Computo] ([IDpc], [Disponible], [clientesID]) VALUES (4, N'no', 5)
INSERT [dbo].[Computo] ([IDpc], [Disponible], [clientesID]) VALUES (5, N'no', 7)
INSERT [dbo].[Computo] ([IDpc], [Disponible], [clientesID]) VALUES (6, N'no', 6)
INSERT [dbo].[Computo] ([IDpc], [Disponible], [clientesID]) VALUES (7, N'no', 4)
INSERT [dbo].[Computo] ([IDpc], [Disponible], [clientesID]) VALUES (8, N'no', 8)
INSERT [dbo].[Computo] ([IDpc], [Disponible], [clientesID]) VALUES (9, N'no', 9)
INSERT [dbo].[Computo] ([IDpc], [Disponible], [clientesID]) VALUES (10, N'no', 10)
INSERT [dbo].[Computo] ([IDpc], [Disponible], [clientesID]) VALUES (11, N'no', 11)
SET IDENTITY_INSERT [dbo].[Computo] OFF
INSERT [dbo].[Cubiculos] ([ClientesId], [Cubiculo], [Disponible]) VALUES (3, 2, N'si')
INSERT [dbo].[Cubiculos] ([ClientesId], [Cubiculo], [Disponible]) VALUES (8, 1, N'si')
INSERT [dbo].[Cubiculos] ([ClientesId], [Cubiculo], [Disponible]) VALUES (7, 3, N'si')
INSERT [dbo].[Cubiculos] ([ClientesId], [Cubiculo], [Disponible]) VALUES (6, 7, N'si')
INSERT [dbo].[Cubiculos] ([ClientesId], [Cubiculo], [Disponible]) VALUES (5, 5, N'si')
INSERT [dbo].[Cubiculos] ([ClientesId], [Cubiculo], [Disponible]) VALUES (1, 4, N'si')
INSERT [dbo].[Cubiculos] ([ClientesId], [Cubiculo], [Disponible]) VALUES (10, 8, N'si')
INSERT [dbo].[Cubiculos] ([ClientesId], [Cubiculo], [Disponible]) VALUES (9, 6, N'si')
INSERT [dbo].[Cubiculos] ([ClientesId], [Cubiculo], [Disponible]) VALUES (2, 9, N'si')
INSERT [dbo].[Cubiculos] ([ClientesId], [Cubiculo], [Disponible]) VALUES (4, 10, N'si')
INSERT [dbo].[Cubiculos] ([ClientesId], [Cubiculo], [Disponible]) VALUES (11, 11, N'si')
INSERT [dbo].[DonacionLibro] ([Titulo], [Genero], [CantidadD]) VALUES (N'Android', N'Cientifico', 4)
INSERT [dbo].[DonacionLibro] ([Titulo], [Genero], [CantidadD]) VALUES (N'Musica', N'Educativo', 7)
INSERT [dbo].[DonacionLibro] ([Titulo], [Genero], [CantidadD]) VALUES (N'Blanca nieves', N'Cuento', 1)
INSERT [dbo].[DonacionLibro] ([Titulo], [Genero], [CantidadD]) VALUES (N'Cambio', N'Novela', 3)
INSERT [dbo].[DonacionLibro] ([Titulo], [Genero], [CantidadD]) VALUES (N'Up', N'Novela', 1)
INSERT [dbo].[DonacionLibro] ([Titulo], [Genero], [CantidadD]) VALUES (N'Miguel Hidalgo', N'Biografico', 1)
INSERT [dbo].[DonacionLibro] ([Titulo], [Genero], [CantidadD]) VALUES (N'Iglesias', N'Biografico', 1)
INSERT [dbo].[DonacionLibro] ([Titulo], [Genero], [CantidadD]) VALUES (N'Aprende a programar', N'Educativo', 1)
INSERT [dbo].[DonacionLibro] ([Titulo], [Genero], [CantidadD]) VALUES (N'Recetas', N'Cocina', 1)
INSERT [dbo].[DonacionLibro] ([Titulo], [Genero], [CantidadD]) VALUES (N'Aprende piano', N'Educativo', 1)
INSERT [dbo].[DonacionLibro] ([Titulo], [Genero], [CantidadD]) VALUES (N'Android', N'Cientifico', 4)
INSERT [dbo].[DonacionLibro] ([Titulo], [Genero], [CantidadD]) VALUES (N'Musica', N'Educativo', 7)
INSERT [dbo].[DonacionLibro] ([Titulo], [Genero], [CantidadD]) VALUES (N'Blanca nieves', N'Cuento', 1)
INSERT [dbo].[DonacionLibro] ([Titulo], [Genero], [CantidadD]) VALUES (N'Cambio', N'Novela', 3)
INSERT [dbo].[DonacionLibro] ([Titulo], [Genero], [CantidadD]) VALUES (N'Up', N'Novela', 1)
INSERT [dbo].[DonacionLibro] ([Titulo], [Genero], [CantidadD]) VALUES (N'Miguel Hidalgo', N'Biografico', 1)
INSERT [dbo].[DonacionLibro] ([Titulo], [Genero], [CantidadD]) VALUES (N'Iglesias', N'Biografico', 1)
INSERT [dbo].[DonacionLibro] ([Titulo], [Genero], [CantidadD]) VALUES (N'Aprende a programar', N'Educativo', 1)
INSERT [dbo].[DonacionLibro] ([Titulo], [Genero], [CantidadD]) VALUES (N'Recetas', N'Cocina', 1)
INSERT [dbo].[DonacionLibro] ([Titulo], [Genero], [CantidadD]) VALUES (N'Aprende piano', N'Educativo', 1)
INSERT [dbo].[DonacionLibro] ([Titulo], [Genero], [CantidadD]) VALUES (N'Aprende VIOLIN INTERMEDIO', N'Educativo', 1)
SET IDENTITY_INSERT [dbo].[Libro] ON 

INSERT [dbo].[Libro] ([idLibro], [Titulo], [Descripcion], [Disponible], [Genero], [Cantidad]) VALUES (1, N'Dime la verdad', N'Historia de un amor entre dos personas de distintas sociedades', N'S', N'Novela', 15)
INSERT [dbo].[Libro] ([idLibro], [Titulo], [Descripcion], [Disponible], [Genero], [Cantidad]) VALUES (2, N'Fundamentos de programación desde 0', N'fundamentos de programación', N'S', N'Cientifico', 10)
INSERT [dbo].[Libro] ([idLibro], [Titulo], [Descripcion], [Disponible], [Genero], [Cantidad]) VALUES (3, N'Una vida rica', N'fundamentos para su riqueza personal', N'S', N'Desarrollo personal', 13)
INSERT [dbo].[Libro] ([idLibro], [Titulo], [Descripcion], [Disponible], [Genero], [Cantidad]) VALUES (4, N'Focus', N'Como crear su propa riqueza', N'S', N'Desarrollo personal', 1)
INSERT [dbo].[Libro] ([idLibro], [Titulo], [Descripcion], [Disponible], [Genero], [Cantidad]) VALUES (5, N'El principito', N'Las aventuras de un niño en el espacio entre planetas', N'S', N'Fantasía', 5)
INSERT [dbo].[Libro] ([idLibro], [Titulo], [Descripcion], [Disponible], [Genero], [Cantidad]) VALUES (6, N'El universo', N'como se creo la vida', N'S', N'Cientifico', 20)
INSERT [dbo].[Libro] ([idLibro], [Titulo], [Descripcion], [Disponible], [Genero], [Cantidad]) VALUES (7, N'Enfermedades del siglo XX', N'Como las superbacterias serán un problema de salud a nivel global', N'S', N'Cientifico', 19)
INSERT [dbo].[Libro] ([idLibro], [Titulo], [Descripcion], [Disponible], [Genero], [Cantidad]) VALUES (8, N'Cuidado', N'novela de terror en un bosque', N'S', N'Novela', 20)
INSERT [dbo].[Libro] ([idLibro], [Titulo], [Descripcion], [Disponible], [Genero], [Cantidad]) VALUES (9, N'No vuelva mas', N'como superar a tu ex', N'S', N'Auto Ayuda', 17)
INSERT [dbo].[Libro] ([idLibro], [Titulo], [Descripcion], [Disponible], [Genero], [Cantidad]) VALUES (10, N'Como ser millanario', N'como cuidar su dinero', N'S', N'Desarrollo personal', 19)
INSERT [dbo].[Libro] ([idLibro], [Titulo], [Descripcion], [Disponible], [Genero], [Cantidad]) VALUES (11, N'PNL', N'apreda como cultivar su memoria', N'S', N'Desarrollo personal', 10)
SET IDENTITY_INSERT [dbo].[Libro] OFF
INSERT [dbo].[LibrosExt] ([FechaExt], [LibroP]) VALUES (N'05/06/19', 1)
INSERT [dbo].[LibrosExt] ([FechaExt], [LibroP]) VALUES (N'03/06/19', 2)
INSERT [dbo].[LibrosExt] ([FechaExt], [LibroP]) VALUES (N'03/04/19', 3)
INSERT [dbo].[LibrosExt] ([FechaExt], [LibroP]) VALUES (N'15/12/19', 4)
INSERT [dbo].[LibrosExt] ([FechaExt], [LibroP]) VALUES (N'05/12/19', 5)
INSERT [dbo].[LibrosExt] ([FechaExt], [LibroP]) VALUES (N'08/11/19', 6)
INSERT [dbo].[LibrosExt] ([FechaExt], [LibroP]) VALUES (N'23/06/19', 7)
INSERT [dbo].[LibrosExt] ([FechaExt], [LibroP]) VALUES (N'12/06/19', 8)
INSERT [dbo].[LibrosExt] ([FechaExt], [LibroP]) VALUES (N'31/01/19', 9)
INSERT [dbo].[LibrosExt] ([FechaExt], [LibroP]) VALUES (N'05/06/19', 10)
INSERT [dbo].[LibrosExt] ([FechaExt], [LibroP]) VALUES (N'12/03/19', 11)
INSERT [dbo].[Mesa] ([Mesa], [Disponible]) VALUES (1, N'si')
INSERT [dbo].[Mesa] ([Mesa], [Disponible]) VALUES (2, N'si')
INSERT [dbo].[Mesa] ([Mesa], [Disponible]) VALUES (3, N'si')
INSERT [dbo].[Mesa] ([Mesa], [Disponible]) VALUES (4, N'si')
INSERT [dbo].[Mesa] ([Mesa], [Disponible]) VALUES (5, N'si')
INSERT [dbo].[Mesa] ([Mesa], [Disponible]) VALUES (6, N'si')
INSERT [dbo].[Mesa] ([Mesa], [Disponible]) VALUES (7, N'si')
INSERT [dbo].[Mesa] ([Mesa], [Disponible]) VALUES (8, N'si')
INSERT [dbo].[Mesa] ([Mesa], [Disponible]) VALUES (9, N'si')
INSERT [dbo].[Mesa] ([Mesa], [Disponible]) VALUES (10, N'si')
INSERT [dbo].[Mesa] ([Mesa], [Disponible]) VALUES (11, N'si')
INSERT [dbo].[Multas] ([FechaPrest], [FechaLimDev], [FechaDev], [Adeudo], [ClientesID], [LibroID]) VALUES (N'14/01/19', N'15/02/19', N'26/02/19', 100, 1, 1)
INSERT [dbo].[Multas] ([FechaPrest], [FechaLimDev], [FechaDev], [Adeudo], [ClientesID], [LibroID]) VALUES (N'13/04/19', N'15/05/19', N'20/05/19', 0, 2, 2)
INSERT [dbo].[Multas] ([FechaPrest], [FechaLimDev], [FechaDev], [Adeudo], [ClientesID], [LibroID]) VALUES (N'03/03/19', N'03/03/19', N'03/03/19', 33, 3, 3)
INSERT [dbo].[Multas] ([FechaPrest], [FechaLimDev], [FechaDev], [Adeudo], [ClientesID], [LibroID]) VALUES (N'01/06/19', N'08/06/19', N'12/06/19', 45, 4, 4)
INSERT [dbo].[Multas] ([FechaPrest], [FechaLimDev], [FechaDev], [Adeudo], [ClientesID], [LibroID]) VALUES (N'11/01/19', N'05/02/19', N'11/02/19', 1234, 5, 5)
INSERT [dbo].[Multas] ([FechaPrest], [FechaLimDev], [FechaDev], [Adeudo], [ClientesID], [LibroID]) VALUES (N'11/04/19', N'05/04/19', N'12/04/19', 26, 6, 6)
INSERT [dbo].[Multas] ([FechaPrest], [FechaLimDev], [FechaDev], [Adeudo], [ClientesID], [LibroID]) VALUES (N'11/04/19', N'05/04/19', N'12/04/19', 436, 7, 7)
INSERT [dbo].[Multas] ([FechaPrest], [FechaLimDev], [FechaDev], [Adeudo], [ClientesID], [LibroID]) VALUES (N'01/06/19', N'08/06/19', N'12/06/19', 23, 8, 8)
INSERT [dbo].[Multas] ([FechaPrest], [FechaLimDev], [FechaDev], [Adeudo], [ClientesID], [LibroID]) VALUES (N'03/06/19', N'08/06/19', N'12/06/19', 89, 9, 9)
INSERT [dbo].[Multas] ([FechaPrest], [FechaLimDev], [FechaDev], [Adeudo], [ClientesID], [LibroID]) VALUES (N'05/06/19', N'08/06/19', N'12/06/19', 8, 10, 10)
INSERT [dbo].[Multas] ([FechaPrest], [FechaLimDev], [FechaDev], [Adeudo], [ClientesID], [LibroID]) VALUES (N'05/06/11', N'08/06/11', N'12/06/11', 111111, 11, 11)
SET IDENTITY_INSERT [dbo].[Paqueteria] ON 

INSERT [dbo].[Paqueteria] ([LockerID], [clientesId]) VALUES (1, 1)
INSERT [dbo].[Paqueteria] ([LockerID], [clientesId]) VALUES (2, 1)
INSERT [dbo].[Paqueteria] ([LockerID], [clientesId]) VALUES (3, 6)
INSERT [dbo].[Paqueteria] ([LockerID], [clientesId]) VALUES (4, 5)
INSERT [dbo].[Paqueteria] ([LockerID], [clientesId]) VALUES (5, 7)
INSERT [dbo].[Paqueteria] ([LockerID], [clientesId]) VALUES (6, 2)
INSERT [dbo].[Paqueteria] ([LockerID], [clientesId]) VALUES (7, 8)
INSERT [dbo].[Paqueteria] ([LockerID], [clientesId]) VALUES (8, 9)
INSERT [dbo].[Paqueteria] ([LockerID], [clientesId]) VALUES (9, 3)
INSERT [dbo].[Paqueteria] ([LockerID], [clientesId]) VALUES (10, 10)
INSERT [dbo].[Paqueteria] ([LockerID], [clientesId]) VALUES (11, 4)
SET IDENTITY_INSERT [dbo].[Paqueteria] OFF
SET IDENTITY_INSERT [dbo].[Prestamo] ON 

INSERT [dbo].[Prestamo] ([idPrestamos], [idCliente], [idLibro], [FechaPrestamo], [fechaLimDev], [FechaDev]) VALUES (1, 1, 1, N'13/04/19', N'15/05/19', N'20/05/19')
INSERT [dbo].[Prestamo] ([idPrestamos], [idCliente], [idLibro], [FechaPrestamo], [fechaLimDev], [FechaDev]) VALUES (2, 2, 2, N'11/04/19', N'15/04/19', N'20/04/19')
INSERT [dbo].[Prestamo] ([idPrestamos], [idCliente], [idLibro], [FechaPrestamo], [fechaLimDev], [FechaDev]) VALUES (3, 3, 3, N'14/04/19', N'16/04/19', N'22/04/19')
INSERT [dbo].[Prestamo] ([idPrestamos], [idCliente], [idLibro], [FechaPrestamo], [fechaLimDev], [FechaDev]) VALUES (4, 4, 4, N'11/04/19', N'05/04/19', N'12/04/19')
INSERT [dbo].[Prestamo] ([idPrestamos], [idCliente], [idLibro], [FechaPrestamo], [fechaLimDev], [FechaDev]) VALUES (5, 5, 5, N'11/04/19', N'05/04/19', N'11/04/19')
INSERT [dbo].[Prestamo] ([idPrestamos], [idCliente], [idLibro], [FechaPrestamo], [fechaLimDev], [FechaDev]) VALUES (6, 6, 6, N'11/04/19', N'05/04/19', N'12/04/19')
INSERT [dbo].[Prestamo] ([idPrestamos], [idCliente], [idLibro], [FechaPrestamo], [fechaLimDev], [FechaDev]) VALUES (7, 7, 7, N'01/07/19', N'08/07/19', N'12/07/19')
INSERT [dbo].[Prestamo] ([idPrestamos], [idCliente], [idLibro], [FechaPrestamo], [fechaLimDev], [FechaDev]) VALUES (8, 8, 8, N'11/01/19', N'05/02/19', N'11/02/19')
INSERT [dbo].[Prestamo] ([idPrestamos], [idCliente], [idLibro], [FechaPrestamo], [fechaLimDev], [FechaDev]) VALUES (9, 9, 9, N'14/01/19', N'15/02/19', N'26/02/19')
INSERT [dbo].[Prestamo] ([idPrestamos], [idCliente], [idLibro], [FechaPrestamo], [fechaLimDev], [FechaDev]) VALUES (10, 10, 10, N'01/06/19', N'08/06/19', N'12/06/19')
INSERT [dbo].[Prestamo] ([idPrestamos], [idCliente], [idLibro], [FechaPrestamo], [fechaLimDev], [FechaDev]) VALUES (11, 11, 11, N'01/06/19', N'08/06/19', N'12/06/19')
SET IDENTITY_INSERT [dbo].[Prestamo] OFF
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
