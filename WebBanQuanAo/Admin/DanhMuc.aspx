<%@ Page Title="Quản trị - Danh mục" Language="C#" MasterPageFile="~/Customer.Master" AutoEventWireup="true" CodeBehind="DanhMuc.aspx.cs" Inherits="WebBanQuanAo.Admin.DanhMuc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Noidung" runat="server">
    <div class="d-flex align-items-start justify-content-between mb-3">
        <div>
            <div class="page-title">Danh mục</div>
            <div class="text-muted">Quản lý danh mục sản phẩm</div>
        </div>
    </div>

    <div class="card subtle-card mb-3">
        <div class="card-body p-0">
            <asp:GridView ID="gvDanhMuc" runat="server" DataSourceID="dsDanhMuc" AutoGenerateColumns="False" DataKeyNames="MaDanhMuc"
                CssClass="table table-hover mb-0" AllowPaging="true" PageSize="10">
                <Columns>
                    <asp:BoundField DataField="MaDanhMuc" HeaderText="Mã" ReadOnly="True" />
                    <asp:BoundField DataField="TenDanhMuc" HeaderText="Tên danh mục" />
                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
        </div>
    </div>

    <div class="card mt-3">
        <div class="card-header">Thêm danh mục</div>
        <div class="card-body">
            <div class="mb-3">
                <label>Tên danh mục</label>
                <asp:TextBox ID="txtTenDanhMuc" CssClass="form-control" runat="server" />
            </div>
            <asp:Button ID="btnThem" runat="server" CssClass="btn btn-success" Text="Thêm" OnClick="btnThem_Click" />
            <asp:Literal ID="litMsg" runat="server"></asp:Literal>
        </div>
    </div>

    <asp:SqlDataSource ID="dsDanhMuc" runat="server"
        ConnectionString="<%$ ConnectionStrings:QuanAoDBConStr %>"
        SelectCommand="SELECT MaDanhMuc, TenDanhMuc FROM DanhMuc ORDER BY MaDanhMuc DESC"
        UpdateCommand="UPDATE DanhMuc SET TenDanhMuc=@TenDanhMuc WHERE MaDanhMuc=@MaDanhMuc"
        DeleteCommand="DELETE FROM DanhMuc WHERE MaDanhMuc=@MaDanhMuc"
        InsertCommand="INSERT INTO DanhMuc(MaDanhMuc, TenDanhMuc) VALUES (@MaDanhMuc, @TenDanhMuc)">
        <UpdateParameters>
            <asp:Parameter Name="TenDanhMuc" Type="String" />
            <asp:Parameter Name="MaDanhMuc" Type="Int32" />
        </UpdateParameters>
        <DeleteParameters>
            <asp:Parameter Name="MaDanhMuc" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="MaDanhMuc" Type="Int32" />
            <asp:Parameter Name="TenDanhMuc" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>
