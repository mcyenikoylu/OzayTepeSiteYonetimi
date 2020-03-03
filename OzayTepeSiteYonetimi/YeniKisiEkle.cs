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
                    true,
                    DateTime.Now.Date,
                    (DateTime)dtGirisTarihi.EditValue,
                    ((dtCikisTarihi.EditValue == null) ? (DateTime)System.Data.SqlTypes.SqlDateTime.Null : (DateTime)dtCikisTarihi.EditValue),
                    true,
                    txtNotlar.EditValue.ToString());
            }
            catch (Exception hata)
            {
                Mesaj.MesajVer(hata.Message, Mesaj.MesajTipi.Hata, this);
                throw;
            }
        }
    }
}