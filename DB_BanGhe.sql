USE [master]
GO
/****** Object:  Database [DB_BANGHE]    Script Date: 27/11/2019 11:55:05 SA ******/
CREATE DATABASE [DB_BANGHE]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_BANGHE', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\DB_BANGHE.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DB_BANGHE_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\DB_BANGHE_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DB_BANGHE] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_BANGHE].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_BANGHE] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_BANGHE] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_BANGHE] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_BANGHE] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_BANGHE] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_BANGHE] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB_BANGHE] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [DB_BANGHE] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_BANGHE] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_BANGHE] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_BANGHE] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_BANGHE] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_BANGHE] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_BANGHE] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_BANGHE] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_BANGHE] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DB_BANGHE] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_BANGHE] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_BANGHE] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_BANGHE] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_BANGHE] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_BANGHE] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_BANGHE] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_BANGHE] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DB_BANGHE] SET  MULTI_USER 
GO
ALTER DATABASE [DB_BANGHE] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_BANGHE] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_BANGHE] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_BANGHE] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [DB_BANGHE]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 27/11/2019 11:55:05 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[Admin] [nvarchar](50) NULL,
	[pass] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChiTietHD]    Script Date: 27/11/2019 11:55:05 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHD](
	[idChiTiet] [nchar](30) NOT NULL,
	[idHoaDon] [nchar](30) NOT NULL,
	[idSanPham] [nchar](10) NOT NULL,
	[Soluong] [int] NULL,
	[ThanhTien] [money] NULL,
 CONSTRAINT [PK_ChiTietHD] PRIMARY KEY CLUSTERED 
(
	[idChiTiet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 27/11/2019 11:55:05 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[idHoaDon] [nchar](30) NOT NULL,
	[idTaiKhoan] [nchar](10) NULL,
	[TongTien] [money] NULL,
	[NgayLap] [date] NULL,
	[NgayGiao] [date] NULL,
	[DiaChiGiao] [nvarchar](50) NULL,
	[DaThanhToan] [nvarchar](50) NULL,
	[TinhTrang] [nvarchar](50) NULL,
	[ThanhTien] [money] NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[idHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Loai]    Script Date: 27/11/2019 11:55:05 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Loai](
	[idLoai] [nchar](10) NOT NULL,
	[TenLoai] [nvarchar](50) NULL,
	[idNhom] [nchar](10) NULL,
 CONSTRAINT [PK_Loai] PRIMARY KEY CLUSTERED 
(
	[idLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhomSP]    Script Date: 27/11/2019 11:55:05 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhomSP](
	[idNhom] [nchar](10) NOT NULL,
	[tenNhom] [nvarchar](50) NULL,
	[Hinh] [nchar](10) NULL,
 CONSTRAINT [PK_NhomSP] PRIMARY KEY CLUSTERED 
(
	[idNhom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 27/11/2019 11:55:05 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[idSanPham] [nchar](10) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[MoTa] [nvarchar](50) NULL,
	[Gia] [money] NULL,
	[Hinh] [nchar](50) NULL,
	[NgayNhap] [date] NULL,
	[idLoai] [nchar](10) NOT NULL,
	[KhuyenMai] [float] NULL,
	[SoLuotXem] [int] NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[idSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 27/11/2019 11:55:05 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[idTaiKhoan] [nchar](10) NOT NULL,
	[userName] [nvarchar](50) NULL,
	[name] [nvarchar](50) NULL,
	[pass] [nvarchar](50) NULL,
	[Diachi] [nvarchar](50) NULL,
	[NgaySinh] [date] NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[GioiTinh] [nchar](10) NULL,
 CONSTRAINT [PK_TaiKhoan] PRIMARY KEY CLUSTERED 
(
	[idTaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TinTuc]    Script Date: 27/11/2019 11:55:05 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TinTuc](
	[MaTin] [nchar](10) NOT NULL,
	[TieuDe] [nvarchar](max) NULL,
	[NoiDung] [nvarchar](max) NULL,
	[HinhAnh] [nchar](100) NULL,
	[Ngay] [date] NULL,
 CONSTRAINT [PK_TinTuc] PRIMARY KEY CLUSTERED 
(
	[MaTin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[Admin] ([Admin], [pass]) VALUES (N'admin', N'admin')
INSERT [dbo].[ChiTietHD] ([idChiTiet], [idHoaDon], [idSanPham], [Soluong], [ThanhTien]) VALUES (N'2         51                  ', N'2         5                   ', N'SANH006   ', 1, 2290000.0000)
INSERT [dbo].[ChiTietHD] ([idChiTiet], [idHoaDon], [idSanPham], [Soluong], [ThanhTien]) VALUES (N'2         52                  ', N'2         5                   ', N'SBD003    ', 1, 3000000.0000)
INSERT [dbo].[ChiTietHD] ([idChiTiet], [idHoaDon], [idSanPham], [Soluong], [ThanhTien]) VALUES (N'2         53                  ', N'2         5                   ', N'G03       ', 1, 792000.0000)
INSERT [dbo].[ChiTietHD] ([idChiTiet], [idHoaDon], [idSanPham], [Soluong], [ThanhTien]) VALUES (N'2         61                  ', N'2         6                   ', N'BA001     ', 2, 4190000.0000)
INSERT [dbo].[ChiTietHD] ([idChiTiet], [idHoaDon], [idSanPham], [Soluong], [ThanhTien]) VALUES (N'2         71                  ', N'2         7                   ', N'BA002     ', 1, 3490000.0000)
INSERT [dbo].[HoaDon] ([idHoaDon], [idTaiKhoan], [TongTien], [NgayLap], [NgayGiao], [DiaChiGiao], [DaThanhToan], [TinhTrang], [ThanhTien]) VALUES (N'2         5                   ', N'2         ', NULL, CAST(N'2019-11-24' AS Date), CAST(N'2019-11-30' AS Date), N'38/24 ', N'Chưa Thanh Toán', N'Đang Giao', 6082000.0000)
INSERT [dbo].[HoaDon] ([idHoaDon], [idTaiKhoan], [TongTien], [NgayLap], [NgayGiao], [DiaChiGiao], [DaThanhToan], [TinhTrang], [ThanhTien]) VALUES (N'2         6                   ', N'2         ', NULL, CAST(N'2019-11-24' AS Date), CAST(N'2019-10-31' AS Date), N'38/24 ', N'Chưa Thanh Toán', N'Đang Giao', 8380000.0000)
INSERT [dbo].[HoaDon] ([idHoaDon], [idTaiKhoan], [TongTien], [NgayLap], [NgayGiao], [DiaChiGiao], [DaThanhToan], [TinhTrang], [ThanhTien]) VALUES (N'2         7                   ', N'2         ', NULL, CAST(N'2019-11-24' AS Date), CAST(N'2019-11-29' AS Date), N'38/24 ', N'Chưa Thanh Toán', N'Đang Giao', 3490000.0000)
INSERT [dbo].[Loai] ([idLoai], [TenLoai], [idNhom]) VALUES (N'1         ', N'Bàn Học', N'1         ')
INSERT [dbo].[Loai] ([idLoai], [TenLoai], [idNhom]) VALUES (N'10        ', N'Bàn Cafe', N'3         ')
INSERT [dbo].[Loai] ([idLoai], [TenLoai], [idNhom]) VALUES (N'11        ', N'Ghế Decor_Thư Giản', N'3         ')
INSERT [dbo].[Loai] ([idLoai], [TenLoai], [idNhom]) VALUES (N'12        ', N'Bộ Bàn Ghế Cafe', N'4         ')
INSERT [dbo].[Loai] ([idLoai], [TenLoai], [idNhom]) VALUES (N'13        ', N'Bàn Cafe', N'4         ')
INSERT [dbo].[Loai] ([idLoai], [TenLoai], [idNhom]) VALUES (N'14        ', N'Ghế Cafe', N'4         ')
INSERT [dbo].[Loai] ([idLoai], [TenLoai], [idNhom]) VALUES (N'15        ', N'Bàn Quầy Bar', N'4         ')
INSERT [dbo].[Loai] ([idLoai], [TenLoai], [idNhom]) VALUES (N'2         ', N'Bàn Làm Việc', N'1         ')
INSERT [dbo].[Loai] ([idLoai], [TenLoai], [idNhom]) VALUES (N'3         ', N'Bàn Văn Phòng', N'1         ')
INSERT [dbo].[Loai] ([idLoai], [TenLoai], [idNhom]) VALUES (N'4         ', N'Ghế Văn Phòng', N'1         ')
INSERT [dbo].[Loai] ([idLoai], [TenLoai], [idNhom]) VALUES (N'5         ', N'Ghế Decor', N'1         ')
INSERT [dbo].[Loai] ([idLoai], [TenLoai], [idNhom]) VALUES (N'6         ', N'Bàn Ăn', N'2         ')
INSERT [dbo].[Loai] ([idLoai], [TenLoai], [idNhom]) VALUES (N'7         ', N'Ghế Ăn', N'2         ')
INSERT [dbo].[Loai] ([idLoai], [TenLoai], [idNhom]) VALUES (N'8         ', N'Sofa', N'3         ')
INSERT [dbo].[Loai] ([idLoai], [TenLoai], [idNhom]) VALUES (N'9         ', N'Bàn Trà', N'3         ')
INSERT [dbo].[NhomSP] ([idNhom], [tenNhom], [Hinh]) VALUES (N'1         ', N'Phòng Làm Việc', NULL)
INSERT [dbo].[NhomSP] ([idNhom], [tenNhom], [Hinh]) VALUES (N'2         ', N'Phòng Ăn', NULL)
INSERT [dbo].[NhomSP] ([idNhom], [tenNhom], [Hinh]) VALUES (N'3         ', N'Phòng Khách', NULL)
INSERT [dbo].[NhomSP] ([idNhom], [tenNhom], [Hinh]) VALUES (N'4         ', N'Cafe', NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'BA001     ', N'Bàn ăn 4 ghế Eames', N'Chất lượng độ bền cao. Bảo hành 1 năm', 4190000.0000, N'hinh42.PNG                                        ', NULL, N'6         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'BA002     ', N'Bàn ăn mago gỗ cao su 4 ghế', N'Chất lượng độ bền cao. Bảo hành 1 năm', 3490000.0000, N'hinh43.PNG                                        ', NULL, N'6         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'BA003     ', N'Bàn ăn màu trắng  4 ghế  Luxury', N'Chất lượng độ bền cao. Bảo hành 1 năm', 3990000.0000, N'hinh44.PNG                                        ', NULL, N'6         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'BA004     ', N'Bàn EAMES chữ nhật đen E1', N'Chất lượng độ bền cao. Bảo hành 1 năm', 1690000.0000, N'hinh45.PNG                                        ', NULL, N'6         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'BA005     ', N'Bộ bàn 2 ghế Eames ', N'Chất lượng độ bền cao. Bảo hành 1 năm', 2290000.0000, N'hinh46.PNG                                        ', NULL, N'6         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'BA006     ', N'Bộ bàn 3 ghế LUXURY', N'Chất lượng độ bền cao. Bảo hành 1 năm', 3290000.0000, N'hinh47.PNG                                        ', NULL, N'6         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'BA007     ', N'Bộ bàn ăn 4 ghế gỗ cao su', N'Chất lượng độ bền cao. Bảo hành 1 năm', 3990000.0000, N'hinh48.PNG                                        ', NULL, N'6         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'BA14      ', N'Bộ bàn tròn 4 ghế gỗ cao su', N'Chất lượng độ bền cao. Bảo hành 1 năm', 5000000.0000, N'bobantron4ghegocaosu.PNG                          ', NULL, N'12        ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'BA15      ', N'Bộ bàn tròn 2 ghế gỗ cao su', N'Chất lượng độ bền cao. Bảo hành 1 năm', 4000000.0000, N'bobantron2ghegocaosu.PNG                          ', NULL, N'12        ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'BCF001    ', N'Bàn cafe tròn gỗ cao kiểu 3 chân', N'Chất lượng độ bền cao. Bảo hành 1 năm', 850000.0000, N'hinh7.PNG                                         ', NULL, N'10        ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'BCF002    ', N'Bàn EAMES chữ nhật đen E1', N'Chất lượng độ bền cao. Bảo hành 1 năm', 1650000.0000, N'hinh45.PNG                                        ', NULL, N'10        ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'BCF003    ', N'Bộ bàn 2 ghế Eames ', N'Chất lượng độ bền cao. Bảo hành 1 năm', 2260000.0000, N'hinh46.PNG                                        ', NULL, N'10        ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'BCF004    ', N'Bộ bàn 3 ghế LUXURY màu trắng', N'Chất lượng độ bền cao. Bảo hành 1 năm', 2360000.0000, N'hinh47.PNG                                        ', NULL, N'10        ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'BCF005    ', N'Bộ bàn 4 ghế LUXURY', N'Chất lượng độ bền cao. Bảo hành 1 năm', 4630000.0000, N'hinh62.PNG                                        ', NULL, N'10        ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'BCF006    ', N'Bộ bàn 4 ghế Tulip tiếp khách cao cấp', N'Chất lượng độ bền cao. Bảo hành 1 năm', 6450000.0000, N'hinh63.PNG                                        ', NULL, N'10        ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'BCF007    ', N'Bộ bàn tiếp khách Tulip 4 ghế (2)', N'Chất lượng độ bền cao. Bảo hành 1 năm', 2600000.0000, N'hinh64.PNG                                        ', NULL, N'10        ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'BCF01     ', N'Bàn cafe tròn gỗ cao su kiểu 3 chân', N'Chất lượng độ bền cao. Bảo hành 1 năm', 1200000.0000, N'bancafetron.PNG                                   ', NULL, N'13        ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'BGD01     ', N'Bàn giám đốc kèm tủ hồ sơ', NULL, 4490000.0000, N'bangiamdoc.PNG                                    ', CAST(N'2019-11-08' AS Date), N'8         ', NULL, 10)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'BH02      ', N'Bàn họp chân sắt 6 chỗ', NULL, 3490000.0000, N'banhopchansat.PNG                                 ', CAST(N'2019-11-07' AS Date), N'8         ', NULL, 11)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'BLV011    ', N'Bàn làm việc chữ U', NULL, 1590000.0000, N'banlamviecchuU.PNG                                ', CAST(N'2019-11-09' AS Date), N'8         ', NULL, 20)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'BLVKS001  ', N'Bàn làm việc khung sắt Ovan', N'Chất lượng độ bền cao. Bảo hành 1 năm', 3000000.0000, N'hinh30.PNG                                        ', NULL, N'3         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'BLVKS005  ', N'Bàn học liền kệ sách', N'Chất lượng độ bền cao. Bảo hành 1 năm', 2500000.0000, N'banhoclienkesach.PNG                              ', NULL, N'1         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'BLVKS008  ', N'Bàn làm việc liền kề sách đa năng', N'Chất lượng độ bền cao. Bảo hành 1 năm', 2700000.0000, N'banlamvieclienkesachdanang.PNG                    ', NULL, N'1         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'BLVX1     ', N'Bàn làm việc chữ X hiện đại', N'Chất lượng độ bền cao. Bảo hành 1 năm', 990000.0000, N'hinh26.PNG                                        ', NULL, N'3         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'BQB       ', N'Bàn quầy BAR mặt tròn gỗ cao su kiểu 3 chân', N'Chất lượng độ bền cao. Bảo hành 1 năm', 980000.0000, N'hinh7.PNG                                         ', NULL, N'15        ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'BS005     ', N'Bộ bàn tiếp khách Tulip 2 ghế', N'Chất lượng độ bền cao. Bảo hành 1 năm', 9000000.0000, N'bobantulip.PNG                                    ', NULL, N'12        ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'BT001     ', N'Bàn trà chân sắt kiểu', N'Chất lượng độ bền cao. Bảo hành 1 năm', 1890000.0000, N'hinh6.PNG                                         ', NULL, N'9         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'BT002     ', N'Bàn trà gỗ Tràm vàng tự nhiên', N'Chất lượng độ bền cao. Bảo hành 1 năm', 1390000.0000, N'hinh8.PNG                                         ', NULL, N'9         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'BT003     ', N'Bàn trà chữ nhật mặt đá kiểu hiện đại', N'Chất lượng độ bền cao. Bảo hành 1 năm', 2260000.0000, N'hinh57.PNG                                        ', NULL, N'9         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'BT004     ', N'Bàn trà chữ nhật', N'Chất lượng độ bền cao. Bảo hành 1 năm', 1020000.0000, N'hinh58.PNG                                        ', NULL, N'9         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'BT005     ', N'Bộ bàn lục giác 4 ghế Eames ', N'Chất lượng độ bền cao. Bảo hành 1 năm', 3200000.0000, N'bobanlucgiac.PNG                                  ', NULL, N'12        ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'BT01      ', N'Bộ bàn trà 4 ghế Eames', N'Chất lượng độ bền cao. Bảo hành 1 năm', 3800000.0000, N'bobantra4gheeames.PNG                             ', NULL, N'12        ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'BT04      ', N'Bộ bàn trà 4 ghế Luxury', N'Chất lượng độ bền cao. Bảo hành 1 năm', 5000000.0000, N'bobantra4gheluxury.PNG                            ', NULL, N'12        ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'BT11      ', N'Bàn trà lồng chim kiểu hiện đại', N'Chất lượng độ bền cao. Bảo hành 1 năm', 1990000.0000, N'hinh61.PNG                                        ', NULL, N'9         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'BT14      ', N'Bàn trà kim cương hiện đại', N'Chất lượng độ bền cao. Bảo hành 1 năm', 1850000.0000, N'hinh60.PNG                                        ', NULL, N'9         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'BTT05     ', N'Bàn trà đôi vuông kiểu hiện đại', N'Chất lượng độ bền cao. Bảo hành 1 năm', 4990000.0000, N'hinh59.PNG                                        ', NULL, N'9         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'BV002     ', N'Bàn chân Oval có vách ngăn', N'Chất lượng độ bền cao. Bảo hành 1 năm', 1490000.0000, N'hinh1.PNG                                         ', NULL, N'3         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'G01       ', N'Ghế thư giãn lưng dù', NULL, 990000.0000, N'ghelungdu.PNG                                     ', CAST(N'2019-05-11' AS Date), N'3         ', NULL, 19)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'G03       ', N'Ghế thư giãn tristin', NULL, 990000.0000, N'ghetristin.PNG                                    ', CAST(N'2019-05-11' AS Date), N'3         ', 0.2, 30)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'G04       ', N'Ghế tiếp khách Tuylip', N'Chất lượng độ bền cao. Bảo hành 1 năm', 1550000.0000, N'ghetuylip.PNG                                     ', NULL, N'11        ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'GA0001    ', N'Ghế ăn Grace nhập khẩu cao cấp', N'Chất lượng độ bền cao. Bảo hành 1 năm', 1090000.0000, N'hinh9.PNG                                         ', NULL, N'7         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'GA0002    ', N'Ghế cafe chân gỗ phong cách Bắc Âu', N'Chất lượng độ bền cao. Bảo hành 1 năm', 990000.0000, N'hinh10.PNG                                        ', NULL, N'7         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'GA0003    ', N'Ghế cafe EAmes trong suốt kiểu Bắc Âu', N'Chất lượng độ bền cao. Bảo hành 1 năm', 890000.0000, N'hinh11.PNG                                        ', NULL, N'7         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'GA0004    ', N'Ghế Compass bọc vải bố', N'Chất lượng độ bền cao. Bảo hành 1 năm', 890000.0000, N'hinh12.PNG                                        ', NULL, N'7         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'GA0005    ', N'Ghế decor kiểu Bắc Âu', N'Chất lượng độ bền cao. Bảo hành 1 năm', 1290000.0000, N'hinh13.PNG                                        ', NULL, N'7         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'GA0006    ', N'Ghế decor kiểu Lucky Bắc Au', N'Chất lượng độ bền cao. Bảo hành 1 năm', 950000.0000, N'hinh14.PNG                                        ', NULL, N'7         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'GA001     ', N'Ghế Compass bọc vải bố', NULL, 890000.0000, N'ghecompass.PNG                                    ', CAST(N'2019-05-11' AS Date), N'3         ', NULL, 60)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'GA01      ', N'Ghế ăn Grace nhập khẩu cao cấp', NULL, 1100000.0000, N'ghean.PNG                                         ', CAST(N'2019-05-11' AS Date), N'3         ', NULL, 50)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'GA02      ', N'Ghế ăn Grace nhập khẩu cao cấp', NULL, 1300000.0000, N'ghean1.PNG                                        ', CAST(N'2019-05-11' AS Date), N'3         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'GA03      ', N'Ghế docor Lucy kiểu Bắc Âu', NULL, 950000.0000, N'ghedecor1.PNG                                     ', CAST(N'2019-05-11' AS Date), N'3         ', 0.2, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'GCF001    ', N'Ghế cafe nhập khẩu cao cấp', N'Chất lượng độ bền cao. Bảo hành 1 năm', 1090000.0000, N'hinh9.PNG                                         ', NULL, N'14        ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'GCF002    ', N'Ghế cafe chân gỗ phong cách Bắc Âu', N'Chất lượng độ bền cao. Bảo hành 1 năm', 660000.0000, N'hinh10.PNG                                        ', NULL, N'14        ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'GCF003    ', N'Ghế cafe bọc vải bố', N'Chất lượng độ bền cao. Bảo hành 1 năm', 960000.0000, N'hinh12.PNG                                        ', NULL, N'14        ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'GCF004    ', N'Ghế cafe kiểu Bắc Âu', N'Chất lượng độ bền cao. Bảo hành 1 năm', 1260000.0000, N'hinh13.PNG                                        ', NULL, N'14        ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'GCF005    ', N'Ghế cafe nhỏ xinh', N'Chất lượng độ bền cao. Bảo hành 1 năm', 690000.0000, N'hinh14.PNG                                        ', NULL, N'14        ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'GCF006    ', N'Ghế cafe chân gỗ thiết kế hiện đại', N'Chất lượng độ bền cao. Bảo hành 1 năm', 990000.0000, N'hinh11.PNG                                        ', NULL, N'14        ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'GCF01     ', N'Ghế decor kiểu Bắc Âu', NULL, 1290000.0000, N'ghedecor.PNG                                      ', CAST(N'2019-05-11' AS Date), N'3         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'GDC01     ', N'Ghế Ăn Grace nhập khẩu cao cấp', N'Chất lượng độ bền cao. Bảo hành 1 năm', 1090000.0000, N'hinh9.PNG                                         ', NULL, N'5         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'GDC02     ', N'Ghế cafe chân gỗ phong cách Bắc Âu', N'Chất lượng độ bền cao. Bảo hành 1 năm', 990000.0000, N'hinh10.PNG                                        ', NULL, N'5         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'GDC03     ', N'Ghế cafe EAmes trong suốt kiểu Bắc Âu', N'Chất lượng độ bền cao. Bảo hành 1 năm', 890000.0000, N'hinh11.PNG                                        ', NULL, N'5         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'GDC04     ', N'Ghế Compass bọc vải bố', N'Chất lượng độ bền cao. Bảo hành 1 năm', 880000.0000, N'hinh12.PNG                                        ', NULL, N'5         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'GDC05     ', N'Ghế decor kiểu Bắc Âu', N'Chất lượng độ bền cao. Bảo hành 1 năm', 1230000.0000, N'hinh13.PNG                                        ', NULL, N'5         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'GDC06     ', N'Ghế decor kiểu Lucky Bắc Au', N'Chất lượng độ bền cao. Bảo hành 1 năm', 960000.0000, N'hinh14.PNG                                        ', NULL, N'5         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'GVP02     ', N'Ghế chân quỳ chân sắt lưng trung', N'Chất lượng độ bền cao. Bảo hành 1 năm', 950000.0000, N'hinh16.PNG                                        ', NULL, N'4         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'GVP03     ', N'Ghế chân quỳ inox lưng liền', N'Chất lượng độ bền cao. Bảo hành 1 năm', 750000.0000, N'hinh17.PNG                                        ', NULL, N'4         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'GVP04     ', N'Ghế chân quỳ lưng cao', N'Chất lượng độ bền cao. Bảo hành 1 năm', 1150000.0000, N'hinh18.PNG                                        ', NULL, N'4         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'GVP05     ', N'Ghế chân quỳ lưng trung', N'Chất lượng độ bền cao. Bảo hành 1 năm', 950000.0000, N'hinh18.PNG                                        ', NULL, N'4         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'GVP06     ', N'Ghế GAMING CHAIR', N'Chất lượng độ bền cao. Bảo hành 1 năm', 1950000.0000, N'hinh19.PNG                                        ', NULL, N'4         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'GVP07     ', N'Ghế GAMING CHAIR 2', N'Chất lượng độ bền cao. Bảo hành 1 năm', 1990000.0000, N'hinh20.PNG                                        ', NULL, N'4         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'GVP08     ', N'Ghế CEO chất liệu da cao cấp', N'Chất lượng độ bền cao. Bảo hành 1 năm', 1950000.0000, N'hinh15.PNG                                        ', NULL, N'4         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'S01       ', N'Bộ bàn ghế cafe kiểu Bắc Âu', N'Chất lượng độ bền cao. Bảo hành 1 năm', 4000000.0000, N'bobancafebacau.PNG                                ', NULL, N'12        ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'SANH005   ', N'Bàn làm việc chữ A kiểu dáng hiện đại', NULL, 2290000.0000, N'banlamviecchuA2.PNG                               ', CAST(N'2019-05-11' AS Date), N'8         ', 0.2, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'SANH006   ', N'Bàn học liền kệ sách đa năng', NULL, 2290000.0000, N'banhoclienke.PNG                                  ', CAST(N'2019-05-11' AS Date), N'8         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'SANH008   ', N'Bàn học liền kệ sách', NULL, 1990000.0000, N'banhoclienke1.PNG                                 ', CAST(N'2019-05-11' AS Date), N'8         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'SANH009   ', N'Bàn học liền kệ sách kiểu hiện đại', N'Chất lượng độ bền cao. Bảo hành 1 năm', 3000000.0000, N'banhoclienkesachkieuhiendai.PNG                   ', NULL, N'1         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'SBAET2    ', N'Bộ bàn 2 ghế Eames ', N'Chất lượng độ bền cao. Bảo hành 1 năm', 2750000.0000, N'boban2gheeames.PNG                                ', NULL, N'12        ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'SBAEV4    ', N'Bộ bàn ăn 4 ghế Eames', N'Chất lượng độ bền cao. Bảo hành 1 năm', 4800000.0000, N'boban4gheeames.PNG                                ', NULL, N'12        ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'SBALT3    ', N'Bộ bàn 3 ghế Luxury màu trắng', N'Chất lượng độ bền cao. Bảo hành 1 năm', 4000000.0000, N'boban3gheluxury.PNG                               ', NULL, N'12        ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'SBD001    ', N'Bàn đôi liền kệ đa năng', N'Chất lượng độ bền cao. Bảo hành 1 năm', 4000000.0000, N'bandoilienke1.PNG                                 ', NULL, N'1         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'SBD003    ', N'Bàn đôi liền kệ đa năng 1', NULL, 3000000.0000, N'bandoilienke.PNG                                  ', CAST(N'2019-11-09' AS Date), N'8         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'SBE005    ', N'Bộ bàn Eames 2 ghế', N'Chất lượng độ bền cao. Bảo hành 1 năm', 4000000.0000, N'bobaneames2ghe.PNG                                ', NULL, N'12        ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'SBGTM01   ', N'Bàn gấp thông minh', NULL, 1000000.0000, N'bangapthongminh.PNG                               ', NULL, N'8         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'SBH0008   ', N'Ghế Luxury nhập khẩu kiểu dáng Châu Âu', NULL, 690000.0000, N'gheluxury2.PNG                                    ', NULL, N'3         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'SBH002    ', N'Bàn làm việc 2 cửa lùa hiện đại', NULL, 2550000.0000, N'banlamviec2cualua                                 ', NULL, N'8         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'SBH005    ', N'Ghế Luxury kiểu dáng Châu Âu', NULL, 690000.0000, N'gheluxury1.PNG                                    ', NULL, N'3         ', 0.2, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'SBH006    ', N'Bàn làm việc chân gỗ 2 hộ kéo ', NULL, 2000000.0000, N'banlamviecchango.PNG                              ', NULL, N'8         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'SBH007    ', N'Bàn học liền kệ đa năng', N'Chất lượng độ bền cao. Bảo hành 1 năm', 2300000.0000, N'banhoclienkedanang.PNG                            ', NULL, N'1         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'SBH008    ', N'Bàn học liền kệ hiện đại', N'Chất lượng độ bền cao. Bảo hành 1 năm', 2500000.0000, N'banhoclienkehiendai.PNG                           ', NULL, N'1         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'SBH009    ', N'Bàn học liền kệ', N'Chất lượng độ bền cao. Bảo hành 1 năm', 4000000.0000, N'bandoilienke2.PNG                                 ', NULL, N'1         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'SBH01     ', N'Ghế lưới sắt lưng trung', NULL, 590000.0000, N'gheluoisatlungtrung.PNG                           ', NULL, N'3         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'SBHNB01   ', N'Bàn học ngồi bệt liền kệ sách', NULL, 990000.0000, N'banhocngoibetlienkesach.PNG                       ', NULL, N'8         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'SBL004    ', N'Bàn làm việc chữ L', N'Chất lượng độ bền cao. Bảo hành 1 năm', 2390000.0000, N'banlamviecchuL.PNG                                ', NULL, N'1         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'SBLL04    ', N'Bàn làm việc chữ L', N'Chất lượng độ bền cao. Bảo hành 1 năm', 2290000.0000, N'hinh23.PNG                                        ', NULL, N'3         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'SBLVP003  ', N'Bàn chữ L kèm tủ cá nhân Cabinet', N'Chất lượng độ bền cao. Bảo hành 1 năm', 4000000.0000, N'hinh3.PNG                                         ', NULL, N'2         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'SBOV01    ', N'Bàn làm việc chân OVAL', NULL, 1200000.0000, N'banlamviecoval.PNG                                ', NULL, N'8         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'SBU01     ', N'Bàn làm việc chữ U 2', N'Chất lượng độ bền cao. Bảo hành 1 năm', 990000.0000, N'hinh25.PNG                                        ', NULL, N'3         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'SBVP003   ', N'Bàn chữ L kèm tủ cá nhân Cabinet', NULL, 4490000.0000, N'banchul.PNG                                       ', NULL, N'8         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'SBVP006   ', N'Bàn làm việc khung sắt Ovan', N'Chất lượng độ bền cao. Bảo hành 1 năm', 2690000.0000, N'hinh31.PNG                                        ', NULL, N'3         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'SBVP007   ', N'Bàn làm việc Hộc Tủ', N'Chất lượng độ bền cao. Bảo hành 1 năm', 2150000.0000, N'hinh28.PNG                                        ', NULL, N'3         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'SDC002    ', N'Ghế gỗ decor', NULL, 650000.0000, N'ghegodecor.PNG                                    ', NULL, N'3         ', NULL, NULL)
GO
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'SF001     ', N'Bộ sofa 3 món màu xanh thanh mát', N'Chất lượng độ bền cao. Bảo hành 1 năm', 13450000.0000, N'hinh49.PNG                                        ', NULL, N'8         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'SF002     ', N'Ghế sofa  đơn hình đóa hoa', N'Chất lượng độ bền cao. Bảo hành 1 năm', 2690000.0000, N'hinh50.PNG                                        ', NULL, N'8         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'SF003     ', N'Ghế sofa đơn kiểu cúc', N'Chất lượng độ bền cao. Bảo hành 1 năm', 2690000.0000, N'hinh51.PNG                                        ', NULL, N'8         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'SF004     ', N'SET SOFA chỗ màu xanh PASTEL thanh mát', N'Chất lượng độ bền cao. Bảo hành 1 năm', 9860000.0000, N'hinh52.PNG                                        ', NULL, N'8         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'SF005     ', N'SET SOFA kiểu dáng Bắc Âu', N'Chất lượng độ bền cao. Bảo hành 1 năm', 15990000.0000, N'hinh54.PNG                                        ', NULL, N'8         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'SF006     ', N'SOFA màu xanh tươi mát', N'Chất lượng độ bền cao. Bảo hành 1 năm', 14990000.0000, N'hinh53.PNG                                        ', NULL, N'8         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'SF007     ', N'SOFA băng 2 chỗ hồng lãng mạn', N'Chất lượng độ bền cao. Bảo hành 1 năm', 6900000.0000, N'hinh55.PNG                                        ', NULL, N'8         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'SF008     ', N'SOFA băng kiểu hiện đại', N'Chất lượng độ bền cao. Bảo hành 1 năm', 5460000.0000, N'hinh56.PNG                                        ', NULL, N'8         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'SGCF003   ', N'Ghế cafe chân gỗ phong cách Bắc Âu', NULL, 990000.0000, N'ghecafe.PNG                                       ', NULL, N'3         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'SGE0007   ', N'Ghế Eames nhiều màu sắc', NULL, 390000.0000, N'gheeames2.PNG                                     ', NULL, N'3         ', 0.2, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'SGE002    ', N'GHẾ EAMES BỌC NỆM ', NULL, 650000.0000, N'gheeames.PNG                                      ', NULL, N'3         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'SGE003    ', N'GHẾ EAMES BỌC NỆM', NULL, 650000.0000, N'gheeames1.PNG                                     ', NULL, N'3         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'SGE004    ', N'Ghế Eames chân sắt tĩnh điện', NULL, 460000.0000, N'gheeameschansat.PNG                               ', NULL, N'3         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'SGG001    ', N'Ghế gỗ', NULL, 690000.0000, N'ghego.PNG                                         ', NULL, N'3         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'SGLXR01   ', N'Ghế Luxury chân sắt', NULL, 690000.0000, N'gheluxury.PNG                                     ', NULL, N'3         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'STK0002   ', N'Bàn làm việc chân Oval', N'Chất lượng độ bền cao. Bảo hành 1 năm', 1200000.0000, N'hinh35.PNG                                        ', NULL, N'2         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'STK001    ', N'Bàn làm việc hiện đại', NULL, 1490000.0000, N'banlamviechiendai.PNG                             ', NULL, N'8         ', 0.2, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'STK002    ', N'Bàn làm việc chữ A hiện đại', NULL, 1290000.0000, N'banlamviecchuA.PNG                                ', NULL, N'8         ', NULL, NULL)
INSERT [dbo].[SanPham] ([idSanPham], [Name], [MoTa], [Gia], [Hinh], [NgayNhap], [idLoai], [KhuyenMai], [SoLuotXem]) VALUES (N'STK004    ', N'Bàn làm việc kính cường lực cao cấp', N'Chất lượng độ bền cao. Bảo hành 1 năm', 2690000.0000, N'hinh32.PNG                                        ', NULL, N'3         ', NULL, NULL)
INSERT [dbo].[TaiKhoan] ([idTaiKhoan], [userName], [name], [pass], [Diachi], [NgaySinh], [Email], [Phone], [GioiTinh]) VALUES (N'1         ', NULL, N'TrungNam', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TaiKhoan] ([idTaiKhoan], [userName], [name], [pass], [Diachi], [NgaySinh], [Email], [Phone], [GioiTinh]) VALUES (N'2         ', N'TrungNam', N'Trung Nam', N'111222', N'38/24 ', CAST(N'2019-10-23' AS Date), N'trungnamcamap@gmail.com', NULL, NULL)
INSERT [dbo].[TaiKhoan] ([idTaiKhoan], [userName], [name], [pass], [Diachi], [NgaySinh], [Email], [Phone], [GioiTinh]) VALUES (N'3         ', N'TrungNam2', N'Trung Nam 2', N'111222', N'12', CAST(N'2019-11-01' AS Date), N'123@gmail.com', NULL, NULL)
INSERT [dbo].[TaiKhoan] ([idTaiKhoan], [userName], [name], [pass], [Diachi], [NgaySinh], [Email], [Phone], [GioiTinh]) VALUES (N'4         ', N'TrungNam3', N'Trung Nam 3', N'111222', N'38/24 ', CAST(N'2019-11-21' AS Date), N'123@gmail.com', NULL, NULL)
INSERT [dbo].[TaiKhoan] ([idTaiKhoan], [userName], [name], [pass], [Diachi], [NgaySinh], [Email], [Phone], [GioiTinh]) VALUES (N'5         ', N'Login', N'Hero', N'111222', N'38/24 ', CAST(N'2019-11-07' AS Date), N'camapheoga@gmail.com', NULL, NULL)
INSERT [dbo].[TaiKhoan] ([idTaiKhoan], [userName], [name], [pass], [Diachi], [NgaySinh], [Email], [Phone], [GioiTinh]) VALUES (N'6         ', N'TrungNam4', N'Trung Nam 4', N'111222', N'38/24 ', CAST(N'2019-11-08' AS Date), N'trungnamcamap@gmail.com', NULL, N'Nam       ')
INSERT [dbo].[TaiKhoan] ([idTaiKhoan], [userName], [name], [pass], [Diachi], [NgaySinh], [Email], [Phone], [GioiTinh]) VALUES (N'7         ', N'TrungNam5', N'Trung Nam5', N'123', N'38/24 ', CAST(N'2019-11-20' AS Date), N'trungnamcamap@gmail.com', NULL, N'Nữ        ')
INSERT [dbo].[TinTuc] ([MaTin], [TieuDe], [NoiDung], [HinhAnh], [Ngay]) VALUES (N'1         ', N'Đại gia Sóc Trăng chi tiền tỷ tậu đàn cua gỗ khổng lồ về trưng', N'Bất kỳ ai khi đến trạm dừng chân Tân Huê Viên (xã An Hiệp, huyện Châu Thành, tỉnh Sóc Trăng) đều không khỏi tò mò trước bộ bàn ghế lạ. Kích thước khổng lồ, chất gỗ đỏ mát mẻ đặc biệt hơn cả là hình tượng thiết kế một đàn cua ngoại cỡ.', N'TT01.jpg                                                                                            ', CAST(N'2019-11-23' AS Date))
INSERT [dbo].[TinTuc] ([MaTin], [TieuDe], [NoiDung], [HinhAnh], [Ngay]) VALUES (N'2         ', N'Trầm trồ ngắm bộ bàn ghế gỗ mun hoa quý hiếm, 15 "bàn tay vàng" mất hơn 1 năm chế tác', N'Riêng công vận chuyển cũng đã tốn tiền triệu, dân chơi gỗ ao ước sở hữu bộ bàn ghế được chế tác từ loại gỗ quý hiếm mun hoa ngàn năm tuổi.', N'TT02.jpg                                                                                            ', CAST(N'2019-11-23' AS Date))
INSERT [dbo].[TinTuc] ([MaTin], [TieuDe], [NoiDung], [HinhAnh], [Ngay]) VALUES (N'3         ', N'Bộ bàn ghế khổng lồ cao hơn 2m, làm từ gỗ mun, giá lên tới 3 tỷ', N'Dân chơi gần xa không khỏi “giật mình” khi nghe mức giá 3,2 tỷ đồng của bộ bàn ghế “quốc voi”, đến xem thì phải ngỡ ngàng trước kích thước “khổng lồ” của siêu phẩm đồ mộc “tay 32”.', N'TT03.jpg                                                                                            ', CAST(N'2019-11-23' AS Date))
INSERT [dbo].[TinTuc] ([MaTin], [TieuDe], [NoiDung], [HinhAnh], [Ngay]) VALUES (N'4         ', N'Đại gia phố núi gây choáng bằng bộ bàn ghế khủng hàng trăm triệu
Đại gia phố núi gây choáng bằng bộ bàn ghế khủng hàng trăm triệu', N'Mặc dù đang được hoàn thiện nhưng rất nhiều người dân đã vô cùng choáng váng trước bộ bàn ghế khủng của vị đại gia này.', N'TT04.jpg                                                                                            ', CAST(N'2019-11-23' AS Date))
ALTER TABLE [dbo].[ChiTietHD]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHD_HoaDon] FOREIGN KEY([idHoaDon])
REFERENCES [dbo].[HoaDon] ([idHoaDon])
GO
ALTER TABLE [dbo].[ChiTietHD] CHECK CONSTRAINT [FK_ChiTietHD_HoaDon]
GO
ALTER TABLE [dbo].[ChiTietHD]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHD_SanPham] FOREIGN KEY([idSanPham])
REFERENCES [dbo].[SanPham] ([idSanPham])
GO
ALTER TABLE [dbo].[ChiTietHD] CHECK CONSTRAINT [FK_ChiTietHD_SanPham]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_TaiKhoan] FOREIGN KEY([idTaiKhoan])
REFERENCES [dbo].[TaiKhoan] ([idTaiKhoan])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_TaiKhoan]
GO
ALTER TABLE [dbo].[Loai]  WITH CHECK ADD  CONSTRAINT [FK_Loai_Loai] FOREIGN KEY([idNhom])
REFERENCES [dbo].[NhomSP] ([idNhom])
GO
ALTER TABLE [dbo].[Loai] CHECK CONSTRAINT [FK_Loai_Loai]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_Loai] FOREIGN KEY([idLoai])
REFERENCES [dbo].[Loai] ([idLoai])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_Loai]
GO
USE [master]
GO
ALTER DATABASE [DB_BANGHE] SET  READ_WRITE 
GO
