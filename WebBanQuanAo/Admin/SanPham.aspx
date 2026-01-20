<%@ Page Title="Quản trị - Sản phẩm" Language="C#" MasterPageFile="~/Customer.Master" AutoEventWireup="true" CodeBehind="SanPham.aspx.cs" Inherits="WebBanQuanAo.Admin.SanPham" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Noidung" runat="server">
    <div class="d-flex align-items-start justify-content-between mb-3">
        <div>
            <div class="page-title">Sản phẩm</div>
            <div class="text-muted">Quản lý sản phẩm (quần áo)</div>
        </div>
    </div>

    <div class="card subtle-card mb-3">
        <div class="card-body p-0">
            <asp:GridView ID="gvSanPham" runat="server" DataSourceID="dsSanPham" AutoGenerateColumns="False" DataKeyNames="MaQuanAo"
                CssClass="table table-hover mb-0" AllowPaging="true" PageSize="10">
                <Columns>
                    <asp:BoundField DataField="MaQuanAo" HeaderText="Mã" ReadOnly="True" />
                    <asp:BoundField DataField="TenQuanAo" HeaderText="Tên" />
                    <asp:BoundField DataField="DonGia" HeaderText="Giá" DataFormatString="{0:#,##0}" />
                    <asp:BoundField DataField="SoLuong" HeaderText="Số lượng" />
                    <asp:BoundField DataField="AnhQuanAo" HeaderText="Ảnh" />
                    <asp:BoundField DataField="MaDanhMuc" HeaderText="Mã danh mục" />
                    <asp:BoundField DataField="MaThuongHieu" HeaderText="Mã thương hiệu" />
                    <asp:BoundField DataField="MoTa" HeaderText="Mô tả" />
                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
        </div>
    </div>

    <div class="card mt-3">
        <div class="card-header">Thêm sản phẩm</div>
        <div class="card-body">
            <div class="row g-3">
                <div class="col-12 col-md-6">
                    <label>Tên</label>
                    <asp:TextBox ID="txtTen" runat="server" CssClass="form-control" />
                </div>
                <div class="col-12 col-md-3">
                    <label>Giá</label>
                    <asp:TextBox ID="txtGia" runat="server" CssClass="form-control" />
                </div>
                <div class="col-12 col-md-3">
                    <label>Số lượng</label>
                    <asp:TextBox ID="txtSoLuong" runat="server" CssClass="form-control" />
                </div>
            </div>

            <div class="row g-3 mt-0">
                <div class="col-12 col-md-4">
                    <label>Ảnh (ví dụ: img/ao.jpg)</label>
                    <asp:TextBox ID="txtAnh" runat="server" CssClass="form-control" />
                </div>
                <div class="col-12 col-md-4">
                    <label>Danh mục</label>
                    <asp:DropDownList ID="ddlDanhMuc" runat="server" CssClass="form-control" DataSourceID="dsDanhMuc"
                        DataTextField="TenDanhMuc" DataValueField="MaDanhMuc"></asp:DropDownList>
                </div>
                <div class="col-12 col-md-4">
                    <label>Thương hiệu</label>
                    <asp:DropDownList ID="ddlThuongHieu" runat="server" CssClass="form-control" DataSourceID="dsThuongHieu"
                        DataTextField="TenThuongHieu" DataValueField="MaThuongHieu"></asp:DropDownList>
                </div>
            </div>

            <div class="mt-3">
                <label>Mô tả</label>
                <asp:TextBox ID="txtMoTa" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" />
            </div>

            <div class="mt-3">
                <asp:Button ID="btnThem" runat="server" CssClass="btn btn-success" Text="Thêm" OnClick="btnThem_Click" />
                <asp:Literal ID="litMsg" runat="server"></asp:Literal>
            </div>
        </div>
    </div>

    <asp:SqlDataSource ID="dsSanPham" runat="server"
        ConnectionString="<%$ ConnectionStrings:QuanAoDBConStr %>"
        SelectCommand="SELECT MaQuanAo, TenQuanAo, DonGia, SoLuong, AnhQuanAo, MaDanhMuc, MaThuongHieu, MoTa FROM QuanAo ORDER BY MaQuanAo DESC"
        UpdateCommand="UPDATE QuanAo SET TenQuanAo=@TenQuanAo, DonGia=@DonGia, SoLuong=@SoLuong, AnhQuanAo=@AnhQuanAo, MaDanhMuc=@MaDanhMuc, MaThuongHieu=@MaThuongHieu, MoTa=@MoTa WHERE MaQuanAo=@MaQuanAo"
        DeleteCommand="DELETE FROM QuanAo WHERE MaQuanAo=@MaQuanAo"
        InsertCommand="INSERT INTO QuanAo(MaQuanAo, TenQuanAo, DonGia, SoLuong, AnhQuanAo, MaDanhMuc, MaThuongHieu, MoTa) VALUES (@MaQuanAo, @TenQuanAo, @DonGia, @SoLuong, @AnhQuanAo, @MaDanhMuc, @MaThuongHieu, @MoTa)">
        <UpdateParameters>
            <asp:Parameter Name="TenQuanAo" Type="String" />
            <asp:Parameter Name="DonGia" Type="Double" />
            <asp:Parameter Name="SoLuong" Type="Int32" />
            <asp:Parameter Name="AnhQuanAo" Type="String" />
            <asp:Parameter Name="MaDanhMuc" Type="Int32" />
            <asp:Parameter Name="MaThuongHieu" Type="Int32" />
            <asp:Parameter Name="MoTa" Type="String" />
            <asp:Parameter Name="MaQuanAo" Type="Int32" />
        </UpdateParameters>
        <DeleteParameters>
            <asp:Parameter Name="MaQuanAo" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="MaQuanAo" Type="Int32" />
            <asp:Parameter Name="TenQuanAo" Type="String" />
            <asp:Parameter Name="DonGia" Type="Double" />
            <asp:Parameter Name="SoLuong" Type="Int32" />
            <asp:Parameter Name="AnhQuanAo" Type="String" />
            <asp:Parameter Name="MaDanhMuc" Type="Int32" />
            <asp:Parameter Name="MaThuongHieu" Type="Int32" />
            <asp:Parameter Name="MoTa" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="dsDanhMuc" runat="server"
        ConnectionString="<%$ ConnectionStrings:QuanAoDBConStr %>"
        SelectCommand="SELECT MaDanhMuc, TenDanhMuc FROM DanhMuc ORDER BY TenDanhMuc">
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="dsThuongHieu" runat="server"
        ConnectionString="<%$ ConnectionStrings:QuanAoDBConStr %>"
        SelectCommand="SELECT MaThuongHieu, TenThuongHieu FROM ThuongHieu ORDER BY TenThuongHieu">
    </asp:SqlDataSource>
</asp:Content>
