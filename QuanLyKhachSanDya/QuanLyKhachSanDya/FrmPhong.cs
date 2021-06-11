﻿using System;
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
    public partial class FrmPhong : Form
    {
        public FrmPhong()
        {
            InitializeComponent();
        }
        DataQLKS dt = new DataQLKS();
        private void FrmPhong_Load(object sender, EventArgs e)
        {
            loadp();
            loadcblp();
            loadcbmp();
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
        void loadp()
        {
           guna2DataGridView1.DataSource = dt.LoadPhong();
        }
        void loadcblp()
        {
            guna2ComboBox1.DataSource = dt.LoadCBlp();
            guna2ComboBox1.DisplayMember = "MoTa";
            guna2ComboBox1.ValueMember = "MaLoaiPhong";
        }
        void loadcbmp()
        {
            guna2ComboBox3.DataSource = dt.LoadCBmp();
            guna2ComboBox3.DisplayMember = "TenMauPhong";
            guna2ComboBox3.ValueMember = "MaMauPhong";
        }

        private void guna2DataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            guna2TextBox2.Text = guna2DataGridView1.CurrentRow.Cells[0].Value.ToString();
            guna2ComboBox1.SelectedValue = guna2DataGridView1.CurrentRow.Cells[1].Value.ToString();
            guna2ComboBox3.SelectedValue = guna2DataGridView1.CurrentRow.Cells[2].Value.ToString();
            guna2TextBox6.Text = guna2DataGridView1.CurrentRow.Cells[3].Value.ToString();
            guna2TextBox3.Text = guna2DataGridView1.CurrentRow.Cells[4].Value.ToString();
            

        }

        private void toolStripButton1_Click(object sender, EventArgs e)
        {
            if (guna2TextBox2.Text == string.Empty || guna2TextBox3.Text == string.Empty || guna2TextBox6.Text == string.Empty)
            {
                this.ThongBao("Thông tin còn trống", HienThiThongBao.DangThongBao.Info);
            }
            else if (dt.KiemtraTrungP(guna2TextBox2.Text,guna2ComboBox1.SelectedValue.ToString(),guna2ComboBox3.SelectedValue.ToString()) == 1)
            {
                this.ThongBao("Khóa chính bị trùng", HienThiThongBao.DangThongBao.Error);
            }
            else
            {
                dt.themphong(guna2TextBox2.Text,guna2ComboBox1.SelectedValue.ToString(),guna2ComboBox3.SelectedValue.ToString(), int.Parse(guna2TextBox6.Text),guna2TextBox3.Text);
                this.ThongBao("Thêm thành công ", HienThiThongBao.DangThongBao.Success);
                loadp();
            }
            cleartextbox();
        }

        private void toolStripButton5_Click(object sender, EventArgs e)
        {
            dt.xoap(guna2TextBox2.Text);
            loadp();
            cleartextbox();
            this.ThongBao("Xóa thành công", HienThiThongBao.DangThongBao.Success);
        }

        private void toolStripButton6_Click(object sender, EventArgs e)
        {
            if (guna2TextBox2.Text == string.Empty || guna2TextBox3.Text == string.Empty || guna2TextBox6.Text == string.Empty)
            {
                this.ThongBao("Thông tin còn trống", HienThiThongBao.DangThongBao.Info);
            }
            else
            {
            dt.suap(guna2TextBox2.Text, guna2ComboBox1.SelectedValue.ToString(), guna2ComboBox3.SelectedValue.ToString(), int.Parse(guna2TextBox6.Text), guna2TextBox3.Text);
            loadp();
            cleartextbox();
            this.ThongBao("Sửa thành công", HienThiThongBao.DangThongBao.Success);
            }
           
        }
    }
}
