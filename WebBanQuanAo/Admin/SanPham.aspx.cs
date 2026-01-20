using System;

namespace WebBanQuanAo.Admin
{
    public partial class SanPham : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            string ten = (txtTen.Text ?? "").Trim();
            string anh = (txtAnh.Text ?? "").Trim();
            string mota = (txtMoTa.Text ?? "").Trim();

            if (string.IsNullOrWhiteSpace(ten))
            {
                litMsg.Text = "<div class='alert alert-warning mt-2'>Vui lòng nhập tên sản phẩm</div>";
                return;
            }

            if (!double.TryParse(txtGia.Text, out double gia))
            {
                litMsg.Text = "<div class='alert alert-warning mt-2'>Giá không hợp lệ</div>";
                return;
            }

            if (!int.TryParse(txtSoLuong.Text, out int soLuong))
            {
                litMsg.Text = "<div class='alert alert-warning mt-2'>Số lượng không hợp lệ</div>";
                return;
            }

            int maDanhMuc = int.Parse(ddlDanhMuc.SelectedValue);
            int maThuongHieu = int.Parse(ddlThuongHieu.SelectedValue);

            int maQuanAo = (int)(DateTime.Now.Ticks % int.MaxValue);
            dsSanPham.InsertParameters["MaQuanAo"].DefaultValue = maQuanAo.ToString();
            dsSanPham.InsertParameters["TenQuanAo"].DefaultValue = ten;
            dsSanPham.InsertParameters["DonGia"].DefaultValue = gia.ToString();
            dsSanPham.InsertParameters["SoLuong"].DefaultValue = soLuong.ToString();
            dsSanPham.InsertParameters["AnhQuanAo"].DefaultValue = anh;
            dsSanPham.InsertParameters["MaDanhMuc"].DefaultValue = maDanhMuc.ToString();
            dsSanPham.InsertParameters["MaThuongHieu"].DefaultValue = maThuongHieu.ToString();
            dsSanPham.InsertParameters["MoTa"].DefaultValue = mota;

            dsSanPham.Insert();

            txtTen.Text = "";
            txtGia.Text = "";
            txtSoLuong.Text = "";
            txtAnh.Text = "";
            txtMoTa.Text = "";
            litMsg.Text = "<div class='alert alert-success mt-2'>✅ Đã thêm sản phẩm thành công!</div>";
            gvSanPham.DataBind();
        }
    }
}
