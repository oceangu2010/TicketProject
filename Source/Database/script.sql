SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ArriveProvince]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ArriveProvince](
	[PKId] [int] NOT NULL,
	[ProvinceName] [nvarchar](200) NULL,
	[Description] [nvarchar](200) NULL,
 CONSTRAINT [PK_ArriveProvince] PRIMARY KEY CLUSTERED 
(
	[PKId] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SysMenus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SysMenus](
	[MenuId] [int] NOT NULL,
	[ParentId] [int] NOT NULL,
	[MenuName] [nvarchar](100) NOT NULL,
	[LinkAddress] [nvarchar](200) NULL,
	[MenuLevel] [int] NOT NULL,
	[Sort] [int] NULL,
	[IsShow] [bit] NOT NULL,
	[IsSys] [bit] NOT NULL,
	[MenuTitle] [nvarchar](150) NULL,
	[MenuIcon] [nvarchar](100) NULL,
	[IsEnabled] [bit] NULL CONSTRAINT [DF_SystemMenus_IsEnabled]  DEFAULT ((1)),
 CONSTRAINT [PK_SystemMenus] PRIMARY KEY NONCLUSTERED 
(
	[MenuId] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1:表示一级，2：表示二级' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'SysMenus', @level2type=N'COLUMN', @level2name=N'MenuLevel'

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SysRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SysRoles](
	[PKId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](150) NOT NULL,
	[Description] [nvarchar](300) NULL,
 CONSTRAINT [PK_BackStageRole] PRIMARY KEY CLUSTERED 
(
	[PKId] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SysRoleMenuRelation]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SysRoleMenuRelation](
	[RoleId] [int] NOT NULL,
	[MenuId] [int] NOT NULL,
 CONSTRAINT [PK_BackStageRoleMenuRelation] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC,
	[MenuId] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SysUserRoleRelation]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SysUserRoleRelation](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_BackStageUserRoleRelation] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SysUserLogs]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SysUserLogs](
	[PKId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[LogDt] [datetime] NULL CONSTRAINT [DF_BackStageUserLogs_LogDt]  DEFAULT (getdate()),
	[LoginIP] [nvarchar](20) NULL,
	[LogContent] [nvarchar](2000) NULL,
 CONSTRAINT [PK_BackStageUserLogs] PRIMARY KEY CLUSTERED 
(
	[PKId] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SysUserInfo]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SysUserInfo](
	[PKId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](150) NOT NULL,
	[UserPwd] [nvarchar](150) NOT NULL,
	[Email] [nvarchar](200) NOT NULL,
	[RealName] [nvarchar](150) NULL,
	[QQ] [nvarchar](50) NULL,
	[PhoneNo] [nvarchar](50) NULL,
	[Gender] [bit] NULL,
	[Address] [nvarchar](300) NULL,
	[Photo] [image] NULL,
	[UserStatus] [bit] NULL CONSTRAINT [DF_SysUserInfo_UserStatus]  DEFAULT ((1)),
	[LastLoginTime] [datetime] NULL,
 CONSTRAINT [PK_BackStageUser] PRIMARY KEY CLUSTERED 
(
	[PKId] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ArriveCity]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ArriveCity](
	[PKId] [int] NOT NULL,
	[ArrivePKId] [int] NOT NULL,
	[CityName] [nvarchar](200) NULL,
	[Description] [nvarchar](200) NULL,
 CONSTRAINT [PK_ArriveCity] PRIMARY KEY CLUSTERED 
(
	[PKId] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SendCity]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SendCity](
	[PKId] [int] NOT NULL,
	[SendPKId] [int] NOT NULL,
	[CityName] [nvarchar](200) NULL,
	[Description] [nvarchar](200) NULL,
 CONSTRAINT [PK_SendCity] PRIMARY KEY CLUSTERED 
(
	[PKId] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SendProvince]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SendProvince](
	[PKId] [int] NOT NULL,
	[ProvinceName] [nvarchar](200) NULL,
	[Description] [nvarchar](200) NULL,
 CONSTRAINT [PK_SendProvince] PRIMARY KEY CLUSTERED 
(
	[PKId] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
