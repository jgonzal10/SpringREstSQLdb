USE [master]
GO
/****** Object:  Database [music]    Script Date: 02/04/2017 22:04:13 ******/
CREATE DATABASE [music]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'music', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\music.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'music_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\music_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [music] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [music].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [music] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [music] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [music] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [music] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [music] SET ARITHABORT OFF 
GO
ALTER DATABASE [music] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [music] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [music] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [music] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [music] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [music] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [music] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [music] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [music] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [music] SET  DISABLE_BROKER 
GO
ALTER DATABASE [music] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [music] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [music] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [music] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [music] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [music] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [music] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [music] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [music] SET  MULTI_USER 
GO
ALTER DATABASE [music] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [music] SET DB_CHAINING OFF 
GO
ALTER DATABASE [music] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [music] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [music] SET DELAYED_DURABILITY = DISABLED 
GO
USE [music]
GO
/****** Object:  Table [dbo].[song]    Script Date: 02/04/2017 22:04:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[song](
	[songId] [int] IDENTITY(1,1) NOT NULL,
	[songName] [varchar](50) NULL,
	[songAutor] [varchar](50) NULL,
	[songYear] [varchar](50) NULL,
 CONSTRAINT [PK_song] PRIMARY KEY CLUSTERED 
(
	[songId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[spCreateSong]    Script Date: 02/04/2017 22:04:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCreateSong]
@songName varchar(50),
@songAutor varchar(50),
@songYear varchar(50)
as
insert into song (songName, songAutor, songYear)values (@songName, @songAutor, @songYear)

GO
/****** Object:  StoredProcedure [dbo].[spDeleteSong]    Script Date: 02/04/2017 22:04:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[spDeleteSong]
@songId int

as
delete from song where songId=@songId
GO
/****** Object:  StoredProcedure [dbo].[spGetSongById]    Script Date: 02/04/2017 22:04:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spGetSongById]
@songId int
as

select songId, songName, songAutor, songYear from song where songId=@songId
GO
/****** Object:  StoredProcedure [dbo].[spListSongs]    Script Date: 02/04/2017 22:04:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spListSongs]
as
select * from song

GO
/****** Object:  StoredProcedure [dbo].[spUpdateSong]    Script Date: 02/04/2017 22:04:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spUpdateSong]
@songId int,
@songName varchar(50),
@songAutor varchar(50),
@songYear varchar(50)
as

       update song set
       songName=@songName,
       songAutor=@songAutor,
	   songYear=@songYear
       where songId = @songId
GO
USE [master]
GO
ALTER DATABASE [music] SET  READ_WRITE 
GO
