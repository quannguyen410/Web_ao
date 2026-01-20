<%@ Page Title="" Language="C#" MasterPageFile="~/Customer.Master" AutoEventWireup="true" CodeBehind="ChiTietQuanAo.aspx.cs" Inherits="WebBanQuanAo.Detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Noidung" runat="server">
    <div class="card subtle-card overflow-hidden">
        <div class="card-body p-4">
            <asp:Repeater ID="rptChiTietQuanAo" runat="server" DataSourceID="dsChiTietQuanAo">
                <ItemTemplate>
                    <div class="row g-4 align-items-start">
                        <div class="col-md-5">
                            <div class="ratio ratio-1x1 rounded-3 overflow-hidden bg-light">
                                <img src="<%# Eval("AnhQuanAo") %>" class="w-100 h-100 object-fit-cover" alt="Sản phẩm" />
                            </div>
                        </div>
                        <div class="col-md-7">
                            <div class="page-title mb-2"><%# Eval("TenQuanAo") %></div>
                            <div class="h4 text-danger mb-3"><%# Eval("DonGia","{0:#,##0} đồng") %></div>
                            <div class="d-flex flex-wrap gap-2 mb-3">
                                <span class="badge text-bg-light border">Danh mục: <%# Eval("TenDanhMuc") %></span>
                                <span class="badge text-bg-light border">Thương hiệu: <%# Eval("TenThuongHieu") %></span>
                            </div>
                            <div class="text-muted mb-4"><%# Eval("MoTa") %></div>
                            <asp:Button ID="btAddToCart" runat="server" CommandArgument='<%# Eval("MaQuanAo") %>' OnClick="btAddToCart_Click" Text="Thêm vào giỏ" CssClass="btn btn-dark btn-lg" />
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
    <!---hien thi cac sach cung chu de-->
    <div class="d-flex align-items-center justify-content-between mt-4 mb-2">
        <div class="page-title">Sản phẩm liên quan</div>
    </div>
    <div class="row g-3">
        <asp:Repeater ID="rptQuanAoLienQuan" runat="server" DataSourceID="dsQuanAoLienQuan">
            <ItemTemplate>
                <div class="col-6 col-md-3 col-lg-2">
                    <div class="card product-card subtle-card h-100 overflow-hidden">
                        <a href="/ChiTietQuanAo.aspx?maquanao=<%# Eval("MaQuanAo") %>&madm=<%# Eval("MaDanhMuc") %>" class="text-decoration-none">
                            <img src="<%# Eval("AnhQuanAo") %>" class="product-thumb" alt="Sản phẩm" />
                        </a>
                        <div class="card-body">
                            <div class="product-name mb-2"><%# Eval("TenQuanAo") %></div>
                            <div class="d-flex align-items-center justify-content-between">
                                <div class="product-price"><%# Eval("DonGia","{0:#,##0} đồng") %></div>
                            </div>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <asp:SqlDataSource ID="dsChiTietQuanAo" runat="server"
        ConnectionString="<%$ ConnectionStrings:QuanAoDBConStr %>" SelectCommand="SELECT qa.MaQuanAo, qa.TenQuanAo, qa.AnhQuanAo, qa.DonGia, qa.SoLuong, qa.MoTa, qa.MaDanhMuc, qa.MaThuongHieu,
dm.TenDanhMuc, th.TenThuongHieu
FROM QuanAo qa
INNER JOIN DanhMuc dm ON dm.MaDanhMuc = qa.MaDanhMuc
INNER JOIN ThuongHieu th ON th.MaThuongHieu = qa.MaThuongHieu
WHERE (qa.MaQuanAo = @MaQuanAo)">
        <SelectParameters>
            <asp:QueryStringParameter Name="MaQuanAo" QueryStringField="maquanao" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="dsQuanAoLienQuan" runat="server"
        ConnectionString="<%$ ConnectionStrings:QuanAoDBConStr %>"
        SelectCommand="SELECT top 5 MaQuanAo, TenQuanAo, AnhQuanAo, DonGia, SoLuong, MaDanhMuc, MaThuongHieu FROM [QuanAo] WHERE (([MaDanhMuc] = @MaDanhMuc) AND ([MaQuanAo] != @MaQuanAo)) ORDER BY MaQuanAo DESC">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="1" Name="MaDanhMuc" QueryStringField="madm" Type="Int32" />
            <asp:QueryStringParameter DefaultValue="" Name="MaQuanAo" QueryStringField="maquanao" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
