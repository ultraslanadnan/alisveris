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
    public partial class ErkekCocuk : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Command(object sender, CommandEventArgs e)
        {
            Komutlar.UrunPuanArtirimi(e);
            Response.Redirect(Request.RawUrl);
            if (Session["kullanici_adi"] != null)
            {


                try
                {

                
                }
                catch
                {
                    Response.Write("Hatalı giris yaptınız yeniden deneyin");
                }
            }
            else
            {
                
            }
        }

        protected void incele_butonu_Erkek_cocuk_1_Command(object sender, CommandEventArgs e)
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
                    Response.Redirect("urun_detayi.aspx");
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
                Response.Redirect("urun_detayi.aspx");
            }
        }
    }
}