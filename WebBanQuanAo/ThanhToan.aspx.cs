using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebBanQuanAo.Models;

namespace WebBanQuanAo
{
    public partial class ThanhToan : System.Web.UI.Page
    {
        private Cart GetCart()
        {
            if (Session["CART"] == null)
            {
                Response.Redirect("GioHang.aspx");
            }
            return (Cart)Session["CART"];
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Cart cart = GetCart();
                if (cart.Items.Count == 0)
                {
                    Response.Redirect("GioHang.aspx");
                }

                // Hiển thị thông tin giỏ hàng
                gvDonHang.DataSource = cart.Items;
                gvDonHang.DataBind();
                lbTongTien.Text = "Tổng tiền: " + cart.Total.ToString("#,##0 đồng");

                // Nếu đã đăng nhập, tự động điền thông tin
                if (User != null && User.Identity != null && User.Identity.IsAuthenticated)
                {
                    NguoiDung user = NguoiDungDAO.LayThongTinTheoTenDangNhap(User.Identity.Name);
                    if (user != null)
                    {
                        txtHoTen.Text = user.HoTen;
                        txtEmail.Text = user.Email;
                        txtDienThoai.Text = user.DienThoai;
                        txtDiaChi.Text = user.DiaChi;
                    }
                }
            }
        }

        protected void btDatHang_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;

            Cart cart = GetCart();
            string connStr = ConfigurationManager.ConnectionStrings["QuanAoDBConStr"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                using (SqlTransaction trans = conn.BeginTransaction())
                {
                    try
                    {
                    // 1. Thêm đơn hàng
                    string sqlDonHang = @"INSERT INTO DonHang (MaNguoiDung, HoTen, DienThoai, Email, DiaChi, TongTien, TrangThai, GhiChu)
                                         VALUES (@MaNguoiDung, @HoTen, @DienThoai, @Email, @DiaChi, @TongTien, N'Chờ xử lý', @GhiChu);
                                         SELECT SCOPE_IDENTITY();";

                    SqlCommand cmdDonHang = new SqlCommand(sqlDonHang, conn, trans);

                    int? maNguoiDung = null;
                    if (User != null && User.Identity != null && User.Identity.IsAuthenticated)
                    {
                        NguoiDung user = NguoiDungDAO.LayThongTinTheoTenDangNhap(User.Identity.Name);
                        if (user != null)
                        {
                            maNguoiDung = user.MaNguoiDung;
                        }
                    }

                    cmdDonHang.Parameters.AddWithValue("@MaNguoiDung", (object)maNguoiDung ?? DBNull.Value);
                    cmdDonHang.Parameters.AddWithValue("@HoTen", txtHoTen.Text.Trim());
                    cmdDonHang.Parameters.AddWithValue("@DienThoai", txtDienThoai.Text.Trim());
                    cmdDonHang.Parameters.AddWithValue("@Email", string.IsNullOrEmpty(txtEmail.Text) ? (object)DBNull.Value : txtEmail.Text.Trim());
                    cmdDonHang.Parameters.AddWithValue("@DiaChi", txtDiaChi.Text.Trim());
                    cmdDonHang.Parameters.AddWithValue("@TongTien", cart.Total);
                    cmdDonHang.Parameters.AddWithValue("@GhiChu", string.IsNullOrEmpty(txtGhiChu.Text) ? (object)DBNull.Value : txtGhiChu.Text.Trim());

                    int maDonHang = Convert.ToInt32(cmdDonHang.ExecuteScalar());

                    // 2. Thêm chi tiết đơn hàng
                    string sqlChiTiet = @"INSERT INTO ChiTietDonHang (MaDonHang, MaQuanAo, TenQuanAo, DonGia, SoLuong, ThanhTien)
                                         VALUES (@MaDonHang, @MaQuanAo, @TenQuanAo, @DonGia, @SoLuong, @ThanhTien)";

                    foreach (var item in cart.Items)
                    {
                        SqlCommand cmdChiTiet = new SqlCommand(sqlChiTiet, conn, trans);
                        cmdChiTiet.Parameters.AddWithValue("@MaDonHang", maDonHang);
                        cmdChiTiet.Parameters.AddWithValue("@MaQuanAo", item.Id);
                        cmdChiTiet.Parameters.AddWithValue("@TenQuanAo", item.Name);
                        cmdChiTiet.Parameters.AddWithValue("@DonGia", item.Price);
                        cmdChiTiet.Parameters.AddWithValue("@SoLuong", item.Quantity);
                        cmdChiTiet.Parameters.AddWithValue("@ThanhTien", item.SubTotal);
                        cmdChiTiet.ExecuteNonQuery();
                    }

                    // 3. Cập nhật số lượng sản phẩm
                    string sqlUpdateSoLuong = "UPDATE QuanAo SET SoLuong = SoLuong - @SoLuong WHERE MaQuanAo = @MaQuanAo";
                    foreach (var item in cart.Items)
                    {
                        SqlCommand cmdUpdate = new SqlCommand(sqlUpdateSoLuong, conn, trans);
                        cmdUpdate.Parameters.AddWithValue("@SoLuong", item.Quantity);
                        cmdUpdate.Parameters.AddWithValue("@MaQuanAo", item.Id);
                        cmdUpdate.ExecuteNonQuery();
                    }

                    trans.Commit();

                    // Xóa giỏ hàng
                    Session["CART"] = null;

                    // Chuyển đến trang thành công
                    Response.Redirect("ThanhToanThanhCong.aspx?madh=" + maDonHang, false);
                    Context.ApplicationInstance.CompleteRequest();
                    return;
                    }
                    catch (ThreadAbortException)
                    {
                        return;
                    }
                    catch (Exception ex)
                    {
                        try
                        {
                            if (trans.Connection != null)
                            {
                                trans.Rollback();
                            }
                        }
                        catch
                        {
                        }

                        Response.Write($"<script>alert('Lỗi: {ex.Message}');</script>");
                    }
                }
            }
        }
    }
}

