<%@ Page Title="Đăng ký" Language="C#" MasterPageFile="~/Customer.Master" AutoEventWireup="true" CodeBehind="DangKy.aspx.cs" Inherits="WebBanQuanAo.DangKy" ResponseEncoding="utf-8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Noidung" runat="server">
    <div class="auth-shell">
        <div class="row justify-content-center">
            <div class="col-12 col-md-7 col-lg-5">
                <div class="card subtle-card auth-card overflow-hidden">
                    <div class="card-body p-4 p-md-5">
                        <div class="text-center mb-4">
                            <div class="auth-title">Tạo tài khoản</div>
                            <div class="text-muted">Đăng ký để mua sắm và theo dõi đơn hàng</div>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Họ và tên</label>
                            <div class="input-group input-group-lg">
                                <span class="input-group-text"><i class="bi bi-badge-ad"></i></span>
                                <input class="form-control" name="HoTen" autocomplete="name" />
                            </div>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Email</label>
                            <div class="input-group input-group-lg">
                                <span class="input-group-text"><i class="bi bi-envelope"></i></span>
                                <input class="form-control" name="Email" type="email" autocomplete="email" />
                            </div>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Điện thoại</label>
                            <div class="input-group input-group-lg">
                                <span class="input-group-text"><i class="bi bi-telephone"></i></span>
                                <input class="form-control" name="DienThoai" autocomplete="tel" />
                            </div>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Địa chỉ</label>
                            <div class="input-group input-group-lg">
                                <span class="input-group-text"><i class="bi bi-geo-alt"></i></span>
                                <input class="form-control" name="DiaChi" autocomplete="street-address" />
                            </div>
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
                                <input class="form-control" type="password" name="MatKhau" autocomplete="new-password" />
                            </div>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Nhập lại mật khẩu</label>
                            <div class="input-group input-group-lg">
                                <span class="input-group-text"><i class="bi bi-shield-lock"></i></span>
                                <input class="form-control" type="password" name="NhapLaiMatKhau" autocomplete="new-password" />
                            </div>
                        </div>

                        <div class="d-grid gap-2 mt-4">
                            <button type="submit" class="btn btn-dark btn-lg">Tạo tài khoản</button>
                            <a href="DangNhap.aspx" class="btn btn-outline-dark btn-lg">Đã có tài khoản? Đăng nhập</a>
                        </div>

                        <asp:Literal ID="litMessage" runat="server"></asp:Literal>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
