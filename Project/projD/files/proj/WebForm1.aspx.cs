using System;
using System.Collections.Generic;
//using System.Linq;
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
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
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
            
          

        }
        protected void loginAccount_Click(object sender, EventArgs e)
        {
            myDAL objmyDAl = new myDAL();
            //String InputName = Name.Text;
            String InputEmail = Request.Form["Email"];
            String InputPassword = Request.Form["Password"];

            if (InputEmail == "")
            {
                Message.Text = "Please Enter email";

            }
            else if (InputPassword == "")
            {
                Message.Text = "Please Enter Password";

            }
            else
            {
                string found;
                    found = objmyDAl.loginAccount_DAL(InputEmail, InputPassword);
                    if (found != "User already Logged In" && found != "Invalid Password" && found != "Invalid Email")
                    {
                        Session["username"] = found;
                        Response.Redirect("WebForm3.aspx");
                        Message.Text = "Welcome " + found;
                        //    SearchResultGrid.DataSource = DT;
                        //  SearchResultGrid.DataBind();
                    }
                    else
                    {
                        Message.Text = "Error is " + found;

                    }
            }
        }
    }
}