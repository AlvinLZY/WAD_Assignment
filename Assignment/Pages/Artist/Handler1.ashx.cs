using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Assignment.Pages.Artist
{
    /// <summary>
    /// Summary description for Handler1
    /// </summary>
    public class Handler1 : IHttpHandler
    {
        Artist_UploadNewArtwork glr = new Artist_UploadNewArtwork();


        public void ProcessRequest(HttpContext context)
        {
            string displayImgId = context.Request.QueryString["id_Image"].ToString();
            glr.con.Open();
            string query = "Select Image FROM ImageDB where id=" + displayImgId;
            SqlCommand cmd = new SqlCommand(query, glr.con);
            SqlDataReader dr = cmd.ExecuteReader();

            dr.Read();
            context.Response.BinaryWrite((Byte[])dr[0]);
            context.Response.End();
        }


        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}