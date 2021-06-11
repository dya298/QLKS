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
    public partial class FrmThuTucThuePhong : Form
    {
        public FrmThuTucThuePhong()
        {
            InitializeComponent();          
        }
        DataQLKS dt = new DataQLKS();
        FrmThuePhong tp = new FrmThuePhong();
        private void guna2HtmlLabel2_Click(object sender, EventArgs e)
        {
            
        }
        void loadcb()
        {
                guna2ComboBox1.DataSource = dt.comboboxtenkh();
                guna2ComboBox1.DisplayMember = "TenKH";
                guna2ComboBox1.ValueMember = "MaKH";
            
        }
        public void ThongBao(string msg, HienThiThongBao.DangThongBao type)
        {
            HienThiThongBao f = new HienThiThongBao();
            f.setAlert(msg, type);
        }   
        private void guna2GradientButton1_Click(object sender, EventArgs e)
        {             
                dt.thuephong("P001", guna2ComboBox1.SelectedValue.ToString(), guna2DateTimePicker1.Value, guna2DateTimePicker2.Value, 1000000);
            this.ThongBao("Thuê phòng thành công", HienThiThongBao.DangThongBao.Success);
            
                this.Close();
            
                        
        }
        private void FrmThuTucThuePhong_Load(object sender, EventArgs e)
        {
            loadcb();
        }

        private void guna2GradientButton2_Click(object sender, EventArgs e)
        {
            dt.thuephong("P002", guna2ComboBox1.SelectedValue.ToString(), guna2DateTimePicker1.Value, guna2DateTimePicker2.Value, 1000000);
            this.ThongBao("Thuê phòng thành công", HienThiThongBao.DangThongBao.Success);
           
            this.Close();

           
        }

        private void guna2GradientButton3_Click(object sender, EventArgs e)
        {
            dt.thuephong("P003", guna2ComboBox1.SelectedValue.ToString(), guna2DateTimePicker1.Value, guna2DateTimePicker2.Value, 1000000);
            this.ThongBao("Thuê phòng thành công", HienThiThongBao.DangThongBao.Success);
            
            this.Close();
           
        }
        void dkcb()
        {
            
        }
        private void guna2GradientButton4_Click(object sender, EventArgs e)
        {
            dt.thuephong("P004", guna2ComboBox1.SelectedValue.ToString(), guna2DateTimePicker1.Value, guna2DateTimePicker2.Value, 1000000);
            this.ThongBao("Thuê phòng thành công", HienThiThongBao.DangThongBao.Success);
            
            this.Close();
           
        }

        private void guna2GradientButton5_Click(object sender, EventArgs e)
        {
            dt.thuephong("P005", guna2ComboBox1.SelectedValue.ToString(), guna2DateTimePicker1.Value, guna2DateTimePicker2.Value, 1000000);
            this.ThongBao("Thuê phòng thành công", HienThiThongBao.DangThongBao.Success);
           
            this.Close();
           
        }

        private void guna2GradientButton6_Click(object sender, EventArgs e)
        {
            dt.thuephong("P007", guna2ComboBox1.SelectedValue.ToString(), guna2DateTimePicker1.Value, guna2DateTimePicker2.Value, 1000000);
            this.ThongBao("Thuê phòng thành công", HienThiThongBao.DangThongBao.Success);
           
            this.Close();
            
        }

        private void guna2GradientButton7_Click(object sender, EventArgs e)
        {
            dt.thuephong("P008", guna2ComboBox1.SelectedValue.ToString(), guna2DateTimePicker1.Value, guna2DateTimePicker2.Value, 1000000);
            this.ThongBao("Thuê phòng thành công", HienThiThongBao.DangThongBao.Success);
           
            this.Close();
            
        }

        private void guna2GradientButton8_Click(object sender, EventArgs e)
        {
            dt.thuephong("P009", guna2ComboBox1.SelectedValue.ToString(), guna2DateTimePicker1.Value, guna2DateTimePicker2.Value, 1000000);
            this.ThongBao("Thuê phòng thành công", HienThiThongBao.DangThongBao.Success);
            
            this.Close();
           
        }

        private void guna2GradientButton9_Click(object sender, EventArgs e)
        {
            dt.thuephong("P010", guna2ComboBox1.SelectedValue.ToString(), guna2DateTimePicker1.Value, guna2DateTimePicker2.Value, 1000000);
            this.ThongBao("Thuê phòng thành công", HienThiThongBao.DangThongBao.Success);
           
            this.Close();
            
        }

        private void guna2GradientButton10_Click(object sender, EventArgs e)
        {
            dt.thuephong("P011", guna2ComboBox1.SelectedValue.ToString(), guna2DateTimePicker1.Value, guna2DateTimePicker2.Value, 1000000);
            this.ThongBao("Thuê phòng thành công", HienThiThongBao.DangThongBao.Success);
            
            this.Close();
            
        }

        private void guna2ImageCheckBox1_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void guna2ImageCheckBox1_Click(object sender, EventArgs e)
        {
            if (guna2ImageCheckBox1.Checked == true)
            {
                dt.themdv(guna2ComboBox1.SelectedValue.ToString(), "DV005");
            }
            else
            {
                dt.xoapdv(guna2ComboBox1.SelectedValue.ToString());
            }    
        }

        private void guna2ImageCheckBox2_Click(object sender, EventArgs e)
        {

            if (guna2ImageCheckBox2.Checked == true)
            {
                dt.themdv(guna2ComboBox1.SelectedValue.ToString(), "DV002");
            }
            else
            {
                dt.xoapdv(guna2ComboBox1.SelectedValue.ToString());
            }
        }

        private void guna2ImageCheckBox4_Click(object sender, EventArgs e)
        {
            if (guna2ImageCheckBox4.Checked == true)
            {
                dt.themdv(guna2ComboBox1.SelectedValue.ToString(), "DV003");
            }
            else
            {
                dt.xoapdv(guna2ComboBox1.SelectedValue.ToString());
            }
        }

        private void guna2ImageCheckBox5_Click(object sender, EventArgs e)
        {
            if (guna2ImageCheckBox5.Checked == true)
            {
                dt.themdv(guna2ComboBox1.SelectedValue.ToString(), "DV004");
            }
            else
            {
                dt.xoapdv(guna2ComboBox1.SelectedValue.ToString());
            }
        }

        private void guna2ImageCheckBox3_Click(object sender, EventArgs e)
        {
            if (guna2ImageCheckBox3.Checked == true)
            {
                dt.themdv(guna2ComboBox1.SelectedValue.ToString(), "DV001");
            }
            else
            {
                dt.xoapdv(guna2ComboBox1.SelectedValue.ToString());
            }
        }
    }
}
