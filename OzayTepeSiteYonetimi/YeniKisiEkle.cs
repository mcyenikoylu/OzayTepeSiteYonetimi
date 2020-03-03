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
    public partial class YeniKisiEkle : DevExpress.XtraBars.Ribbon.RibbonForm
    {
        int kisiid;
        public YeniKisiEkle(int id)
        {
            InitializeComponent();
            kisiid = id;
        }
        IList<S_Kisiler_Result> listkisiler;
        private void YeniKisiEkle_Load(object sender, EventArgs e)
        {
            SiteDBEntities2 db = new SiteDBEntities2();
            var bloklar = db.S_Bloklar().ToList();
            cmbBlokAdi.Properties.DataSource = bloklar;
            var daireler = db.S_Daireler().ToList();
            cmbDaireNo.Properties.DataSource = daireler;
            if (kisiid>0)
            {
                var list = db.S_Kisiler(kisiid).ToList();
                listkisiler = list;
                txtAdSoyad.EditValue = list.FirstOrDefault().AdiSoyadi;
                cmbBlokAdi.EditValue = list.FirstOrDefault().BlokAdiID;
                cmbDaireNo.EditValue = list.FirstOrDefault().DaireAdiID;
                dtGirisTarihi.EditValue = list.FirstOrDefault().DaireGirisTarihi;
                dtCikisTarihi.EditValue = list.FirstOrDefault().DaireCikisTarihi;
                bool kiraciEvSahibi = (bool)list.FirstOrDefault().KiraciEvsahibi;
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
                bool oturuyorAyrildi = (bool)list.FirstOrDefault().OturuyorAyrildi;
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
                txtNotlar.EditValue = list.FirstOrDefault().Notlar;
            }
            
        }

        private void btnKaydet_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            try
            {
                SiteDBEntities2 db = new SiteDBEntities2();
                //int islemtipi = ((kisiid > 0) ? 2 : 1);
                db.UDI_Kisi(1, kisiid,
                    txtAdSoyad.EditValue.ToString(),
                    (int)cmbBlokAdi.EditValue,
                    (int)cmbDaireNo.EditValue,
                    rbKiraci.Checked,
                    DateTime.Now.Date,
                    (DateTime)dtGirisTarihi.EditValue,
                    ((dtCikisTarihi.EditValue == null) ? (DateTime)System.Data.SqlTypes.SqlDateTime.Null : (DateTime)dtCikisTarihi.EditValue),
                    rbOturuyor.Checked,
                    ((txtNotlar.EditValue == null) ? "" : txtNotlar.EditValue.ToString()));
                Mesaj.MesajVer("Kayıt eklenmiştir.", Mesaj.MesajTipi.Onay, this);
               
            }
            catch (Exception hata)
            {
                throw;
            }
        }

        private void btnKaydetKapat_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            try
            {
                SiteDBEntities2 db = new SiteDBEntities2();
                db.UDI_Kisi(1, kisiid,
                    txtAdSoyad.EditValue.ToString(),
                    (int)cmbBlokAdi.EditValue,
                    (int)cmbDaireNo.EditValue,
                    rbKiraci.Checked,
                    DateTime.Now.Date,
                    (DateTime)dtGirisTarihi.EditValue,
                    ((dtCikisTarihi.EditValue == null) ? (DateTime)System.Data.SqlTypes.SqlDateTime.Null : (DateTime)dtCikisTarihi.EditValue),
                    rbOturuyor.Checked,
                    ((txtNotlar.EditValue == null) ? "" : txtNotlar.EditValue.ToString()));
                this.DialogResult = DialogResult.OK;
                Mesaj.MesajVer("Kayıt eklenmiştir.", Mesaj.MesajTipi.Onay, this);
                this.Close();
            }
            catch (Exception hata)
            {
                throw;
            }
        }

        private void YeniKisiEkle_FormClosing(object sender, FormClosingEventArgs e)
        {
            this.DialogResult = DialogResult.OK;
            this.Close();
        }

        private void btnKaydetYeni_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            try
            {
                SiteDBEntities2 db = new SiteDBEntities2();
                db.UDI_Kisi(1, kisiid,
                    txtAdSoyad.EditValue.ToString(),
                    (int)cmbBlokAdi.EditValue,
                    (int)cmbDaireNo.EditValue,
                    rbKiraci.Checked,
                    DateTime.Now.Date,
                    (DateTime)dtGirisTarihi.EditValue,
                    ((dtCikisTarihi.EditValue == null) ? (DateTime)System.Data.SqlTypes.SqlDateTime.Null : (DateTime)dtCikisTarihi.EditValue),
                    rbOturuyor.Checked,
                    ((txtNotlar.EditValue == null) ? "" : txtNotlar.EditValue.ToString()));
                Mesaj.MesajVer("Kayıt eklenmiştir.", Mesaj.MesajTipi.Onay, this);
                txtAdSoyad.EditValue = "";
                cmbBlokAdi.ResetText();
                cmbDaireNo.ResetText();
                rbKiraci.Checked = false;
                rbEvSahibi.Checked = false;
                dtGirisTarihi.ResetText();
                dtCikisTarihi.ResetText();
                rbOturuyor.Checked = false;
                rbAyrildi.Checked = false;
                txtNotlar.EditValue = "";
                txtAdSoyad.Focus();
            }
            catch (Exception hata)
            {
                throw;
            }
        }

        private void btnGerial_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            txtAdSoyad.Undo();
            txtNotlar.Undo();
            txtAdSoyad.EditValue = listkisiler.FirstOrDefault().AdiSoyadi;
            cmbBlokAdi.EditValue = listkisiler.FirstOrDefault().BlokAdiID;
            cmbDaireNo.EditValue = listkisiler.FirstOrDefault().DaireAdiID;
            dtGirisTarihi.EditValue = listkisiler.FirstOrDefault().DaireGirisTarihi;
            dtCikisTarihi.EditValue = listkisiler.FirstOrDefault().DaireCikisTarihi;
            bool kiraciEvSahibi = (bool)listkisiler.FirstOrDefault().KiraciEvsahibi;
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
            bool oturuyorAyrildi = (bool)listkisiler.FirstOrDefault().OturuyorAyrildi;
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
            txtNotlar.EditValue = listkisiler.FirstOrDefault().Notlar;
        }

        private void btnSil_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            try
            {
                if (XtraMessageBox.Show("Kayıdı silmek istediğinizden eminmisiniz?", "Uyarı", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == System.Windows.Forms.DialogResult.Yes)
                {
                    SiteDBEntities2 db = new SiteDBEntities2();
                    db.UDI_Kisi(2, kisiid, "", -1, -1, false, null, null, null, false, "");
                    Mesaj.MesajVer("Kayıt silinmiştir.", Mesaj.MesajTipi.Onay, this);
                    this.DialogResult = DialogResult.OK;
                    this.Close();
                }
            }
            catch (Exception hata)
            {

                throw;
            }
        }

        private void btnOdemeEkle_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            OdemeEkle frm = new OdemeEkle(kisiid,txtAdSoyad.EditValue.ToString(),-1);
            frm.ShowDialog();
        }

        private void btnBorclandir_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {

        }
    }
}