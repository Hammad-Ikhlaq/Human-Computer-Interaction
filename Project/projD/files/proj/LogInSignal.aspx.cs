using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Data;
using proj.DAL;
using System.Configuration;

namespace proj
{
    public partial class LogInSignal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
            }
            else
            {
                if (Session["username"].ToString() == "")
                {
                }
                else
                {
                    Response.Redirect("LoggedIn.aspx");
                }
            }
        }
        protected void loginAccount_Click(object sender, EventArgs e)
        {
            myDAL objmyDAl = new myDAL();
            //String InputName = Name.Text;
            String InputEmail = Request.Form["Email"];
            String InputPassword = Request.Form["Password"];

            string found ="Hammad";
            if (InputEmail =="123"&& InputPassword == "123")
            {

                Session["username"] = found;
                Response.Redirect("LoggedIn.aspx");
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Alert", "ShowError();", true);
                if(InputEmail != "123" && InputPassword == "123")
                {
                    found = "Invalid email";
                }
                else
                    found = "Invalid password";
                Er.Text = found;

            }
        }
    }
}