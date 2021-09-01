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
    public partial class FrmHD : Form
    {
        public FrmHD()
        {
            InitializeComponent();
        }
        DataQLKS dt = new DataQLKS();
        private void FrmHD_Load(object sender, EventArgs e)
        {
            guna2DataGridView1.DataSource = dt.loadhd();
            
        }

        private void guna2DataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void guna2DataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            guna2DataGridView2.DataSource = dt.loadcthd(int.Parse(guna2DataGridView1.CurrentRow.Cells[0].Value.ToString()));
        }

        private void toolStripButton4_Click(object sender, EventArgs e)
        {
            WordExport wordExport = new WordExport();
            string ngay = DateTime.Now.Day.ToString();
            string thang = DateTime.Now.Month.ToString();
            string nam = DateTime.Now.Year.ToString();
            wordExport.QuyetDinhKhenThuong(ngay, thang, nam, guna2DataGridView2.CurrentRow.Cells[3].Value.ToString(), dt.laydt(guna2DataGridView2.CurrentRow.Cells[3].Value.ToString()), dt.laydc(guna2DataGridView2.CurrentRow.Cells[3].Value.ToString()),
                guna2DataGridView2.CurrentRow.Cells[0].Value.ToString(), guna2DataGridView2.CurrentRow.Cells[1].Value.ToString(), guna2DataGridView2.CurrentRow.Cells[7].Value.ToString(), guna2DataGridView2.CurrentRow.Cells[8].Value.ToString(), guna2DataGridView2.CurrentRow.Cells[6].Value.ToString(), guna2DataGridView2.CurrentRow.Cells[10].Value.ToString(),
                 guna2DataGridView2.CurrentRow.Cells[3].Value.ToString(), "DYA");
        }
    }
}
