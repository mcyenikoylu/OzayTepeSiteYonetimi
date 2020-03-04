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

namespace OzayTepeSiteYonetimi
{
    public partial class OdemeEkle : DevExpress.XtraBars.Ribbon.RibbonForm
    {
        string _adi;
        int _id;
        int _kayitid;
        public OdemeEkle(int id, string adi, int kayitid)
        {
            InitializeComponent();
            _adi = adi;
            _id = id;
            _kayitid = kayitid;
        }

        private void OdemeEkle_Load(object sender, EventArgs e)
        {
            lblAdiSoyadi.Text = _adi;
            SiteDBEntities2 db = new SiteDBEntities2();
            var odemeTipi = db.S_OdemeTipi().ToList();
            lookUpEdit1.Properties.DataSource = odemeTipi;
        }

        private void btnKaydet_ItemClick(object sender, ItemClickEventArgs e)
        {
            try
            {
                SiteDBEntities2 db = new SiteDBEntities2();
                db.UDI_OdemeEkle(1, _id, -1, (DateTime)dtTarih.EditValue, (int)lookUpEdit1.EditValue, 
                    (decimal)textEdit1.EditValue, memoEdit1.EditValue.ToString());
                Mesaj.MesajVer("Kayıt eklenmiştir.", Mesaj.MesajTipi.Onay, this);

            }
            catch (Exception hata)
            {

                throw;
            }
        }

        private void btnKaydetVeKapat_ItemClick(object sender, ItemClickEventArgs e)
        {
            try
            {
                SiteDBEntities2 db = new SiteDBEntities2();
                db.UDI_OdemeEkle(1, _id, -1, (DateTime)dtTarih.EditValue, (int)lookUpEdit1.EditValue,
                    (decimal)textEdit1.EditValue, memoEdit1.EditValue.ToString());
                Mesaj.MesajVer("Kayıt eklenmiştir.", Mesaj.MesajTipi.Onay, this);
                this.DialogResult = DialogResult.OK;
                this.Close();
            }
            catch (Exception hata)
            {

                throw;
            }
        }

        private void OdemeEkle_FormClosing(object sender, FormClosingEventArgs e)
        {
            this.DialogResult = DialogResult.OK;
            this.Close();
        }

        private void btnSil_ItemClick(object sender, ItemClickEventArgs e)
        {
            try
            {
                SiteDBEntities2 db = new SiteDBEntities2();
                db.UDI_OdemeEkle(2, _id, _kayitid, (DateTime)dtTarih.EditValue, (int)lookUpEdit1.EditValue,
                    (decimal)textEdit1.EditValue, memoEdit1.EditValue.ToString());
                Mesaj.MesajVer("Kayıt silinmiştir.", Mesaj.MesajTipi.Onay, this);
                this.DialogResult = DialogResult.OK;
                this.Close();
            }
            catch (Exception hata)
            {

                throw;
            }
        }
    }
}