using System;
using System.Configuration;
using System.Data.SqlClient;

namespace WebBanQuanAo.Models
{
    public class NguoiDungDAO
    {
        public static void EnsureSchema()
        {
            // Database đã được tạo sẵn bởi CreateDatabaseComplete.sql
            // Không cần tạo lại
        }

        public static bool DangKy(string tenDangNhap, string matKhau)
        {
            return DangKy(tenDangNhap, matKhau, null, null, null, null);
        }

        public static bool DangKy(string tenDangNhap, string matKhau, string hoTen, string email, string dienThoai, string diaChi)
        {
            if (string.IsNullOrWhiteSpace(tenDangNhap) || string.IsNullOrWhiteSpace(matKhau))
            {
                return false;
            }

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["QuanAoDBConStr"].ConnectionString))
            {
                conn.Open();

                using (SqlCommand checkCmd = new SqlCommand("SELECT COUNT(1) FROM NguoiDung WHERE TenDangNhap = @u", conn))
                {
                    checkCmd.Parameters.AddWithValue("@u", tenDangNhap);
                    int exists = (int)checkCmd.ExecuteScalar();
                    if (exists > 0)
                    {
                        return false;
                    }
                }

                using (SqlCommand insertCmd = new SqlCommand("INSERT INTO NguoiDung(TenDangNhap, MatKhau, HoTen, Email, DienThoai, DiaChi, LaAdmin) VALUES (@u, @p, @HoTen, @Email, @DienThoai, @DiaChi, 0)", conn))
                {
                    insertCmd.Parameters.AddWithValue("@u", tenDangNhap);
                    insertCmd.Parameters.AddWithValue("@p", matKhau);
                    insertCmd.Parameters.AddWithValue("@HoTen", string.IsNullOrWhiteSpace(hoTen) ? (object)DBNull.Value : hoTen);
                    insertCmd.Parameters.AddWithValue("@Email", string.IsNullOrWhiteSpace(email) ? (object)DBNull.Value : email);
                    insertCmd.Parameters.AddWithValue("@DienThoai", string.IsNullOrWhiteSpace(dienThoai) ? (object)DBNull.Value : dienThoai);
                    insertCmd.Parameters.AddWithValue("@DiaChi", string.IsNullOrWhiteSpace(diaChi) ? (object)DBNull.Value : diaChi);
                    insertCmd.ExecuteNonQuery();
                    return true;
                }
            }
        }

        public static NguoiDung DangNhap(string tenDangNhap, string matKhau)
        {
            if (string.IsNullOrWhiteSpace(tenDangNhap) || string.IsNullOrWhiteSpace(matKhau))
            {
                return null;
            }

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["QuanAoDBConStr"].ConnectionString))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand("SELECT TOP 1 MaNguoiDung, TenDangNhap, MatKhau, HoTen, Email, DienThoai, DiaChi, LaAdmin FROM NguoiDung WHERE TenDangNhap = @u AND MatKhau = @p", conn))
                {
                    cmd.Parameters.AddWithValue("@u", tenDangNhap);
                    cmd.Parameters.AddWithValue("@p", matKhau);
                    using (SqlDataReader rd = cmd.ExecuteReader())
                    {
                        if (!rd.Read())
                        {
                            return null;
                        }

                        bool laAdmin = rd["LaAdmin"] != DBNull.Value && Convert.ToBoolean(rd["LaAdmin"]);

                        return new NguoiDung
                        {
                            MaNguoiDung = Convert.ToInt32(rd["MaNguoiDung"]),
                            TenDangNhap = rd["TenDangNhap"].ToString(),
                            MatKhau = rd["MatKhau"].ToString(),
                            HoTen = rd["HoTen"] != DBNull.Value ? rd["HoTen"].ToString() : "",
                            Email = rd["Email"] != DBNull.Value ? rd["Email"].ToString() : "",
                            DienThoai = rd["DienThoai"] != DBNull.Value ? rd["DienThoai"].ToString() : "",
                            DiaChi = rd["DiaChi"] != DBNull.Value ? rd["DiaChi"].ToString() : "",
                            LaAdmin = laAdmin,
                            VaiTro = laAdmin ? "Admin" : "User"
                        };
                    }
                }
            }
        }

        public static bool ResetMatKhauTheoTenDangNhap(string tenDangNhap, string matKhauMoi)
        {
            if (string.IsNullOrWhiteSpace(tenDangNhap) || string.IsNullOrWhiteSpace(matKhauMoi))
            {
                return false;
            }

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["QuanAoDBConStr"].ConnectionString))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand("UPDATE NguoiDung SET MatKhau=@p WHERE TenDangNhap=@u", conn))
                {
                    cmd.Parameters.AddWithValue("@p", matKhauMoi);
                    cmd.Parameters.AddWithValue("@u", tenDangNhap);
                    return cmd.ExecuteNonQuery() > 0;
                }
            }
        }

        public static NguoiDung LayThongTinTheoTenDangNhap(string tenDangNhap)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["QuanAoDBConStr"].ConnectionString))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand("SELECT MaNguoiDung, TenDangNhap, HoTen, Email, DienThoai, DiaChi, LaAdmin FROM NguoiDung WHERE TenDangNhap = @u", conn))
                {
                    cmd.Parameters.AddWithValue("@u", tenDangNhap);
                    using (SqlDataReader rd = cmd.ExecuteReader())
                    {
                        if (!rd.Read())
                        {
                            return null;
                        }

                        bool laAdmin = rd["LaAdmin"] != DBNull.Value && Convert.ToBoolean(rd["LaAdmin"]);

                        return new NguoiDung
                        {
                            MaNguoiDung = Convert.ToInt32(rd["MaNguoiDung"]),
                            TenDangNhap = rd["TenDangNhap"].ToString(),
                            HoTen = rd["HoTen"] != DBNull.Value ? rd["HoTen"].ToString() : "",
                            Email = rd["Email"] != DBNull.Value ? rd["Email"].ToString() : "",
                            DienThoai = rd["DienThoai"] != DBNull.Value ? rd["DienThoai"].ToString() : "",
                            DiaChi = rd["DiaChi"] != DBNull.Value ? rd["DiaChi"].ToString() : "",
                            LaAdmin = laAdmin
                        };
                    }
                }
            }
        }
    }
}
