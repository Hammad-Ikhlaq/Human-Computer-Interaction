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

namespace proj
{
    public partial class MKW : System.Web.UI.Page
    {

        protected void Logout_Click(object sender, EventArgs e)
        {
            myDAL objmyDAl = new myDAL();
            //String InputName = Name.Text;
            String InputEmail = Request.Form["Email"];
            String InputPassword = Request.Form["Password"];

            string found;
            found = objmyDAl.Logout_DAL(Session["username"].ToString());
            if (found != "User Name not Present")
            {
                Session["username"] = null;

                Response.Redirect("Index.aspx");
                //    SearchResultGrid.DataSource = DT;
                //  SearchResultGrid.DataBind();
            }
            else
            {

            }

        }
        //END HERE

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("LogInSignal.aspx");
            }
            else
            {
                if (Session["username"].ToString() == "")
                {
                    Response.Redirect("LogInSignal.aspx");

                }
                else
                {
                }
            }
        }
        protected void MKW_Click(object sender, EventArgs e)
        {
            string found;
            myDAL objmyDAl = new myDAL();
            //String InputName = Name.Text;
            String InputName = Request.Form["Name"];
            if (InputName == "")
            {
                Message.Text = "Please enter a name for the list";
            }
            else
            {
                String Username = Session["username"].ToString();
                found = objmyDAl.CL_DAL(InputName, Username);
                if (found != "A list wih the same same already exists")
                {
                    Message.Text = "List " + InputName + " Created";

                }
                else
                {
                    Message.Text = found;
                }
            }
        }
    }
}