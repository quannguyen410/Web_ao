using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebBanQuanAo.Models
{
    public class QuanAo
    {
        public int MaQuanAo { set; get; }
        public string TenQuanAo { set; get; }
        public string AnhQuanAo { set; get; }
        public double DonGia { set; get; }
        public int SoLuong { set; get; }
    }
}