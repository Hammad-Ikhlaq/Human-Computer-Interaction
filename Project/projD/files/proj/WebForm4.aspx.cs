using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace proj
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["error"] == null)
            {
                Response.Redirect("INDEX.aspx");
            }
            if (Session["error"] != null)
            {
                if (Session["error"].ToString() != "")
                {
                    Message.Text = Session["error"].ToString();
                }
                else
                {
                    Response.Redirect("INDEX.aspx");
                }
            }
            

/*            if (Session["username"] == null)
            {
            }
            else
            {
                Response.Redirect("WebForm3.aspx");
            }
            if (Session["username"] != null)
            {
                if (Session["username"].ToString() != "")
                { }
                else
                {
                    Response.Redirect("WebForm3.aspx");
                }
            }
            
            */
        }
    }
}