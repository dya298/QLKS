using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyKhachSanDya
{
    public class KetNoiSQL
    {
        private SqlConnection conn = new SqlConnection("Data Source=DESKTOP-1M1S910\\SQLEXPRESS;Initial Catalog=QuanLyKhachSan;Integrated Security=True");
        private SqlCommand cmd;

        public DataTable layDLTuBang(string table)
        {
            DataTable t = new DataTable();

            string sql = "select * from " + table;
            SqlDataAdapter da = new SqlDataAdapter(sql, conn);
            if (da == null)
            {
                throw new Exception("Sai cấu hình CSDL! \nVui lòng xem Trợ Giúp trên thanh menu!");
            }
            else
            {
                da.Fill(t);
                return t;
            }
        }
        public DataTable truyVanSQL(string sql)
        {

            DataTable t = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(sql, conn);
            if (da == null)
            {
                throw new Exception("Sai cấu hình CSDL! \nVui lòng xem Trợ Giúp trên thanh menu!");
            }
            else
            {
                da.Fill(t);
                return t;
            }

        }
        public void thucThiSQL(string sql, Luat l)
        {
            conn.Open();
            cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("a", l.DoTuoi);
            cmd.Parameters.AddWithValue("s", l.GioiTinh);
            cmd.Parameters.AddWithValue("i", l.ThuNhap);
            cmd.Parameters.AddWithValue("c", l.SuDungDichVu);
            cmd.Parameters.AddWithValue("m", l.MauPhong);
            cmd.Parameters.AddWithValue("o", l.LoaiPhong);
            cmd.Parameters.AddWithValue("b", l.XacNhan);
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        public void xoaSuaTimKiemDL(string sql, Luat l)
        {
            conn.Open();
            cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("a", l.DoTuoi);
            cmd.Parameters.AddWithValue("s", l.GioiTinh);
            cmd.Parameters.AddWithValue("i", l.ThuNhap);
            cmd.Parameters.AddWithValue("c", l.SuDungDichVu);
            cmd.Parameters.AddWithValue("m", l.MauPhong);
            cmd.Parameters.AddWithValue("o", l.LoaiPhong);
            cmd.Parameters.AddWithValue("b", l.XacNhan);
            cmd.Parameters.AddWithValue("stt", l.STT);
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        public void sqlLuat(string sql, Luat l)
        {
            conn.Open();
            cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("a", l.DoTuoi);
            cmd.Parameters.AddWithValue("s", l.GioiTinh);
            cmd.Parameters.AddWithValue("i", l.ThuNhap);
            cmd.Parameters.AddWithValue("c", l.SuDungDichVu);
            cmd.Parameters.AddWithValue("m", l.MauPhong);
            cmd.Parameters.AddWithValue("o", l.LoaiPhong);
            cmd.Parameters.AddWithValue("b", l.XacNhan);
            cmd.Parameters.AddWithValue("stt", l.STT);
            cmd.ExecuteNonQuery();
            conn.Close();
        }

    }
}
