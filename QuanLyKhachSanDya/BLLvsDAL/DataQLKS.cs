using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLLvsDAL
{
    public class DataQLKS
    {
        QLKSDataContext data = new QLKSDataContext();
        // Hiển thị dữ liệu bảng khách hàng
        public IQueryable LoadKhachHang()
        {
            return data.KhachHangs.Select(kh => kh);
        }

        // Hiển thị dứ liệu bảng nhân viên
        public IQueryable LoadNhanVien()
        {
            return data.NhanViens.Select(nv => nv);
        }
        // Hiển thị dữ liệu bảng dich vụ
        public IQueryable LoadDichVu()
        {
            return data.DichVus.Select(dv => dv);
        }
        
        // Hiển thị dữ liệu bảng phòng
        public IQueryable LoadPhong()
        {
            return from p in data.Phongs select new { p.MaPhong, p.MaLoaiPhong, p.MaMauPhong, p.TinhTrang, p.TenPhong };
        }
        public IQueryable LoadCT()
        {
            return from p in data.PHIEUTHUEPHONGs select new { p.MAPHONG, p.MAKH, p.NGAYDAT, p.NGAYKETTHUC };
        }
        public IQueryable loadv()
        {
            return from p in data.DichVus select new { p.TenDV, p.GiaDV};
        }

        // Hiển thị combobox loại phòng
        public IQueryable LoadCBlp()
        {
            return data.LoaiPhongs.Select(lp => lp);
        }
        // Hiển thị combobox mẫu phòng
        public IQueryable LoadCBmp()
        {
            return data.MauPhongs.Select(mp => mp);
        }
        // Hiện form thanh toán 
        public IQueryable loadthanhtoan()
        {
            return from tp in data.PHIEUTHUEPHONGs from p in data.Phongs where(tp.MAPHONG==p.MaPhong) 
                   select new { tp.MAPHONG, tp.MAKH, p.MaLoaiPhong, p.MaMauPhong,tp.NGAYDAT,tp.NGAYKETTHUC};
        }
        // Kiểm tra khóa chính khách hàng

        public int KiemtraTrungKH(string mkh)
        {
            var khachhang = data.KhachHangs.Where(kh => kh.MaKH == mkh).FirstOrDefault();
            if(data.KhachHangs.Contains(khachhang))
            {
                return 1;
            }
            return 0;
        }
        // Kiểm tra khóa chính nhân viên
        public int KiemtraTrungNV(string mnv)
        {
            var nhanvien = data.NhanViens.Where(kh => kh.MaNV == mnv).FirstOrDefault();
            if (data.NhanViens.Contains(nhanvien))
            {
                return 1;
            }
            return 0;
        }
        // Kiểm tra khóa chính dịch vụ
        public int KiemtraTrungDV(string mdv)
        {
            var dichvu = data.DichVus.Where(kh => kh.MaDV == mdv).FirstOrDefault();
            if (data.DichVus.Contains(dichvu))
            {
                return 1;
            }
            return 0;
        }
        // Kiểm tra khóa chính phòng
        public int KiemtraTrungP(string mp,string mlp,string mmp)
        {
            var phong = data.Phongs.Where(p => p.MaPhong == mp).FirstOrDefault();
            var loaiphong = data.Phongs.Where(p => p.MaLoaiPhong == mlp).FirstOrDefault();
            var mamauphong = data.Phongs.Where(p => p.MaMauPhong == mmp).FirstOrDefault();
            if (data.Phongs.Contains(phong)&& data.Phongs.Contains(loaiphong) || data.Phongs.Contains(mamauphong))
            {
                return 1;
            }
            return 0;
        }

        public void dau()
        {

        }
        // Thêm khách hàng 
        public void themkh(string mkh,string tenkh,DateTime ns,string gioitinh,string cmnd,string sdt,string quoctich)
        {
            KhachHang kh = new KhachHang();
            kh.MaKH = mkh;
            kh.TenKH = tenkh;
            kh.NgaySinh = ns;
            kh.GioiTinh = gioitinh;
            kh.SoCMND = cmnd;
            kh.SDT = sdt;
            kh.QuocTich = quoctich;
            data.KhachHangs.InsertOnSubmit(kh);
            data.SubmitChanges();
        }
        // Thêm nhân viên 
        public void themnv(string manv, string tennv, DateTime ns, string gioitinh, string cmnd, string diachi, string sdt,string chucvu)
        {
            NhanVien nv = new NhanVien();
            nv.MaNV = manv;
            nv.TenNV = tennv;
            nv.NgaySinh = ns;
            nv.GioiTinh = gioitinh;
            nv.SoCMND = cmnd;
            nv.DiaChi = diachi;
            nv.SDT = sdt;
            nv.ChucVu = chucvu;
            data.NhanViens.InsertOnSubmit(nv);
            data.SubmitChanges();
        }
        // Thêm dịch vụ
        public void themdv(string madv, string tendv, float giatien)
        {
            DichVu dv = new DichVu();
            dv.MaDV = madv;
            dv.TenDV = tendv;
            dv.GiaDV = giatien;          
            data.DichVus.InsertOnSubmit(dv);
            data.SubmitChanges();
        }
        // Thêm phòng
        public void themphong(string map, string maloaip, string mammaup,int tinhtrang,string tenp )
        {
            Phong p = new Phong();
            p.MaPhong = map;
            p.MaLoaiPhong = maloaip;
            p.MaMauPhong = mammaup;
            p.TinhTrang = tinhtrang;
            p.TenPhong = tenp;
            data.Phongs.InsertOnSubmit(p);
            data.SubmitChanges();
        }
        // Xóa khách hàng
        public void xoakh(string mkh)
        {
            KhachHang kh = data.KhachHangs.Where(k => k.MaKH == mkh).FirstOrDefault();
            if(kh!=null)
            {
                data.KhachHangs.DeleteOnSubmit(kh);
                data.SubmitChanges();
            }         
        }

        // Xóa nhân viên
        public void xoanv(string mnv)
        {
            NhanVien nv = data.NhanViens.Where(k => k.MaNV == mnv).FirstOrDefault();
            if (nv != null)
            {
                data.NhanViens.DeleteOnSubmit(nv);
                data.SubmitChanges();
            }
        }
        // Xóa dịch vụ
        public void xoadv(string mdv)
        {
            DichVu dv = data.DichVus.Where(k => k.MaDV == mdv).FirstOrDefault();
            if (dv != null)
            {
                data.DichVus.DeleteOnSubmit(dv);
                data.SubmitChanges();
            }
        }
        // Xóa phòng
        public void xoap(string map)
        {
            Phong p = data.Phongs.Where(k => k.MaPhong == map).FirstOrDefault();
            if (p != null)
            {
                data.Phongs.DeleteOnSubmit(p);
                data.SubmitChanges();
            }
        }
        // Sửa khách hàng
        public void suakh(string mkh,string tenkh, DateTime ns,string gioitinh,string cmnd,string sdt,string quoctich)
        {
            KhachHang kh = data.KhachHangs.Where(k => k.MaKH == mkh).FirstOrDefault();
            if (kh != null)
            {
                kh.TenKH = tenkh;
                kh.NgaySinh = ns;
                kh.GioiTinh = gioitinh;
                kh.SoCMND = cmnd;
                kh.SDT = sdt;
                kh.QuocTich = quoctich;
                data.SubmitChanges();
            }
        }
        // Sửa nhân viên
        public void suanv(string manv, string tennv, DateTime ns, string gioitinh, string cmnd, string diachi, string sdt, string chucvu)
        {

            NhanVien nv = data.NhanViens.Where(k => k.MaNV == manv).FirstOrDefault();
            if(nv!=null)
            {
                nv.MaNV = manv;
                nv.TenNV = tennv;
                nv.NgaySinh = ns;
                nv.GioiTinh = gioitinh;
                nv.SoCMND = cmnd;
                nv.DiaChi = diachi;
                nv.SDT = sdt;
                nv.ChucVu = chucvu;
                data.SubmitChanges();
            }
        }
        // Cập nhật tình trạng nhân viên
        public void suatinhtrangnv0()
        {
            TAIKHOANNV tAIKHOANNV = data.TAIKHOANNVs.Where(tk => tk.TinhTrang == "1").FirstOrDefault();
            if(tAIKHOANNV!=null)
            {
                tAIKHOANNV.TinhTrang = "0";
                data.SubmitChanges();
            }    
        }
        public void suatinhtrangnv1(string mnv)
        {
            TAIKHOANNV tAIKHOANNV = data.TAIKHOANNVs.Where(tk => tk.MANV == mnv).FirstOrDefault();
            if (tAIKHOANNV != null)
            {
                tAIKHOANNV.TinhTrang = "1";
                data.SubmitChanges();
            }
        }
        // Sửa dịch vụ
        public void suadv(string madv, string tendv, float giatien)
        {
            DichVu dv = data.DichVus.Where(k => k.MaDV == madv).FirstOrDefault();
            if(dv!=null)
            {
                dv.TenDV = tendv;
                dv.GiaDV = giatien;                
                data.SubmitChanges();
            }
        }
        // Sửa phòng
        public void suap(string map, string maloaip, string mammaup, int tinhtrang, string tenp)
        {
            Phong p = data.Phongs.Where(k => k.MaPhong == map).FirstOrDefault();
            if (p != null)
            {
                p.MaLoaiPhong = maloaip;
                p.MaMauPhong = mammaup;
                p.TinhTrang = tinhtrang;
                p.TenPhong = tenp;
                data.SubmitChanges();
            }
        }
        // Thuê phòng
        public void thuephong(string map,string makh,DateTime ngaydat,DateTime ngayketthuc,float tongtien)
        {
            PHIEUTHUEPHONG ptp = new PHIEUTHUEPHONG();
            ptp.MAPHONG = map;
            ptp.MAKH = makh;
            ptp.NGAYDAT = ngaydat;
            ptp.NGAYKETTHUC = ngayketthuc;
            ptp.TONGTIEN = tongtien;
            data.PHIEUTHUEPHONGs.InsertOnSubmit(ptp);
            data.SubmitChanges();
            tinhtrangphong(map, 1);
        }
        // Xóa chi tiết phòng
        public void xoathuephong(string temp)
        {
            PHIEUTHUEPHONG dichVu = data.PHIEUTHUEPHONGs.Where(kh => kh.MAPHONG == temp).FirstOrDefault();
            if(dichVu!=null)
            {
                data.PHIEUTHUEPHONGs.DeleteOnSubmit(dichVu);
                data.SubmitChanges();
            }    
        }
        public void xoadichvuphong(string temp)
        {
            PhieuDichVu phieuDichVu = data.PhieuDichVus.Where(kh => kh.MaDV == temp).FirstOrDefault();
            IEnumerable<PhieuDichVu> xoapdv = (from c in data.PhieuDichVus where (c.MaKH == temp) select c).ToList();
            data.PhieuDichVus.DeleteAllOnSubmit(xoapdv);
            data.SubmitChanges();
        }
       
        // Kiểm tra tên kh trùng
        public IQueryable KiemtraTrungKHdv()
        {      
                return (from dv1 in data.KhachHangs
                       from dv2 in data.PhieuDichVus
                       where (dv2.MaKH != dv1.MaKH)                      
                       select new { dv1.TenKH,dv1.MaKH}).Distinct() ;
            
        }


        public void tinhtrangphong(string mp,int tinhtrang)
        {
            Phong p = data.Phongs.Where(k => k.MaPhong == mp).FirstOrDefault();
            if(p!=null)
            {
                p.TinhTrang = tinhtrang;
                data.SubmitChanges();
            }
        }
        public int KiemtraTrungP1(string mp)
        {
            var ct = data.PHIEUTHUEPHONGs.Where(p => p.MAPHONG == mp).FirstOrDefault();
            if (data.PHIEUTHUEPHONGs.Contains(ct))
            {
                return 1;
            }
            else
            {
                return 0;
            }

        }
        public int noti()
        {
            var temp = data.Phongs.Where(t => t.TinhTrang == 1).Count();
            return temp;
        }
        public void suanoti(string temp)
        {
            Phong p = data.Phongs.Where(kh => kh.MaPhong == temp).FirstOrDefault();
            if(p!=null)
            {
                p.TinhTrang = 0;
                data.SubmitChanges();
            }    
        }
        // Hiển thị tên khách hàng
        public string tenkh(string makh)
        {
            var kh = data.KhachHangs.Where(t => t.MaKH == makh).FirstOrDefault();
            {
                if (data.KhachHangs.Contains(kh))
                    return kh.TenKH;
                else
                    return " ";
            }
        }
        // Hiển thị tên nhân viên
        public string tennv1(string manv)
        {
            var nv = data.NhanViens.Where(nv1 => nv1.MaNV == manv).FirstOrDefault();
            if(data.NhanViens.Contains(nv))
            {
                return nv.TenNV;
            }
            return " ";
        }
        // Hiển thị tên phòng
        public string tenphong(string makh)
        {
            var kh = data.Phongs.Where(t => t.MaPhong == makh).FirstOrDefault();
            {
                if (data.Phongs.Contains(kh))
                    return "Phòng" + " " + kh.TenPhong;
                else
                    return " ";
            }
        }
        // Hiển thị tên loại phòng
        public string tenloaiphong(string makh)
        {
            var kh = data.LoaiPhongs.Where(t => t.MaLoaiPhong == makh).FirstOrDefault();
            {
                if (data.LoaiPhongs.Contains(kh))
                    return kh.MoTa;
                else
                    return " ";
            }
        }
        // hiển thị tên mẫu phòng
        public string tenmauphong(string makh)
        {
            var kh = data.MauPhongs.Where(t => t.MaMauPhong == makh).FirstOrDefault();
            {
                if (data.MauPhongs.Contains(kh))
                    return kh.TenMauPhong;
                else
                    return " ";
            }
        }
        public IQueryable tendv(string temp)
        {
            var makh = data.PhieuDichVus.Where(kh => kh.MaKH == temp).FirstOrDefault();
            if (data.PhieuDichVus.Contains(makh))
            {
                return from dv1 in data.DichVus from dv2 in data.PhieuDichVus where (dv2.MaDV == dv1.MaDV) where(dv2.MaKH==temp) 
                       select new { dv1.TenDV };
            }
            else
                return null;
        }

        // Hiển thị tên dịch vụ đã sử dụng
        public float dichvusudung(string makh)
        {
            float tong = 0;
            var sodv = from dv in data.PhieuDichVus.Where(t => t.MaKH == makh) select new { dv.MaDV };
            var kh = data.PhieuDichVus.Where(t => t.MaKH == makh).FirstOrDefault();
                    if (data.PhieuDichVus.Contains(kh))
                    {
                        tong = sodv.Count();
                    }              
            return tong;
        }
        public IQueryable dichvusudung1(string makh)
        {
            return from dv in data.PhieuDichVus.Where(t => t.MaKH == makh) select new { dv.MaDV };
        }
        public float tienmauphong(string maphong,string mamauphong)
        {
            float tong;
            var phong = data.Phongs.Where(kh => kh.MaPhong == maphong).FirstOrDefault();
            var mauphong = data.MauPhongs.Where(kh => kh.MaMauPhong == mamauphong).FirstOrDefault();
            if(data.Phongs.Contains(phong))
            {
                if (data.MauPhongs.Contains(mauphong))
                {
                    tong =float.Parse(mauphong.DonGia.ToString());
                    return tong;
                }
                else
                    return 0;                         
            }
            else
                return 0;
        }
        public float tienloaiphong(string maphong, string maloaiphong)
        {
            float tong;
            var phong = data.Phongs.Where(kh => kh.MaPhong == maphong).FirstOrDefault();
            var loaiphong = data.LoaiPhongs.Where(kh => kh.MaLoaiPhong == maloaiphong).FirstOrDefault();
            if (data.Phongs.Contains(phong))
            {
                if (data.LoaiPhongs.Contains(loaiphong))
                {
                    tong = float.Parse(loaiphong.GiaPhong.ToString());
                    return tong;
                }
                else
                    return 0;
            }
            else
                return 0;
        }
        public IQueryable loadcbdv(string temp)
        {            
            return data.PhieuDichVus.Select(k => k).Where(kh=>kh.MaKH==temp);
        }
        // Thêm dịch vụ
        public void themdv(string makh, string madv)
        {
            PhieuDichVu pdv = new PhieuDichVu();
            pdv.MaKH = makh;
            pdv.MaDV = madv;    
            data.PhieuDichVus.InsertOnSubmit(pdv);
            data.SubmitChanges();
        }
        public void xoapdv(string mkh)
        {
            PhieuDichVu dv = data.PhieuDichVus.Where(k => k.MaKH == mkh).FirstOrDefault();
            if(dv!=null)
            {
                data.PhieuDichVus.DeleteOnSubmit(dv);
                data.SubmitChanges();
            }    
        }
        public IQueryable loadmadv(string makh)
        {
            return from dv in data.PhieuDichVus.Where(t => t.MaKH == makh) select new { dv.MaDV };
        }
        public float tiendv(string mkh)
        {
            float tong = 0;
            var kh = data.PhieuDichVus.Where(k => k.MaKH == mkh).FirstOrDefault();
            var sodv = from dv in data.PhieuDichVus.Where(t => t.MaKH == mkh) select new { dv.MaDV };
            if (data.PhieuDichVus.Contains(kh))
            {
                for(int i=0;i<=sodv.Count();i++)
                {
                    
                }    
            }
            return tong;
        }
        public float giadsdv(string temp)
        {
            float tong = 0;
            var tendv =  from dv1 in data.DichVus from dv2 in data.PhieuDichVus where (dv2.MaDV == dv1.MaDV) where(dv2.MaKH==temp) select new { dv1.GiaDV };
             foreach (var c in tendv)
             {

                    tong+=float.Parse(c.GiaDV.ToString());
                        

             }
            return tong;
        }
        public string tendsdv(string temp)
        {
            string tong = " ";
            var tendv = from dv1 in data.DichVus from dv2 in data.PhieuDichVus where (dv2.MaDV == dv1.MaDV) where(dv2.MaKH==temp) select new { dv1.TenDV };
            foreach (var c in tendv)
            {

                tong += c.TenDV.ToString()+ ",";

            }
            return tong;
        }
        public float tienthanhtoan(string maphong,string maloaiphong,string mamauphong,string temp)
        {
            float tong=0;
            float tong1 = 0;
            var phong = data.Phongs.Where(kh => kh.MaPhong == maphong).FirstOrDefault();
            var loaiphong = data.LoaiPhongs.Where(kh => kh.MaLoaiPhong == maloaiphong).FirstOrDefault();
            var mauphong = data.MauPhongs.Where(kh => kh.MaMauPhong == mamauphong).FirstOrDefault();
            var tendv =  from dv1 in data.DichVus
                               from dv2 in data.PhieuDichVus
                               where (dv2.MaDV == dv1.MaDV)
                               where (dv2.MaKH == temp)
                               select new { dv1.GiaDV };
                foreach (var c in tendv)
                {

                    tong1 += float.Parse(c.GiaDV.ToString());

                }
            if (data.Phongs.Contains(phong))
            {
                if (data.LoaiPhongs.Contains(loaiphong)||data.MauPhongs.Contains(mauphong))
                {
                    tong = tong1 + float.Parse(loaiphong.GiaPhong.ToString()) + float.Parse(mauphong.DonGia.ToString());
                    return tong;
                }
                else
                    return tong;
            }
            else
                return tong;
        }
        // Đăng nhập
        public int dangnhap(string ttk,string mk)
        {
            var tentaikhoan = data.TAIKHOANNVs.Where(tk => tk.TENTAIKHOAN == ttk).FirstOrDefault();
            var matkhau = data.TAIKHOANNVs.Where(tk => tk.MATKHAU == mk).FirstOrDefault();
            if(data.TAIKHOANNVs.Contains(tentaikhoan)&&data.TAIKHOANNVs.Contains(matkhau))
            {
                return 1;
            }
            return 0;
        }
        // Lấy tên nhân viên
        public string tennv(string tennv)
        {
            string ten = " ";
            var tnv = from nv in data.TAIKHOANNVs where(nv.TENTAIKHOAN==tennv) select new { nv.MANV };            
              ten = tnv.FirstOrDefault().MANV.ToString();
            return ten;
        }
        //Combobox manv chưa đăng ký
        public IQueryable comboboxdangkynv()
        {
            return data.NhanViens.Where(s => !data.TAIKHOANNVs.Where(es => es.MANV == s.MaNV).Any());
        }
        public IQueryable comboboxtenkh()
        {
            return data.KhachHangs.Where(s => !data.PHIEUTHUEPHONGs.Where(es => es.MAKH == s.MaKH).Any());
        }
        // Thêm tài khoản
        public void themtaikhoan(string manv,string ttk,string mk)
        {
            TAIKHOANNV tk = new TAIKHOANNV();
            tk.MANV = manv;
            tk.TENTAIKHOAN = ttk;
            tk.MATKHAU = mk;
            tk.TinhTrang = "0";
            data.TAIKHOANNVs.InsertOnSubmit(tk);
            data.SubmitChanges();
        }
        // Thêm hóa đơn
        public void themhoadon(string makh,string manv,float thanhtien)
        {
            HDON hDON = new HDON();
            hDON.MAKH = makh;
            hDON.MANV = manv;
            hDON.NGAYLAPHD = DateTime.Now;
            hDON.THANHTIEN = thanhtien;
            data.HDONs.InsertOnSubmit(hDON);
            data.SubmitChanges();
        }
        public string takeNV()
        {
            var nv = from tk in data.TAIKHOANNVs where (tk.TinhTrang == "1") select new { tk.MANV };
            return nv.FirstOrDefault().MANV.ToString();
        }
        
    }
    
}
