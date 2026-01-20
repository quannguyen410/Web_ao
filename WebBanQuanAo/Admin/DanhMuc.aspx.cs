using System;

namespace WebBanQuanAo.Admin
{
    public partial class DanhMuc : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            string ten = (txtTenDanhMuc.Text ?? "").Trim();
            if (string.IsNullOrWhiteSpace(ten))
            {
                litMsg.Text = "<div class='alert alert-warning mt-2'>Vui lòng nhập tên danh mục</div>";
                return;
            }

            int ma = (int)(DateTime.Now.Ticks % int.MaxValue);
            dsDanhMuc.InsertParameters["MaDanhMuc"].DefaultValue = ma.ToString();
            dsDanhMuc.InsertParameters["TenDanhMuc"].DefaultValue = ten;
            dsDanhMuc.Insert();
            txtTenDanhMuc.Text = "";
            litMsg.Text = "<div class='alert alert-success mt-2'>✅ Đã thêm danh mục thành công!</div>";
            gvDanhMuc.DataBind();
        }
    }
}
