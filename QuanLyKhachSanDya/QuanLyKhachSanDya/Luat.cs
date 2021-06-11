using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyKhachSanDya
{
    public class Luat
    {
        private int stt;

        public int STT
        {
            get { return stt; }
            set { stt = value; }
        }

        public string DoTuoi { get; set; }
        public string GioiTinh { get; set; }
        public string ThuNhap { get; set; }
        public string SuDungDichVu { get; set; }
        public string MauPhong { get; set; }
        public string LoaiPhong { get; set; }
        public string XacNhan { get; set; }
        public Luat(string a, string s, string i, string c, string m, string o, string b)
        {
            this.DoTuoi = a;
            this.GioiTinh = s;
            this.ThuNhap = i;
            this.SuDungDichVu = c;
            this.MauPhong = m;
            this.LoaiPhong = o;
            this.XacNhan = b;
        }
        public Luat()
        {
            this.DoTuoi = "";
            this.GioiTinh = "";
            this.ThuNhap = "";
            this.SuDungDichVu = "";
            this.MauPhong = "";
            this.LoaiPhong = "";
            this.XacNhan = "";
        }
        public Luat(int st)
        {
            this.stt = st;
            this.DoTuoi = "";
            this.GioiTinh = "";
            this.ThuNhap = "";
            this.SuDungDichVu = "";
            this.MauPhong = "";
            this.LoaiPhong = "";
            this.XacNhan = "";
        }
        public Luat(int st, string a, string s, string i, string c, string m, string o, string b)
        {
            this.STT = st;
            this.DoTuoi = a;
            this.GioiTinh = s;
            this.ThuNhap = i;
            this.SuDungDichVu = c;
            this.MauPhong = m;
            this.LoaiPhong = o;
            this.XacNhan = b;
        }
        public override string ToString()
        {
            return "STT: " + STT + ", Độ tuổi: " + DoTuoi + ", Giới tính: " + GioiTinh + ", Thu nhập: " + ThuNhap +
                "\nSử dụng dịch vụ: " + SuDungDichVu + ",Mẫu phòng: " + MauPhong + ", Loại phòng: " + LoaiPhong + ", Xác nhận: " + XacNhan;
        }
    }
}
