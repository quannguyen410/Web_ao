<%@ Page Title="" Language="C#" MasterPageFile="~/Customer.Master" AutoEventWireup="true" CodeBehind="TrangChu.aspx.cs" Inherits="WebBanQuanAo.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Noidung" runat="server">
       <div class="d-flex align-items-center justify-content-between mb-3">
           <div class="page-title">Sản phẩm mới</div>
       </div>

       <!--su dung dieu khien Repeater-->
            <div class="row g-3">
             <asp:Repeater ID="rptQuanAoMoi" runat="server" DataSourceID="dsQuanAo">
                 <ItemTemplate>
                     <div class="col-6 col-md-3">
                         <div class="card product-card subtle-card h-100 overflow-hidden">
                             <a href="/ChiTietQuanAo.aspx?maquanao=<%# Eval("MaQuanAo") %>&madm=<%# Eval("MaDanhMuc") %>" class="text-decoration-none">
                                 <img src="<%# Eval("AnhQuanAo") %>" class="product-thumb" alt="Sản phẩm" />
                             </a>
                             <div class="card-body">
                                 <div class="product-name mb-2"><%# Eval("TenQuanAo") %></div>
                                 <div class="d-flex align-items-center justify-content-between">
                                     <div class="product-price"><%# Eval("DonGia","{0:#,##0} đồng") %></div>
                                     <a href="/ChiTietQuanAo.aspx?maquanao=<%# Eval("MaQuanAo") %>&madm=<%# Eval("MaDanhMuc") %>" class="btn btn-sm btn-dark">Chi tiết</a>
                                 </div>
                             </div>
                         </div>
                     </div>
                 </ItemTemplate>                  
             </asp:Repeater>
           </div>   


    <asp:SqlDataSource ID="dsQuanAo" runat="server"
        ConnectionString="<%$ ConnectionStrings:QuanAoDBConStr %>"
        SelectCommand="SELECT top 12 MaQuanAo, TenQuanAo, AnhQuanAo, DonGia, SoLuong, MaDanhMuc, MaThuongHieu FROM [QuanAo] ORDER BY MaQuanAo DESC"></asp:SqlDataSource>

</asp:Content>
