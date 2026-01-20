<%@ Page Title="Quản trị - Thương hiệu" Language="C#" MasterPageFile="~/Customer.Master" AutoEventWireup="true" CodeBehind="ThuongHieu.aspx.cs" Inherits="WebBanQuanAo.Admin.ThuongHieu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Noidung" runat="server">
    <div class="d-flex align-items-start justify-content-between mb-3">
        <div>
            <div class="page-title">Thương hiệu</div>
            <div class="text-muted">Quản lý thương hiệu sản phẩm</div>
        </div>
    </div>

    <div class="card subtle-card mb-3">
        <div class="card-body p-0">
            <asp:GridView ID="gvThuongHieu" runat="server" DataSourceID="dsThuongHieu" AutoGenerateColumns="False" DataKeyNames="MaThuongHieu"
                CssClass="table table-hover mb-0" AllowPaging="true" PageSize="10">
                <Columns>
                    <asp:BoundField DataField="MaThuongHieu" HeaderText="Mã" ReadOnly="True" />
                    <asp:BoundField DataField="TenThuongHieu" HeaderText="Tên thương hiệu" />
                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
        </div>
    </div>

    <div class="card mt-3">
        <div class="card-header">Thêm thương hiệu</div>
        <div class="card-body">
            <div class="mb-3">
                <label>Tên thương hiệu</label>
                <asp:TextBox ID="txtTenThuongHieu" CssClass="form-control" runat="server" />
            </div>
            <asp:Button ID="btnThem" runat="server" CssClass="btn btn-success" Text="Thêm" OnClick="btnThem_Click" />
            <asp:Literal ID="litMsg" runat="server"></asp:Literal>
        </div>
    </div>

    <asp:SqlDataSource ID="dsThuongHieu" runat="server"
        ConnectionString="<%$ ConnectionStrings:QuanAoDBConStr %>"
        SelectCommand="SELECT MaThuongHieu, TenThuongHieu FROM ThuongHieu ORDER BY MaThuongHieu DESC"
        UpdateCommand="UPDATE ThuongHieu SET TenThuongHieu=@TenThuongHieu WHERE MaThuongHieu=@MaThuongHieu"
        DeleteCommand="DELETE FROM ThuongHieu WHERE MaThuongHieu=@MaThuongHieu"
        InsertCommand="INSERT INTO ThuongHieu(MaThuongHieu, TenThuongHieu) VALUES (@MaThuongHieu, @TenThuongHieu)">
        <UpdateParameters>
            <asp:Parameter Name="TenThuongHieu" Type="String" />
            <asp:Parameter Name="MaThuongHieu" Type="Int32" />
        </UpdateParameters>
        <DeleteParameters>
            <asp:Parameter Name="MaThuongHieu" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="MaThuongHieu" Type="Int32" />
            <asp:Parameter Name="TenThuongHieu" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>
