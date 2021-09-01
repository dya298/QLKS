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
    public partial class FrmDangKy : Form
    {
        DataQLKS dt = new DataQLKS();
        public FrmDangKy()
        {
            InitializeComponent();
        }

        private void FrmDangKy_Load(object sender, EventArgs e)
        {
            loaddt();
        }
        public void ThongBao(string msg, HienThiThongBao.DangThongBao type)
        {
            HienThiThongBao f = new HienThiThongBao();
            f.setAlert(msg, type);
        }
        void loaddt()
        {
            guna2DataGridView1.DataSource = dt.Loaddangky();
        }
        FrmKhachHang menu = new FrmKhachHang();
        private void toolStripButton4_Click(object sender, EventArgs e)
        {          
               DialogResult dialogResult = MessageBox.Show("Hiện tại phòng còn trống :"+ " " +dt.tenphongdk(guna2DataGridView1.CurrentRow.Cells[2].Value.ToString(), guna2DataGridView1.CurrentRow.Cells[1].Value.ToString())
                    ,"Thủ tục thuê phòng",MessageBoxButtons.YesNoCancel,MessageBoxIcon.Question);
            if(dialogResult==DialogResult.Yes)
            {
                try
                {
                    menu.Show();
                    menu.guna2TextBox1.Text = "KH0" + (dt.sott() + 1).ToString();
                    menu.guna2TextBox2.Text = guna2DataGridView1.CurrentRow.Cells[5].Value.ToString();
                    menu.guna2TextBox4.Text = guna2DataGridView1.CurrentRow.Cells[7].Value.ToString();
                    menu.guna2TextBox3.Text = guna2DataGridView1.CurrentRow.Cells[6].Value.ToString();
                    menu.guna2TextBox5.Text = guna2DataGridView1.CurrentRow.Cells[8].Value.ToString();
                    
                }
                catch
                {
                    this.ThongBao("Xin hãy reload trang!!!", HienThiThongBao.DangThongBao.Error);
                }
            }    

        }
        private void toolStripButton3_Click(object sender, EventArgs e)
        {
            dt.xoaphieu(int.Parse(guna2DataGridView1.CurrentRow.Cells[0].Value.ToString()));
            loaddt();
            this.ThongBao("Xóa thành công !!", HienThiThongBao.DangThongBao.Success);

        }
    }
}
