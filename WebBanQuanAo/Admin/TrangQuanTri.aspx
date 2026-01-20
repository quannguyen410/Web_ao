<%@ Page Title="Quản trị" Language="C#" MasterPageFile="~/Customer.Master" AutoEventWireup="true" CodeBehind="TrangQuanTri.aspx.cs" Inherits="WebBanQuanAo.Admin.TrangQuanTri" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Noidung" runat="server">
    <div class="d-flex align-items-start justify-content-between mb-3">
        <div>
            <div class="page-title">Tổng quan</div>
            <div class="text-muted">Xin chào, <strong><%= Context.User.Identity.Name %></strong></div>
        </div>
    </div>

    <div class="card subtle-card">
        <div class="card-body p-4">
            <div class="fw-bold mb-2">Truy cập nhanh</div>
            <div class="list-group list-group-flush">
                <a class="list-group-item list-group-item-action" href="SanPham.aspx"><i class="bi bi-box-seam me-2"></i>Quản trị sản phẩm</a>
                <a class="list-group-item list-group-item-action" href="DanhMuc.aspx"><i class="bi bi-tags me-2"></i>Quản trị danh mục</a>
                <a class="list-group-item list-group-item-action" href="ThuongHieu.aspx"><i class="bi bi-award me-2"></i>Quản trị thương hiệu</a>
                <a class="list-group-item list-group-item-action" href="NguoiDung.aspx"><i class="bi bi-people me-2"></i>Quản trị người dùng</a>
            </div>
        </div>
    </div>
</asp:Content>
