<%@ Page Title="" Language="C#" MasterPageFile="~/Customer.Master" AutoEventWireup="true" CodeBehind="ThanhToanThanhCong.aspx.cs" Inherits="WebBanQuanAo.ThanhToanThanhCong" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Noidung" runat="server">
    <div class="card">
        <div class="card-body text-center">
            <div class="alert alert-success">
                <h2>✅ ĐẶT HÀNG THÀNH CÔNG!</h2>
            </div>
            <div class="mt-4">
                <h4>Cảm ơn bạn đã đặt hàng!</h4>
                <p>Mã đơn hàng của bạn: <strong class="text-danger"><asp:Label ID="lbMaDonHang" runat="server"></asp:Label></strong></p>
                <p>Chúng tôi sẽ liên hệ với bạn trong thời gian sớm nhất.</p>
            </div>
            <div class="mt-4">
                <a href="TrangChu.aspx" class="btn btn-primary btn-lg">Tiếp tục mua sắm</a>
                <a href="GioHang.aspx" class="btn btn-secondary btn-lg">Xem giỏ hàng</a>
            </div>
        </div>
    </div>
</asp:Content>

