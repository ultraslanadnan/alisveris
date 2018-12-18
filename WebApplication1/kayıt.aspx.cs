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
    public partial class kayıt : System.Web.UI.Page
    {
      string connStr = "Data Source=TEST;User ID=ABYS;Password=lavanta;";

  
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void kayit_butonu_Click(object sender, EventArgs e)
        {
            string adi = kullanici.Text.ToString();
            string email_ = email.Text.ToString();
            string pass = password.Text.ToString();
          

            OracleConnection cnn = new OracleConnection(connStr);
            OracleCommand comand = new OracleCommand();
            comand.Connection = cnn;
            cnn.Open();
            comand.CommandText = "insert into giyim_kullanicilar (kullanici_adi, kullanici_email, kullanici_sifre) Values('" + adi + "', '" + email_ + "', '" + pass + "')";
            comand.CommandType = CommandType.Text;
         
       
            comand.ExecuteNonQuery();
            cnn.Close();

            

            

        }
    }
}