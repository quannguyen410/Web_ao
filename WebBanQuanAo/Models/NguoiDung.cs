using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebBanQuanAo.Models
{
    public class NguoiDung
    {
        public int Id { get; set; }
        public int MaNguoiDung { get; set; }
        public string TenDangNhap { get; set; }
        public string MatKhauHash { get; set; }
        public string MatKhauSalt { get; set; }
        public string MatKhau { get; set; }
        public string HoTen { get; set; }
        public string Email { get; set; }
        public string DienThoai { get; set; }
        public string DiaChi { get; set; }
        public string VaiTro { get; set; }
        public bool LaAdmin { get; set; }
        public DateTime NgayTao { get; set; }
    }
}
