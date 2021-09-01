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
    public partial class Frmtinhtien : Form
    {
        public Frmtinhtien()
        {
            InitializeComponent();
        }
        DataQLKS dt = new DataQLKS();
        private void Frmtinhtien_Load(object sender, EventArgs e)
        {
            guna2DataGridView1.DataSource = dt.loadthanhtoan();
            
        }
        FrmTienThanhToan tt = new FrmTienThanhToan();
        private void guna2DataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
           
        }

        private void guna2DataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            try
            {
                if (dataGridViewButtonColumn2.UseColumnTextForButtonValue)
                {
                    tt.StartPosition = FormStartPosition.CenterScreen;
                    tt.Show();
                    tt.guna2TextBox2.Text = dt.tenkh(guna2DataGridView1.SelectedRows[0].Cells[2].Value.ToString()).ToString();
                    tt.guna2TextBox1.Text = dt.tenphong(guna2DataGridView1.SelectedRows[0].Cells[1].Value.ToString()).ToString();
                    tt.guna2ComboBox1.DataSource = dt.tendv(guna2DataGridView1.SelectedRows[0].Cells[2].Value.ToString());
                    tt.guna2ComboBox1.DisplayMember = "TenDV";
                    tt.guna2HtmlLabel15.Text = dt.tenloaiphong(guna2DataGridView1.SelectedRows[0].Cells[3].Value.ToString());
                    tt.guna2HtmlLabel16.Text = dt.tenmauphong(guna2DataGridView1.SelectedRows[0].Cells[4].Value.ToString());
                    tt.guna2HtmlLabel13.Text = dt.tienmauphong(guna2DataGridView1.SelectedRows[0].Cells[1].Value.ToString(), guna2DataGridView1.SelectedRows[0].Cells[4].Value.ToString()).ToString();
                    tt.guna2HtmlLabel12.Text = dt.tienloaiphong(guna2DataGridView1.SelectedRows[0].Cells[1].Value.ToString(), guna2DataGridView1.SelectedRows[0].Cells[3].Value.ToString()).ToString();
                    tt.guna2HtmlLabel18.Text = dt.tienthanhtoan(guna2DataGridView1.SelectedRows[0].Cells[1].Value.ToString(), guna2DataGridView1.SelectedRows[0].Cells[3].Value.ToString(),
                        guna2DataGridView1.SelectedRows[0].Cells[4].Value.ToString(), guna2DataGridView1.SelectedRows[0].Cells[2].Value.ToString()).ToString();
                    tt.guna2HtmlLabel22.Text = dt.tienthanhtoan(guna2DataGridView1.SelectedRows[0].Cells[1].Value.ToString(), guna2DataGridView1.SelectedRows[0].Cells[3].Value.ToString(),
                        guna2DataGridView1.SelectedRows[0].Cells[4].Value.ToString(), guna2DataGridView1.SelectedRows[0].Cells[2].Value.ToString()).ToString();
                    tt.guna2HtmlLabel14.Text = dt.giadsdv(guna2DataGridView1.SelectedRows[0].Cells[2].Value.ToString()).ToString();
                    tt.guna2HtmlLabel17.Text = dt.tendsdv(guna2DataGridView1.SelectedRows[0].Cells[2].Value.ToString()).TrimEnd(',');
                    tt.guna2DateTimePicker1.Text = guna2DataGridView1.SelectedRows[0].Cells[5].Value.ToString();
                    tt.guna2DateTimePicker2.Text = guna2DataGridView1.SelectedRows[0].Cells[6].Value.ToString();
                    tt.guna2HtmlLabel7.Text = guna2DataGridView1.SelectedRows[0].Cells[1].Value.ToString();
                    tt.guna2HtmlLabel21.Text = guna2DataGridView1.SelectedRows[0].Cells[2].Value.ToString();
                    
                }
            }
            catch
            {
                MessageBox.Show("Cần phải reload trang!!!");
            }
        }

        private void Frmtinhtien_Activated(object sender, EventArgs e)
        {
            guna2DataGridView1.DataSource = dt.loadthanhtoan();
        }
    }
}
