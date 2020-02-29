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
            SiteDBEntities2 db = new SiteDBEntities2();
            var list = db.S_Kisiler(-1).ToList();
            gridControl1.DataSource = list;
            var bloklar = db.S_Bloklar().ToList();
            cmbBlokAdi.Properties.DataSource = bloklar;
            repositoryItemLookUpEdit1.DataSource = bloklar;
            var daireler = db.S_Daireler().ToList();
            cmbDaireNo.Properties.DataSource = daireler;
            repositoryItemLookUpEdit2.DataSource = daireler;
        }

        private void gridView1_SelectionChanged(object sender, DevExpress.Data.SelectionChangedEventArgs e)
        {

        }

        private void gridView1_RowCellClick(object sender, DevExpress.XtraGrid.Views.Grid.RowCellClickEventArgs e)
        {
            int i = e.RowHandle;
            string id = gridView1.GetRowCellValue(i, "ID").ToString();
            if (id != "" || id != null) {
                txtAdSoyad.EditValue = gridView1.GetRowCellValue(i, "AdiSoyadi").ToString();
                cmbBlokAdi.EditValue = gridView1.GetRowCellValue(i, "BlokAdiID");
                cmbDaireNo.EditValue = gridView1.GetRowCellValue(i, "DaireAdiID");
                dtGirisTarihi.EditValue = gridView1.GetRowCellValue(i, "DaireGirisTarihi");
                dtCikisTarihi.EditValue = gridView1.GetRowCellValue(i, "DaireCikisTarihi");
                bool kiraciEvSahibi = Convert.ToBoolean(gridView1.GetRowCellValue(i, "KiraciEvsahibi"));
                if (kiraciEvSahibi)
                {
                    rbKiraci.Checked = true;
                    rbEvSahibi.Checked = false;
                }
                else
                {
                    rbKiraci.Checked = false;
                    rbEvSahibi.Checked = true;
                }
                bool oturuyorAyrildi = Convert.ToBoolean(gridView1.GetRowCellValue(i, "OturuyorAyrildi"));
                if (oturuyorAyrildi)
                {
                    rbOturuyor.Checked = true;
                    rbAyrildi.Checked = false;
                }
                else
                {
                    rbOturuyor.Checked = false;
                    rbAyrildi.Checked = true;
                }
            }
        }

        private void barButtonItem1_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {

        }

        private void barButtonItem2_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {

        }

        private void navBarYeniKisiEkle_LinkClicked(object sender, DevExpress.XtraNavBar.NavBarLinkEventArgs e)
        {

        }

        private void simpleButton1_Click(object sender, EventArgs e)
        {

        }

        private void gridView1_FocusedRowChanged(object sender, DevExpress.XtraGrid.Views.Base.FocusedRowChangedEventArgs e)
        {
            int i = e.FocusedRowHandle;
            string id = gridView1.GetRowCellValue(i, "ID").ToString();
            if (id != "" || id != null)
            {
                txtAdSoyad.EditValue = gridView1.GetRowCellValue(i, "AdiSoyadi").ToString();
                cmbBlokAdi.EditValue = gridView1.GetRowCellValue(i, "BlokAdiID");
                cmbDaireNo.EditValue = gridView1.GetRowCellValue(i, "DaireAdiID");
                dtGirisTarihi.EditValue = gridView1.GetRowCellValue(i, "DaireGirisTarihi");
                dtCikisTarihi.EditValue = gridView1.GetRowCellValue(i, "DaireCikisTarihi");
                bool kiraciEvSahibi = Convert.ToBoolean(gridView1.GetRowCellValue(i, "KiraciEvsahibi"));
                if (kiraciEvSahibi)
                {
                    rbKiraci.Checked = true;
                    rbEvSahibi.Checked = false;
                }
                else
                {
                    rbKiraci.Checked = false;
                    rbEvSahibi.Checked = true;
                }
                bool oturuyorAyrildi = Convert.ToBoolean(gridView1.GetRowCellValue(i, "OturuyorAyrildi"));
                if (oturuyorAyrildi)
                {
                    rbOturuyor.Checked = true;
                    rbAyrildi.Checked = false;
                }
                else
                {
                    rbOturuyor.Checked = false;
                    rbAyrildi.Checked = true;
                }
            }
        }
    }
}