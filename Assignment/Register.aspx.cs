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
    public partial class Register : BasePage
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["artWorkDB"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            String accType = ddlAccType.SelectedValue.ToString();
            String firstName = txtFirstName.Text;
            String lastName = txtLastName.Text;
            String DOB = txtDob.Text;
            String gender = ddlGender.SelectedValue.ToString();
            String email = txtEmail.Text;
            String phoneNo = txtPhone.Text;
            String password = txtPassword.Text;
            String confPass = txtConfirmPass.Text;

            if(accType=="Customer")
            {
                con.Open();
                string sql = "INSERT INTO Customer (email,firstName,lastName,DOB,gender,phoneNo,password) VALUES(@email,@firstName,@lastName,@DOB,@gender,@phoneNo,@password)";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@email", email);
                cmd.Parameters.AddWithValue("@firstName", firstName);
                cmd.Parameters.AddWithValue("@lastName", lastName);
                cmd.Parameters.AddWithValue("@DOB", DOB);
                cmd.Parameters.AddWithValue("@gender", gender);
                cmd.Parameters.AddWithValue("@phoneNo", phoneNo);
                cmd.Parameters.AddWithValue("@password", password);

                int n = cmd.ExecuteNonQuery();
                con.Close();

                Response.Write("<script> window.alert('Account created successfully')</script>");
                //Response.Redirect("Register.aspx");

            }
            else
            {
                con.Open();
                string sql = "INSERT INTO Artist (email,firstName,lastName,DOB,gender,phoneNo,password) VALUES(@email,@firstName,@lastName,@DOB,@gender,@phoneNo,@password)";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@email", email);
                cmd.Parameters.AddWithValue("@firstName", firstName);
                cmd.Parameters.AddWithValue("@lastName", lastName);
                cmd.Parameters.AddWithValue("@DOB", DOB);
                cmd.Parameters.AddWithValue("@gender", gender);
                cmd.Parameters.AddWithValue("@phoneNo", phoneNo);
                cmd.Parameters.AddWithValue("@password", password);

                int n = cmd.ExecuteNonQuery();
                con.Close();

                Response.Write("<script> window.alert('Account created successfully')</script>");
                //Response.Redirect("Register.aspx");
            }
        }
    }
}