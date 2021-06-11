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
    public partial class FrmTienThanhToan : Form
    {
        DataQLKS dt = new DataQLKS();
        public FrmTienThanhToan()
        {
            InitializeComponent();
        }
 
        private void FrmTienThanhToan_Load(object sender, EventArgs e)
        {
            guna2DataGridView1.DataSource = dt.loadv();
           
        }

        private void guna2ControlBox2_Click(object sender, EventArgs e)
        {
            this.Close();
        }
        public void ThongBao(string msg, HienThiThongBao.DangThongBao type)
        {
            HienThiThongBao f = new HienThiThongBao();
            f.setAlert(msg, type);
        }
        private void guna2TextBox2_TextChanged(object sender, EventArgs e)
        {

        }
        Menu mn = new Menu();
        
        public void guna2GradientButton10_Click(object sender, EventArgs e)
        {
            // Xử lý chức năng
            dt.xoathuephong(guna2HtmlLabel7.Text);
            dt.xoadichvuphong(guna2HtmlLabel21.Text);
            dt.suanoti(guna2HtmlLabel7.Text);
            // Xử lý hóa đơn
            dt.themhoadon(guna2HtmlLabel21.Text,dt.takeNV(),float.Parse(guna2HtmlLabel22.Text));
            this.ThongBao("Thanh toán thành công", HienThiThongBao.DangThongBao.Success);
            this.Close();
            
            
        }

        private void guna2GradientButton1_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void FrmTienThanhToan_Activated(object sender, EventArgs e)
        {
            
        }

        private void guna2CustomGradientPanel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void guna2HtmlLabel23_Click(object sender, EventArgs e)
        {

        }
    }
}
