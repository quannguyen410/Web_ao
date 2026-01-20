using System;
using System.Web.Security;

namespace WebBanQuanAo
{
    public partial class DangXuat : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect("TrangChu.aspx");
        }
    }
}
