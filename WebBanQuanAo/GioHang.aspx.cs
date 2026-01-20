using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebBanQuanAo.Models;

namespace WebBanQuanAo
{
    public partial class ViewCart : System.Web.UI.Page
    {
        private Cart GetCart()
        {
            if (Session["CART"] == null)
            {
                Session["CART"] = new Cart();
            }

            return (Cart)Session["CART"];
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Cart cart = GetCart();
                gvGioHang.DataSource = cart.Items;
                gvGioHang.DataBind();
                lbTongTien.Text = "Tổng thành tiền: <b>" + cart.Total.ToString("#,##0 đồng") + "</b>";
            }
        }

        protected void btXoa_Click(object sender, EventArgs e)
        {
            int id = int.Parse(((Button)sender).CommandArgument); //lay ma san pham
            //Response.Write($"<script> alert('{id}') </script>");
            Cart cart = GetCart(); //lay gio hang trong Session
            cart.DeleteItem(id); //goi phuong thuc xoa san pham khoi gio hang
            //nap lai du lieu gridView
            gvGioHang.DataSource = cart.Items;
            gvGioHang.DataBind();
            lbTongTien.Text = "Tổng thành tiền: <b>" + cart.Total.ToString("#,##0 đồng") + "</b>";
        }

        protected void btTraToanBo_Click(object sender, EventArgs e)
        {
            Cart cart = GetCart(); //lay gio hang trong Session
            cart.Items.Clear();
            BindData(cart);

        }

        private void BindData(Cart cart)
        {
            gvGioHang.DataSource = cart.Items;
            gvGioHang.DataBind();
            lbTongTien.Text = "Tổng thành tiền: <b>" + cart.Total.ToString("#,##0 đồng") + "</b>";
        }

        protected void gvGioHang_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //lay ma san pham cua dong (id)
            int id = int.Parse(gvGioHang.DataKeys[e.RowIndex].Value.ToString());
            //lay so luong moi
            int soluong = int.Parse(((TextBox)gvGioHang.Rows[e.RowIndex].FindControl("txtSoLuong")).Text);
            Cart cart = GetCart(); //lay gio hang trong Session
            cart.UpdateQuantity(id, soluong); //goi phuong thuc cap nhat so luong
            BindData(cart);
        }
    }
}