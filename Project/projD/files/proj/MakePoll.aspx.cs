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
    public partial class WebForm7 : System.Web.UI.Page
    {
        static int i;

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
                if (Session["username"].ToString() != "")
                {
                    Response.Redirect("LogInSignal.aspx");

                }
                else
                {

                    this.Op.Visible = false;
                }
            }

        }

        protected void Page_Init(object sender, EventArgs e)
        {
            int k;
            for (k = 0; k < i; k++)
            {
                TextBox t = new TextBox();
                t.ID = "t" + k.ToString();
                pl.Controls.Add(new LiteralControl("<br/>"));
                pl.Controls.Add(new LiteralControl("<br/>"));
                pl.Controls.Add(new LiteralControl("Option No."));
                pl.Controls.Add(new LiteralControl((i + 1).ToString()));
                pl.Controls.Add(new LiteralControl("<br/>"));
                pl.Controls.Add(new LiteralControl("<br/>"));
                pl.Controls.Add(t);


            }
        }
        protected void AO(object sender, EventArgs e)
        {
            myDAL objmyDAl = new myDAL();
            String username = Session["username"].ToString();
            String pname = Request.Form["PName"];

            string[] option = new string[i+1];
            for (int j = 0; j < i; j++)
            {
                String n = "t" + j.ToString();
                TextBox txt = (TextBox)pl.FindControl(n);
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('" + txt.Text + "');", true);

                //option[j] = ((TextBox)pl.Controls[j+1]).Text;
                option[j] = txt.Text;
               string found =  objmyDAl.AO_DAL(username, pname, option[j]);
             }
            pl.Controls.Clear();

            i = 0;
        }


        protected void MakePoll(object sender, EventArgs e)
        {
            myDAL objmyDAl = new myDAL();
            String username = Session["username"].ToString();
            String pname = Request.Form["PName"];

            objmyDAl.MP_DAL(username, pname);
            int value = 0;
            String NOp = Request.Form["NO"];
            if (pname == "")
            {
                Message.Text = "Please Enter Poll Name ";

            }
            if (NOp == "")
            {
                Message.Text = "Please Enter Number of Options";

            }
            else if (!(int.TryParse(NOp, out value)))
            {
                Message.Text = "Please Enter Number for number of options";

            }
            else
            {
                for (i = 0; i < int.Parse(NOp); i++)
                {
                    TextBox t = new TextBox();
                    t.ID = "t" + i.ToString();
                    pl.Controls.Add(new LiteralControl("<br/>"));
                    pl.Controls.Add(new LiteralControl("<br/>"));
                    pl.Controls.Add(new LiteralControl("Option No."));
                    pl.Controls.Add(new LiteralControl((i + 1).ToString()));
                    pl.Controls.Add(new LiteralControl("<br/>"));
                    pl.Controls.Add(new LiteralControl("<br/>"));
                    pl.Controls.Add(t);


                }
                pl.Controls.Add(new LiteralControl("<br/>"));
                pl.Controls.Add(new LiteralControl("<br/>"));
                this.Op.Visible = true;


            }
        }    
    }
}