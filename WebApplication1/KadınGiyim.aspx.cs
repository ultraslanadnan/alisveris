using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Oracle.DataAccess.Client;

using System.Data;

namespace WebApplication1
{
    public partial class KadınGiyim : System.Web.UI.Page
    {
     
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Command(object sender, CommandEventArgs e)
        {
            Komutlar.UrunPuanArtirimi(e);
            Response.Redirect(Request.RawUrl);
        }
        protected void incele_butonu_KadinGiyim_Command(object sender, CommandEventArgs e)
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