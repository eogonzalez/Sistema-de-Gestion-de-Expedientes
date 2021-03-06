USE [SGEODB]
GO
/****** Object:  Table [dbo].[WF_Tiempos]    Script Date: 04/22/2017 15:44:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WF_Tiempos](
	[id_WF_Tiempos] [int] IDENTITY(1,1) NOT NULL,
	[codigo_estado] [int] NOT NULL,
	[descripcion] [varchar](500) NOT NULL,
	[dias_max] [int] NOT NULL,
	[dias_min] [int] NOT NULL,
	[fecha_creacion] [datetime] NOT NULL,
	[fecha_modificacion] [datetime] NOT NULL,
	[estado] [nchar](3) NOT NULL,
 CONSTRAINT [PK_WF_Tiempos] PRIMARY KEY CLUSTERED 
(
	[id_WF_Tiempos] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[WF_Expediente]    Script Date: 04/22/2017 15:44:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WF_Expediente](
	[idWF_Expediente] [int] IDENTITY(1,1) NOT NULL,
	[id_expediente] [int] NOT NULL,
	[id_usuario_dace] [int] NOT NULL,
	[fecha_inicio] [datetime] NOT NULL,
	[sigla_estado] [varchar](100) NOT NULL,
	[estado_principal] [int] NOT NULL,
	[estado_alterno] [int] NOT NULL,
	[dia_max] [int] NOT NULL,
	[dia_min] [int] NOT NULL,
	[observaciones] [varchar](500) NULL,
	[fecha_final] [datetime] NOT NULL,
	[fecha_creacion] [datetime] NOT NULL,
	[fecha_modificacion] [datetime] NOT NULL,
	[estado] [nchar](3) NOT NULL,
 CONSTRAINT [PK_WF_Expediente] PRIMARY KEY CLUSTERED 
(
	[idWF_Expediente] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[WF_Adjuntos]    Script Date: 04/22/2017 15:44:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WF_Adjuntos](
	[corr_WF_Adjunto] [int] NOT NULL,
	[idWF_Expediente] [int] NOT NULL,
	[id_expediente] [int] NOT NULL,
	[codigo_estado] [nchar](10) NOT NULL,
	[id_WF_Tiempos] [nchar](10) NOT NULL,
	[path] [nchar](10) NULL,
	[nombreDocumentoOriginal] [nchar](10) NULL,
	[nombreDocumentoSistema] [nchar](10) NULL,
	[id_Tipo_Documento] [nchar](10) NULL,
	[observaciones] [nchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VO_RequisitosVerificacion]    Script Date: 04/22/2017 15:44:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VO_RequisitosVerificacion](
	[idRequisito] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](500) NOT NULL,
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
INSERT [dbo].[VO_RequisitosVerificacion] ([idRequisito], [nombre], [descripcion], [obligatorio], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (1, N'Oficio SAT', N'', 0, CAST(0x6F3C0B00 AS Date), CAST(0x933C0B00 AS Date), N'A ')
INSERT [dbo].[VO_RequisitosVerificacion] ([idRequisito], [nombre], [descripcion], [obligatorio], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (2, N'Factura de Importacion', N'', 1, CAST(0x833C0B00 AS Date), CAST(0xA73C0B00 AS Date), N'A ')
INSERT [dbo].[VO_RequisitosVerificacion] ([idRequisito], [nombre], [descripcion], [obligatorio], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (3, N'Requisto Verificacion Prueba', N'esta es una prueba, mas otra descripcion', 0, CAST(0x843C0B00 AS Date), CAST(0x843C0B00 AS Date), N'B ')
INSERT [dbo].[VO_RequisitosVerificacion] ([idRequisito], [nombre], [descripcion], [obligatorio], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (4, N'Estisticas del producto', N'', 0, CAST(0x923C0B00 AS Date), CAST(0x923C0B00 AS Date), N'A ')
INSERT [dbo].[VO_RequisitosVerificacion] ([idRequisito], [nombre], [descripcion], [obligatorio], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (5, N'Declaracion Aduanera', N'', 0, CAST(0xA73C0B00 AS Date), CAST(0xA73C0B00 AS Date), N'A ')
INSERT [dbo].[VO_RequisitosVerificacion] ([idRequisito], [nombre], [descripcion], [obligatorio], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (6, N'Certificado de Origen', N'', 0, CAST(0xA73C0B00 AS Date), CAST(0xA73C0B00 AS Date), N'A ')
INSERT [dbo].[VO_RequisitosVerificacion] ([idRequisito], [nombre], [descripcion], [obligatorio], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (7, N'Documento de Transporte', N'', 0, CAST(0xA73C0B00 AS Date), CAST(0xA73C0B00 AS Date), N'A ')
INSERT [dbo].[VO_RequisitosVerificacion] ([idRequisito], [nombre], [descripcion], [obligatorio], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (8, N'Otros Documentos', N'', 0, CAST(0xA73C0B00 AS Date), CAST(0xA73C0B00 AS Date), N'A ')
INSERT [dbo].[VO_RequisitosVerificacion] ([idRequisito], [nombre], [descripcion], [obligatorio], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (9, N'Documento de acreditación (Solicitante)', N'Documento que acredita al solicitante el poder legal de realizar el tramite de solicitud de verificacion de origen.', 0, CAST(0xA73C0B00 AS Date), CAST(0xA73C0B00 AS Date), N'A ')
INSERT [dbo].[VO_RequisitosVerificacion] ([idRequisito], [nombre], [descripcion], [obligatorio], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (10, N'Copia de Identificación', N'Copia de DPI o Pasaporte', 0, CAST(0xA73C0B00 AS Date), CAST(0xA73C0B00 AS Date), N'A ')
INSERT [dbo].[VO_RequisitosVerificacion] ([idRequisito], [nombre], [descripcion], [obligatorio], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (11, N'Acta de Constitución de la Empresa', N'', 0, CAST(0xA73C0B00 AS Date), CAST(0xA73C0B00 AS Date), N'A ')
INSERT [dbo].[VO_RequisitosVerificacion] ([idRequisito], [nombre], [descripcion], [obligatorio], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (12, N'RTU Ratificado (Solicitante)', N'', 0, CAST(0xA73C0B00 AS Date), CAST(0xA73C0B00 AS Date), N'A ')
INSERT [dbo].[VO_RequisitosVerificacion] ([idRequisito], [nombre], [descripcion], [obligatorio], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (13, N'RTU Ratificado (Importador)', N'', 0, CAST(0xA73C0B00 AS Date), CAST(0xA73C0B00 AS Date), N'A ')
INSERT [dbo].[VO_RequisitosVerificacion] ([idRequisito], [nombre], [descripcion], [obligatorio], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (14, N'DUA', N'', 0, CAST(0xA73C0B00 AS Date), CAST(0xA73C0B00 AS Date), N'A ')
SET IDENTITY_INSERT [dbo].[VO_RequisitosVerificacion] OFF
/****** Object:  Table [dbo].[S_SolicitudVerificacion]    Script Date: 04/22/2017 15:44:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[S_SolicitudVerificacion](
	[idSolicitudVerificacion] [int] NOT NULL,
	[idUsuario] [int] NOT NULL,
	[nombres] [varchar](300) NOT NULL,
	[apellidos] [varchar](300) NOT NULL,
	[direccion] [varchar](500) NOT NULL,
	[idDepartamento] [int] NOT NULL,
	[departamento] [varchar](500) NOT NULL,
	[correo] [varchar](150) NOT NULL,
	[telefono] [varchar](50) NOT NULL,
	[nombreRazonImpo] [varchar](500) NOT NULL,
	[direccionImpo] [varchar](500) NULL,
	[correoImpo] [varchar](150) NOT NULL,
	[idDeptoImpo] [int] NULL,
	[deptoImpo] [varchar](500) NULL,
	[NITImpo] [varchar](50) NULL,
	[telefonoImpo] [varchar](50) NULL,
	[nombreRazonExpo] [varchar](500) NULL,
	[direccionExpo] [varchar](500) NULL,
	[correoExpo] [varchar](150) NULL,
	[idDeptoExpo] [int] NULL,
	[deptoExpo] [varchar](500) NULL,
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
/****** Object:  Table [dbo].[OP_RequisitosOpinionTecnica]    Script Date: 04/22/2017 15:44:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OP_RequisitosOpinionTecnica](
	[idRequisito] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](300) NOT NULL,
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
INSERT [dbo].[OP_RequisitosOpinionTecnica] ([idRequisito], [nombre], [descripcion], [obligatorio], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (1, N'Oficio SAT', N'', 0, CAST(0x6F3C0B00 AS Date), CAST(0x933C0B00 AS Date), N'A ')
INSERT [dbo].[OP_RequisitosOpinionTecnica] ([idRequisito], [nombre], [descripcion], [obligatorio], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (2, N'RTU Ratificado', N'', 1, CAST(0x6F3C0B00 AS Date), CAST(0x923C0B00 AS Date), N'B ')
INSERT [dbo].[OP_RequisitosOpinionTecnica] ([idRequisito], [nombre], [descripcion], [obligatorio], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (3, N'Documento de Transporte', N'', 1, CAST(0x6F3C0B00 AS Date), CAST(0x923C0B00 AS Date), N'A ')
INSERT [dbo].[OP_RequisitosOpinionTecnica] ([idRequisito], [nombre], [descripcion], [obligatorio], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (4, N'Prueba Opinion', N'Prueba Opinión test', 1, CAST(0x833C0B00 AS Date), CAST(0x843C0B00 AS Date), N'B ')
INSERT [dbo].[OP_RequisitosOpinionTecnica] ([idRequisito], [nombre], [descripcion], [obligatorio], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (5, N'Certificado de Origen', N'', 1, CAST(0x923C0B00 AS Date), CAST(0x923C0B00 AS Date), N'A ')
INSERT [dbo].[OP_RequisitosOpinionTecnica] ([idRequisito], [nombre], [descripcion], [obligatorio], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (6, N'DUA', N'', 1, CAST(0x923C0B00 AS Date), CAST(0x923C0B00 AS Date), N'A ')
INSERT [dbo].[OP_RequisitosOpinionTecnica] ([idRequisito], [nombre], [descripcion], [obligatorio], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (7, N'RTU Ratificado', N'', 1, CAST(0x923C0B00 AS Date), CAST(0x923C0B00 AS Date), N'A ')
INSERT [dbo].[OP_RequisitosOpinionTecnica] ([idRequisito], [nombre], [descripcion], [obligatorio], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (8, N'Factura de Importacion', N'Factura de Importacion', 1, CAST(0x933C0B00 AS Date), CAST(0x933C0B00 AS Date), N'A ')
INSERT [dbo].[OP_RequisitosOpinionTecnica] ([idRequisito], [nombre], [descripcion], [obligatorio], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (9, N'Factura ejemplo', N'', 0, CAST(0x933C0B00 AS Date), CAST(0x933C0B00 AS Date), N'A ')
SET IDENTITY_INSERT [dbo].[OP_RequisitosOpinionTecnica] OFF
/****** Object:  Table [dbo].[G_Usuarios_Seguridad]    Script Date: 04/22/2017 15:44:05 ******/
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
	[direccion_ip] [varchar](150) NOT NULL,
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
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (83, 6, CAST(0x0000A719009934F0 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (84, 6, CAST(0x0000A7190099FD9C AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (85, 6, CAST(0x0000A719009A2BEE AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (86, 6, CAST(0x0000A719009AAA03 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (87, 6, CAST(0x0000A719009D7DAF AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (88, 6, CAST(0x0000A719009FD6F9 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (89, 6, CAST(0x0000A71900A017C2 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (90, 6, CAST(0x0000A71900A1F2EF AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (91, 6, CAST(0x0000A71900A3E110 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (92, 6, CAST(0x0000A71900C7619D AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (93, 6, CAST(0x0000A71900C8CE32 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (94, 6, CAST(0x0000A71900CB2EF6 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (95, 6, CAST(0x0000A71900D4C384 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (96, 6, CAST(0x0000A71900D92DBE AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (97, 6, CAST(0x0000A71900E201D1 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (98, 6, CAST(0x0000A71900E37215 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (99, 6, CAST(0x0000A71900E3B245 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (100, 6, CAST(0x0000A71900E4D221 AS DateTime), N'::1')
GO
print 'Processed 100 total records'
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (101, 6, CAST(0x0000A71900E8001A AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (102, 6, CAST(0x0000A719010A8C34 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (103, 6, CAST(0x0000A71901222284 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (104, 6, CAST(0x0000A7200125D08F AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (105, 6, CAST(0x0000A72100A78604 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (106, 6, CAST(0x0000A72100B6579A AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (107, 6, CAST(0x0000A72100C64172 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (108, 6, CAST(0x0000A72100C9982F AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (109, 6, CAST(0x0000A72100D5880E AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (110, 6, CAST(0x0000A7210100A735 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (111, 6, CAST(0x0000A7210102390A AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (112, 6, CAST(0x0000A72101075DA5 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (113, 6, CAST(0x0000A721010B12B8 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (114, 6, CAST(0x0000A721010BB1D3 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (115, 6, CAST(0x0000A72200B6A506 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (116, 6, CAST(0x0000A72200C7706F AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (117, 6, CAST(0x0000A72200C7B49D AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (118, 6, CAST(0x0000A72200C842B9 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (119, 6, CAST(0x0000A72200C9ADE7 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (120, 6, CAST(0x0000A72200CA7787 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (121, 6, CAST(0x0000A72200CBA35B AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (122, 6, CAST(0x0000A72200CD1560 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (123, 6, CAST(0x0000A72200CD9D69 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (124, 6, CAST(0x0000A72200CDEFA9 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (125, 6, CAST(0x0000A72200D448CF AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (126, 6, CAST(0x0000A72200EC3004 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (127, 6, CAST(0x0000A72200F90E0E AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (128, 6, CAST(0x0000A72200FA087F AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (129, 6, CAST(0x0000A72200FA9F99 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (130, 6, CAST(0x0000A72200FAFC9E AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (131, 6, CAST(0x0000A7220103B1E0 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (132, 6, CAST(0x0000A722010C2158 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (133, 6, CAST(0x0000A722010EAE3D AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (134, 6, CAST(0x0000A722010F4AA9 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (135, 6, CAST(0x0000A72201117A22 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (136, 6, CAST(0x0000A72300B81751 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (137, 6, CAST(0x0000A72300CBF42A AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (138, 6, CAST(0x0000A72300CEA87B AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (139, 6, CAST(0x0000A7230109EE36 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (140, 6, CAST(0x0000A7230110FE7B AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (141, 6, CAST(0x0000A7240097428D AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (142, 6, CAST(0x0000A72400A8CD2B AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (143, 6, CAST(0x0000A72400B21DBF AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (144, 6, CAST(0x0000A72400B2B307 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (145, 6, CAST(0x0000A72400B416FB AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (146, 6, CAST(0x0000A72400B8C4D3 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (147, 6, CAST(0x0000A72400BE45B8 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (148, 6, CAST(0x0000A72400BF56FB AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (149, 6, CAST(0x0000A72400CA38B6 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (150, 6, CAST(0x0000A72400CB5A50 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (151, 6, CAST(0x0000A72400D33CF6 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (152, 6, CAST(0x0000A72400F5A2A2 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (153, 6, CAST(0x0000A72400F60C70 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (154, 6, CAST(0x0000A72400F72C89 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (155, 6, CAST(0x0000A72400F8E2A6 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (156, 6, CAST(0x0000A72400FA11FF AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (157, 6, CAST(0x0000A7240109E0F6 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (158, 6, CAST(0x0000A724010AB76D AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (159, 6, CAST(0x0000A72401119286 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (160, 6, CAST(0x0000A72401129AA2 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (161, 6, CAST(0x0000A72700D30E8F AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (162, 6, CAST(0x0000A72700EEDA7C AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (163, 6, CAST(0x0000A72700F15250 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (164, 6, CAST(0x0000A72700F21213 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (165, 6, CAST(0x0000A72700F2826C AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (166, 6, CAST(0x0000A72700F2C656 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (167, 6, CAST(0x0000A72700F346C3 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (168, 6, CAST(0x0000A72700F411B2 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (169, 6, CAST(0x0000A72700F43476 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (170, 6, CAST(0x0000A72700F4C93B AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (171, 6, CAST(0x0000A72700F55C54 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (172, 6, CAST(0x0000A72700FF1DF7 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (173, 6, CAST(0x0000A72700FFEC64 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (174, 6, CAST(0x0000A72701048432 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (175, 6, CAST(0x0000A72800BA2833 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (176, 6, CAST(0x0000A72800BEB50A AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (177, 6, CAST(0x0000A72800C538AC AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (178, 6, CAST(0x0000A72800C9CFB5 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (179, 6, CAST(0x0000A72800EA4F7E AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (180, 6, CAST(0x0000A72800EAB5F4 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (181, 6, CAST(0x0000A728010D9CEF AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (182, 6, CAST(0x0000A728011120DE AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (183, 6, CAST(0x0000A72801160F8A AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (184, 6, CAST(0x0000A7280116B45D AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (185, 6, CAST(0x0000A7280116F40A AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (186, 6, CAST(0x0000A72900FB08E6 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (187, 6, CAST(0x0000A729010A49C6 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (188, 6, CAST(0x0000A72F00A2AD37 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (189, 6, CAST(0x0000A72F00A84254 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (190, 6, CAST(0x0000A72F00C7BA72 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (191, 6, CAST(0x0000A72F00C8B4AC AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (192, 6, CAST(0x0000A72F00C9A9F3 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (193, 6, CAST(0x0000A72F00F00D7C AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (194, 6, CAST(0x0000A72F00F20CD8 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (195, 6, CAST(0x0000A72F00FA0107 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (196, 6, CAST(0x0000A72F00FAE5CD AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (197, 6, CAST(0x0000A72F01035D15 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (198, 6, CAST(0x0000A72F0103B848 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (199, 6, CAST(0x0000A72F010F8CCB AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (200, 6, CAST(0x0000A72F011A73BB AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (201, 6, CAST(0x0000A72F011B0415 AS DateTime), N'::1')
GO
print 'Processed 200 total records'
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (202, 6, CAST(0x0000A72F011C540F AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (203, 6, CAST(0x0000A72F011D3A37 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (204, 6, CAST(0x0000A730008BA487 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (205, 6, CAST(0x0000A730008C704F AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (206, 6, CAST(0x0000A73000B9181D AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (207, 6, CAST(0x0000A73000C18200 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (208, 6, CAST(0x0000A73100FC7727 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (209, 6, CAST(0x0000A731010480BF AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (210, 6, CAST(0x0000A731010622BD AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (211, 6, CAST(0x0000A73101080C8E AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (212, 6, CAST(0x0000A7310109B857 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (213, 6, CAST(0x0000A731010A94B7 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (214, 6, CAST(0x0000A731010E0F74 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (215, 6, CAST(0x0000A7310110E741 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (216, 6, CAST(0x0000A73101118F1B AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (217, 6, CAST(0x0000A73101182C5D AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (218, 6, CAST(0x0000A731011B8D75 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (219, 6, CAST(0x0000A731011F5BEE AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (220, 6, CAST(0x0000A7310120EA4E AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (221, 6, CAST(0x0000A732009F090C AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (222, 6, CAST(0x0000A73200A0E0AC AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (223, 6, CAST(0x0000A73200A2BD0A AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (224, 6, CAST(0x0000A73200A35DB3 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (225, 6, CAST(0x0000A73200A903F7 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (226, 6, CAST(0x0000A732010CFAD3 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (227, 6, CAST(0x0000A73201103061 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (228, 6, CAST(0x0000A7320111D38B AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (229, 6, CAST(0x0000A7320115C53A AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (230, 6, CAST(0x0000A73201195E44 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (231, 6, CAST(0x0000A732011AC04B AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (232, 6, CAST(0x0000A7320127F83E AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (233, 6, CAST(0x0000A7320129344E AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (234, 6, CAST(0x0000A73500A5695A AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (235, 6, CAST(0x0000A73500A7F596 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (236, 6, CAST(0x0000A73500AE7A4A AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (237, 6, CAST(0x0000A73500B101A7 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (238, 6, CAST(0x0000A73500B70F66 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (239, 6, CAST(0x0000A73500B84EE4 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (240, 6, CAST(0x0000A73500B91E51 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (241, 6, CAST(0x0000A73500C3DDB4 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (242, 6, CAST(0x0000A73500C8ECDC AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (243, 6, CAST(0x0000A73500CFB608 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (244, 6, CAST(0x0000A73500EEE278 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (245, 6, CAST(0x0000A73500F86336 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (246, 6, CAST(0x0000A73500FD50EB AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (247, 6, CAST(0x0000A73501061B35 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (248, 6, CAST(0x0000A7350106A170 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (249, 6, CAST(0x0000A735010BCEE4 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (250, 6, CAST(0x0000A735010D5165 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (251, 6, CAST(0x0000A735011472A8 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (252, 6, CAST(0x0000A735011B91D1 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (253, 6, CAST(0x0000A7350120225A AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (254, 6, CAST(0x0000A7350120730C AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (255, 6, CAST(0x0000A7350126EFCC AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (256, 6, CAST(0x0000A736009C9B1A AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (257, 6, CAST(0x0000A73600A55598 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (258, 6, CAST(0x0000A73600AE69AF AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (259, 6, CAST(0x0000A73600C13AC1 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (260, 6, CAST(0x0000A73600D05C35 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (261, 6, CAST(0x0000A73600D2D293 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (262, 6, CAST(0x0000A73600D40606 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (263, 6, CAST(0x0000A73700949616 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (264, 6, CAST(0x0000A73700949A27 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (265, 6, CAST(0x0000A73700AB7455 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (266, 6, CAST(0x0000A73700B979B7 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (267, 6, CAST(0x0000A73700BAA52E AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (268, 6, CAST(0x0000A73700BB0E93 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (269, 6, CAST(0x0000A73700BBFA79 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (270, 6, CAST(0x0000A73700BD66E4 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (271, 6, CAST(0x0000A73700BE45C2 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (272, 6, CAST(0x0000A73700C2363A AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (273, 6, CAST(0x0000A73700C3E402 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (274, 6, CAST(0x0000A73700C42CBC AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (275, 6, CAST(0x0000A73700C8CC52 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (276, 6, CAST(0x0000A73700C8F73C AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (277, 6, CAST(0x0000A73700C93AE0 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (278, 6, CAST(0x0000A73700C9DE3E AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (279, 6, CAST(0x0000A73700F48068 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (280, 6, CAST(0x0000A73700FB1353 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (281, 6, CAST(0x0000A7370101CA76 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (282, 6, CAST(0x0000A7370103C73C AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (283, 6, CAST(0x0000A737010A3D16 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (284, 19, CAST(0x0000A737010BD7CB AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (285, 6, CAST(0x0000A737010E4B6E AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (286, 6, CAST(0x0000A738008E6992 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (287, 6, CAST(0x0000A7380090DBB5 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (288, 6, CAST(0x0000A73800958F60 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (289, 6, CAST(0x0000A73800968229 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (290, 6, CAST(0x0000A7380096CAE7 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (291, 6, CAST(0x0000A7380098A2B3 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (292, 6, CAST(0x0000A73800996098 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (293, 6, CAST(0x0000A738009AADFD AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (294, 6, CAST(0x0000A738009CA7E5 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (295, 6, CAST(0x0000A738009D1A3C AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (296, 6, CAST(0x0000A738009E2F0B AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (297, 6, CAST(0x0000A738009FD242 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (298, 6, CAST(0x0000A73800A1EF30 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (299, 6, CAST(0x0000A73800A29071 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (300, 6, CAST(0x0000A73800A2EB73 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (301, 6, CAST(0x0000A73800A3E602 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (302, 6, CAST(0x0000A73800A5851D AS DateTime), N'::1')
GO
print 'Processed 300 total records'
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (303, 6, CAST(0x0000A73800A66F7D AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (304, 6, CAST(0x0000A73800A7188B AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (305, 6, CAST(0x0000A73800A8B621 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (306, 6, CAST(0x0000A73800A9BC34 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (307, 6, CAST(0x0000A73800AA5D12 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (308, 6, CAST(0x0000A73800AADFB5 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (309, 6, CAST(0x0000A73800AB7EA3 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (310, 6, CAST(0x0000A73800ACFF95 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (311, 6, CAST(0x0000A73800B0C225 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (312, 6, CAST(0x0000A73800B24B36 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (313, 6, CAST(0x0000A73800B53F11 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (314, 6, CAST(0x0000A73800B8A78B AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (315, 6, CAST(0x0000A73800BD1F69 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (316, 6, CAST(0x0000A73800C35C67 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (317, 6, CAST(0x0000A73800C52A25 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (318, 6, CAST(0x0000A73800D4A97A AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (319, 6, CAST(0x0000A73800D69EC1 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (320, 6, CAST(0x0000A73800D7A126 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (321, 6, CAST(0x0000A73800EE5907 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (322, 6, CAST(0x0000A73800EF4FBC AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (323, 6, CAST(0x0000A73800EFDA1F AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (324, 6, CAST(0x0000A73800F0EF9E AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (325, 6, CAST(0x0000A73800F35E6E AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (326, 6, CAST(0x0000A73800F680D8 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (327, 6, CAST(0x0000A73800F70836 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (328, 6, CAST(0x0000A73800F7419B AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (329, 6, CAST(0x0000A73800FA2198 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (330, 6, CAST(0x0000A73800FB1775 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (331, 6, CAST(0x0000A73800FCC6DB AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (332, 6, CAST(0x0000A73800FEC653 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (333, 6, CAST(0x0000A73801000CF5 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (334, 6, CAST(0x0000A738010E01CD AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (335, 6, CAST(0x0000A738012BC12C AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (336, 6, CAST(0x0000A73900BA0E4B AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (337, 6, CAST(0x0000A73900C087DD AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (338, 6, CAST(0x0000A73900C471FD AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (339, 6, CAST(0x0000A73900CE593D AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (340, 6, CAST(0x0000A73900CF82FE AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (341, 6, CAST(0x0000A73900CFE47D AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (342, 6, CAST(0x0000A73900D0E8BC AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (343, 6, CAST(0x0000A73900D57EE2 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (344, 7, CAST(0x0000A73900F7A1E8 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (345, 6, CAST(0x0000A73900F7C8FF AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (346, 6, CAST(0x0000A73900FF30E6 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (347, 6, CAST(0x0000A739010193AA AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (348, 6, CAST(0x0000A73901048BCF AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (349, 6, CAST(0x0000A7390105C227 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (350, 6, CAST(0x0000A73901074C3B AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (351, 6, CAST(0x0000A73901079344 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (352, 6, CAST(0x0000A739010AA2E7 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (353, 6, CAST(0x0000A73C008B5473 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (354, 6, CAST(0x0000A73C008FF10D AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (355, 6, CAST(0x0000A73C00B0B113 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (356, 6, CAST(0x0000A73C00B7376C AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (357, 6, CAST(0x0000A73C00BB2DEA AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (358, 6, CAST(0x0000A73C00BDE5D6 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (359, 6, CAST(0x0000A73C00C0C269 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (360, 6, CAST(0x0000A73C00C6A419 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (361, 6, CAST(0x0000A73C00CF2878 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (362, 6, CAST(0x0000A73C00CF8751 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (363, 6, CAST(0x0000A73C00D3BD89 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (364, 6, CAST(0x0000A73C00EBB8D2 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (365, 6, CAST(0x0000A73C00EF74BD AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (366, 6, CAST(0x0000A73C00EFFF5E AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (367, 6, CAST(0x0000A73C00F2E921 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (368, 6, CAST(0x0000A73C00F34D5B AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (369, 6, CAST(0x0000A73C010E22F4 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (370, 6, CAST(0x0000A73C010EBF82 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (371, 6, CAST(0x0000A73C011255BB AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (372, 6, CAST(0x0000A73C011AA7E0 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (373, 6, CAST(0x0000A73E00AF86E8 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (374, 6, CAST(0x0000A73E00B0C2CC AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (375, 6, CAST(0x0000A73E00B76464 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (376, 6, CAST(0x0000A73E00B85703 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (377, 6, CAST(0x0000A73E00BD2647 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (378, 6, CAST(0x0000A73E00CF3ABB AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (379, 6, CAST(0x0000A73E00CF87BC AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (380, 6, CAST(0x0000A73E00CFC752 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (381, 6, CAST(0x0000A73E00CFEBB7 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (382, 6, CAST(0x0000A73E00D01EE3 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (383, 6, CAST(0x0000A73E00D0832E AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (384, 6, CAST(0x0000A73E00D38194 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (385, 6, CAST(0x0000A73E00D404BD AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (386, 6, CAST(0x0000A73E00D4395D AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (387, 6, CAST(0x0000A73E00D47C6F AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (388, 6, CAST(0x0000A73E00F7A060 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (389, 6, CAST(0x0000A73E00F9A096 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (390, 6, CAST(0x0000A73E0100ADB6 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (391, 6, CAST(0x0000A74300EEC04E AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (392, 6, CAST(0x0000A74300F0D921 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (393, 6, CAST(0x0000A74300F25F71 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (394, 6, CAST(0x0000A74A00B7CD34 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (395, 6, CAST(0x0000A74A00C9F54C AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (396, 6, CAST(0x0000A74A00CB82D8 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (397, 6, CAST(0x0000A74A00CFD49C AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (398, 6, CAST(0x0000A74A00D091BB AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (399, 6, CAST(0x0000A74A00D1B882 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (400, 6, CAST(0x0000A74A00D4E28B AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (401, 6, CAST(0x0000A74A00F97306 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (402, 6, CAST(0x0000A74A0107C54E AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (403, 6, CAST(0x0000A74A0108608C AS DateTime), N'::1')
GO
print 'Processed 400 total records'
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (404, 6, CAST(0x0000A74A010C7F6A AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (405, 6, CAST(0x0000A74A010CE1F3 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (406, 6, CAST(0x0000A74A010D1B50 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (407, 6, CAST(0x0000A74A010D6AFD AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (408, 6, CAST(0x0000A74B00ABB3AC AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (409, 6, CAST(0x0000A74B00E5DAEE AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (410, 6, CAST(0x0000A74B00EC1CBE AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (411, 6, CAST(0x0000A74B00EDA061 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (412, 6, CAST(0x0000A74B00F0B217 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (413, 6, CAST(0x0000A74B00F1F598 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (414, 6, CAST(0x0000A74B00F43247 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (415, 6, CAST(0x0000A74B00F56DB2 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (416, 6, CAST(0x0000A74B010293CD AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (417, 6, CAST(0x0000A74B0104DE6F AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (418, 6, CAST(0x0000A74B0108A6DC AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (419, 6, CAST(0x0000A74C00D49B8F AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (420, 6, CAST(0x0000A74C00F98DD8 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (421, 6, CAST(0x0000A74C00FA78E9 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (422, 6, CAST(0x0000A74C00FC530A AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (423, 6, CAST(0x0000A74D008B55B8 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (424, 6, CAST(0x0000A74D00955E06 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (425, 6, CAST(0x0000A74D0096319E AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (426, 6, CAST(0x0000A74D0097001F AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (427, 6, CAST(0x0000A74D0098A227 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (428, 6, CAST(0x0000A74D009AAEFE AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (429, 6, CAST(0x0000A74D009B4A2C AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (430, 6, CAST(0x0000A74D009BAAAF AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (431, 6, CAST(0x0000A74D009F70E7 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (432, 6, CAST(0x0000A74D00A0A0EE AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (433, 6, CAST(0x0000A74D00A204C1 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (434, 6, CAST(0x0000A74D00AE2DA4 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (435, 6, CAST(0x0000A74D00AF140D AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (436, 6, CAST(0x0000A74D00AFDBB0 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (437, 6, CAST(0x0000A74D00F2F94E AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (438, 6, CAST(0x0000A74D00F395BA AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (439, 6, CAST(0x0000A74D00F4BFB3 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (440, 6, CAST(0x0000A74D00F6D9FD AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (441, 6, CAST(0x0000A74D00F77AB3 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (442, 6, CAST(0x0000A74D00F7E221 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (443, 6, CAST(0x0000A74D00FF8139 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (444, 6, CAST(0x0000A74D01026374 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (445, 6, CAST(0x0000A74D01043C69 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (446, 6, CAST(0x0000A74D0104BFA2 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (447, 6, CAST(0x0000A74E00B956D1 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (448, 6, CAST(0x0000A74E00BBA4AF AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (449, 6, CAST(0x0000A74E00F2CBC5 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (450, 6, CAST(0x0000A74E0109425D AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (451, 6, CAST(0x0000A74E010BA582 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (452, 6, CAST(0x0000A74E011749CF AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (453, 6, CAST(0x0000A74E011B1B94 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (454, 6, CAST(0x0000A74E011BAB00 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (455, 6, CAST(0x0000A75100F7E886 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (456, 6, CAST(0x0000A75100FDF9F7 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (457, 6, CAST(0x0000A75100FEAB3A AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (458, 6, CAST(0x0000A75100FF61DB AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (459, 6, CAST(0x0000A7510102CFBB AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (460, 6, CAST(0x0000A7510103AFFC AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (461, 6, CAST(0x0000A75101046B6E AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (462, 6, CAST(0x0000A75101069333 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (463, 6, CAST(0x0000A75200973456 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (464, 6, CAST(0x0000A752009C3A5E AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (465, 6, CAST(0x0000A752009C7FDD AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (466, 6, CAST(0x0000A75200A5111D AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (467, 6, CAST(0x0000A75200AC3837 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (468, 6, CAST(0x0000A75200AD04F5 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (469, 6, CAST(0x0000A75200AD54B9 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (470, 6, CAST(0x0000A75200AFAD2D AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (471, 6, CAST(0x0000A75200B08420 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (472, 6, CAST(0x0000A75200BAD646 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (473, 6, CAST(0x0000A75200BB8BEA AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (474, 6, CAST(0x0000A75200BC7352 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (475, 6, CAST(0x0000A75200C62D0B AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (476, 6, CAST(0x0000A75200C90E93 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (477, 6, CAST(0x0000A75200CAEC53 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (478, 6, CAST(0x0000A75200CC9D48 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (479, 6, CAST(0x0000A75200CE50E3 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (480, 6, CAST(0x0000A75200D04783 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (481, 6, CAST(0x0000A75200D40BAC AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (482, 6, CAST(0x0000A75900BF3F50 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (483, 6, CAST(0x0000A75A00AFB6AC AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (484, 6, CAST(0x0000A75C0107F822 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (485, 6, CAST(0x0000A75C0128F9F0 AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (486, 6, CAST(0x0000A75C012ADD6F AS DateTime), N'::1')
INSERT [dbo].[G_Usuarios_Seguridad] ([corr_usuarios_ingreso], [id_usuario], [fecha_ultimo_acceso], [direccion_ip]) VALUES (487, 6, CAST(0x0000A75C012B7ABB AS DateTime), N'::1')
SET IDENTITY_INSERT [dbo].[G_Usuarios_Seguridad] OFF
/****** Object:  Table [dbo].[g_usuarios]    Script Date: 04/22/2017 15:44:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[g_usuarios](
	[id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[nombres] [varchar](300) NOT NULL,
	[apellidos] [varchar](300) NOT NULL,
	[cui] [varchar](150) NULL,
	[telefono] [varchar](50) NULL,
	[idDepartamento] [int] NULL,
	[direccion] [varchar](500) NULL,
	[correo] [varchar](150) NOT NULL,
	[password] [varchar](300) NOT NULL,
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
INSERT [dbo].[g_usuarios] ([id_usuario], [nombres], [apellidos], [cui], [telefono], [idDepartamento], [direccion], [correo], [password], [fecha_registro], [estado], [id_usuarioAutoriza]) VALUES (18, N'Viceministro', N'Integración y comercio Exterior', N'2341', N'24120200', 1, N'8va Av 10-43 Zona 1', N'elacs@mineco.gob.gt', N'HPsmKwRwvGul2UkyTWKDu6F/wuBA7/8l9JJBZY4iljKH36O6IuyaAJgtuy4AnqvVJFG9O5fjjKqRuBpVXcRxEw==', CAST(0x0000A72100C96AA8 AS DateTime), N'A', 6)
INSERT [dbo].[g_usuarios] ([id_usuario], [nombres], [apellidos], [cui], [telefono], [idDepartamento], [direccion], [correo], [password], [fecha_registro], [estado], [id_usuarioAutoriza]) VALUES (19, N'Sofia', N'Mejicanos', N'987', N'24120200', 1, N'8va Av 10-43 Zona 1', N'smejicanos@mineco.gob.gt', N'oZrroBQv0pLTFyviQQ/U3/6ljfeQ9em2g87I8B9Opkhhif4eErxsNfXedar/QjjROqcwhmxI/M1NMgrE3gau7g==', CAST(0x0000A737010A0453 AS DateTime), N'A', 6)
SET IDENTITY_INSERT [dbo].[g_usuarios] OFF
/****** Object:  Table [dbo].[G_UsuarioPermiso]    Script Date: 04/22/2017 15:44:05 ******/
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
INSERT [dbo].[G_UsuarioPermiso] ([corrUsuarioPermiso], [id_usuario], [id_tipousuario], [fecha_creacion], [fecha_modificacion], [estado], [id_usuarioAutoriza]) VALUES (5, 18, 1, CAST(0x0000A72100C9DB8D AS DateTime), CAST(0x0000A72100C9DB8D AS DateTime), N'A ', 6)
INSERT [dbo].[G_UsuarioPermiso] ([corrUsuarioPermiso], [id_usuario], [id_tipousuario], [fecha_creacion], [fecha_modificacion], [estado], [id_usuarioAutoriza]) VALUES (6, 19, 2, CAST(0x0000A737010BA83A AS DateTime), CAST(0x0000A737010BA83A AS DateTime), N'A ', 6)
SET IDENTITY_INSERT [dbo].[G_UsuarioPermiso] OFF
/****** Object:  Table [dbo].[G_TipoUsuario]    Script Date: 04/22/2017 15:44:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[G_TipoUsuario](
	[id_tipousuario] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](500) NOT NULL,
	[descripcion] [varchar](500) NULL,
	[tipo_permiso] [varchar](3) NULL,
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
INSERT [dbo].[G_TipoUsuario] ([id_tipousuario], [nombre], [descripcion], [tipo_permiso], [fecha_creacion], [fecha_modificacion], [estado], [id_usuarioAutoriza]) VALUES (2, N'Técnico de Origen', N'Este usuario tiene permisos de aprobacion de solicitudes y emision de certificados.', N'F', CAST(0x0000A6FE00CE4E11 AS DateTime), CAST(0x0000A73600A5753B AS DateTime), N'A', 6)
INSERT [dbo].[G_TipoUsuario] ([id_tipousuario], [nombre], [descripcion], [tipo_permiso], [fecha_creacion], [fecha_modificacion], [estado], [id_usuarioAutoriza]) VALUES (3, N'Técnico SAT', N'Este es un tipo de usuario para funcionarios sat.', N'I', CAST(0x0000A6FE00D9EA18 AS DateTime), CAST(0x0000A73600A595B2 AS DateTime), N'A', 6)
INSERT [dbo].[G_TipoUsuario] ([id_tipousuario], [nombre], [descripcion], [tipo_permiso], [fecha_creacion], [fecha_modificacion], [estado], [id_usuarioAutoriza]) VALUES (4, N'Empresarios', N'Este usuario es cualquier usuario, el cual tiene permiso para generar solicitud', N'E', CAST(0x0000A72100C75306 AS DateTime), CAST(0x0000A73600A5BA08 AS DateTime), N'A', 6)
INSERT [dbo].[G_TipoUsuario] ([id_tipousuario], [nombre], [descripcion], [tipo_permiso], [fecha_creacion], [fecha_modificacion], [estado], [id_usuarioAutoriza]) VALUES (5, N'Supervisor', N'Supervisor 1', NULL, CAST(0x0000A72300CEC679 AS DateTime), CAST(0x0000A724010ADD9A AS DateTime), N'B', 6)
SET IDENTITY_INSERT [dbo].[G_TipoUsuario] OFF
/****** Object:  Table [dbo].[G_PermisoTipoUsuario]    Script Date: 04/22/2017 15:44:05 ******/
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
INSERT [dbo].[G_PermisoTipoUsuario] ([corrPermisoTipoUsuario], [id_tipousuario], [id_opcion], [insertar], [acceder], [editar], [borrar], [aprobar], [rechazar], [fecha_creacion], [fecha_modificacion], [estado], [id_usuarioAutoriza]) VALUES (14, 2, 1, 1, 1, 0, 0, 0, 0, CAST(0x0000A70700CBB999 AS DateTime), CAST(0x0000A73900CE8431 AS DateTime), N'B ', 6)
INSERT [dbo].[G_PermisoTipoUsuario] ([corrPermisoTipoUsuario], [id_tipousuario], [id_opcion], [insertar], [acceder], [editar], [borrar], [aprobar], [rechazar], [fecha_creacion], [fecha_modificacion], [estado], [id_usuarioAutoriza]) VALUES (16, 2, 10, 1, 1, 1, 1, 1, 1, CAST(0x0000A70700D4AD03 AS DateTime), CAST(0x0000A73900D5AD5E AS DateTime), N'B ', 6)
INSERT [dbo].[G_PermisoTipoUsuario] ([corrPermisoTipoUsuario], [id_tipousuario], [id_opcion], [insertar], [acceder], [editar], [borrar], [aprobar], [rechazar], [fecha_creacion], [fecha_modificacion], [estado], [id_usuarioAutoriza]) VALUES (17, 2, 3, 0, 1, 0, 0, 0, 0, CAST(0x0000A70700FCB200 AS DateTime), CAST(0x0000A73900D62061 AS DateTime), N'A ', 6)
INSERT [dbo].[G_PermisoTipoUsuario] ([corrPermisoTipoUsuario], [id_tipousuario], [id_opcion], [insertar], [acceder], [editar], [borrar], [aprobar], [rechazar], [fecha_creacion], [fecha_modificacion], [estado], [id_usuarioAutoriza]) VALUES (18, 2, 9, 0, 1, 0, 0, 0, 0, CAST(0x0000A70700FDCBF6 AS DateTime), CAST(0x0000A73900D61C87 AS DateTime), N'A ', 6)
INSERT [dbo].[G_PermisoTipoUsuario] ([corrPermisoTipoUsuario], [id_tipousuario], [id_opcion], [insertar], [acceder], [editar], [borrar], [aprobar], [rechazar], [fecha_creacion], [fecha_modificacion], [estado], [id_usuarioAutoriza]) VALUES (19, 1, 13, 1, 1, 0, 0, 0, 0, CAST(0x0000A7070106E72E AS DateTime), CAST(0x0000A7070106E72E AS DateTime), N'A ', 6)
INSERT [dbo].[G_PermisoTipoUsuario] ([corrPermisoTipoUsuario], [id_tipousuario], [id_opcion], [insertar], [acceder], [editar], [borrar], [aprobar], [rechazar], [fecha_creacion], [fecha_modificacion], [estado], [id_usuarioAutoriza]) VALUES (20, 1, 14, 1, 1, 0, 0, 0, 0, CAST(0x0000A707010BF0C0 AS DateTime), CAST(0x0000A707010BF0C0 AS DateTime), N'A ', 6)
INSERT [dbo].[G_PermisoTipoUsuario] ([corrPermisoTipoUsuario], [id_tipousuario], [id_opcion], [insertar], [acceder], [editar], [borrar], [aprobar], [rechazar], [fecha_creacion], [fecha_modificacion], [estado], [id_usuarioAutoriza]) VALUES (21, 1, 15, 1, 1, 0, 0, 0, 0, CAST(0x0000A712010E2710 AS DateTime), CAST(0x0000A712010E2710 AS DateTime), N'A ', 6)
INSERT [dbo].[G_PermisoTipoUsuario] ([corrPermisoTipoUsuario], [id_tipousuario], [id_opcion], [insertar], [acceder], [editar], [borrar], [aprobar], [rechazar], [fecha_creacion], [fecha_modificacion], [estado], [id_usuarioAutoriza]) VALUES (22, 1, 16, 1, 1, 0, 0, 0, 0, CAST(0x0000A71400F8EE3E AS DateTime), CAST(0x0000A71400F8EE3E AS DateTime), N'A ', 6)
INSERT [dbo].[G_PermisoTipoUsuario] ([corrPermisoTipoUsuario], [id_tipousuario], [id_opcion], [insertar], [acceder], [editar], [borrar], [aprobar], [rechazar], [fecha_creacion], [fecha_modificacion], [estado], [id_usuarioAutoriza]) VALUES (23, 1, 17, 1, 1, 0, 0, 0, 0, CAST(0x0000A71400F8F587 AS DateTime), CAST(0x0000A71400F8F587 AS DateTime), N'A ', 6)
INSERT [dbo].[G_PermisoTipoUsuario] ([corrPermisoTipoUsuario], [id_tipousuario], [id_opcion], [insertar], [acceder], [editar], [borrar], [aprobar], [rechazar], [fecha_creacion], [fecha_modificacion], [estado], [id_usuarioAutoriza]) VALUES (24, 1, 18, 1, 1, 0, 0, 0, 0, CAST(0x0000A71400FF6379 AS DateTime), CAST(0x0000A71400FF6379 AS DateTime), N'A ', 6)
INSERT [dbo].[G_PermisoTipoUsuario] ([corrPermisoTipoUsuario], [id_tipousuario], [id_opcion], [insertar], [acceder], [editar], [borrar], [aprobar], [rechazar], [fecha_creacion], [fecha_modificacion], [estado], [id_usuarioAutoriza]) VALUES (25, 1, 19, 1, 1, 0, 0, 0, 0, CAST(0x0000A72800C58EA6 AS DateTime), CAST(0x0000A72800C58EA6 AS DateTime), N'A ', 6)
INSERT [dbo].[G_PermisoTipoUsuario] ([corrPermisoTipoUsuario], [id_tipousuario], [id_opcion], [insertar], [acceder], [editar], [borrar], [aprobar], [rechazar], [fecha_creacion], [fecha_modificacion], [estado], [id_usuarioAutoriza]) VALUES (26, 1, 20, 1, 1, 0, 0, 0, 0, CAST(0x0000A73500C4D50D AS DateTime), CAST(0x0000A73500C4D50D AS DateTime), N'A ', 6)
INSERT [dbo].[G_PermisoTipoUsuario] ([corrPermisoTipoUsuario], [id_tipousuario], [id_opcion], [insertar], [acceder], [editar], [borrar], [aprobar], [rechazar], [fecha_creacion], [fecha_modificacion], [estado], [id_usuarioAutoriza]) VALUES (27, 1, 21, 1, 1, 0, 0, 0, 0, CAST(0x0000A73600A0684A AS DateTime), CAST(0x0000A73600A0684A AS DateTime), N'A ', 6)
INSERT [dbo].[G_PermisoTipoUsuario] ([corrPermisoTipoUsuario], [id_tipousuario], [id_opcion], [insertar], [acceder], [editar], [borrar], [aprobar], [rechazar], [fecha_creacion], [fecha_modificacion], [estado], [id_usuarioAutoriza]) VALUES (28, 2, 16, 0, 1, 0, 0, 0, 0, CAST(0x0000A73600A5D98B AS DateTime), CAST(0x0000A73900D618B7 AS DateTime), N'A ', 6)
INSERT [dbo].[G_PermisoTipoUsuario] ([corrPermisoTipoUsuario], [id_tipousuario], [id_opcion], [insertar], [acceder], [editar], [borrar], [aprobar], [rechazar], [fecha_creacion], [fecha_modificacion], [estado], [id_usuarioAutoriza]) VALUES (29, 2, 17, 0, 1, 0, 0, 0, 0, CAST(0x0000A73600A5E386 AS DateTime), CAST(0x0000A73900D614A8 AS DateTime), N'A ', 6)
INSERT [dbo].[G_PermisoTipoUsuario] ([corrPermisoTipoUsuario], [id_tipousuario], [id_opcion], [insertar], [acceder], [editar], [borrar], [aprobar], [rechazar], [fecha_creacion], [fecha_modificacion], [estado], [id_usuarioAutoriza]) VALUES (30, 2, 18, 0, 1, 0, 0, 0, 0, CAST(0x0000A73600A5E98D AS DateTime), CAST(0x0000A73900D60F91 AS DateTime), N'A ', 6)
INSERT [dbo].[G_PermisoTipoUsuario] ([corrPermisoTipoUsuario], [id_tipousuario], [id_opcion], [insertar], [acceder], [editar], [borrar], [aprobar], [rechazar], [fecha_creacion], [fecha_modificacion], [estado], [id_usuarioAutoriza]) VALUES (31, 2, 2, 0, 1, 0, 0, 0, 0, CAST(0x0000A73600A5F32A AS DateTime), CAST(0x0000A73900D5FBC8 AS DateTime), N'A ', 6)
INSERT [dbo].[G_PermisoTipoUsuario] ([corrPermisoTipoUsuario], [id_tipousuario], [id_opcion], [insertar], [acceder], [editar], [borrar], [aprobar], [rechazar], [fecha_creacion], [fecha_modificacion], [estado], [id_usuarioAutoriza]) VALUES (32, 2, 15, 0, 1, 0, 0, 0, 0, CAST(0x0000A73600A5FFE8 AS DateTime), CAST(0x0000A73900D5F794 AS DateTime), N'A ', 6)
INSERT [dbo].[G_PermisoTipoUsuario] ([corrPermisoTipoUsuario], [id_tipousuario], [id_opcion], [insertar], [acceder], [editar], [borrar], [aprobar], [rechazar], [fecha_creacion], [fecha_modificacion], [estado], [id_usuarioAutoriza]) VALUES (33, 2, 19, 0, 1, 0, 0, 0, 0, CAST(0x0000A73600A60485 AS DateTime), CAST(0x0000A73900D5F346 AS DateTime), N'A ', 6)
INSERT [dbo].[G_PermisoTipoUsuario] ([corrPermisoTipoUsuario], [id_tipousuario], [id_opcion], [insertar], [acceder], [editar], [borrar], [aprobar], [rechazar], [fecha_creacion], [fecha_modificacion], [estado], [id_usuarioAutoriza]) VALUES (34, 2, 21, 0, 1, 0, 0, 0, 0, CAST(0x0000A73600A612A1 AS DateTime), CAST(0x0000A73900D5EF62 AS DateTime), N'A ', 6)
INSERT [dbo].[G_PermisoTipoUsuario] ([corrPermisoTipoUsuario], [id_tipousuario], [id_opcion], [insertar], [acceder], [editar], [borrar], [aprobar], [rechazar], [fecha_creacion], [fecha_modificacion], [estado], [id_usuarioAutoriza]) VALUES (35, 3, 1, 1, 1, 0, 0, 0, 0, CAST(0x0000A73600A62C84 AS DateTime), CAST(0x0000A73600A62C84 AS DateTime), N'A ', 6)
INSERT [dbo].[G_PermisoTipoUsuario] ([corrPermisoTipoUsuario], [id_tipousuario], [id_opcion], [insertar], [acceder], [editar], [borrar], [aprobar], [rechazar], [fecha_creacion], [fecha_modificacion], [estado], [id_usuarioAutoriza]) VALUES (36, 3, 3, 1, 1, 0, 0, 0, 0, CAST(0x0000A73600A645ED AS DateTime), CAST(0x0000A73600A645ED AS DateTime), N'A ', 6)
INSERT [dbo].[G_PermisoTipoUsuario] ([corrPermisoTipoUsuario], [id_tipousuario], [id_opcion], [insertar], [acceder], [editar], [borrar], [aprobar], [rechazar], [fecha_creacion], [fecha_modificacion], [estado], [id_usuarioAutoriza]) VALUES (37, 3, 10, 1, 1, 0, 0, 0, 0, CAST(0x0000A73600A65CA8 AS DateTime), CAST(0x0000A73600A65CA8 AS DateTime), N'A ', 6)
INSERT [dbo].[G_PermisoTipoUsuario] ([corrPermisoTipoUsuario], [id_tipousuario], [id_opcion], [insertar], [acceder], [editar], [borrar], [aprobar], [rechazar], [fecha_creacion], [fecha_modificacion], [estado], [id_usuarioAutoriza]) VALUES (38, 3, 11, 1, 1, 0, 0, 0, 0, CAST(0x0000A73600A67C7A AS DateTime), CAST(0x0000A73600A67C7A AS DateTime), N'A ', 6)
INSERT [dbo].[G_PermisoTipoUsuario] ([corrPermisoTipoUsuario], [id_tipousuario], [id_opcion], [insertar], [acceder], [editar], [borrar], [aprobar], [rechazar], [fecha_creacion], [fecha_modificacion], [estado], [id_usuarioAutoriza]) VALUES (39, 3, 14, 1, 1, 0, 0, 0, 0, CAST(0x0000A73600A681BE AS DateTime), CAST(0x0000A73600A681BE AS DateTime), N'A ', 6)
INSERT [dbo].[G_PermisoTipoUsuario] ([corrPermisoTipoUsuario], [id_tipousuario], [id_opcion], [insertar], [acceder], [editar], [borrar], [aprobar], [rechazar], [fecha_creacion], [fecha_modificacion], [estado], [id_usuarioAutoriza]) VALUES (41, 2, 1, 0, 1, 0, 0, 0, 0, CAST(0x0000A73900D11692 AS DateTime), CAST(0x0000A73900D5C109 AS DateTime), N'A ', 6)
INSERT [dbo].[G_PermisoTipoUsuario] ([corrPermisoTipoUsuario], [id_tipousuario], [id_opcion], [insertar], [acceder], [editar], [borrar], [aprobar], [rechazar], [fecha_creacion], [fecha_modificacion], [estado], [id_usuarioAutoriza]) VALUES (42, 2, 10, 0, 1, 0, 0, 0, 0, CAST(0x0000A73900D5B5F8 AS DateTime), CAST(0x0000A73900D5B5F8 AS DateTime), N'A ', 6)
INSERT [dbo].[G_PermisoTipoUsuario] ([corrPermisoTipoUsuario], [id_tipousuario], [id_opcion], [insertar], [acceder], [editar], [borrar], [aprobar], [rechazar], [fecha_creacion], [fecha_modificacion], [estado], [id_usuarioAutoriza]) VALUES (43, 1, 22, 0, 1, 0, 0, 0, 0, CAST(0x0000A73900F821DB AS DateTime), CAST(0x0000A73900F821DB AS DateTime), N'A ', 6)
INSERT [dbo].[G_PermisoTipoUsuario] ([corrPermisoTipoUsuario], [id_tipousuario], [id_opcion], [insertar], [acceder], [editar], [borrar], [aprobar], [rechazar], [fecha_creacion], [fecha_modificacion], [estado], [id_usuarioAutoriza]) VALUES (44, 1, 23, 0, 1, 0, 0, 0, 0, CAST(0x0000A74300F08A90 AS DateTime), CAST(0x0000A74300F08A90 AS DateTime), N'A ', 6)
INSERT [dbo].[G_PermisoTipoUsuario] ([corrPermisoTipoUsuario], [id_tipousuario], [id_opcion], [insertar], [acceder], [editar], [borrar], [aprobar], [rechazar], [fecha_creacion], [fecha_modificacion], [estado], [id_usuarioAutoriza]) VALUES (45, 1, 24, 0, 1, 0, 0, 0, 0, CAST(0x0000A74A00F9FFE0 AS DateTime), CAST(0x0000A74A00F9FFE0 AS DateTime), N'A ', 6)
INSERT [dbo].[G_PermisoTipoUsuario] ([corrPermisoTipoUsuario], [id_tipousuario], [id_opcion], [insertar], [acceder], [editar], [borrar], [aprobar], [rechazar], [fecha_creacion], [fecha_modificacion], [estado], [id_usuarioAutoriza]) VALUES (46, 1, 25, 0, 1, 0, 0, 0, 0, CAST(0x0000A75900C0EAA9 AS DateTime), CAST(0x0000A75900C0EAA9 AS DateTime), N'A ', 6)
SET IDENTITY_INSERT [dbo].[G_PermisoTipoUsuario] OFF
/****** Object:  Table [dbo].[G_Paises]    Script Date: 04/22/2017 15:44:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[G_Paises](
	[IdPais] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](500) NOT NULL,
	[ISO2] [nchar](2) NULL,
	[fecha_creacion] [datetime] NOT NULL,
	[fecha_modificacion] [datetime] NOT NULL,
	[estado] [char](3) NOT NULL,
 CONSTRAINT [PK_G_Paises] PRIMARY KEY CLUSTERED 
(
	[IdPais] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[G_Paises] ON
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (22, N'Afghanistan', N'AF', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (23, N'Albania', N'AL', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (24, N'Algeria', N'DZ', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (25, N'American Samoa', N'AS', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (26, N'Andorra', N'AD', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (27, N'Angola', N'AO', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (28, N'Anguilla', N'AI', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (29, N'Antigua and Barbuda', N'AG', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (30, N'Argentina', N'AR', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (31, N'Armenia', N'AM', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (32, N'Aruba', N'AW', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (33, N'Australia', N'AU', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (34, N'Austria', N'AT', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (35, N'Azerbaijan', N'AZ', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (36, N'Bahamas', N'BS', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (37, N'Bahrain', N'BH', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (38, N'Bangladesh', N'BD', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (39, N'Barbados', N'BB', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (40, N'Belarus', N'BY', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (41, N'Belgium', N'BE', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (42, N'Belgium-Luxembourg', N'BE', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (43, N'Belize', N'BZ', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (44, N'Benin', N'BJ', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (45, N'Bermuda', N'BM', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (46, N'Bhutan', N'BT', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (47, N'Bolivia (Plurinational State of)', N'BO', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (48, N'Bonaire', N'BQ', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (49, N'Bosnia Herzegovina', N'BA', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (50, N'Botswana', N'BW', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (51, N'Br. Indian Ocean Terr.', N'IO', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (52, N'Br. Virgin Isds', N'VG', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (53, N'Brazil', N'BR', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (54, N'Brunei Darussalam', N'BN', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (55, N'Bulgaria', N'BG', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (56, N'Burkina Faso', N'BF', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (57, N'Burundi', N'BI', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (58, N'Cabo Verde', N'CV', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (59, N'Cambodia', N'KH', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (60, N'Cameroon', N'CM', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (61, N'Canada', N'CA', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (62, N'Cayman Isds', N'KY', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (63, N'Central African Rep.', N'CF', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (64, N'Chad', N'TD', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (65, N'Chile', N'CL', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (66, N'China', N'CN', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (67, N'China, Hong Kong SAR', N'HK', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (68, N'China, Macao SAR', N'MO', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (69, N'Christmas Isds', N'CX', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (70, N'Cocos Isds', N'CC', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (71, N'Colombia', N'CO', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (72, N'Comoros', N'KM', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (73, N'Congo', N'CG', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (74, N'Cook Isds', N'CK', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (75, N'Costa Rica', N'CR', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (76, N'Côte d''Ivoire', N'CI', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (77, N'Croatia', N'HR', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (78, N'Cuba', N'CU', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (79, N'Curaçao', N'CW', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (80, N'Cyprus', N'CY', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (81, N'Czech Rep.', N'CZ', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (82, N'Czechoslovakia', N'CS', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (83, N'Dem. People''s Rep. of Korea', N'KP', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (84, N'Dem. Rep. of the Congo', N'CD', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (85, N'Denmark', N'DK', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (86, N'Djibouti', N'DJ', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (87, N'Dominica', N'DM', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (88, N'Dominican Rep.', N'DO', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (89, N'East and West Pakistan', N'PK', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (90, N'Ecuador', N'EC', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (91, N'Egypt', N'EG', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (92, N'El Salvador', N'SV', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (93, N'Equatorial Guinea', N'GQ', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (94, N'Eritrea', N'ER', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (95, N'Estonia', N'EE', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (96, N'Ethiopia', N'ET', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (97, N'EU-28', N'EU', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (98, N'Faeroe Isds', N'FO', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (99, N'Falkland Isds (Malvinas)', N'FK', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (100, N'Fiji', N'FJ', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (101, N'Finland', N'FI', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (102, N'Fmr Arab Rep. of Yemen', N'YE', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (103, N'Fmr Dem. Rep. of Germany', N'DD', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (104, N'Fmr Dem. Rep. of Vietnam', N'VD', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (105, N'Fmr Dem. Yemen', N'YD', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (106, N'Fmr Ethiopia', N'ET', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (107, N'Fmr Fed. Rep. of Germany', N'DE', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (108, N'Fmr Pacific Isds', N'PC', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (109, N'Fmr Panama, excl.Canal Zone', N'PA', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (110, N'Fmr Panama-Canal-Zone', N'PZ', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (111, N'Fmr Rep. of Vietnam', N'VN', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (112, N'Fmr Sudan', N'SD', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (113, N'Fmr USSR', N'SU', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (114, N'Fmr Yugoslavia', N'YU', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (115, N'Fr. South Antarctic Terr.', N'FQ', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (116, N'France', N'FR', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (117, N'French Guiana', N'GF', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (118, N'French Polynesia', N'PF', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (119, N'FS Micronesia', N'FM', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (120, N'Gabon', N'GA', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (121, N'Gambia', N'GM', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
GO
print 'Processed 100 total records'
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (122, N'Georgia', N'GE', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (123, N'Germany', N'DE', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (124, N'Ghana', N'GH', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (125, N'Gibraltar', N'GI', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (126, N'Greece', N'GR', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (127, N'Greenland', N'GL', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (128, N'Grenada', N'GD', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (129, N'Guadeloupe', N'GP', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (130, N'Guam', N'GU', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (131, N'Guatemala', N'GT', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (132, N'Guinea', N'GN', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (133, N'Guinea-Bissau', N'GW', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (134, N'Guyana', N'GY', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (135, N'Haiti', N'HT', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (136, N'Heard Island and McDonald Islands', N'HM', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (137, N'Holy See (Vatican City State)', N'VA', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (138, N'Honduras', N'HN', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (139, N'Hungary', N'HU', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (140, N'Iceland', N'IS', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (141, N'India', N'IN', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (142, N'India, excl. Sikkim', N'IN', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (143, N'Indonesia', N'ID', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (144, N'Iran', N'IR', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (145, N'Iraq', N'IQ', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (146, N'Ireland', N'IE', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (147, N'Israel', N'IL', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (148, N'Italy', N'IT', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (149, N'Jamaica', N'JM', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (150, N'Japan', N'JP', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (151, N'Jordan', N'JO', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (152, N'Kazakhstan', N'KZ', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (153, N'Kenya', N'KE', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (154, N'Kiribati', N'KI', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (155, N'Kuwait', N'KW', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (156, N'Kyrgyzstan', N'KG', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (157, N'Lao People''s Dem. Rep.', N'LA', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (158, N'Latvia', N'LV', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (159, N'Lebanon', N'LB', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (160, N'Lesotho', N'LS', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (161, N'Liberia', N'LR', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (162, N'Libya', N'LY', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (163, N'Lithuania', N'LT', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (164, N'Luxembourg', N'LU', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (165, N'Madagascar', N'MG', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (166, N'Malawi', N'MW', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (167, N'Malaysia', N'MY', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (168, N'Maldives', N'MV', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (169, N'Mali', N'ML', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (170, N'Malta', N'MT', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (171, N'Marshall Isds', N'MH', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (172, N'Martinique', N'MQ', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (173, N'Mauritania', N'MR', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (174, N'Mauritius', N'MU', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (175, N'Mayotte', N'YT', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (176, N'Mexico', N'MX', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (177, N'Mongolia', N'MN', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (178, N'Montenegro', N'ME', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (179, N'Montserrat', N'MS', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (180, N'Morocco', N'MA', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (181, N'Mozambique', N'MZ', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (182, N'Myanmar', N'MM', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (183, N'N. Mariana Isds', N'MP', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (184, N'Namibia', N'NA', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (185, N'Nauru', N'NR', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (186, N'Nepal', N'NP', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (187, N'Neth. Antilles', N'AN', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (188, N'Neth. Antilles and Aruba', N'AN', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (189, N'Netherlands', N'NL', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (190, N'New Caledonia', N'NC', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (191, N'New Zealand', N'NZ', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (192, N'Nicaragua', N'NI', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (193, N'Niger', N'NE', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (194, N'Nigeria', N'NG', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (195, N'Niue', N'NU', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (196, N'Norfolk Isds', N'NF', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (197, N'Norway', N'NO', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (198, N'Oman', N'OM', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (199, N'Pakistan', N'PK', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (200, N'Palau', N'PW', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (201, N'Panama', N'PA', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (202, N'Papua New Guinea', N'PG', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (203, N'Paraguay', N'PY', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (204, N'Peru', N'PE', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (205, N'Philippines', N'PH', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (206, N'Pitcairn', N'PN', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (207, N'Poland', N'PL', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (208, N'Portugal', N'PT', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (209, N'Qatar', N'QA', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (210, N'Rep. of Korea', N'KR', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (211, N'Rep. of Moldova', N'MD', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (212, N'Réunion', N'RE', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (213, N'Romania', N'RO', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (214, N'Russian Federation', N'RU', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (215, N'Rwanda', N'RW', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (216, N'Saint Barthélemy', N'BL', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (217, N'Saint Helena', N'SH', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (218, N'Saint Kitts and Nevis', N'KN', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (219, N'Saint Kitts, Nevis and Anguilla', N'KN', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (220, N'Saint Lucia', N'LC', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (221, N'Saint Maarten', N'SX', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (222, N'Saint Pierre and Miquelon', N'PM', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
GO
print 'Processed 200 total records'
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (223, N'Saint Vincent and the Grenadines', N'VC', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (224, N'Samoa', N'WS', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (225, N'San Marino', N'SM', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (226, N'Sao Tome and Principe', N'ST', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (227, N'Saudi Arabia', N'SA', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (228, N'Senegal', N'SN', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (229, N'Serbia', N'RS', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (230, N'Serbia and Montenegro', N'CS', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (231, N'Seychelles', N'SC', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (232, N'Sierra Leone', N'SL', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (233, N'Singapore', N'SG', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (234, N'Slovakia', N'SK', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (235, N'Slovenia', N'SI', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (236, N'So. African Customs Union', N'ZA', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (237, N'Solomon Isds', N'SB', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (238, N'Somalia', N'SO', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (239, N'South Africa', N'ZA', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (240, N'South Georgia and the South Sandwich Islands', N'GS', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (241, N'South Sudan', N'SS', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (242, N'Spain', N'ES', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (243, N'Sri Lanka', N'LK', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (244, N'State of Palestine', N'PS', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (245, N'Sudan', N'SD', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (246, N'Suriname', N'SR', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (247, N'Swaziland', N'SZ', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (248, N'Sweden', N'SE', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (249, N'Switzerland', N'CH', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (250, N'Syria', N'SY', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (251, N'Tajikistan', N'TJ', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (252, N'TFYR of Macedonia', N'MK', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (253, N'Thailand', N'TH', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (254, N'Timor-Leste', N'TL', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (255, N'Togo', N'TG', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (256, N'Tokelau', N'TK', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (257, N'Tonga', N'TO', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (258, N'Trinidad and Tobago', N'TT', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (259, N'Tunisia', N'TN', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (260, N'Turkey', N'TR', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (261, N'Turkmenistan', N'TM', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (262, N'Turks and Caicos Isds', N'TC', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (263, N'Tuvalu', N'TV', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (264, N'Uganda', N'UG', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (265, N'Ukraine', N'UA', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (266, N'United Arab Emirates', N'AE', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (267, N'United Kingdom', N'GB', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (268, N'United Rep. of Tanzania', N'TZ', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (269, N'United States Minor Outlying Islands', N'UM', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (270, N'Uruguay', N'UY', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (271, N'US Virgin Isds', N'VI', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (272, N'USA', N'US', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (273, N'USA (before 1981)', N'US', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (274, N'Uzbekistan', N'UZ', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (275, N'Vanuatu', N'VU', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (276, N'Venezuela', N'VE', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (277, N'Viet Nam', N'VN', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (278, N'Wallis and Futuna Isds', N'WF', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (279, N'Western Sahara', N'EH', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (280, N'World', N'WL', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (281, N'Yemen', N'YE', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (282, N'Zambia', N'ZM', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (283, N'Zimbabwe', N'ZW', CAST(0x0000A72800000000 AS DateTime), CAST(0x0000A72800000000 AS DateTime), N'A  ')
INSERT [dbo].[G_Paises] ([IdPais], [Nombre], [ISO2], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (284, N'Pais de Prueba', N'pp', CAST(0x0000A72800EA5E1C AS DateTime), CAST(0x0000A72800EACE42 AS DateTime), N'B  ')
SET IDENTITY_INSERT [dbo].[G_Paises] OFF
/****** Object:  Table [dbo].[G_Menu_Opcion]    Script Date: 04/22/2017 15:44:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[G_Menu_Opcion](
	[id_opcion] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](300) NOT NULL,
	[descripcion] [varchar](500) NOT NULL,
	[url] [varchar](300) NOT NULL,
	[comando] [varchar](50) NULL,
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
INSERT [dbo].[G_Menu_Opcion] ([id_opcion], [nombre], [descripcion], [url], [comando], [id_padre], [orden], [visible], [obligatorio], [login], [id_usuarioAutoriza], [estado]) VALUES (1, N'Inicio', N'Inicio', N'~/', NULL, NULL, 1, 0, 1, 0, 6, N'A ')
INSERT [dbo].[G_Menu_Opcion] ([id_opcion], [nombre], [descripcion], [url], [comando], [id_padre], [orden], [visible], [obligatorio], [login], [id_usuarioAutoriza], [estado]) VALUES (2, N'Administracion', N'Administracion', N'#', NULL, NULL, 2, 1, 0, 1, 6, N'A ')
INSERT [dbo].[G_Menu_Opcion] ([id_opcion], [nombre], [descripcion], [url], [comando], [id_padre], [orden], [visible], [obligatorio], [login], [id_usuarioAutoriza], [estado]) VALUES (3, N'Solicitudes', N'Solicitudes', N'~/', N'', NULL, 3, 1, 0, 1, 6, N'A ')
INSERT [dbo].[G_Menu_Opcion] ([id_opcion], [nombre], [descripcion], [url], [comando], [id_padre], [orden], [visible], [obligatorio], [login], [id_usuarioAutoriza], [estado]) VALUES (4, N'Registrarse', N'Registrarse', N'~/Account/Register', N'', NULL, 5, 1, 0, 0, 6, N'A ')
INSERT [dbo].[G_Menu_Opcion] ([id_opcion], [nombre], [descripcion], [url], [comando], [id_padre], [orden], [visible], [obligatorio], [login], [id_usuarioAutoriza], [estado]) VALUES (5, N'Iniciar sesion', N'Iniciar sesion', N'~/Account/Login', NULL, NULL, 5, 1, 0, 0, 6, N'A ')
INSERT [dbo].[G_Menu_Opcion] ([id_opcion], [nombre], [descripcion], [url], [comando], [id_padre], [orden], [visible], [obligatorio], [login], [id_usuarioAutoriza], [estado]) VALUES (6, N'Perfiles de Usuario', N'Tipos de Usuario', N'~/Administracion/TipoUsuarios', NULL, 2, 1, 1, 0, 1, 6, N'A ')
INSERT [dbo].[G_Menu_Opcion] ([id_opcion], [nombre], [descripcion], [url], [comando], [id_padre], [orden], [visible], [obligatorio], [login], [id_usuarioAutoriza], [estado]) VALUES (7, N'Menu', N'Menu', N'~/Administracion/Menu', NULL, 2, 2, 1, 0, 1, 6, N'A ')
INSERT [dbo].[G_Menu_Opcion] ([id_opcion], [nombre], [descripcion], [url], [comando], [id_padre], [orden], [visible], [obligatorio], [login], [id_usuarioAutoriza], [estado]) VALUES (8, N'Administrar Cuenta', N'Administrar Cuenta', N'~/Account/Manage', NULL, NULL, 4, 1, 0, 1, 6, N'A ')
INSERT [dbo].[G_Menu_Opcion] ([id_opcion], [nombre], [descripcion], [url], [comando], [id_padre], [orden], [visible], [obligatorio], [login], [id_usuarioAutoriza], [estado]) VALUES (9, N'Solicitudes de Registro', N'Solicitudes de Registro', N'~/Account/SolicitudRegistro', NULL, 3, 1, 1, 0, 1, 6, N'A ')
INSERT [dbo].[G_Menu_Opcion] ([id_opcion], [nombre], [descripcion], [url], [comando], [id_padre], [orden], [visible], [obligatorio], [login], [id_usuarioAutoriza], [estado]) VALUES (10, N'Salir', N'Salir', N'~/Account/Logout', NULL, NULL, 6, 1, 0, 1, 6, N'A ')
INSERT [dbo].[G_Menu_Opcion] ([id_opcion], [nombre], [descripcion], [url], [comando], [id_padre], [orden], [visible], [obligatorio], [login], [id_usuarioAutoriza], [estado]) VALUES (11, N'Verificacion de Origen', N'Verificacion de Origen', N'~/Solicitudes/VerificacionOrigen', N'VO', 3, 2, 1, 0, 1, 6, N'A ')
INSERT [dbo].[G_Menu_Opcion] ([id_opcion], [nombre], [descripcion], [url], [comando], [id_padre], [orden], [visible], [obligatorio], [login], [id_usuarioAutoriza], [estado]) VALUES (12, N'Permisos', N'Permisos', N'~/Administracion/PermisosPerfiles', NULL, 2, 3, 1, 0, 1, 6, N'B ')
INSERT [dbo].[G_Menu_Opcion] ([id_opcion], [nombre], [descripcion], [url], [comando], [id_padre], [orden], [visible], [obligatorio], [login], [id_usuarioAutoriza], [estado]) VALUES (13, N'Usuarios', N'Usuarios', N'~/Administracion/Usuarios', NULL, 2, 4, 1, 0, 1, 6, N'A ')
INSERT [dbo].[G_Menu_Opcion] ([id_opcion], [nombre], [descripcion], [url], [comando], [id_padre], [orden], [visible], [obligatorio], [login], [id_usuarioAutoriza], [estado]) VALUES (14, N'Opinion Tecnica', N'Opinion Tecnica', N'~/Solicitudes/VerificacionOrigen', N'OT', 3, 3, 1, 0, 1, 6, N'A ')
INSERT [dbo].[G_Menu_Opcion] ([id_opcion], [nombre], [descripcion], [url], [comando], [id_padre], [orden], [visible], [obligatorio], [login], [id_usuarioAutoriza], [estado]) VALUES (15, N'Departamentos', N'Departamentos', N'~/Administracion/Departamentos', NULL, 2, 5, 1, 0, 1, 6, N'A ')
INSERT [dbo].[G_Menu_Opcion] ([id_opcion], [nombre], [descripcion], [url], [comando], [id_padre], [orden], [visible], [obligatorio], [login], [id_usuarioAutoriza], [estado]) VALUES (16, N'Requisitos', N'Requisitos', N'#', N'', NULL, 4, 1, 0, 1, 6, N'A ')
INSERT [dbo].[G_Menu_Opcion] ([id_opcion], [nombre], [descripcion], [url], [comando], [id_padre], [orden], [visible], [obligatorio], [login], [id_usuarioAutoriza], [estado]) VALUES (17, N'Opinion Tecnica', N'Opinion Tecnica', N'~/Requisitos/OpinionTecnica', NULL, 16, 1, 1, 0, 1, 6, N'A ')
INSERT [dbo].[G_Menu_Opcion] ([id_opcion], [nombre], [descripcion], [url], [comando], [id_padre], [orden], [visible], [obligatorio], [login], [id_usuarioAutoriza], [estado]) VALUES (18, N'Verificacion', N'Verificacion', N'~/Requisitos/Verificacion', NULL, 16, 2, 1, 0, 1, 6, N'A ')
INSERT [dbo].[G_Menu_Opcion] ([id_opcion], [nombre], [descripcion], [url], [comando], [id_padre], [orden], [visible], [obligatorio], [login], [id_usuarioAutoriza], [estado]) VALUES (19, N'Paises', N'Mantenimiento de Paises', N'~/Administracion/Paises', N'', 2, 5, 1, 0, 1, 6, N'A ')
INSERT [dbo].[G_Menu_Opcion] ([id_opcion], [nombre], [descripcion], [url], [comando], [id_padre], [orden], [visible], [obligatorio], [login], [id_usuarioAutoriza], [estado]) VALUES (20, N'Bandeja Borrador de Solicitudes', N'Esta es una bandeja donde se encuentran todas las solicitudes realizadas por el usuario que estan pendientes de enviar.', N'~/Solicitudes/BandejaBorradores', N'', 3, 4, 1, 0, 1, 6, N'A ')
INSERT [dbo].[G_Menu_Opcion] ([id_opcion], [nombre], [descripcion], [url], [comando], [id_padre], [orden], [visible], [obligatorio], [login], [id_usuarioAutoriza], [estado]) VALUES (21, N'Bandeja de Expedientes', N'En esta bandeja se muestran todos los expedientes que fueron enviados por los usuarios.', N'~/Solicitudes/BandejaExpedientes', N'', 3, 5, 1, 0, 1, 6, N'A ')
INSERT [dbo].[G_Menu_Opcion] ([id_opcion], [nombre], [descripcion], [url], [comando], [id_padre], [orden], [visible], [obligatorio], [login], [id_usuarioAutoriza], [estado]) VALUES (22, N'Tratados Comerciales', N'Mantenimiento de tratados comerciales', N'~/Administracion/Instrumentos', N'', 2, 6, 1, 0, 1, 6, N'A ')
INSERT [dbo].[G_Menu_Opcion] ([id_opcion], [nombre], [descripcion], [url], [comando], [id_padre], [orden], [visible], [obligatorio], [login], [id_usuarioAutoriza], [estado]) VALUES (23, N'Prueba', N'Prueba', N'~/Solicitudes/VerificacionOrigen', N'', NULL, 8, 0, 0, 0, 6, N'A ')
INSERT [dbo].[G_Menu_Opcion] ([id_opcion], [nombre], [descripcion], [url], [comando], [id_padre], [orden], [visible], [obligatorio], [login], [id_usuarioAutoriza], [estado]) VALUES (24, N'Aduanas', N'Aduanas', N'~/Administracion/Aduanas', N'', 2, 7, 1, 0, 1, 6, N'A ')
INSERT [dbo].[G_Menu_Opcion] ([id_opcion], [nombre], [descripcion], [url], [comando], [id_padre], [orden], [visible], [obligatorio], [login], [id_usuarioAutoriza], [estado]) VALUES (25, N'Expedientes', N'Expedientes', N'#', N'', NULL, 3, 1, 0, 1, 6, N'A ')
SET IDENTITY_INSERT [dbo].[G_Menu_Opcion] OFF
/****** Object:  Table [dbo].[G_Instrumentos]    Script Date: 04/22/2017 15:44:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[G_Instrumentos](
	[id_instrumento] [int] IDENTITY(1,1) NOT NULL,
	[nombre_instrumento] [varchar](300) NOT NULL,
	[sigla] [varchar](100) NOT NULL,
	[observaciones] [varchar](1000) NULL,
	[fecha_vigencia] [date] NULL,
	[fecha_creacion] [datetime] NOT NULL,
	[fecha_modificacion] [datetime] NOT NULL,
	[estado] [char](3) NOT NULL,
	[id_usuarioAutoriza] [int] NOT NULL,
 CONSTRAINT [PK_G_Instrumentos] PRIMARY KEY CLUSTERED 
(
	[id_instrumento] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[G_Instrumentos] ON
INSERT [dbo].[G_Instrumentos] ([id_instrumento], [nombre_instrumento], [sigla], [observaciones], [fecha_vigencia], [fecha_creacion], [fecha_modificacion], [estado], [id_usuarioAutoriza]) VALUES (1, N'Tratado de Libre Comercio Republica Dominicana, Centroamerica, Estados Unidos de América', N'CAFTADR', N'Tratado de Libre Comercio Republica Dominicana, Centroamerica, Estados Unidos de América', CAST(0x9D2C0B00 AS Date), CAST(0x0000A73C010ED73E AS DateTime), CAST(0x0000A73C010ED73E AS DateTime), N'A  ', 6)
INSERT [dbo].[G_Instrumentos] ([id_instrumento], [nombre_instrumento], [sigla], [observaciones], [fecha_vigencia], [fecha_creacion], [fecha_modificacion], [estado], [id_usuarioAutoriza]) VALUES (2, N'Tratado de Libre Comercio', N'TLC', N'TLC', CAST(0x4B3C0B00 AS Date), CAST(0x0000A73E00B0EA8F AS DateTime), CAST(0x0000A73E00B9FDBA AS DateTime), N'B  ', 6)
INSERT [dbo].[G_Instrumentos] ([id_instrumento], [nombre_instrumento], [sigla], [observaciones], [fecha_vigencia], [fecha_creacion], [fecha_modificacion], [estado], [id_usuarioAutoriza]) VALUES (3, N'Tratado de Libre Comercio Entre la República de Guatemala y la República de China (Taiwan)', N'TLC China (Taiwan)', N'TLC China (Taiwan)', CAST(0x4C2D0B00 AS Date), CAST(0x0000A74A00D314B9 AS DateTime), CAST(0x0000A74A00D314B9 AS DateTime), N'A  ', 6)
SET IDENTITY_INSERT [dbo].[G_Instrumentos] OFF
/****** Object:  Table [dbo].[G_Departamento]    Script Date: 04/22/2017 15:44:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[G_Departamento](
	[idDepartamento] [int] IDENTITY(1,1) NOT NULL,
	[codigoDepto] [varchar](150) NULL,
	[nombre] [varchar](300) NOT NULL,
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
INSERT [dbo].[G_Departamento] ([idDepartamento], [codigoDepto], [nombre], [descripcion], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (1, N'1', N'No Aplica', N'No Aplica', N'A ', CAST(0x6D3C0B00 AS Date), CAST(0x923C0B00 AS Date))
INSERT [dbo].[G_Departamento] ([idDepartamento], [codigoDepto], [nombre], [descripcion], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (2, N'2', N'Unidad de Tratados y Acuerdos Comerciales', N'Unidad de Tratados y Acuerdos Comerciales', N'A ', CAST(0x6D3C0B00 AS Date), CAST(0x923C0B00 AS Date))
INSERT [dbo].[G_Departamento] ([idDepartamento], [codigoDepto], [nombre], [descripcion], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (3, N'3', N'Normativo', N'Departamento Normativo', N'A ', CAST(0x6D3C0B00 AS Date), CAST(0x923C0B00 AS Date))
INSERT [dbo].[G_Departamento] ([idDepartamento], [codigoDepto], [nombre], [descripcion], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (6, N'5', N'Operativo', N'Unidad Técnica de Operaciones y Seguridad Aduanera - Departamento Operativo', N'A ', CAST(0x923C0B00 AS Date), CAST(0x923C0B00 AS Date))
SET IDENTITY_INSERT [dbo].[G_Departamento] OFF
/****** Object:  Table [dbo].[G_Aduanas]    Script Date: 04/22/2017 15:44:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[G_Aduanas](
	[IdAduana] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](500) NOT NULL,
	[Codigo] [varchar](15) NULL,
	[fecha_creacion] [datetime] NOT NULL,
	[fecha_modificacion] [datetime] NOT NULL,
	[estado] [char](3) NOT NULL,
 CONSTRAINT [PK_G_Aduanas] PRIMARY KEY CLUSTERED 
(
	[IdAduana] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[G_Aduanas] ON
INSERT [dbo].[G_Aduanas] ([IdAduana], [Nombre], [Codigo], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (1, N'ADUANA SANTO TOMAS DE CASTILLA', N'ST', CAST(0x0000A74A0107E24D AS DateTime), CAST(0x0000A74A0107E24D AS DateTime), N'A  ')
INSERT [dbo].[G_Aduanas] ([IdAduana], [Nombre], [Codigo], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (2, N'ADUANA PUERTO QUETZAL', N'PQ', CAST(0x0000A74A01087339 AS DateTime), CAST(0x0000A74A01087339 AS DateTime), N'A  ')
INSERT [dbo].[G_Aduanas] ([IdAduana], [Nombre], [Codigo], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (3, N'ADUANA PUERTO BARRIOS', N'B', CAST(0x0000A74A01087DEB AS DateTime), CAST(0x0000A74A01087DEB AS DateTime), N'A  ')
INSERT [dbo].[G_Aduanas] ([IdAduana], [Nombre], [Codigo], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (4, N'ADUANA TECUN UMAN', N'TU', CAST(0x0000A74A010887DA AS DateTime), CAST(0x0000A74A010887DA AS DateTime), N'A  ')
INSERT [dbo].[G_Aduanas] ([IdAduana], [Nombre], [Codigo], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (5, N'ADUANA EL CARMEN', N'EC', CAST(0x0000A74A01089325 AS DateTime), CAST(0x0000A74A01089325 AS DateTime), N'A  ')
INSERT [dbo].[G_Aduanas] ([IdAduana], [Nombre], [Codigo], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (6, N'ADUANA LA MESILLA', N'LM', CAST(0x0000A74A01089CAE AS DateTime), CAST(0x0000A74A01089CAE AS DateTime), N'A  ')
INSERT [dbo].[G_Aduanas] ([IdAduana], [Nombre], [Codigo], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (7, N'ADUANA MELCHOR DE MENCOS', N'MM', CAST(0x0000A74A0108A5F7 AS DateTime), CAST(0x0000A74A0108A5F7 AS DateTime), N'A  ')
INSERT [dbo].[G_Aduanas] ([IdAduana], [Nombre], [Codigo], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (8, N'ADUANA EL FLORIDO', N'EF', CAST(0x0000A74A0108AFF3 AS DateTime), CAST(0x0000A74A0108AFF3 AS DateTime), N'A  ')
INSERT [dbo].[G_Aduanas] ([IdAduana], [Nombre], [Codigo], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (9, N'ADUANA DE VEHICULOS', N'VH', CAST(0x0000A74A0108BB03 AS DateTime), CAST(0x0000A74A0108BB03 AS DateTime), N'A  ')
INSERT [dbo].[G_Aduanas] ([IdAduana], [Nombre], [Codigo], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (10, N'ADUANA CENTRAL DE GUATEMALA', N'CG', CAST(0x0000A74A0108C4AF AS DateTime), CAST(0x0000A74A0108C4AF AS DateTime), N'A  ')
INSERT [dbo].[G_Aduanas] ([IdAduana], [Nombre], [Codigo], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (11, N'ADUANA CHAMPERICO', N'CH', CAST(0x0000A74A0108CF6B AS DateTime), CAST(0x0000A74A0108CF6B AS DateTime), N'A  ')
INSERT [dbo].[G_Aduanas] ([IdAduana], [Nombre], [Codigo], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (12, N'ADUANA PEDRO DE ALVARADO', N'PA', CAST(0x0000A74A0108DA1E AS DateTime), CAST(0x0000A74A0108DA1E AS DateTime), N'A  ')
INSERT [dbo].[G_Aduanas] ([IdAduana], [Nombre], [Codigo], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (13, N'ADUANA VALLE NUEVO', N'VN', CAST(0x0000A74A0108E3AA AS DateTime), CAST(0x0000A74A0108E3AA AS DateTime), N'A  ')
INSERT [dbo].[G_Aduanas] ([IdAduana], [Nombre], [Codigo], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (14, N'ADUANA SAN CRISTOBAL', N'SC', CAST(0x0000A74A0108ED85 AS DateTime), CAST(0x0000A74A0108ED85 AS DateTime), N'A  ')
INSERT [dbo].[G_Aduanas] ([IdAduana], [Nombre], [Codigo], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (15, N'ADUANA AGUA CALIENTE', N'AC', CAST(0x0000A74A0108FA61 AS DateTime), CAST(0x0000A74A0108FA61 AS DateTime), N'A  ')
INSERT [dbo].[G_Aduanas] ([IdAduana], [Nombre], [Codigo], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (16, N'ADUANA LA ERMITA', N'LE', CAST(0x0000A74A01091D6E AS DateTime), CAST(0x0000A74A01091D6E AS DateTime), N'A  ')
INSERT [dbo].[G_Aduanas] ([IdAduana], [Nombre], [Codigo], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (17, N'ADUANA EL CEIBO', N'CB', CAST(0x0000A74A0109293D AS DateTime), CAST(0x0000A74A0109293D AS DateTime), N'A  ')
INSERT [dbo].[G_Aduanas] ([IdAduana], [Nombre], [Codigo], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (18, N'ADUANA TIKAL', N'AT', CAST(0x0000A74A010935E3 AS DateTime), CAST(0x0000A74A010935E3 AS DateTime), N'A  ')
INSERT [dbo].[G_Aduanas] ([IdAduana], [Nombre], [Codigo], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (19, N'ADUANA CENTRAL DE AVIACION', N'CA', CAST(0x0000A74A01094464 AS DateTime), CAST(0x0000A74A01094464 AS DateTime), N'A  ')
INSERT [dbo].[G_Aduanas] ([IdAduana], [Nombre], [Codigo], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (20, N'ADUANA EXPRESS AEREO', N'EA', CAST(0x0000A74A01094EC4 AS DateTime), CAST(0x0000A74A01094EC4 AS DateTime), N'A  ')
INSERT [dbo].[G_Aduanas] ([IdAduana], [Nombre], [Codigo], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (21, N'ADUANA FARDOS POSTALES', N'FP', CAST(0x0000A74A01095812 AS DateTime), CAST(0x0000A74A01095812 AS DateTime), N'A  ')
INSERT [dbo].[G_Aduanas] ([IdAduana], [Nombre], [Codigo], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (22, N'ADUANA ALMACENADORA INTEGRADA', N'G1', CAST(0x0000A74A01096256 AS DateTime), CAST(0x0000A74A01096256 AS DateTime), N'A  ')
INSERT [dbo].[G_Aduanas] ([IdAduana], [Nombre], [Codigo], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (23, N'ADUANA ALMINTER', N'G2', CAST(0x0000A74A01096CC9 AS DateTime), CAST(0x0000A74A01096CC9 AS DateTime), N'A  ')
INSERT [dbo].[G_Aduanas] ([IdAduana], [Nombre], [Codigo], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (24, N'ADUANA ALPASA', N'G3', CAST(0x0000A74A010975AC AS DateTime), CAST(0x0000A74A010975AC AS DateTime), N'A  ')
INSERT [dbo].[G_Aduanas] ([IdAduana], [Nombre], [Codigo], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (25, N'ADUANA ALSERSA', N'G4', CAST(0x0000A74A01097E87 AS DateTime), CAST(0x0000A74A01097E87 AS DateTime), N'A  ')
INSERT [dbo].[G_Aduanas] ([IdAduana], [Nombre], [Codigo], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (26, N'ADUANA CEALSA', N'G5', CAST(0x0000A74A010989D8 AS DateTime), CAST(0x0000A74A010989D8 AS DateTime), N'A  ')
INSERT [dbo].[G_Aduanas] ([IdAduana], [Nombre], [Codigo], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (27, N'ADUANA ALMAGUATE', N'G6', CAST(0x0000A74A010992D6 AS DateTime), CAST(0x0000A74A010992D6 AS DateTime), N'A  ')
INSERT [dbo].[G_Aduanas] ([IdAduana], [Nombre], [Codigo], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (28, N'ADUANA ALCORSA', N'G7', CAST(0x0000A74A01099CEC AS DateTime), CAST(0x0000A74A01099CEC AS DateTime), N'A  ')
INSERT [dbo].[G_Aduanas] ([IdAduana], [Nombre], [Codigo], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (29, N'ADUANA CENTRALSA', N'G8', CAST(0x0000A74A0109A6F9 AS DateTime), CAST(0x0000A74A0109A6F9 AS DateTime), N'A  ')
SET IDENTITY_INSERT [dbo].[G_Aduanas] OFF
/****** Object:  Table [dbo].[ExpedienteSolicitud_Enc]    Script Date: 04/22/2017 15:44:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ExpedienteSolicitud_Enc](
	[id_expediente] [int] IDENTITY(1,1) NOT NULL,
	[id_Solicitud] [int] NOT NULL,
	[id_usuarioSolicita] [int] NOT NULL,
	[tipoSolicitud] [varchar](300) NOT NULL,
	[id_instrumento] [int] NOT NULL,
	[fecha_inicio_periodo] [date] NOT NULL,
	[fecha_fin_periodo] [date] NOT NULL,
	[nombres] [varchar](300) NOT NULL,
	[apellidos] [varchar](300) NOT NULL,
	[direccion] [varchar](500) NOT NULL,
	[idDepartamentoSolicita] [int] NOT NULL,
	[correo] [varchar](150) NOT NULL,
	[telefono] [varchar](50) NOT NULL,
	[razonSocialImportador] [varchar](500) NOT NULL,
	[direccionImportador] [varchar](500) NOT NULL,
	[correoImportador] [varchar](150) NOT NULL,
	[idDepartamentoImportador] [int] NOT NULL,
	[nitImportador] [varchar](50) NOT NULL,
	[telefonoImportador] [varchar](50) NOT NULL,
	[razonSocialExportador] [varchar](500) NOT NULL,
	[direccionExportador] [varchar](500) NOT NULL,
	[correoExportador] [varchar](150) NOT NULL,
	[idPaisExportador] [int] NOT NULL,
	[nitExportador] [varchar](50) NULL,
	[telefonoExportador] [varchar](50) NULL,
	[fecha_creacion] [datetime] NOT NULL,
	[fecha_modificacion] [datetime] NULL,
	[estado] [nchar](3) NULL,
 CONSTRAINT [PK_ExpedienteSolicitud_Enc] PRIMARY KEY CLUSTERED 
(
	[id_expediente] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ExpedienteSolicitud_Enc] ON
INSERT [dbo].[ExpedienteSolicitud_Enc] ([id_expediente], [id_Solicitud], [id_usuarioSolicita], [tipoSolicitud], [id_instrumento], [fecha_inicio_periodo], [fecha_fin_periodo], [nombres], [apellidos], [direccion], [idDepartamentoSolicita], [correo], [telefono], [razonSocialImportador], [direccionImportador], [correoImportador], [idDepartamentoImportador], [nitImportador], [telefonoImportador], [razonSocialExportador], [direccionExportador], [correoExportador], [idPaisExportador], [nitExportador], [telefonoExportador], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (3, 1, 6, N'VO', 1, CAST(0xDB3A0B00 AS Date), CAST(0x483C0B00 AS Date), N'Administrador', N'SGEO', N'3ra Avenida Ciudad', 2, N'egonzalez@mineco.gob.gt', N'87654321', N'Razon importador ', N'direccion importador', N'correoimportador@corre.com', 1, N'987', N'987', N'razon exportador', N'direccion exportador', N'correoexportador@corre.com', 22, N'789', N'789', CAST(0x0000A74B0104F112 AS DateTime), CAST(0x0000A74B0104F112 AS DateTime), N'E  ')
INSERT [dbo].[ExpedienteSolicitud_Enc] ([id_expediente], [id_Solicitud], [id_usuarioSolicita], [tipoSolicitud], [id_instrumento], [fecha_inicio_periodo], [fecha_fin_periodo], [nombres], [apellidos], [direccion], [idDepartamentoSolicita], [correo], [telefono], [razonSocialImportador], [direccionImportador], [correoImportador], [idDepartamentoImportador], [nitImportador], [telefonoImportador], [razonSocialExportador], [direccionExportador], [correoExportador], [idPaisExportador], [nitExportador], [telefonoExportador], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (4, 3, 6, N'VO', 1, CAST(0xA83C0B00 AS Date), CAST(0xA83C0B00 AS Date), N'Administrador', N'SGEO', N'3ra Avenida Ciudad', 2, N'egonzalez@mineco.gob.gt', N'87654321', N'Razon importador ', N'direccion importador', N'correoimportador@corre.com', 1, N'987', N'987', N'razon exportador', N'direccion exportador', N'correoexportador@corre.com', 22, N'987', N'987', CAST(0x0000A74D00A148C1 AS DateTime), CAST(0x0000A74D00A148C1 AS DateTime), N'E  ')
INSERT [dbo].[ExpedienteSolicitud_Enc] ([id_expediente], [id_Solicitud], [id_usuarioSolicita], [tipoSolicitud], [id_instrumento], [fecha_inicio_periodo], [fecha_fin_periodo], [nombres], [apellidos], [direccion], [idDepartamentoSolicita], [correo], [telefono], [razonSocialImportador], [direccionImportador], [correoImportador], [idDepartamentoImportador], [nitImportador], [telefonoImportador], [razonSocialExportador], [direccionExportador], [correoExportador], [idPaisExportador], [nitExportador], [telefonoExportador], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (5, 4, 6, N'VO', 1, CAST(0xAD3C0B00 AS Date), CAST(0xAD3C0B00 AS Date), N'Administrador', N'SGEO', N'3ra Avenida Ciudad', 2, N'egonzalez@mineco.gob.gt', N'87654321', N'Razon importador ', N'direccion importador', N'correoimportador@corre.com', 1, N'789', N'789', N'razon exportador', N'direccion exportador', N'correoexportador@corre.com', 22, N'123', N'213', CAST(0x0000A75200CC17E9 AS DateTime), CAST(0x0000A75200CC17E9 AS DateTime), N'E  ')
INSERT [dbo].[ExpedienteSolicitud_Enc] ([id_expediente], [id_Solicitud], [id_usuarioSolicita], [tipoSolicitud], [id_instrumento], [fecha_inicio_periodo], [fecha_fin_periodo], [nombres], [apellidos], [direccion], [idDepartamentoSolicita], [correo], [telefono], [razonSocialImportador], [direccionImportador], [correoImportador], [idDepartamentoImportador], [nitImportador], [telefonoImportador], [razonSocialExportador], [direccionExportador], [correoExportador], [idPaisExportador], [nitExportador], [telefonoExportador], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (6, 5, 6, N'VO', 1, CAST(0xB73C0B00 AS Date), CAST(0xB73C0B00 AS Date), N'Administrador', N'SGEO', N'3ra Avenida Ciudad', 2, N'egonzalez@mineco.gob.gt', N'87654321', N'Razon importador ', N'direccion importador', N'correoimportador@corre.com', 1, N'987', N'987', N'razon exportador', N'direccion exportador', N'correoexportador@corre.com', 22, N'987', N'987', CAST(0x0000A75C012DCBA6 AS DateTime), CAST(0x0000A75C012DCBA6 AS DateTime), N'E  ')
SET IDENTITY_INSERT [dbo].[ExpedienteSolicitud_Enc] OFF
/****** Object:  Table [dbo].[ExpedienteProductoImportacion]    Script Date: 04/22/2017 15:44:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ExpedienteProductoImportacion](
	[id_expediente] [int] NOT NULL,
	[id_Solicitud] [int] NOT NULL,
	[id_regimen_importacion] [int] NOT NULL,
	[nombre_regimen_importacion] [varchar](300) NOT NULL,
	[idAduana] [int] NOT NULL,
	[clasificacion_arancelaria] [varchar](300) NOT NULL,
	[descripcion_comercial] [varchar](1500) NULL,
	[descripcion_factura] [varchar](1500) NULL,
	[observaciones] [varchar](1500) NULL,
	[fecha_creacion] [datetime] NOT NULL,
	[fecha_modificacion] [datetime] NOT NULL,
	[estado] [nchar](3) NOT NULL,
 CONSTRAINT [PK_ExpedienteProductoImportacion] PRIMARY KEY CLUSTERED 
(
	[id_expediente] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[ExpedienteProductoImportacion] ([id_expediente], [id_Solicitud], [id_regimen_importacion], [nombre_regimen_importacion], [idAduana], [clasificacion_arancelaria], [descripcion_comercial], [descripcion_factura], [observaciones], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (3, 1, 2, N'ID - Importación definitiva', 2, N'6002', N'Descripcion Comercial', N'Descripción Factura', N'Otras observaciones', CAST(0x0000A74B0104F118 AS DateTime), CAST(0x0000A74B0104F118 AS DateTime), N'E  ')
INSERT [dbo].[ExpedienteProductoImportacion] ([id_expediente], [id_Solicitud], [id_regimen_importacion], [nombre_regimen_importacion], [idAduana], [clasificacion_arancelaria], [descripcion_comercial], [descripcion_factura], [observaciones], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (4, 3, 1, N'DI - Importación definitiva de mercancías proveniente de almacén fiscal.', 1, N'9001', N'descripcion comercial', N'descripcion factura', N'observaciones', CAST(0x0000A74D00A148F5 AS DateTime), CAST(0x0000A74D00A148F5 AS DateTime), N'E  ')
INSERT [dbo].[ExpedienteProductoImportacion] ([id_expediente], [id_Solicitud], [id_regimen_importacion], [nombre_regimen_importacion], [idAduana], [clasificacion_arancelaria], [descripcion_comercial], [descripcion_factura], [observaciones], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (5, 4, 1, N'DI - Importación definitiva de mercancías proveniente de almacén fiscal.', 1, N'987', N'asdf', N'asdf', N'adf', CAST(0x0000A75200CC17F8 AS DateTime), CAST(0x0000A75200CC17F8 AS DateTime), N'E  ')
INSERT [dbo].[ExpedienteProductoImportacion] ([id_expediente], [id_Solicitud], [id_regimen_importacion], [nombre_regimen_importacion], [idAduana], [clasificacion_arancelaria], [descripcion_comercial], [descripcion_factura], [observaciones], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (6, 5, 1, N'DI - Importación definitiva de mercancías proveniente de almacén fiscal.', 1, N'987', N'asdf', N'987', N'987', CAST(0x0000A75C012DCBAD AS DateTime), CAST(0x0000A75C012DCBAD AS DateTime), N'E  ')
/****** Object:  Table [dbo].[ExpedienteMotivos]    Script Date: 04/22/2017 15:44:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[ExpedienteMotivos](
	[id_expediente] [int] NOT NULL,
	[id_Solicitud] [int] NOT NULL,
	[motivo_1] [bit] NOT NULL,
	[motivo_2] [bit] NOT NULL,
	[motivo_3] [bit] NOT NULL,
	[motivo_4] [bit] NOT NULL,
	[motivo_5] [bit] NOT NULL,
	[motivo_6] [bit] NOT NULL,
	[motivo_7] [bit] NOT NULL,
	[motivo_8] [bit] NOT NULL,
	[observacion_si_no] [bit] NOT NULL,
	[observaciones] [varchar](1500) NULL,
	[otros_motivos] [varchar](1500) NULL,
	[fecha_creacion] [datetime] NOT NULL,
	[estado] [nchar](3) NOT NULL,
	[fecha_modificacion] [datetime] NOT NULL,
 CONSTRAINT [PK_ExpedienteMotivos] PRIMARY KEY CLUSTERED 
(
	[id_expediente] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[ExpedienteMotivos] ([id_expediente], [id_Solicitud], [motivo_1], [motivo_2], [motivo_3], [motivo_4], [motivo_5], [motivo_6], [motivo_7], [motivo_8], [observacion_si_no], [observaciones], [otros_motivos], [fecha_creacion], [estado], [fecha_modificacion]) VALUES (3, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, N'', N'', CAST(0x0000A74B0104F114 AS DateTime), N'E  ', CAST(0x0000A74B0104F114 AS DateTime))
INSERT [dbo].[ExpedienteMotivos] ([id_expediente], [id_Solicitud], [motivo_1], [motivo_2], [motivo_3], [motivo_4], [motivo_5], [motivo_6], [motivo_7], [motivo_8], [observacion_si_no], [observaciones], [otros_motivos], [fecha_creacion], [estado], [fecha_modificacion]) VALUES (4, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, N'', N'', CAST(0x0000A74D00A148D7 AS DateTime), N'E  ', CAST(0x0000A74D00A148D7 AS DateTime))
INSERT [dbo].[ExpedienteMotivos] ([id_expediente], [id_Solicitud], [motivo_1], [motivo_2], [motivo_3], [motivo_4], [motivo_5], [motivo_6], [motivo_7], [motivo_8], [observacion_si_no], [observaciones], [otros_motivos], [fecha_creacion], [estado], [fecha_modificacion]) VALUES (5, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, N'', N'', CAST(0x0000A75200CC17EC AS DateTime), N'E  ', CAST(0x0000A75200CC17EC AS DateTime))
INSERT [dbo].[ExpedienteMotivos] ([id_expediente], [id_Solicitud], [motivo_1], [motivo_2], [motivo_3], [motivo_4], [motivo_5], [motivo_6], [motivo_7], [motivo_8], [observacion_si_no], [observaciones], [otros_motivos], [fecha_creacion], [estado], [fecha_modificacion]) VALUES (6, 5, 1, 0, 0, 0, 0, 0, 0, 0, 0, N'', N'', CAST(0x0000A75C012DCBA7 AS DateTime), N'E  ', CAST(0x0000A75C012DCBA7 AS DateTime))
INSERT [dbo].[ExpedienteMotivos] ([id_expediente], [id_Solicitud], [motivo_1], [motivo_2], [motivo_3], [motivo_4], [motivo_5], [motivo_6], [motivo_7], [motivo_8], [observacion_si_no], [observaciones], [otros_motivos], [fecha_creacion], [estado], [fecha_modificacion]) VALUES (16, 32, 1, 0, 0, 0, 0, 0, 0, 0, 0, N'', N'', CAST(0x0000A73800F3C402 AS DateTime), N'E  ', CAST(0x0000A73800F3C402 AS DateTime))
INSERT [dbo].[ExpedienteMotivos] ([id_expediente], [id_Solicitud], [motivo_1], [motivo_2], [motivo_3], [motivo_4], [motivo_5], [motivo_6], [motivo_7], [motivo_8], [observacion_si_no], [observaciones], [otros_motivos], [fecha_creacion], [estado], [fecha_modificacion]) VALUES (17, 34, 1, 0, 0, 0, 0, 0, 0, 0, 0, N'', N'', CAST(0x0000A738011C08CE AS DateTime), N'E  ', CAST(0x0000A738011C08CE AS DateTime))
/****** Object:  Table [dbo].[ExpedienteImportador]    Script Date: 04/22/2017 15:44:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ExpedienteImportador](
	[corr_ExpedienteImportador] [int] IDENTITY(1,1) NOT NULL,
	[corr_BorradorImportador] [int] NOT NULL,
	[id_expediente] [int] NOT NULL,
	[id_solicitud] [int] NOT NULL,
	[tipoSolicitud] [varchar](50) NOT NULL,
	[razon_social] [varchar](500) NOT NULL,
	[correo] [varchar](50) NOT NULL,
	[nit] [varchar](50) NOT NULL,
	[telefono] [varchar](50) NOT NULL,
	[fecha_creacion] [datetime] NOT NULL,
	[estado] [nchar](3) NOT NULL,
	[fecha_modificacion] [datetime] NOT NULL,
 CONSTRAINT [PK_ExpedienteImportador] PRIMARY KEY CLUSTERED 
(
	[corr_ExpedienteImportador] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ExpedienteImportador] ON
INSERT [dbo].[ExpedienteImportador] ([corr_ExpedienteImportador], [corr_BorradorImportador], [id_expediente], [id_solicitud], [tipoSolicitud], [razon_social], [correo], [nit], [telefono], [fecha_creacion], [estado], [fecha_modificacion]) VALUES (1, 5, 5, 4, N'VO', N'razon impo', N'correoimpo@correo.com', N'465', N'987', CAST(0x0000A75200CC17FC AS DateTime), N'E  ', CAST(0x0000A75200CC17FC AS DateTime))
INSERT [dbo].[ExpedienteImportador] ([corr_ExpedienteImportador], [corr_BorradorImportador], [id_expediente], [id_solicitud], [tipoSolicitud], [razon_social], [correo], [nit], [telefono], [fecha_creacion], [estado], [fecha_modificacion]) VALUES (2, 6, 6, 5, N'VO', N'razon impo', N'correoimpo@correo.com', N'987', N'987', CAST(0x0000A75C012DCBAE AS DateTime), N'E  ', CAST(0x0000A75C012DCBAE AS DateTime))
SET IDENTITY_INSERT [dbo].[ExpedienteImportador] OFF
/****** Object:  Table [dbo].[ExpedienteAdjunto]    Script Date: 04/22/2017 15:44:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ExpedienteAdjunto](
	[corr_ExpedienteAnexo] [int] IDENTITY(1,1) NOT NULL,
	[corr_BorradorAnexo] [int] NOT NULL,
	[id_expediente] [int] NOT NULL,
	[id_Solicitud] [int] NOT NULL,
	[tipoSolicitud] [varchar](300) NOT NULL,
	[oficioSAT] [bit] NULL,
	[idPrefijoSAT] [int] NULL,
	[PrefijoSAT] [varchar](150) NULL,
	[numeroOficioSAT] [int] NULL,
	[anioOficioSAT] [int] NULL,
	[numeroReferencia] [int] NULL,
	[idRequisito] [int] NOT NULL,
	[nombreDocumentoOriginal] [varchar](300) NOT NULL,
	[nombreDocumentoSistema] [varchar](300) NOT NULL,
	[path] [varchar](500) NOT NULL,
	[observaciones] [varchar](1500) NULL,
	[fecha_creacion] [datetime] NOT NULL,
	[estado] [nchar](3) NOT NULL,
	[fecha_modificacion] [datetime] NOT NULL,
 CONSTRAINT [PK_ExpedienteAdjunto] PRIMARY KEY CLUSTERED 
(
	[corr_ExpedienteAnexo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ExpedienteAdjunto] ON
INSERT [dbo].[ExpedienteAdjunto] ([corr_ExpedienteAnexo], [corr_BorradorAnexo], [id_expediente], [id_Solicitud], [tipoSolicitud], [oficioSAT], [idPrefijoSAT], [PrefijoSAT], [numeroOficioSAT], [anioOficioSAT], [numeroReferencia], [idRequisito], [nombreDocumentoOriginal], [nombreDocumentoSistema], [path], [observaciones], [fecha_creacion], [estado], [fecha_modificacion]) VALUES (15, 11, 16, 32, N'VO', 0, 1, N'OFI-SAT-IAD-DOP-UTO', 0, 2017, 13032017, 2, N'888.pdf', N'32_VO_1_888.pdf', N'C:\Users\egonzalez\Documents\Visual Studio 2013\Projects\Sistema de Gestion Expedientes\Sistema de Gestion Expedientes\doctos\32_VO_1_888.pdf', N'asdf', CAST(0x0000A73800F3C404 AS DateTime), N'E  ', CAST(0x0000A73800F3C404 AS DateTime))
INSERT [dbo].[ExpedienteAdjunto] ([corr_ExpedienteAnexo], [corr_BorradorAnexo], [id_expediente], [id_Solicitud], [tipoSolicitud], [oficioSAT], [idPrefijoSAT], [PrefijoSAT], [numeroOficioSAT], [anioOficioSAT], [numeroReferencia], [idRequisito], [nombreDocumentoOriginal], [nombreDocumentoSistema], [path], [observaciones], [fecha_creacion], [estado], [fecha_modificacion]) VALUES (16, 13, 16, 32, N'VO', 0, 1, N'OFI-SAT-IAD-DOP-UTO', 0, 2017, 13032017, 4, N'888.pdf', N'32_VO_1_888.pdf', N'C:\Users\egonzalez\Documents\Visual Studio 2013\Projects\Sistema de Gestion Expedientes\Sistema de Gestion Expedientes\doctos\32_VO_1_888.pdf', N'asdf', CAST(0x0000A73800F3C404 AS DateTime), N'E  ', CAST(0x0000A73800F3C404 AS DateTime))
INSERT [dbo].[ExpedienteAdjunto] ([corr_ExpedienteAnexo], [corr_BorradorAnexo], [id_expediente], [id_Solicitud], [tipoSolicitud], [oficioSAT], [idPrefijoSAT], [PrefijoSAT], [numeroOficioSAT], [anioOficioSAT], [numeroReferencia], [idRequisito], [nombreDocumentoOriginal], [nombreDocumentoSistema], [path], [observaciones], [fecha_creacion], [estado], [fecha_modificacion]) VALUES (17, 14, 17, 34, N'VO', 0, 1, N'OFI-SAT-IAD-DOP-UTO', 0, 2017, 14032017, 2, N'888.pdf', N'34_VO_2_888.pdf', N'C:\Users\egonzalez\Documents\Visual Studio 2013\Projects\Sistema de Gestion Expedientes\Sistema de Gestion Expedientes\doctos\34_VO_2_888.pdf', N'asdf', CAST(0x0000A738011C08F8 AS DateTime), N'E  ', CAST(0x0000A738011C08F8 AS DateTime))
INSERT [dbo].[ExpedienteAdjunto] ([corr_ExpedienteAnexo], [corr_BorradorAnexo], [id_expediente], [id_Solicitud], [tipoSolicitud], [oficioSAT], [idPrefijoSAT], [PrefijoSAT], [numeroOficioSAT], [anioOficioSAT], [numeroReferencia], [idRequisito], [nombreDocumentoOriginal], [nombreDocumentoSistema], [path], [observaciones], [fecha_creacion], [estado], [fecha_modificacion]) VALUES (18, 15, 17, 34, N'VO', 0, 1, N'OFI-SAT-IAD-DOP-UTO', 0, 2017, 16132017, 4, N'888.pdf', N'34_VO_4_888.pdf', N'C:\Users\egonzalez\Documents\Visual Studio 2013\Projects\Sistema de Gestion Expedientes\Sistema de Gestion Expedientes\doctos\34_VO_4_888.pdf', N'234', CAST(0x0000A738011C08F8 AS DateTime), N'E  ', CAST(0x0000A738011C08F8 AS DateTime))
INSERT [dbo].[ExpedienteAdjunto] ([corr_ExpedienteAnexo], [corr_BorradorAnexo], [id_expediente], [id_Solicitud], [tipoSolicitud], [oficioSAT], [idPrefijoSAT], [PrefijoSAT], [numeroOficioSAT], [anioOficioSAT], [numeroReferencia], [idRequisito], [nombreDocumentoOriginal], [nombreDocumentoSistema], [path], [observaciones], [fecha_creacion], [estado], [fecha_modificacion]) VALUES (21, 16, 3, 1, N'VO', 0, 1, N'OFI-SAT-IAD-DOP-UTO', 0, 2017, 30417, 2, N'888.pdf', N'1_VO_2_888.pdf', N'C:\Users\egonzalez\Documents\Visual Studio 2013\Projects\Sistema de Gestion Expedientes\Sistema de Gestion Expedientes\doctos\1_VO_2_888.pdf', N'Factura Impo Prueba VO', CAST(0x0000A74B0104F116 AS DateTime), N'E  ', CAST(0x0000A74B0104F116 AS DateTime))
INSERT [dbo].[ExpedienteAdjunto] ([corr_ExpedienteAnexo], [corr_BorradorAnexo], [id_expediente], [id_Solicitud], [tipoSolicitud], [oficioSAT], [idPrefijoSAT], [PrefijoSAT], [numeroOficioSAT], [anioOficioSAT], [numeroReferencia], [idRequisito], [nombreDocumentoOriginal], [nombreDocumentoSistema], [path], [observaciones], [fecha_creacion], [estado], [fecha_modificacion]) VALUES (22, 17, 4, 3, N'VO', 0, 1, N'OFI-SAT-IAD-DOP-UTO', 0, 2017, 60417, 2, N'888.pdf', N'3_VO_2_888.pdf', N'C:\Users\egonzalez\Documents\Visual Studio 2013\Projects\Sistema de Gestion Expedientes\Sistema de Gestion Expedientes\doctos\3_VO_2_888.pdf', N'Factura de importacion', CAST(0x0000A74D00A148E6 AS DateTime), N'E  ', CAST(0x0000A74D00A148E6 AS DateTime))
INSERT [dbo].[ExpedienteAdjunto] ([corr_ExpedienteAnexo], [corr_BorradorAnexo], [id_expediente], [id_Solicitud], [tipoSolicitud], [oficioSAT], [idPrefijoSAT], [PrefijoSAT], [numeroOficioSAT], [anioOficioSAT], [numeroReferencia], [idRequisito], [nombreDocumentoOriginal], [nombreDocumentoSistema], [path], [observaciones], [fecha_creacion], [estado], [fecha_modificacion]) VALUES (23, 18, 5, 4, N'VO', 0, 1, N'OFI-SAT-IAD-DOP-UTO', 0, 2017, 110417, 2, N'GloboCentro - 2Checkout.pdf', N'4_VO_2_GloboCentro - 2Checkout.pdf', N'C:\Users\egonzalez\Documents\Visual Studio 2013\Projects\Sistema de Gestion Expedientes\Sistema de Gestion Expedientes\doctos\4_VO_2_GloboCentro - 2Checkout.pdf', N'asdf', CAST(0x0000A75200CC17F5 AS DateTime), N'E  ', CAST(0x0000A75200CC17F5 AS DateTime))
INSERT [dbo].[ExpedienteAdjunto] ([corr_ExpedienteAnexo], [corr_BorradorAnexo], [id_expediente], [id_Solicitud], [tipoSolicitud], [oficioSAT], [idPrefijoSAT], [PrefijoSAT], [numeroOficioSAT], [anioOficioSAT], [numeroReferencia], [idRequisito], [nombreDocumentoOriginal], [nombreDocumentoSistema], [path], [observaciones], [fecha_creacion], [estado], [fecha_modificacion]) VALUES (24, 19, 6, 5, N'VO', 0, 1, N'OFI-SAT-IAD-DOP-UTO', 0, 2017, 210417, 2, N'Pago USAC - Banrural - MOVIMIENTOS.pdf', N'5_VO_2_Pago USAC - Banrural - MOVIMIENTOS.pdf', N'C:\inetpub\wwwroot\SGEO\doctos\5_VO_2_Pago USAC - Banrural - MOVIMIENTOS.pdf', N'asdf', CAST(0x0000A75C012DCBAC AS DateTime), N'E  ', CAST(0x0000A75C012DCBAC AS DateTime))
SET IDENTITY_INSERT [dbo].[ExpedienteAdjunto] OFF
/****** Object:  Table [dbo].[BorradorSolicitud_Enc]    Script Date: 04/22/2017 15:44:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BorradorSolicitud_Enc](
	[id_Solicitud] [int] IDENTITY(1,1) NOT NULL,
	[id_usuarioSolicita] [int] NOT NULL,
	[tipoSolicitud] [varchar](300) NOT NULL,
	[id_instrumento] [int] NOT NULL,
	[fecha_inicio_periodo] [date] NOT NULL,
	[fecha_fin_periodo] [date] NOT NULL,
	[nombres] [varchar](300) NOT NULL,
	[apellidos] [varchar](300) NOT NULL,
	[direccion] [varchar](300) NOT NULL,
	[idDepartamentoSolicita] [int] NOT NULL,
	[correo] [varchar](300) NOT NULL,
	[telefono] [varchar](50) NOT NULL,
	[razonSocialImportador] [varchar](500) NOT NULL,
	[direccionImportador] [varchar](500) NOT NULL,
	[correoImportador] [varchar](50) NOT NULL,
	[idDepartamentoImportador] [int] NOT NULL,
	[nitImportador] [varchar](50) NOT NULL,
	[telefonoImportador] [varchar](50) NOT NULL,
	[razonSocialExportador] [varchar](300) NOT NULL,
	[direccionExportador] [varchar](500) NOT NULL,
	[correoExportador] [varchar](50) NOT NULL,
	[idPaisExportador] [int] NOT NULL,
	[nitExportador] [varchar](50) NULL,
	[telefonoExportador] [varchar](50) NULL,
	[fecha_creacion] [datetime] NOT NULL,
	[fecha_modificacion] [datetime] NULL,
	[estado] [nchar](3) NULL,
 CONSTRAINT [PK_BorradorSolicitud_Enc] PRIMARY KEY CLUSTERED 
(
	[id_Solicitud] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[BorradorSolicitud_Enc] ON
INSERT [dbo].[BorradorSolicitud_Enc] ([id_Solicitud], [id_usuarioSolicita], [tipoSolicitud], [id_instrumento], [fecha_inicio_periodo], [fecha_fin_periodo], [nombres], [apellidos], [direccion], [idDepartamentoSolicita], [correo], [telefono], [razonSocialImportador], [direccionImportador], [correoImportador], [idDepartamentoImportador], [nitImportador], [telefonoImportador], [razonSocialExportador], [direccionExportador], [correoExportador], [idPaisExportador], [nitExportador], [telefonoExportador], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (1, 6, N'VO', 1, CAST(0xDB3A0B00 AS Date), CAST(0x483C0B00 AS Date), N'Administrador', N'SGEO', N'3ra Avenida Ciudad', 2, N'egonzalez@mineco.gob.gt', N'87654321', N'Razon importador ', N'direccion importador', N'correoimportador@corre.com', 1, N'987', N'987', N'razon exportador', N'direccion exportador', N'correoexportador@corre.com', 22, N'789', N'789', CAST(0x0000A74A00CC1855 AS DateTime), CAST(0x0000A74A00D214AC AS DateTime), N'E  ')
INSERT [dbo].[BorradorSolicitud_Enc] ([id_Solicitud], [id_usuarioSolicita], [tipoSolicitud], [id_instrumento], [fecha_inicio_periodo], [fecha_fin_periodo], [nombres], [apellidos], [direccion], [idDepartamentoSolicita], [correo], [telefono], [razonSocialImportador], [direccionImportador], [correoImportador], [idDepartamentoImportador], [nitImportador], [telefonoImportador], [razonSocialExportador], [direccionExportador], [correoExportador], [idPaisExportador], [nitExportador], [telefonoExportador], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (2, 6, N'OT', 3, CAST(0x493C0B00 AS Date), CAST(0xA53C0B00 AS Date), N'Administrador', N'SGEO', N'3ra Avenida Ciudad', 2, N'egonzalez@mineco.gob.gt', N'87654321', N'Razon importador ', N'direccion importador', N'correoimportador@corre.com', 1, N'987', N'987', N'razon exportador', N'direccion exportador', N'correoexportador@corre.com', 22, N'789', N'789', CAST(0x0000A74A00CCF4E8 AS DateTime), CAST(0x0000A74A00D33842 AS DateTime), N'T  ')
INSERT [dbo].[BorradorSolicitud_Enc] ([id_Solicitud], [id_usuarioSolicita], [tipoSolicitud], [id_instrumento], [fecha_inicio_periodo], [fecha_fin_periodo], [nombres], [apellidos], [direccion], [idDepartamentoSolicita], [correo], [telefono], [razonSocialImportador], [direccionImportador], [correoImportador], [idDepartamentoImportador], [nitImportador], [telefonoImportador], [razonSocialExportador], [direccionExportador], [correoExportador], [idPaisExportador], [nitExportador], [telefonoExportador], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (3, 6, N'VO', 1, CAST(0xA83C0B00 AS Date), CAST(0xA83C0B00 AS Date), N'Administrador', N'SGEO', N'3ra Avenida Ciudad', 2, N'egonzalez@mineco.gob.gt', N'87654321', N'Razon importador ', N'direccion importador', N'correoimportador@corre.com', 1, N'987', N'987', N'razon exportador', N'direccion exportador', N'correoexportador@corre.com', 22, N'987', N'987', CAST(0x0000A74D009D9129 AS DateTime), CAST(0x0000A74D009D9129 AS DateTime), N'E  ')
INSERT [dbo].[BorradorSolicitud_Enc] ([id_Solicitud], [id_usuarioSolicita], [tipoSolicitud], [id_instrumento], [fecha_inicio_periodo], [fecha_fin_periodo], [nombres], [apellidos], [direccion], [idDepartamentoSolicita], [correo], [telefono], [razonSocialImportador], [direccionImportador], [correoImportador], [idDepartamentoImportador], [nitImportador], [telefonoImportador], [razonSocialExportador], [direccionExportador], [correoExportador], [idPaisExportador], [nitExportador], [telefonoExportador], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (4, 6, N'VO', 1, CAST(0xAD3C0B00 AS Date), CAST(0xAD3C0B00 AS Date), N'Administrador', N'SGEO', N'3ra Avenida Ciudad', 2, N'egonzalez@mineco.gob.gt', N'87654321', N'Razon importador ', N'direccion importador', N'correoimportador@corre.com', 1, N'789', N'789', N'razon exportador', N'direccion exportador', N'correoexportador@corre.com', 22, N'123', N'213', CAST(0x0000A75200CBAB6B AS DateTime), CAST(0x0000A75200CBAB6B AS DateTime), N'E  ')
INSERT [dbo].[BorradorSolicitud_Enc] ([id_Solicitud], [id_usuarioSolicita], [tipoSolicitud], [id_instrumento], [fecha_inicio_periodo], [fecha_fin_periodo], [nombres], [apellidos], [direccion], [idDepartamentoSolicita], [correo], [telefono], [razonSocialImportador], [direccionImportador], [correoImportador], [idDepartamentoImportador], [nitImportador], [telefonoImportador], [razonSocialExportador], [direccionExportador], [correoExportador], [idPaisExportador], [nitExportador], [telefonoExportador], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (5, 6, N'VO', 1, CAST(0xB73C0B00 AS Date), CAST(0xB73C0B00 AS Date), N'Administrador', N'SGEO', N'3ra Avenida Ciudad', 2, N'egonzalez@mineco.gob.gt', N'87654321', N'Razon importador ', N'direccion importador', N'correoimportador@corre.com', 1, N'987', N'987', N'razon exportador', N'direccion exportador', N'correoexportador@corre.com', 22, N'987', N'987', CAST(0x0000A75C01291B81 AS DateTime), CAST(0x0000A75C01291B81 AS DateTime), N'E  ')
SET IDENTITY_INSERT [dbo].[BorradorSolicitud_Enc] OFF
/****** Object:  Table [dbo].[BorradorProductoImportacion]    Script Date: 04/22/2017 15:44:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BorradorProductoImportacion](
	[id_Solicitud] [int] NOT NULL,
	[id_regimen_importacion] [int] NOT NULL,
	[nombre_regimen_importacion] [varchar](300) NOT NULL,
	[idAduana] [int] NOT NULL,
	[clasificacion_arancelaria] [varchar](300) NOT NULL,
	[descripcion_comercial] [varchar](1500) NULL,
	[descripcion_factura] [varchar](1500) NULL,
	[observaciones] [varchar](1500) NULL,
	[fecha_creacion] [datetime] NOT NULL,
	[fecha_modificacion] [datetime] NOT NULL,
	[estado] [nchar](3) NOT NULL,
 CONSTRAINT [PK_BorradorProductoImportacion] PRIMARY KEY CLUSTERED 
(
	[id_Solicitud] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[BorradorProductoImportacion] ([id_Solicitud], [id_regimen_importacion], [nombre_regimen_importacion], [idAduana], [clasificacion_arancelaria], [descripcion_comercial], [descripcion_factura], [observaciones], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (1, 2, N'ID - Importación definitiva', 2, N'6002', N'Descripcion Comercial', N'Descripción Factura', N'Otras observaciones', CAST(0x0000A74B00E633E8 AS DateTime), CAST(0x0000A74B00EDD2D1 AS DateTime), N'E  ')
INSERT [dbo].[BorradorProductoImportacion] ([id_Solicitud], [id_regimen_importacion], [nombre_regimen_importacion], [idAduana], [clasificacion_arancelaria], [descripcion_comercial], [descripcion_factura], [observaciones], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (2, 1, N'DI - Importación definitiva de mercancías proveniente de almacén fiscal.', 1, N'9001', N'Descripcion comercial', N'descripcion factura 9001', N'observaciones 9001', CAST(0x0000A74B00EE20B3 AS DateTime), CAST(0x0000A74B00EE20B3 AS DateTime), N'A  ')
INSERT [dbo].[BorradorProductoImportacion] ([id_Solicitud], [id_regimen_importacion], [nombre_regimen_importacion], [idAduana], [clasificacion_arancelaria], [descripcion_comercial], [descripcion_factura], [observaciones], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (3, 1, N'DI - Importación definitiva de mercancías proveniente de almacén fiscal.', 1, N'9001', N'descripcion comercial', N'descripcion factura', N'observaciones', CAST(0x0000A74D00A1365F AS DateTime), CAST(0x0000A74D00A1365F AS DateTime), N'E  ')
INSERT [dbo].[BorradorProductoImportacion] ([id_Solicitud], [id_regimen_importacion], [nombre_regimen_importacion], [idAduana], [clasificacion_arancelaria], [descripcion_comercial], [descripcion_factura], [observaciones], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (4, 1, N'DI - Importación definitiva de mercancías proveniente de almacén fiscal.', 1, N'987', N'asdf', N'asdf', N'adf', CAST(0x0000A75200CBD969 AS DateTime), CAST(0x0000A75200CBD969 AS DateTime), N'E  ')
INSERT [dbo].[BorradorProductoImportacion] ([id_Solicitud], [id_regimen_importacion], [nombre_regimen_importacion], [idAduana], [clasificacion_arancelaria], [descripcion_comercial], [descripcion_factura], [observaciones], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (5, 1, N'DI - Importación definitiva de mercancías proveniente de almacén fiscal.', 1, N'987', N'asdf', N'987', N'987', CAST(0x0000A75C012BABE4 AS DateTime), CAST(0x0000A75C012BABE4 AS DateTime), N'E  ')
/****** Object:  Table [dbo].[BorradorMotivos]    Script Date: 04/22/2017 15:44:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BorradorMotivos](
	[id_Solicitud] [int] NOT NULL,
	[motivo_1] [bit] NOT NULL,
	[motivo_2] [bit] NOT NULL,
	[motivo_3] [bit] NOT NULL,
	[motivo_4] [bit] NOT NULL,
	[motivo_5] [bit] NOT NULL,
	[motivo_6] [bit] NOT NULL,
	[motivo_7] [bit] NOT NULL,
	[motivo_8] [bit] NOT NULL,
	[observacion_si_no] [bit] NOT NULL,
	[observaciones] [varchar](1500) NULL,
	[otros_motivos] [varchar](1500) NULL,
	[fecha_creacion] [datetime] NOT NULL,
	[estado] [nchar](3) NOT NULL,
	[fecha_modificacion] [datetime] NOT NULL,
 CONSTRAINT [PK_BorradorMotivos_1] PRIMARY KEY CLUSTERED 
(
	[id_Solicitud] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[BorradorMotivos] ([id_Solicitud], [motivo_1], [motivo_2], [motivo_3], [motivo_4], [motivo_5], [motivo_6], [motivo_7], [motivo_8], [observacion_si_no], [observaciones], [otros_motivos], [fecha_creacion], [estado], [fecha_modificacion]) VALUES (1, 1, 0, 0, 0, 0, 0, 0, 0, 0, N'', N'', CAST(0x0000A74A00D24070 AS DateTime), N'E  ', CAST(0x0000A74A00D24070 AS DateTime))
INSERT [dbo].[BorradorMotivos] ([id_Solicitud], [motivo_1], [motivo_2], [motivo_3], [motivo_4], [motivo_5], [motivo_6], [motivo_7], [motivo_8], [observacion_si_no], [observaciones], [otros_motivos], [fecha_creacion], [estado], [fecha_modificacion]) VALUES (3, 1, 0, 0, 0, 0, 0, 0, 0, 0, N'', N'', CAST(0x0000A74D00A0CED3 AS DateTime), N'E  ', CAST(0x0000A74D00A0CED3 AS DateTime))
INSERT [dbo].[BorradorMotivos] ([id_Solicitud], [motivo_1], [motivo_2], [motivo_3], [motivo_4], [motivo_5], [motivo_6], [motivo_7], [motivo_8], [observacion_si_no], [observaciones], [otros_motivos], [fecha_creacion], [estado], [fecha_modificacion]) VALUES (4, 1, 0, 0, 0, 0, 0, 0, 0, 0, N'', N'', CAST(0x0000A75200CBB2B9 AS DateTime), N'E  ', CAST(0x0000A75200CBB2B9 AS DateTime))
INSERT [dbo].[BorradorMotivos] ([id_Solicitud], [motivo_1], [motivo_2], [motivo_3], [motivo_4], [motivo_5], [motivo_6], [motivo_7], [motivo_8], [observacion_si_no], [observaciones], [otros_motivos], [fecha_creacion], [estado], [fecha_modificacion]) VALUES (5, 1, 0, 0, 0, 0, 0, 0, 0, 0, N'', N'', CAST(0x0000A75C01292243 AS DateTime), N'E  ', CAST(0x0000A75C01292243 AS DateTime))
/****** Object:  Table [dbo].[BorradorImportador]    Script Date: 04/22/2017 15:44:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BorradorImportador](
	[corr_BorradorImportador] [int] IDENTITY(1,1) NOT NULL,
	[id_Solicitud] [int] NOT NULL,
	[tipoSolicitud] [varchar](50) NOT NULL,
	[razon_social] [varchar](500) NOT NULL,
	[correo] [varchar](50) NOT NULL,
	[direccion] [varchar](500) NULL,
	[nit] [varchar](50) NOT NULL,
	[telefono] [varchar](50) NOT NULL,
	[fecha_creacion] [datetime] NOT NULL,
	[fecha_modificacion] [datetime] NOT NULL,
	[estado] [nchar](3) NOT NULL,
 CONSTRAINT [PK_BorradorImportador] PRIMARY KEY CLUSTERED 
(
	[corr_BorradorImportador] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[BorradorImportador] ON
INSERT [dbo].[BorradorImportador] ([corr_BorradorImportador], [id_Solicitud], [tipoSolicitud], [razon_social], [correo], [direccion], [nit], [telefono], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (1, 2, N'OT', N'razon impo1', N'correoimpo@correo.com', N'direccion impo 1', N'987', N'987', CAST(0x0000A74E011B5A08 AS DateTime), CAST(0x0000A75200BC8BCE AS DateTime), N'A  ')
INSERT [dbo].[BorradorImportador] ([corr_BorradorImportador], [id_Solicitud], [tipoSolicitud], [razon_social], [correo], [direccion], [nit], [telefono], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (2, 2, N'OT', N'razon impo', N'correoimpo@correo.com', N'direcion', N'654', N'654', CAST(0x0000A74E011BDD63 AS DateTime), CAST(0x0000A75101040EF1 AS DateTime), N'B  ')
INSERT [dbo].[BorradorImportador] ([corr_BorradorImportador], [id_Solicitud], [tipoSolicitud], [razon_social], [correo], [direccion], [nit], [telefono], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (3, 2, N'OT', N'razon impo2', N'correoimpo@correo.com', N'direccion impo2', N'987', N'654', CAST(0x0000A75200A649A7 AS DateTime), CAST(0x0000A75200BC94F2 AS DateTime), N'A  ')
INSERT [dbo].[BorradorImportador] ([corr_BorradorImportador], [id_Solicitud], [tipoSolicitud], [razon_social], [correo], [direccion], [nit], [telefono], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (4, 2, N'OT', N'razon impo', N'correoimpo@correo.com', N'direccion impo', N'465', N'456', CAST(0x0000A75200BAF028 AS DateTime), CAST(0x0000A75200BAF028 AS DateTime), N'A  ')
INSERT [dbo].[BorradorImportador] ([corr_BorradorImportador], [id_Solicitud], [tipoSolicitud], [razon_social], [correo], [direccion], [nit], [telefono], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (5, 4, N'VO', N'razon impo', N'correoimpo@correo.com', N'direccion impo', N'465', N'987', CAST(0x0000A75200CC0E65 AS DateTime), CAST(0x0000A75200CC0E65 AS DateTime), N'E  ')
INSERT [dbo].[BorradorImportador] ([corr_BorradorImportador], [id_Solicitud], [tipoSolicitud], [razon_social], [correo], [direccion], [nit], [telefono], [fecha_creacion], [fecha_modificacion], [estado]) VALUES (6, 5, N'VO', N'razon impo', N'correoimpo@correo.com', N'direccion impo', N'987', N'987', CAST(0x0000A75C012BBE91 AS DateTime), CAST(0x0000A75C012BBE91 AS DateTime), N'E  ')
SET IDENTITY_INSERT [dbo].[BorradorImportador] OFF
/****** Object:  Table [dbo].[BorradorAdjunto]    Script Date: 04/22/2017 15:44:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BorradorAdjunto](
	[corr_BorradorAnexo] [int] IDENTITY(1,1) NOT NULL,
	[id_Solicitud] [int] NOT NULL,
	[tipoSolicitud] [varchar](50) NOT NULL,
	[oficioSAT] [bit] NULL,
	[idPrefijoSAT] [int] NULL,
	[PrefijoSAT] [varchar](50) NULL,
	[numeroOficioSAT] [int] NULL,
	[anioOficioSAT] [int] NULL,
	[numeroReferencia] [int] NULL,
	[idRequisito] [int] NOT NULL,
	[nombreDocumentoOriginal] [varchar](300) NOT NULL,
	[nombreDocumentoSistema] [varchar](300) NOT NULL,
	[path] [varchar](500) NOT NULL,
	[observaciones] [varchar](1500) NULL,
	[fecha_creacion] [datetime] NOT NULL,
	[estado] [nchar](3) NOT NULL,
	[fecha_modificacion] [datetime] NOT NULL,
 CONSTRAINT [PK_BorradorAdjunto] PRIMARY KEY CLUSTERED 
(
	[corr_BorradorAnexo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[BorradorAdjunto] ON
INSERT [dbo].[BorradorAdjunto] ([corr_BorradorAnexo], [id_Solicitud], [tipoSolicitud], [oficioSAT], [idPrefijoSAT], [PrefijoSAT], [numeroOficioSAT], [anioOficioSAT], [numeroReferencia], [idRequisito], [nombreDocumentoOriginal], [nombreDocumentoSistema], [path], [observaciones], [fecha_creacion], [estado], [fecha_modificacion]) VALUES (16, 1, N'VO', 0, 1, N'OFI-SAT-IAD-DOP-UTO', 0, 2017, 30417, 2, N'888.pdf', N'1_VO_2_888.pdf', N'C:\Users\egonzalez\Documents\Visual Studio 2013\Projects\Sistema de Gestion Expedientes\Sistema de Gestion Expedientes\doctos\1_VO_2_888.pdf', N'Factura Impo Prueba VO', CAST(0x0000A74A00D27CE1 AS DateTime), N'E  ', CAST(0x0000A74A00D27CE1 AS DateTime))
INSERT [dbo].[BorradorAdjunto] ([corr_BorradorAnexo], [id_Solicitud], [tipoSolicitud], [oficioSAT], [idPrefijoSAT], [PrefijoSAT], [numeroOficioSAT], [anioOficioSAT], [numeroReferencia], [idRequisito], [nombreDocumentoOriginal], [nombreDocumentoSistema], [path], [observaciones], [fecha_creacion], [estado], [fecha_modificacion]) VALUES (17, 3, N'VO', 0, 1, N'OFI-SAT-IAD-DOP-UTO', 0, 2017, 60417, 2, N'888.pdf', N'3_VO_2_888.pdf', N'C:\Users\egonzalez\Documents\Visual Studio 2013\Projects\Sistema de Gestion Expedientes\Sistema de Gestion Expedientes\doctos\3_VO_2_888.pdf', N'Factura de importacion', CAST(0x0000A74D00A0FCFA AS DateTime), N'E  ', CAST(0x0000A74D00A0FCFA AS DateTime))
INSERT [dbo].[BorradorAdjunto] ([corr_BorradorAnexo], [id_Solicitud], [tipoSolicitud], [oficioSAT], [idPrefijoSAT], [PrefijoSAT], [numeroOficioSAT], [anioOficioSAT], [numeroReferencia], [idRequisito], [nombreDocumentoOriginal], [nombreDocumentoSistema], [path], [observaciones], [fecha_creacion], [estado], [fecha_modificacion]) VALUES (18, 4, N'VO', 0, 1, N'OFI-SAT-IAD-DOP-UTO', 0, 2017, 110417, 2, N'GloboCentro - 2Checkout.pdf', N'4_VO_2_GloboCentro - 2Checkout.pdf', N'C:\Users\egonzalez\Documents\Visual Studio 2013\Projects\Sistema de Gestion Expedientes\Sistema de Gestion Expedientes\doctos\4_VO_2_GloboCentro - 2Checkout.pdf', N'asdf', CAST(0x0000A75200CBC9BB AS DateTime), N'E  ', CAST(0x0000A75200CBC9BB AS DateTime))
INSERT [dbo].[BorradorAdjunto] ([corr_BorradorAnexo], [id_Solicitud], [tipoSolicitud], [oficioSAT], [idPrefijoSAT], [PrefijoSAT], [numeroOficioSAT], [anioOficioSAT], [numeroReferencia], [idRequisito], [nombreDocumentoOriginal], [nombreDocumentoSistema], [path], [observaciones], [fecha_creacion], [estado], [fecha_modificacion]) VALUES (19, 5, N'VO', 0, 1, N'OFI-SAT-IAD-DOP-UTO', 0, 2017, 210417, 2, N'Pago USAC - Banrural - MOVIMIENTOS.pdf', N'5_VO_2_Pago USAC - Banrural - MOVIMIENTOS.pdf', N'C:\inetpub\wwwroot\SGEO\doctos\5_VO_2_Pago USAC - Banrural - MOVIMIENTOS.pdf', N'asdf', CAST(0x0000A75C012B915F AS DateTime), N'E  ', CAST(0x0000A75C012B915F AS DateTime))
SET IDENTITY_INSERT [dbo].[BorradorAdjunto] OFF
