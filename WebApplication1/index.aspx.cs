
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Oracle.DataAccess.Client;
using System.Text;
using System.Data;
using System.Web.UI.HtmlControls;

namespace WebApplication1
{


    public partial class index : System.Web.UI.Page
    
    {
  


        string connStr = "Data Source=TEST;User ID=ABYS;Password=lavanta;";
        string kullanici_id3 = "";
         string kategori_adi = "";
         string urun_kategori = "";
         string urun_id = "";
         string urun_id2 = "";
         string urun_id3 = "";
         string urunadi = "";
         string urun_resmi = "";
         string urun_fiyati = "";
        string kullanici_adi = "";
        
         List<string> list_UyeID_Urun = new List<string>();


        private  void Urun_satislar_Ekle1()
        {
            OracleConnection cnn = new OracleConnection(connStr);
            OracleCommand comand = new OracleCommand();
            comand.Connection = cnn;
            cnn.Open();
            comand.CommandText = "insert into urun_satislar (kullanici_id, urun_id, incele, urunadi, kullanici_adi, urun_resmi, urun_fiyati, sepet) Values('" + kullanici_id3 + "', '" + urun_id3 + "', 'evet', ' " + urunadi + "',  '" + kullanici_adi + "', '" + urun_resmi + "', '" + urun_fiyati + "', 'evet')";
            comand.CommandType = CommandType.Text;


            comand.ExecuteNonQuery();
            cnn.Close();


        }
   private void Uye_sepet_Ekle(CommandEventArgs e)
        {
            OracleConnection cnn = new OracleConnection(connStr);

            OracleCommand comand = new OracleCommand();
            comand.Connection = cnn;
            comand.CommandText = "select *from giyim_kullanicilar  where durum='online' ";
            comand.CommandType = CommandType.Text;
            cnn.Open();


            OracleDataReader dr = comand.ExecuteReader();

            if (dr.Read())
            {

                kullanici_id3 = dr["kullanici_id"].ToString();

                kullanici_adi = dr["kullanici_adi"].ToString();



            }
            else
            {


            }
            dr.Dispose();
            cnn.Close();


            OracleCommand comand1 = new OracleCommand();
            comand1.Connection = cnn;
            comand1.CommandText = "select *from temp_urunler  where urun_id='" + e.CommandArgument.ToString() + "' ";
            comand1.CommandType = CommandType.Text;
            cnn.Open();


            OracleDataReader dr1 = comand1.ExecuteReader();

            if (dr1.Read())
            {
                urun_id3 = dr1["urun_id"].ToString();
                urunadi = dr1["urunadi"].ToString();
                urun_resmi = dr1["urun_resmi"].ToString();
                urun_fiyati = dr1["urun_fiyati"].ToString();




            }
            else
            {


            }
            dr.Dispose();
            cnn.Close();
        }
        private  void urun_inceleme_Uye1()
        {
            
            OracleConnection cnn1 = new OracleConnection(connStr);
            OracleCommand comand1 = new OracleCommand();
            comand1.Connection = cnn1;
            cnn1.Open();
            comand1.CommandText = "select * from urun_satislar where kullanici_id='" + kullanici_id3 + "' and urun_id='" + urun_id3 + "'";
            comand1.CommandType = CommandType.Text;
            OracleDataReader dr = comand1.ExecuteReader();

            if (dr.Read())
            {
                try
                {
                    OracleConnection cnn2 = new OracleConnection(connStr);
                    OracleCommand comand2 = new OracleCommand();
                    comand2.Connection = cnn1;
                    cnn2.Open();
                    comand2.CommandText = "update  urun_satislar set sepet='evet' where urun_id='" + urun_id3 + "' and kullanici_id='" + kullanici_id3 + "' ";
                    comand2.CommandType = CommandType.Text;
                    comand2.ExecuteNonQuery();
                    cnn2.Close();
                }
                catch
                {

                }



            }
            else
            {
                Urun_satislar_Ekle1();
            }

            cnn1.Close();
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            


        }

    

        protected void LinkButton1_Command(object sender, CommandEventArgs e)
        {
            if (Session["kullanici_adi"] != null)
            {

                try

                {
                    Uye_sepet_Ekle(e);

                    urun_inceleme_Uye1();

                }
                catch
                {

                }
            }
            else
            {
               
                Komutlar.Sepet_Ekle(e);
               
            }

            Komutlar.UrunPuanArtirimi(e);
          
            Response.Redirect(Request.RawUrl);
        }


        protected void incele_butonu_Command(object sender, CommandEventArgs e)
        {
            if (Session["kullanici_adi"] != null)
            {


                try { 
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





