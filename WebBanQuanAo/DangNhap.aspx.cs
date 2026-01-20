using System;
using System.Web;
using System.Web.Security;
using WebBanQuanAo.Models;

namespace WebBanQuanAo
{
    public partial class DangNhap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (User != null && User.Identity != null && User.Identity.IsAuthenticated)
            {
                Response.Redirect("/TrangChu.aspx");
                return;
            }

            if (!IsPostBack)
            {
                NguoiDungDAO.EnsureSchema();
            }

            if (Request.HttpMethod == "POST")
            {
                string tenDangNhap = (Request.Form["TenDangNhap"] ?? "").Trim();
                string matKhau = Request.Form["MatKhau"] ?? "";

                NguoiDung nd = NguoiDungDAO.DangNhap(tenDangNhap, matKhau);
                if (nd == null)
                {
                    litMessage.Text = "<div class='alert alert-danger mt-3'>Sai tài khoản hoặc mật khẩu</div>";
                    return;
                }

                DateTime expiration = DateTime.Now.AddHours(8);
                FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(
                    1,
                    nd.TenDangNhap,
                    DateTime.Now,
                    expiration,
                    false,
                    nd.VaiTro,
                    FormsAuthentication.FormsCookiePath
                );

                string enc = FormsAuthentication.Encrypt(ticket);
                HttpCookie cookie = new HttpCookie(FormsAuthentication.FormsCookieName, enc)
                {
                    HttpOnly = true,
                    Expires = expiration
                };

                Response.Cookies.Add(cookie);

                string returnUrl = Request.QueryString["ReturnUrl"];
                if (!string.IsNullOrWhiteSpace(returnUrl))
                {
                    Response.Redirect(returnUrl);
                }

                Response.Redirect("/TrangChu.aspx");
            }
        }
    }
}
