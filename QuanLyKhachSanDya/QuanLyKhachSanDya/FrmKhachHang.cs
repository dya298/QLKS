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
    public partial class FrmKhachHang : Form
    {
        public FrmKhachHang()
        {
            InitializeComponent();
        }
        DataQLKS dt = new DataQLKS();
        private void FrmKhachHang_Load(object sender, EventArgs e)
        {
            loadKH();
        }
        void loadKH()
        {
            guna2DataGridView1.DataSource = dt.LoadKhachHang();
        }
        void cleartextbox()
        {
            guna2TextBox1.Text = "";
            guna2TextBox2.Text = "";
            guna2TextBox3.Text = "";
            guna2TextBox4.Text = "";
            guna2TextBox5.Text = "";
        }
        public void ThongBao(string msg, HienThiThongBao.DangThongBao type)
        {
            HienThiThongBao f = new HienThiThongBao();
            f.setAlert(msg, type);
        }



        private void guna2Chip1_Click(object sender, EventArgs e)
        {

        }

        private void toolStrip1_ItemClicked(object sender, ToolStripItemClickedEventArgs e)
        {
            
        }

        private void guna2TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void guna2Panel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void guna2DataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void toolStripButton4_Click(object sender, EventArgs e)
        {
            if (guna2TextBox1.Text == string.Empty || guna2TextBox2.Text == string.Empty || guna2TextBox4.Text == string.Empty || guna2TextBox3.Text == string.Empty || guna2TextBox5.Text == string.Empty)
            {
                this.ThongBao("Thông tin còn trống", HienThiThongBao.DangThongBao.Info);
            }
            else if (dt.KiemtraTrungKH(guna2TextBox1.Text) == 1)
            {
                this.ThongBao("Khóa chính bị trùng", HienThiThongBao.DangThongBao.Error);
            }
            else
            {
                if (guna2RadioButton1.Checked==true)
                    {
                        dt.themkh(guna2TextBox1.Text, guna2TextBox2.Text,                         guna2DateTimePicker1.Value,guna2RadioButton1.Text,guna2TextBox4.Text,guna2TextBox3.Text,guna2TextBox5.Text);
                    
                    this.ThongBao("Thêm thành công ", HienThiThongBao.DangThongBao.Success);
                    loadKH();
                    }
                else
                {
                        dt.themkh(guna2TextBox1.Text, guna2TextBox2.Text, guna2DateTimePicker1.Value, guna2RadioButton2.Text, guna2TextBox4.Text, guna2TextBox3.Text, guna2TextBox5.Text);
                    this.ThongBao("Thêm thành công ", HienThiThongBao.DangThongBao.Success);
                    loadKH();
                }
                
            }
            cleartextbox();
        }

        private void toolStripButton1_Click(object sender, EventArgs e)
        {

        }

        private void toolStripButton3_Click(object sender, EventArgs e)
        {
            dt.xoakh(guna2TextBox1.Text);
            this.ThongBao("Xóa thành công ", HienThiThongBao.DangThongBao.Success);
            //dt.xoakhlist(guna2TextBox1.Text);
            loadKH();
            cleartextbox();
        }

        private void toolStripButton2_Click(object sender, EventArgs e)
        {
            if (guna2RadioButton1.Checked == true)
            {
                dt.suakh(guna2TextBox1.Text, guna2TextBox2.Text, guna2DateTimePicker1.Value, guna2RadioButton1.Text, guna2TextBox4.Text, guna2TextBox3.Text, guna2TextBox5.Text);
                this.ThongBao("Sửa thành công ", HienThiThongBao.DangThongBao.Success);
                loadKH();
            }
            else
            {
                dt.suakh(guna2TextBox1.Text, guna2TextBox2.Text, guna2DateTimePicker1.Value, guna2RadioButton2.Text, guna2TextBox4.Text, guna2TextBox3.Text, guna2TextBox5.Text);
                this.ThongBao("Sửa thành công ", HienThiThongBao.DangThongBao.Success);
                loadKH();
            }
            //dt.suakhlist(guna2TextBox1.Text, guna2TextBox2.Text);
            cleartextbox();
            
        }

        private void guna2DataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {

                guna2TextBox1.Text = guna2DataGridView1.CurrentRow.Cells[0].Value.ToString();
                guna2TextBox2.Text = guna2DataGridView1.CurrentRow.Cells[1].Value.ToString();
                guna2DateTimePicker1.Text = guna2DataGridView1.CurrentRow.Cells[2].Value.ToString();
                if (guna2RadioButton2.Text == guna2DataGridView1.CurrentRow.Cells[3].Value.ToString())
                {
                    guna2RadioButton2.Checked = true;
                }
                else
                {
                    guna2RadioButton1.Checked = true;
                }
                guna2TextBox4.Text = guna2DataGridView1.CurrentRow.Cells[4].Value.ToString();
                guna2TextBox3.Text = guna2DataGridView1.CurrentRow.Cells[5].Value.ToString();
                guna2TextBox5.Text = guna2DataGridView1.CurrentRow.Cells[6].Value.ToString();
            }
            else
            {
                MessageBox.Show("Vui lòng nhấp vào datagridview");
            }    
           
            

        }
    }
}
