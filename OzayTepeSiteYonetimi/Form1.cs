using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;
using DevExpress.XtraEditors;
using DevExpress.XtraReports.UI;
using DevExpress.LookAndFeel;
using DevExpress.XtraPrintingLinks;
using DevExpress.XtraGrid.Views.Grid;

namespace OzayTepeSiteYonetimi
{
    public partial class Form1 : DevExpress.XtraBars.Ribbon.RibbonForm
    {
        public Form1()
        {
            InitializeComponent();
        }
        void navBarControl_ActiveGroupChanged(object sender, DevExpress.XtraNavBar.NavBarGroupEventArgs e)
        {
            navigationFrame.SelectedPageIndex = navBarControl.Groups.IndexOf(e.Group);

            if (navigationFrame.SelectedPageIndex == 0)
            {
                KisiGridGetir();
                RibbonMenuGridAyarlari uc_gridAyarlari = new RibbonMenuGridAyarlari(ribbonPage.Text);
                uc_gridAyarlari.GrdView = gridView1;
                ribbonControl.MergeRibbon(uc_gridAyarlari.ribbonControl1);
            }
            else if (navigationFrame.SelectedPageIndex == 0)
            {
                CariGridGetir();
            }
        }
        void barButtonNavigation_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            int barItemIndex = barSubItemNavigation.ItemLinks.IndexOf(e.Link);
            navBarControl.ActiveGroup = navBarControl.Groups[barItemIndex];
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            RibbonMenuGridAyarlari uc_gridAyarlari = new RibbonMenuGridAyarlari(ribbonPage.Text);
            if (navigationFrame.SelectedPageIndex == 0)
                uc_gridAyarlari.GrdView = gridView1;

            ribbonControl.MergeRibbon(uc_gridAyarlari.ribbonControl1);

            SiteDBEntities2 db = new SiteDBEntities2();
            var bloklar = db.S_Bloklar().ToList();
            repositoryItemLookUpEdit1.DataSource = bloklar;
            var daireler = db.S_Daireler().ToList();
            repositoryItemLookUpEdit2.DataSource = daireler;
            var odemeTipi = db.S_OdemeTipi().ToList();
            repositoryItemLookUpEdit3.DataSource = odemeTipi;

            KisiGridGetir();
            CariGridGetir();
        }

        void KisiGridGetir()
        {
            SiteDBEntities2 db = new SiteDBEntities2();
            var list = db.S_Kisiler(-1).Where(c => c.IsDeleted == false).ToList();
            gridControl1.DataSource = list;
        }

        void CariGridGetir()
        {
            SiteDBEntities2 db = new SiteDBEntities2();
            var cari = db.S_CariIslemler().ToList();
            pivotGridControl1.DataSource = cari;
            //pivotGridControl1.ActiveFilter.
        }

        private void navBarYeniKisiEkle_LinkClicked(object sender, DevExpress.XtraNavBar.NavBarLinkEventArgs e)
        {
            int rowhandle = gridView1.FocusedRowHandle;
            YeniKisiEkle frm = new YeniKisiEkle(-1);
            frm.ShowDialog();
            if (frm.DialogResult == DialogResult.OK)
            {
                DataGetir(-1);//hepsini getir
            }
            gridView1.FocusedRowHandle = rowhandle;
        }

        int kisiid = -1;
        private void gridView1_FocusedRowChanged(object sender, DevExpress.XtraGrid.Views.Base.FocusedRowChangedEventArgs e)
        {
            int i = e.FocusedRowHandle;
            string id = gridView1.GetRowCellValue(i, "ID").ToString();
            if (id != "" || id != null)
            {
                lblAdSoyad.Text = gridView1.GetRowCellValue(i, "AdiSoyadi").ToString();

                lblBlok.Text = string.Format("{0} Blok, Daire {1}", repositoryItemLookUpEdit1.GetDisplayText(gridView1.GetRowCellValue(i, "BlokAdiID")).Trim(),
                    repositoryItemLookUpEdit2.GetDisplayText(gridView1.GetFocusedRowCellValue("DaireAdiID")).Trim());

                string Kiraci, Oturuyor = "";
                bool kiraciEvSahibi = Convert.ToBoolean(gridView1.GetRowCellValue(i, "KiraciEvsahibi"));
                if (kiraciEvSahibi)
                    Kiraci = "Kiracı";
                else
                    Kiraci = "Ev Sahibi";

                bool oturuyorAyrildi = Convert.ToBoolean(gridView1.GetRowCellValue(i, "OturuyorAyrildi"));
                if (oturuyorAyrildi)
                    Oturuyor = "Oturuyor";
                else
                    Oturuyor = "Ayrıldı";

                lblKiraci.Text = string.Format("{0}, {1}", Kiraci, Oturuyor);

                SiteDBEntities2 db = new SiteDBEntities2();
                var odeme = db.S_Odemeler(Convert.ToInt32(id)).Where(c => c.IsDeleted == false).OrderByDescending(c => c.VadeTarihi).ToList();
                gridControl2.DataSource = odeme;
                kisiid = Convert.ToInt32(id);
            }
        }

        private void gridView2_FocusedRowChanged(object sender, DevExpress.XtraGrid.Views.Base.FocusedRowChangedEventArgs e)
        {

        }

        private void gridView1_DoubleClick(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(gridView1.GetFocusedRowCellValue("ID"));
            int rowhandle = gridView1.FocusedRowHandle;
            YeniKisiEkle frm = new YeniKisiEkle(id);
            frm.ShowDialog();
            if (frm.DialogResult == DialogResult.OK)
            {
                DataGetir(-1); //hepsini getir
            }
            gridView1.FocusedRowHandle = rowhandle;
        }

        void DataGetir(int ID)
        {
            SiteDBEntities2 db = new SiteDBEntities2();
            var list = db.S_Kisiler(ID).Where(c => c.IsDeleted == false).ToList();
            gridControl1.DataSource = list;
        }

        private void navBarBorclandir_LinkClicked(object sender, DevExpress.XtraNavBar.NavBarLinkEventArgs e)
        {
            int id = Convert.ToInt32(gridView1.GetFocusedRowCellValue("ID"));
            string ad = gridView1.GetFocusedRowCellValue("AdiSoyadi").ToString();
            int rowhandle = gridView1.FocusedRowHandle;
            Borclandir frm = new Borclandir(id, ad);
            frm.ShowDialog();
            if (frm.DialogResult == DialogResult.OK)
            {
                DataGetir(-1); //hepsini getir
            }
            gridView1.FocusedRowHandle = rowhandle;
        }

        private void navBarOdemeEkle_LinkClicked(object sender, DevExpress.XtraNavBar.NavBarLinkEventArgs e)
        {
            int rowhandle = gridView1.FocusedRowHandle;
            OdemeEkle frm = new OdemeEkle(kisiid, lblAdSoyad.Text, -1);
            frm.ShowDialog();
            if (frm.DialogResult == DialogResult.OK)
            {
                SiteDBEntities2 db = new SiteDBEntities2();
                var odeme = db.S_Odemeler(kisiid).OrderByDescending(c => c.VadeTarihi).ThenByDescending(m => m.ID).Where(c => c.IsDeleted == false).ToList();
                gridControl2.DataSource = odeme;
            }
            gridView1.FocusedRowHandle = rowhandle;
        }

        private void repositoryItemDateEdit1_ButtonClick(object sender, DevExpress.XtraEditors.Controls.ButtonPressedEventArgs e)
        {
            if (e.Button.Kind.ToString() == "Clear")
            {
                gridView2.SetFocusedRowCellValue("OdemeTarihi", null);
                //string t = gridView2.GetFocusedRowCellValue("Tutar").ToString();
                //gridView2.SetFocusedRowCellValue("Tutar", Convert.ToDecimal("-"+t));
            }

        }

        private void gridView2_RowUpdated(object sender, DevExpress.XtraGrid.Views.Base.RowObjectEventArgs e)
        {
            try
            {
                SiteDBEntities2 db = new SiteDBEntities2();

                db.UDI_Borclandir(-1, -1, 0, (DateTime)System.Data.SqlTypes.SqlDateTime.Null, 2,
                    (gridView2.GetFocusedRowCellValue("OdemeTarihi") == null) ? (DateTime)System.Data.SqlTypes.SqlDateTime.Null : (DateTime)gridView2.GetFocusedRowCellValue("OdemeTarihi"),
                    (int)gridView2.GetFocusedRowCellValue("ID"),
                    (gridView2.GetFocusedRowCellValue("Aciklama") == null) ? "" : gridView2.GetFocusedRowCellValue("Aciklama").ToString());

                Mesaj.MesajVer("Kayıt güncellenmiştir.", Mesaj.MesajTipi.Onay, this);
                CariGridGetir();
            }
            catch (Exception hata)
            {

                throw;
            }
        }

        private void navBarBlokTan_LinkClicked(object sender, DevExpress.XtraNavBar.NavBarLinkEventArgs e)
        {
            int rowhandle = gridView1.FocusedRowHandle;
            BlokTanimlari frm = new BlokTanimlari();
            frm.ShowDialog();
            if (frm.DialogResult == DialogResult.OK)
            {

            }
            gridView1.FocusedRowHandle = rowhandle;
        }

        private void navBarDaireTan_LinkClicked(object sender, DevExpress.XtraNavBar.NavBarLinkEventArgs e)
        {
            int rowhandle = gridView1.FocusedRowHandle;
            DaireTanimlari frm = new DaireTanimlari();
            frm.ShowDialog();
            if (frm.DialogResult == DialogResult.OK)
            {

            }
            gridView1.FocusedRowHandle = rowhandle;
        }

        private void navBarOdemeTipiTan_LinkClicked(object sender, DevExpress.XtraNavBar.NavBarLinkEventArgs e)
        {
            int rowhandle = gridView1.FocusedRowHandle;
            OdemeTipiTanimlari frm = new OdemeTipiTanimlari();
            frm.ShowDialog();
            if (frm.DialogResult == DialogResult.OK)
            {

            }
            gridView1.FocusedRowHandle = rowhandle;
        }

        private void navBarKisilerListesi_LinkClicked(object sender, DevExpress.XtraNavBar.NavBarLinkEventArgs e)
        {
            Cursor.Current = Cursors.WaitCursor;
            SiteDBEntities2 db = new SiteDBEntities2();
            XtraReport1 rpt = new XtraReport1();
            var list = db.S_KisilerListesi().ToList();
            rpt.DataSource = list;
            using (ReportPrintTool printTool = new ReportPrintTool(rpt))
            {
                // Invoke the Print Preview form modally,  
                // and load the report document into it. 
                printTool.ShowPreviewDialog();
                Cursor.Current = Cursors.Default;
                // Invoke the Print Preview form 
                // with the specified look and feel setting. 
                //printTool.ShowPreviewDialog(UserLookAndFeel.Default);
            }




        }

        private void pivotGridControl1_FieldValueDisplayText(object sender, DevExpress.XtraPivotGrid.PivotFieldDisplayTextEventArgs e)
        {
            if (e.ValueType == DevExpress.XtraPivotGrid.PivotGridValueType.GrandTotal)
            {
                if (e.IsColumn)
                    e.DisplayText = "Genel Sütun Toplamı";
                else
                    e.DisplayText = "Genel Satır Toplamı";
            }
            if (e.ValueType == DevExpress.XtraPivotGrid.PivotGridValueType.Total)
            {
                if (e.IsColumn)
                    e.DisplayText = "Sütun Toplamı";
                else
                    e.DisplayText = "Satır Toplamı";
            }
        }

        private void gridView2_CustomDrawCell(object sender, DevExpress.XtraGrid.Views.Base.RowCellCustomDrawEventArgs e)
        {
            //GridView view = sender as GridView;
            //if (view.IsRowVisible(e.RowHandle) == RowVisibleState.Visible)
            //{
            //    if (e.Column.FieldName == "Book1" && Int32.TryParse(view.GetRowCellDisplayText(e.RowHandle, view.Columns["Orders"]), out int Order1))
            //    {
            //        if (Order1 < 0) e.Appearance.BackColor = Color.Orange;
            //    }
            //    else if (e.Column.FieldName == "Book2" && Int32.TryParse(view.GetRowCellDisplayText(e.RowHandle, view.Columns["Orders"]), out int Order2))
            //    {
            //        if (Order2 > 0) e.Appearance.BackColor = Color.Orange;
            //    }
            //}
        }

        private void gridView2_RowStyle(object sender, RowStyleEventArgs e)
        {
            object quantity = (gridView2.GetRowCellValue(e.RowHandle, "OdemeTarihi") == null) ? null : gridView2.GetRowCellValue(e.RowHandle, "OdemeTarihi");
            
            if(quantity == null)
            {
                if(Convert.ToDateTime(gridView2.GetRowCellValue(e.RowHandle, "VadeTarihi")) < DateTime.Now.Date)
                    e.Appearance.BackColor = Color.LightPink; //vade tarihi geçmiş
                else
                    e.Appearance.BackColor = Color.LightYellow; //vade tarihi gelmemiş
            }
            else
            {
                e.Appearance.BackColor = Color.LightGreen; //ödenmiş
            }
        }

        private void pivotGridControl1_CustomAppearance(object sender, DevExpress.XtraPivotGrid.PivotCustomAppearanceEventArgs e)
        {
            //if (Convert.ToString(e.GetFieldValue(yourField)) == "Analiz 1")
            //    e.Appearance.BackColor = Color.Yellow;

        }

        private void pivotGridControl1_CustomDrawCell(object sender, DevExpress.XtraPivotGrid.PivotCustomDrawCellEventArgs e)
        {

            //string name = e.RowField.ToString();
            ////string name2 = e.Value.ToString();
            //string name3 = e.RowFieldIndex.ToString();
            //string name4 = e.RowIndex.ToString();
            //string name5 = e.ColumnField.ToString();
            //string name6 = e.ColumnFieldIndex.ToString();
            //string name7 = e.ColumnIndex.ToString();
            //if(e.RowField.ToString() == "Daire No")
            //{
            //    string name8 = e.GetFieldValue(e.RowField, e.RowIndex).ToString();
            //}
            //else if (e.RowField.ToString() == "Blok Adi")
            //{

            //}
            //else
            //{

            //}

            //if(e.ColumnField.ToString() == "Ay")
            //{

            //}
            //else if (e.ColumnField.ToString() == "Yil")
            //{

            //}
            //else
            //{

            //}
            //if(e.Value != null)
            //{
            //    if (e.Value.ToString() == "80.00")
            //    {
            //        string name8 = e.GetFieldValue(e.RowField, e.ColumnFieldIndex).ToString();
            //        string nema9 = e.GetCellValue(e.ColumnIndex, e.RowIndex).ToString();
            //        e.get
            //    }
            //}
            
            //GridView view = sender as GridView;
            //if (view.IsRowVisible(e.RowIndex) == RowVisibleState.Visible)
            //{
            //    object quantity = (gridView2.GetRowCellValue(e.RowIndex, "OdemeTarihi") == null) ? null : gridView2.GetRowCellValue(e.RowIndex, "OdemeTarihi");

            //    //if (e.RowField.Name == "Book1" && Int32.TryParse(view.GetRowCellDisplayText(e.RowIndex, view.Columns["Orders"]), out int Order1))
            //    //{
            //    //    if (Order1 < 0) e.Appearance.BackColor = Color.Orange;
            //    //}
            //    //else if (e.Column.FieldName == "Book2" && Int32.TryParse(view.GetRowCellDisplayText(e.RowIndex, view.Columns["Orders"]), out int Order2))
            //    //{
            //    //    if (Order2 > 0) e.Appearance.BackColor = Color.Orange;
            //    //}
            //}
        }

        private void navBarAylikAidat_LinkClicked(object sender, DevExpress.XtraNavBar.NavBarLinkEventArgs e)
        {
            pivotGridControl1.OptionsPrint.PageSettings.PaperKind = System.Drawing.Printing.PaperKind.A4;
            pivotGridControl1.OptionsPrint.PageSettings.Margins.Bottom = 12;
            pivotGridControl1.OptionsPrint.PageSettings.Margins.Top = 12;
            pivotGridControl1.OptionsPrint.PageSettings.Margins.Left = 12;
            pivotGridControl1.OptionsPrint.PageSettings.Margins.Right = 12;
            pivotGridControl1.OptionsPrint.PageSettings.Landscape = true;
            pivotGridControl1.ShowPrintPreview();
        }

        
    }
}