using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Oracle.DataAccess.Client;
using System.Data;

namespace WebApplication1
{
    public partial class giris : System.Web.UI.Page
    {
        string connStr = "Data Source=TEST;User ID=ABYS;Password=lavanta;";
        string kullanici_id = "";
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void giris_butonu_Click(object sender, EventArgs e)
        {
            OracleConnection cnn1 = new OracleConnection(connStr);
            OracleCommand comand1 = new OracleCommand();
            comand1.Connection = cnn1;
            cnn1.Open();
            comand1.CommandText = "select * from giyim_kullanicilar where kullanici_email='"+email.Text+"' and kullanici_sifre='"+password.Text+"'";
            comand1.CommandType = CommandType.Text;
            OracleDataReader dr = comand1.ExecuteReader();

            if (dr.Read())
            {
                Session["kullanici_adi"] = dr["kullanici_adi"].ToString();
                kullanici_id = dr["kullanici_id"].ToString();
               

                

            }
            else
            {
                Response.Write("Hatalı giris yaptınız yeniden deneyin");
            }
            cnn1.Close();
            OracleConnection cnn = new OracleConnection(connStr);


            OracleCommand comand = new OracleCommand();
            comand.Connection = cnn;
            comand.CommandText = "update  giyim_kullanicilar set durum='online' where kullanici_id='" + kullanici_id + "'";
            comand.CommandType = CommandType.Text;
            cnn.Open();
            comand.ExecuteNonQuery();
            cnn.Close();
            Response.Redirect("~/index.aspx");
        }
        
    }
}