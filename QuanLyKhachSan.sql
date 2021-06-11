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
ALTER TABLE [dbo].[PhieuDangKy] DROP CONSTRAINT [fk_MaPhong_PhieuDangKy]
GO
ALTER TABLE [dbo].[PhieuDangKy] DROP CONSTRAINT [fk_MaKH_PhieuDangKy]
GO
ALTER TABLE [dbo].[HDON] DROP CONSTRAINT [PK_HDON_NHANVIEN]
GO
ALTER TABLE [dbo].[HDON] DROP CONSTRAINT [PK_HDON_KHACHHANG]
GO
/****** Object:  Table [dbo].[TAIKHOANNV]    Script Date: 6/11/2021 2:26:47 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TAIKHOANNV]') AND type in (N'U'))
DROP TABLE [dbo].[TAIKHOANNV]
GO
/****** Object:  Table [dbo].[Phong]    Script Date: 6/11/2021 2:26:47 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Phong]') AND type in (N'U'))
DROP TABLE [dbo].[Phong]
GO
/****** Object:  Table [dbo].[PHIEUTHUEPHONG]    Script Date: 6/11/2021 2:26:47 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PHIEUTHUEPHONG]') AND type in (N'U'))
DROP TABLE [dbo].[PHIEUTHUEPHONG]
GO
/****** Object:  Table [dbo].[PhieuDichVu]    Script Date: 6/11/2021 2:26:47 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PhieuDichVu]') AND type in (N'U'))
DROP TABLE [dbo].[PhieuDichVu]
GO
/****** Object:  Table [dbo].[PhieuDangKy]    Script Date: 6/11/2021 2:26:47 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PhieuDangKy]') AND type in (N'U'))
DROP TABLE [dbo].[PhieuDangKy]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 6/11/2021 2:26:47 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NhanVien]') AND type in (N'U'))
DROP TABLE [dbo].[NhanVien]
GO
/****** Object:  Table [dbo].[MauPhong]    Script Date: 6/11/2021 2:26:47 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MauPhong]') AND type in (N'U'))
DROP TABLE [dbo].[MauPhong]
GO
/****** Object:  Table [dbo].[Luat]    Script Date: 6/11/2021 2:26:47 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Luat]') AND type in (N'U'))
DROP TABLE [dbo].[Luat]
GO
/****** Object:  Table [dbo].[LoaiPhong]    Script Date: 6/11/2021 2:26:47 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LoaiPhong]') AND type in (N'U'))
DROP TABLE [dbo].[LoaiPhong]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 6/11/2021 2:26:47 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KhachHang]') AND type in (N'U'))
DROP TABLE [dbo].[KhachHang]
GO
/****** Object:  Table [dbo].[HDON]    Script Date: 6/11/2021 2:26:47 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HDON]') AND type in (N'U'))
DROP TABLE [dbo].[HDON]
GO
/****** Object:  Table [dbo].[DuLieu]    Script Date: 6/11/2021 2:26:47 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DuLieu]') AND type in (N'U'))
DROP TABLE [dbo].[DuLieu]
GO
/****** Object:  Table [dbo].[DichVu]    Script Date: 6/11/2021 2:26:47 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DichVu]') AND type in (N'U'))
DROP TABLE [dbo].[DichVu]
GO
/****** Object:  Table [dbo].[DichVu]    Script Date: 6/11/2021 2:26:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DichVu](
	[MaDV] [nvarchar](30) NOT NULL,
	[TenDV] [nvarchar](30) NULL,
	[GiaDV] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DuLieu]    Script Date: 6/11/2021 2:26:47 PM ******/
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
/****** Object:  Table [dbo].[HDON]    Script Date: 6/11/2021 2:26:47 PM ******/
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
/****** Object:  Table [dbo].[KhachHang]    Script Date: 6/11/2021 2:26:47 PM ******/
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
/****** Object:  Table [dbo].[LoaiPhong]    Script Date: 6/11/2021 2:26:47 PM ******/
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
/****** Object:  Table [dbo].[Luat]    Script Date: 6/11/2021 2:26:47 PM ******/
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
/****** Object:  Table [dbo].[MauPhong]    Script Date: 6/11/2021 2:26:47 PM ******/
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
/****** Object:  Table [dbo].[NhanVien]    Script Date: 6/11/2021 2:26:47 PM ******/
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
/****** Object:  Table [dbo].[PhieuDangKy]    Script Date: 6/11/2021 2:26:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuDangKy](
	[MaPDK] [nvarchar](30) NOT NULL,
	[MaKH] [nvarchar](30) NULL,
	[MaPhong] [nvarchar](30) NULL,
	[NgayDK] [datetime] NULL,
	[NgayDen] [datetime] NULL,
	[NgayDi] [datetime] NULL,
	[TienCoc] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPDK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuDichVu]    Script Date: 6/11/2021 2:26:48 PM ******/
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
/****** Object:  Table [dbo].[PHIEUTHUEPHONG]    Script Date: 6/11/2021 2:26:48 PM ******/
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
/****** Object:  Table [dbo].[Phong]    Script Date: 6/11/2021 2:26:48 PM ******/
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
PRIMARY KEY CLUSTERED 
(
	[MaPhong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TAIKHOANNV]    Script Date: 6/11/2021 2:26:48 PM ******/
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
 CONSTRAINT [PK_TAIKHOAN] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [GiaDV]) VALUES (N'DV001', N'Xe đạp', 10)
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [GiaDV]) VALUES (N'DV002', N'Massage', 15)
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [GiaDV]) VALUES (N'DV003', N'Tắm trắng', 20)
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [GiaDV]) VALUES (N'DV004', N'Buffet', 35)
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [GiaDV]) VALUES (N'DV005', N'Hồ bơi', 12)
GO
SET IDENTITY_INSERT [dbo].[DuLieu] ON 

INSERT [dbo].[DuLieu] ([Stt], [DoTuoi], [GioiTinh], [ThuNhap], [SuDungDichVu], [MauPhong], [LoaiPhong], [XacNhan]) VALUES (1, N'Trên 18', N'Trai', N'Cao', N'Có', N'Tây âu', N'Bình dân', N'Nên')
INSERT [dbo].[DuLieu] ([Stt], [DoTuoi], [GioiTinh], [ThuNhap], [SuDungDichVu], [MauPhong], [LoaiPhong], [XacNhan]) VALUES (2, N'Trên 35', N'Trai', N'Thấp', N'Không', N'Châu á', N'Bình dân', N'Nên')
INSERT [dbo].[DuLieu] ([Stt], [DoTuoi], [GioiTinh], [ThuNhap], [SuDungDichVu], [MauPhong], [LoaiPhong], [XacNhan]) VALUES (3, N'Trên 35', N'Gái', N'Cao', N'Có', N'Trẻ trung', N'Trung bình', N'Nên')
INSERT [dbo].[DuLieu] ([Stt], [DoTuoi], [GioiTinh], [ThuNhap], [SuDungDichVu], [MauPhong], [LoaiPhong], [XacNhan]) VALUES (4, N'Trên 18', N'Trai', N'Cao', N'Không', N'Châu á', N'Hoàng gia', N'Không Nên')
INSERT [dbo].[DuLieu] ([Stt], [DoTuoi], [GioiTinh], [ThuNhap], [SuDungDichVu], [MauPhong], [LoaiPhong], [XacNhan]) VALUES (5, N'Từ 18 đến 35', N'Trai', N'Không', N'Có', N'Trẻ trung', N'Trung bình', N'Nên')
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

INSERT [dbo].[HDON] ([MAHD], [MAKH], [MANV], [NGAYLAPHD], [THANHTIEN]) VALUES (1004, N'KH002', N'NV001', CAST(N'2021-06-07T14:28:53.420' AS DateTime), 125)
SET IDENTITY_INSERT [dbo].[HDON] OFF
GO
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [GioiTinh], [SoCMND], [SDT], [QuocTich]) VALUES (N'KH001', N'Duy', CAST(N'2000-03-07T00:00:00.000' AS DateTime), N'Nam', N'020586434', N'077583921', N'Việt Nam')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [GioiTinh], [SoCMND], [SDT], [QuocTich]) VALUES (N'KH002', N'Anh', CAST(N'2000-03-31T23:59:59.000' AS DateTime), N'Nữ', N'020684356', N'032458495', N'Việt Nam')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [GioiTinh], [SoCMND], [SDT], [QuocTich]) VALUES (N'KH003', N'Tài', CAST(N'2000-03-31T23:59:59.000' AS DateTime), N'Nam', N'050586437', N'098485764', N'Việt Nam')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [GioiTinh], [SoCMND], [SDT], [QuocTich]) VALUES (N'KH004', N'Nghĩa', CAST(N'2000-03-31T23:59:59.000' AS DateTime), N'Nữ', N'070586514', N'024857405', N'Việt Nam')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [GioiTinh], [SoCMND], [SDT], [QuocTich]) VALUES (N'KH005', N'Quang', CAST(N'2000-03-31T23:59:59.000' AS DateTime), N'Nam', N'010586434', N'064835843', N'Việt Nam')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [GioiTinh], [SoCMND], [SDT], [QuocTich]) VALUES (N'KH006', N'Bảo', CAST(N'2000-03-31T23:59:59.000' AS DateTime), N'Nam', N'020336434', N'068472123', N'Việt Nam')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [GioiTinh], [SoCMND], [SDT], [QuocTich]) VALUES (N'KH007', N'Cảnh', CAST(N'2000-03-31T23:59:59.000' AS DateTime), N'Nam', N'020586434', N'012395840', N'Việt Nam')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [GioiTinh], [SoCMND], [SDT], [QuocTich]) VALUES (N'KH008', N'Cao', CAST(N'2000-03-31T23:59:59.000' AS DateTime), N'Nữ', N'020586434', N'012395840', N'Việt Nam')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [GioiTinh], [SoCMND], [SDT], [QuocTich]) VALUES (N'KH009', N'Thắng', CAST(N'2021-05-29T23:59:59.000' AS DateTime), N'Nam', N'020586434', N'012395840', N'Việt Nam')
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
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [NgaySinh], [GioiTinh], [SoCMND], [DiaChi], [SDT], [ChucVu]) VALUES (N'NV003', N'Quang', CAST(N'2000-03-07T00:00:00.000' AS DateTime), N'Nữ', N'050586437', N'Đà Nẵng', N'098485764', N'Nhân viên 1 sao')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [NgaySinh], [GioiTinh], [SoCMND], [DiaChi], [SDT], [ChucVu]) VALUES (N'NV004', N'Thịnh', CAST(N'2000-03-07T00:00:00.000' AS DateTime), N'Nam', N'070586514', N'Đà Lạt', N'024857405', N'Nhân viên 3 sao')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [NgaySinh], [GioiTinh], [SoCMND], [DiaChi], [SDT], [ChucVu]) VALUES (N'NV005', N'Vượng', CAST(N'2000-03-07T00:00:00.000' AS DateTime), N'Nam', N'010586434', N'Tây Ninh', N'064835843', N'Nhân viên 3 sao')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [NgaySinh], [GioiTinh], [SoCMND], [DiaChi], [SDT], [ChucVu]) VALUES (N'NV006', N'Tài', CAST(N'2000-03-07T00:00:00.000' AS DateTime), N'Nam', N'010586434', N'Hà Nội', N'064835843', N'Nhân viên 3 sao')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [NgaySinh], [GioiTinh], [SoCMND], [DiaChi], [SDT], [ChucVu]) VALUES (N'NV007', N'Lý', CAST(N'2000-03-07T00:00:00.000' AS DateTime), N'Nữ', N'010586434', N'Hà Nội', N'064835843', N'Nhân viên 3 sao')
GO
INSERT [dbo].[PHIEUTHUEPHONG] ([MAPHONG], [MAKH], [NGAYDAT], [NGAYKETTHUC], [TONGTIEN], [MANV]) VALUES (N'P001', N'KH001', CAST(N'2021-05-09T00:00:00.000' AS DateTime), CAST(N'2021-05-09T00:00:00.000' AS DateTime), 1000000, NULL)
GO
INSERT [dbo].[Phong] ([MaPhong], [MaLoaiPhong], [MaMauPhong], [TinhTrang], [TenPhong]) VALUES (N'P001', N'LP001', N'MP001', 1, N'P01TABD')
INSERT [dbo].[Phong] ([MaPhong], [MaLoaiPhong], [MaMauPhong], [TinhTrang], [TenPhong]) VALUES (N'P002', N'LP001', N'MP002', 0, N'P02CABD')
INSERT [dbo].[Phong] ([MaPhong], [MaLoaiPhong], [MaMauPhong], [TinhTrang], [TenPhong]) VALUES (N'P003', N'LP001', N'MP003', 0, N'P03TTBD')
INSERT [dbo].[Phong] ([MaPhong], [MaLoaiPhong], [MaMauPhong], [TinhTrang], [TenPhong]) VALUES (N'P004', N'LP002', N'MP004', 0, N'P04HDTB')
INSERT [dbo].[Phong] ([MaPhong], [MaLoaiPhong], [MaMauPhong], [TinhTrang], [TenPhong]) VALUES (N'P005', N'LP002', N'MP003', 0, N'P05TTTB')
INSERT [dbo].[Phong] ([MaPhong], [MaLoaiPhong], [MaMauPhong], [TinhTrang], [TenPhong]) VALUES (N'P007', N'LP003', N'MP003', 0, N'P07TTHG')
INSERT [dbo].[Phong] ([MaPhong], [MaLoaiPhong], [MaMauPhong], [TinhTrang], [TenPhong]) VALUES (N'P008', N'LP003', N'MP004', 0, N'P08HDHG')
INSERT [dbo].[Phong] ([MaPhong], [MaLoaiPhong], [MaMauPhong], [TinhTrang], [TenPhong]) VALUES (N'P009', N'LP003', N'MP002', 0, N'P09CAHG')
INSERT [dbo].[Phong] ([MaPhong], [MaLoaiPhong], [MaMauPhong], [TinhTrang], [TenPhong]) VALUES (N'P010', N'LP002', N'MP004', 0, N'P10HDTB')
INSERT [dbo].[Phong] ([MaPhong], [MaLoaiPhong], [MaMauPhong], [TinhTrang], [TenPhong]) VALUES (N'P011', N'LP002', N'MP001', 0, N'P11HDTB')
GO
SET IDENTITY_INSERT [dbo].[TAIKHOANNV] ON 

INSERT [dbo].[TAIKHOANNV] ([ID], [MANV], [TENTAIKHOAN], [MATKHAU], [TinhTrang]) VALUES (1, N'NV001', N'nv1', N'1', N'1')
INSERT [dbo].[TAIKHOANNV] ([ID], [MANV], [TENTAIKHOAN], [MATKHAU], [TinhTrang]) VALUES (5, N'NV002', N'nv2', N'1', N'0')
SET IDENTITY_INSERT [dbo].[TAIKHOANNV] OFF
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
ALTER TABLE [dbo].[PhieuDangKy]  WITH CHECK ADD  CONSTRAINT [fk_MaKH_PhieuDangKy] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[PhieuDangKy] CHECK CONSTRAINT [fk_MaKH_PhieuDangKy]
GO
ALTER TABLE [dbo].[PhieuDangKy]  WITH CHECK ADD  CONSTRAINT [fk_MaPhong_PhieuDangKy] FOREIGN KEY([MaPhong])
REFERENCES [dbo].[Phong] ([MaPhong])
GO
ALTER TABLE [dbo].[PhieuDangKy] CHECK CONSTRAINT [fk_MaPhong_PhieuDangKy]
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
