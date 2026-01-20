using System;

namespace WebBanQuanAo.Admin
{
    public partial class ThuongHieu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            string ten = (txtTenThuongHieu.Text ?? "").Trim();
            if (string.IsNullOrWhiteSpace(ten))
            {
                litMsg.Text = "<div class='alert alert-warning mt-2'>Vui lòng nhập tên thương hiệu</div>";
                return;
            }

            int ma = (int)(DateTime.Now.Ticks % int.MaxValue);
            dsThuongHieu.InsertParameters["MaThuongHieu"].DefaultValue = ma.ToString();
            dsThuongHieu.InsertParameters["TenThuongHieu"].DefaultValue = ten;
            dsThuongHieu.Insert();
            txtTenThuongHieu.Text = "";
            litMsg.Text = "<div class='alert alert-success mt-2'>✅ Đã thêm thương hiệu thành công!</div>";
            gvThuongHieu.DataBind();
        }
    }
}
