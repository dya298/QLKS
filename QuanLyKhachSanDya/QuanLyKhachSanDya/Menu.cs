using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using FontAwesome.Sharp;
using BLLvsDAL;
namespace QuanLyKhachSanDya
{
    public partial class Menu : Form
    {
        DataQLKS dt = new DataQLKS();
        public Menu()
        {
            InitializeComponent();
            
        }
        private Form formconn;
       

        private struct RGBColors
        {
            public static Color color1 = Color.FromArgb(172, 126, 241);
            public static Color color2 = Color.FromArgb(249, 118, 176);
            public static Color color3 = Color.FromArgb(253, 138, 114);
            public static Color color4 = Color.FromArgb(95, 77, 221);
            public static Color color5 = Color.FromArgb(249, 88, 155);
            public static Color color6 = Color.FromArgb(24, 161, 251);
        }

        private void guna2GradientButton4_Click(object sender, EventArgs e)
        {

        }

        public void guna2GradientButton1_Click(object sender, EventArgs e)
        {
            guna2GradientButton1.FillColor = Color.FromArgb(255, 128, 0);
            guna2GradientButton1.HoverState.FillColor2 = Color.FromArgb(40, 42, 52);
            //
            FormBenTrong(new FrmKhachHang());
            //2
            guna2GradientButton2.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton2.FillColor2 = Color.FromArgb(40, 42, 52);
            //3
            guna2GradientButton3.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton3.FillColor2 = Color.FromArgb(40, 42, 52);
            //4
            guna2GradientButton4.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton4.FillColor2 = Color.FromArgb(40, 42, 52);
            //5
            guna2GradientButton5.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton5.FillColor2 = Color.FromArgb(40, 42, 52);
            //6
            guna2GradientButton6.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton6.FillColor2 = Color.FromArgb(40, 42, 52);
            //7
            guna2GradientButton8.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton8.FillColor2 = Color.FromArgb(40, 42, 52);
            //
            guna2GradientButton9.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton9.FillColor2 = Color.FromArgb(40, 42, 52);
            //
            guna2GradientButton10.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton10.FillColor2 = Color.FromArgb(40, 42, 52);
            //
            guna2GradientButton11.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton11.FillColor2 = Color.FromArgb(40, 42, 52);
        }

        private void guna2CircleButton2_Click(object sender, EventArgs e)
        {
            guna2Separator1.Visible = true;
            guna2PictureBox5.Visible = true;
            guna2PictureBox6.Visible = true;
            guna2PictureBox7.Visible = true;
            guna2CircleButton2.Visible = false;
            guna2CircleButton3.Visible = true;
            guna2Panel1.Visible = false;
            guna2Panel1.Width = 218;
            guna2Transition1.ShowSync(guna2Panel1);

        }

        private void guna2CircleButton1_Click(object sender, EventArgs e)
        {
            guna2Separator1.Visible = true;
            guna2PictureBox5.Visible = false;
            guna2PictureBox6.Visible = false;
            guna2PictureBox7.Visible = false;
            guna2Panel1.Visible = false;
            guna2CircleButton2.Visible = true;
            guna2CircleButton3.Visible = false;
            guna2Panel1.Width = 64;
            guna2Transition1.ShowSync(guna2Panel1);
        }
        private void Menu_Load(object sender, EventArgs e)
        {
            dt.suatinhtrangnv1(guna2HtmlLabel4.Text.ToString());
            guna2CircleButton2.Visible = false;
            guna2HtmlLabel2.Text = "HOME";
            guna2NotificationPaint1.Text = dt.noti().ToString();
            FormBenTrong(new Home());
            
        }
        
        private void FormBenTrong(Form fromcon)
        {
            if(formconn != null)
            {
                formconn.Close();
            }
                formconn = fromcon;
                fromcon.TopLevel = false;   
                fromcon.FormBorderStyle = FormBorderStyle.None;
                fromcon.Dock = DockStyle.Fill;
                guna2Panel2.Controls.Add(fromcon);
                guna2Panel2.Tag = fromcon;
                fromcon.BringToFront();
                fromcon.Show();
            guna2HtmlLabel2.Text = fromcon.Text.ToUpper();
        }
        private void guna2GradientButton2_Click(object sender, EventArgs e)
        {
            guna2GradientButton2.FillColor = Color.FromArgb(255, 128, 0);
            guna2GradientButton2.HoverState.FillColor2 = Color.FromArgb(40, 42, 52);
            FormBenTrong(new FrmNhanVien());
            //2
            guna2GradientButton1.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton1.FillColor2 = Color.FromArgb(40, 42, 52);
            //3
            guna2GradientButton3.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton3.FillColor2 = Color.FromArgb(40, 42, 52);
            //4
            guna2GradientButton4.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton4.FillColor2 = Color.FromArgb(40, 42, 52);
            //5
            guna2GradientButton5.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton5.FillColor2 = Color.FromArgb(40, 42, 52);
            //6
            guna2GradientButton6.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton6.FillColor2 = Color.FromArgb(40, 42, 52);
            //7
            guna2GradientButton8.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton8.FillColor2 = Color.FromArgb(40, 42, 52);
            //
            guna2GradientButton9.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton9.FillColor2 = Color.FromArgb(40, 42, 52);
            //
            guna2GradientButton10.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton10.FillColor2 = Color.FromArgb(40, 42, 52);
            //
            guna2GradientButton11.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton11.FillColor2 = Color.FromArgb(40, 42, 52);
        }

        private void guna2GradientButton3_Click(object sender, EventArgs e)
        {
            guna2GradientButton3.FillColor = Color.FromArgb(255, 128, 0);
            guna2GradientButton3.HoverState.FillColor2 = Color.FromArgb(40, 42, 52);
            FormBenTrong(new FrmPhong());
            //2
            guna2GradientButton2.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton2.FillColor2 = Color.FromArgb(40, 42, 52);
            //3
            guna2GradientButton1.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton1.FillColor2 = Color.FromArgb(40, 42, 52);
            //4
            guna2GradientButton4.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton4.FillColor2 = Color.FromArgb(40, 42, 52);
            //5
            guna2GradientButton5.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton5.FillColor2 = Color.FromArgb(40, 42, 52);
            //6
            guna2GradientButton6.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton6.FillColor2 = Color.FromArgb(40, 42, 52);
            //7
            guna2GradientButton8.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton8.FillColor2 = Color.FromArgb(40, 42, 52);
            //
            guna2GradientButton9.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton9.FillColor2 = Color.FromArgb(40, 42, 52);
            //
            guna2GradientButton10.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton10.FillColor2 = Color.FromArgb(40, 42, 52);
            //
            guna2GradientButton11.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton11.FillColor2 = Color.FromArgb(40, 42, 52);

        }

        private void guna2GradientButton4_Click_1(object sender, EventArgs e)
        {
            guna2GradientButton4.FillColor = Color.FromArgb(255, 128, 0);
            guna2GradientButton4.HoverState.FillColor2 = Color.FromArgb(40, 42, 52);
            FormBenTrong(new FrmDichVu());
            //2
            guna2GradientButton2.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton2.FillColor2 = Color.FromArgb(40, 42, 52);
            //3
            guna2GradientButton3.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton3.FillColor2 = Color.FromArgb(40, 42, 52);
            //4
            guna2GradientButton1.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton1.FillColor2 = Color.FromArgb(40, 42, 52);
            //5
            guna2GradientButton5.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton5.FillColor2 = Color.FromArgb(40, 42, 52);
            //6
            guna2GradientButton6.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton6.FillColor2 = Color.FromArgb(40, 42, 52);
            //7
            guna2GradientButton8.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton8.FillColor2 = Color.FromArgb(40, 42, 52);
            //
            guna2GradientButton9.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton9.FillColor2 = Color.FromArgb(40, 42, 52);
            //
            guna2GradientButton10.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton10.FillColor2 = Color.FromArgb(40, 42, 52);
            //
            guna2GradientButton11.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton11.FillColor2 = Color.FromArgb(40, 42, 52);
        }

        public void guna2GradientButton5_Click(object sender, EventArgs e)
        {
            guna2GradientButton5.FillColor = Color.FromArgb(255, 128, 0);
            guna2GradientButton5.HoverState.FillColor2 = Color.FromArgb(40, 42, 52);
            FormBenTrong(new FrmThuePhong());
            //2
            guna2GradientButton2.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton2.FillColor2 = Color.FromArgb(40, 42, 52);
            //3
            guna2GradientButton3.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton3.FillColor2 = Color.FromArgb(40, 42, 52);
            //4
            guna2GradientButton4.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton4.FillColor2 = Color.FromArgb(40, 42, 52);
            //5
            guna2GradientButton1.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton1.FillColor2 = Color.FromArgb(40, 42, 52);
            //6
            guna2GradientButton6.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton6.FillColor2 = Color.FromArgb(40, 42, 52);
            //7
            guna2GradientButton8.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton8.FillColor2 = Color.FromArgb(40, 42, 52);
            //
            guna2GradientButton9.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton9.FillColor2 = Color.FromArgb(40, 42, 52);
            //
            guna2GradientButton10.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton10.FillColor2 = Color.FromArgb(40, 42, 52);
            //
            guna2GradientButton11.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton11.FillColor2 = Color.FromArgb(40, 42, 52);
        }

        public void guna2GradientButton6_Click(object sender, EventArgs e)
        {
            guna2NotificationPaint1.Text = dt.noti().ToString();
            guna2GradientButton6.FillColor = Color.FromArgb(255, 128, 0);
            guna2GradientButton6.HoverState.FillColor2 = Color.FromArgb(40, 42, 52);
            FormBenTrong(new Frmtinhtien());
            //2
            guna2GradientButton2.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton2.FillColor2 = Color.FromArgb(40, 42, 52);
            //3
            guna2GradientButton3.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton3.FillColor2 = Color.FromArgb(40, 42, 52);
            //4
            guna2GradientButton4.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton4.FillColor2 = Color.FromArgb(40, 42, 52);
            //5
            guna2GradientButton5.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton5.FillColor2 = Color.FromArgb(40, 42, 52);
            //6
            guna2GradientButton1.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton1.FillColor2 = Color.FromArgb(40, 42, 52);
            //7
            guna2GradientButton8.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton8.FillColor2 = Color.FromArgb(40, 42, 52);
            //
            guna2GradientButton9.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton9.FillColor2 = Color.FromArgb(40, 42, 52);
            //
            guna2GradientButton10.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton10.FillColor2 = Color.FromArgb(40, 42, 52);
            //
            guna2GradientButton11.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton11.FillColor2 = Color.FromArgb(40, 42, 52);
        }

        private void guna2CircleButton3_Click(object sender, EventArgs e)
        {
            guna2Separator1.Visible = false;
            guna2PictureBox5.Visible = false;
            guna2PictureBox6.Visible = false;
            guna2PictureBox7.Visible = false;
            guna2Panel1.Visible = false;
            guna2CircleButton2.Visible = true;
            guna2CircleButton3.Visible = false;
            guna2Panel1.Width = 64;
            guna2Transition1.ShowSync(guna2Panel1);
        }
        public void ThongBao(string msg, HienThiThongBao.DangThongBao type)
        {
            HienThiThongBao f = new HienThiThongBao();
            f.setAlert(msg, type);
        }
        
        private void guna2GradientButton7_Click(object sender, EventArgs e)
        {
            dt.suatinhtrangnv0();
            Form1 frmdangnhap = new Form1();
            frmdangnhap.Show();
            dt.capnhatnhanvien(guna2HtmlLabel5.Text);
            this.Hide();
            this.ThongBao("Đăng xuất thành công", HienThiThongBao.DangThongBao.Success);
        }
        
        private void Menu_Activated(object sender, EventArgs e)
        {
            guna2CircleButton2.Visible = false;
            guna2HtmlLabel2.Text = "HOME";
            guna2NotificationPaint1.Text = dt.noti().ToString();           
        }

        private void guna2GradientButton5_FontChanged(object sender, EventArgs e)
        {
                
        }

        private void guna2HtmlLabel3_Click(object sender, EventArgs e)
        {

        }

        private void guna2GradientButton8_Click(object sender, EventArgs e)
        {
            guna2GradientButton8.FillColor = Color.FromArgb(255, 128, 0);
            guna2GradientButton8.HoverState.FillColor2 = Color.FromArgb(40, 42, 52);
            FormBenTrong(new FrmTuVan());
            //2
            guna2GradientButton2.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton2.FillColor2 = Color.FromArgb(40, 42, 52);
            //3
            guna2GradientButton3.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton3.FillColor2 = Color.FromArgb(40, 42, 52);
            //4
            guna2GradientButton4.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton4.FillColor2 = Color.FromArgb(40, 42, 52);
            //5
            guna2GradientButton1.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton1.FillColor2 = Color.FromArgb(40, 42, 52);
            //6
            guna2GradientButton6.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton6.FillColor2 = Color.FromArgb(40, 42, 52);
            //7
            guna2GradientButton5.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton5.FillColor2 = Color.FromArgb(40, 42, 52);
            //
            guna2GradientButton9.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton9.FillColor2 = Color.FromArgb(40, 42, 52);
            //
            guna2GradientButton10.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton10.FillColor2 = Color.FromArgb(40, 42, 52);
            //
            guna2GradientButton11.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton11.FillColor2 = Color.FromArgb(40, 42, 52);

        }

        private void guna2GradientButton9_Click(object sender, EventArgs e)
        {
            guna2GradientButton9.FillColor = Color.FromArgb(255, 128, 0);
            guna2GradientButton9.HoverState.FillColor2 = Color.FromArgb(40, 42, 52);
            FormBenTrong(new FrmHD());
            //2
            guna2GradientButton2.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton2.FillColor2 = Color.FromArgb(40, 42, 52);
            //3
            guna2GradientButton3.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton3.FillColor2 = Color.FromArgb(40, 42, 52);
            //4
            guna2GradientButton4.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton4.FillColor2 = Color.FromArgb(40, 42, 52);
            //5
            guna2GradientButton1.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton1.FillColor2 = Color.FromArgb(40, 42, 52);
            //6
            guna2GradientButton6.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton6.FillColor2 = Color.FromArgb(40, 42, 52);
            //7
            guna2GradientButton5.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton5.FillColor2 = Color.FromArgb(40, 42, 52);
            //
            guna2GradientButton8.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton8.FillColor2 = Color.FromArgb(40, 42, 52);
            //
            guna2GradientButton10.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton10.FillColor2 = Color.FromArgb(40, 42, 52);
            //
            guna2GradientButton11.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton11.FillColor2 = Color.FromArgb(40, 42, 52);
        }

        private void guna2GradientButton10_Click(object sender, EventArgs e)
        {
            guna2GradientButton10.FillColor = Color.FromArgb(255, 128, 0);
            guna2GradientButton10.HoverState.FillColor2 = Color.FromArgb(40, 42, 52);
            FormBenTrong(new FrmThongKe());
            //2
            guna2GradientButton2.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton2.FillColor2 = Color.FromArgb(40, 42, 52);
            //3
            guna2GradientButton3.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton3.FillColor2 = Color.FromArgb(40, 42, 52);
            //4
            guna2GradientButton4.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton4.FillColor2 = Color.FromArgb(40, 42, 52);
            //5
            guna2GradientButton1.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton1.FillColor2 = Color.FromArgb(40, 42, 52);
            //6
            guna2GradientButton6.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton6.FillColor2 = Color.FromArgb(40, 42, 52);
            //7
            guna2GradientButton5.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton5.FillColor2 = Color.FromArgb(40, 42, 52);
            //
            guna2GradientButton8.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton8.FillColor2 = Color.FromArgb(40, 42, 52);
            //
            guna2GradientButton9.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton9.FillColor2 = Color.FromArgb(40, 42, 52);
            //
            guna2GradientButton11.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton11.FillColor2 = Color.FromArgb(40, 42, 52);
        }

        private void guna2GradientButton11_Click(object sender, EventArgs e)
        {
            guna2GradientButton11.FillColor = Color.FromArgb(255, 128, 0);
            guna2GradientButton11.HoverState.FillColor2 = Color.FromArgb(40, 42, 52);
            FormBenTrong(new FrmDangKy());
            //2
            guna2GradientButton2.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton2.FillColor2 = Color.FromArgb(40, 42, 52);
            //3
            guna2GradientButton3.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton3.FillColor2 = Color.FromArgb(40, 42, 52);
            //4
            guna2GradientButton4.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton4.FillColor2 = Color.FromArgb(40, 42, 52);
            //5
            guna2GradientButton1.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton1.FillColor2 = Color.FromArgb(40, 42, 52);
            //6
            guna2GradientButton6.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton6.FillColor2 = Color.FromArgb(40, 42, 52);
            //7
            guna2GradientButton5.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton5.FillColor2 = Color.FromArgb(40, 42, 52);
            //
            guna2GradientButton8.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton8.FillColor2 = Color.FromArgb(40, 42, 52);
            //
            guna2GradientButton9.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton9.FillColor2 = Color.FromArgb(40, 42, 52);
            //
            guna2GradientButton10.FillColor = Color.FromArgb(40, 42, 52);
            guna2GradientButton10.FillColor2 = Color.FromArgb(40, 42, 52);
        }
    }
}
