using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace proj
{
    public partial class Details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


        }
                protected void Shows(object sender, EventArgs e)
        {
                    Response.Redirect("dshow.aspx");

        }
                protected void Movies(object sender, EventArgs e)
                {

                    Response.Redirect("dmovies.aspx");
                }
    
    }
}