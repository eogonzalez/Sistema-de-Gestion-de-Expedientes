USE [SGEODB]
GO
/****** Object:  Table [dbo].[VO_RequisitosVerificacion]    Script Date: 02/10/2017 09:26:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VO_RequisitosVerificacion](
	[idRequisito] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](150) NOT NULL,
	[descripcion] [varchar](500) NULL,
	[obligatorio] [bit] NOT NULL,
	[fecha_creacion] [date] NULL,
	[fecha_modificacion] [date] NULL,
	[estado] [char](2) NULL,
 CONSTRAINT [PK_VO_RequisitosVerificacion] PRIMARY KEY CLUSTERED 
(
	[idRequisito] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[VO_RequisitosVerificacion] ON
INSERT [dbo].[VO_RequisitosVerificacion] ([idRequisito], [nombre], [descripcion], [obligatorio], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (1, N'Factura de Importacion', N'Factura de Importacion', 1, CAST(0x6F3C0B00 AS Date), CAST(0x6F3C0B00 AS Date), N'A ')
SET IDENTITY_INSERT [dbo].[VO_RequisitosVerificacion] OFF
/****** Object:  Table [dbo].[S_SolicitudVerificacion]    Script Date: 02/10/2017 09:26:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[S_SolicitudVerificacion](
	[idSolicitudVerificacion] [int] NOT NULL,
	[idUsuario] [int] NOT NULL,
	[nombres] [varchar](50) NOT NULL,
	[apellidos] [varchar](50) NOT NULL,
	[direccion] [varchar](150) NOT NULL,
	[idDepartamento] [int] NOT NULL,
	[departamento] [varchar](50) NOT NULL,
	[correo] [varchar](50) NOT NULL,
	[telefono] [varchar](50) NOT NULL,
	[nombreRazonImpo] [varchar](100) NOT NULL,
	[direccionImpo] [varchar](150) NULL,
	[correoImpo] [varchar](50) NOT NULL,
	[idDeptoImpo] [int] NULL,
	[deptoImpo] [varchar](50) NULL,
	[NITImpo] [varchar](50) NULL,
	[telefonoImpo] [varchar](50) NULL,
	[nombreRazonExpo] [varchar](100) NULL,
	[direccionExpo] [varchar](150) NULL,
	[correoExpo] [varchar](50) NULL,
	[idDeptoExpo] [int] NULL,
	[deptoExpo] [varchar](50) NULL,
	[NITExpo] [varchar](50) NULL,
	[telefonoExpo] [varchar](50) NULL,
	[motivoSolicitud] [varchar](3500) NULL,
	[fecha_creacion] [date] NOT NULL,
	[fecha_modificacion] [date] NOT NULL,
	[idUsuarioAutoriza] [int] NULL,
	[estado] [char](3) NOT NULL,
	[fecha_envio] [date] NULL,
	[fecha_autorizacion] [date] NULL,
 CONSTRAINT [PK_S_SolicitudVerificacion] PRIMARY KEY CLUSTERED 
(
	[idSolicitudVerificacion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OP_RequisitosOpinionTecnica]    Script Date: 02/10/2017 09:26:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OP_RequisitosOpinionTecnica](
	[idRequisito] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](150) NOT NULL,
	[descripcion] [varchar](500) NULL,
	[obligatorio] [bit] NOT NULL,
	[fecha_creacion] [date] NULL,
	[fecha_modificacion] [date] NULL,
	[estado] [char](2) NULL,
 CONSTRAINT [PK_OP_RequisitosOpinionTecnica] PRIMARY KEY CLUSTERED 
(
	[idRequisito] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[OP_RequisitosOpinionTecnica] ON
INSERT [dbo].[OP_RequisitosOpinionTecnica] ([idRequisito], [nombre], [descripcion], [obligatorio], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (1, N'Factura de Importacion', N'Factura de Importacion', 1, CAST(0x6F3C0B00 AS Date), CAST(0x6F3C0B00 AS Date), N'A ')
INSERT [dbo].[OP_RequisitosOpinionTecnica] ([idRequisito], [nombre], [descripcion], [obligatorio], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (2, N'DPI', N'DPI', 0, CAST(0x6F3C0B00 AS Date), CAST(0x6F3C0B00 AS Date), N'A ')
INSERT [dbo].[OP_RequisitosOpinionTecnica] ([idRequisito], [nombre], [descripcion], [obligatorio], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (3, N'Factura de Importacion', N'Factura de Importacion', 1, CAST(0x6F3C0B00 AS Date), CAST(0x6F3C0B00 AS Date), N'A ')
SET IDENTITY_INSERT [dbo].[OP_RequisitosOpinionTecnica] OFF
/****** Object:  Table [dbo].[G_Usuarios_Seguridad]    Script Date: 02/10/2017 09:26:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[G_Usuarios_Seguridad](
	[corr_usuarios_ingreso] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario] [int] NOT NULL,
	[fecha_ultimo_acceso] [datetime] NOT NULL,
	[direccion_ip] [varchar](100) NOT NULL,
 CONSTRAINT [PK_g_usuarios_seguridad] PRIMARY KEY CLUSTERED 
(
	[corr_usuarios_ingreso] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[G_Usuarios_Seguridad] ON
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (1, 6, CAST(0x0000A6FF0112F85A AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (2, 6, CAST(0x0000A70100D6DFCD AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (3, 6, CAST(0x0000A70100EC49B5 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (4, 6, CAST(0x0000A70100ED51B6 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (5, 6, CAST(0x0000A70100F480EE AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (6, 6, CAST(0x0000A70100F731C4 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (7, 6, CAST(0x0000A70100F9E724 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (8, 6, CAST(0x0000A70100FD9601 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (9, 6, CAST(0x0000A7010100B4FF AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (10, 6, CAST(0x0000A70400B1DCA7 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (11, 6, CAST(0x0000A70401065296 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (12, 6, CAST(0x0000A705009CF591 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (13, 6, CAST(0x0000A70500A16798 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (14, 6, CAST(0x0000A70500C31548 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (15, 6, CAST(0x0000A70500C397AA AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (16, 6, CAST(0x0000A70500C48DCC AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (17, 6, CAST(0x0000A70500C55732 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (18, 6, CAST(0x0000A70500C7886F AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (19, 6, CAST(0x0000A70500C84FDA AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (20, 6, CAST(0x0000A70500C93902 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (21, 6, CAST(0x0000A705010A8AEE AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (22, 6, CAST(0x0000A705010FB8A3 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (23, 6, CAST(0x0000A7050110F63C AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (24, 6, CAST(0x0000A70501115FE5 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (25, 6, CAST(0x0000A70600BDD1A9 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (26, 6, CAST(0x0000A70600BE3A72 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (27, 6, CAST(0x0000A70600BF25FE AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (28, 6, CAST(0x0000A70600C3FE97 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (29, 6, CAST(0x0000A70600C53EF1 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (30, 7, CAST(0x0000A70600C5E27F AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (31, 6, CAST(0x0000A70600DB76C9 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (32, 6, CAST(0x0000A70600FA9B92 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (33, 6, CAST(0x0000A70600FEB597 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (34, 6, CAST(0x0000A70700A41967 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (35, 6, CAST(0x0000A70700A4A082 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (36, 6, CAST(0x0000A70700A8F5E7 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (37, 6, CAST(0x0000A70700AC4D90 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (38, 6, CAST(0x0000A70700AC73B8 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (39, 6, CAST(0x0000A70700ADB115 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (40, 6, CAST(0x0000A70700AE6087 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (41, 6, CAST(0x0000A70700B6A8CF AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (42, 6, CAST(0x0000A70700CB336C AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (43, 7, CAST(0x0000A70700CB4558 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (44, 7, CAST(0x0000A70700CB50A4 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (45, 7, CAST(0x0000A70700CB7486 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (46, 6, CAST(0x0000A70700CB937E AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (47, 7, CAST(0x0000A70700CBCB7C AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (48, 7, CAST(0x0000A70700CBF3AA AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (49, 6, CAST(0x0000A70700CBFD1C AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (50, 6, CAST(0x0000A70700CC1883 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (51, 7, CAST(0x0000A70700CC24D4 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (52, 7, CAST(0x0000A70700D08BA4 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (53, 6, CAST(0x0000A70700D46717 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (54, 6, CAST(0x0000A70700D66A0C AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (55, 6, CAST(0x0000A70700F0F138 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (56, 6, CAST(0x0000A70700FC87E2 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (57, 6, CAST(0x0000A70700FD248B AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (58, 7, CAST(0x0000A70700FD933F AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (59, 7, CAST(0x0000A70700FDDBF1 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (60, 7, CAST(0x0000A70700FDEDDE AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (61, 7, CAST(0x0000A70700FE07F5 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (62, 6, CAST(0x0000A70701035061 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (63, 6, CAST(0x0000A707010411F8 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (64, 6, CAST(0x0000A7070106D084 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (65, 6, CAST(0x0000A707010ADB63 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (66, 6, CAST(0x0000A707010BA814 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (67, 6, CAST(0x0000A71200F0D11C AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (68, 6, CAST(0x0000A71200F200FB AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (69, 6, CAST(0x0000A71200FB87FA AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (70, 6, CAST(0x0000A71201058B10 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (71, 6, CAST(0x0000A712010B554A AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (72, 6, CAST(0x0000A71300F025CF AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (73, 6, CAST(0x0000A713010B90AB AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (74, 6, CAST(0x0000A713010CAAF7 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (75, 6, CAST(0x0000A713010E5C9F AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (76, 6, CAST(0x0000A71400C274B0 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (77, 6, CAST(0x0000A71400EF2933 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (78, 6, CAST(0x0000A71400F82757 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (79, 6, CAST(0x0000A71400FF22DF AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (80, 6, CAST(0x0000A71401001E0A AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (81, 6, CAST(0x0000A715008EE959 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (82, 6, CAST(0x0000A71500F937A0 AS DateTime), N'::1')
SET IDENTITY_INSERT [dbo].[G_Usuarios_Seguridad] OFF
/****** Object:  Table [dbo].[g_usuarios]    Script Date: 02/10/2017 09:26:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[g_usuarios](
	[id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[nombres] [varchar](50) NOT NULL,
	[apellidos] [varchar](50) NOT NULL,
	[cui] [varchar](50) NULL,
	[telefono] [varchar](50) NULL,
	[idDepartamento] [int] NULL,
	[direccion] [varchar](150) NULL,
	[correo] [varchar](50) NOT NULL,
	[password] [varchar](200) NOT NULL,
	[fecha_registro] [datetime] NOT NULL,
	[estado] [nchar](1) NOT NULL,
	[id_usuarioAutoriza] [int] NULL,
 CONSTRAINT [pk_g_usuarios_id_usuario] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [uk_g_usuarios_correo] UNIQUE NONCLUSTERED 
(
	[correo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[g_usuarios] ON
INSERT [dbo].[g_usuarios] ([id_usuario], [nombres], [apellidos], [cui], [telefono], [idDepartamento], [direccion], [correo], [password], [fecha_registro], [estado], [id_usuarioAutoriza]) VALUES (6, N'Administrador', N'SGEO', N'123', N'87654321', 2, N'3ra Avenida Ciudad', N'egonzalez@mineco.gob.gt', N'MvwyAHWyVIGdOpCDw5T7ko0h+eGTjUPkshnxzpWyRb+O078ZULB1Mw4ZkPNhF0bdKQw11703cPRk4GMXS2dOCA==', CAST(0x0000A6FA00B90AD5 AS DateTime), N'A', NULL)
INSERT [dbo].[g_usuarios] ([id_usuario], [nombres], [apellidos], [cui], [telefono], [idDepartamento], [direccion], [correo], [password], [fecha_registro], [estado], [id_usuarioAutoriza]) VALUES (7, N'Eder', N'Gonzalez', N'987', NULL, NULL, NULL, N'djgonzalezeder@gmail.com', N'/lmIL5WTcHYMdyGB1EQdsKqWM9J5E7DSgUSsZv0c0BUTnoHK350STD+W2sdNmQXkoRy5NB2Z0yYfE30woP3tpQ==', CAST(0x0000A6FA00D19CDF AS DateTime), N'A', 6)
INSERT [dbo].[g_usuarios] ([id_usuario], [nombres], [apellidos], [cui], [telefono], [idDepartamento], [direccion], [correo], [password], [fecha_registro], [estado], [id_usuarioAutoriza]) VALUES (8, N'Cuitlahuac', N'Baños', N'987', NULL, NULL, NULL, N'cbanoshdz@yahoo.es', N'S81r3OjGOvjc9XWfblfZpkpzEvyL5Vrooc1bhiY1u9Ogk2PYKsewUDi28e8l+N/Y+WRpbPQM6NhlrhI5wu96WQ==', CAST(0x0000A6FA00D2AC9A AS DateTime), N'B', 6)
INSERT [dbo].[g_usuarios] ([id_usuario], [nombres], [apellidos], [cui], [telefono], [idDepartamento], [direccion], [correo], [password], [fecha_registro], [estado], [id_usuarioAutoriza]) VALUES (12, N'Ronald', N'Lopez', N'19', NULL, NULL, NULL, N'rlopez.inge@gmail.com', N'S8KrflBvBsKotaX5VdwbnEJ83jDhA0YO23FMdk8DhTtuMHQqN6YJnQEImWAqzkco3WtGRCYEp3OKyV79sRmeqQ==', CAST(0x0000A70100FD7A44 AS DateTime), N'R', NULL)
INSERT [dbo].[g_usuarios] ([id_usuario], [nombres], [apellidos], [cui], [telefono], [idDepartamento], [direccion], [correo], [password], [fecha_registro], [estado], [id_usuarioAutoriza]) VALUES (17, N'Hotmail', N'Eder', N'87654321', N'87654321', 1, N'3ra Av Ciudad', N'gonzalez_eder@hotmail.com', N'jRIwjAe3oi+XilYJRslnui69PD0HJE1A5lSCuXPOgFa2K73GWaX6kb7uWcOstLXw73j8DxvsXJvw1zWhVr7xeA==', CAST(0x0000A71300C20DD6 AS DateTime), N'R', 0)
SET IDENTITY_INSERT [dbo].[g_usuarios] OFF
/****** Object:  Table [dbo].[G_UsuarioPermiso]    Script Date: 02/10/2017 09:26:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[G_UsuarioPermiso](
	[corrUsuarioPermiso] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario] [int] NOT NULL,
	[id_tipousuario] [int] NOT NULL,
	[fecha_creacion] [datetime] NOT NULL,
	[fecha_modificacion] [datetime] NOT NULL,
	[estado] [char](2) NOT NULL,
	[id_usuarioAutoriza] [int] NOT NULL,
 CONSTRAINT [PK_G_UsuarioPermiso] PRIMARY KEY CLUSTERED 
(
	[corrUsuarioPermiso] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UX_G_UsuarioPermiso_id_usuario_id_tipousuario] UNIQUE NONCLUSTERED 
(
	[id_usuario] ASC,
	[id_tipousuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[G_UsuarioPermiso] ON
INSERT [dbo].[G_UsuarioPermiso] ([corrUsuarioPermiso], [id_usuario], [id_tipousuario], [fecha_creacion], [fecha_modificacion], [estado], [id_usuarioAutoriza]) VALUES (1, 7, 2, CAST(0x0000A70600C54968 AS DateTime), CAST(0x0000A70600C54968 AS DateTime), N'A ', 6)
INSERT [dbo].[G_UsuarioPermiso] ([corrUsuarioPermiso], [id_usuario], [id_tipousuario], [fecha_creacion], [fecha_modificacion], [estado], [id_usuarioAutoriza]) VALUES (4, 6, 1, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), N'A ', 6)
SET IDENTITY_INSERT [dbo].[G_UsuarioPermiso] OFF
/****** Object:  Table [dbo].[G_TipoUsuario]    Script Date: 02/10/2017 09:26:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[G_TipoUsuario](
	[id_tipousuario] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](150) NOT NULL,
	[descripcion] [varchar](500) NULL,
	[tipo_permiso] [varchar](3) NOT NULL,
	[fecha_creacion] [datetime] NOT NULL,
	[fecha_modificacion] [datetime] NOT NULL,
	[estado] [nchar](1) NOT NULL,
	[id_usuarioAutoriza] [int] NULL,
 CONSTRAINT [PK_G_TipoUsuario] PRIMARY KEY CLUSTERED 
(
	[id_tipousuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[G_TipoUsuario] ON
INSERT [dbo].[G_TipoUsuario] ([id_tipousuario], [nombre], [descripcion], [tipo_permiso], [fecha_creacion], [fecha_modificacion], [estado], [id_usuarioAutoriza]) VALUES (1, N'Administrador', N'Este usuario cuenta con todos los permisos dentro de la plataforma.', N'A', CAST(0x0000A6FD010502D0 AS DateTime), CAST(0x0000A6FD01050733 AS DateTime), N'A', NULL)
INSERT [dbo].[G_TipoUsuario] ([id_tipousuario], [nombre], [descripcion], [tipo_permiso], [fecha_creacion], [fecha_modificacion], [estado], [id_usuarioAutoriza]) VALUES (2, N'Funcionario DACE', N'Este usuario tiene permisos de aprobacion de solicitudes y emision de certificados', N'F', CAST(0x0000A6FE00CE4E11 AS DateTime), CAST(0x0000A6FE00CE4E78 AS DateTime), N'A', NULL)
INSERT [dbo].[G_TipoUsuario] ([id_tipousuario], [nombre], [descripcion], [tipo_permiso], [fecha_creacion], [fecha_modificacion], [estado], [id_usuarioAutoriza]) VALUES (3, N'Funcionario SAT', N'Este es un tipo de usuario para funcionarios sat.', N'I', CAST(0x0000A6FE00D9EA18 AS DateTime), CAST(0x0000A6FE00D9EA18 AS DateTime), N'A', NULL)
SET IDENTITY_INSERT [dbo].[G_TipoUsuario] OFF
/****** Object:  Table [dbo].[G_PermisoTipoUsuario]    Script Date: 02/10/2017 09:26:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[G_PermisoTipoUsuario](
	[corrPermisoTipoUsuario] [int] IDENTITY(1,1) NOT NULL,
	[id_tipousuario] [int] NOT NULL,
	[id_opcion] [int] NOT NULL,
	[insertar] [bit] NOT NULL,
	[acceder] [bit] NOT NULL,
	[editar] [bit] NOT NULL,
	[borrar] [bit] NOT NULL,
	[aprobar] [bit] NOT NULL,
	[rechazar] [bit] NOT NULL,
	[fecha_creacion] [datetime] NOT NULL,
	[fecha_modificacion] [datetime] NOT NULL,
	[estado] [char](2) NOT NULL,
	[id_usuarioAutoriza] [int] NOT NULL,
 CONSTRAINT [PK_G_PermisoTipoUsuario] PRIMARY KEY CLUSTERED 
(
	[corrPermisoTipoUsuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UX_G_PermisoTipoUsuario_id_tipousuario_id_opcion] UNIQUE NONCLUSTERED 
(
	[id_tipousuario] ASC,
	[id_opcion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[G_PermisoTipoUsuario] ON
INSERT [dbo].[G_PermisoTipoUsuario] ([corrPermisoTipoUsuario], [id_tipousuario], [id_opcion], [insertar], [acceder], [editar], [borrar], [aprobar], [rechazar], [fecha_creacion], [fecha_modificacion], [estado], [id_usuarioAutoriza]) VALUES (1, 1, 1, 1, 1, 0, 0, 0, 0, CAST(0x0000A70500C3A120 AS DateTime), CAST(0x0000A70500C3A120 AS DateTime), N'A ', 6)
INSERT [dbo].[G_PermisoTipoUsuario] ([corrPermisoTipoUsuario], [id_tipousuario], [id_opcion], [insertar], [acceder], [editar], [borrar], [aprobar], [rechazar], [fecha_creacion], [fecha_modificacion], [estado], [id_usuarioAutoriza]) VALUES (4, 1, 2, 1, 1, 0, 0, 0, 0, CAST(0x0000A70500C874A1 AS DateTime), CAST(0x0000A70500C874A1 AS DateTime), N'A ', 6)
INSERT [dbo].[G_PermisoTipoUsuario] ([corrPermisoTipoUsuario], [id_tipousuario], [id_opcion], [insertar], [acceder], [editar], [borrar], [aprobar], [rechazar], [fecha_creacion], [fecha_modificacion], [estado], [id_usuarioAutoriza]) VALUES (5, 1, 3, 1, 1, 0, 0, 0, 0, CAST(0x0000A70500C9480C AS DateTime), CAST(0x0000A70500C9480C AS DateTime), N'A ', 6)
INSERT [dbo].[G_PermisoTipoUsuario] ([corrPermisoTipoUsuario], [id_tipousuario], [id_opcion], [insertar], [acceder], [editar], [borrar], [aprobar], [rechazar], [fecha_creacion], [fecha_modificacion], [estado], [id_usuarioAutoriza]) VALUES (6, 1, 5, 1, 1, 0, 0, 0, 0, CAST(0x0000A70500C957BA AS DateTime), CAST(0x0000A70500C957BA AS DateTime), N'A ', 6)
INSERT [dbo].[G_PermisoTipoUsuario] ([corrPermisoTipoUsuario], [id_tipousuario], [id_opcion], [insertar], [acceder], [editar], [borrar], [aprobar], [rechazar], [fecha_creacion], [fecha_modificacion], [estado], [id_usuarioAutoriza]) VALUES (7, 1, 6, 1, 1, 1, 1, 0, 0, CAST(0x0000A70500C9A446 AS DateTime), CAST(0x0000A70500C9A446 AS DateTime), N'A ', 6)
INSERT [dbo].[G_PermisoTipoUsuario] ([corrPermisoTipoUsuario], [id_tipousuario], [id_opcion], [insertar], [acceder], [editar], [borrar], [aprobar], [rechazar], [fecha_creacion], [fecha_modificacion], [estado], [id_usuarioAutoriza]) VALUES (8, 1, 7, 1, 1, 1, 1, 0, 0, CAST(0x0000A70500C9B8E1 AS DateTime), CAST(0x0000A70500C9B8E1 AS DateTime), N'A ', 6)
INSERT [dbo].[G_PermisoTipoUsuario] ([corrPermisoTipoUsuario], [id_tipousuario], [id_opcion], [insertar], [acceder], [editar], [borrar], [aprobar], [rechazar], [fecha_creacion], [fecha_modificacion], [estado], [id_usuarioAutoriza]) VALUES (9, 1, 8, 1, 1, 1, 1, 0, 0, CAST(0x0000A70500C9D0A8 AS DateTime), CAST(0x0000A70500C9D0A8 AS DateTime), N'A ', 6)
INSERT [dbo].[G_PermisoTipoUsuario] ([corrPermisoTipoUsuario], [id_tipousuario], [id_opcion], [insertar], [acceder], [editar], [borrar], [aprobar], [rechazar], [fecha_creacion], [fecha_modificacion], [estado], [id_usuarioAutoriza]) VALUES (10, 1, 9, 1, 1, 1, 1, 1, 1, CAST(0x0000A70500C9E9D9 AS DateTime), CAST(0x0000A70500C9E9D9 AS DateTime), N'A ', 6)
INSERT [dbo].[G_PermisoTipoUsuario] ([corrPermisoTipoUsuario], [id_tipousuario], [id_opcion], [insertar], [acceder], [editar], [borrar], [aprobar], [rechazar], [fecha_creacion], [fecha_modificacion], [estado], [id_usuarioAutoriza]) VALUES (11, 1, 10, 1, 1, 0, 0, 0, 0, CAST(0x0000A70500CA030B AS DateTime), CAST(0x0000A70500CA030B AS DateTime), N'A ', 6)
INSERT [dbo].[G_PermisoTipoUsuario] ([corrPermisoTipoUsuario], [id_tipousuario], [id_opcion], [insertar], [acceder], [editar], [borrar], [aprobar], [rechazar], [fecha_creacion], [fecha_modificacion], [estado], [id_usuarioAutoriza]) VALUES (12, 1, 11, 1, 1, 1, 1, 1, 1, CAST(0x0000A70500CA17BB AS DateTime), CAST(0x0000A70500CA17BB AS DateTime), N'A ', 6)
INSERT [dbo].[G_PermisoTipoUsuario] ([corrPermisoTipoUsuario], [id_tipousuario], [id_opcion], [insertar], [acceder], [editar], [borrar], [aprobar], [rechazar], [fecha_creacion], [fecha_modificacion], [estado], [id_usuarioAutoriza]) VALUES (13, 1, 12, 1, 1, 1, 1, 1, 1, CAST(0x0000A70500CA20D5 AS DateTime), CAST(0x0000A70500CA20D5 AS DateTime), N'A ', 6)
INSERT [dbo].[G_PermisoTipoUsuario] ([corrPermisoTipoUsuario], [id_tipousuario], [id_opcion], [insertar], [acceder], [editar], [borrar], [aprobar], [rechazar], [fecha_creacion], [fecha_modificacion], [estado], [id_usuarioAutoriza]) VALUES (14, 2, 1, 1, 1, 0, 0, 0, 0, CAST(0x0000A70700CBB999 AS DateTime), CAST(0x0000A70700CBB999 AS DateTime), N'A ', 6)
INSERT [dbo].[G_PermisoTipoUsuario] ([corrPermisoTipoUsuario], [id_tipousuario], [id_opcion], [insertar], [acceder], [editar], [borrar], [aprobar], [rechazar], [fecha_creacion], [fecha_modificacion], [estado], [id_usuarioAutoriza]) VALUES (16, 2, 10, 1, 1, 0, 0, 0, 0, CAST(0x0000A70700D4AD03 AS DateTime), CAST(0x0000A70700D4AD03 AS DateTime), N'A ', 6)
INSERT [dbo].[G_PermisoTipoUsuario] ([corrPermisoTipoUsuario], [id_tipousuario], [id_opcion], [insertar], [acceder], [editar], [borrar], [aprobar], [rechazar], [fecha_creacion], [fecha_modificacion], [estado], [id_usuarioAutoriza]) VALUES (17, 2, 3, 1, 1, 0, 0, 0, 0, CAST(0x0000A70700FCB200 AS DateTime), CAST(0x0000A70700FCB200 AS DateTime), N'A ', 6)
INSERT [dbo].[G_PermisoTipoUsuario] ([corrPermisoTipoUsuario], [id_tipousuario], [id_opcion], [insertar], [acceder], [editar], [borrar], [aprobar], [rechazar], [fecha_creacion], [fecha_modificacion], [estado], [id_usuarioAutoriza]) VALUES (18, 2, 9, 1, 1, 0, 0, 0, 0, CAST(0x0000A70700FDCBF6 AS DateTime), CAST(0x0000A70700FDCBF6 AS DateTime), N'A ', 6)
INSERT [dbo].[G_PermisoTipoUsuario] ([corrPermisoTipoUsuario], [id_tipousuario], [id_opcion], [insertar], [acceder], [editar], [borrar], [aprobar], [rechazar], [fecha_creacion], [fecha_modificacion], [estado], [id_usuarioAutoriza]) VALUES (19, 1, 13, 1, 1, 0, 0, 0, 0, CAST(0x0000A7070106E72E AS DateTime), CAST(0x0000A7070106E72E AS DateTime), N'A ', 6)
INSERT [dbo].[G_PermisoTipoUsuario] ([corrPermisoTipoUsuario], [id_tipousuario], [id_opcion], [insertar], [acceder], [editar], [borrar], [aprobar], [rechazar], [fecha_creacion], [fecha_modificacion], [estado], [id_usuarioAutoriza]) VALUES (20, 1, 14, 1, 1, 0, 0, 0, 0, CAST(0x0000A707010BF0C0 AS DateTime), CAST(0x0000A707010BF0C0 AS DateTime), N'A ', 6)
INSERT [dbo].[G_PermisoTipoUsuario] ([corrPermisoTipoUsuario], [id_tipousuario], [id_opcion], [insertar], [acceder], [editar], [borrar], [aprobar], [rechazar], [fecha_creacion], [fecha_modificacion], [estado], [id_usuarioAutoriza]) VALUES (21, 1, 15, 1, 1, 0, 0, 0, 0, CAST(0x0000A712010E2710 AS DateTime), CAST(0x0000A712010E2710 AS DateTime), N'A ', 6)
INSERT [dbo].[G_PermisoTipoUsuario] ([corrPermisoTipoUsuario], [id_tipousuario], [id_opcion], [insertar], [acceder], [editar], [borrar], [aprobar], [rechazar], [fecha_creacion], [fecha_modificacion], [estado], [id_usuarioAutoriza]) VALUES (22, 1, 16, 1, 1, 0, 0, 0, 0, CAST(0x0000A71400F8EE3E AS DateTime), CAST(0x0000A71400F8EE3E AS DateTime), N'A ', 6)
INSERT [dbo].[G_PermisoTipoUsuario] ([corrPermisoTipoUsuario], [id_tipousuario], [id_opcion], [insertar], [acceder], [editar], [borrar], [aprobar], [rechazar], [fecha_creacion], [fecha_modificacion], [estado], [id_usuarioAutoriza]) VALUES (23, 1, 17, 1, 1, 0, 0, 0, 0, CAST(0x0000A71400F8F587 AS DateTime), CAST(0x0000A71400F8F587 AS DateTime), N'A ', 6)
INSERT [dbo].[G_PermisoTipoUsuario] ([corrPermisoTipoUsuario], [id_tipousuario], [id_opcion], [insertar], [acceder], [editar], [borrar], [aprobar], [rechazar], [fecha_creacion], [fecha_modificacion], [estado], [id_usuarioAutoriza]) VALUES (24, 1, 18, 1, 1, 0, 0, 0, 0, CAST(0x0000A71400FF6379 AS DateTime), CAST(0x0000A71400FF6379 AS DateTime), N'A ', 6)
SET IDENTITY_INSERT [dbo].[G_PermisoTipoUsuario] OFF
/****** Object:  Table [dbo].[G_Menu_Opcion]    Script Date: 02/10/2017 09:26:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[G_Menu_Opcion](
	[id_opcion] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[descripcion] [varchar](300) NOT NULL,
	[url] [varchar](150) NOT NULL,
	[id_padre] [int] NULL,
	[orden] [int] NULL,
	[visible] [bit] NULL,
	[obligatorio] [bit] NULL,
	[login] [bit] NULL,
	[id_usuarioAutoriza] [int] NULL,
	[estado] [char](2) NULL,
 CONSTRAINT [pk_g_menu_opcion_id_opcion] PRIMARY KEY CLUSTERED 
(
	[id_opcion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[G_Menu_Opcion] ON
INSERT [dbo].[G_Menu_Opcion] ([id_opcion], [nombre], [descripcion], [url], [id_padre], [orden], [visible], [obligatorio], [login], [id_usuarioAutoriza], [estado]) VALUES (1, N'Inicio', N'Inicio', N'~/', NULL, 1, 0, 1, 0, 6, N'A ')
INSERT [dbo].[G_Menu_Opcion] ([id_opcion], [nombre], [descripcion], [url], [id_padre], [orden], [visible], [obligatorio], [login], [id_usuarioAutoriza], [estado]) VALUES (2, N'Administracion', N'Administracion', N'#', NULL, 2, 1, 0, 1, 6, N'A ')
INSERT [dbo].[G_Menu_Opcion] ([id_opcion], [nombre], [descripcion], [url], [id_padre], [orden], [visible], [obligatorio], [login], [id_usuarioAutoriza], [estado]) VALUES (3, N'Solicitudes', N'Solicitudes', N'~/', NULL, 3, 1, 0, 1, 6, N'A ')
INSERT [dbo].[G_Menu_Opcion] ([id_opcion], [nombre], [descripcion], [url], [id_padre], [orden], [visible], [obligatorio], [login], [id_usuarioAutoriza], [estado]) VALUES (4, N'Registrarse', N'Registrarse', N'~/Account/Register', NULL, 4, 1, 0, 0, 6, N'A ')
INSERT [dbo].[G_Menu_Opcion] ([id_opcion], [nombre], [descripcion], [url], [id_padre], [orden], [visible], [obligatorio], [login], [id_usuarioAutoriza], [estado]) VALUES (5, N'Iniciar sesion', N'Iniciar sesion', N'~/Account/Login', NULL, 5, 1, 0, 0, 6, N'A ')
INSERT [dbo].[G_Menu_Opcion] ([id_opcion], [nombre], [descripcion], [url], [id_padre], [orden], [visible], [obligatorio], [login], [id_usuarioAutoriza], [estado]) VALUES (6, N'Perfiles de Usuario', N'Tipos de Usuario', N'~/Administracion/TipoUsuarios', 2, 1, 1, 0, 1, 6, N'A ')
INSERT [dbo].[G_Menu_Opcion] ([id_opcion], [nombre], [descripcion], [url], [id_padre], [orden], [visible], [obligatorio], [login], [id_usuarioAutoriza], [estado]) VALUES (7, N'Menu', N'Menu', N'~/Administracion/Menu', 2, 2, 1, 0, 1, 6, N'A ')
INSERT [dbo].[G_Menu_Opcion] ([id_opcion], [nombre], [descripcion], [url], [id_padre], [orden], [visible], [obligatorio], [login], [id_usuarioAutoriza], [estado]) VALUES (8, N'Administrar Cuenta', N'Administrar Cuenta', N'~/Account/Manage', NULL, 4, 1, 0, 1, 6, N'A ')
INSERT [dbo].[G_Menu_Opcion] ([id_opcion], [nombre], [descripcion], [url], [id_padre], [orden], [visible], [obligatorio], [login], [id_usuarioAutoriza], [estado]) VALUES (9, N'Solicitudes de Registro', N'Solicitudes de Registro', N'~/Account/SolicitudRegistro', 3, 1, 1, 0, 1, 6, N'A ')
INSERT [dbo].[G_Menu_Opcion] ([id_opcion], [nombre], [descripcion], [url], [id_padre], [orden], [visible], [obligatorio], [login], [id_usuarioAutoriza], [estado]) VALUES (10, N'Salir', N'Salir', N'~/Account/Logout', NULL, 6, 1, 0, 1, 6, N'A ')
INSERT [dbo].[G_Menu_Opcion] ([id_opcion], [nombre], [descripcion], [url], [id_padre], [orden], [visible], [obligatorio], [login], [id_usuarioAutoriza], [estado]) VALUES (11, N'Verificacion de Origen', N'Verificacion de Origen', N'~/Solicitudes/VerificacionOrigen', 3, 2, 1, 0, 1, 6, N'A ')
INSERT [dbo].[G_Menu_Opcion] ([id_opcion], [nombre], [descripcion], [url], [id_padre], [orden], [visible], [obligatorio], [login], [id_usuarioAutoriza], [estado]) VALUES (12, N'Permisos', N'Permisos', N'~/Administracion/PermisosPerfiles', 2, 3, 1, 0, 1, 6, N'A ')
INSERT [dbo].[G_Menu_Opcion] ([id_opcion], [nombre], [descripcion], [url], [id_padre], [orden], [visible], [obligatorio], [login], [id_usuarioAutoriza], [estado]) VALUES (13, N'Usuarios', N'Usuarios', N'~/Administracion/Usuarios', 2, 4, 1, 0, 1, 6, N'A ')
INSERT [dbo].[G_Menu_Opcion] ([id_opcion], [nombre], [descripcion], [url], [id_padre], [orden], [visible], [obligatorio], [login], [id_usuarioAutoriza], [estado]) VALUES (14, N'Opinion Tecnica', N'Opinion Tecnica', N'~/Solicitudes/VerificacionOrigen', 3, 3, 1, 0, 1, 6, N'A ')
INSERT [dbo].[G_Menu_Opcion] ([id_opcion], [nombre], [descripcion], [url], [id_padre], [orden], [visible], [obligatorio], [login], [id_usuarioAutoriza], [estado]) VALUES (15, N'Departamentos', N'Departamentos', N'~/Administracion/Departamentos', 2, 5, 1, 0, 1, 6, N'A ')
INSERT [dbo].[G_Menu_Opcion] ([id_opcion], [nombre], [descripcion], [url], [id_padre], [orden], [visible], [obligatorio], [login], [id_usuarioAutoriza], [estado]) VALUES (16, N'Requisitos', N'Requisitos', N'#', NULL, 3, 1, 0, 1, 6, N'A ')
INSERT [dbo].[G_Menu_Opcion] ([id_opcion], [nombre], [descripcion], [url], [id_padre], [orden], [visible], [obligatorio], [login], [id_usuarioAutoriza], [estado]) VALUES (17, N'Opinion Tecnica', N'Opinion Tecnica', N'~/Requisitos/OpinionTecnica', 16, 1, 1, 0, 1, 6, N'A ')
INSERT [dbo].[G_Menu_Opcion] ([id_opcion], [nombre], [descripcion], [url], [id_padre], [orden], [visible], [obligatorio], [login], [id_usuarioAutoriza], [estado]) VALUES (18, N'Verificacion', N'Verificacion', N'~/Requisitos/Verificacion', 16, 2, 1, 0, 1, 6, N'A ')
SET IDENTITY_INSERT [dbo].[G_Menu_Opcion] OFF
/****** Object:  Table [dbo].[G_Departamento]    Script Date: 02/10/2017 09:26:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[G_Departamento](
	[idDepartamento] [int] IDENTITY(1,1) NOT NULL,
	[codigoDepto] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[descripcion] [varchar](1000) NULL,
	[estado] [char](2) NOT NULL,
	[fecha_creacion] [date] NOT NULL,
	[fecha_modificacion] [date] NOT NULL,
 CONSTRAINT [PK_G_Departamento] PRIMARY KEY CLUSTERED 
(
	[idDepartamento] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UK_G_Departamento_codigoDepto] UNIQUE NONCLUSTERED 
(
	[codigoDepto] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[G_Departamento] ON
INSERT [dbo].[G_Departamento] ([idDepartamento], [codigoDepto], [nombre], [descripcion], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (1, 1, N'Guatemala', NULL, N'A ', CAST(0x6D3C0B00 AS Date), CAST(0x6D3C0B00 AS Date))
INSERT [dbo].[G_Departamento] ([idDepartamento], [codigoDepto], [nombre], [descripcion], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (2, 2, N'El Progreso', NULL, N'A ', CAST(0x6D3C0B00 AS Date), CAST(0x6D3C0B00 AS Date))
INSERT [dbo].[G_Departamento] ([idDepartamento], [codigoDepto], [nombre], [descripcion], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (3, 3, N'Sacatepequez', N'', N'A ', CAST(0x6D3C0B00 AS Date), CAST(0x6D3C0B00 AS Date))
SET IDENTITY_INSERT [dbo].[G_Departamento] OFF
