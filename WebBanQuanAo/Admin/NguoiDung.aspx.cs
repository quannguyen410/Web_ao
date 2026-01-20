using System;
using WebBanQuanAo.Models;

namespace WebBanQuanAo.Admin
{
    public partial class NguoiDung : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                NguoiDungDAO.EnsureSchema();
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            string ten = (txtTenDangNhap.Text ?? "").Trim();
            string mk = txtMatKhauMoi.Text ?? "";

            if (string.IsNullOrWhiteSpace(ten) || string.IsNullOrWhiteSpace(mk))
            {
                litMsg.Text = "<div class='alert alert-warning mt-2'>Vui lòng nhập tên đăng nhập và mật khẩu mới</div>";
                return;
            }

            bool ok = NguoiDungDAO.ResetMatKhauTheoTenDangNhap(ten, mk);
            if (!ok)
            {
                litMsg.Text = "<div class='alert alert-danger mt-2'>Không tìm thấy người dùng hoặc reset thất bại</div>";
                return;
            }

            txtTenDangNhap.Text = "";
            txtMatKhauMoi.Text = "";
            litMsg.Text = "<div class='alert alert-success mt-2'>✅ Đã reset mật khẩu thành công!</div>";
        }
    }
}
