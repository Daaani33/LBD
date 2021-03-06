/****** Object:  StoredProcedure [dbo].[ReporteCantidadDeLibrosPorGenero]    Script Date: 19/04/2019 13:35:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ReporteCantidadDeLibrosPorGenero]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ReporteCantidadDeLibrosPorGenero]
	@genero [varchar](50)
WITH EXECUTE AS CALLER
AS
begin
select Genero.vGenero, COUNT(Libro.IdLibro) as CantidadDeLibrosPorGenero
from Libro
join Genero on Libro.IdGenero = Genero.IdGenero
where Genero.vGenero = @genero
GROUP BY  vGenero
end' 
END
GO
/****** Object:  StoredProcedure [dbo].[ReporteEntregaMasRapida]    Script Date: 19/04/2019 13:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ReporteEntregaMasRapida]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ReporteEntregaMasRapida]
	@matricula [int]
WITH EXECUTE AS CALLER
AS
begin
select Estudiante.Matricula, MIN(Prestamo.Entrega) as EntregaMasRapida
from Prestamo
join Estudiante on Prestamo.IdAlumno = Estudiante.IdAlumno
where Estudiante.Matricula = @matricula
GROUP BY Matricula
ORDER BY MIN(Prestamo.Entrega)
end' 
END
GO
/****** Object:  StoredProcedure [dbo].[ReporteLibroInfoAutor]    Script Date: 19/04/2019 13:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ReporteLibroInfoAutor]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ReporteLibroInfoAutor]
WITH EXECUTE AS CALLER
AS
begin
select Libro.Titulo, Autor.*
from Libro
right join Autor on Libro.IdAutor = Autor.IdAutor
end' 
END
GO
/****** Object:  StoredProcedure [dbo].[ReporteLibrosPorAutor]    Script Date: 19/04/2019 13:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ReporteLibrosPorAutor]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ReporteLibrosPorAutor]
	@nombre [varchar](50)
WITH EXECUTE AS CALLER
AS
begin
select Autor.Nombre_Autor, COUNT(Libro.IdLibro) as LibrosPorAutor
from Libro
join Autor on Libro.IdAutor = Autor.IdAutor
where Autor.Nombre_Autor = @nombre
GROUP BY  Nombre_Autor
end' 
END
GO
/****** Object:  StoredProcedure [dbo].[ReporteMaximoDeVecesPrestado]    Script Date: 19/04/2019 13:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ReporteMaximoDeVecesPrestado]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ReporteMaximoDeVecesPrestado]
	@titulo [varchar](50)
WITH EXECUTE AS CALLER
AS
begin
select Libro.Titulo, COUNT(Prestamo.IdPrestamo) as MaximoDeVecesPrestado
from Prestamo
join Libro on Prestamo.IdLibro = Libro.IdLibro
where Libro.Titulo = @titulo
GROUP BY Titulo
end' 
END
GO
/****** Object:  StoredProcedure [dbo].[ReporteMinimaMulta]    Script Date: 19/04/2019 13:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ReporteMinimaMulta]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ReporteMinimaMulta]
	@matricula [int]
WITH EXECUTE AS CALLER
AS
begin
select Estudiante.Matricula, MIN(Multa.Cargo) as MinimaMulta
from Multa
left join Estudiante on Multa.IdAlumno = Estudiante.IdAlumno
where Estudiante.Matricula = @matricula
GROUP BY Matricula
ORDER BY MIN(Multa.Cargo)
end' 
END
GO
/****** Object:  StoredProcedure [dbo].[ReporteMultaMayor]    Script Date: 19/04/2019 13:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ReporteMultaMayor]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ReporteMultaMayor]
WITH EXECUTE AS CALLER
AS
begin
select Estudiante.Matricula, Multa.Cargo
from Multa
join Estudiante on Multa.IdAlumno = Estudiante.IdAlumno
where Multa.Cargo > 50.0000
end' 
END
GO
/****** Object:  StoredProcedure [dbo].[ReporteNumeroDeAlumnosQueTomaEsteLibro]    Script Date: 19/04/2019 13:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ReporteNumeroDeAlumnosQueTomaEsteLibro]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ReporteNumeroDeAlumnosQueTomaEsteLibro]
	@titulo [varchar](50)
WITH EXECUTE AS CALLER
AS
begin
select Libro.Titulo, SUM(Prestamo.IdAlumno) as NumeroDeAlumnosQueTomaEsteLibro
from Libro 
join Prestamo on Prestamo.IdLibro = Libro.IdLibro
where Libro.Titulo = @titulo
GROUP BY Titulo
end' 
END
GO
/****** Object:  StoredProcedure [dbo].[ReportePromedioDeMultaPorLibro]    Script Date: 19/04/2019 13:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ReportePromedioDeMultaPorLibro]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ReportePromedioDeMultaPorLibro]
	@titulo [varchar](50)
WITH EXECUTE AS CALLER
AS
begin
select Libro.Titulo, AVG(Multa.Cargo) as PromedioDeMultaPorLibro
from Multa
join Libro on Multa.IdLibro = Libro.IdLibro
where Libro.Titulo = @titulo
GROUP BY Titulo
end' 
END
GO
/****** Object:  StoredProcedure [dbo].[ReporteSumaDeFacturasPorAlumno]    Script Date: 19/04/2019 13:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ReporteSumaDeFacturasPorAlumno]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ReporteSumaDeFacturasPorAlumno]
	@matricula [int]
WITH EXECUTE AS CALLER
AS
begin
select  Estudiante.Matricula, Sum(Factura.IdFactura) as SumaDeFacturasPorAlumno
from Factura
join Estudiante on Factura.IdAlumno = Estudiante.IdAlumno
where Estudiante.Matricula = @matricula 
GROUP BY Matricula
end' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fnDividir]    Script Date: 19/04/2019 13:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fnDividir]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[fnDividir](@n1 [int], @n2 [int])
RETURNS [decimal](10, 3) WITH EXECUTE AS CALLER
AS 
begin
	return @n1/@n2
end' 
END

GO
/****** Object:  Table [dbo].[Autor]    Script Date: 19/04/2019 13:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Autor]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Autor](
	[IdAutor] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Autor] [varchar](50) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Apellido_Autor] [varchar](50) COLLATE Modern_Spanish_CI_AS NOT NULL,
 CONSTRAINT [PK__Autor__DD33B0314D9F5159] PRIMARY KEY CLUSTERED 
(
	[IdAutor] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)
END
GO
/****** Object:  Table [dbo].[Carrera]    Script Date: 19/04/2019 13:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Carrera]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Carrera](
	[IdCarrera] [int] IDENTITY(1,1) NOT NULL,
	[vCarrera] [varchar](50) COLLATE Modern_Spanish_CI_AS NOT NULL,
 CONSTRAINT [PK__Carrera__884A8F1F5E76FF34] PRIMARY KEY CLUSTERED 
(
	[IdCarrera] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)
END
GO
/****** Object:  Table [dbo].[Editorial]    Script Date: 19/04/2019 13:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Editorial]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Editorial](
	[IdEditorial] [int] IDENTITY(1,1) NOT NULL,
	[Empresa] [varchar](50) COLLATE Modern_Spanish_CI_AS NOT NULL,
 CONSTRAINT [PK__Editoria__EF8386714CAFF088] PRIMARY KEY CLUSTERED 
(
	[IdEditorial] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)
END
GO
/****** Object:  Table [dbo].[Estudiante]    Script Date: 19/04/2019 13:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Estudiante]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Estudiante](
	[IdAlumno] [int] IDENTITY(1,1) NOT NULL,
	[Matricula] [int] NOT NULL,
	[IdCarrera] [int] NOT NULL,
	[Apellido_A] [varchar](50) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Apellido2_A] [varchar](50) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[cStatus_A] [char](1) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Sexo] [char](1) COLLATE Modern_Spanish_CI_AS NULL,
	[Nombre_A] [varchar](50) COLLATE Modern_Spanish_CI_AS NOT NULL,
 CONSTRAINT [PK__Estudian__460B474021ED5F28] PRIMARY KEY CLUSTERED 
(
	[IdAlumno] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)
END
GO
/****** Object:  Table [dbo].[Factura]    Script Date: 19/04/2019 13:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Factura]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Factura](
	[IdFactura] [int] IDENTITY(1,1) NOT NULL,
	[fecha_Factura] [date] NOT NULL,
	[IdPrestamo] [int] NOT NULL,
	[IdAlumno] [int] NOT NULL,
 CONSTRAINT [PK__Factura__50E7BAF1F170C472] PRIMARY KEY CLUSTERED 
(
	[IdFactura] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)
END
GO
/****** Object:  Table [dbo].[Genero]    Script Date: 19/04/2019 13:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Genero]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Genero](
	[IdGenero] [int] IDENTITY(1,1) NOT NULL,
	[vGenero] [varchar](50) COLLATE Modern_Spanish_CI_AS NOT NULL,
 CONSTRAINT [PK__Genero__0F834988A8512532] PRIMARY KEY CLUSTERED 
(
	[IdGenero] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)
END
GO
/****** Object:  Table [dbo].[Libro]    Script Date: 19/04/2019 13:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Libro]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Libro](
	[IdLibro] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [varchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[ISBN] [int] NULL,
	[IdAutor] [int] NOT NULL,
	[IdEditorial] [int] NOT NULL,
	[cStatus_L] [char](1) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[IdSector] [int] NOT NULL,
	[IdGenero] [int] NOT NULL,
 CONSTRAINT [PK__Libro__3E0B49AD67493C0F] PRIMARY KEY CLUSTERED 
(
	[IdLibro] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)
END
GO
/****** Object:  Table [dbo].[Multa]    Script Date: 19/04/2019 13:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Multa]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Multa](
	[IdMulta] [int] IDENTITY(1,1) NOT NULL,
	[Cargo] [money] NOT NULL,
	[IdLibro] [int] NOT NULL,
	[IdAlumno] [int] NOT NULL,
	[IdPrestamo] [int] NOT NULL,
 CONSTRAINT [PK__Multa__2F525A8C0BCDE585] PRIMARY KEY CLUSTERED 
(
	[IdMulta] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)
END
GO
/****** Object:  Table [dbo].[Prestamo]    Script Date: 19/04/2019 13:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Prestamo]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Prestamo](
	[IdPrestamo] [int] IDENTITY(1,1) NOT NULL,
	[Fecha_Prestamo] [date] NOT NULL,
	[Fecha_Exp] [date] NOT NULL,
	[Entrega] [date] NOT NULL,
	[IdAlumno] [int] NOT NULL,
	[IdLibro] [int] NOT NULL,
 CONSTRAINT [PK__Prestamo__6FF194C0DE2E92C9] PRIMARY KEY CLUSTERED 
(
	[IdPrestamo] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)
END
GO
/****** Object:  Table [dbo].[Sector]    Script Date: 19/04/2019 13:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sector]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Sector](
	[IdSector] [int] IDENTITY(1,1) NOT NULL,
	[Seccion] [varchar](50) COLLATE Modern_Spanish_CI_AS NULL,
 CONSTRAINT [PK__Sector__D0011C18753BF85A] PRIMARY KEY CLUSTERED 
(
	[IdSector] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)
END
GO
/****** Object:  View [dbo].[AutorView]    Script Date: 19/04/2019 13:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[AutorView]'))
EXEC dbo.sp_executesql @statement = N'create view [dbo].[AutorView] as 
select a.*
from Autor a
' 
GO
/****** Object:  View [dbo].[CarreraView]    Script Date: 19/04/2019 13:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[CarreraView]'))
EXEC dbo.sp_executesql @statement = N'create view [dbo].[CarreraView] as 
select c.*
from Carrera c
' 
GO
/****** Object:  View [dbo].[EditorialView]    Script Date: 19/04/2019 13:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[EditorialView]'))
EXEC dbo.sp_executesql @statement = N'create view [dbo].[EditorialView] as 
select e.*
from Editorial e
' 
GO
/****** Object:  View [dbo].[EstudianteView]    Script Date: 19/04/2019 13:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[EstudianteView]'))
EXEC dbo.sp_executesql @statement = N'create view [dbo].[EstudianteView] as 
select e.*, Carrera.vCarrera 
from Estudiante e
join Carrera on e.IdCarrera = Carrera.IdCarrera
' 
GO
/****** Object:  View [dbo].[FacturaView]    Script Date: 19/04/2019 13:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[FacturaView]'))
EXEC dbo.sp_executesql @statement = N'create view [dbo].[FacturaView] as 
select f.IdFactura, f.fecha_Factura, Prestamo.*, Estudiante.Matricula
from Factura f
join Prestamo on f.IdPrestamo = Prestamo.IdPrestamo
join Estudiante on f.IdAlumno = Estudiante.IdAlumno
' 
GO
/****** Object:  View [dbo].[GeneroView]    Script Date: 19/04/2019 13:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[GeneroView]'))
EXEC dbo.sp_executesql @statement = N'create view [dbo].[GeneroView] as 
select g.*
from Genero g
' 
GO
/****** Object:  View [dbo].[InfoLib]    Script Date: 19/04/2019 13:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[InfoLib]'))
EXEC dbo.sp_executesql @statement = N'create view [dbo].[InfoLib] as select l.IdLibro, l.Titulo, l.ISBN, a.Nombre_Autor, e.Empresa, l.cStatus_L, g.vGenero from Libro l,Genero g,Autor a,Editorial e
where l.IdLibro = IdLibro' 
GO
/****** Object:  View [dbo].[InfoLib2]    Script Date: 19/04/2019 13:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[InfoLib2]'))
EXEC dbo.sp_executesql @statement = N'create view [dbo].[InfoLib2] as select l.IdLibro, l.Titulo, l.ISBN, a.Nombre_Autor, e.Empresa, l.cStatus_L, g.vGenero from Libro l,Genero g,Autor a,Editorial e
where l.IdLibro = IdLibro and l.IdAutor = a.IdAutor and l.IdEditorial = e.IdEditorial and l.IdGenero = g.IdGenero' 
GO
/****** Object:  View [dbo].[InfoLibros]    Script Date: 19/04/2019 13:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[InfoLibros]'))
EXEC dbo.sp_executesql @statement = N'create view [dbo].[InfoLibros] as select idLibro, Titulo, ISBN, IdAutor, IdEditorial, cStatus_L, IdGenero from Libro
where IdLibro = IdLibro' 
GO
/****** Object:  View [dbo].[LibroView]    Script Date: 19/04/2019 13:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[LibroView]'))
EXEC dbo.sp_executesql @statement = N'create view [dbo].[LibroView] as
select l.IdLibro, l.Titulo, l.ISBN, Autor.Nombre_Autor, Autor.Apellido_Autor, Editorial.Empresa, 
		l.cStatus_L, Sector.Seccion, Genero.vGenero
from Libro l
join Autor on l.IdAutor = Autor.IdAutor
join Editorial on l.IdEditorial = Editorial.IdEditorial
join Sector on l.IdSector = Sector.IdSector
join Genero on l.IdGenero = Genero.IdGenero
' 
GO
/****** Object:  View [dbo].[MultaView]    Script Date: 19/04/2019 13:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[MultaView]'))
EXEC dbo.sp_executesql @statement = N'create view [dbo].[MultaView] as
select m.IdMulta, m.Cargo, Libro.Titulo, Estudiante.Matricula, Prestamo.IdPrestamo
from Multa m
join Estudiante on m.IdAlumno = Estudiante.IdAlumno
join Libro on m.IdLibro = Libro.IdLibro
join Prestamo on m.IdPrestamo = Prestamo.IdPrestamo
' 
GO
/****** Object:  View [dbo].[PrestamoView]    Script Date: 19/04/2019 13:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[PrestamoView]'))
EXEC dbo.sp_executesql @statement = N'create view [dbo].[PrestamoView] as 
select p.IdPrestamo, p.Fecha_Prestamo, p.Fecha_Exp, p.Entrega, Estudiante.Matricula, Libro.Titulo
from Prestamo p
join Estudiante on p.IdAlumno = Estudiante.IdAlumno
join Libro on p.IdLibro = Libro.IdLibro
' 
GO
/****** Object:  View [dbo].[SectorView]    Script Date: 19/04/2019 13:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[SectorView]'))
EXEC dbo.sp_executesql @statement = N'create view [dbo].[SectorView] as 
select s.*
from Sector s
' 
GO
SET IDENTITY_INSERT [dbo].[Autor] ON 

INSERT [dbo].[Autor] ([IdAutor], [Nombre_Autor], [Apellido_Autor]) VALUES (1, N'Stephen', N'King')
INSERT [dbo].[Autor] ([IdAutor], [Nombre_Autor], [Apellido_Autor]) VALUES (2, N'Dross', N'Rootzank')
INSERT [dbo].[Autor] ([IdAutor], [Nombre_Autor], [Apellido_Autor]) VALUES (3, N'Juanito', N'Banana')
INSERT [dbo].[Autor] ([IdAutor], [Nombre_Autor], [Apellido_Autor]) VALUES (4, N'Uziel', N'Peñuela')
INSERT [dbo].[Autor] ([IdAutor], [Nombre_Autor], [Apellido_Autor]) VALUES (5, N'Victor', N'Martinez')
INSERT [dbo].[Autor] ([IdAutor], [Nombre_Autor], [Apellido_Autor]) VALUES (6, N'Dan', N'Brown')
INSERT [dbo].[Autor] ([IdAutor], [Nombre_Autor], [Apellido_Autor]) VALUES (7, N'Octavio', N'Paz')
INSERT [dbo].[Autor] ([IdAutor], [Nombre_Autor], [Apellido_Autor]) VALUES (8, N'Gael', N'Marquez')
INSERT [dbo].[Autor] ([IdAutor], [Nombre_Autor], [Apellido_Autor]) VALUES (9, N'Joseph', N'Conrad')
INSERT [dbo].[Autor] ([IdAutor], [Nombre_Autor], [Apellido_Autor]) VALUES (10, N'John', N'Wick')
INSERT [dbo].[Autor] ([IdAutor], [Nombre_Autor], [Apellido_Autor]) VALUES (11, N'Hugo', N'Garcia')
INSERT [dbo].[Autor] ([IdAutor], [Nombre_Autor], [Apellido_Autor]) VALUES (12, N'Uziel', N'Martinez')
INSERT [dbo].[Autor] ([IdAutor], [Nombre_Autor], [Apellido_Autor]) VALUES (13, N'Victor', N'Garza')
INSERT [dbo].[Autor] ([IdAutor], [Nombre_Autor], [Apellido_Autor]) VALUES (14, N'Bruce', N'Araujo')
INSERT [dbo].[Autor] ([IdAutor], [Nombre_Autor], [Apellido_Autor]) VALUES (15, N'Steve', N'King')
INSERT [dbo].[Autor] ([IdAutor], [Nombre_Autor], [Apellido_Autor]) VALUES (16, N'Malcom', N'Wilkerson')
INSERT [dbo].[Autor] ([IdAutor], [Nombre_Autor], [Apellido_Autor]) VALUES (17, N'Reese', N'Wilkerson')
INSERT [dbo].[Autor] ([IdAutor], [Nombre_Autor], [Apellido_Autor]) VALUES (18, N'Hall', N'Wilkerson')
INSERT [dbo].[Autor] ([IdAutor], [Nombre_Autor], [Apellido_Autor]) VALUES (19, N'Wilson', N'Wilkerson')
INSERT [dbo].[Autor] ([IdAutor], [Nombre_Autor], [Apellido_Autor]) VALUES (20, N'Veigar', N'Dreyar')
SET IDENTITY_INSERT [dbo].[Autor] OFF
SET IDENTITY_INSERT [dbo].[Carrera] ON 

INSERT [dbo].[Carrera] ([IdCarrera], [vCarrera]) VALUES (1, N'LCC')
INSERT [dbo].[Carrera] ([IdCarrera], [vCarrera]) VALUES (2, N'LMAD')
INSERT [dbo].[Carrera] ([IdCarrera], [vCarrera]) VALUES (3, N'LA')
INSERT [dbo].[Carrera] ([IdCarrera], [vCarrera]) VALUES (4, N'LSTI')
INSERT [dbo].[Carrera] ([IdCarrera], [vCarrera]) VALUES (5, N'LM')
INSERT [dbo].[Carrera] ([IdCarrera], [vCarrera]) VALUES (6, N'LF')
SET IDENTITY_INSERT [dbo].[Carrera] OFF
SET IDENTITY_INSERT [dbo].[Editorial] ON 

INSERT [dbo].[Editorial] ([IdEditorial], [Empresa]) VALUES (1, N'Gedisa')
INSERT [dbo].[Editorial] ([IdEditorial], [Empresa]) VALUES (2, N'Inde')
INSERT [dbo].[Editorial] ([IdEditorial], [Empresa]) VALUES (3, N'Routledge')
INSERT [dbo].[Editorial] ([IdEditorial], [Empresa]) VALUES (4, N'Oxford University Press')
INSERT [dbo].[Editorial] ([IdEditorial], [Empresa]) VALUES (5, N'Siglo XXI')
INSERT [dbo].[Editorial] ([IdEditorial], [Empresa]) VALUES (6, N'Wilson Editorial')
INSERT [dbo].[Editorial] ([IdEditorial], [Empresa]) VALUES (7, N'CSIC')
INSERT [dbo].[Editorial] ([IdEditorial], [Empresa]) VALUES (8, N'McGraw-Hill')
INSERT [dbo].[Editorial] ([IdEditorial], [Empresa]) VALUES (9, N'Trotta')
INSERT [dbo].[Editorial] ([IdEditorial], [Empresa]) VALUES (10, N'Arco Libros')
INSERT [dbo].[Editorial] ([IdEditorial], [Empresa]) VALUES (11, N'Trea')
INSERT [dbo].[Editorial] ([IdEditorial], [Empresa]) VALUES (12, N'Los Libros de la Catarata')
INSERT [dbo].[Editorial] ([IdEditorial], [Empresa]) VALUES (13, N'Universidad de Alcalá')
INSERT [dbo].[Editorial] ([IdEditorial], [Empresa]) VALUES (14, N'Istmo')
INSERT [dbo].[Editorial] ([IdEditorial], [Empresa]) VALUES (15, N'Routledge')
INSERT [dbo].[Editorial] ([IdEditorial], [Empresa]) VALUES (16, N'Fundación BBVA')
INSERT [dbo].[Editorial] ([IdEditorial], [Empresa]) VALUES (17, N'Visor')
INSERT [dbo].[Editorial] ([IdEditorial], [Empresa]) VALUES (18, N'John Benjamins Publishing')
INSERT [dbo].[Editorial] ([IdEditorial], [Empresa]) VALUES (19, N'Universidad de Oviedo')
INSERT [dbo].[Editorial] ([IdEditorial], [Empresa]) VALUES (20, N'Akal')
SET IDENTITY_INSERT [dbo].[Editorial] OFF
SET IDENTITY_INSERT [dbo].[Estudiante] ON 

INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (1, 1234567, 1, N'Martinez', N'Garcia', N'1', N'M', N'Victor Hugo')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (2, 1234967, 1, N'Martinez', N'Gutierrez', N'0', N'M', N'Hugo')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (3, 1244467, 1, N'Garcia', N'Gutierrez', N'1', N'M', N'Victor')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (4, 1234568, 1, N'Aguilar', N'Acevedo', N'1', N'M', N'MANUEL')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (5, 1234569, 2, N'Acevedo', N'Aguilar', N'0', N'F', N'MARGARITA')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (6, 1234570, 3, N'Aguilar', N'Garcia', N'1', N'F', N'MARÍA DEL CARMEN')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (7, 1234571, 4, N'Canto', N'Garcia', N'1', N'M', N'FERNANDO')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (8, 1234572, 5, N'Martinez', N'Canto', N'1', N'M', N'ROBERTO ')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (9, 1234573, 6, N'Martinez', N'Garcia', N'1', N'M', N'CARLOS')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (10, 1234574, 1, N'Acosta', N'Garcia', N'1', N'M', N'EDUARDO ')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (11, 1234575, 2, N'Alvarro', N'Acosta', N'0', N'M', N'RAFAEL')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (12, 1234576, 3, N'Martinez', N'Alvarado', N'1', N'M', N'DAVID ')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (13, 1234577, 4, N'Alvarado', N'Garcia', N'1', N'F', N'JOSEFINA')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (14, 1234578, 5, N'Altamirano', N'Alvarro', N'1', N'M', N'FRANCISCO JAVIER')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (15, 1234579, 6, N'Altamirano', N'Mendoza', N'1', N'M', N'MARIO')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (16, 1234580, 1, N'Medellín', N'Mendoza', N'1', N'M', N'ARMANDO')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (17, 1234581, 2, N'Medellín', N'Villanueva', N'1', N'F', N'MARTHA')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (18, 1234582, 3, N'Martinez', N'Villanueva', N'1', N'F', N'ELIZABETH ')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (19, 1234583, 4, N'Andrade', N'Anzures', N'1', N'F', N'GLORIA')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (20, 1234584, 5, N'Andrade', N'Arredondo', N'1', N'F', N'GABRIELA')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (21, 1234585, 6, N'Martinez', N'Arredondo', N'0', N'M', N'ANGEL')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (22, 1234586, 1, N'Arredondo', N'Garcia', N'1', N'M', N'SILVIA')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (23, 1234587, 2, N'Lopez', N'Arredondo', N'1', N'M', N'GABRIEL')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (24, 1234588, 3, N'Arnaud', N'Garcia', N'1', N'M', N'PABLO')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (25, 1234589, 4, N'Martinez', N'Arnaud', N'1', N'M', N'RUBEN')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (26, 1234590, 5, N'Garcia', N'Garcia', N'1', N'M', N'FELIPE')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (27, 1234591, 6, N'Garza', N'Miller', N'1', N'M', N'JAIME ')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (28, 1234592, 1, N'Miller', N'Light', N'1', N'M', N'JULIO CESAR')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (29, 1234593, 2, N'Garza', N'Garcia', N'0', N'M', N'DIEGO')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (30, 1234594, 3, N'Martinez', N'Miller', N'1', N'F', N'ARACELI')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (31, 1234595, 4, N'Araujo', N'Guerrero', N'1', N'F', N'ANDREA')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (32, 1234596, 5, N'Guerrero', N'Rodriguez', N'1', N'F', N'ISABEL')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (33, 1234597, 6, N'Peñuela', N'Araujo', N'1', N'F', N'MARÍA TERESA')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (34, 1234598, 1, N'Duran', N'Araujo', N'1', N'F', N'ADRIANA')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (35, 1234599, 2, N'Martinez', N'Duran', N'1', N'F', N'LUCIA')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (36, 1234600, 3, N'Duran', N'Garcia', N'1', N'F', N'DIANA')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (37, 1234601, 4, N'Araujo', N'Garcia', N'1', N'F', N'LEONA')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (38, 1234602, 5, N'Martinez', N'Araujo', N'0', N'F', N'CAITLYN')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (39, 1234603, 6, N'Rodriguez', N'Peñuela', N'1', N'M', N'GUSTAVO')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (40, 1234604, 1, N'Peñuela', N'Garcia', N'0', N'M', N'JUAN ')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (41, 1234605, 2, N'Martinez', N'Rodriguez', N'1', N'F', N'GUADALUPE')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (42, 1234606, 3, N'Martinez', N'Arbea', N'1', N'F', N'JUANA ')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (43, 1234607, 4, N'Arbea', N'Garcia', N'1', N'M', N'GERARDO')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (44, 1234608, 5, N'Aquiles', N'Brinco', N'1', N'M', N'JESUS')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (45, 1234609, 6, N'Martinez', N'Aquiles', N'1', N'M', N'UZIEL')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (46, 1234610, 1, N'Aquiles', N'Garcia', N'1', N'M', N'BRUCE')
SET IDENTITY_INSERT [dbo].[Estudiante] OFF
SET IDENTITY_INSERT [dbo].[Factura] ON 

INSERT [dbo].[Factura] ([IdFactura], [fecha_Factura], [IdPrestamo], [IdAlumno]) VALUES (1, CAST(0x433F0B00 AS Date), 1, 5)
INSERT [dbo].[Factura] ([IdFactura], [fecha_Factura], [IdPrestamo], [IdAlumno]) VALUES (2, CAST(0xBD3F0B00 AS Date), 12, 8)
INSERT [dbo].[Factura] ([IdFactura], [fecha_Factura], [IdPrestamo], [IdAlumno]) VALUES (3, CAST(0x5F3F0B00 AS Date), 16, 5)
SET IDENTITY_INSERT [dbo].[Factura] OFF
SET IDENTITY_INSERT [dbo].[Genero] ON 

INSERT [dbo].[Genero] ([IdGenero], [vGenero]) VALUES (1, N'Terror')
INSERT [dbo].[Genero] ([IdGenero], [vGenero]) VALUES (2, N'Psicologico')
INSERT [dbo].[Genero] ([IdGenero], [vGenero]) VALUES (3, N'Ciencia Ficcion')
INSERT [dbo].[Genero] ([IdGenero], [vGenero]) VALUES (4, N'Fantasia')
INSERT [dbo].[Genero] ([IdGenero], [vGenero]) VALUES (5, N'Romance')
INSERT [dbo].[Genero] ([IdGenero], [vGenero]) VALUES (6, N'Juvenil')
INSERT [dbo].[Genero] ([IdGenero], [vGenero]) VALUES (7, N'Erotico')
INSERT [dbo].[Genero] ([IdGenero], [vGenero]) VALUES (8, N'Biografico')
INSERT [dbo].[Genero] ([IdGenero], [vGenero]) VALUES (9, N'Educativo')
INSERT [dbo].[Genero] ([IdGenero], [vGenero]) VALUES (10, N'Cocina')
INSERT [dbo].[Genero] ([IdGenero], [vGenero]) VALUES (11, N'Comedia')
SET IDENTITY_INSERT [dbo].[Genero] OFF
SET IDENTITY_INSERT [dbo].[Libro] ON 

INSERT [dbo].[Libro] ([IdLibro], [Titulo], [ISBN], [IdAutor], [IdEditorial], [cStatus_L], [IdSector], [IdGenero]) VALUES (1, N'50 Sombras de Wilson', 1234567890, 13, 13, N'1', 10, 7)
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [ISBN], [IdAutor], [IdEditorial], [cStatus_L], [IdSector], [IdGenero]) VALUES (2, N'Focus', 1234567891, 1, 1, N'1', 1, 5)
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [ISBN], [IdAutor], [IdEditorial], [cStatus_L], [IdSector], [IdGenero]) VALUES (3, N'Avengers', 1234567892, 2, 3, N'0', 1, 3)
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [ISBN], [IdAutor], [IdEditorial], [cStatus_L], [IdSector], [IdGenero]) VALUES (4, N'Luna de Pluton', 1234567893, 1, 2, N'1', 4, 5)
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [ISBN], [IdAutor], [IdEditorial], [cStatus_L], [IdSector], [IdGenero]) VALUES (5, N'Mas Barato por Docena', 1234567894, 1, 1, N'1', 1, 11)
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [ISBN], [IdAutor], [IdEditorial], [cStatus_L], [IdSector], [IdGenero]) VALUES (6, N'Calculo', 1234567895, 2, 3, N'1', 1, 9)
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [ISBN], [IdAutor], [IdEditorial], [cStatus_L], [IdSector], [IdGenero]) VALUES (7, N'El diario de Britget', 1234567896, 3, 5, N'0', 1, 11)
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [ISBN], [IdAutor], [IdEditorial], [cStatus_L], [IdSector], [IdGenero]) VALUES (8, N'Proyecto Esposa', 1234567897, 14, 5, N'1', 1, 11)
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [ISBN], [IdAutor], [IdEditorial], [cStatus_L], [IdSector], [IdGenero]) VALUES (9, N'La vuelta al mundo en 80 dias', 1234567810, 6, 6, N'1', 1, 11)
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [ISBN], [IdAutor], [IdEditorial], [cStatus_L], [IdSector], [IdGenero]) VALUES (10, N'Emocion dura y pura', 1234567811, 16, 1, N'1', 3, 5)
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [ISBN], [IdAutor], [IdEditorial], [cStatus_L], [IdSector], [IdGenero]) VALUES (11, N'La Española', 1334567890, 18, 1, N'1', 3, 5)
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [ISBN], [IdAutor], [IdEditorial], [cStatus_L], [IdSector], [IdGenero]) VALUES (12, N'Nuestra Noche', 1434567890, 19, 4, N'1', 3, 5)
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [ISBN], [IdAutor], [IdEditorial], [cStatus_L], [IdSector], [IdGenero]) VALUES (17, N'El Hobbit', 1334567890, 10, 17, N'1', 4, 4)
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [ISBN], [IdAutor], [IdEditorial], [cStatus_L], [IdSector], [IdGenero]) VALUES (18, N'Harry Potter y el Caliz de Fuego', 1434567890, 5, 4, N'1', 4, 4)
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [ISBN], [IdAutor], [IdEditorial], [cStatus_L], [IdSector], [IdGenero]) VALUES (19, N'Las Cronicas de Narnia', 1534567890, 7, 6, N'1', 4, 5)
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [ISBN], [IdAutor], [IdEditorial], [cStatus_L], [IdSector], [IdGenero]) VALUES (20, N'El Jugador', 1634567890, 8, 9, N'1', 5, 5)
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [ISBN], [IdAutor], [IdEditorial], [cStatus_L], [IdSector], [IdGenero]) VALUES (21, N'El Juego de Ender', 1734567890, 9, 3, N'1', 5, 5)
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [ISBN], [IdAutor], [IdEditorial], [cStatus_L], [IdSector], [IdGenero]) VALUES (22, N'Snow Crash', 1834567890, 13, 2, N'1', 5, 5)
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [ISBN], [IdAutor], [IdEditorial], [cStatus_L], [IdSector], [IdGenero]) VALUES (23, N'Ubik', 1234507890, 16, 8, N'1', 5, 5)
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [ISBN], [IdAutor], [IdEditorial], [cStatus_L], [IdSector], [IdGenero]) VALUES (24, N'Anatema', 1234067890, 17, 20, N'0', 5, 5)
SET IDENTITY_INSERT [dbo].[Libro] OFF
SET IDENTITY_INSERT [dbo].[Multa] ON 

INSERT [dbo].[Multa] ([IdMulta], [Cargo], [IdLibro], [IdAlumno], [IdPrestamo]) VALUES (1, 50.0000, 6, 5, 1)
INSERT [dbo].[Multa] ([IdMulta], [Cargo], [IdLibro], [IdAlumno], [IdPrestamo]) VALUES (2, 50.0000, 10, 35, 2)
INSERT [dbo].[Multa] ([IdMulta], [Cargo], [IdLibro], [IdAlumno], [IdPrestamo]) VALUES (5, 30.0000, 3, 8, 12)
INSERT [dbo].[Multa] ([IdMulta], [Cargo], [IdLibro], [IdAlumno], [IdPrestamo]) VALUES (6, 30.0000, 5, 5, 16)
INSERT [dbo].[Multa] ([IdMulta], [Cargo], [IdLibro], [IdAlumno], [IdPrestamo]) VALUES (7, 50.0000, 6, 11, 17)
INSERT [dbo].[Multa] ([IdMulta], [Cargo], [IdLibro], [IdAlumno], [IdPrestamo]) VALUES (8, 30.0000, 7, 23, 18)
INSERT [dbo].[Multa] ([IdMulta], [Cargo], [IdLibro], [IdAlumno], [IdPrestamo]) VALUES (9, 50.0000, 2, 25, 19)
SET IDENTITY_INSERT [dbo].[Multa] OFF
SET IDENTITY_INSERT [dbo].[Prestamo] ON 

INSERT [dbo].[Prestamo] ([IdPrestamo], [Fecha_Prestamo], [Fecha_Exp], [Entrega], [IdAlumno], [IdLibro]) VALUES (1, CAST(0x263F0B00 AS Date), CAST(0x9F3F0B00 AS Date), CAST(0x433F0B00 AS Date), 5, 6)
INSERT [dbo].[Prestamo] ([IdPrestamo], [Fecha_Prestamo], [Fecha_Exp], [Entrega], [IdAlumno], [IdLibro]) VALUES (2, CAST(0x5E3F0B00 AS Date), CAST(0xFB3F0B00 AS Date), CAST(0x7D3F0B00 AS Date), 5, 10)
INSERT [dbo].[Prestamo] ([IdPrestamo], [Fecha_Prestamo], [Fecha_Exp], [Entrega], [IdAlumno], [IdLibro]) VALUES (3, CAST(0x7F3F0B00 AS Date), CAST(0x18400B00 AS Date), CAST(0x9D3F0B00 AS Date), 3, 3)
INSERT [dbo].[Prestamo] ([IdPrestamo], [Fecha_Prestamo], [Fecha_Exp], [Entrega], [IdAlumno], [IdLibro]) VALUES (4, CAST(0x5F3F0B00 AS Date), CAST(0xF83F0B00 AS Date), CAST(0x17400B00 AS Date), 4, 4)
INSERT [dbo].[Prestamo] ([IdPrestamo], [Fecha_Prestamo], [Fecha_Exp], [Entrega], [IdAlumno], [IdLibro]) VALUES (5, CAST(0x803F0B00 AS Date), CAST(0xFA3F0B00 AS Date), CAST(0x19400B00 AS Date), 6, 6)
INSERT [dbo].[Prestamo] ([IdPrestamo], [Fecha_Prestamo], [Fecha_Exp], [Entrega], [IdAlumno], [IdLibro]) VALUES (9, CAST(0x803F0B00 AS Date), CAST(0xFA3F0B00 AS Date), CAST(0x19400B00 AS Date), 6, 6)
INSERT [dbo].[Prestamo] ([IdPrestamo], [Fecha_Prestamo], [Fecha_Exp], [Entrega], [IdAlumno], [IdLibro]) VALUES (12, CAST(0x273F0B00 AS Date), CAST(0x463F0B00 AS Date), CAST(0xBD3F0B00 AS Date), 8, 3)
INSERT [dbo].[Prestamo] ([IdPrestamo], [Fecha_Prestamo], [Fecha_Exp], [Entrega], [IdAlumno], [IdLibro]) VALUES (14, CAST(0x243F0B00 AS Date), CAST(0x423F0B00 AS Date), CAST(0x5E3F0B00 AS Date), 15, 4)
INSERT [dbo].[Prestamo] ([IdPrestamo], [Fecha_Prestamo], [Fecha_Exp], [Entrega], [IdAlumno], [IdLibro]) VALUES (16, CAST(0x243F0B00 AS Date), CAST(0x433F0B00 AS Date), CAST(0x5F3F0B00 AS Date), 5, 5)
INSERT [dbo].[Prestamo] ([IdPrestamo], [Fecha_Prestamo], [Fecha_Exp], [Entrega], [IdAlumno], [IdLibro]) VALUES (17, CAST(0x7E3F0B00 AS Date), CAST(0x9C3F0B00 AS Date), CAST(0xBB3F0B00 AS Date), 11, 6)
INSERT [dbo].[Prestamo] ([IdPrestamo], [Fecha_Prestamo], [Fecha_Exp], [Entrega], [IdAlumno], [IdLibro]) VALUES (18, CAST(0xD93F0B00 AS Date), CAST(0xF83F0B00 AS Date), CAST(0x17400B00 AS Date), 23, 7)
INSERT [dbo].[Prestamo] ([IdPrestamo], [Fecha_Prestamo], [Fecha_Exp], [Entrega], [IdAlumno], [IdLibro]) VALUES (19, CAST(0x253F0B00 AS Date), CAST(0x433F0B00 AS Date), CAST(0x5F3F0B00 AS Date), 25, 2)
INSERT [dbo].[Prestamo] ([IdPrestamo], [Fecha_Prestamo], [Fecha_Exp], [Entrega], [IdAlumno], [IdLibro]) VALUES (20, CAST(0x7F3F0B00 AS Date), CAST(0x9C3F0B00 AS Date), CAST(0xBA3F0B00 AS Date), 13, 10)
SET IDENTITY_INSERT [dbo].[Prestamo] OFF
SET IDENTITY_INSERT [dbo].[Sector] ON 

INSERT [dbo].[Sector] ([IdSector], [Seccion]) VALUES (1, N'Estanteria 1')
INSERT [dbo].[Sector] ([IdSector], [Seccion]) VALUES (2, N'Estanteria 2')
INSERT [dbo].[Sector] ([IdSector], [Seccion]) VALUES (3, N'Estanteria 3')
INSERT [dbo].[Sector] ([IdSector], [Seccion]) VALUES (4, N'Estanteria 4')
INSERT [dbo].[Sector] ([IdSector], [Seccion]) VALUES (5, N'Estanteria 5')
INSERT [dbo].[Sector] ([IdSector], [Seccion]) VALUES (6, N'Estanteria 6')
INSERT [dbo].[Sector] ([IdSector], [Seccion]) VALUES (7, N'Estanteria 7')
INSERT [dbo].[Sector] ([IdSector], [Seccion]) VALUES (8, N'Estanteria 8')
INSERT [dbo].[Sector] ([IdSector], [Seccion]) VALUES (9, N'Estanteria 9')
INSERT [dbo].[Sector] ([IdSector], [Seccion]) VALUES (10, N'Estanteria 10')
SET IDENTITY_INSERT [dbo].[Sector] OFF
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Estudiant__IdCar__173876EA]') AND parent_object_id = OBJECT_ID(N'[dbo].[Estudiante]'))
ALTER TABLE [dbo].[Estudiante]  WITH CHECK ADD  CONSTRAINT [FK__Estudiant__IdCar__173876EA] FOREIGN KEY([IdCarrera])
REFERENCES [dbo].[Carrera] ([IdCarrera])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Estudiant__IdCar__173876EA]') AND parent_object_id = OBJECT_ID(N'[dbo].[Estudiante]'))
ALTER TABLE [dbo].[Estudiante] CHECK CONSTRAINT [FK__Estudiant__IdCar__173876EA]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Factura__IdAlumn__60A75C0F]') AND parent_object_id = OBJECT_ID(N'[dbo].[Factura]'))
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [FK__Factura__IdAlumn__60A75C0F] FOREIGN KEY([IdAlumno])
REFERENCES [dbo].[Estudiante] ([IdAlumno])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Factura__IdAlumn__60A75C0F]') AND parent_object_id = OBJECT_ID(N'[dbo].[Factura]'))
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK__Factura__IdAlumn__60A75C0F]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Factura__IdPrest__5FB337D6]') AND parent_object_id = OBJECT_ID(N'[dbo].[Factura]'))
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [FK__Factura__IdPrest__5FB337D6] FOREIGN KEY([IdPrestamo])
REFERENCES [dbo].[Prestamo] ([IdPrestamo])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Factura__IdPrest__5FB337D6]') AND parent_object_id = OBJECT_ID(N'[dbo].[Factura]'))
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK__Factura__IdPrest__5FB337D6]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Libro__IdAutor__21B6055D]') AND parent_object_id = OBJECT_ID(N'[dbo].[Libro]'))
ALTER TABLE [dbo].[Libro]  WITH CHECK ADD  CONSTRAINT [FK__Libro__IdAutor__21B6055D] FOREIGN KEY([IdAutor])
REFERENCES [dbo].[Autor] ([IdAutor])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Libro__IdAutor__21B6055D]') AND parent_object_id = OBJECT_ID(N'[dbo].[Libro]'))
ALTER TABLE [dbo].[Libro] CHECK CONSTRAINT [FK__Libro__IdAutor__21B6055D]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Libro__IdEditori__22AA2996]') AND parent_object_id = OBJECT_ID(N'[dbo].[Libro]'))
ALTER TABLE [dbo].[Libro]  WITH CHECK ADD  CONSTRAINT [FK__Libro__IdEditori__22AA2996] FOREIGN KEY([IdEditorial])
REFERENCES [dbo].[Editorial] ([IdEditorial])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Libro__IdEditori__22AA2996]') AND parent_object_id = OBJECT_ID(N'[dbo].[Libro]'))
ALTER TABLE [dbo].[Libro] CHECK CONSTRAINT [FK__Libro__IdEditori__22AA2996]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Libro__IdGenero__24927208]') AND parent_object_id = OBJECT_ID(N'[dbo].[Libro]'))
ALTER TABLE [dbo].[Libro]  WITH CHECK ADD  CONSTRAINT [FK__Libro__IdGenero__24927208] FOREIGN KEY([IdGenero])
REFERENCES [dbo].[Genero] ([IdGenero])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Libro__IdGenero__24927208]') AND parent_object_id = OBJECT_ID(N'[dbo].[Libro]'))
ALTER TABLE [dbo].[Libro] CHECK CONSTRAINT [FK__Libro__IdGenero__24927208]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Libro__IdSector__239E4DCF]') AND parent_object_id = OBJECT_ID(N'[dbo].[Libro]'))
ALTER TABLE [dbo].[Libro]  WITH CHECK ADD  CONSTRAINT [FK__Libro__IdSector__239E4DCF] FOREIGN KEY([IdSector])
REFERENCES [dbo].[Sector] ([IdSector])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Libro__IdSector__239E4DCF]') AND parent_object_id = OBJECT_ID(N'[dbo].[Libro]'))
ALTER TABLE [dbo].[Libro] CHECK CONSTRAINT [FK__Libro__IdSector__239E4DCF]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Multa__IdAlumno__4222D4EF]') AND parent_object_id = OBJECT_ID(N'[dbo].[Multa]'))
ALTER TABLE [dbo].[Multa]  WITH CHECK ADD  CONSTRAINT [FK__Multa__IdAlumno__4222D4EF] FOREIGN KEY([IdAlumno])
REFERENCES [dbo].[Estudiante] ([IdAlumno])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Multa__IdAlumno__4222D4EF]') AND parent_object_id = OBJECT_ID(N'[dbo].[Multa]'))
ALTER TABLE [dbo].[Multa] CHECK CONSTRAINT [FK__Multa__IdAlumno__4222D4EF]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Multa__IdLibro__412EB0B6]') AND parent_object_id = OBJECT_ID(N'[dbo].[Multa]'))
ALTER TABLE [dbo].[Multa]  WITH CHECK ADD  CONSTRAINT [FK__Multa__IdLibro__412EB0B6] FOREIGN KEY([IdLibro])
REFERENCES [dbo].[Libro] ([IdLibro])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Multa__IdLibro__412EB0B6]') AND parent_object_id = OBJECT_ID(N'[dbo].[Multa]'))
ALTER TABLE [dbo].[Multa] CHECK CONSTRAINT [FK__Multa__IdLibro__412EB0B6]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Multa__IdPrestam__403A8C7D]') AND parent_object_id = OBJECT_ID(N'[dbo].[Multa]'))
ALTER TABLE [dbo].[Multa]  WITH CHECK ADD  CONSTRAINT [FK__Multa__IdPrestam__403A8C7D] FOREIGN KEY([IdPrestamo])
REFERENCES [dbo].[Prestamo] ([IdPrestamo])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Multa__IdPrestam__403A8C7D]') AND parent_object_id = OBJECT_ID(N'[dbo].[Multa]'))
ALTER TABLE [dbo].[Multa] CHECK CONSTRAINT [FK__Multa__IdPrestam__403A8C7D]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_Alumno]') AND parent_object_id = OBJECT_ID(N'[dbo].[Prestamo]'))
ALTER TABLE [dbo].[Prestamo]  WITH CHECK ADD  CONSTRAINT [fk_Alumno] FOREIGN KEY([IdAlumno])
REFERENCES [dbo].[Estudiante] ([IdAlumno])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_Alumno]') AND parent_object_id = OBJECT_ID(N'[dbo].[Prestamo]'))
ALTER TABLE [dbo].[Prestamo] CHECK CONSTRAINT [fk_Alumno]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_Libro]') AND parent_object_id = OBJECT_ID(N'[dbo].[Prestamo]'))
ALTER TABLE [dbo].[Prestamo]  WITH CHECK ADD  CONSTRAINT [fk_Libro] FOREIGN KEY([IdLibro])
REFERENCES [dbo].[Libro] ([IdLibro])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_Libro]') AND parent_object_id = OBJECT_ID(N'[dbo].[Prestamo]'))
ALTER TABLE [dbo].[Prestamo] CHECK CONSTRAINT [fk_Libro]
GO
/****** Object:  Trigger [dbo].[trg_InsertLibro]    Script Date: 19/04/2019 13:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[trg_InsertLibro]'))
EXEC dbo.sp_executesql @statement = N'create trigger [dbo].[trg_InsertLibro]
on [dbo].[Libro]
after insert as
begin
select * from inserted
end
' 
GO
/****** Object:  Trigger [dbo].[trg_UpdateMulta]    Script Date: 19/04/2019 13:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[trg_UpdateMulta]'))
EXEC dbo.sp_executesql @statement = N'create trigger [dbo].[trg_UpdateMulta]
on [dbo].[Multa]
after update as
begin
select * from inserted
end
' 
GO
