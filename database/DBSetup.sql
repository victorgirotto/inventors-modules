USE [iw]
GO

/****** Object:  Table [dbo].[Modules]    Script Date: 11/14/2014 12:05:01 AM ******/


CREATE TABLE [dbo].[Modules](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](2000) NOT NULL,
	[ImageUrl] [nvarchar](2000) NULL,
	[OwnerId] [int] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[ModifiedById] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsPrivate] [bit] NOT NULL,
	[IsFeatured] [bit] NOT NULL,
 CONSTRAINT [PK_Modules] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Modules]  WITH CHECK ADD  CONSTRAINT [FK_Modules_AspNetUsers] FOREIGN KEY([OwnerId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO

ALTER TABLE [dbo].[Modules] CHECK CONSTRAINT [FK_Modules_AspNetUsers]
GO

ALTER TABLE [dbo].[Modules]  WITH CHECK ADD  CONSTRAINT [FK_Modules_AspNetUsers1] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO

ALTER TABLE [dbo].[Modules] CHECK CONSTRAINT [FK_Modules_AspNetUsers1]
GO

ALTER TABLE [dbo].[Modules]  WITH CHECK ADD  CONSTRAINT [FK_Modules_Modules] FOREIGN KEY([Id])
REFERENCES [dbo].[Modules] ([Id])
GO

ALTER TABLE [dbo].[Modules] CHECK CONSTRAINT [FK_Modules_Modules]
GO

/* Resources table */

CREATE TABLE [dbo].[Resources](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](2000) NOT NULL,
	[Url] [nvarchar](2000) NOT NULL,
	[ImageUrl] [nvarchar](2000) NULL,
	[OwnerId] [int] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[ModifiedById] [int] NOT NULL,
	[DifficultyLevel] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[ResourceType] [int] NOT NULL,
	[Module] [int] NOT NULL,
	[IsFeatured] [bit] NOT NULL,
 CONSTRAINT [PK_Resources] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Resources]  WITH CHECK ADD  CONSTRAINT [FK_Resources_Resources] FOREIGN KEY([Id])
REFERENCES [dbo].[Resources] ([Id])
GO

ALTER TABLE [dbo].[Resources] CHECK CONSTRAINT [FK_Resources_Resources]
GO

