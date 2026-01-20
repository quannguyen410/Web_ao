<%@ Page Title="" Language="C#" MasterPageFile="~/Customer.Master" AutoEventWireup="true"  CodeBehind="GioHang.aspx.cs" Inherits="WebBanQuanAo.ViewCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Noidung" runat="server">
    <div class="card subtle-card overflow-hidden">
        <div class="card-body p-4">
            <div class="d-flex align-items-center justify-content-between mb-3">
                <div class="page-title">Giỏ hàng</div>
                <a href="/DanhSachQuanAo.aspx" class="btn btn-outline-dark btn-sm">Tiếp tục mua sắm</a>
            </div>

            <asp:GridView ID="gvGioHang" runat="server" AutoGenerateColumns="False" DataKeyNames="Id"
                CssClass="table table-hover align-middle mb-0" OnRowUpdating="gvGioHang_RowUpdating" >
                <Columns>
                     <asp:TemplateField HeaderText="Hình">
                          <ItemTemplate>
                               <img src='<%# Eval("Picture") %>' style="width:90px" alt="Sản phẩm" class="rounded-3" />
                          </ItemTemplate>
                     </asp:TemplateField> 
            <%-- <asp:ImageField DataImageUrlField="Picture" DataImageUrlFormatString="~/Bia_sach/{0}"
                 ItemStyle-Width="100px" HeaderText="Hình sản phẩm"></asp:ImageField>--%>
             <asp:BoundField  DataField="Name" HeaderText="Sản phẩm" />
             <asp:TemplateField HeaderText="Số lượng">
                  <ItemTemplate>
                      <asp:TextBox ID="txtSoLuong" TextMode="Number" min="0" runat="server" CssClass="form-control form-control-sm" style="width:90px" Text='<%# Eval("Quantity") %>'></asp:TextBox>
                  </ItemTemplate>
             </asp:TemplateField>
             <asp:BoundField  DataField="Price" HeaderText="Đơn giá" DataFormatString="{0: #,##0} đồng" />   
             <asp:BoundField  DataField="SubTotal" HeaderText="Thành tiền" DataFormatString="{0: #,##0} đồng" />
             <asp:TemplateField>
                 <ItemTemplate>
                     <div class="d-flex gap-2">
                         <asp:Button ID="btCapNhat" runat="server" Text="Cập nhật" CommandName="Update" CssClass="btn btn-sm btn-dark" />
                         <asp:Button ID="btXoa" runat="server" Text="Xoá" OnClick="btXoa_Click" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-sm btn-outline-danger" />
                     </div>
                 </ItemTemplate>
             </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                     <div class="alert alert-warning mb-0">
                           Không có sản phẩm trong giỏ
                     </div>
                </EmptyDataTemplate>
            </asp:GridView>

            <div class="d-flex justify-content-between align-items-center pt-3">
                <div class="h5 mb-0 text-danger">
                    <asp:Label ID="lbTongTien" runat="server" Text="" ForeColor="#cc3300"></asp:Label>
                </div>
                <div class="d-flex gap-2">
                    <asp:Button ID="btTraToanBo" runat="server" Text="Xoá tất cả" CssClass="btn btn-outline-dark" OnClick="btTraToanBo_Click" />
                    <a href="ThanhToan.aspx" class="btn btn-dark">Thanh toán</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
