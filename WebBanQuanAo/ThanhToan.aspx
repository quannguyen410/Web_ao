<%@ Page Title="" Language="C#" MasterPageFile="~/Customer.Master" AutoEventWireup="true" CodeBehind="ThanhToan.aspx.cs" Inherits="WebBanQuanAo.ThanhToan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Noidung" runat="server">
    <div class="card subtle-card overflow-hidden">
        <div class="card-body p-4">
            <div class="d-flex align-items-center justify-content-between mb-3">
                <div class="page-title">Thanh toán</div>
                <a href="GioHang.aspx" class="btn btn-outline-dark btn-sm">Quay lại giỏ</a>
            </div>
            <div class="row g-4">
                <div class="col-md-6">
                    <h5>Thông tin khách hàng</h5>
                    <div class="mb-3">
                        <label>Họ tên <span class="text-danger">*</span></label>
                        <asp:TextBox ID="txtHoTen" runat="server" CssClass="form-control" placeholder="Nhập họ tên"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvHoTen" runat="server" ControlToValidate="txtHoTen" 
                            ErrorMessage="Vui lòng nhập họ tên" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <div class="mb-3">
                        <label>Điện thoại <span class="text-danger">*</span></label>
                        <asp:TextBox ID="txtDienThoai" runat="server" CssClass="form-control" placeholder="Nhập số điện thoại"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvDienThoai" runat="server" ControlToValidate="txtDienThoai" 
                            ErrorMessage="Vui lòng nhập số điện thoại" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <div class="mb-3">
                        <label>Email</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Nhập email"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <label>Địa chỉ <span class="text-danger">*</span></label>
                        <asp:TextBox ID="txtDiaChi" runat="server" CssClass="form-control" TextMode="MultiLine" 
                            Rows="3" placeholder="Nhập địa chỉ giao hàng"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvDiaChi" runat="server" ControlToValidate="txtDiaChi" 
                            ErrorMessage="Vui lòng nhập địa chỉ" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <div class="mb-3">
                        <label>Ghi chú</label>
                        <asp:TextBox ID="txtGhiChu" runat="server" CssClass="form-control" TextMode="MultiLine" 
                            Rows="3" placeholder="Ghi chú thêm (nếu có)"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-6">
                    <h5>Thông tin đơn hàng</h5>
                    <asp:GridView ID="gvDonHang" runat="server" AutoGenerateColumns="False" 
                        CssClass="table table-hover align-middle">
                        <Columns>
                            <asp:BoundField DataField="Name" HeaderText="Sản phẩm" />
                            <asp:BoundField DataField="Quantity" HeaderText="SL" />
                            <asp:BoundField DataField="Price" HeaderText="Đơn giá" DataFormatString="{0:#,##0}đ" />
                            <asp:BoundField DataField="SubTotal" HeaderText="Thành tiền" DataFormatString="{0:#,##0}đ" />
                        </Columns>
                    </asp:GridView>
                    <div class="mt-3">
                        <h5 class="text-danger">
                            <asp:Label ID="lbTongTien" runat="server" Text=""></asp:Label>
                        </h5>
                    </div>
                    <div class="d-grid gap-2 mt-3">
                        <asp:Button ID="btDatHang" runat="server" Text="ĐẶT HÀNG" CssClass="btn btn-dark btn-lg" 
                            OnClick="btDatHang_Click" />
                        <a href="GioHang.aspx" class="btn btn-outline-dark btn-lg">Quay lại giỏ hàng</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

