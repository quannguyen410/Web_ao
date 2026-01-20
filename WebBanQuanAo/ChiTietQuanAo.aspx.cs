using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebBanQuanAo.Models;

namespace WebBanQuanAo
{
    public partial class Detail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btAddToCart_Click(object sender, EventArgs e)
        {
            int maquanao = int.Parse(((Button)sender).CommandArgument);
            //xu ly them san pham vao Gio
            Cart cart = null;
            if (Session["CART"] == null) //neu nguoi dung chua duoc cap gio hang
            {
                cart = new Cart(); //1.tao gio hang
                Session["CART"] = cart;
            } else //da cap gio hang roi
            {
                cart =(Cart)Session["CART"];
            }          
            //2.truy xuat CSDL de doc thong tin san pham
            QuanAo qa = QuanAoDAO.layQuanAoTheoMa(maquanao);
            //tao 1 phan tu cua gio hang
            CartItem item = new CartItem { Id = qa.MaQuanAo, Name = qa.TenQuanAo, Picture = qa.AnhQuanAo, Price = qa.DonGia, Quantity = 1 };
            cart.AddItem(item);//3.them phan tu vao gio

            //Response.Write($"<script> alert('Tong mat hang {cart.Items.Count} -  Tong so luong {cart.SumQuantity} - Tong tien: {cart.Total}') </script>");
            Response.Redirect("/GioHang.aspx");

        }
    }
}