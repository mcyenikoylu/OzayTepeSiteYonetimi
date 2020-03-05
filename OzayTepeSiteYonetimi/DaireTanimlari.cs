using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;
using DevExpress.XtraBars;
using DevExpress.XtraGrid.Views.Grid;
using DevExpress.XtraEditors;

namespace OzayTepeSiteYonetimi
{
    public partial class DaireTanimlari : DevExpress.XtraBars.Ribbon.RibbonForm
    {
        public DaireTanimlari()
        {
            InitializeComponent();
        }
        DataTable dt;

        private void DaireTanimlari_Load(object sender, EventArgs e)
        {
            SiteDBEntities2 db = new SiteDBEntities2();
            var list = db.S_Daireler().Where(c => c.IsDeleted == false).ToList();
            dt = DataControls.ListToDt(list);
            gridControl1.DataSource = dt;
        }

        private void btnSil_ItemClick(object sender, ItemClickEventArgs e)
        {
            try
            {
                if (XtraMessageBox.Show("Kayıdı silmek istediğinizden eminmisiniz?", "Uyarı", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == System.Windows.Forms.DialogResult.Yes)
                {
                    SiteDBEntities2 db = new SiteDBEntities2();
                    int kayitid = (gridView1.GetFocusedRowCellValue("ID") == DBNull.Value) ? -1 : (int)gridView1.GetFocusedRowCellValue("ID");
                    db.UDI_DaireTanimlari(2, kayitid, "");
                    var list = db.S_Daireler().Where(c => c.IsDeleted == false).ToList();
                    dt = DataControls.ListToDt(list);
                    gridControl1.DataSource = dt;
                }
            }
            catch (Exception hata)
            {

                throw;
            }
        }

        private void gridView1_RowUpdated(object sender, DevExpress.XtraGrid.Views.Base.RowObjectEventArgs e)
        {
            try
            {
                SiteDBEntities2 db = new SiteDBEntities2();
                
                if (!(gridView1.PostEditor() && gridView1.UpdateCurrentRow()))
                    return;

                GridView view = sender as GridView;
                Object obj = view.GetRow(view.FocusedRowHandle);

                if (obj == null)
                    return;
                
                int kayitid = (gridView1.GetFocusedRowCellValue("ID") == DBNull.Value) ? -1 : (int)gridView1.GetFocusedRowCellValue("ID");
                db.UDI_DaireTanimlari(1, kayitid, gridView1.GetFocusedRowCellValue("DaireNo").ToString());
                
                var list = db.S_Daireler().Where(c => c.IsDeleted == false).ToList();
                dt = DataControls.ListToDt(list);
                gridControl1.DataSource = dt;
            }
            catch (Exception hata)
            {

                throw;
            }
        }

        private void DaireTanimlari_FormClosing(object sender, FormClosingEventArgs e)
        {
            this.DialogResult = DialogResult.OK;
            this.Close();
        }
    }
}