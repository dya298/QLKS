using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;
using BLLvsDAL;
namespace QuanLyKhachSanDya
{
    public partial class FrmDichVu : Form
    {
        public FrmDichVu()
        {
            InitializeComponent();
        }
        DataQLKS dt = new DataQLKS();
        private void FrmDichVu_Load(object sender, EventArgs e)
        {
            loaddv();
        }
        void loaddv()
        {
            guna2DataGridView1.DataSource = dt.LoadDichVu();
        }
        void cleartextbox()
        {
            guna2TextBox1.Text = "";
            guna2TextBox2.Text = "";
            guna2TextBox3.Text = "";
        }
        public void ThongBao(string msg, HienThiThongBao.DangThongBao type)
        {
            HienThiThongBao f = new HienThiThongBao();
            f.setAlert(msg, type);
        }
        private void toolStripButton4_Click(object sender, EventArgs e)
        {
            if (guna2TextBox1.Text == string.Empty || guna2TextBox2.Text == string.Empty || guna2TextBox3.Text == string.Empty)
            {
                this.ThongBao("Thông tin còn trống", HienThiThongBao.DangThongBao.Info);
            }
            else if (dt.KiemtraTrungDV(guna2TextBox1.Text) == 1)
            {
                this.ThongBao("Khóa chính bị trùng", HienThiThongBao.DangThongBao.Error);
            }
            else
            {
                    dt.themdv(guna2TextBox1.Text, guna2TextBox2.Text, float.Parse(guna2TextBox3.Text));
                    this.ThongBao("Thêm thành công ", HienThiThongBao.DangThongBao.Success);
                    loaddv();
                
            }
            cleartextbox();
        }

        private void guna2DataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            guna2TextBox1.Text = guna2DataGridView1.CurrentRow.Cells[0].Value.ToString();
            guna2TextBox2.Text = guna2DataGridView1.CurrentRow.Cells[1].Value.ToString();
            guna2TextBox3.Text = guna2DataGridView1.CurrentRow.Cells[2].Value.ToString();
        }

        private void toolStripButton3_Click(object sender, EventArgs e)
        {
            dt.xoadv(guna2TextBox1.Text);
            loaddv();
            cleartextbox();
            this.ThongBao("Xóa thành công", HienThiThongBao.DangThongBao.Success);
        }

        private void toolStripButton2_Click(object sender, EventArgs e)
        {
            dt.suadv(guna2TextBox1.Text, guna2TextBox2.Text, float.Parse(guna2TextBox3.Text));
            loaddv();
            cleartextbox();
            this.ThongBao("Sửa thành công", HienThiThongBao.DangThongBao.Success);
        }

        private void guna2TextBox3_TextChanged(object sender, EventArgs e)
        {
        
        }
        private void guna2TextBox3_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!Char.IsDigit(e.KeyChar)&&!Char.IsControl(e.KeyChar))
            {
                e.Handled = true;
            }    
        }
    }
}
