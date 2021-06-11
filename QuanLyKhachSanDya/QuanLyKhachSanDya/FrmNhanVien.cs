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
    public partial class FrmNhanVien : Form
    {
        DataQLKS dt = new DataQLKS();
        public FrmNhanVien()
        {
            InitializeComponent();
        }

        private void FrmNhanVien_Load(object sender, EventArgs e)
        {
            loadnv();

        }
        void cleartextbox()
        {
            guna2TextBox6.Text = "";
            guna2TextBox7.Text = "";
            guna2TextBox8.Text = "";
            guna2TextBox9.Text = "";
            guna2TextBox10.Text = "";
        }
        public void ThongBao(string msg, HienThiThongBao.DangThongBao type)
        {
            HienThiThongBao f = new HienThiThongBao();
            f.setAlert(msg, type);
        }
        void loadnv()
        {
            guna2DataGridView1.DataSource = dt.LoadNhanVien();
            guna2ComboBox1.DisplayMember = "ChucVu";
        }
       
        void loadnv1()
        {

        }

        private void guna2Panel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void toolStripButton4_Click(object sender, EventArgs e)
        {
            if (guna2TextBox6.Text == string.Empty || guna2TextBox7.Text == string.Empty || guna2TextBox8.Text == string.Empty || guna2TextBox9.Text == string.Empty || guna2TextBox10.Text == string.Empty)
            {
                this.ThongBao("Thông tin còn trống", HienThiThongBao.DangThongBao.Info);
            }
            else if (dt.KiemtraTrungNV(guna2TextBox10.Text) == 1)
            {
                this.ThongBao("Khóa chính bị trùng", HienThiThongBao.DangThongBao.Error);
            }
            else
            {
                if (guna2RadioButton4.Checked == true)
                {
                    dt.themnv(guna2TextBox10.Text, guna2TextBox9.Text, guna2DateTimePicker2.Value, guna2RadioButton4.Text, guna2TextBox8.Text, guna2TextBox6.Text, guna2TextBox7.Text,guna2ComboBox1.Text);
                    this.ThongBao("Thêm thành công ", HienThiThongBao.DangThongBao.Success);
                    loadnv();
                }
                else
                {
                    dt.themnv(guna2TextBox10.Text, guna2TextBox9.Text, guna2DateTimePicker2.Value, guna2RadioButton3.Text, guna2TextBox8.Text, guna2TextBox6.Text, guna2TextBox7.Text, guna2ComboBox1.Text);
                    this.ThongBao("Thêm thành công ", HienThiThongBao.DangThongBao.Success);
                    loadnv();
                }
            }
            cleartextbox();
        }

        private void toolStripButton3_Click(object sender, EventArgs e)
        {
            dt.xoanv(guna2TextBox10.Text);
            this.ThongBao("Xóa thành công ", HienThiThongBao.DangThongBao.Success);
            loadnv();
            cleartextbox();
        }

        private void toolStripButton2_Click(object sender, EventArgs e)
        {
            if (guna2RadioButton4.Checked == true)
            {
                dt.suanv(guna2TextBox10.Text, guna2TextBox9.Text, guna2DateTimePicker2.Value, guna2RadioButton4.Text, guna2TextBox8.Text, guna2TextBox6.Text, guna2TextBox7.Text, guna2ComboBox1.Text);
                this.ThongBao("Sửa thành công ", HienThiThongBao.DangThongBao.Success);
                loadnv();
            }
            else
            {
                dt.suanv(guna2TextBox10.Text, guna2TextBox9.Text, guna2DateTimePicker2.Value, guna2RadioButton3.Text, guna2TextBox8.Text, guna2TextBox6.Text, guna2TextBox7.Text, guna2ComboBox1.Text);
                this.ThongBao("Sửa thành công ", HienThiThongBao.DangThongBao.Success);
                loadnv();
            }
            cleartextbox();
        }

        private void guna2DataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            guna2TextBox10.Text = guna2DataGridView1.CurrentRow.Cells[0].Value.ToString();
            guna2TextBox9.Text = guna2DataGridView1.CurrentRow.Cells[1].Value.ToString();
            guna2DateTimePicker2.Text = guna2DataGridView1.CurrentRow.Cells[2].Value.ToString();
            if (guna2RadioButton4.Text == guna2DataGridView1.CurrentRow.Cells[3].Value.ToString())
            {
                guna2RadioButton4.Checked = true;
            }
            else
            {
                guna2RadioButton3.Checked = true;
            }
            guna2TextBox8.Text = guna2DataGridView1.CurrentRow.Cells[4].Value.ToString();
            guna2TextBox6.Text = guna2DataGridView1.CurrentRow.Cells[5].Value.ToString();
            guna2TextBox7.Text = guna2DataGridView1.CurrentRow.Cells[6].Value.ToString();
            guna2ComboBox1.Text = guna2DataGridView1.CurrentRow.Cells[7].Value.ToString();
        }
    }
}
