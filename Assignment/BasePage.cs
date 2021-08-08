using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Assignment
{
    public class BasePage: System.Web.UI.Page
    {
        protected void Page_PreInit(object sender, EventArgs e)
        {            
            try
            {
                if (Session["accType"].ToString()=="Customer")
                    this.Page.MasterPageFile = "~/MasterPage/Customer.master";
                else if(Session["accType"].ToString() == "Artist")
                    this.Page.MasterPageFile = "~/MasterPage/Artist.master";
                else
                    this.Page.MasterPageFile = "~/MasterPage/Site1.master";

            }
            catch (Exception ex)
            {

            }
        }
    }
}