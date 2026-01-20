using System;
using WebBanQuanAo.Models;

namespace WebBanQuanAo
{
    public partial class DangKy : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                NguoiDungDAO.EnsureSchema();
            }

            if (Request.HttpMethod == "POST")
            {
                string tenDangNhap = (Request.Form["TenDangNhap"] ?? "").Trim();
                string matKhau = Request.Form["MatKhau"] ?? "";
                string nhapLai = Request.Form["NhapLaiMatKhau"] ?? "";
                string hoTen = (Request.Form["HoTen"] ?? "").Trim();
                string email = (Request.Form["Email"] ?? "").Trim();
                string dienThoai = (Request.Form["DienThoai"] ?? "").Trim();
                string diaChi = (Request.Form["DiaChi"] ?? "").Trim();

                if (string.IsNullOrWhiteSpace(hoTen)
                    || string.IsNullOrWhiteSpace(dienThoai)
                    || string.IsNullOrWhiteSpace(diaChi)
                    || string.IsNullOrWhiteSpace(tenDangNhap)
                    || string.IsNullOrWhiteSpace(matKhau))
                {
                    litMessage.Text = "<div class='alert alert-warning mt-3'>Vui lòng nhập đầy đủ thông tin</div>";
                    return;
                }

                if (matKhau != nhapLai)
                {
                    litMessage.Text = "<div class='alert alert-warning mt-3'>Mật khẩu nhập lại không khớp</div>";
                    return;
                }

                bool ok = NguoiDungDAO.DangKy(tenDangNhap, matKhau, hoTen, email, dienThoai, diaChi);
                if (!ok)
                {
                    litMessage.Text = "<div class='alert alert-danger mt-3'>Tên đăng nhập đã tồn tại hoặc không hợp lệ</div>";
                    return;
                }

                Response.Redirect("/DangNhap.aspx");
            }
        }
    }
}
