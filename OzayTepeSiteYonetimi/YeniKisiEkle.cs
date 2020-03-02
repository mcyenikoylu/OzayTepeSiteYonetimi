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
            var list = db.S_Kisiler(kisiid).ToList();
            var bloklar = db.S_Bloklar().ToList();
            cmbBlokAdi.Properties.DataSource = bloklar;
            var daireler = db.S_Daireler().ToList();
            cmbDaireNo.Properties.DataSource = daireler;
            txtAdSoyad.EditValue = list.FirstOrDefault().AdiSoyadi;
        }

      

    }
}