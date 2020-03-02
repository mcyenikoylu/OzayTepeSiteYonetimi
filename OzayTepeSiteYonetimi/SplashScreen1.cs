using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using DevExpress.XtraSplashScreen;

namespace OzayTepeSiteYonetimi
{
    public partial class SplashScreen1 : SplashScreen
    {
        public SplashScreen1()
        {
            InitializeComponent();
            this.labelControl1.Text = "Copyright © 2020 - Mehmet Cenk Yeniköylü";// + DateTime.Now.Year.ToString();
        }

        #region Overrides

        public override void ProcessCommand(Enum cmd, object arg)
        {
            base.ProcessCommand(cmd, arg);
        }

        #endregion

        public enum SplashScreenCommand
        {

        }

        private void SplashScreen1_FormClosing(object sender, FormClosingEventArgs e)
        {


        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            timer1.Dispose();
            this.Close();
        }

        private void SplashScreen1_FormClosed(object sender, FormClosedEventArgs e)
        {
            Form1 frm = new Form1();
            frm.ShowDialog();
        }
    }
}