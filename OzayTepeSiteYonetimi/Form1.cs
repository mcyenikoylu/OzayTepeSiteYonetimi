﻿using System;
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
            var bloklar = db.S_Bloklar().ToList();
            repositoryItemLookUpEdit1.DataSource = bloklar;
            var daireler = db.S_Daireler().ToList();
            repositoryItemLookUpEdit2.DataSource = daireler;
            var odemeTipi = db.S_OdemeTipi().ToList();
            repositoryItemLookUpEdit3.DataSource = odemeTipi;
            var list = db.S_Kisiler(-1).Where(c => c.IsDeleted == false).ToList();
            gridControl1.DataSource = list;
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
                
                lblBlok.Text = string.Format("{0} Blok, Daire {1}", repositoryItemLookUpEdit1.GetDisplayText(gridView1.GetRowCellValue(i,"BlokAdiID")).Trim(),
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
                var odeme = db.S_Odemeler(Convert.ToInt32(id)).OrderByDescending(c => c.VadeTarihi).ToList();
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
            Borclandir frm = new Borclandir(id,ad);
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
                var odeme = db.S_Odemeler(kisiid).OrderByDescending(c => c.VadeTarihi).ThenByDescending(m => m.ID).ToList();
                gridControl2.DataSource = odeme;
            }
            gridView1.FocusedRowHandle = rowhandle;
        }

        private void repositoryItemDateEdit1_ButtonClick(object sender, DevExpress.XtraEditors.Controls.ButtonPressedEventArgs e)
        {
            if(e.Button.Kind.ToString() == "Clear")
            {
                gridView2.SetFocusedRowCellValue("OdemeTarihi", null);
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
                    (gridView2.GetFocusedRowCellValue("Aciklama") == null) ? (String)System.Data.SqlTypes.SqlString.Null : gridView2.GetFocusedRowCellValue("Aciklama").ToString());
                Mesaj.MesajVer("Kayıt güncellenmiştir.", Mesaj.MesajTipi.Onay, this);
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

        }

        private void navBarOdemeTipiTan_LinkClicked(object sender, DevExpress.XtraNavBar.NavBarLinkEventArgs e)
        {

        }

        private void navBarKisilerListesi_LinkClicked(object sender, DevExpress.XtraNavBar.NavBarLinkEventArgs e)
        {

        }
    }
}