using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace proj
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Yes(object sender, EventArgs e)
        {
            Response.Redirect("DLW.aspx");
        }
        protected void No(object sender, EventArgs e)
        {
            Response.Redirect("WatchList.aspx");
        }
    }
}