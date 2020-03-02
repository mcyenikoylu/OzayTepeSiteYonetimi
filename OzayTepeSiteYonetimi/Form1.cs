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
        }
        void barButtonNavigation_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            int barItemIndex = barSubItemNavigation.ItemLinks.IndexOf(e.Link);
            navBarControl.ActiveGroup = navBarControl.Groups[barItemIndex];
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            RibbonMenuGridAyarlari uc_gridAyarlari = new RibbonMenuGridAyarlari(ribbonPage.Text);
            uc_gridAyarlari.GrdView = gridView1;
            ribbonControl.MergeRibbon(uc_gridAyarlari.ribbonControl1);

            SiteDBEntities2 db = new SiteDBEntities2();
            var list = db.S_Kisiler(-1).ToList();
            gridControl1.DataSource = list;

            var bloklar = db.S_Bloklar().ToList();
            repositoryItemLookUpEdit1.DataSource = bloklar;
            var daireler = db.S_Daireler().ToList();
            repositoryItemLookUpEdit2.DataSource = daireler;
            var odemeTipi = db.S_OdemeTipi().ToList();
            repositoryItemLookUpEdit3.DataSource = odemeTipi;
        }

        private void navBarYeniKisiEkle_LinkClicked(object sender, DevExpress.XtraNavBar.NavBarLinkEventArgs e)
        {
            YeniKisiEkle frm = new YeniKisiEkle(kisiid);
            frm.ShowDialog();
        }

        int kisiid = -1;
        private void gridView1_FocusedRowChanged(object sender, DevExpress.XtraGrid.Views.Base.FocusedRowChangedEventArgs e)
        {
            int i = e.FocusedRowHandle;
            string id = gridView1.GetRowCellValue(i, "ID").ToString();
            if (id != "" || id != null)
            {
                lblAdSoyad.Text = gridView1.GetRowCellValue(i, "AdiSoyadi").ToString();
                
                lblBlok.Text = string.Format("{0} Blok, Daire {1}", repositoryItemLookUpEdit1.GetDisplayText(gridView1.GetFocusedRowCellValue("BlokAdiID")).Trim(),
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
                var odeme = db.S_Odemeler(Convert.ToInt32(id)).ToList();
                gridControl2.DataSource = odeme;
                kisiid = Convert.ToInt32(id);
            }
        }

        private void gridView2_FocusedRowChanged(object sender, DevExpress.XtraGrid.Views.Base.FocusedRowChangedEventArgs e)
        {
            //Mesaj.MesajVer("Kayıt eklenmiştir.", Mesaj.MesajTipi.Onay, this);
        }
    }
}