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
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                if (Session["username"].ToString() != "")
                { Message.Text = "Welcome " + Session["username"].ToString(); }
                else
                {
                    Response.Redirect("WebForm4.aspx");
                }
            
            }
            else
            {
                Response.Redirect("WebForm4.aspx");
            }
         
   
        }
        protected void Logout_Click(object sender, EventArgs e)
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
                found = objmyDAl.Logout_DAL(Session["username"].ToString());
                if (found != "User Name not Present")
                {
                    Session["username"] = null;
                    
                    Response.Redirect("WebForm1.aspx");
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