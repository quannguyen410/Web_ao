<%@ Page Title="Quản trị - Người dùng" Language="C#" MasterPageFile="~/Customer.Master" AutoEventWireup="true" CodeBehind="NguoiDung.aspx.cs" Inherits="WebBanQuanAo.Admin.NguoiDung" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Noidung" runat="server">
    <div class="d-flex align-items-start justify-content-between mb-3">
        <div>
            <div class="page-title">Người dùng</div>
            <div class="text-muted">Quản lý tài khoản và phân quyền</div>
        </div>
    </div>

    <div class="card subtle-card mb-3">
        <div class="card-body p-0">
            <asp:GridView ID="gvNguoiDung" runat="server" DataSourceID="dsNguoiDung" AutoGenerateColumns="False" DataKeyNames="MaNguoiDung"
                CssClass="table table-hover mb-0" AllowPaging="true" PageSize="10">
                <Columns>
                    <asp:BoundField DataField="MaNguoiDung" HeaderText="Mã" ReadOnly="True" />
                    <asp:BoundField DataField="TenDangNhap" HeaderText="Tên đăng nhập" ReadOnly="True" />
                    <asp:BoundField DataField="HoTen" HeaderText="Họ tên" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:BoundField DataField="DienThoai" HeaderText="Điện thoại" />
                    <asp:CheckBoxField DataField="LaAdmin" HeaderText="Admin" />
                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
        </div>
    </div>

    <div class="card mt-3">
        <div class="card-header">Reset mật khẩu</div>
        <div class="card-body">
            <div class="row g-3">
                <div class="col-12 col-md-6">
                    <label>Tên đăng nhập</label>
                    <asp:TextBox ID="txtTenDangNhap" runat="server" CssClass="form-control" />
                </div>
                <div class="col-12 col-md-6">
                    <label>Mật khẩu mới</label>
                    <asp:TextBox ID="txtMatKhauMoi" runat="server" CssClass="form-control" TextMode="Password" />
                </div>
            </div>
            <div class="mt-3">
                <asp:Button ID="btnReset" runat="server" CssClass="btn btn-warning" Text="Reset" OnClick="btnReset_Click" />
                <asp:Literal ID="litMsg" runat="server"></asp:Literal>
            </div>
        </div>
    </div>

    <asp:SqlDataSource ID="dsNguoiDung" runat="server"
        ConnectionString="<%$ ConnectionStrings:QuanAoDBConStr %>"
        SelectCommand="SELECT MaNguoiDung, TenDangNhap, HoTen, Email, DienThoai, LaAdmin FROM NguoiDung ORDER BY MaNguoiDung DESC"
        UpdateCommand="UPDATE NguoiDung SET HoTen=@HoTen, Email=@Email, DienThoai=@DienThoai, LaAdmin=@LaAdmin WHERE MaNguoiDung=@MaNguoiDung"
        DeleteCommand="DELETE FROM NguoiDung WHERE MaNguoiDung=@MaNguoiDung AND TenDangNhap <> N'admin'">
        <UpdateParameters>
            <asp:Parameter Name="HoTen" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="DienThoai" Type="String" />
            <asp:Parameter Name="LaAdmin" Type="Boolean" />
            <asp:Parameter Name="MaNguoiDung" Type="Int32" />
        </UpdateParameters>
        <DeleteParameters>
            <asp:Parameter Name="MaNguoiDung" Type="Int32" />
        </DeleteParameters>
    </asp:SqlDataSource>
</asp:Content>
