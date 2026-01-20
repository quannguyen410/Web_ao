using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBanQuanAo
{
    public partial class ThanhToanThanhCong : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["madh"] != null)
                {
                    lbMaDonHang.Text = Request.QueryString["madh"];
                }
                else
                {
                    Response.Redirect("TrangChu.aspx");
                }
            }
        }
    }
}

