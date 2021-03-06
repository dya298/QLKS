USE [QuanLyKhachSan]
GO
ALTER TABLE [dbo].[TAIKHOANNV] DROP CONSTRAINT [PK_TAIKHOAN_NHANVIEN]
GO
ALTER TABLE [dbo].[Phong] DROP CONSTRAINT [fk_MaMauPhong_Phong]
GO
ALTER TABLE [dbo].[Phong] DROP CONSTRAINT [fk_MaLoaiPhong_Phong]
GO
ALTER TABLE [dbo].[PHIEUTHUEPHONG] DROP CONSTRAINT [PK_PHIEUTHUEPHONG_MANV]
GO
ALTER TABLE [dbo].[PHIEUTHUEPHONG] DROP CONSTRAINT [FKPHIEUTHUEPHONGPHONG]
GO
ALTER TABLE [dbo].[PHIEUTHUEPHONG] DROP CONSTRAINT [FKPHIEUTHUEPHONGKHACHHANG]
GO
ALTER TABLE [dbo].[PhieuDichVu] DROP CONSTRAINT [fk_MaKH_PhieuDichVu]
GO
ALTER TABLE [dbo].[PhieuDichVu] DROP CONSTRAINT [fk_MaDV_PhieuDichVu]
GO
ALTER TABLE [dbo].[PhieuDangKy] DROP CONSTRAINT [FK_PhieuDangKy_MauPH]
GO
ALTER TABLE [dbo].[PhieuDangKy] DROP CONSTRAINT [FK_PhieuDangKy_LoaiPH]
GO
ALTER TABLE [dbo].[HDON] DROP CONSTRAINT [PK_HDON_NHANVIEN]
GO
ALTER TABLE [dbo].[HDON] DROP CONSTRAINT [PK_HDON_KHACHHANG]
GO
ALTER TABLE [dbo].[CHITIETHOADON] DROP CONSTRAINT [PK_CHITIETHOADON_PHONG]
GO
ALTER TABLE [dbo].[CHITIETHOADON] DROP CONSTRAINT [PK_CHITIETHOADON_HOADON]
GO
/****** Object:  Table [dbo].[TAIKHOANNV]    Script Date: 8/3/2021 10:22:30 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TAIKHOANNV]') AND type in (N'U'))
DROP TABLE [dbo].[TAIKHOANNV]
GO
/****** Object:  Table [dbo].[Phong]    Script Date: 8/3/2021 10:22:30 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Phong]') AND type in (N'U'))
DROP TABLE [dbo].[Phong]
GO
/****** Object:  Table [dbo].[PHIEUTHUEPHONG]    Script Date: 8/3/2021 10:22:30 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PHIEUTHUEPHONG]') AND type in (N'U'))
DROP TABLE [dbo].[PHIEUTHUEPHONG]
GO
/****** Object:  Table [dbo].[PhieuDichVu]    Script Date: 8/3/2021 10:22:30 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PhieuDichVu]') AND type in (N'U'))
DROP TABLE [dbo].[PhieuDichVu]
GO
/****** Object:  Table [dbo].[PhieuDangKy]    Script Date: 8/3/2021 10:22:30 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PhieuDangKy]') AND type in (N'U'))
DROP TABLE [dbo].[PhieuDangKy]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 8/3/2021 10:22:30 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NhanVien]') AND type in (N'U'))
DROP TABLE [dbo].[NhanVien]
GO
/****** Object:  Table [dbo].[MauPhong]    Script Date: 8/3/2021 10:22:30 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MauPhong]') AND type in (N'U'))
DROP TABLE [dbo].[MauPhong]
GO
/****** Object:  Table [dbo].[Luat]    Script Date: 8/3/2021 10:22:30 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Luat]') AND type in (N'U'))
DROP TABLE [dbo].[Luat]
GO
/****** Object:  Table [dbo].[LoaiPhong]    Script Date: 8/3/2021 10:22:30 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LoaiPhong]') AND type in (N'U'))
DROP TABLE [dbo].[LoaiPhong]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 8/3/2021 10:22:30 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KhachHang]') AND type in (N'U'))
DROP TABLE [dbo].[KhachHang]
GO
/****** Object:  Table [dbo].[HDON]    Script Date: 8/3/2021 10:22:30 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HDON]') AND type in (N'U'))
DROP TABLE [dbo].[HDON]
GO
/****** Object:  Table [dbo].[DuLieu]    Script Date: 8/3/2021 10:22:30 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DuLieu]') AND type in (N'U'))
DROP TABLE [dbo].[DuLieu]
GO
/****** Object:  Table [dbo].[DichVu]    Script Date: 8/3/2021 10:22:30 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DichVu]') AND type in (N'U'))
DROP TABLE [dbo].[DichVu]
GO
/****** Object:  Table [dbo].[CHITIETHOADON]    Script Date: 8/3/2021 10:22:30 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CHITIETHOADON]') AND type in (N'U'))
DROP TABLE [dbo].[CHITIETHOADON]
GO
/****** Object:  Table [dbo].[CHITIETHOADON]    Script Date: 8/3/2021 10:22:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHITIETHOADON](
	[MAHD] [int] NOT NULL,
	[MAPHONG] [nvarchar](30) NOT NULL,
	[TENPHONG] [nvarchar](30) NULL,
	[TENKH] [nvarchar](30) NULL,
	[NGAYDAT] [datetime] NULL,
	[NGAYKT] [datetime] NULL,
	[TIENDICHVU] [float] NULL,
	[TIENLOAIPHONG] [float] NULL,
	[TIENMAUPHONG] [float] NULL,
	[TENNHANVIEN] [nvarchar](30) NULL,
	[THANHTIEN] [float] NULL,
 CONSTRAINT [PK_CHITIETHOADON] PRIMARY KEY CLUSTERED 
(
	[MAHD] ASC,
	[MAPHONG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DichVu]    Script Date: 8/3/2021 10:22:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DichVu](
	[MaDV] [nvarchar](30) NOT NULL,
	[TenDV] [nvarchar](30) NULL,
	[GiaDV] [float] NULL,
	[TrangThai] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DuLieu]    Script Date: 8/3/2021 10:22:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DuLieu](
	[Stt] [int] IDENTITY(1,1) NOT NULL,
	[DoTuoi] [nvarchar](30) NULL,
	[GioiTinh] [nvarchar](30) NULL,
	[ThuNhap] [nvarchar](30) NULL,
	[SuDungDichVu] [nvarchar](30) NULL,
	[MauPhong] [nvarchar](30) NULL,
	[LoaiPhong] [nvarchar](30) NULL,
	[XacNhan] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[Stt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HDON]    Script Date: 8/3/2021 10:22:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HDON](
	[MAHD] [int] IDENTITY(1,1) NOT NULL,
	[MAKH] [nvarchar](30) NULL,
	[MANV] [nvarchar](30) NULL,
	[NGAYLAPHD] [datetime] NULL,
	[THANHTIEN] [float] NULL,
 CONSTRAINT [PK_HDON] PRIMARY KEY CLUSTERED 
(
	[MAHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 8/3/2021 10:22:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [nvarchar](30) NOT NULL,
	[TenKH] [nvarchar](30) NULL,
	[NgaySinh] [datetime] NULL,
	[GioiTinh] [nvarchar](30) NULL,
	[SoCMND] [nvarchar](30) NULL,
	[SDT] [nvarchar](30) NULL,
	[QuocTich] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiPhong]    Script Date: 8/3/2021 10:22:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiPhong](
	[MaLoaiPhong] [nvarchar](30) NOT NULL,
	[GiaPhong] [float] NULL,
	[MoTa] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLoaiPhong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Luat]    Script Date: 8/3/2021 10:22:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Luat](
	[Stt] [int] IDENTITY(1,1) NOT NULL,
	[DoTuoi] [nvarchar](30) NULL,
	[GioiTinh] [nvarchar](30) NULL,
	[ThuNhap] [nvarchar](30) NULL,
	[SuDungDichVu] [nvarchar](30) NULL,
	[MauPhong] [nvarchar](30) NULL,
	[LoaiPhong] [nvarchar](30) NULL,
	[XacNhan] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[Stt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MauPhong]    Script Date: 8/3/2021 10:22:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MauPhong](
	[MaMauPhong] [nvarchar](30) NOT NULL,
	[TenMauPhong] [nvarchar](30) NULL,
	[DonGia] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaMauPhong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 8/3/2021 10:22:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [nvarchar](30) NOT NULL,
	[TenNV] [nvarchar](30) NULL,
	[NgaySinh] [datetime] NULL,
	[GioiTinh] [nvarchar](10) NULL,
	[SoCMND] [nvarchar](30) NULL,
	[DiaChi] [nvarchar](30) NULL,
	[SDT] [nvarchar](30) NULL,
	[ChucVu] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuDangKy]    Script Date: 8/3/2021 10:22:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuDangKy](
	[MaPDK] [int] IDENTITY(1,1) NOT NULL,
	[MaMauPhong] [nvarchar](30) NULL,
	[MaLoaiPhong] [nvarchar](30) NULL,
	[NgayVao] [datetime] NULL,
	[NgayTra] [datetime] NULL,
	[HoTen] [nvarchar](30) NULL,
	[CMND] [nvarchar](50) NULL,
	[SDT] [varchar](20) NULL,
	[QuocTich] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPDK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuDichVu]    Script Date: 8/3/2021 10:22:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuDichVu](
	[MaKH] [nvarchar](30) NOT NULL,
	[MaDV] [nvarchar](30) NOT NULL,
	[SoLuong] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC,
	[MaDV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PHIEUTHUEPHONG]    Script Date: 8/3/2021 10:22:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHIEUTHUEPHONG](
	[MAPHONG] [nvarchar](30) NOT NULL,
	[MAKH] [nvarchar](30) NOT NULL,
	[NGAYDAT] [datetime] NULL,
	[NGAYKETTHUC] [datetime] NULL,
	[TONGTIEN] [float] NULL,
	[MANV] [nvarchar](30) NULL,
 CONSTRAINT [PKPHIEUTHUEPHONG] PRIMARY KEY CLUSTERED 
(
	[MAPHONG] ASC,
	[MAKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Phong]    Script Date: 8/3/2021 10:22:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phong](
	[MaPhong] [nvarchar](30) NOT NULL,
	[MaLoaiPhong] [nvarchar](30) NULL,
	[MaMauPhong] [nvarchar](30) NULL,
	[TinhTrang] [int] NULL,
	[TenPhong] [nvarchar](30) NULL,
	[HinhAnh] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPhong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TAIKHOANNV]    Script Date: 8/3/2021 10:22:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TAIKHOANNV](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MANV] [nvarchar](30) NULL,
	[TENTAIKHOAN] [nvarchar](30) NULL,
	[MATKHAU] [nvarchar](30) NULL,
	[TinhTrang] [nvarchar](30) NULL,
	[PhanQuyen] [nvarchar](30) NULL,
 CONSTRAINT [PK_TAIKHOAN] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[CHITIETHOADON] ([MAHD], [MAPHONG], [TENPHONG], [TENKH], [NGAYDAT], [NGAYKT], [TIENDICHVU], [TIENLOAIPHONG], [TIENMAUPHONG], [TENNHANVIEN], [THANHTIEN]) VALUES (1033, N'P002', N'Phòng P02CABD', N'Anh', CAST(N'2021-05-09T00:00:00.000' AS DateTime), CAST(N'2021-05-09T00:00:00.000' AS DateTime), 0, 100, 25, N'Thúy', 125)
INSERT [dbo].[CHITIETHOADON] ([MAHD], [MAPHONG], [TENPHONG], [TENKH], [NGAYDAT], [NGAYKT], [TIENDICHVU], [TIENLOAIPHONG], [TIENMAUPHONG], [TENNHANVIEN], [THANHTIEN]) VALUES (1034, N'P003', N'Phòng P03TTBD', N'Tài', CAST(N'2021-05-09T00:00:00.000' AS DateTime), CAST(N'2021-05-09T00:00:00.000' AS DateTime), 0, 100, 15, N'Thúy', 115)
INSERT [dbo].[CHITIETHOADON] ([MAHD], [MAPHONG], [TENPHONG], [TENKH], [NGAYDAT], [NGAYKT], [TIENDICHVU], [TIENLOAIPHONG], [TIENMAUPHONG], [TENNHANVIEN], [THANHTIEN]) VALUES (1035, N'P002', N'Phòng P02CABD', N'Anh', CAST(N'2021-05-09T00:00:00.000' AS DateTime), CAST(N'2021-05-09T00:00:00.000' AS DateTime), 0, 100, 25, N'Thúy', 125)
INSERT [dbo].[CHITIETHOADON] ([MAHD], [MAPHONG], [TENPHONG], [TENKH], [NGAYDAT], [NGAYKT], [TIENDICHVU], [TIENLOAIPHONG], [TIENMAUPHONG], [TENNHANVIEN], [THANHTIEN]) VALUES (1036, N'P002', N'Phòng P02CABD', N'Anh', CAST(N'2021-05-09T00:00:00.000' AS DateTime), CAST(N'2021-05-09T00:00:00.000' AS DateTime), 0, 100, 25, N'Vượng', 125)
INSERT [dbo].[CHITIETHOADON] ([MAHD], [MAPHONG], [TENPHONG], [TENKH], [NGAYDAT], [NGAYKT], [TIENDICHVU], [TIENLOAIPHONG], [TIENMAUPHONG], [TENNHANVIEN], [THANHTIEN]) VALUES (1037, N'P002', N'Phòng P02CABD', N'Anh', CAST(N'2021-05-09T00:00:00.000' AS DateTime), CAST(N'2021-05-09T00:00:00.000' AS DateTime), 0, 100, 25, N'Thúy', 125)
INSERT [dbo].[CHITIETHOADON] ([MAHD], [MAPHONG], [TENPHONG], [TENKH], [NGAYDAT], [NGAYKT], [TIENDICHVU], [TIENLOAIPHONG], [TIENMAUPHONG], [TENNHANVIEN], [THANHTIEN]) VALUES (1038, N'P002', N'Phòng P02CABD', N'Anh', CAST(N'2021-05-09T00:00:00.000' AS DateTime), CAST(N'2021-05-09T00:00:00.000' AS DateTime), 104, 100, 25, N'Thúy', 229)
INSERT [dbo].[CHITIETHOADON] ([MAHD], [MAPHONG], [TENPHONG], [TENKH], [NGAYDAT], [NGAYKT], [TIENDICHVU], [TIENLOAIPHONG], [TIENMAUPHONG], [TENNHANVIEN], [THANHTIEN]) VALUES (1041, N'P002', N'Phòng P02CABD', N'duy', CAST(N'2021-05-09T00:00:00.000' AS DateTime), CAST(N'2021-05-09T00:00:00.000' AS DateTime), 0, 100, 25, N'Thúy', 125)
INSERT [dbo].[CHITIETHOADON] ([MAHD], [MAPHONG], [TENPHONG], [TENKH], [NGAYDAT], [NGAYKT], [TIENDICHVU], [TIENLOAIPHONG], [TIENMAUPHONG], [TENNHANVIEN], [THANHTIEN]) VALUES (1042, N'P002', N'Phòng P02CABD', N'duy', CAST(N'2021-05-09T00:00:00.000' AS DateTime), CAST(N'2021-05-09T00:00:00.000' AS DateTime), 27, 100, 25, N'Tài', 152)
INSERT [dbo].[CHITIETHOADON] ([MAHD], [MAPHONG], [TENPHONG], [TENKH], [NGAYDAT], [NGAYKT], [TIENDICHVU], [TIENLOAIPHONG], [TIENMAUPHONG], [TENNHANVIEN], [THANHTIEN]) VALUES (1043, N'P003', N'Phòng P03TTBD', N'Duy', CAST(N'2021-05-09T00:00:00.000' AS DateTime), CAST(N'2021-05-09T00:00:00.000' AS DateTime), 62, 100, 15, N'Thúy', 177)
INSERT [dbo].[CHITIETHOADON] ([MAHD], [MAPHONG], [TENPHONG], [TENKH], [NGAYDAT], [NGAYKT], [TIENDICHVU], [TIENLOAIPHONG], [TIENMAUPHONG], [TENNHANVIEN], [THANHTIEN]) VALUES (1044, N'P003', N'Phòng P03TTBD', N'Duy', CAST(N'2021-05-09T00:00:00.000' AS DateTime), CAST(N'2021-05-09T00:00:00.000' AS DateTime), 35, 100, 15, N'Lý', 150)
INSERT [dbo].[CHITIETHOADON] ([MAHD], [MAPHONG], [TENPHONG], [TENKH], [NGAYDAT], [NGAYKT], [TIENDICHVU], [TIENLOAIPHONG], [TIENMAUPHONG], [TENNHANVIEN], [THANHTIEN]) VALUES (1046, N'P003', N'Phòng P03TTBD', N'Duy', CAST(N'2021-05-09T00:00:00.000' AS DateTime), CAST(N'2021-08-11T23:59:59.000' AS DateTime), 121, 100, 15, N'Linh', 236)
INSERT [dbo].[CHITIETHOADON] ([MAHD], [MAPHONG], [TENPHONG], [TENKH], [NGAYDAT], [NGAYKT], [TIENDICHVU], [TIENLOAIPHONG], [TIENMAUPHONG], [TENNHANVIEN], [THANHTIEN]) VALUES (1047, N'P003', N'Phòng P03TTBD', N'Duy', CAST(N'2021-08-02T23:59:59.000' AS DateTime), CAST(N'2021-08-04T23:59:59.000' AS DateTime), 57, 100, 15, N'Thịnh', 172)
INSERT [dbo].[CHITIETHOADON] ([MAHD], [MAPHONG], [TENPHONG], [TENKH], [NGAYDAT], [NGAYKT], [TIENDICHVU], [TIENLOAIPHONG], [TIENMAUPHONG], [TENNHANVIEN], [THANHTIEN]) VALUES (1048, N'P004', N'Phòng P04HDTB', N'Duy', CAST(N'2021-05-09T00:00:00.000' AS DateTime), CAST(N'2021-05-09T00:00:00.000' AS DateTime), 17, 200, 30, N'Thúy', 247)
INSERT [dbo].[CHITIETHOADON] ([MAHD], [MAPHONG], [TENPHONG], [TENKH], [NGAYDAT], [NGAYKT], [TIENDICHVU], [TIENLOAIPHONG], [TIENMAUPHONG], [TENNHANVIEN], [THANHTIEN]) VALUES (1049, N'P003', N'Phòng P03TTBD', N'Cao', CAST(N'2021-05-09T00:00:00.000' AS DateTime), CAST(N'2021-05-09T00:00:00.000' AS DateTime), 0, 100, 15, N'Thúy', 115)
INSERT [dbo].[CHITIETHOADON] ([MAHD], [MAPHONG], [TENPHONG], [TENKH], [NGAYDAT], [NGAYKT], [TIENDICHVU], [TIENLOAIPHONG], [TIENMAUPHONG], [TENNHANVIEN], [THANHTIEN]) VALUES (1050, N'P002', N'Phòng P02CABD', N'Anh', CAST(N'2021-05-09T00:00:00.000' AS DateTime), CAST(N'2021-05-09T00:00:00.000' AS DateTime), 0, 100, 25, N'Thúy', 125)
INSERT [dbo].[CHITIETHOADON] ([MAHD], [MAPHONG], [TENPHONG], [TENKH], [NGAYDAT], [NGAYKT], [TIENDICHVU], [TIENLOAIPHONG], [TIENMAUPHONG], [TENNHANVIEN], [THANHTIEN]) VALUES (1051, N'P001', N'Phòng P01TABD', N'Duy', CAST(N'2021-05-09T00:00:00.000' AS DateTime), CAST(N'2021-07-23T23:59:59.000' AS DateTime), 0, 100, 20, N'Thúy', 120)
INSERT [dbo].[CHITIETHOADON] ([MAHD], [MAPHONG], [TENPHONG], [TENKH], [NGAYDAT], [NGAYKT], [TIENDICHVU], [TIENLOAIPHONG], [TIENMAUPHONG], [TENNHANVIEN], [THANHTIEN]) VALUES (1052, N'P004', N'Phòng P04HDTB', N'Duy', CAST(N'2021-05-09T00:00:00.000' AS DateTime), CAST(N'2021-05-09T00:00:00.000' AS DateTime), 52, 200, 30, N'Tèo', 282)
INSERT [dbo].[CHITIETHOADON] ([MAHD], [MAPHONG], [TENPHONG], [TENKH], [NGAYDAT], [NGAYKT], [TIENDICHVU], [TIENLOAIPHONG], [TIENMAUPHONG], [TENNHANVIEN], [THANHTIEN]) VALUES (1053, N'P004', N'Phòng P04HDTB', N'Duy', CAST(N'2021-08-02T23:59:59.000' AS DateTime), CAST(N'2021-08-04T23:59:59.000' AS DateTime), 70, 200, 30, N'Thúy', 300)
GO
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [GiaDV], [TrangThai]) VALUES (N'DV001', N'Xe đạp', 10, N'0')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [GiaDV], [TrangThai]) VALUES (N'DV002', N'Massage', 15, N'0')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [GiaDV], [TrangThai]) VALUES (N'DV003', N'Tắm trắng', 20, N'0')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [GiaDV], [TrangThai]) VALUES (N'DV004', N'Buffet', 35, N'0')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [GiaDV], [TrangThai]) VALUES (N'DV005', N'Hồ bơi', 12, N'0')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [GiaDV], [TrangThai]) VALUES (N'DV006', N'Khiêu vũ', 12, N'0')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [GiaDV], [TrangThai]) VALUES (N'DV007', N'Quầy bar', 17, N'0')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [GiaDV], [TrangThai]) VALUES (N'DV008', N'Bóng chày', 20, N'0')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [GiaDV], [TrangThai]) VALUES (N'DV009', N'Bóng đá', 20, N'0')
GO
SET IDENTITY_INSERT [dbo].[DuLieu] ON 

INSERT [dbo].[DuLieu] ([Stt], [DoTuoi], [GioiTinh], [ThuNhap], [SuDungDichVu], [MauPhong], [LoaiPhong], [XacNhan]) VALUES (1, N'Trên 18', N'Trai', N'Cao', N'Có', N'Tây âu', N'Bình dân', N'Không Nên')
INSERT [dbo].[DuLieu] ([Stt], [DoTuoi], [GioiTinh], [ThuNhap], [SuDungDichVu], [MauPhong], [LoaiPhong], [XacNhan]) VALUES (2, N'Trên 35', N'Trai', N'Thấp', N'Không', N'Châu á', N'Bình dân', N'Nên')
INSERT [dbo].[DuLieu] ([Stt], [DoTuoi], [GioiTinh], [ThuNhap], [SuDungDichVu], [MauPhong], [LoaiPhong], [XacNhan]) VALUES (3, N'Trên 35', N'Gái', N'Cao', N'Có', N'Trẻ trung', N'Trung bình', N'Nên')
INSERT [dbo].[DuLieu] ([Stt], [DoTuoi], [GioiTinh], [ThuNhap], [SuDungDichVu], [MauPhong], [LoaiPhong], [XacNhan]) VALUES (4, N'Trên 18', N'Trai', N'Cao', N'Không', N'Châu á', N'Hoàng gia', N'Không Nên')
INSERT [dbo].[DuLieu] ([Stt], [DoTuoi], [GioiTinh], [ThuNhap], [SuDungDichVu], [MauPhong], [LoaiPhong], [XacNhan]) VALUES (5, N'Từ 18 đến 35', N'Trai', N'Cao', N'Có', N'Trẻ trung', N'Trung bình', N'Nên')
INSERT [dbo].[DuLieu] ([Stt], [DoTuoi], [GioiTinh], [ThuNhap], [SuDungDichVu], [MauPhong], [LoaiPhong], [XacNhan]) VALUES (6, N'Trên 18', N'Gái', N'Cao', N'Có', N'Châu á', N'Bình dân', N'Không Nên')
INSERT [dbo].[DuLieu] ([Stt], [DoTuoi], [GioiTinh], [ThuNhap], [SuDungDichVu], [MauPhong], [LoaiPhong], [XacNhan]) VALUES (7, N'Trên 35', N'Trai', N'Thấp', N'Không', N'Hiện đại', N'Hoàng gia', N'Nên')
INSERT [dbo].[DuLieu] ([Stt], [DoTuoi], [GioiTinh], [ThuNhap], [SuDungDichVu], [MauPhong], [LoaiPhong], [XacNhan]) VALUES (8, N'Trên 18', N'Trai', N'Thấp', N'Không', N'Châu á', N'Hoàng gia', N'Nên')
INSERT [dbo].[DuLieu] ([Stt], [DoTuoi], [GioiTinh], [ThuNhap], [SuDungDichVu], [MauPhong], [LoaiPhong], [XacNhan]) VALUES (9, N'Từ 18 đến 35', N'Gái', N'Thấp', N'Có', N'Trẻ trung', N'Trung bình', N'Không Nên')
INSERT [dbo].[DuLieu] ([Stt], [DoTuoi], [GioiTinh], [ThuNhap], [SuDungDichVu], [MauPhong], [LoaiPhong], [XacNhan]) VALUES (10, N'Từ 18 đến 35', N'Trai', N'Trung Bình', N'Không', N'Trẻ trung', N'Trung bình', N'Nên')
INSERT [dbo].[DuLieu] ([Stt], [DoTuoi], [GioiTinh], [ThuNhap], [SuDungDichVu], [MauPhong], [LoaiPhong], [XacNhan]) VALUES (11, N'Trên 18', N'Gái', N'Trung Bình', N'Có', N'Tây âu', N'Bình dân', N'Không Nên')
INSERT [dbo].[DuLieu] ([Stt], [DoTuoi], [GioiTinh], [ThuNhap], [SuDungDichVu], [MauPhong], [LoaiPhong], [XacNhan]) VALUES (12, N'Trên 18', N'Trai', N'Cao', N'Không', N'Hiện đại', N'Bình dân', N'Nên')
INSERT [dbo].[DuLieu] ([Stt], [DoTuoi], [GioiTinh], [ThuNhap], [SuDungDichVu], [MauPhong], [LoaiPhong], [XacNhan]) VALUES (13, N'Trên 35', N'Trai', N'Trung Bình', N'Không', N'Châu á', N'Bình dân', N'Nên')
INSERT [dbo].[DuLieu] ([Stt], [DoTuoi], [GioiTinh], [ThuNhap], [SuDungDichVu], [MauPhong], [LoaiPhong], [XacNhan]) VALUES (14, N'Trên 18', N'Gái', N'Thấp', N'Có', N'Châu á', N'Bình dân', N'Không Nên')
INSERT [dbo].[DuLieu] ([Stt], [DoTuoi], [GioiTinh], [ThuNhap], [SuDungDichVu], [MauPhong], [LoaiPhong], [XacNhan]) VALUES (15, N'Từ 18 đến 35', N'Trai', N'Thấp', N'Không', N'Trẻ trung', N'Trung bình', N'Không Nên')
INSERT [dbo].[DuLieu] ([Stt], [DoTuoi], [GioiTinh], [ThuNhap], [SuDungDichVu], [MauPhong], [LoaiPhong], [XacNhan]) VALUES (16, N'Trên 35', N'Trai', N'Trung Bình', N'Không', N'Châu á', N'Bình dân', N'Nên')
INSERT [dbo].[DuLieu] ([Stt], [DoTuoi], [GioiTinh], [ThuNhap], [SuDungDichVu], [MauPhong], [LoaiPhong], [XacNhan]) VALUES (17, N'Trên 35', N'Gái', N'Thấp', N'Không', N'Tây âu', N'Bình dân', N'Không Nên')
INSERT [dbo].[DuLieu] ([Stt], [DoTuoi], [GioiTinh], [ThuNhap], [SuDungDichVu], [MauPhong], [LoaiPhong], [XacNhan]) VALUES (18, N'Từ 18 đến 35', N'Trai', N'Cao', N'Không', N'Trẻ trung', N'Hoàng gia', N'Không Nên')
INSERT [dbo].[DuLieu] ([Stt], [DoTuoi], [GioiTinh], [ThuNhap], [SuDungDichVu], [MauPhong], [LoaiPhong], [XacNhan]) VALUES (19, N'Trên 18', N'Trai', N'Trung Bình', N'Có', N'Trẻ trung', N'Hoàng gia', N'Không Nên')
INSERT [dbo].[DuLieu] ([Stt], [DoTuoi], [GioiTinh], [ThuNhap], [SuDungDichVu], [MauPhong], [LoaiPhong], [XacNhan]) VALUES (20, N'Trên 35', N'Gái', N'Trung Bình', N'Không', N'Trẻ trung', N'Trung bình', N'Nên')
INSERT [dbo].[DuLieu] ([Stt], [DoTuoi], [GioiTinh], [ThuNhap], [SuDungDichVu], [MauPhong], [LoaiPhong], [XacNhan]) VALUES (21, N'Trên 35', N'Gái', N'Thấp', N'Không', N'Trẻ trung', N'Trung bình', N'Không Nên')
INSERT [dbo].[DuLieu] ([Stt], [DoTuoi], [GioiTinh], [ThuNhap], [SuDungDichVu], [MauPhong], [LoaiPhong], [XacNhan]) VALUES (22, N'Trên 18', N'Gái', N'Trung Bình', N'Không', N'Hiện đại', N'Bình dân', N'Nên')
INSERT [dbo].[DuLieu] ([Stt], [DoTuoi], [GioiTinh], [ThuNhap], [SuDungDichVu], [MauPhong], [LoaiPhong], [XacNhan]) VALUES (23, N'Từ 18 đến 35', N'Trai', N'Thấp', N'Có', N'Hiện đại', N'Bình dân', N'Không Nên')
INSERT [dbo].[DuLieu] ([Stt], [DoTuoi], [GioiTinh], [ThuNhap], [SuDungDichVu], [MauPhong], [LoaiPhong], [XacNhan]) VALUES (24, N'Trên 18', N'Gái', N'Cao', N'Có', N'Châu á', N'Bình dân', N'Nên')
INSERT [dbo].[DuLieu] ([Stt], [DoTuoi], [GioiTinh], [ThuNhap], [SuDungDichVu], [MauPhong], [LoaiPhong], [XacNhan]) VALUES (25, N'Trên 18', N'Trai', N'Thấp', N'Có', N'Hiện đại', N'Hoàng gia', N'Không Nên')
INSERT [dbo].[DuLieu] ([Stt], [DoTuoi], [GioiTinh], [ThuNhap], [SuDungDichVu], [MauPhong], [LoaiPhong], [XacNhan]) VALUES (26, N'Từ 18 đến 35', N'Gái', N'Trung Bình', N'Có', N'Trẻ trung', N'Trung bình', N'Không Nên')
INSERT [dbo].[DuLieu] ([Stt], [DoTuoi], [GioiTinh], [ThuNhap], [SuDungDichVu], [MauPhong], [LoaiPhong], [XacNhan]) VALUES (27, N'Trên 35', N'Trai', N'Cao', N'Có', N'Tây âu', N'Bình dân', N'Nên')
INSERT [dbo].[DuLieu] ([Stt], [DoTuoi], [GioiTinh], [ThuNhap], [SuDungDichVu], [MauPhong], [LoaiPhong], [XacNhan]) VALUES (28, N'Trên 35', N'Trai', N'Trung Bình', N'Có', N'Trẻ trung', N'Trung bình', N'Nên')
INSERT [dbo].[DuLieu] ([Stt], [DoTuoi], [GioiTinh], [ThuNhap], [SuDungDichVu], [MauPhong], [LoaiPhong], [XacNhan]) VALUES (29, N'Từ 18 đến 35', N'Gái', N'Cao', N'Có', N'Trẻ trung', N'Trung bình', N'Không Nên')
INSERT [dbo].[DuLieu] ([Stt], [DoTuoi], [GioiTinh], [ThuNhap], [SuDungDichVu], [MauPhong], [LoaiPhong], [XacNhan]) VALUES (30, N'Trên 18', N'Trai', N'Trung Bình', N'Có', N'Trẻ trung', N'Trung bình', N'Nên')
INSERT [dbo].[DuLieu] ([Stt], [DoTuoi], [GioiTinh], [ThuNhap], [SuDungDichVu], [MauPhong], [LoaiPhong], [XacNhan]) VALUES (31, N'Trên 35', N'Gái', N'Thấp', N'Có', N'Hiện đại', N'Hoàng gia', N'Nên')
INSERT [dbo].[DuLieu] ([Stt], [DoTuoi], [GioiTinh], [ThuNhap], [SuDungDichVu], [MauPhong], [LoaiPhong], [XacNhan]) VALUES (32, N'Từ 18 đến 35', N'Trai', N'Thấp', N'Không', N'Trẻ trung', N'Trung bình', N'Không Nên')
INSERT [dbo].[DuLieu] ([Stt], [DoTuoi], [GioiTinh], [ThuNhap], [SuDungDichVu], [MauPhong], [LoaiPhong], [XacNhan]) VALUES (33, N'Trên 35', N'Trai', N'Cao', N'Có', N'Hiện đại', N'Bình dân', N'Nên')
INSERT [dbo].[DuLieu] ([Stt], [DoTuoi], [GioiTinh], [ThuNhap], [SuDungDichVu], [MauPhong], [LoaiPhong], [XacNhan]) VALUES (34, N'Trên 35', N'Gái', N'Cao', N'Không', N'Châu á', N'Bình dân', N'Nên')
INSERT [dbo].[DuLieu] ([Stt], [DoTuoi], [GioiTinh], [ThuNhap], [SuDungDichVu], [MauPhong], [LoaiPhong], [XacNhan]) VALUES (35, N'Từ 18 đến 35', N'Gái', N'Trung Bình', N'Không', N'Tây âu', N'Bình dân', N'Nên')
INSERT [dbo].[DuLieu] ([Stt], [DoTuoi], [GioiTinh], [ThuNhap], [SuDungDichVu], [MauPhong], [LoaiPhong], [XacNhan]) VALUES (36, N'Trên 18', N'Trai', N'Trung Bình', N'Không', N'Trẻ trung', N'Hoàng gia', N'Nên')
INSERT [dbo].[DuLieu] ([Stt], [DoTuoi], [GioiTinh], [ThuNhap], [SuDungDichVu], [MauPhong], [LoaiPhong], [XacNhan]) VALUES (37, N'Từ 18 đến 35', N'Trai', N'Cao', N'Không', N'Tây âu', N'Hoàng gia', N'Không Nên')
INSERT [dbo].[DuLieu] ([Stt], [DoTuoi], [GioiTinh], [ThuNhap], [SuDungDichVu], [MauPhong], [LoaiPhong], [XacNhan]) VALUES (38, N'Trên 35', N'Gái', N'Trung Bình', N'Có', N'Tây âu', N'Bình dân', N'Không Nên')
INSERT [dbo].[DuLieu] ([Stt], [DoTuoi], [GioiTinh], [ThuNhap], [SuDungDichVu], [MauPhong], [LoaiPhong], [XacNhan]) VALUES (39, N'Trên 18', N'Gái', N'Thấp', N'Có', N'Trẻ trung', N'Bình dân', N'Nên')
INSERT [dbo].[DuLieu] ([Stt], [DoTuoi], [GioiTinh], [ThuNhap], [SuDungDichVu], [MauPhong], [LoaiPhong], [XacNhan]) VALUES (40, N'Từ 18 đến 35', N'Gái', N'Trung Bình', N'Có', N'Trẻ trung', N'Trung bình', N'Nên')
INSERT [dbo].[DuLieu] ([Stt], [DoTuoi], [GioiTinh], [ThuNhap], [SuDungDichVu], [MauPhong], [LoaiPhong], [XacNhan]) VALUES (41, N'Trên 35', N'Trai', N'Trung Bình', N'Có', N'Tây âu', N'Trung bình', N'Không Nên')
INSERT [dbo].[DuLieu] ([Stt], [DoTuoi], [GioiTinh], [ThuNhap], [SuDungDichVu], [MauPhong], [LoaiPhong], [XacNhan]) VALUES (42, N'Trên 18', N'Trai', N'Thấp', N'Có', N'Hiện đại', N'Hoàng gia', N'Nên')
INSERT [dbo].[DuLieu] ([Stt], [DoTuoi], [GioiTinh], [ThuNhap], [SuDungDichVu], [MauPhong], [LoaiPhong], [XacNhan]) VALUES (43, N'Từ 18 đến 35', N'Gái', N'Cao', N'Có', N'Châu á', N'Bình dân', N'Nên')
INSERT [dbo].[DuLieu] ([Stt], [DoTuoi], [GioiTinh], [ThuNhap], [SuDungDichVu], [MauPhong], [LoaiPhong], [XacNhan]) VALUES (44, N'Trên 18', N'Gái', N'Trung Bình', N'Không', N'Châu á', N'Hoàng gia', N'Không Nên')
INSERT [dbo].[DuLieu] ([Stt], [DoTuoi], [GioiTinh], [ThuNhap], [SuDungDichVu], [MauPhong], [LoaiPhong], [XacNhan]) VALUES (45, N'Từ 18 đến 35', N'Trai', N'Cao', N'Có', N'Châu á', N'Bình dân', N'Nên')
INSERT [dbo].[DuLieu] ([Stt], [DoTuoi], [GioiTinh], [ThuNhap], [SuDungDichVu], [MauPhong], [LoaiPhong], [XacNhan]) VALUES (46, N'Từ 18 đến 35', N'Trai', N'Trung Bình', N'Không', N'Châu á', N'Bình dân', N'Nên')
INSERT [dbo].[DuLieu] ([Stt], [DoTuoi], [GioiTinh], [ThuNhap], [SuDungDichVu], [MauPhong], [LoaiPhong], [XacNhan]) VALUES (47, N'Trên 35', N'Gái', N'Cao', N'Không', N'Châu á', N'Bình dân', N'Không Nên')
SET IDENTITY_INSERT [dbo].[DuLieu] OFF
GO
SET IDENTITY_INSERT [dbo].[HDON] ON 

INSERT [dbo].[HDON] ([MAHD], [MAKH], [MANV], [NGAYLAPHD], [THANHTIEN]) VALUES (1004, N'KH002', N'NV001', CAST(N'2021-06-07T00:00:00.000' AS DateTime), 125)
INSERT [dbo].[HDON] ([MAHD], [MAKH], [MANV], [NGAYLAPHD], [THANHTIEN]) VALUES (1005, N'KH001', N'NV001', CAST(N'2021-07-13T00:00:00.000' AS DateTime), 120)
INSERT [dbo].[HDON] ([MAHD], [MAKH], [MANV], [NGAYLAPHD], [THANHTIEN]) VALUES (1006, N'KH001', N'NV001', CAST(N'2021-07-14T00:00:00.000' AS DateTime), 182)
INSERT [dbo].[HDON] ([MAHD], [MAKH], [MANV], [NGAYLAPHD], [THANHTIEN]) VALUES (1007, N'KH001', N'NV001', CAST(N'2021-07-14T00:00:00.000' AS DateTime), 145)
INSERT [dbo].[HDON] ([MAHD], [MAKH], [MANV], [NGAYLAPHD], [THANHTIEN]) VALUES (1008, N'KH001', N'NV001', CAST(N'2021-07-14T00:00:00.000' AS DateTime), 120)
INSERT [dbo].[HDON] ([MAHD], [MAKH], [MANV], [NGAYLAPHD], [THANHTIEN]) VALUES (1009, N'KH001', N'NV001', CAST(N'2021-07-14T00:00:00.000' AS DateTime), 120)
INSERT [dbo].[HDON] ([MAHD], [MAKH], [MANV], [NGAYLAPHD], [THANHTIEN]) VALUES (1010, N'KH001', N'NV001', CAST(N'2021-07-14T00:00:00.000' AS DateTime), 120)
INSERT [dbo].[HDON] ([MAHD], [MAKH], [MANV], [NGAYLAPHD], [THANHTIEN]) VALUES (1011, N'KH003', N'NV001', CAST(N'2021-07-21T00:00:00.000' AS DateTime), 170)
INSERT [dbo].[HDON] ([MAHD], [MAKH], [MANV], [NGAYLAPHD], [THANHTIEN]) VALUES (1012, N'KH002', N'NV001', CAST(N'2021-07-21T00:00:00.000' AS DateTime), 125)
INSERT [dbo].[HDON] ([MAHD], [MAKH], [MANV], [NGAYLAPHD], [THANHTIEN]) VALUES (1013, N'KH001', N'NV001', CAST(N'2021-07-21T00:00:00.000' AS DateTime), 120)
INSERT [dbo].[HDON] ([MAHD], [MAKH], [MANV], [NGAYLAPHD], [THANHTIEN]) VALUES (1014, N'KH001', N'NV001', CAST(N'2021-07-21T00:00:00.000' AS DateTime), 155)
INSERT [dbo].[HDON] ([MAHD], [MAKH], [MANV], [NGAYLAPHD], [THANHTIEN]) VALUES (1015, N'KH002', N'NV001', CAST(N'2021-07-21T00:00:00.000' AS DateTime), 145)
INSERT [dbo].[HDON] ([MAHD], [MAKH], [MANV], [NGAYLAPHD], [THANHTIEN]) VALUES (1016, N'KH002', N'NV001', CAST(N'2021-07-21T00:00:00.000' AS DateTime), 125)
INSERT [dbo].[HDON] ([MAHD], [MAKH], [MANV], [NGAYLAPHD], [THANHTIEN]) VALUES (1017, N'KH002', N'NV001', CAST(N'2021-07-21T00:00:00.000' AS DateTime), 125)
INSERT [dbo].[HDON] ([MAHD], [MAKH], [MANV], [NGAYLAPHD], [THANHTIEN]) VALUES (1018, N'KH002', N'NV001', CAST(N'2021-07-21T00:00:00.000' AS DateTime), 180)
INSERT [dbo].[HDON] ([MAHD], [MAKH], [MANV], [NGAYLAPHD], [THANHTIEN]) VALUES (1019, N'KH002', N'NV001', CAST(N'2021-07-22T00:00:00.000' AS DateTime), 160)
INSERT [dbo].[HDON] ([MAHD], [MAKH], [MANV], [NGAYLAPHD], [THANHTIEN]) VALUES (1020, N'KH002', N'NV001', CAST(N'2021-07-22T00:00:00.000' AS DateTime), 160)
INSERT [dbo].[HDON] ([MAHD], [MAKH], [MANV], [NGAYLAPHD], [THANHTIEN]) VALUES (1021, N'KH002', N'NV002', CAST(N'2021-07-24T00:00:00.000' AS DateTime), 150)
INSERT [dbo].[HDON] ([MAHD], [MAKH], [MANV], [NGAYLAPHD], [THANHTIEN]) VALUES (1022, N'KH002', N'NV001', CAST(N'2021-07-24T00:00:00.000' AS DateTime), 152)
INSERT [dbo].[HDON] ([MAHD], [MAKH], [MANV], [NGAYLAPHD], [THANHTIEN]) VALUES (1023, N'KH002', N'NV001', CAST(N'2021-07-24T00:00:00.000' AS DateTime), 137)
INSERT [dbo].[HDON] ([MAHD], [MAKH], [MANV], [NGAYLAPHD], [THANHTIEN]) VALUES (1024, N'KH002', N'NV001', CAST(N'2021-07-24T00:00:00.000' AS DateTime), 160)
INSERT [dbo].[HDON] ([MAHD], [MAKH], [MANV], [NGAYLAPHD], [THANHTIEN]) VALUES (1025, N'KH002', N'NV002', CAST(N'2021-07-24T00:00:00.000' AS DateTime), 125)
INSERT [dbo].[HDON] ([MAHD], [MAKH], [MANV], [NGAYLAPHD], [THANHTIEN]) VALUES (1026, N'KH002', N'NV004', CAST(N'2021-07-24T00:00:00.000' AS DateTime), 172)
INSERT [dbo].[HDON] ([MAHD], [MAKH], [MANV], [NGAYLAPHD], [THANHTIEN]) VALUES (1027, N'KH002', N'NV002', CAST(N'2021-07-25T00:00:00.000' AS DateTime), 125)
INSERT [dbo].[HDON] ([MAHD], [MAKH], [MANV], [NGAYLAPHD], [THANHTIEN]) VALUES (1028, N'KH002', N'NV005', CAST(N'2021-07-25T00:00:00.000' AS DateTime), 160)
INSERT [dbo].[HDON] ([MAHD], [MAKH], [MANV], [NGAYLAPHD], [THANHTIEN]) VALUES (1029, N'KH002', N'NV001', CAST(N'2021-07-25T00:00:00.000' AS DateTime), 125)
INSERT [dbo].[HDON] ([MAHD], [MAKH], [MANV], [NGAYLAPHD], [THANHTIEN]) VALUES (1030, N'KH002', N'NV001', CAST(N'2021-07-25T00:00:00.000' AS DateTime), 180)
INSERT [dbo].[HDON] ([MAHD], [MAKH], [MANV], [NGAYLAPHD], [THANHTIEN]) VALUES (1031, N'KH002', N'NV001', CAST(N'2021-07-25T00:00:00.000' AS DateTime), 125)
INSERT [dbo].[HDON] ([MAHD], [MAKH], [MANV], [NGAYLAPHD], [THANHTIEN]) VALUES (1032, N'KH002', N'NV001', CAST(N'2021-07-25T00:00:00.000' AS DateTime), 125)
INSERT [dbo].[HDON] ([MAHD], [MAKH], [MANV], [NGAYLAPHD], [THANHTIEN]) VALUES (1033, N'KH002', N'NV001', CAST(N'2021-07-25T00:00:00.000' AS DateTime), 125)
INSERT [dbo].[HDON] ([MAHD], [MAKH], [MANV], [NGAYLAPHD], [THANHTIEN]) VALUES (1034, N'KH003', N'NV001', CAST(N'2021-07-25T00:00:00.000' AS DateTime), 115)
INSERT [dbo].[HDON] ([MAHD], [MAKH], [MANV], [NGAYLAPHD], [THANHTIEN]) VALUES (1035, N'KH002', N'NV001', CAST(N'2021-07-25T00:00:00.000' AS DateTime), 125)
INSERT [dbo].[HDON] ([MAHD], [MAKH], [MANV], [NGAYLAPHD], [THANHTIEN]) VALUES (1036, N'KH002', N'NV005', CAST(N'2021-07-25T00:00:00.000' AS DateTime), 125)
INSERT [dbo].[HDON] ([MAHD], [MAKH], [MANV], [NGAYLAPHD], [THANHTIEN]) VALUES (1037, N'KH002', N'NV001', CAST(N'2021-07-26T00:00:00.000' AS DateTime), 125)
INSERT [dbo].[HDON] ([MAHD], [MAKH], [MANV], [NGAYLAPHD], [THANHTIEN]) VALUES (1038, N'KH002', N'NV001', CAST(N'2021-07-29T00:00:00.000' AS DateTime), 229)
INSERT [dbo].[HDON] ([MAHD], [MAKH], [MANV], [NGAYLAPHD], [THANHTIEN]) VALUES (1041, N'KH0011', N'NV001', CAST(N'2021-07-30T00:00:00.000' AS DateTime), 125)
INSERT [dbo].[HDON] ([MAHD], [MAKH], [MANV], [NGAYLAPHD], [THANHTIEN]) VALUES (1042, N'KH0011', N'NV006', CAST(N'2021-07-31T00:00:00.000' AS DateTime), 152)
INSERT [dbo].[HDON] ([MAHD], [MAKH], [MANV], [NGAYLAPHD], [THANHTIEN]) VALUES (1043, N'KH0011', N'NV001', CAST(N'2021-07-31T00:00:00.000' AS DateTime), 177)
INSERT [dbo].[HDON] ([MAHD], [MAKH], [MANV], [NGAYLAPHD], [THANHTIEN]) VALUES (1044, N'KH0011', N'NV007', CAST(N'2021-07-31T00:00:00.000' AS DateTime), 150)
INSERT [dbo].[HDON] ([MAHD], [MAKH], [MANV], [NGAYLAPHD], [THANHTIEN]) VALUES (1046, N'KH0011', N'NV010', CAST(N'2021-08-01T00:00:00.000' AS DateTime), 236)
INSERT [dbo].[HDON] ([MAHD], [MAKH], [MANV], [NGAYLAPHD], [THANHTIEN]) VALUES (1047, N'KH0011', N'NV004', CAST(N'2021-08-02T00:00:00.000' AS DateTime), 172)
INSERT [dbo].[HDON] ([MAHD], [MAKH], [MANV], [NGAYLAPHD], [THANHTIEN]) VALUES (1048, N'KH0011', N'NV001', CAST(N'2021-08-02T00:00:00.000' AS DateTime), 247)
INSERT [dbo].[HDON] ([MAHD], [MAKH], [MANV], [NGAYLAPHD], [THANHTIEN]) VALUES (1049, N'KH008', N'NV001', CAST(N'2021-08-02T00:00:00.000' AS DateTime), 115)
INSERT [dbo].[HDON] ([MAHD], [MAKH], [MANV], [NGAYLAPHD], [THANHTIEN]) VALUES (1050, N'KH002', N'NV001', CAST(N'2021-08-02T00:00:00.000' AS DateTime), 125)
INSERT [dbo].[HDON] ([MAHD], [MAKH], [MANV], [NGAYLAPHD], [THANHTIEN]) VALUES (1051, N'KH001', N'NV001', CAST(N'2021-08-02T00:00:00.000' AS DateTime), 120)
INSERT [dbo].[HDON] ([MAHD], [MAKH], [MANV], [NGAYLAPHD], [THANHTIEN]) VALUES (1052, N'KH0011', N'NV002', CAST(N'2021-08-02T00:00:00.000' AS DateTime), 282)
INSERT [dbo].[HDON] ([MAHD], [MAKH], [MANV], [NGAYLAPHD], [THANHTIEN]) VALUES (1053, N'KH0011', N'NV001', CAST(N'2021-08-02T00:00:00.000' AS DateTime), 300)
SET IDENTITY_INSERT [dbo].[HDON] OFF
GO
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [GioiTinh], [SoCMND], [SDT], [QuocTich]) VALUES (N'KH001', N'Duy', CAST(N'2000-03-07T00:00:00.000' AS DateTime), N'Nam', N'020586434', N'077583921', N'Việt Nam')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [GioiTinh], [SoCMND], [SDT], [QuocTich]) VALUES (N'KH0011', N'Duy', CAST(N'2021-05-09T00:00:00.000' AS DateTime), N'Nam', N'123d', N'123', N'123')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [GioiTinh], [SoCMND], [SDT], [QuocTich]) VALUES (N'KH002', N'Anh', CAST(N'2000-03-31T23:59:59.000' AS DateTime), N'Nữ', N'020684356', N'032458495', N'Việt Nam')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [GioiTinh], [SoCMND], [SDT], [QuocTich]) VALUES (N'KH003', N'Tài', CAST(N'2000-03-31T23:59:59.000' AS DateTime), N'Nam', N'050586437', N'098485764', N'Việt Nam')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [GioiTinh], [SoCMND], [SDT], [QuocTich]) VALUES (N'KH004', N'Nghĩa', CAST(N'2000-03-31T23:59:59.000' AS DateTime), N'Nữ', N'070586514', N'024857405', N'Việt Nam')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [GioiTinh], [SoCMND], [SDT], [QuocTich]) VALUES (N'KH005', N'Quang Tèo', CAST(N'2000-03-31T23:59:59.000' AS DateTime), N'Nam', N'010586434', N'064835843', N'Việt Nam')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [GioiTinh], [SoCMND], [SDT], [QuocTich]) VALUES (N'KH006', N'Bảo', CAST(N'2000-03-31T23:59:59.000' AS DateTime), N'Nam', N'020336434', N'068472123', N'Việt Nam')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [GioiTinh], [SoCMND], [SDT], [QuocTich]) VALUES (N'KH007', N'Cảnh', CAST(N'2000-03-31T23:59:59.000' AS DateTime), N'Nam', N'020586434', N'012395840', N'Việt Nam')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [GioiTinh], [SoCMND], [SDT], [QuocTich]) VALUES (N'KH008', N'Cao', CAST(N'2000-03-31T23:59:59.000' AS DateTime), N'Nữ', N'020586434', N'012395840', N'Việt Nam')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [GioiTinh], [SoCMND], [SDT], [QuocTich]) VALUES (N'KH009', N'Thắng', CAST(N'2021-05-29T23:59:59.000' AS DateTime), N'Nam', N'020586434', N'012395840', N'Việt Nam')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [GioiTinh], [SoCMND], [SDT], [QuocTich]) VALUES (N'KH010', N'Tôm', CAST(N'2021-05-29T23:59:59.000' AS DateTime), N'Nam', N'020586434', N'012395840', N'Việt Nam')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [GioiTinh], [SoCMND], [SDT], [QuocTich]) VALUES (N'KH012', N'Kim Ngan', CAST(N'2021-05-09T00:00:00.000' AS DateTime), N'Nam', N'581213247', N'0775682858', N'Việt Nam')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [GioiTinh], [SoCMND], [SDT], [QuocTich]) VALUES (N'KH013', N'Kim long', CAST(N'2021-05-09T00:00:00.000' AS DateTime), N'Nam', N'581213247', N'0775682858', N'Việt Nam')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [GioiTinh], [SoCMND], [SDT], [QuocTich]) VALUES (N'KH014', N'nam', CAST(N'2021-05-09T00:00:00.000' AS DateTime), N'Nam', N'0775621844', N'025957841', N'Hà Nội')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [GioiTinh], [SoCMND], [SDT], [QuocTich]) VALUES (N'KH015', N'Nam Nguyễn', CAST(N'2021-05-09T00:00:00.000' AS DateTime), N'Nam', N'0775621844', N'025957841', N'Hà Nội')
GO
INSERT [dbo].[LoaiPhong] ([MaLoaiPhong], [GiaPhong], [MoTa]) VALUES (N'LP001', 100, N'Bình dân')
INSERT [dbo].[LoaiPhong] ([MaLoaiPhong], [GiaPhong], [MoTa]) VALUES (N'LP002', 200, N'Trung bình')
INSERT [dbo].[LoaiPhong] ([MaLoaiPhong], [GiaPhong], [MoTa]) VALUES (N'LP003', 500, N'Hoàng gia')
GO
INSERT [dbo].[MauPhong] ([MaMauPhong], [TenMauPhong], [DonGia]) VALUES (N'MP001', N'Tây âu', 20)
INSERT [dbo].[MauPhong] ([MaMauPhong], [TenMauPhong], [DonGia]) VALUES (N'MP002', N'Châu á', 25)
INSERT [dbo].[MauPhong] ([MaMauPhong], [TenMauPhong], [DonGia]) VALUES (N'MP003', N'Trẻ trung', 15)
INSERT [dbo].[MauPhong] ([MaMauPhong], [TenMauPhong], [DonGia]) VALUES (N'MP004', N'Hiện đại', 30)
GO
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [NgaySinh], [GioiTinh], [SoCMND], [DiaChi], [SDT], [ChucVu]) VALUES (N'NV001', N'Thúy', CAST(N'2000-03-07T00:00:00.000' AS DateTime), N'Nữ', N'020586434', N'Thành Phố Hồ Chí Minh', N'077583921', N'Nhân viên 1 sao')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [NgaySinh], [GioiTinh], [SoCMND], [DiaChi], [SDT], [ChucVu]) VALUES (N'NV002', N'Tèo', CAST(N'2000-03-07T00:00:00.000' AS DateTime), N'Nam', N'020684356', N'Hà Nội', N'032458495', N'Nhân viên 2 sao')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [NgaySinh], [GioiTinh], [SoCMND], [DiaChi], [SDT], [ChucVu]) VALUES (N'NV004', N'Thịnh', CAST(N'2000-03-07T00:00:00.000' AS DateTime), N'Nam', N'070586514', N'Đà Lạt', N'024857405', N'Nhân viên 3 sao')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [NgaySinh], [GioiTinh], [SoCMND], [DiaChi], [SDT], [ChucVu]) VALUES (N'NV005', N'Vượng', CAST(N'2000-03-07T00:00:00.000' AS DateTime), N'Nam', N'010586434', N'Tây Ninh', N'064835843', N'Nhân viên 3 sao')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [NgaySinh], [GioiTinh], [SoCMND], [DiaChi], [SDT], [ChucVu]) VALUES (N'NV006', N'Tài', CAST(N'2000-03-07T00:00:00.000' AS DateTime), N'Nam', N'010586434', N'Hà Nội', N'064835843', N'Nhân viên 3 sao')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [NgaySinh], [GioiTinh], [SoCMND], [DiaChi], [SDT], [ChucVu]) VALUES (N'NV007', N'Lý', CAST(N'2000-03-07T00:00:00.000' AS DateTime), N'Nữ', N'010586434', N'Hà Nội', N'064835843', N'Nhân viên 3 sao')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [NgaySinh], [GioiTinh], [SoCMND], [DiaChi], [SDT], [ChucVu]) VALUES (N'NV008', N'Thiên', CAST(N'2000-03-07T00:00:00.000' AS DateTime), N'Nam', N'010586434', N'Hà Nội', N'064835843', N'Nhân viên 2 sao')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [NgaySinh], [GioiTinh], [SoCMND], [DiaChi], [SDT], [ChucVu]) VALUES (N'NV009', N'An', CAST(N'2004-12-31T23:59:59.000' AS DateTime), N'Nữ', N'025957846', N'Bình Thuận', N'064835843', N'Nhân viên 2 sao')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [NgaySinh], [GioiTinh], [SoCMND], [DiaChi], [SDT], [ChucVu]) VALUES (N'NV010', N'Linh', CAST(N'2004-12-31T23:59:59.000' AS DateTime), N'Nam', N'025957846', N'Ninh Bình', N'064835843', N'Nhân viên 2 sao')
GO
SET IDENTITY_INSERT [dbo].[PhieuDangKy] ON 

INSERT [dbo].[PhieuDangKy] ([MaPDK], [MaMauPhong], [MaLoaiPhong], [NgayVao], [NgayTra], [HoTen], [CMND], [SDT], [QuocTich]) VALUES (2, N'MP003', N'LP003', CAST(N'2021-01-01T00:00:00.000' AS DateTime), CAST(N'2021-01-01T00:00:00.000' AS DateTime), N'123', N'tranduy030700@gmail.com', N'123', N'123')
INSERT [dbo].[PhieuDangKy] ([MaPDK], [MaMauPhong], [MaLoaiPhong], [NgayVao], [NgayTra], [HoTen], [CMND], [SDT], [QuocTich]) VALUES (3, N'MP001', N'LP001', CAST(N'2021-01-01T00:00:00.000' AS DateTime), CAST(N'2021-01-01T00:00:00.000' AS DateTime), N'1234', N'51231', N'512312', N'41212')
INSERT [dbo].[PhieuDangKy] ([MaPDK], [MaMauPhong], [MaLoaiPhong], [NgayVao], [NgayTra], [HoTen], [CMND], [SDT], [QuocTich]) VALUES (4, N'MP001', N'LP001', CAST(N'2021-07-29T00:00:00.000' AS DateTime), CAST(N'2021-01-01T00:00:00.000' AS DateTime), N'long', N'123', N'123', N'viet nam')
INSERT [dbo].[PhieuDangKy] ([MaPDK], [MaMauPhong], [MaLoaiPhong], [NgayVao], [NgayTra], [HoTen], [CMND], [SDT], [QuocTich]) VALUES (5, N'MP001', N'LP001', CAST(N'2021-01-01T00:00:00.000' AS DateTime), CAST(N'2021-01-01T00:00:00.000' AS DateTime), N'123', N'123', N'512312', N'viet nam')
INSERT [dbo].[PhieuDangKy] ([MaPDK], [MaMauPhong], [MaLoaiPhong], [NgayVao], [NgayTra], [HoTen], [CMND], [SDT], [QuocTich]) VALUES (6, N'MP001', N'LP001', CAST(N'2021-01-01T00:00:00.000' AS DateTime), CAST(N'2021-01-01T00:00:00.000' AS DateTime), N'1234', N'123', N'123', N'viet nam')
INSERT [dbo].[PhieuDangKy] ([MaPDK], [MaMauPhong], [MaLoaiPhong], [NgayVao], [NgayTra], [HoTen], [CMND], [SDT], [QuocTich]) VALUES (7, N'MP003', N'LP003', CAST(N'2021-01-01T00:00:00.000' AS DateTime), CAST(N'2021-01-01T00:00:00.000' AS DateTime), N'nam', N'025957841', N'0775621844', N'Hà Nội')
INSERT [dbo].[PhieuDangKy] ([MaPDK], [MaMauPhong], [MaLoaiPhong], [NgayVao], [NgayTra], [HoTen], [CMND], [SDT], [QuocTich]) VALUES (8, N'MP001', N'LP001', CAST(N'2021-01-01T00:00:00.000' AS DateTime), CAST(N'2021-01-01T00:00:00.000' AS DateTime), N'123', N'123', N'123', N'viet nam')
SET IDENTITY_INSERT [dbo].[PhieuDangKy] OFF
GO
INSERT [dbo].[PhieuDichVu] ([MaKH], [MaDV], [SoLuong]) VALUES (N'KH001', N'DV007', NULL)
INSERT [dbo].[PhieuDichVu] ([MaKH], [MaDV], [SoLuong]) VALUES (N'KH001', N'DV008', NULL)
INSERT [dbo].[PhieuDichVu] ([MaKH], [MaDV], [SoLuong]) VALUES (N'KH002', N'DV007', NULL)
INSERT [dbo].[PhieuDichVu] ([MaKH], [MaDV], [SoLuong]) VALUES (N'KH002', N'DV008', NULL)
INSERT [dbo].[PhieuDichVu] ([MaKH], [MaDV], [SoLuong]) VALUES (N'KH008', N'DV002', NULL)
INSERT [dbo].[PhieuDichVu] ([MaKH], [MaDV], [SoLuong]) VALUES (N'KH008', N'DV007', NULL)
INSERT [dbo].[PhieuDichVu] ([MaKH], [MaDV], [SoLuong]) VALUES (N'KH008', N'DV008', NULL)
GO
INSERT [dbo].[PHIEUTHUEPHONG] ([MAPHONG], [MAKH], [NGAYDAT], [NGAYKETTHUC], [TONGTIEN], [MANV]) VALUES (N'P001', N'KH001', CAST(N'2021-05-09T00:00:00.000' AS DateTime), CAST(N'2021-05-09T00:00:00.000' AS DateTime), 1000000, NULL)
INSERT [dbo].[PHIEUTHUEPHONG] ([MAPHONG], [MAKH], [NGAYDAT], [NGAYKETTHUC], [TONGTIEN], [MANV]) VALUES (N'P002', N'KH002', CAST(N'2021-05-09T00:00:00.000' AS DateTime), CAST(N'2021-05-09T00:00:00.000' AS DateTime), 1000000, NULL)
INSERT [dbo].[PHIEUTHUEPHONG] ([MAPHONG], [MAKH], [NGAYDAT], [NGAYKETTHUC], [TONGTIEN], [MANV]) VALUES (N'P003', N'KH008', CAST(N'2021-05-09T00:00:00.000' AS DateTime), CAST(N'2021-05-09T00:00:00.000' AS DateTime), 1000000, NULL)
GO
INSERT [dbo].[Phong] ([MaPhong], [MaLoaiPhong], [MaMauPhong], [TinhTrang], [TenPhong], [HinhAnh]) VALUES (N'P001', N'LP001', N'MP001', 1, N'P01TABD', N'ba.jpg')
INSERT [dbo].[Phong] ([MaPhong], [MaLoaiPhong], [MaMauPhong], [TinhTrang], [TenPhong], [HinhAnh]) VALUES (N'P002', N'LP001', N'MP002', 1, N'P02CABD', N'bay.jpg')
INSERT [dbo].[Phong] ([MaPhong], [MaLoaiPhong], [MaMauPhong], [TinhTrang], [TenPhong], [HinhAnh]) VALUES (N'P003', N'LP001', N'MP003', 1, N'P03TTBD', N'bd.jpg')
INSERT [dbo].[Phong] ([MaPhong], [MaLoaiPhong], [MaMauPhong], [TinhTrang], [TenPhong], [HinhAnh]) VALUES (N'P004', N'LP002', N'MP004', 0, N'P04HDTB', N'bdd.jpg')
INSERT [dbo].[Phong] ([MaPhong], [MaLoaiPhong], [MaMauPhong], [TinhTrang], [TenPhong], [HinhAnh]) VALUES (N'P005', N'LP002', N'MP003', 0, N'P05TTTB', N'bddd.jpg')
INSERT [dbo].[Phong] ([MaPhong], [MaLoaiPhong], [MaMauPhong], [TinhTrang], [TenPhong], [HinhAnh]) VALUES (N'P007', N'LP003', N'MP003', 0, N'P07TTHG', N'nui.jpg')
INSERT [dbo].[Phong] ([MaPhong], [MaLoaiPhong], [MaMauPhong], [TinhTrang], [TenPhong], [HinhAnh]) VALUES (N'P008', N'LP003', N'MP004', 0, N'P08HDHG', N'bien.jpg')
INSERT [dbo].[Phong] ([MaPhong], [MaLoaiPhong], [MaMauPhong], [TinhTrang], [TenPhong], [HinhAnh]) VALUES (N'P010', N'LP002', N'MP004', 0, N'P10HDTB', N'pcCA.jpg')
INSERT [dbo].[Phong] ([MaPhong], [MaLoaiPhong], [MaMauPhong], [TinhTrang], [TenPhong], [HinhAnh]) VALUES (N'P011', N'LP002', N'MP001', 0, N'P11', N'tam.jpg')
INSERT [dbo].[Phong] ([MaPhong], [MaLoaiPhong], [MaMauPhong], [TinhTrang], [TenPhong], [HinhAnh]) VALUES (N'P012', N'LP002', N'MP001', 0, N'P12', N'phongdon.jpg')
INSERT [dbo].[Phong] ([MaPhong], [MaLoaiPhong], [MaMauPhong], [TinhTrang], [TenPhong], [HinhAnh]) VALUES (N'P013', N'LP002', N'MP001', 0, N'P12', N'pcHD.jpg')
INSERT [dbo].[Phong] ([MaPhong], [MaLoaiPhong], [MaMauPhong], [TinhTrang], [TenPhong], [HinhAnh]) VALUES (N'P014', N'LP002', N'MP001', 0, N'P14', N'vippp.png')
INSERT [dbo].[Phong] ([MaPhong], [MaLoaiPhong], [MaMauPhong], [TinhTrang], [TenPhong], [HinhAnh]) VALUES (N'P015', N'LP002', N'MP001', 0, N'P15', N'mot.jpg')
INSERT [dbo].[Phong] ([MaPhong], [MaLoaiPhong], [MaMauPhong], [TinhTrang], [TenPhong], [HinhAnh]) VALUES (N'P016', N'LP002', N'MP001', 0, N'P16', N'bon.jpg')
INSERT [dbo].[Phong] ([MaPhong], [MaLoaiPhong], [MaMauPhong], [TinhTrang], [TenPhong], [HinhAnh]) VALUES (N'P017', N'LP002', N'MP001', 0, N'P17', N'pcTT.jpg')
GO
SET IDENTITY_INSERT [dbo].[TAIKHOANNV] ON 

INSERT [dbo].[TAIKHOANNV] ([ID], [MANV], [TENTAIKHOAN], [MATKHAU], [TinhTrang], [PhanQuyen]) VALUES (1, N'NV001', N'nv1', N'1', N'0', N'0')
INSERT [dbo].[TAIKHOANNV] ([ID], [MANV], [TENTAIKHOAN], [MATKHAU], [TinhTrang], [PhanQuyen]) VALUES (8, N'NV002', N'nv2', N'123', N'0', N'0')
INSERT [dbo].[TAIKHOANNV] ([ID], [MANV], [TENTAIKHOAN], [MATKHAU], [TinhTrang], [PhanQuyen]) VALUES (16, NULL, N'ad', N'1', N'0', N'1')
INSERT [dbo].[TAIKHOANNV] ([ID], [MANV], [TENTAIKHOAN], [MATKHAU], [TinhTrang], [PhanQuyen]) VALUES (23, N'NV004', N'nv4', N'123', N'0', N'0')
INSERT [dbo].[TAIKHOANNV] ([ID], [MANV], [TENTAIKHOAN], [MATKHAU], [TinhTrang], [PhanQuyen]) VALUES (24, N'NV005', N'nv5', N'1', N'0', N'0')
INSERT [dbo].[TAIKHOANNV] ([ID], [MANV], [TENTAIKHOAN], [MATKHAU], [TinhTrang], [PhanQuyen]) VALUES (26, N'NV006', N'nv6', N'123', N'0', N'0')
SET IDENTITY_INSERT [dbo].[TAIKHOANNV] OFF
GO
ALTER TABLE [dbo].[CHITIETHOADON]  WITH CHECK ADD  CONSTRAINT [PK_CHITIETHOADON_HOADON] FOREIGN KEY([MAHD])
REFERENCES [dbo].[HDON] ([MAHD])
GO
ALTER TABLE [dbo].[CHITIETHOADON] CHECK CONSTRAINT [PK_CHITIETHOADON_HOADON]
GO
ALTER TABLE [dbo].[CHITIETHOADON]  WITH CHECK ADD  CONSTRAINT [PK_CHITIETHOADON_PHONG] FOREIGN KEY([MAPHONG])
REFERENCES [dbo].[Phong] ([MaPhong])
GO
ALTER TABLE [dbo].[CHITIETHOADON] CHECK CONSTRAINT [PK_CHITIETHOADON_PHONG]
GO
ALTER TABLE [dbo].[HDON]  WITH CHECK ADD  CONSTRAINT [PK_HDON_KHACHHANG] FOREIGN KEY([MAKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[HDON] CHECK CONSTRAINT [PK_HDON_KHACHHANG]
GO
ALTER TABLE [dbo].[HDON]  WITH CHECK ADD  CONSTRAINT [PK_HDON_NHANVIEN] FOREIGN KEY([MANV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[HDON] CHECK CONSTRAINT [PK_HDON_NHANVIEN]
GO
ALTER TABLE [dbo].[PhieuDangKy]  WITH CHECK ADD  CONSTRAINT [FK_PhieuDangKy_LoaiPH] FOREIGN KEY([MaLoaiPhong])
REFERENCES [dbo].[LoaiPhong] ([MaLoaiPhong])
GO
ALTER TABLE [dbo].[PhieuDangKy] CHECK CONSTRAINT [FK_PhieuDangKy_LoaiPH]
GO
ALTER TABLE [dbo].[PhieuDangKy]  WITH CHECK ADD  CONSTRAINT [FK_PhieuDangKy_MauPH] FOREIGN KEY([MaMauPhong])
REFERENCES [dbo].[MauPhong] ([MaMauPhong])
GO
ALTER TABLE [dbo].[PhieuDangKy] CHECK CONSTRAINT [FK_PhieuDangKy_MauPH]
GO
ALTER TABLE [dbo].[PhieuDichVu]  WITH CHECK ADD  CONSTRAINT [fk_MaDV_PhieuDichVu] FOREIGN KEY([MaDV])
REFERENCES [dbo].[DichVu] ([MaDV])
GO
ALTER TABLE [dbo].[PhieuDichVu] CHECK CONSTRAINT [fk_MaDV_PhieuDichVu]
GO
ALTER TABLE [dbo].[PhieuDichVu]  WITH CHECK ADD  CONSTRAINT [fk_MaKH_PhieuDichVu] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[PhieuDichVu] CHECK CONSTRAINT [fk_MaKH_PhieuDichVu]
GO
ALTER TABLE [dbo].[PHIEUTHUEPHONG]  WITH CHECK ADD  CONSTRAINT [FKPHIEUTHUEPHONGKHACHHANG] FOREIGN KEY([MAKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[PHIEUTHUEPHONG] CHECK CONSTRAINT [FKPHIEUTHUEPHONGKHACHHANG]
GO
ALTER TABLE [dbo].[PHIEUTHUEPHONG]  WITH CHECK ADD  CONSTRAINT [FKPHIEUTHUEPHONGPHONG] FOREIGN KEY([MAPHONG])
REFERENCES [dbo].[Phong] ([MaPhong])
GO
ALTER TABLE [dbo].[PHIEUTHUEPHONG] CHECK CONSTRAINT [FKPHIEUTHUEPHONGPHONG]
GO
ALTER TABLE [dbo].[PHIEUTHUEPHONG]  WITH CHECK ADD  CONSTRAINT [PK_PHIEUTHUEPHONG_MANV] FOREIGN KEY([MANV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[PHIEUTHUEPHONG] CHECK CONSTRAINT [PK_PHIEUTHUEPHONG_MANV]
GO
ALTER TABLE [dbo].[Phong]  WITH CHECK ADD  CONSTRAINT [fk_MaLoaiPhong_Phong] FOREIGN KEY([MaLoaiPhong])
REFERENCES [dbo].[LoaiPhong] ([MaLoaiPhong])
GO
ALTER TABLE [dbo].[Phong] CHECK CONSTRAINT [fk_MaLoaiPhong_Phong]
GO
ALTER TABLE [dbo].[Phong]  WITH CHECK ADD  CONSTRAINT [fk_MaMauPhong_Phong] FOREIGN KEY([MaMauPhong])
REFERENCES [dbo].[MauPhong] ([MaMauPhong])
GO
ALTER TABLE [dbo].[Phong] CHECK CONSTRAINT [fk_MaMauPhong_Phong]
GO
ALTER TABLE [dbo].[TAIKHOANNV]  WITH CHECK ADD  CONSTRAINT [PK_TAIKHOAN_NHANVIEN] FOREIGN KEY([MANV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[TAIKHOANNV] CHECK CONSTRAINT [PK_TAIKHOAN_NHANVIEN]
GO
