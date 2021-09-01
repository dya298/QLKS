using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using BLLvsDAL;
namespace QuanLyKhachSanDya
{
    public partial class FrmThuTuc : Form
    {
        public FrmThuTuc()
        {
            InitializeComponent();
            cnn = new SqlConnection("Data Source=DESKTOP-1M1S910\\SQLEXPRESS;Initial Catalog=QuanLyKhachSan;Integrated Security=True");
            string sql_Phong = "select * from DichVu";
            dap = new SqlDataAdapter(sql_Phong, cnn);
            ds_dv = new DataSet();
            dap.Fill(ds_dv, "DichVu");
            // 
            key[0] = ds_dv.Tables["DichVu"].Columns[0];
            ds_dv.Tables["DichVu"].PrimaryKey = key;
        }
        SqlConnection cnn;
        SqlDataAdapter dap;
        DataSet ds_dv;
        DataColumn[] key = new DataColumn[1];
        DataQLKS dt = new DataQLKS();
        public void ThongBao(string msg, HienThiThongBao.DangThongBao type)
        {
            HienThiThongBao f = new HienThiThongBao();
            f.setAlert(msg, type);
        }
        void loadcb()
        {
            guna2ComboBox1.DataSource = dt.comboboxtenkh();
            guna2ComboBox1.DisplayMember = "TenKH";
            guna2ComboBox1.ValueMember = "MaKH";

        }
        private void FrmThuTuc_Load(object sender, EventArgs e)
        {
            foreach(DataRow dataRow in ds_dv.Tables["DichVu"].Rows)
            {
                CheckBox checkBox = new CheckBox() { Width=50,Height=50};
                checkBox.Text = dataRow["TenDV"].ToString();
                checkBox.Margin = new Padding(5, 5, 5, 5);                   
                checkBox.Click += btnClick;
                checkBox.Tag = dataRow;
                flowLayoutPanel1.Controls.Add(checkBox);
            }    
            loadcb();
        }
        void btnClick(object sender,EventArgs e)
        {
            string mdv = ((sender as CheckBox).Tag as DataRow)["MaDV"].ToString();
            string tt = ((sender as CheckBox).Tag as DataRow)["TrangThai"].ToString();
            ShowDialogDV(mdv,tt);            
        }
        void ShowDialogDV(string mdv,string tt)
        {            
            if (tt == "0")
            {
                DataRow dataRow = ds_dv.Tables["DichVu"].Rows.Find(mdv.ToString());
                if (dataRow != null)
                {
                    dataRow["TrangThai"] = "1";
                }
                //
                SqlCommandBuilder sqlCommandBuilder = new SqlCommandBuilder(dap);
                dap.Update(ds_dv, "DichVu");
                dt.themdv(guna2ComboBox1.SelectedValue.ToString(), mdv.ToString());
                             
            }
            else
            {
                DataRow dataRow = ds_dv.Tables["DichVu"].Rows.Find(mdv.ToString());
                if (dataRow != null)
                {
                    dataRow["TrangThai"] = "0";
                }
                //
                SqlCommandBuilder sqlCommandBuilder = new SqlCommandBuilder(dap);
                dap.Update(ds_dv, "DichVu");
                dt.xoapdv(guna2ComboBox1.SelectedValue.ToString());
            }
            
        }

        private void guna2GradientButton11_Click(object sender, EventArgs e)
        {
            dt.thuephong(guna2HtmlLabel11.Text, guna2ComboBox1.SelectedValue.ToString(), guna2DateTimePicker1.Value, guna2DateTimePicker2.Value, 1000000);
            this.ThongBao("Thuê phòng thành công", HienThiThongBao.DangThongBao.Success);
            this.Close();
        }

        private void guna2GradientButton1_Click(object sender, EventArgs e)
        {
            dt.thuephong(guna2HtmlLabel11.Text, guna2ComboBox1.SelectedValue.ToString(), guna2DateTimePicker1.Value, guna2DateTimePicker2.Value, 1000000);
            this.ThongBao("Thuê phòng thành công", HienThiThongBao.DangThongBao.Success);
            foreach (DataRow data in ds_dv.Tables["DichVu"].Rows)
            {
                DataRow dataRow = ds_dv.Tables["DichVu"].Rows.Find(data["MaDV"].ToString());
                if (dataRow != null)
                {
                    dataRow["TrangThai"] = "0";
                }
                SqlCommandBuilder sqlCommandBuilder = new SqlCommandBuilder(dap);
                dap.Update(ds_dv, "DichVu");
            }    
           
            this.Close();
        }
    }
}
