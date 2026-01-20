using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
namespace WebBanQuanAo.Models
{
    public class QuanAoDAO
    {
        public static QuanAo layQuanAoTheoMa(int maquanao)
        {
            QuanAo qa = null;
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["QuanAoDBConStr"].ConnectionString))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand("SELECT MaQuanAo, TenQuanAo, AnhQuanAo, DonGia, SoLuong FROM QuanAo WHERE MaQuanAo = @ma", conn))
                {
                    cmd.Parameters.AddWithValue("@ma", maquanao);
                    using (SqlDataReader rd = cmd.ExecuteReader())
                    {
                        if (rd.Read())
                        {
                            qa = new QuanAo
                            {
                                MaQuanAo = Convert.ToInt32(rd["MaQuanAo"]),
                                TenQuanAo = rd["TenQuanAo"].ToString(),
                                AnhQuanAo = rd["AnhQuanAo"].ToString(),
                                DonGia = double.Parse(rd["DonGia"].ToString()),
                                SoLuong = int.Parse(rd["SoLuong"].ToString())
                            };
                        }
                    }
                }
            }
            return qa;
        }
    }
}