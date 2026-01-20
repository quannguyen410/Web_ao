<%@ Page Title="" Language="C#" MasterPageFile="~/Customer.Master" AutoEventWireup="true" CodeBehind="DanhSachQuanAo.aspx.cs" Inherits="WebBanQuanAo.Product" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Noidung" runat="server">
     <div class="d-flex align-items-center justify-content-between mb-3">
         <div class="page-title">Sản phẩm <asp:Label ID="lbTieuDe" runat="server" Text="Tiêu đề tên loại" Font-Bold="true"></asp:Label></div>
     </div>

      <div class="row g-3">
             <asp:Repeater ID="rptQuanAo" runat="server">
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

    <div class="d-flex justify-content-center align-items-center gap-2 py-3">
        <asp:Button ID="lnkPrev" runat="server"
            Text="Trước" OnClick="lnkPrev_Click" CssClass="btn btn-outline-dark" /> 
          <asp:Label ID="lblPage" CssClass="px-2" runat="server" />
        <asp:Button ID="lnkNext" runat="server"
            Text="Sau" OnClick="lnkNext_Click" CssClass="btn btn-outline-dark" />
    </div>
     

    <asp:SqlDataSource ID="dsQuanAo" runat="server"
        ConnectionString="<%$ ConnectionStrings:QuanAoDBConStr %>"
        SelectCommand="SELECT MaQuanAo, TenQuanAo, AnhQuanAo, DonGia, SoLuong, MaDanhMuc, MaThuongHieu FROM [QuanAo] WHERE ([MaDanhMuc] = @MaDanhMuc) ORDER BY MaQuanAo DESC">
        <SelectParameters>
            <asp:QueryStringParameter Name="MaDanhMuc" QueryStringField="madm" Type="Int32" DefaultValue="1" />
        </SelectParameters>
     </asp:SqlDataSource>

    <asp:SqlDataSource ID="dsDanhMuc" runat="server"
        ConnectionString="<%$ ConnectionStrings:QuanAoDBConStr %>"
        SelectCommand="SELECT [TenDanhMuc] FROM [DanhMuc] WHERE ([MaDanhMuc] = @MaDanhMuc)">
        <SelectParameters>
            <asp:QueryStringParameter Name="MaDanhMuc" QueryStringField="madm" DefaultValue="1" Type="Int32" />
        </SelectParameters>
     </asp:SqlDataSource>
</asp:Content>
