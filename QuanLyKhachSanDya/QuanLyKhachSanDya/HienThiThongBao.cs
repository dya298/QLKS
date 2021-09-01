using QuanLyKhachSanDya.Properties;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyKhachSanDya
{
    public partial class HienThiThongBao : Form
    {
        public HienThiThongBao()
        {
            InitializeComponent();
        }

        private void HienThiThongBao_Load(object sender, EventArgs e)
        {
            
        }
        public enum DangThongBao
        {
            Success,
            Error,
            Info
        }
             
        private int x, y;

        private void guna2HtmlLabel1_Click(object sender, EventArgs e)
        {

        }

        private void guna2ControlBox1_Click(object sender, EventArgs e)
        {
            this.timer1.Interval = 1;
            this.action = HienThiThongBao.actionEnum.close;
        }

        public void setAlert(string msg, HienThiThongBao.DangThongBao type)
        {
            this.Opacity = 0.0;
            this.StartPosition = FormStartPosition.Manual;
            string fname;

            for (int i = 1; i < 10; i++)
            {
                fname = "alert" + i.ToString();
                HienThiThongBao f = (HienThiThongBao)Application.OpenForms[fname];

                if (f == null)
                {
                    this.Name = fname;
                    this.x = Screen.PrimaryScreen.WorkingArea.Width - this.Width + 15;
                    this.y = Screen.PrimaryScreen.WorkingArea.Height - this.Height * i - 5 * i;
                    this.Location = new Point(this.x, this.y);
                    break;
                }

            }

            this.x = Screen.PrimaryScreen.WorkingArea.Width - base.Width - 5;
            switch (type)
            {
                case HienThiThongBao.DangThongBao.Success:
                    this.guna2PictureBox1.Image = Resources.Checkmark_28px;
                    this.BackColor = Color.FromArgb(42, 171, 160);
                    break;
                case HienThiThongBao.DangThongBao.Error:
                    this.guna2PictureBox1.Image = Resources.Error_28px;
                    this.BackColor = Color.FromArgb(255, 121, 70);
                    break;
                case HienThiThongBao.DangThongBao.Info:
                    this.guna2PictureBox1.Image = Resources.Warning_28px;
                    this.BackColor = Color.FromArgb(255, 179, 2);
                    break;
            }
            this.guna2HtmlLabel1.Text = msg;

            

            this.Show();
            this.action = actionEnum.start;
            this.timer1.Interval = 1;
            this.timer1.Start();
         
          }
        public enum actionEnum
        {
            wait,
            start,
            close
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            switch (this.action)
            {
                case HienThiThongBao.actionEnum.wait:
                    this.timer1.Interval = 5000;
                    this.action = HienThiThongBao.actionEnum.close;
                    break;
                case HienThiThongBao.actionEnum.start:
                    this.timer1.Interval = 1;
                    this.Opacity += 0.1;
                    if (this.x < this.Location.X)
                    {
                        this.Left--;
                    }
                    else
                    {
                        if (this.Opacity == 1.0)
                        {
                            this.action = HienThiThongBao.actionEnum.wait;
                        }
                    }
                    break;
                case HienThiThongBao.actionEnum.close:
                    this.timer1.Interval = 1;
                    this.Opacity -= 0.1;

                    this.Left -= 3;
                    if (base.Opacity == 0.0)
                    {
                        base.Close();
                    }
                    break;
            }
        }

        private void guna2PictureBox2_Click(object sender, EventArgs e)
        {
            this.timer1.Interval = 1;
            this.action = HienThiThongBao.actionEnum.close;
        }

        private HienThiThongBao.actionEnum action;
    }
   
}



