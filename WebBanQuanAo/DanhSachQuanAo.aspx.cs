using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBanQuanAo
{
    public partial class Product : System.Web.UI.Page
    {
        int pageSize = 6;
        int CurrentPage
        {
            get
            {
                return ViewState["CurrentPage"] == null ? 1 : (int)ViewState["CurrentPage"];
            }
            set
            {
                ViewState["CurrentPage"] = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                // Kiểm tra nếu có tham số tìm kiếm
                if (!string.IsNullOrEmpty(Request.QueryString["search"]))
                {
                    string keyword = Request.QueryString["search"];
                    lbTieuDe.Text = "Kết quả tìm kiếm: \"" + keyword + "\"";
                    dsQuanAo.SelectCommand = "SELECT MaQuanAo, TenQuanAo, DonGia, SoLuong, AnhQuanAo, MaDanhMuc, MaThuongHieu FROM QuanAo WHERE TenQuanAo LIKE N'%" + keyword.Replace("'", "''") + "%' ORDER BY MaQuanAo DESC";
                }
                else if (!string.IsNullOrEmpty(Request.QueryString["madm"]))
                {
                    DataView dv = (DataView)dsDanhMuc.Select(DataSourceSelectArguments.Empty);
                    if (dv != null && dv.Count > 0)
                    {
                        lbTieuDe.Text = dv[0].Row["TenDanhMuc"].ToString();
                    }
                    else
                    {
                        lbTieuDe.Text = "Tất cả sản phẩm";
                        dsQuanAo.SelectCommand = "SELECT MaQuanAo, TenQuanAo, AnhQuanAo, DonGia, SoLuong, MaDanhMuc, MaThuongHieu FROM [QuanAo] ORDER BY MaQuanAo DESC";
                    }
                }
                else
                {
                    lbTieuDe.Text = "Tất cả sản phẩm";
                    dsQuanAo.SelectCommand = "SELECT MaQuanAo, TenQuanAo, AnhQuanAo, DonGia, SoLuong, MaDanhMuc, MaThuongHieu FROM [QuanAo] ORDER BY MaQuanAo DESC";
                }
               LoadData();  //load san pham co phan trang
            }
        }
        void LoadData()
        {
            DataView dv = (DataView)dsQuanAo.Select(DataSourceSelectArguments.Empty);

            PagedDataSource pds = new PagedDataSource();
            pds.DataSource = dv;
            pds.AllowPaging = true;
            pds.PageSize = pageSize;
            pds.CurrentPageIndex = CurrentPage-1;

            rptQuanAo.DataSource = pds;
            rptQuanAo.DataBind();

            lblPage.Text = $"Trang {CurrentPage} / {pds.PageCount}";

            lnkPrev.Enabled = !pds.IsFirstPage;
            lnkNext.Enabled = !pds.IsLastPage;
        }

        protected void lnkPrev_Click(object sender, EventArgs e)
        {
            CurrentPage--;
            LoadData();
        }

        protected void lnkNext_Click(object sender, EventArgs e)
        {
            CurrentPage++;
            LoadData();
        }
    }
}