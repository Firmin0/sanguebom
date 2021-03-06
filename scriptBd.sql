USE [master]
GO
/****** Object:  Database [SangueBom]    Script Date: 05/03/2013 13:28:45 ******/
CREATE DATABASE [SangueBom] ON  PRIMARY 
( NAME = N'SangueBom', FILENAME = N'C:\SangueBom.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SangueBom_log', FILENAME = N'C:\SangueBom_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SangueBom] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SangueBom].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SangueBom] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [SangueBom] SET ANSI_NULLS OFF
GO
ALTER DATABASE [SangueBom] SET ANSI_PADDING OFF
GO
ALTER DATABASE [SangueBom] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [SangueBom] SET ARITHABORT OFF
GO
ALTER DATABASE [SangueBom] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [SangueBom] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [SangueBom] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [SangueBom] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [SangueBom] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [SangueBom] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [SangueBom] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [SangueBom] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [SangueBom] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [SangueBom] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [SangueBom] SET  DISABLE_BROKER
GO
ALTER DATABASE [SangueBom] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [SangueBom] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [SangueBom] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [SangueBom] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [SangueBom] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [SangueBom] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [SangueBom] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [SangueBom] SET  READ_WRITE
GO
ALTER DATABASE [SangueBom] SET RECOVERY FULL
GO
ALTER DATABASE [SangueBom] SET  MULTI_USER
GO
ALTER DATABASE [SangueBom] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [SangueBom] SET DB_CHAINING OFF
GO
USE [SangueBom]
GO
/****** Object:  Table [dbo].[Votos]    Script Date: 05/03/2013 13:28:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Votos](
	[Id] [int] NOT NULL,
	[IdContacto] [int] NULL,
	[Estado] [nvarchar](10) NULL,
 CONSTRAINT [PK_Votos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Localizacoes]    Script Date: 05/03/2013 13:28:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Localizacoes](
	[Id] [int] NOT NULL,
	[Localidade] [nvarchar](50) NULL,
	[Municipio] [nvarchar](50) NULL,
	[Provincia] [nvarchar](50) NULL,
	[Endereço] [nvarchar](50) NULL,
 CONSTRAINT [PK_Localizacoes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gruposanguineo]    Script Date: 05/03/2013 13:28:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gruposanguineo](
	[Id] [int] NOT NULL,
	[Descricao] [nvarchar](50) NULL,
 CONSTRAINT [PK_Gruposanguineo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doadores]    Script Date: 05/03/2013 13:28:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doadores](
	[Id] [int] NOT NULL,
	[Nome] [nvarchar](100) NULL,
	[SobreNome] [nvarchar](150) NULL,
	[DataNascimento] [date] NULL,
	[IDLocalização] [int] NULL,
	[IdGrupo] [int] NULL,
 CONSTRAINT [PK_Doadores] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contactos]    Script Date: 05/03/2013 13:28:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contactos](
	[Id] [int] NOT NULL,
	[IdDoador] [int] NOT NULL,
	[Tipo] [nvarchar](10) NULL,
	[Contacto] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Contacto] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[IdDoador] ASC,
	[Contacto] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_Doadores_Gruposanguineo]    Script Date: 05/03/2013 13:28:46 ******/
ALTER TABLE [dbo].[Doadores]  WITH CHECK ADD  CONSTRAINT [FK_Doadores_Gruposanguineo] FOREIGN KEY([IdGrupo])
REFERENCES [dbo].[Gruposanguineo] ([Id])
GO
ALTER TABLE [dbo].[Doadores] CHECK CONSTRAINT [FK_Doadores_Gruposanguineo]
GO
/****** Object:  ForeignKey [FK_Doadores_Localizacoes]    Script Date: 05/03/2013 13:28:46 ******/
ALTER TABLE [dbo].[Doadores]  WITH CHECK ADD  CONSTRAINT [FK_Doadores_Localizacoes] FOREIGN KEY([IDLocalização])
REFERENCES [dbo].[Localizacoes] ([Id])
GO
ALTER TABLE [dbo].[Doadores] CHECK CONSTRAINT [FK_Doadores_Localizacoes]
GO
/****** Object:  ForeignKey [FK_Contactos_Doadores]    Script Date: 05/03/2013 13:28:46 ******/
ALTER TABLE [dbo].[Contactos]  WITH CHECK ADD  CONSTRAINT [FK_Contactos_Doadores] FOREIGN KEY([IdDoador])
REFERENCES [dbo].[Doadores] ([Id])
GO
ALTER TABLE [dbo].[Contactos] CHECK CONSTRAINT [FK_Contactos_Doadores]
GO
/****** Object:  ForeignKey [FK_Contactos_Votos]    Script Date: 05/03/2013 13:28:46 ******/
ALTER TABLE [dbo].[Contactos]  WITH CHECK ADD  CONSTRAINT [FK_Contactos_Votos] FOREIGN KEY([Id])
REFERENCES [dbo].[Votos] ([Id])
GO
ALTER TABLE [dbo].[Contactos] CHECK CONSTRAINT [FK_Contactos_Votos]
GO
