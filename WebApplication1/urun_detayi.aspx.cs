using Oracle.DataAccess.Client;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class urun_detayi : System.Web.UI.Page
    {

   
     
        protected void Page_Load(object sender, EventArgs e)
        {
           
            Komutlar.KategoriCekme();
            Komutlar.BenzerUrunlerİncele();
            if (Session["kullanici_adi"] != null)
            {
                try
                {
                    onerlilertag.Visible = true;
                    onerilertag2.Visible = true;
                }
                catch
                {

                }
            }
            else
            {
                onerlilertag.Visible = false;
                onerilertag2.Visible = false;
            }

        }

        protected void LinkButton1_Command(object sender, CommandEventArgs e)
        {
           
            Komutlar.UrunPuanArtirimi(e);
            Response.Redirect(Request.RawUrl);
        }


        protected void incele_butonu_Command(object sender, CommandEventArgs e)
        {
            if (Session["kullanici_adi"] != null)
            {
                

                try
                {
                    Komutlar.İnceleSifirlama(e);
                    Komutlar.uyeCekme();
                    Komutlar.İnceleButonu(e);

                    Komutlar.KategoriCekme();

                    Komutlar.urun_inceleme_Uye();

                    Komutlar.Benzer_incelendi_Sifirlama();
                    Komutlar.Benzer_incelendi();
                    Komutlar.benzerlik_Urunleri();
                    Komutlar.benzerlik_uye_cekme();
                    onerlilertag.Visible = true;
                    onerilertag2.Visible = true;

                }
                catch
                {

                }


            }
            else
            {
                Komutlar.İnceleSifirlama(e);

                Komutlar.İnceleButonu(e);

                Komutlar.KategoriCekme();
                Komutlar.Benzer_incelendi_Sifirlama();
                onerlilertag.Visible = false;
                onerilertag2.Visible = false;


            }

            Response.Redirect("urun_detayi.aspx");
        }
    }
}