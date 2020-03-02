using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using DevExpress.XtraBars.Alerter;
using DevExpress.XtraEditors;
using OzayTepeSiteYonetimi.Properties;

namespace OzayTepeSiteYonetimi
{
    class AlertForms
    {
      

    }

    class Mesaj
    {
        public enum MesajTipi
        {
            Uyari,
            Hata,
            Onay,
            Bilgi
        };
        public static Timer tmr = new Timer();
        public static AlertControl a;
        static void tmr_Tick(object sender, EventArgs e)
        {
            if (a.AlertFormList.Count > 0)
                a.AlertFormList[0].Close();

            tmr.Enabled = false;
        }

        public static void MesajVer(string Mesaj, MesajTipi Tip, XtraForm OwnerForm, int KacSaniye = 3)
        {
            a = new AlertControl();
            a.FormShowingEffect = AlertFormShowingEffect.SlideVertical;
            a.AppearanceText.TextOptions.WordWrap = DevExpress.Utils.WordWrap.Wrap;
            if (Tip == MesajTipi.Uyari)
                a.AppearanceText.ForeColor = Color.Blue;
            else if (Tip == MesajTipi.Hata)
                a.AppearanceText.ForeColor = Color.Red;

            a.ShowCloseButton = true;
            a.ShowPinButton = false;
            a.AllowHotTrack = false;

            Font fntBaslik = new Font("Arial", 8.3F, FontStyle.Bold | FontStyle.Underline);
            a.AppearanceCaption.Font = fntBaslik;
            Font fntText = new Font("Arial", 8, FontStyle.Regular);
            a.AppearanceText.Font = fntText;


            string Baslik = "";
            Image img = null;
            if (Tip == MesajTipi.Bilgi)
            {
                img = Resources.Info_32x32;
                Baslik = "Bilgi";
            }
            else if (Tip == MesajTipi.Hata)
            {
                img = Resources.Info_32x32;
                Baslik = "Hata";
            }
            else if (Tip == MesajTipi.Onay)
            {
                img = Resources.Info_32x32;
                Baslik = "Onay";
            }
            else if (Tip == MesajTipi.Uyari)
            {
                img = Resources.Info_32x32;
                Baslik = "Uyarı";
            }

            AlertInfo info = new AlertInfo(Baslik, Mesaj);
            info.Image = img;
            tmr.Tick += tmr_Tick;
            tmr.Interval = KacSaniye * 1000;
            tmr.Enabled = true;
            a.Show(OwnerForm, info);
        }

    }

}
