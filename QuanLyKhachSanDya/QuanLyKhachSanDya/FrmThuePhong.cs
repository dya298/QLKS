using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using BLLvsDAL;
namespace QuanLyKhachSanDya
{   
    public partial class FrmThuePhong : Form
    {
        public FrmThuePhong()
        {
            InitializeComponent();
            
        }
        public void ThongBao(string msg, HienThiThongBao.DangThongBao type)
        {
            HienThiThongBao f = new HienThiThongBao();
            f.setAlert(msg, type);
        }
        DataQLKS dt = new DataQLKS();
        private void guna2ImageButton1_DoubleClick(object sender, EventArgs e)
        {
            
        }
        public void guna2GradientTileButton2_Click(object sender, EventArgs e)
        {
            if (guna2GradientTileButton2.FillColor == Color.FromArgb(40, 42, 52))
            {
                FrmThuTucThuePhong tp = new FrmThuTucThuePhong();
                tp.guna2GradientButton1.Visible = true;        
                tp.Show();
            }
            else
            {
                this.ThongBao("Phòng đang được khách hàng sử dụng", HienThiThongBao.DangThongBao.Error);
            }

        }
       
        public void FrmThuePhong_Load(object sender, EventArgs e)
        {
            if (dt.KiemtraTrungP1("P001") == 1)
            {
                guna2GradientTileButton2.FillColor = Color.FromArgb(0, 192, 0);
            }
            else
            {
                guna2GradientTileButton2.FillColor = Color.FromArgb(40, 42, 52);
            }
            //1
            if(dt.KiemtraTrungP1("P002") == 1)
            {
                guna2GradientTileButton3.FillColor = Color.FromArgb(0, 192, 0);
            }
            else
            {
                guna2GradientTileButton3.FillColor = Color.FromArgb(40, 42, 52);
            }
            //2
            if (dt.KiemtraTrungP1("P003") == 1)
            {
                guna2GradientTileButton6.FillColor = Color.FromArgb(0, 192, 0);
            }
            else
            {
                guna2GradientTileButton6.FillColor = Color.FromArgb(40, 42, 52);
            }
            //3
            if (dt.KiemtraTrungP1("P004") == 1)
            {
                guna2GradientTileButton5.FillColor = Color.FromArgb(0, 192, 0);
            }
            else
            {
                guna2GradientTileButton5.FillColor = Color.FromArgb(40, 42, 52);
            }
            //4
            if (dt.KiemtraTrungP1("P005") == 1)
            {
                guna2GradientTileButton1.FillColor = Color.FromArgb(0, 192, 0);
            }
            else
            {
                guna2GradientTileButton1.FillColor = Color.FromArgb(40, 42, 52);
            }
            //5
            if (dt.KiemtraTrungP1("P007") == 1)
            {
                guna2GradientTileButton4.FillColor = Color.FromArgb(0, 192, 0);
            }
            else
            {
                guna2GradientTileButton4.FillColor = Color.FromArgb(40, 42, 52);
            }
            //7
            if (dt.KiemtraTrungP1("P008") == 1)
            {
                guna2GradientTileButton8.FillColor = Color.FromArgb(0, 192, 0);
            }
            else
            {
                guna2GradientTileButton8.FillColor = Color.FromArgb(40, 42, 52);
            }
            //8
            if (dt.KiemtraTrungP1("P009") == 1)
            {
                guna2GradientTileButton7.FillColor = Color.FromArgb(0, 192, 0);
            }
            else
            {
                guna2GradientTileButton7.FillColor = Color.FromArgb(40, 42, 52);
            }
            //9
             if (dt.KiemtraTrungP1("P010") == 1)
            {
                guna2GradientTileButton9.FillColor = Color.FromArgb(0, 192, 0);
            }
            else
            {
                guna2GradientTileButton9.FillColor = Color.FromArgb(40, 42, 52);
            }
            //10
            if (dt.KiemtraTrungP1("P011") == 1)
            {
                guna2GradientTileButton11.FillColor = Color.FromArgb(0, 192, 0);
            }
            else
            {
                guna2GradientTileButton11.FillColor = Color.FromArgb(40, 42, 52);
            }
            //11             
        }

        private void FrmThuePhong_Activated(object sender, EventArgs e)
        {
           

        }
        private void guna2GradientTileButton2_Leave(object sender, EventArgs e)
        {          
            
        }
        public void guna2GradientTileButton3_Click(object sender, EventArgs e)
        {
            if (guna2GradientTileButton3.FillColor == Color.FromArgb(40, 42, 52))
            {
                FrmThuTucThuePhong tp = new FrmThuTucThuePhong();
                tp.guna2GradientButton2.Visible = true;
                tp.Show();
            }
            else
            {
                this.ThongBao("Phòng đang được khách hàng sử dụng", HienThiThongBao.DangThongBao.Error);
            }
        }

        public void guna2GradientTileButton6_Click(object sender, EventArgs e)
        {
            if (guna2GradientTileButton6.FillColor == Color.FromArgb(40, 42, 52))
            {
                FrmThuTucThuePhong tp = new FrmThuTucThuePhong();
                tp.guna2GradientButton3.Visible = true;
                tp.Show();
            }
            else
            {
                this.ThongBao("Phòng đang được khách hàng sử dụng", HienThiThongBao.DangThongBao.Error);
            }
        }

        public void guna2GradientTileButton5_Click(object sender, EventArgs e)
        {
            if (guna2GradientTileButton5.FillColor == Color.FromArgb(40, 42, 52))
            {
                FrmThuTucThuePhong tp = new FrmThuTucThuePhong();
                tp.guna2GradientButton4.Visible = true;
                tp.Show();
            }
            else
            {
                this.ThongBao("Phòng đang được khách hàng sử dụng", HienThiThongBao.DangThongBao.Error);
            }
        }

        public void guna2GradientTileButton1_Click(object sender, EventArgs e)
        {
            if (guna2GradientTileButton1.FillColor == Color.FromArgb(40, 42, 52))
            {
                FrmThuTucThuePhong tp = new FrmThuTucThuePhong();
                tp.guna2GradientButton5.Visible = true;
                tp.Show();
            }
            else
            {
                this.ThongBao("Phòng đang được khách hàng sử dụng", HienThiThongBao.DangThongBao.Error);
            }
        }

        public void guna2GradientTileButton4_Click(object sender, EventArgs e)
        {
            if (guna2GradientTileButton4.FillColor == Color.FromArgb(40, 42, 52))
            {
                FrmThuTucThuePhong tp = new FrmThuTucThuePhong();
                tp.guna2GradientButton6.Visible = true;
                tp.Show();
            }
            else
            {
                this.ThongBao("Phòng đang được khách hàng sử dụng", HienThiThongBao.DangThongBao.Error);
            }
        }

        public void guna2GradientTileButton8_Click(object sender, EventArgs e)
        {
            if (guna2GradientTileButton8.FillColor == Color.FromArgb(40, 42, 52))
            {
                FrmThuTucThuePhong tp = new FrmThuTucThuePhong();
                tp.guna2GradientButton7.Visible = true;
                tp.Show();
            }
            else
            {
                this.ThongBao("Phòng đang được khách hàng sử dụng", HienThiThongBao.DangThongBao.Error);
            }
        }

        public void guna2GradientTileButton7_Click(object sender, EventArgs e)
        {
            if (guna2GradientTileButton7.FillColor == Color.FromArgb(40, 42, 52))
            {
                FrmThuTucThuePhong tp = new FrmThuTucThuePhong();
                tp.guna2GradientButton8.Visible = true;
                tp.Show();
            }
            else
            {
                this.ThongBao("Phòng đang được khách hàng sử dụng", HienThiThongBao.DangThongBao.Error);
            }
        }

        public void guna2GradientTileButton9_Click(object sender, EventArgs e)
        {
            if (guna2GradientTileButton9.FillColor == Color.FromArgb(40, 42, 52))
            {
                FrmThuTucThuePhong tp = new FrmThuTucThuePhong();
                tp.guna2GradientButton9.Visible = true;
                tp.Show();
            }
            else
            {
                this.ThongBao("Phòng đang được khách hàng sử dụng", HienThiThongBao.DangThongBao.Error);
            }
        }

        public void guna2GradientTileButton11_Click(object sender, EventArgs e)
        {
            FrmThuTucThuePhong tp = new FrmThuTucThuePhong();
            tp.Show();
        }

        private void guna2GradientTileButton11_Click_1(object sender, EventArgs e)
        {
            if (guna2GradientTileButton11.FillColor == Color.FromArgb(40, 42, 52))
            {
                FrmThuTucThuePhong tp = new FrmThuTucThuePhong();
                tp.guna2GradientButton10.Visible = true;
                tp.Show();
            }
            else
            {
                this.ThongBao("Phòng đang được khách hàng sử dụng", HienThiThongBao.DangThongBao.Error);
            }
        }
    }
}
