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
    public partial class Borclandir : DevExpress.XtraBars.Ribbon.RibbonForm
    {
        int kisiid;
        string ad;
        public Borclandir(int id, string adi)
        {
            InitializeComponent();
            kisiid = id;
            ad = adi;
        }

        private void Borclandir_Load(object sender, EventArgs e)
        {
            lblAdiSoyadi.Text = ad;
            SiteDBEntities2 db = new SiteDBEntities2();
            var odemeTipi = db.S_OdemeTipi().ToList();
            lookUpEdit1.Properties.DataSource = odemeTipi;
        }

        private void Borclandir_FormClosing(object sender, FormClosingEventArgs e)
        {

        }

        public static DataSet dsAktivite_OdemePlaniSenet = new DataSet();
        private void btnBorclandir_ItemClick(object sender, ItemClickEventArgs e)
        {
            SiteDBEntities2 db = new SiteDBEntities2();
            gridControl1.DataSource = null;
            dsAktivite_OdemePlaniSenet.Tables.Clear();
            dsAktivite_OdemePlaniSenet.Tables.Add(DataControls.ListToDt(db.S_Odemeler(-1).ToList()));
            if (dsAktivite_OdemePlaniSenet.Tables[0].Rows.Count != 0)
                dsAktivite_OdemePlaniSenet.Tables[0].Rows.Clear();
            int vadeSayisi = Convert.ToInt32(textEdit1.EditValue);
            if (vadeSayisi > 0)
            {
                for (int i = 0; i < vadeSayisi; i++)
                {
                    TaksitEkle(VadeGridMaxTarihBul(), (decimal)(txtTutar.EditValue));
                }
            }
            else
                TaksitEkle(dateEdit1.DateTime.Date, (decimal)(txtTutar.EditValue));

            gridControl1.DataSource = dsAktivite_OdemePlaniSenet.Tables[0];

        }
        private void TaksitEkle(DateTime dtmTaksitTarihi, decimal dBorcTutari)
        {
            try
            {
                //if (dsAktivite_OdemePlaniSenet.Tables[0].Rows.Count != 0)
                //    dsAktivite_OdemePlaniSenet.Tables[0].Rows.Clear();

                DataRow drwYeniTaksit = dsAktivite_OdemePlaniSenet.Tables[0].NewRow();
                drwYeniTaksit["OdemeTipiID"] = (int)(lookUpEdit1.EditValue);
                drwYeniTaksit["Tutar"] = dBorcTutari;
                drwYeniTaksit["VadeTarihi"] = dtmTaksitTarihi.Date;
                drwYeniTaksit["Yil"] = dtmTaksitTarihi.Date.Year;
                drwYeniTaksit["Ay"] = dtmTaksitTarihi.Date.Month;
                dsAktivite_OdemePlaniSenet.Tables[0].Rows.Add(drwYeniTaksit);
            }
            catch (Exception Hata)
            {
                //this.Cursor = Cursors.Default;
                //Genel.LogErrorYaz(iFormID, Hata);
                //XtraMessageBox.Show(Genel.DilGetirMesaj(1034) + "\n\n" + Hata.Message, Genel.DilGetirMesaj(2), MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
        private DateTime VadeGridMaxTarihBul()
        {
            try
            {
                int iPeriod = 1;//C.ParseInt(txtPeriod.EditValue);
                DateTime dtmMaxTarih = new DateTime();
                if (dsAktivite_OdemePlaniSenet.Tables[0].Rows.Count < 1)
                    dtmMaxTarih = dateEdit1.DateTime.Date;
                else
                {
                    int iYear = ParseDateTime(dsAktivite_OdemePlaniSenet.Tables[0].Rows[dsAktivite_OdemePlaniSenet.Tables[0].Rows.Count - 1]["VadeTarihi"]).AddMonths(iPeriod).Year;
                    int iMonth = ParseDateTime(dsAktivite_OdemePlaniSenet.Tables[0].Rows[dsAktivite_OdemePlaniSenet.Tables[0].Rows.Count - 1]["VadeTarihi"]).AddMonths(iPeriod).Month;
                    int iDay = dateEdit1.DateTime.Day;

                    DateTime dtmTemp = DateTime.Now;
                    try
                    {
                        dtmTemp = new DateTime(iYear, iMonth, iDay);
                    }
                    catch (Exception exc)
                    {
                        int lastDayOfMonth = DateTime.DaysInMonth(iYear, iMonth);
                        dtmTemp = new DateTime(iYear, iMonth, lastDayOfMonth);
                    }
                    dtmMaxTarih = dtmTemp.Date;
                }
                return dtmMaxTarih.Date;
            }
            catch (Exception Hata)
            {
                //Genel.LogErrorYaz(iFormID, Hata);
                //XtraMessageBox.Show(Genel.DilGetirMesaj(1034) + "\n\n" + Hata.Message, Genel.DilGetirMesaj(2), MessageBoxButtons.OK, MessageBoxIcon.Error);
                return (DateTime)System.Data.SqlTypes.SqlDateTime.Null;
            }
        }
        public static DateTime ParseDateTime(object o)
        {
            DateTime dtm = new DateTime(1900, 1, 1);
            try
            {
                if (o == null)
                    return dtm;
                dtm = Convert.ToDateTime(o);
            }
            catch { }
            return dtm;
        }
        private void btnKaydetVeKapat_ItemClick(object sender, ItemClickEventArgs e)
        {
            try
            {
                SiteDBEntities2 db = new SiteDBEntities2();
                int vadeSayisi = Convert.ToInt32(textEdit1.EditValue);
                if (vadeSayisi > 0)
                {
                    DateTime OncekiTarih = new DateTime();
                    for (int i = 0; i < vadeSayisi; i++)
                    {
                        DateTime dtmMaxTarih = new DateTime();
                        dtmMaxTarih = dateEdit1.DateTime.Date;
                        if(i == 0)
                        {
                            db.UDI_Borclandir(kisiid, (int)lookUpEdit1.EditValue, (decimal)txtTutar.EditValue, dtmMaxTarih);
                            OncekiTarih = dtmMaxTarih;
                        }
                        else
                        {
                            int iYear = OncekiTarih.AddMonths(1).Year; //ParseDateTime(OncekiTarih.Month).AddMonths(1).Year;
                            int iMonth = OncekiTarih.AddMonths(1).Month; //ParseDateTime(OncekiTarih.Month +1).Month;
                            int iDay = dateEdit1.DateTime.Day;

                            DateTime dtmTemp = DateTime.Now;
                            try
                            {
                                dtmTemp = new DateTime(iYear, iMonth, iDay);
                            }
                            catch (Exception exc)
                            {
                                int lastDayOfMonth = DateTime.DaysInMonth(iYear, iMonth);
                                dtmTemp = new DateTime(iYear, iMonth, lastDayOfMonth);
                            }

                            db.UDI_Borclandir(kisiid, (int)lookUpEdit1.EditValue, (decimal)txtTutar.EditValue,
                                dtmTemp);

                            OncekiTarih = dtmTemp;
                        }
                    }
                }
                else
                    db.UDI_Borclandir(kisiid, (int)lookUpEdit1.EditValue, (decimal)txtTutar.EditValue, dateEdit1.DateTime.Date);

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