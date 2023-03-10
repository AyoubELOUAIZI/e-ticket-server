USE [master]
GO
/****** Object:  Database [EticketDB]    Script Date: 12/3/2022 11:27:00 AM ******/
CREATE DATABASE [EticketDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EticketDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\EticketDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EticketDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\EticketDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [EticketDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EticketDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EticketDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EticketDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EticketDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EticketDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EticketDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [EticketDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EticketDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EticketDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EticketDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EticketDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EticketDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EticketDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EticketDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EticketDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EticketDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EticketDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EticketDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EticketDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EticketDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EticketDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EticketDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EticketDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EticketDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EticketDB] SET  MULTI_USER 
GO
ALTER DATABASE [EticketDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EticketDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EticketDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EticketDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EticketDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EticketDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [EticketDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [EticketDB]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 12/3/2022 11:27:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[account_id] [int] IDENTITY(1,1) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[account_type] [nvarchar](50) NOT NULL,
	[avatar] [image] NOT NULL,
	[phone_number] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 12/3/2022 11:27:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[ad_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [nvarchar](50) NOT NULL,
	[last_name] [nvarchar](50) NOT NULL,
	[created_at] [bit] NOT NULL,
	[account_id] [int] NOT NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[ad_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 12/3/2022 11:27:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[client_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [nvarchar](50) NOT NULL,
	[last_name] [nvarchar](50) NOT NULL,
	[address] [nvarchar](50) NOT NULL,
	[country] [nvarchar](50) NOT NULL,
	[created_at] [datetime] NOT NULL,
	[account_id] [int] NOT NULL,
	[city] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Client_id] PRIMARY KEY CLUSTERED 
(
	[client_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientWaitList]    Script Date: 12/3/2022 11:27:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientWaitList](
	[client_wait_id] [int] IDENTITY(1,1) NOT NULL,
	[client_id] [int] NOT NULL,
	[event_id] [int] NOT NULL,
 CONSTRAINT [PK_ClientWaitList] PRIMARY KEY CLUSTERED 
(
	[client_wait_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Event]    Script Date: 12/3/2022 11:27:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event](
	[event_id] [int] IDENTITY(1,1) NOT NULL,
	[org_id] [int] NOT NULL,
	[duration] [int] NOT NULL,
	[trailer_video_url] [nvarchar](50) NOT NULL,
	[description] [nvarchar](300) NOT NULL,
	[brand_url] [nvarchar](50) NOT NULL,
	[location] [nvarchar](50) NOT NULL,
	[start_time] [datetime] NOT NULL,
	[finish_time] [datetime] NOT NULL,
	[number_sold_tickets] [int] NOT NULL,
	[number_of_waiters] [int] NOT NULL,
	[max_number_attendants] [int] NOT NULL,
	[is_start_selling] [bit] NOT NULL,
	[event_type] [nvarchar](50) NOT NULL,
	[is_review_evabled] [bit] NOT NULL,
	[is_approved] [bit] NOT NULL,
 CONSTRAINT [PK_Event] PRIMARY KEY CLUSTERED 
(
	[event_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Event_Images]    Script Date: 12/3/2022 11:27:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event_Images](
	[img_id] [int] IDENTITY(1,1) NOT NULL,
	[event_id] [int] NOT NULL,
	[img_url] [nvarchar](70) NOT NULL,
 CONSTRAINT [PK_Event_Images] PRIMARY KEY CLUSTERED 
(
	[img_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Event_Review]    Script Date: 12/3/2022 11:27:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event_Review](
	[review_id] [int] IDENTITY(1,1) NOT NULL,
	[event_id] [int] NOT NULL,
	[message] [nvarchar](100) NOT NULL,
	[rating] [int] NOT NULL,
	[created_at] [datetime] NOT NULL,
 CONSTRAINT [PK_Event_Review_1] PRIMARY KEY CLUSTERED 
(
	[review_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notifications]    Script Date: 12/3/2022 11:27:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notifications](
	[not_id] [int] IDENTITY(1,1) NOT NULL,
	[account_id] [int] NOT NULL,
	[not_message] [nvarchar](200) NOT NULL,
	[created_at] [datetime] NOT NULL,
 CONSTRAINT [PK_Notifications] PRIMARY KEY CLUSTERED 
(
	[not_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders_Cart]    Script Date: 12/3/2022 11:27:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders_Cart](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[quantity] [int] NOT NULL,
	[total_price] [money] NOT NULL,
	[Ordered_at] [datetime] NOT NULL,
	[event_id] [int] NOT NULL,
	[ticket_type_id] [int] NOT NULL,
	[client_id] [int] NOT NULL,
	[is_paid] [bit] NOT NULL,
 CONSTRAINT [PK_Orders_Cart] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Organizer]    Script Date: 12/3/2022 11:27:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Organizer](
	[org_id] [int] IDENTITY(1,1) NOT NULL,
	[org_country] [nvarchar](50) NOT NULL,
	[hasPersonamStore] [bit] NOT NULL,
	[personalStore] [nvarchar](100) NOT NULL,
	[created_at] [datetime] NOT NULL,
	[account_id] [int] NOT NULL,
 CONSTRAINT [PK_Organizer] PRIMARY KEY CLUSTERED 
(
	[org_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paid_Tickets_Orders]    Script Date: 12/3/2022 11:27:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paid_Tickets_Orders](
	[order_id] [int] NOT NULL,
	[ticket_id] [int] NOT NULL,
	[event_id] [int] NOT NULL,
	[paid_orders_id] [int] NOT NULL,
 CONSTRAINT [PK_Paid_Tickets_Orders] PRIMARY KEY CLUSTERED 
(
	[paid_orders_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SeatCategory]    Script Date: 12/3/2022 11:27:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SeatCategory](
	[seat_categ_id] [int] IDENTITY(1,1) NOT NULL,
	[event_id] [int] NOT NULL,
	[type_name] [nvarchar](50) NOT NULL,
	[type_price] [int] NOT NULL,
	[type_description] [nvarchar](50) NOT NULL,
	[number_max] [int] NOT NULL,
	[number_avialable] [int] NOT NULL,
	[max_uses] [int] NOT NULL,
 CONSTRAINT [PK_SeatCategory] PRIMARY KEY CLUSTERED 
(
	[seat_categ_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 12/3/2022 11:27:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ticket](
	[ticket_id] [int] NOT NULL,
	[client_id] [int] NOT NULL,
	[event_id] [int] NOT NULL,
	[qrcode] [nvarchar](100) NOT NULL,
	[ticket__type_id] [int] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[num_uses] [int] NOT NULL,
 CONSTRAINT [PK_Ticket] PRIMARY KEY CLUSTERED 
(
	[ticket_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Admin]  WITH CHECK ADD  CONSTRAINT [FK_Admin_Account] FOREIGN KEY([account_id])
REFERENCES [dbo].[Account] ([account_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Admin] CHECK CONSTRAINT [FK_Admin_Account]
GO
ALTER TABLE [dbo].[ClientWaitList]  WITH CHECK ADD  CONSTRAINT [FK_ClientWaitList_Client] FOREIGN KEY([client_id])
REFERENCES [dbo].[Client] ([client_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientWaitList] CHECK CONSTRAINT [FK_ClientWaitList_Client]
GO
ALTER TABLE [dbo].[ClientWaitList]  WITH CHECK ADD  CONSTRAINT [FK_ClientWaitList_Event] FOREIGN KEY([event_id])
REFERENCES [dbo].[Event] ([event_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientWaitList] CHECK CONSTRAINT [FK_ClientWaitList_Event]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [FK_Event_Organizer] FOREIGN KEY([org_id])
REFERENCES [dbo].[Organizer] ([org_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [FK_Event_Organizer]
GO
ALTER TABLE [dbo].[Event_Images]  WITH CHECK ADD  CONSTRAINT [FK_Event_Images_Event] FOREIGN KEY([event_id])
REFERENCES [dbo].[Event] ([event_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Event_Images] CHECK CONSTRAINT [FK_Event_Images_Event]
GO
ALTER TABLE [dbo].[Event_Review]  WITH CHECK ADD  CONSTRAINT [FK_Event_Review_Event] FOREIGN KEY([event_id])
REFERENCES [dbo].[Event] ([event_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Event_Review] CHECK CONSTRAINT [FK_Event_Review_Event]
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD  CONSTRAINT [FK_Notifications_Account] FOREIGN KEY([account_id])
REFERENCES [dbo].[Account] ([account_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Notifications] CHECK CONSTRAINT [FK_Notifications_Account]
GO
ALTER TABLE [dbo].[Orders_Cart]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Cart_Client] FOREIGN KEY([client_id])
REFERENCES [dbo].[Client] ([client_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders_Cart] CHECK CONSTRAINT [FK_Orders_Cart_Client]
GO
ALTER TABLE [dbo].[Orders_Cart]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Cart_Event] FOREIGN KEY([event_id])
REFERENCES [dbo].[Event] ([event_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders_Cart] CHECK CONSTRAINT [FK_Orders_Cart_Event]
GO
ALTER TABLE [dbo].[Organizer]  WITH CHECK ADD  CONSTRAINT [FK_Organizer_Account] FOREIGN KEY([account_id])
REFERENCES [dbo].[Account] ([account_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Organizer] CHECK CONSTRAINT [FK_Organizer_Account]
GO
ALTER TABLE [dbo].[Paid_Tickets_Orders]  WITH CHECK ADD  CONSTRAINT [FK_Paid_Tickets_Orders_Event] FOREIGN KEY([event_id])
REFERENCES [dbo].[Event] ([event_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Paid_Tickets_Orders] CHECK CONSTRAINT [FK_Paid_Tickets_Orders_Event]
GO
ALTER TABLE [dbo].[Paid_Tickets_Orders]  WITH CHECK ADD  CONSTRAINT [FK_Paid_Tickets_Orders_Orders_Cart] FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders_Cart] ([order_id])
GO
ALTER TABLE [dbo].[Paid_Tickets_Orders] CHECK CONSTRAINT [FK_Paid_Tickets_Orders_Orders_Cart]
GO
ALTER TABLE [dbo].[Paid_Tickets_Orders]  WITH CHECK ADD  CONSTRAINT [FK_Paid_Tickets_Orders_Ticket] FOREIGN KEY([ticket_id])
REFERENCES [dbo].[Ticket] ([ticket_id])
GO
ALTER TABLE [dbo].[Paid_Tickets_Orders] CHECK CONSTRAINT [FK_Paid_Tickets_Orders_Ticket]
GO
ALTER TABLE [dbo].[SeatCategory]  WITH CHECK ADD  CONSTRAINT [FK_SeatCategory_Event] FOREIGN KEY([event_id])
REFERENCES [dbo].[Event] ([event_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SeatCategory] CHECK CONSTRAINT [FK_SeatCategory_Event]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_Event] FOREIGN KEY([event_id])
REFERENCES [dbo].[Event] ([event_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_Event]
GO
USE [master]
GO
ALTER DATABASE [EticketDB] SET  READ_WRITE 
GO
