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
    public partial class WatchList : System.Web.UI.Page
    {
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
        protected void CL_Click(object sender, EventArgs e)
        {
            Response.Redirect("MKW.aspx");
        }
        protected void DL_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
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


    }
}