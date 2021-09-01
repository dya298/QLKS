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
    public partial class FrmTuVan : Form
    {
        KetNoiSQL ketnoi = new KetNoiSQL();
        List<Gain> dsGain = new List<Gain>();
        TreeNode tree = new TreeNode();        
        TreeNode currentNode;                
        Entropy enstropyS;
        List<string> lstAtt = new List<string>();
        const string BANG_DL = "DuLieu";
        const string BANG_LUAT = "Luat";
        List<Luat> dsLuat = new List<Luat>();
        Luat luatTimDuoc = new Luat();
        public FrmTuVan()
        {
            InitializeComponent();
        }

        private void FrmTuVan_Load(object sender, EventArgs e)
        {
            try
            {
                //tao cay quyet dinh
                DataTable D = ketnoi.truyVanSQL("select * from " + BANG_DL + " where 1=2");
                lstAtt = new List<string>();
                for (int i = 0; i < D.Columns.Count; i++)
                {
                    lstAtt.Add(D.Columns[i].ColumnName);
                }
                backgroundWorker1.RunWorkerAsync();
            }
            catch (Exception)
            {

            }
        }

        private void backgroundWorker1_DoWork(object sender, DoWorkEventArgs e)
        {
            try
            {
                tree = id3("", lstAtt);
                timLuat(tree);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void backgroundWorker1_ProgressChanged(object sender, ProgressChangedEventArgs e)
        {

        }

        private void backgroundWorker1_RunWorkerCompleted(object sender, RunWorkerCompletedEventArgs e)
        {
            guna2GradientButton1.Enabled = true;       
            guna2ComboBox1.Enabled = true;
            treeView1.Nodes.Clear();
            treeView1.Nodes.Add(tree);
            currentNode = treeView1.TopNode;
            taoCauHoi(currentNode);
        }
        public bool taoCauHoi(TreeNode node)
        {
            string sCauHoi = node.Text;

            List<string> ans = new List<string>();
            for (int i = 0; i < node.Nodes.Count; i++)
            {
                ans.Add(node.Nodes[i].Text);
            }
            if (sCauHoi.Equals("Không Nên") || sCauHoi.Equals("Nên"))
            {
                guna2GradientButton1.Enabled = false;
                guna2ComboBox1.Enabled = false;
                string message = "";
                if (sCauHoi.Equals("Không Nên"))
                {
                    message = "Bạn không thuê phòng này";
                }
                if (sCauHoi.Equals("Yes"))
                {
                    message = "Bạn nên thuê phòng này";
                }

                MessageBox.Show(message);
                return true;

            }
            else
            {
                guna2HtmlLabel1.Text = sCauHoi;
                guna2ComboBox1.DataSource = ans;
                return false;
            }
        }
        //tính độ lợi thông tin
        Gain GetGainMax(string sql, string dkthem)
        {
            try
            {
                DataTable bangDL = ketnoi.truyVanSQL(sql + dkthem);
                List<Gain> dsGan = new List<Gain>();
                for (int i = 1; i < bangDL.Columns.Count - 1; i++)
                {
                    Gain g = initGain(bangDL.Columns[i].ColumnName.ToString(), dkthem);
                    dsGan.Add(g);
                }
                Gain maxGain = dsGan[0];
                for (int i = 1; i < dsGan.Count; i++)
                {
                    if (dsGan[i].layGain > maxGain.layGain)
                    {
                        maxGain = dsGan[i];
                    }
                }
                return maxGain;
            }
            catch (Exception e)
            {
                MessageBox.Show(e.Message);
                return null;
            }
        }
        private void customStyleNode(TreeNode t, Color c)
        {
            t.ForeColor = c;
        }

        //Khởi tạo cây quyết định theo thuật toán ID3,C4.5
        public TreeNode id3(string dkThem, List<string> attributes)
        {
            try
            {
                string sql = "select " + attributes[0];
                for (int i = 1; i < attributes.Count; i++)
                {
                    sql += ", " + attributes[i];
                }
                sql += " from " + BANG_DL + " where 1=1 ";
                DataTable D = ketnoi.truyVanSQL(sql + dkThem);

                //ktra xem tất cả các mẫu có đều thuộc một lớp hay không
                DataTable temp = ketnoi.truyVanSQL("select XacNhan from " + BANG_DL + " where 1=1 " + dkThem +
                    " group by XacNhan");
                if (temp.Rows.Count == 1)
                {
                    string name = temp.Rows[0][0].ToString();
                    TreeNode tem = new TreeNode(name);
                    tem.Name = name;
                    tem.ForeColor = System.Drawing.Color.Red;
                    return tem;
                }

                //Đặt t là nhãn phổ biến nhất của thuộc tính mục tiêu trong D
                string nhanPhoBienTrongD = timNhanPhoBienNhat(dkThem);

                //Nếu attribute rỗng trả về cây có 1 nút gốc trỏ bởi t
                if (attributes.Count == 2)
                {//bỏ qua cột đầu tiên là stt và cột cuối cùng là taget buy
                    TreeNode nodePhoBienNhat = new TreeNode(nhanPhoBienTrongD);
                    nodePhoBienNhat.Name = nhanPhoBienTrongD;
                    customStyleNode(nodePhoBienNhat, System.Drawing.Color.Orange);
                    return nodePhoBienNhat;
                }
                //aStar là thuộc tính phân cấp tốt nhất của D
                Gain aStart = GetGainMax(sql + dkThem, dkThem);
                TreeNode t = new TreeNode(aStart.LabelNode);
                customStyleNode(t, System.Drawing.Color.Blue);
                //thuộc tính quyết định của t là aStar 
                for (int i = 0; i < aStart.DSEntropyS.Count; i++)
                {
                    Entropy a = aStart.DSEntropyS[i];

                    //bổ sung nhánh mới dưới t ứng với aStart = a
                    TreeNode tNew = new TreeNode(t.Text + "=" + a.LabelNode);
                    t.Nodes.Add(tNew);

                    customStyleNode(tNew, System.Drawing.Color.Green);
                    //Đặt D_a là tập con của D chứa các mẫu aStart = a
                    string dkMoi = dkThem + " and " + aStart.LabelNode + " = '" + a.LabelNode + "'";
                    DataTable D_a = ketnoi.truyVanSQL(sql + dkMoi);
                    //Nếu D_a rỗng, dưới nhánh mới sẽ thêm nút lá với nhãn phổ biến nhất trong D
                    if (D_a.Rows.Count == 0)
                    {
                        TreeNode node = new TreeNode(nhanPhoBienTrongD);
                        customStyleNode(node, System.Drawing.Color.Red);
                        
                        node.Name = nhanPhoBienTrongD;

                        tNew.Nodes.Add(node);
                    }
                    else
                    {
                        List<string> attCon = new List<string>(attributes);
                        attCon.Remove(aStart.LabelNode);
                        tNew.Nodes.Add(id3(dkMoi, attCon));
                    }
                }
                return t;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                return null;
            }
        }

        //tìm nhãn phổ biến nhất 
        string timNhanPhoBienNhat(string dkThem)
        {
            string sql = "SELECT XacNhan FROM " + BANG_DL + " where 1=1 " + dkThem + " GROUP BY XacNhan order by count(*) desc";
            string s = "";
            try
            {
                s = ketnoi.truyVanSQL(sql).Rows[0][0].ToString();
            }
            catch (Exception e)
            {
                MessageBox.Show(e.Message);
            }
            return s;
        }

        //Tính độ lợi thông tin của thuộc tính
        Gain initGain(string nameAttribute, string dieuKienThem)
        {
            try
            {
                enstropyS = new Entropy("s" + nameAttribute, countSql("where XacNhan = 'Nên' " + dieuKienThem), countSql("where XacNhan = 'Không Nên' " + dieuKienThem));
                List<Entropy> ds = new List<Entropy>();
                //Khoi tao danh sach
                DataTable da = ketnoi.truyVanSQL("SELECT DISTINCT " + nameAttribute + " from  " + BANG_DL);
                int yesCount = 0, noCount = 0;
                for (int i = 0; i < da.Rows.Count; i++)
                {
                    string labelNode = da.Rows[i][0].ToString();
                    yesCount = countSql("where " + nameAttribute + " = '" + labelNode + "' and XacNhan = 'Nên' " + dieuKienThem);
                    noCount = countSql("where " + nameAttribute + " = '" + labelNode + "' and XacNhan = 'Không Nên' " + dieuKienThem);
                    Entropy entro = new Entropy(labelNode, yesCount, noCount);
                    ds.Add(entro);
                }
                return new Gain(nameAttribute, ds, enstropyS);
            }
            catch (Exception e)
            {

                MessageBox.Show(e.Message);
                return null;
            }
        }

        //trả về số lượng với điều kiện truyền vào theo truy vấn SQL
        int countSql(string where)
        {
            try
            {
                string sql = "Select count(stt) from " + BANG_DL + " " + where;
                return Int32.Parse(ketnoi.truyVanSQL(sql).Rows[0][0].ToString());
            }
            catch (Exception e)
            {
                MessageBox.Show(e.Message);
                return 0;
            }
        }

        // Các phương thức sinh tập luật từ cây quyết định

        //tìm ra các Node là KQ NO, Yes, No Result  đổ vào dsLuat
        public void timLuat(TreeNode tree)
        {
            TreeNode[] nodeNo = tree.Nodes.Find("Nên", true);
            TreeNode[] nodeYes = tree.Nodes.Find("Không Nên", true);
            sinhLuat(nodeNo);
            sinhLuat(nodeYes);
        }

        //sinh ra các luật tương ứng theo mảng Node truyền vào
        public void sinhLuat(TreeNode[] arr)
        {
            for (int i = 0; i < arr.Length; i++)
            {
                Luat l = new Luat();
                l.XacNhan = arr[i].Text;
                TreeNode currentNo = arr[i];
                while (currentNo.Parent != null)
                {
                    currentNo = currentNo.Parent;
                    string name = currentNo.Parent.Text;
                    string value = currentNo.Text.Substring(currentNo.Text.IndexOf("=") + 1);
                    setAttributeLuat(lstAtt, name, value, ref l);
                    currentNo = currentNo.Parent;
                }
                dsLuat.Add(l);
            }
        }

        //gán giá trị vào thuộc tính của  một luật truyền vào
        public void setAttributeLuat(List<string> dsAtt, string nameAtt, string value, ref Luat l)
        {
            int vt = -1;
            for (int i = 1; i < dsAtt.Count; i++)
            {
                if (nameAtt.Equals(dsAtt[i], StringComparison.OrdinalIgnoreCase))
                {
                    vt = i;
                    break;
                }
            }
            switch (vt)
            {
                case 1:
                    l.DoTuoi = value;
                    break;
                case 2:
                    l.GioiTinh = value;
                    break;
                case 3:
                    l.ThuNhap = value;
                    break;
                case 4:
                    l.SuDungDichVu = value;
                    break;
                case 5:
                    l.MauPhong = value;
                    break;
                case 6:
                    l.LoaiPhong = value;
                    break;
                case 7:
                    l.XacNhan = value;
                    break;
            }
        }

        private void guna2GradientButton1_Click(object sender, EventArgs e)
        {
            for (int i = 0; i < currentNode.Nodes.Count; i++)
            {
                TreeNode treeRoot = currentNode.Nodes[i];

                if (treeRoot.Text.Equals(guna2ComboBox1.SelectedValue.ToString()))
                {
                    treeView1.SelectedNode = treeRoot;
                    treeView1.SelectedNode.Expand();
                    bool c = taoCauHoi(treeRoot.Nodes[0]);
                    currentNode = treeRoot.Nodes[0];
                    if (c)
                    {

                        Luat l = new Luat();
                        l.XacNhan = currentNode.Text;
                        TreeNode currentNo = currentNode;
                        while (currentNo.Parent != null)
                        {
                            currentNo = currentNo.Parent;
                            string name = currentNo.Parent.Text;
                            string value = currentNo.Text.Substring(currentNo.Text.IndexOf("=") + 1);
                            setAttributeLuat(lstAtt, name, value, ref l);
                            currentNo = currentNo.Parent;
                        }
                        luatTimDuoc = l;

                    }
                    break;
                }
            }
        }
    }
}
