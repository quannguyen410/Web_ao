using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebBanQuanAo.Models;

namespace WebBanQuanAo
{
    public partial class Customer : System.Web.UI.MasterPage
    {
        protected int CartQuantity { get; private set; }
        protected bool IsAdmin { get; private set; }
        protected bool IsAuthenticated { get; private set; }
        protected bool IsAdminArea { get; private set; }
        protected string UserDisplayName { get; private set; }
        protected string AccountUrl { get; private set; }
        protected string AccountTitle { get; private set; }

        protected string AdminNavLinkClass(string appRelativePath)
        {
            string current = Request != null ? (Request.AppRelativeCurrentExecutionFilePath ?? "") : "";
            bool active = current.Equals(appRelativePath, StringComparison.OrdinalIgnoreCase);
            return active ? "nav-link active" : "nav-link";
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            string appRelativePath = Request != null ? (Request.AppRelativeCurrentExecutionFilePath ?? "") : "";
            IsAdminArea = appRelativePath.StartsWith("~/Admin/", StringComparison.OrdinalIgnoreCase);

            bool isAuth = Context != null && Context.User != null && Context.User.Identity != null && Context.User.Identity.IsAuthenticated;
            IsAuthenticated = isAuth;
            UserDisplayName = "";
            if (isAuth && Context.User != null && Context.User.Identity != null)
            {
                string tenDangNhap = Context.User.Identity.Name ?? "";
                var nd = NguoiDungDAO.LayThongTinTheoTenDangNhap(tenDangNhap);
                UserDisplayName = nd != null && !string.IsNullOrWhiteSpace(nd.HoTen) ? nd.HoTen : tenDangNhap;
            }

            if (liDangNhap != null) liDangNhap.Visible = !isAuth;
            if (liDangKy != null) liDangKy.Visible = !isAuth;
            if (liDangXuat != null) liDangXuat.Visible = isAuth;

            IsAdmin = isAuth && Context.User.IsInRole("Admin");
            if (liAdmin != null) liAdmin.Visible = IsAdmin;

            AccountUrl = isAuth ? "/DangXuat.aspx" : "/DangNhap.aspx";
            AccountTitle = isAuth ? "Đăng xuất" : "Đăng nhập";

            CartQuantity = 0;
            var cart = Session["CART"] as Cart;
            if (cart != null)
            {
                CartQuantity = (int)cart.SumQuantity;
            }
        }

        protected void btnTimKiem_Click(object sender, EventArgs e)
        {
            string keyword = txtTimKiem.Text.Trim();
            if (!string.IsNullOrEmpty(keyword))
            {
                Response.Redirect("/DanhSachQuanAo.aspx?search=" + Server.UrlEncode(keyword));
            }
        }
    }
}