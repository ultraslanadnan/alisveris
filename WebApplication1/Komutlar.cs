using Oracle.DataAccess.Client;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Collections;

namespace WebApplication1
{
    public static class Komutlar
    {
        static string connStr = "Data Source=TEST;User ID=ABYS;Password=lavanta;";
        static   string kategori_adi = "";
        static   string urun_kategori = "";
        static string urun_id = "";
        static string urun_id2 = "";
        static string urun_id3 = "";
        static string urunadi = "";
        static string urun_resmi = "";
        static string urun_fiyati = "";
        
        static string kullanici_id = "";
        static string kullanici_adi = "";


        static string kullanici_id_2 = "";
   
        static   List<string>  list = new List<string>();
        static List<string> list_UyeID_Urun = new List<string>();


      
        public static void benzerlik_Urunleri()
        {
           
            OracleConnection cnn = new OracleConnection(connStr);
            OracleCommand comand = new OracleCommand();
            comand.Connection = cnn;
             cnn.Open();
            comand.CommandText = "update urun_satislar set benzer='benzerlik2' where benzer='null' and urun_id='"+urun_id+"'  and incele='evet'";
                comand.CommandType = CommandType.Text;


            comand.ExecuteNonQuery();
            cnn.Close();
            

        }
        public static void benzerlik_uye_cekme()
        {
         
            OracleConnection cnn1 = new OracleConnection(connStr);
            OracleCommand comand1 = new OracleCommand();
            comand1.Connection = cnn1;
            cnn1.Open();
            comand1.CommandText = "  select* from urun_satislar where incele='evet' and benzer='benzerlik2' ";
            comand1.CommandType = CommandType.Text;
            OracleDataReader dr = comand1.ExecuteReader();

            list.Clear();
             
            while (dr.Read())
            {
              
                 list.Add(dr["kullanici_id"].ToString());
          }
            int count = list.Count(s => list.Contains(s));
            for (int i = 0; i < count; i++)
            {
               
                OracleConnection cnn = new OracleConnection(connStr);
                OracleCommand comand = new OracleCommand();
                comand.Connection = cnn;
                cnn.Open();
                comand.CommandText = "update urun_satislar set benzer='benzerlik3' where benzer='null'and kullanici_id in(" + list[i] + ")  and incele='evet'";
                comand.CommandType = CommandType.Text;


                comand.ExecuteNonQuery();

                cnn.Close();
            }








            cnn1.Close();
        }
        
        public static void urun_inceleme_Uye()
        {
         
        


            OracleConnection cnn1 = new OracleConnection(connStr);
            OracleCommand comand1 = new OracleCommand();
            comand1.Connection = cnn1;
            cnn1.Open();
            comand1.CommandText = "select * from urun_satislar where kullanici_id='" + kullanici_id + "' and urun_id='" + urun_id + "'";
            comand1.CommandType = CommandType.Text;
            OracleDataReader dr = comand1.ExecuteReader();

            if (dr.Read())
            {
                try
                {

                }
                catch
                {

                }
               


            }
            else
            {
                Komutlar.Urun_satislar_Ekle();
            }
           
            cnn1.Close();
        }
        public static void Urun_satislar_Ekle()
        {
            OracleConnection cnn = new OracleConnection(connStr);
            OracleCommand comand = new OracleCommand();
            comand.Connection = cnn;
            cnn.Open();
            comand.CommandText = "insert into urun_satislar (kullanici_id, urun_id, incele, urunadi, kullanici_adi, urun_resmi, urun_fiyati) Values('" + kullanici_id + "', '" + urun_id + "', 'evet', ' " + urunadi + "',  '" + kullanici_adi + "', '"+urun_resmi+"', '"+urun_fiyati+"')";
            comand.CommandType = CommandType.Text;


            comand.ExecuteNonQuery();
            cnn.Close();

           
        }
 


        public static void index_pageload()
        {
            OracleConnection cnn = new OracleConnection(connStr);
            OracleCommand comand = new OracleCommand();
            comand.Connection = cnn;
            cnn.Open();
            comand.CommandText = "update urun_satislar set sepet_kayitlari='kayitli' where sepet='evet' and kullanici_id='"+kullanici_id+ "'";
            comand.CommandType = CommandType.Text;


            comand.ExecuteNonQuery();
            cnn.Close();


        }


        public static void İnceleButonu(CommandEventArgs e)
        {
           
            OracleConnection cnn = new OracleConnection(connStr);
            OracleCommand comand = new OracleCommand();
            comand.Connection = cnn;
            comand.CommandText = "update temp_urunler set incele='evet'  where  urun_id=" + e.CommandArgument.ToString() + " ";
            comand.CommandType = CommandType.Text;
            cnn.Open();
            comand.ExecuteNonQuery();
            cnn.Close();
           
        

        }
        public static void İnceleSifirlama(EventArgs e)
        {
            OracleConnection cnn = new OracleConnection(connStr);
            OracleCommand comand = new OracleCommand();
            comand.Connection = cnn;
            comand.CommandText = "update temp_urunler set  incele='null'  ";
            comand.CommandType = CommandType.Text;
            cnn.Open();
            comand.ExecuteNonQuery();
            cnn.Close();
            
        }
        public static void UrunPuanArtirimi(CommandEventArgs e)
        {
            


            OracleConnection cnn = new OracleConnection(connStr);
            OracleCommand comand = new OracleCommand();
            comand.Connection = cnn;
            comand.CommandText = "update temp_urunler set  urun_puani=temp_urunler.urun_puani + 99 where  urun_id=" + e.CommandArgument.ToString() + " ";
            comand.CommandType = CommandType.Text;
            cnn.Open();
            comand.ExecuteNonQuery();
            cnn.Close();


         

        }
        public static void BenzerUrunlerİncele()
        {
            OracleConnection cnn = new OracleConnection(connStr);


            OracleCommand comand = new OracleCommand();
            comand.Connection = cnn;
            comand.CommandText = "update  temp_urunler set incele='hayir'  where  incele='null' and kategori_adi='" + kategori_adi + "' and urun_kategori='" + urun_kategori + "'  ";
            comand.CommandType = CommandType.Text;
            cnn.Open();
            comand.ExecuteNonQuery();
            cnn.Close();
        }

        public static void Benzer_incelendi()
        {
            OracleConnection cnn = new OracleConnection(connStr);


            OracleCommand comand = new OracleCommand();
            comand.Connection = cnn;
            comand.CommandText = "update  urun_satislar set benzer='benzerlik'  where   kullanici_id='" + kullanici_id + "' and urun_id='"+urun_id+"'   ";
            comand.CommandType = CommandType.Text;
            cnn.Open();
            comand.ExecuteNonQuery();
            cnn.Close();
        }


        public static void Benzer_incelendi_Sifirlama()
        {
            OracleConnection cnn = new OracleConnection(connStr);


            OracleCommand comand = new OracleCommand();
            comand.Connection = cnn;
            comand.CommandText = "update  urun_satislar set benzer='null'    ";
            comand.CommandType = CommandType.Text;
            cnn.Open();
            comand.ExecuteNonQuery();
            cnn.Close();
        }
        public static void KategoriCekme()
        {
            OracleConnection cnn = new OracleConnection(connStr);


            OracleCommand comand = new OracleCommand();
            comand.Connection = cnn;
            comand.CommandText = "select *from temp_urunler  where  incele='evet' ";
            comand.CommandType = CommandType.Text;
            cnn.Open();


            OracleDataReader dr = comand.ExecuteReader();

            if (dr.Read())
            {
                
                urunadi = dr["urunadi"].ToString();
                urun_id = dr["urun_id"].ToString();
                kategori_adi = dr["kategori_adi"].ToString();
                urun_kategori = dr["urun_kategori"].ToString();
                urun_resmi = dr["urun_resmi"].ToString();
                urun_fiyati = dr["urun_fiyati"].ToString();

            }
            else
            {


            }
            dr.Dispose();
            cnn.Close();
        }



        public static void Sepet_Urun_ID_Cekme()
        {
            OracleConnection cnn = new OracleConnection(connStr);


            OracleCommand comand = new OracleCommand();
            comand.Connection = cnn;
            comand.CommandText = "select *from temp_urunler  where  sepet='evet' ";
            comand.CommandType = CommandType.Text;
            cnn.Open();


            OracleDataReader dr = comand.ExecuteReader();

            if (dr.Read())
            {

             
                urun_id2 = dr["urun_id"].ToString();
              

            }
            else
            {


            }
            dr.Dispose();
            cnn.Close();
        }


       
        public static void uyeCekme()
        {
            OracleConnection cnn = new OracleConnection(connStr);


            OracleCommand comand = new OracleCommand();
            comand.Connection = cnn;
            comand.CommandText = "select *from giyim_kullanicilar  where  durum='online' ";
            comand.CommandType = CommandType.Text;
            cnn.Open();


            OracleDataReader dr = comand.ExecuteReader();

            if (dr.Read())
            {
                kullanici_id = dr["kullanici_id"].ToString();
                kullanici_adi = dr["kullanici_adi"].ToString();

            }
            else
            {


            }
            dr.Dispose();
            cnn.Close();
        }

        public static void Sepet_Null(CommandEventArgs e)
        {



            OracleConnection cnn1 = new OracleConnection(connStr);
            OracleCommand comand1 = new OracleCommand();
            comand1.Connection = cnn1;
            cnn1.Open();
            comand1.CommandText = "update  temp_urunler set sepet='null' where urun_id='" + e.CommandArgument.ToString() + "'";
            comand1.CommandType = CommandType.Text;
            OracleDataReader dr = comand1.ExecuteReader();




        }
        public static void Sepet_Null_For_Uye(CommandEventArgs e)
        {



            OracleConnection cnn1 = new OracleConnection(connStr);
            OracleCommand comand1 = new OracleCommand();
            comand1.Connection = cnn1;
            cnn1.Open();
            comand1.CommandText = "update  urun_satislar set sepet='null' where urun_id='" + e.CommandArgument.ToString() + "'";
            comand1.CommandType = CommandType.Text;
            OracleDataReader dr = comand1.ExecuteReader();




        }
        public static void Sepet_Ekle(CommandEventArgs e)
        {



            OracleConnection cnn1 = new OracleConnection(connStr);
            OracleCommand comand1 = new OracleCommand();
            comand1.Connection = cnn1;
            cnn1.Open();
            comand1.CommandText = "update  temp_urunler set sepet='evet' where urun_id='" + e.CommandArgument.ToString() + "'";
            comand1.CommandType = CommandType.Text;
            OracleDataReader dr = comand1.ExecuteReader();




        }
        public static void Uye_ID_for_Sepet()
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

     

        public static void Kullanici_Sepetleri()
        {
          

            OracleConnection cnn = new OracleConnection(connStr);
            OracleCommand comand = new OracleCommand();
            comand.Connection = cnn;
            comand.CommandText = "update urun_satislar set  sepet_kayitlari='kayitli' where sepet='evet' and  kullanici_id=" + kullanici_id + " ";
            comand.CommandType = CommandType.Text;
           
            cnn.Open();
            comand.ExecuteNonQuery();
            cnn.Close();
        }
        public static void Kullanici_Sepetleri_Null()
        {


            OracleConnection cnn1 = new OracleConnection(connStr);
            OracleCommand comand1 = new OracleCommand();
            comand1.Connection = cnn1;
            comand1.CommandText = "update urun_satislar set  sepet_kayitlari='null'  ";
            comand1.CommandType = CommandType.Text;

            cnn1.Open();
            comand1.ExecuteNonQuery();
            cnn1.Close();
        }


    }
}


