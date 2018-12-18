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
    public partial class index2 : System.Web.UI.MasterPage
    {
    static   string connStr = "Data Source=TEST;User ID=ABYS;Password=lavanta;";

         string  kullanici_id="";
        
        static List<string> list_Sepet = new List<string>();
        static List<string> list_UyeID_Urun = new List<string>();




        private  void Sepet_Urun_Sayisi()
        {

            OracleConnection cnn1 = new OracleConnection(connStr);
            OracleCommand comand1 = new OracleCommand();
            comand1.Connection = cnn1;
            cnn1.Open();
            comand1.CommandText = "  select* from temp_urunler where sepet='evet' ";
            comand1.CommandType = CommandType.Text;
            OracleDataReader dr = comand1.ExecuteReader();


            list_Sepet.Clear();
            while (dr.Read())
            {

                list_Sepet.Add(dr["urun_id"].ToString());
            }
            int count = list_Sepet.Count(s => list_Sepet.Contains(s));
            Urun_sayisi_Sepet2.InnerText = count.ToString();

            cnn1.Close();
        }
        private void Sepet_Urun_Sayisi_Kullanici()
        {

            OracleConnection cnn1 = new OracleConnection(connStr);
            OracleCommand comand1 = new OracleCommand();
            comand1.Connection = cnn1;
            cnn1.Open();
            comand1.CommandText = "  select* from urun_satislar  where sepet='evet' and sepet_kayitlari='kayitli' ";
            comand1.CommandType = CommandType.Text;
            OracleDataReader dr = comand1.ExecuteReader();

            list_UyeID_Urun.Clear();
            while (dr.Read())
            {

                list_UyeID_Urun.Add(dr["urun_id"].ToString());
            }
            int count = list_UyeID_Urun.Count(s => list_UyeID_Urun.Contains(s));

            Urun_sayisi_Sepet2.InnerText = count.ToString();


            cnn1.Close();
        }

        protected void Page_Load(object sender, EventArgs e)
        
        {
            
            



            if (Session["kullanici_adi"] != null)
            {

                try {
                    
                    
                   



                    Sepet_verileri_forUyeID.Visible = true;
                    Sepet_verileri.Visible = false;
                    KullanıciAdi.InnerText = Session["kullanici_adi"].ToString();
                    KullanıciAdi.Style.Add("color", "red");
                    hosgeldin.Style.Add("color", "red");
                    cıkıs_butonu.Style.Add("color", "red");
                    hosgeldin.Visible = true;
                    KullanıciAdi.Visible = true;
                    cıkıs_butonu.Visible = true;
                    girisbutonu.Visible = false;
                    Komutlar.Kullanici_Sepetleri_Null();
                    
                    Komutlar.uyeCekme();
                   
                    Komutlar.Kullanici_Sepetleri();
                    Sepet_Urun_Sayisi_Kullanici();


                }
                catch
                {

                }
            }
            else
            {
                Sepet_verileri_forUyeID.Visible = false; ;
                Sepet_verileri.Visible = true;
                Sepet_Urun_Sayisi();
                page_and_exit_For_Offline();
                OracleConnection cnn = new OracleConnection(connStr);


                OracleCommand comand = new OracleCommand();
                comand.Connection = cnn;
                comand.CommandText = "update  giyim_kullanicilar set durum='offline'  where  kullanici_id='" + kullanici_id + "'  ";
                comand.CommandType = CommandType.Text;
                cnn.Open();
                comand.ExecuteNonQuery();
                cnn.Close();
                girisbutonu.Visible = true;
                hosgeldin.Visible = false;
                KullanıciAdi.Visible = false;
                cıkıs_butonu.Visible = false;
            }
        }
        protected void cıkıs_butonu_ServerClick(object sender, EventArgs e)
        {
            
            Session.Abandon();
            girisbutonu.Visible = true;
            hosgeldin.Visible = false;
            KullanıciAdi.Visible = false;
            cıkıs_butonu.Visible = false;


            page_and_exit_For_Offline();

            OracleConnection cnn = new OracleConnection(connStr);


            OracleCommand comand = new OracleCommand();
            comand.Connection = cnn;
            comand.CommandText = "update  giyim_kullanicilar set durum='offline'  where  kullanici_id='" + kullanici_id + "'  ";
            comand.CommandType = CommandType.Text;
            cnn.Open();
            comand.ExecuteNonQuery();
            cnn.Close();

            Response.Redirect("~/index.aspx");
        }
        private void page_and_exit_For_Offline()
        {

            OracleConnection cnn1 = new OracleConnection(connStr);
            OracleCommand comand1 = new OracleCommand();
            comand1.Connection = cnn1;
            cnn1.Open();
            comand1.CommandText = "select * from giyim_kullanicilar where durum='online'";
            comand1.CommandType = CommandType.Text;
            OracleDataReader dr = comand1.ExecuteReader();

            if (dr.Read())
            {

                kullanici_id = dr["kullanici_id"].ToString();




            }
            else
            {
                
            }
            cnn1.Close();
        }
        protected void LinkButton1_Command(object sender, CommandEventArgs e)
        {
            if (Session["kullanici_adi"] != null)
            {

                try
                {
                    Komutlar.Sepet_Null_For_Uye(e);
                }
                catch
                {

                }
            }
            else
            {
                Komutlar.Sepet_Null(e);
            }
               
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



            }

            Response.Redirect("urun_detayi.aspx");

        }

    }
}