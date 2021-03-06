USE [master]
GO
/****** Object:  Database [KSBike]    Script Date: 2021/10/17 下午 03:59:10 ******/
CREATE DATABASE [KSBike]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'KSBike', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\KSBike.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'KSBike_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\KSBike_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [KSBike] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KSBike].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [KSBike] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [KSBike] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [KSBike] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [KSBike] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [KSBike] SET ARITHABORT OFF 
GO
ALTER DATABASE [KSBike] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [KSBike] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KSBike] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KSBike] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KSBike] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [KSBike] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [KSBike] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KSBike] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [KSBike] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [KSBike] SET  DISABLE_BROKER 
GO
ALTER DATABASE [KSBike] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KSBike] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [KSBike] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [KSBike] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [KSBike] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KSBike] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [KSBike] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [KSBike] SET RECOVERY FULL 
GO
ALTER DATABASE [KSBike] SET  MULTI_USER 
GO
ALTER DATABASE [KSBike] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [KSBike] SET DB_CHAINING OFF 
GO
ALTER DATABASE [KSBike] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [KSBike] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [KSBike] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [KSBike] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'KSBike', N'ON'
GO
ALTER DATABASE [KSBike] SET QUERY_STORE = OFF
GO
USE [KSBike]
GO
/****** Object:  Table [dbo].[hashtag]    Script Date: 2021/10/17 下午 03:59:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hashtag](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[official_route_id] [int] NOT NULL,
	[private_route_id] [int] NOT NULL,
	[hashtag_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_hashtag] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[official_route_comment]    Script Date: 2021/10/17 下午 03:59:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[official_route_comment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[article_title_id] [int] NOT NULL,
	[comment_user_id] [int] NOT NULL,
	[all_star_summary] [int] NULL,
	[user_give_star_num] [int] NOT NULL,
	[comment] [text] NULL,
	[datetime] [datetime] NULL,
 CONSTRAINT [PK_official_route_comment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[official_route_data]    Script Date: 2021/10/17 下午 03:59:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[official_route_data](
	[officiak_route_type] [int] NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[official_homepage_img] [text] NULL,
	[official_route_title] [nvarchar](50) NULL,
	[official_route_description] [text] NULL,
	[official_data_catalog] [nvarchar](50) NULL,
	[official_data_img] [text] NULL,
	[official_data_img_info] [nvarchar](50) NULL,
	[official_data_content] [text] NULL,
	[distance_decimal] [decimal](5, 2) NULL,
	[rank] [nvarchar](50) NULL,
 CONSTRAINT [PK_official_route_data] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 2021/10/17 下午 03:59:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[user_name] [nvarchar](100) NULL,
	[product_name] [nvarchar](100) NULL,
	[product_img] [nvarchar](200) NULL,
	[product_price] [int] NULL,
	[order_num] [int] NULL,
	[order_price_total] [int] NULL,
	[order_date] [nvarchar](100) NULL,
	[go_date] [nvarchar](100) NULL,
	[order_pay] [nvarchar](50) NULL,
 CONSTRAINT [PK_orders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[private_route]    Script Date: 2021/10/17 下午 03:59:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[private_route](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[article_title] [nvarchar](50) NULL,
	[article_img_id] [int] NULL,
	[article_img_info] [nvarchar](50) NULL,
	[article_context] [ntext] NULL,
	[datetime] [datetime] NULL,
	[fav_num] [int] NULL,
	[seem_num] [int] NULL,
	[star_num_sum] [int] NULL,
	[sum_people_give_star] [int] NULL,
 CONSTRAINT [PK_private_route] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[private_route_comment]    Script Date: 2021/10/17 下午 03:59:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[private_route_comment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[article_title_id] [int] NOT NULL,
	[comment_user_id] [int] NOT NULL,
	[user_give_star_num] [int] NOT NULL,
	[comment] [ntext] NULL,
	[datetime] [datetime] NOT NULL,
 CONSTRAINT [PK_private_route_comment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 2021/10/17 下午 03:59:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_name] [nvarchar](100) NOT NULL,
	[price] [int] NOT NULL,
	[product_img] [nvarchar](200) NULL,
	[product_num] [int] NULL,
 CONSTRAINT [PK_products] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_favorite]    Script Date: 2021/10/17 下午 03:59:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_favorite](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_fav_id] [int] NOT NULL,
	[private_route_id] [int] NOT NULL,
	[official_route_id] [int] NOT NULL,
	[datetime] [datetime] NOT NULL,
 CONSTRAINT [PK_user_favorite] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 2021/10/17 下午 03:59:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NULL,
	[created_at] [date] NULL,
	[email] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[birthday] [date] NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[hashtag]  WITH CHECK ADD  CONSTRAINT [FK_hashtag_official_route_data] FOREIGN KEY([official_route_id])
REFERENCES [dbo].[official_route_data] ([id])
GO
ALTER TABLE [dbo].[hashtag] CHECK CONSTRAINT [FK_hashtag_official_route_data]
GO
ALTER TABLE [dbo].[hashtag]  WITH CHECK ADD  CONSTRAINT [FK_hashtag_private_route] FOREIGN KEY([private_route_id])
REFERENCES [dbo].[private_route] ([id])
GO
ALTER TABLE [dbo].[hashtag] CHECK CONSTRAINT [FK_hashtag_private_route]
GO
ALTER TABLE [dbo].[official_route_comment]  WITH CHECK ADD  CONSTRAINT [FK_official_route_comment_official_route_data] FOREIGN KEY([article_title_id])
REFERENCES [dbo].[official_route_data] ([id])
GO
ALTER TABLE [dbo].[official_route_comment] CHECK CONSTRAINT [FK_official_route_comment_official_route_data]
GO
ALTER TABLE [dbo].[official_route_comment]  WITH CHECK ADD  CONSTRAINT [FK_official_route_comment_users] FOREIGN KEY([comment_user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[official_route_comment] CHECK CONSTRAINT [FK_official_route_comment_users]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_users] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_users]
GO
ALTER TABLE [dbo].[private_route_comment]  WITH CHECK ADD  CONSTRAINT [FK_private_route_comment_private_route] FOREIGN KEY([article_title_id])
REFERENCES [dbo].[private_route] ([id])
GO
ALTER TABLE [dbo].[private_route_comment] CHECK CONSTRAINT [FK_private_route_comment_private_route]
GO
ALTER TABLE [dbo].[private_route_comment]  WITH CHECK ADD  CONSTRAINT [FK_private_route_comment_users] FOREIGN KEY([comment_user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[private_route_comment] CHECK CONSTRAINT [FK_private_route_comment_users]
GO
ALTER TABLE [dbo].[user_favorite]  WITH CHECK ADD  CONSTRAINT [FK_user_favorite_official_route_data] FOREIGN KEY([official_route_id])
REFERENCES [dbo].[official_route_data] ([id])
GO
ALTER TABLE [dbo].[user_favorite] CHECK CONSTRAINT [FK_user_favorite_official_route_data]
GO
ALTER TABLE [dbo].[user_favorite]  WITH CHECK ADD  CONSTRAINT [FK_user_favorite_private_route] FOREIGN KEY([private_route_id])
REFERENCES [dbo].[private_route] ([id])
GO
ALTER TABLE [dbo].[user_favorite] CHECK CONSTRAINT [FK_user_favorite_private_route]
GO
ALTER TABLE [dbo].[user_favorite]  WITH CHECK ADD  CONSTRAINT [FK_user_favorite_users] FOREIGN KEY([user_fav_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[user_favorite] CHECK CONSTRAINT [FK_user_favorite_users]
GO
USE [master]
GO
ALTER DATABASE [KSBike] SET  READ_WRITE 
GO
