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
    public partial class FrmThongKe : Form
    {
        public FrmThongKe()
        {
            InitializeComponent();
        }
        DataQLKS dt = new DataQLKS();
        private void guna2Button1_Click(object sender, EventArgs e)
        {
            
          
        }

        private void guna2Button2_Click(object sender, EventArgs e)
        {
            
            
        }

        private void chart1_Click(object sender, EventArgs e)
        {

        }

        private void guna2Button3_Click(object sender, EventArgs e)
        {
            //string[] list = new string[200];
            //int i = 0;
            //foreach (DateTime c in dt.date())
            //{
            //    DateTime date = new DateTime(c.Year, c.Month, c.Day, 0, 0, 0);
            //    chart1.Series["Date"].Points.AddXY(date.Day.ToString() + "/" +
            //        date.Month.ToString() + "/" +
            //        date.Year.ToString()
            //        , dt.thongkeHD(date.Date));
            //         list[i] = dt.thongkeHD(date.Date).ToString();
            //    if(i<=list.Count())
            //    {
            //        chart1.Series["Date"].Points[i].Label = list[i];
            //    }    
            //    i++;              
            //}          
        }

        private void FrmThongKe_Load(object sender, EventArgs e)
        {
            float tuan1 = 0;
            string[] list = new string[200];
            int i = 0;
            foreach (DateTime c in dt.date())
            {
                DateTime date = new DateTime(c.Year, c.Month, c.Day, 0, 0, 0);
                chart1.Series["Income"].Points.AddXY((date.Day.ToString() + "/" +
                    date.Month.ToString() + "/" +
                    date.Year.ToString())
                    , dt.thongkeHD(date.Date));
                list[i] = dt.thongkeHD(date.Date).ToString();
                if (i <= list.Count())
                {
                    chart1.Series["Income"].Points[i].Label = list[i] + "$";
                }
                i++;
            }
        }

        private void guna2Button1_Click_1(object sender, EventArgs e)
        {
            //float tuan1 = 0;
            //float tuan2 = 0;
            //float tuan3 = 0;
            //float tuan4 = 0;
            //string[] list = new string[200];
            //int i = 0;
            //foreach (DateTime c in dt.date())
            //{
            //    DateTime date = new DateTime(c.Year, c.Month, c.Day, 0, 0, 0);               
            //    if (int.Parse(date.Month.ToString()) == int.Parse(guna2TextBox1.Text))                   
            //    {
            //        if(int.Parse(date.Day.ToString()) <= 7)
            //        {
            //            tuan1 += dt.thongkeHD(date.Date);
            //        }    
            //        else if(int.Parse(date.Day.ToString()) >= 8 && int.Parse(date.Day.ToString()) <= 14)
            //        {
            //            tuan2 += dt.thongkeHD(date.Date);
            //        }    
            //        else if(int.Parse(date.Day.ToString()) >= 15 && int.Parse(date.Day.ToString()) <= 21)
            //        {
            //            tuan3 += dt.thongkeHD(date.Date);
            //        }
            //        else if (int.Parse(date.Day.ToString()) >= 22 && int.Parse(date.Day.ToString()) <= 31)
            //        {
            //            tuan4 += dt.thongkeHD(date.Date);
            //        }
            //    }               
            //    //list[i] = dt.thongkeHD(date.Date).ToString();
            //    //if (i <= list.Count())
            //    //{
            //    //    chart1.Series["Income"].Points[i].Label = list[i] + "$";
            //    //}
            //    //i++;
            //}
            //chart1.Series["Income"].Points.AddXY("Tuần 1"
            //       , tuan1);
            //chart1.Series["Income"].Points.AddXY("Tuần 2"
            //    , tuan2);
            //chart1.Series["Income"].Points.AddXY("Tuần 3"
            //    , tuan3);
            //chart1.Series["Income"].Points.AddXY("Tuần 4"
            //    , tuan4);    
          
        }
    }
}
