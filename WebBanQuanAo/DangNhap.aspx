<%@ Page Title="Đăng nhập" Language="C#" MasterPageFile="~/Customer.Master" AutoEventWireup="true" CodeBehind="DangNhap.aspx.cs" Inherits="WebBanQuanAo.DangNhap" ResponseEncoding="utf-8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Noidung" runat="server">
    <div class="auth-shell">
        <div class="row justify-content-center">
            <div class="col-12 col-md-7 col-lg-5">
                <div class="card subtle-card auth-card overflow-hidden">
                    <div class="card-body p-4 p-md-5">
                        <div class="text-center mb-4">
                            <div class="auth-title">Đăng nhập</div>
                            <div class="text-muted">Chào mừng bạn quay lại Fashion Store</div>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Tên đăng nhập</label>
                            <div class="input-group input-group-lg">
                                <span class="input-group-text"><i class="bi bi-person"></i></span>
                                <input class="form-control" name="TenDangNhap" autocomplete="username" />
                            </div>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Mật khẩu</label>
                            <div class="input-group input-group-lg">
                                <span class="input-group-text"><i class="bi bi-lock"></i></span>
                                <input class="form-control" type="password" name="MatKhau" autocomplete="current-password" />
                            </div>
                        </div>

                        <div class="d-grid gap-2 mt-4">
                            <button type="submit" class="btn btn-dark btn-lg">Đăng nhập</button>
                            <a href="DangKy.aspx" class="btn btn-outline-dark btn-lg">Tạo tài khoản</a>
                        </div>

                        <asp:Literal ID="litMessage" runat="server"></asp:Literal>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
