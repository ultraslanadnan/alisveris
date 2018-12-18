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
    public partial class sepet : System.Web.UI.Page
    {




        static string connStr = "Data Source=TEST;User ID=ABYS;Password=lavanta;";
        static List<string> list_urun_fiyati = new List<string>();

        int subtotal = 0;
        int subtotal2 = 0;
        int subtotal3 = 0;
        int subtotal4 = 0;
        List<string> list = new List<string>();
        List<string> list_Uye = new List<string>();
        private void urun_fiyati_ForUye()
        {

            OracleConnection cnn1 = new OracleConnection(connStr);
            OracleCommand comand1 = new OracleCommand();
            comand1.Connection = cnn1;
            cnn1.Open();
            comand1.CommandText = "  select* from urun_satislar where sepet='evet' and sepet_kayitlari='kayitli' ";
            comand1.CommandType = CommandType.Text;
            OracleDataReader dr = comand1.ExecuteReader();

            list_Uye.Clear();

            while (dr.Read())
            {

                list_Uye.Add(dr["urun_fiyati"].ToString());
            }
            int count = list_Uye.Count(s => list_Uye.Contains(s));
            for (int i = 0; i < count; i++)
            {
                int sum_for_uye = Int32.Parse(list_Uye[i].ToString());
                subtotal3 += sum_for_uye;
                toplam2.InnerText = subtotal3.ToString() + "₺";

            }

            cnn1.Close();
        }
        private void urun_fiyati()
        {

            OracleConnection cnn1 = new OracleConnection(connStr);
            OracleCommand comand1 = new OracleCommand();
            comand1.Connection = cnn1;
            cnn1.Open();
            comand1.CommandText = "  select* from temp_urunler where sepet='evet'  ";
            comand1.CommandType = CommandType.Text;
            OracleDataReader dr = comand1.ExecuteReader();

            list.Clear();

            while (dr.Read())
            {

                list.Add(dr["urun_fiyati"].ToString());
            }
            int count = list.Count(s => list.Contains(s));
            for (int i = 0; i < count; i++)
            {
                subtotal4 += Int32.Parse(list[i]);
                toplam.InnerText = subtotal4.ToString() + "₺";

            }

            cnn1.Close();
        }



        OracleConnection cnn = new OracleConnection(connStr);
        protected void Page_Load(object sender, EventArgs e)
        {


            if (Session["kullanici_adi"] != null)
            {

                try
                {
                    Komutlar.uyeCekme();
                    urun_fiyati_ForUye();
                    tbody_genel.Visible = false;
                    tbody_ForUye.Visible = true;
                }
                catch
                {
                }

            }
            else
            {
                tbody_genel.Visible = true;
                tbody_ForUye.Visible = false;

                urun_fiyati();




            }

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
        protected void up_Command(object sender, CommandEventArgs e)
        {
        }





        protected void down_Command(object sender, CommandEventArgs e)
        {

        }

        protected void Uyeler_Sepet_UrunAdeti_TextChanged(object sender, EventArgs e)
        {

            if (Session["kullanici_adi"] != null)
            {

                try
                { }
                catch { }
            }
            else
            {
                foreach (RepeaterItem item in Repeater1.Items)
                {

                    TextBox txtName = (TextBox)item.FindControl("uye_textbox");
                    TextBox txtName_no_uye = (TextBox)item.FindControl("textbox");
                    Label label = (Label)item.FindControl("total_fiyat_uye");
                    Label label_no_uye = (Label)item.FindControl("total_fiyat");
                    Label label_no_uye_2 = (Label)item.FindControl("total_fiyat2");
                    Label label_2 = (Label)item.FindControl("total_fiyat_for_uye");
                    if (txtName_no_uye.Text != null)
                    { 
                        string urun_id_fiyati = label_no_uye_2.Text;
                        int total = Int32.Parse(urun_id_fiyati);
                        string adet = txtName_no_uye.Text;

                        int text = Int32.Parse(adet);

                        int x = total * text;

                        subtotal += x;

                        label_no_uye.Text = x.ToString();
                    }



                    toplam.InnerText = subtotal.ToString() + "₺";
                }
            }
       
        }
        protected void uye_textbox_TextChanged(object sender, EventArgs e)
        {
            if (Session["kullanici_adi"] != null)
            {

                try
                {
                    foreach (RepeaterItem item in Repeater2.Items)
                    {

                        TextBox txtName = (TextBox)item.FindControl("uye_textbox");
                        TextBox txtName_no_uye = (TextBox)item.FindControl("textbox");
                        Label label = (Label)item.FindControl("total_fiyat_uye");
                        Label label_no_uye = (Label)item.FindControl("total_fiyat");
                        Label label_no_uye_2 = (Label)item.FindControl("total_fiyat2");
                        Label label_2 = (Label)item.FindControl("total_fiyat_for_uye");
                        if (txtName.Text != null)
                        {
                            
                            string urun_id_fiyati = label_2.Text;
                            int total = Int32.Parse(urun_id_fiyati);
                            string adet = txtName.Text;

                            int text = Int32.Parse(adet);

                            int x = total * text;

                            subtotal2 += x;

                            label.Text = x.ToString();
                        }
                        toplam2.InnerText = subtotal2.ToString() + "₺";
                    }
                    
                }
                catch { }
            }
            else
            { }
      
          }
        }
    }
