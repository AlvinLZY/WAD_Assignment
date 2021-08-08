using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;


namespace Assignment
{
    public partial class Login : BasePage
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["artWorkDB"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string email = txtLoginEmail.Text;
            string password = txtLoginPass.Text;

            if(ddlAccType.SelectedValue.ToString() =="Customer")
            {                
                string sql = "SELECT * FROM Customer WHERE email =@email AND password =@password";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@email", email);
                cmd.Parameters.AddWithValue("@password", password);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                if(dr.Read())
                {                   
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Login successful!');window.location.href='Home.aspx';", true);
                    Session["accType"] = "Customer";
                    Session["email"] = email;
                    String name = dr["firstName"].ToString() +" "+ dr["lastName"].ToString();
                    Session["user"] = name;
                    
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Unsuccessful login! Please check your email and password again!');window.location.href='Login.aspx';", true);
                }
                con.Close();
            }
            else
            {
                string sql = "SELECT * FROM Artist WHERE email =@email AND password =@password";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@email", email);
                cmd.Parameters.AddWithValue("@password", password);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Login successful!');window.location.href='Home.aspx';", true);
                    Session["accType"] = "Artist";
                    Session["email"] = email;
                    String name = dr["firstName"].ToString() + " " + dr["lastName"].ToString();
                    Session["user"] = name;

                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Unsuccessful login! Please check your email and password again!');window.location.href='Login.aspx';", true);
                }
                con.Close();
            }
        }
    }
}