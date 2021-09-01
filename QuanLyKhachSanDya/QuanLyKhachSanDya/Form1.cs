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
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            this.SetStyle(ControlStyles.ResizeRedraw, true);
        }
        DataQLKS dt = new DataQLKS();
        private const int cGrip = 16;
        private const int cCaption = 32;
        protected override void WndProc(ref Message m)
        {
            if(m.Msg==0x84)
            {
                Point pos = new Point(m.LParam.ToInt32());
                pos = this.PointToClient(pos);
                if(pos.Y < cCaption)
                {
                    m.Result = (IntPtr)2;
                    return;
                }
                if(pos.X >= ClientSize.Width - cGrip && pos.Y >=this.ClientSize.Height - cGrip)
                {
                    m.Result = (IntPtr)17;
                    return;
                }

            }
            base.WndProc(ref m);
        }
        private void guna2PictureBox4_Click(object sender, EventArgs e)
        {

        }

        private void guna2TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void guna2TextBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void guna2Panel2_Paint(object sender, PaintEventArgs e)
        {

        }

        private void Form1_Load(object sender, EventArgs e)
        {
            loadcb();
        }
        void loadcb()
        {
            guna2ComboBox1.DataSource = dt.comboboxdangkynv();
            guna2ComboBox1.DisplayMember = "MANV";
            guna2ComboBox1.ValueMember = "MANV";
        }
        public void ThongBao(string msg, HienThiThongBao.DangThongBao type)
        {
            HienThiThongBao f = new HienThiThongBao();
            f.setAlert(msg, type);
        }
        Menu formMenu = new Menu();
        private void guna2Button1_Click(object sender, EventArgs e)
        {
            if(guna2TextBox1.Text == "" || guna2TextBox2.Text == "")
            {
                this.ThongBao("Không được để trống", HienThiThongBao.DangThongBao.Error);
            }              
            else
            {
                if (dt.dangnhap(guna2TextBox1.Text, guna2TextBox2.Text) == 1)
                {
                    formMenu.Show();
                    this.Hide();
                    this.ThongBao("Đăng nhập thành công", HienThiThongBao.DangThongBao.Success);
                    formMenu.guna2HtmlLabel3.Text = ("Xin chào" + " " + dt.tennv1(dt.tennv(guna2TextBox1.Text))).ToUpper();
                    formMenu.guna2HtmlLabel5.Text = dt.tennv(guna2TextBox1.Text);
                    dt.suatinhtrangnv1(dt.tennv(guna2TextBox1.Text));
                }
                else if (dt.dangnhap1(guna2TextBox1.Text, guna2TextBox2.Text) == 1)
                {
                    formMenu.Show();
                    formMenu.guna2HtmlLabel3.Text = ("Xin chào" + " " + "AD").ToUpper();
                    formMenu.guna2GradientButton2.Enabled = true;
                    formMenu.guna2GradientButton10.Enabled = true;
                    dt.suatinhtrangad(guna2TextBox1.Text);
                    this.Hide();
                    this.ThongBao("Đăng nhập thành công", HienThiThongBao.DangThongBao.Success);
                }
                else
                {
                    this.ThongBao("Tên tài khoản hoặc mật khẩu không hợp lệ", HienThiThongBao.DangThongBao.Error);
                }
            }    
        }

        private void guna2TextBox1_KeyDown(object sender, KeyEventArgs e)
        {
            if(e.KeyCode==Keys.Enter)
            {
                guna2TextBox2.Focus();
                
            }    
        }

        private void guna2TextBox2_KeyDown(object sender, KeyEventArgs e)
        {
            if(e.KeyCode==Keys.Enter)
            {
                guna2Button1_Click(sender,e);
            }    
        }

        private void guna2Button2_Click(object sender, EventArgs e)
        {
            guna2Panel3.Visible = true;
            guna2HtmlLabel1.Visible = false;
            
        }

        private void guna2ComboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void guna2Button4_Click(object sender, EventArgs e)
        {
            guna2HtmlLabel1.Visible = true;
            guna2Panel3.Visible = false;
            guna2TextBox4.Clear();
            guna2TextBox3.Clear();
            guna2TextBox5.Clear();
            

        }

        private void guna2Button3_Click(object sender, EventArgs e)
        {
            if (guna2TextBox3.Text == guna2TextBox5.Text)
            {
                if (guna2ComboBox1.Text == string.Empty)
                {
                    this.ThongBao("Không tồn tại nhân viên !!", HienThiThongBao.DangThongBao.Info);
                }
                else
                {
                    dt.themtaikhoan(guna2ComboBox1.SelectedValue.ToString(), guna2TextBox4.Text, guna2TextBox3.Text);
                    this.ThongBao("Tạo tài khoản thành công", HienThiThongBao.DangThongBao.Success);
                    guna2TextBox1.Text = guna2TextBox4.Text;
                    guna2TextBox2.Text = guna2TextBox3.Text;
                    guna2TextBox4.Clear();
                    guna2TextBox3.Clear();
                    guna2TextBox5.Clear();
                    guna2Panel3.Visible = false;
                    guna2HtmlLabel1.Visible = true;
                    guna2HtmlLabel4.Text = guna2ComboBox1.Text;
                    loadcb();
                }
            }
            else if(guna2TextBox3.Text!=guna2TextBox5.Text)
            {
                this.ThongBao("Mật khẩu chưa trùng khớp", HienThiThongBao.DangThongBao.Error);
            }   
            

        }

        private void guna2HtmlLabel4_TextChanged(object sender, EventArgs e)
        {
            dt.tennv(guna2TextBox1.Text);
        }

        private void guna2TextBox6_TextChanged(object sender, EventArgs e)
        {
            dt.tennv(guna2TextBox1.Text);
        }
    }
}
