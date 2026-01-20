-- =============================================
-- Script tạo database hoàn chỉnh cho Web Bán Quần Áo
-- =============================================

USE master;
GO

-- Xóa database cũ nếu tồn tại
IF EXISTS (SELECT name FROM sys.databases WHERE name = N'QuanAoDB')
BEGIN
    ALTER DATABASE QuanAoDB SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE QuanAoDB;
END
GO

-- Tạo database mới
CREATE DATABASE QuanAoDB;
GO

USE QuanAoDB;
GO

-- =============================================
-- 1. Bảng DanhMuc (Danh mục sản phẩm)
-- =============================================
CREATE TABLE DanhMuc (
    MaDanhMuc INT IDENTITY(1,1) PRIMARY KEY,
    TenDanhMuc NVARCHAR(100) NOT NULL,
    MoTa NVARCHAR(500)
);
GO

-- =============================================
-- 2. Bảng ThuongHieu (Thương hiệu)
-- =============================================
CREATE TABLE ThuongHieu (
    MaThuongHieu INT IDENTITY(1,1) PRIMARY KEY,
    TenThuongHieu NVARCHAR(100) NOT NULL,
    MoTa NVARCHAR(500)
);
GO

-- =============================================
-- 3. Bảng QuanAo (Sản phẩm quần áo)
-- =============================================
CREATE TABLE QuanAo (
    MaQuanAo INT IDENTITY(1,1) PRIMARY KEY,
    TenQuanAo NVARCHAR(200) NOT NULL,
    MoTa NVARCHAR(MAX),
    DonGia DECIMAL(18,2) NOT NULL,
    SoLuong INT NOT NULL DEFAULT 0,
    AnhQuanAo NVARCHAR(500),
    MaDanhMuc INT,
    MaThuongHieu INT,
    NgayTao DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (MaDanhMuc) REFERENCES DanhMuc(MaDanhMuc),
    FOREIGN KEY (MaThuongHieu) REFERENCES ThuongHieu(MaThuongHieu)
);
GO

-- =============================================
-- 4. Bảng NguoiDung (Người dùng)
-- =============================================
CREATE TABLE NguoiDung (
    MaNguoiDung INT IDENTITY(1,1) PRIMARY KEY,
    TenDangNhap NVARCHAR(50) NOT NULL UNIQUE,
    MatKhau NVARCHAR(255) NOT NULL,
    HoTen NVARCHAR(100),
    Email NVARCHAR(100),
    DienThoai NVARCHAR(20),
    DiaChi NVARCHAR(500),
    LaAdmin BIT DEFAULT 0,
    NgayTao DATETIME DEFAULT GETDATE()
);
GO

-- =============================================
-- 5. Bảng DonHang (Đơn hàng)
-- =============================================
CREATE TABLE DonHang (
    MaDonHang INT IDENTITY(1,1) PRIMARY KEY,
    MaNguoiDung INT NULL,
    HoTen NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100),
    DienThoai NVARCHAR(20) NOT NULL,
    DiaChi NVARCHAR(500) NOT NULL,
    TongTien DECIMAL(18,2) NOT NULL,
    TrangThai NVARCHAR(50) DEFAULT N'Chờ xử lý',
    NgayDat DATETIME DEFAULT GETDATE(),
    GhiChu NVARCHAR(MAX),
    FOREIGN KEY (MaNguoiDung) REFERENCES NguoiDung(MaNguoiDung)
);
GO

-- =============================================
-- 6. Bảng ChiTietDonHang (Chi tiết đơn hàng)
-- =============================================
CREATE TABLE ChiTietDonHang (
    MaChiTiet INT IDENTITY(1,1) PRIMARY KEY,
    MaDonHang INT NOT NULL,
    MaQuanAo INT NOT NULL,
    TenQuanAo NVARCHAR(200) NOT NULL,
    DonGia DECIMAL(18,2) NOT NULL,
    SoLuong INT NOT NULL,
    ThanhTien DECIMAL(18,2) NOT NULL,
    FOREIGN KEY (MaDonHang) REFERENCES DonHang(MaDonHang) ON DELETE CASCADE,
    FOREIGN KEY (MaQuanAo) REFERENCES QuanAo(MaQuanAo)
);
GO

-- =============================================
-- INSERT DỮ LIỆU MẪU
-- =============================================

-- Thêm Danh mục
INSERT INTO DanhMuc (TenDanhMuc, MoTa) VALUES
(N'Áo Nam', N'Các loại áo dành cho nam giới'),
(N'Quần Nam', N'Các loại quần dành cho nam giới'),
(N'Áo Nữ', N'Các loại áo dành cho nữ giới'),
(N'Quần Nữ', N'Các loại quần dành cho nữ giới'),
(N'Phụ Kiện', N'Phụ kiện thời trang');
GO

-- Thêm Thương hiệu
INSERT INTO ThuongHieu (TenThuongHieu, MoTa) VALUES
(N'Nike', N'Thương hiệu thể thao nổi tiếng'),
(N'Adidas', N'Thương hiệu thể thao Đức'),
(N'Zara', N'Thương hiệu thời trang Tây Ban Nha'),
(N'H&M', N'Thương hiệu thời trang Thụy Điển'),
(N'Uniqlo', N'Thương hiệu thời trang Nhật Bản');
GO



-- Thêm Sản phẩm (12 sản phẩm - sử dụng ảnh có sẵn trong thư mục img)
INSERT INTO QuanAo (TenQuanAo, MoTa, DonGia, SoLuong, AnhQuanAo, MaDanhMuc, MaThuongHieu) VALUES
(N'Áo Thun Nam Nike Sportswear', N'Áo thun nam chất liệu cotton cao cấp, thoáng mát, phù hợp cho hoạt động thể thao và dạo phố', 350000, 50, 'img/ao.jpg', 1, 1),
(N'Áo Polo Nam Adidas Classic', N'Áo polo nam thiết kế thanh lịch, chất liệu thấm hút mồ hôi tốt, phù hợp đi làm và chơi golf', 450000, 40, 'img/ao1.jpg', 1, 2),
(N'Áo Sơ Mi Nam Zara Slim Fit', N'Áo sơ mi nam form slim fit hiện đại, chất liệu vải cao cấp, dễ phối đồ', 550000, 35, 'img/ao2.jpg', 1, 3),
(N'Quần Jean Nam Skinny Fit', N'Quần jean nam ôm vừa phải, chất liệu denim co giãn thoải mái, phong cách trẻ trung', 650000, 45, 'img/quan.jpg', 2, 4),
(N'Quần Kaki Nam Uniqlo', N'Quần kaki nam chất liệu thoáng mát, form dáng chuẩn, phù hợp đi làm và dạo phố', 500000, 60, 'img/quan1.jpg', 2, 5),
(N'Quần Short Nam Nike Dri-FIT', N'Quần short thể thao nam công nghệ Dri-FIT thấm hút mồ hôi, thoải mái khi vận động', 400000, 55, 'img/quan2.webp', 2, 1),
(N'Áo Kiểu Nữ Zara Vintage', N'Áo kiểu nữ thiết kế vintage sang trọng, chất liệu lụa mềm mại, phù hợp dự tiệc', 750000, 30, 'img/ao.jpg', 3, 3),
(N'Áo Thun Nữ H&M Basic', N'Áo thun nữ basic đa năng, chất liệu cotton mềm mịn, dễ phối đồ hàng ngày', 250000, 70, 'img/ao1.jpg', 3, 4),
(N'Áo Len Nữ Uniqlo Cashmere', N'Áo len nữ chất liệu cashmere cao cấp, giữ ấm tốt, thiết kế thanh lịch', 850000, 25, 'img/ao2.jpg', 3, 5),
(N'Váy Nữ Zara Midi Dress', N'Váy midi nữ thiết kế thanh lịch, chất liệu vải mềm mại, phù hợp đi làm và dạo phố', 950000, 20, 'img/ao.jpg', 4, 3),
(N'Quần Jean Nữ Skinny H&M', N'Quần jean nữ skinny ôm dáng, chất liệu denim co giãn tốt, tôn dáng', 600000, 40, 'img/quan.jpg', 4, 4),
(N'Quần Tây Nữ Công Sở', N'Quần tây nữ form dáng chuẩn, chất liệu cao cấp, phù hợp môi trường công sở', 700000, 35, 'img/quan1.jpg', 4, 3);
GO

-- Thêm tài khoản Admin
INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, Email, DienThoai, DiaChi, LaAdmin) VALUES
(N'admin', N'admin123', N'Quản Trị Viên', N'admin@fashionstore.com', N'0123456789', N'Hà Nội', 1);
GO

-- Thêm tài khoản User mẫu
INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, Email, DienThoai, DiaChi, LaAdmin) VALUES
(N'user1', N'123456', N'Nguyễn Văn A', N'nguyenvana@gmail.com', N'0987654321', N'Hồ Chí Minh', 0),
(N'user2', N'123456', N'Trần Thị B', N'tranthib@gmail.com', N'0912345678', N'Đà Nẵng', 0);
GO

-- =============================================
-- HOÀN THÀNH!
-- =============================================
PRINT N'✅ Tạo database QuanAoDB thành công!';
PRINT N'✅ Đã thêm 5 danh mục';
PRINT N'✅ Đã thêm 5 thương hiệu';
PRINT N'✅ Đã thêm 12 sản phẩm';
PRINT N'✅ Đã thêm 3 người dùng (1 admin, 2 user)';
PRINT N'';
PRINT N'📌 Tài khoản Admin:';
PRINT N'   Username: admin';
PRINT N'   Password: admin123';
PRINT N'';
PRINT N'📌 Tài khoản User:';
PRINT N'   Username: user1 / Password: 123456';
PRINT N'   Username: user2 / Password: 123456';
GO
