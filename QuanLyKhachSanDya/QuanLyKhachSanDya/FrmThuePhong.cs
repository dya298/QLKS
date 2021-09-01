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
    public partial class FrmThuePhong : Form
    {
        SqlConnection cnn;
        SqlDataAdapter dap;
        DataSet ds_Phong;
        DataColumn[] key = new DataColumn[1];
        public FrmThuePhong()
        {
            InitializeComponent();
            cnn = new SqlConnection("Data Source=DESKTOP-1M1S910\\SQLEXPRESS;Initial Catalog=QuanLyKhachSan;Integrated Security=True");
            string sql_Phong = "select * from Phong";
            dap = new SqlDataAdapter(sql_Phong, cnn);
            ds_Phong = new DataSet();
            dap.Fill(ds_Phong, "Phong");
            // 
            key[0] = ds_Phong.Tables["Phong"].Columns[0];
            ds_Phong.Tables["Phong"].PrimaryKey = key;
            //
        }
        public void ThongBao(string msg, HienThiThongBao.DangThongBao type)
        {
            HienThiThongBao f = new HienThiThongBao();
            f.setAlert(msg, type);
        }
        DataQLKS dt = new DataQLKS();
        private void guna2ImageButton1_DoubleClick(object sender, EventArgs e)
        {
            
        }
        public void guna2GradientTileButton2_Click(object sender, EventArgs e)
        {
            

        }
       
        public void FrmThuePhong_Load(object sender, EventArgs e)
        {
            foreach(DataRow dataRow in ds_Phong.Tables["Phong"].Rows)
            {
                Button button = new Button() { Width = 129, Height = 200 };
                button.Text =  dataRow["MaPhong"].ToString();
                button.TextAlign = ContentAlignment.BottomCenter;
                button.FlatStyle = FlatStyle.Flat;
                button.AutoSize = true;
                button.Font = new Font("French Script MT", 11);
                button.Margin = new Padding(20, 20, 20, 20);
                button.Image = Image.FromFile(@"D:\download\QuanLyKhachSanDya\QuanLyKhachSanDya\bin\home.png");
                if (dt.KiemtraTrungP1(dataRow["MaPhong"].ToString()) == 1)
                {
                    button.BackColor = Color.FromArgb(0, 192, 0);
                }
                else
                {
                    button.BackColor = Color.FromArgb(40, 42, 52);
                }
                button.Click += btnClick;
                button.Tag = dataRow;
                flowLayoutPanel1.Controls.Add(button);
            }
            
        }      
        void btnClick(object sender,EventArgs e)
        {
            string mp = ((sender as Button).Tag as DataRow)["MaPhong"].ToString();
                ShowDialogPhong(mp);
        }
        void ShowDialogPhong(string mp)
        {
           
            if(dt.KiemtraTrungP1(mp)==1)
            {
                ThongBao("Đã có khách sử dụng phòng này", HienThiThongBao.DangThongBao.Error);
            }    
            else
            {
                FrmThuTuc frmThuTuc = new FrmThuTuc();
                frmThuTuc.guna2HtmlLabel11.Text = mp.ToString();
                frmThuTuc.Show();
            }                
        }

        private void FrmThuePhong_Activated(object sender, EventArgs e)
        {
           

        }
        private void guna2GradientTileButton2_Leave(object sender, EventArgs e)
        {          
            
        }
        public void guna2GradientTileButton3_Click(object sender, EventArgs e)
        {
           
        }

        public void guna2GradientTileButton6_Click(object sender, EventArgs e)
        {
            
        }

        public void guna2GradientTileButton5_Click(object sender, EventArgs e)
        {
           
        }

        public void guna2GradientTileButton1_Click(object sender, EventArgs e)
        {
        }

        public void guna2GradientTileButton4_Click(object sender, EventArgs e)
        {
        }

        public void guna2GradientTileButton8_Click(object sender, EventArgs e)
        {
           
        }

        public void guna2GradientTileButton7_Click(object sender, EventArgs e)
        {
           
        }

        public void guna2GradientTileButton9_Click(object sender, EventArgs e)
        {
           
        }

        public void guna2GradientTileButton11_Click(object sender, EventArgs e)
        {
           
        }

        private void guna2GradientTileButton11_Click_1(object sender, EventArgs e)
        {
            
        }

        private void flowLayoutPanel1_Paint(object sender, PaintEventArgs e)
        {

        }
    }
}
