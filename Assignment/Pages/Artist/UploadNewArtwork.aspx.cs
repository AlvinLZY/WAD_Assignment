using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment.Pages
{
    public partial class Artist_Gallary : System.Web.UI.Page
    {
        #region variables
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["artWorkDB"].ConnectionString);
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                tbArtworkName.Text = "";
                tbDescription.Text = "";
                tbUnitPrice.Text = "";
            }
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            double unitPrice = 0;
            String artworkName = "";
            String fileName = "";
            String desc = "";
            String notificationMsg = "";
            String query = "";

            lblNotification.ForeColor = Color.Black;
            lblNotification.Text = "";
            
            if (!String.IsNullOrEmpty(tbArtworkName.Text.Trim()) && fuImage.HasFile && (String.IsNullOrEmpty(tbUnitPrice.Text.Trim()) || double.TryParse(tbUnitPrice.Text, out unitPrice)))
            {
                try
                {

                    artworkName = tbArtworkName.Text;
                    fileName = fuImage.FileName.ToString();
                    desc = tbDescription.Text;

                    #region save in local folder
                    //String filepath = "";
                    //filepath = Path.GetDirectoryName(AppDomain.CurrentDomain.BaseDirectory) + "\\App_Data\\images";

                    //if (!Directory.Exists(filepath))
                    //    Directory.CreateDirectory(filepath);

                    //fuImage.PostedFile.SaveAs(filepath + "\\" + fileName);
                    #endregion

                    #region save in db
                    int imgFileLength = fuImage.PostedFile.ContentLength;
                    byte[] imgArray = new byte[imgFileLength];
                    HttpPostedFile image = fuImage.PostedFile;
                    image.InputStream.Read(imgArray, 0, imgFileLength);
                    #endregion

                    con.Open();
                    query = string.Format("INSERT INTO ImageDB VALUES ('{0}',@Image,'{1}','{2}')", artworkName, desc, unitPrice.ToString("#.##"));
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@Image", SqlDbType.Image).Value = imgArray;
                    cmd.ExecuteNonQuery();

                    notificationMsg = "Image Uploaded successfully";

                    tbArtworkName.Text = "";
                    tbDescription.Text = "";
                    tbUnitPrice.Text = "";
                }
                catch (Exception ex)
                {
                    notificationMsg = "Image Upload unsuccessfully.<br>Please check the Internet connection.";
                    lblNotification.ForeColor = Color.Red;
                }
                finally
                {
                    con.Close();
                }
            }
            else
            {
                if (String.IsNullOrEmpty(tbUnitPrice.Text))
                    notificationMsg += "Please Insert the Price!<br>";
                if (!fuImage.HasFile)
                    notificationMsg += "Please upload artwork image!<br>";
                if (String.IsNullOrWhiteSpace(tbArtworkName.Text))
                    notificationMsg += "Please Insert Artwork name!<br>";
                lblNotification.ForeColor = Color.Red;
            }
            lblNotification.Visible = Visible;
            lblNotification.Text = notificationMsg;
        }
    }
}