using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment.Pages
{
    public partial class Artist_UploadNewArtwork : System.Web.UI.Page
    {
        #region variables
        public SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["artWorkDB"].ConnectionString);
        #endregion

        public void connection()
        {
            con.Open();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                con.Open();
                String query = "SELECT * FROM ImageDB";
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataReader dr = cmd.ExecuteReader();
                gvArtwork.DataSource = dr;
                gvArtwork.DataBind();
            }
        }
    }
}