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
    public partial class OpeningThisWeek : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            myDAL objmyDAl = new myDAL();
            //String InputName = Name.Text;
            DataSet DT = null;
            String found;
            found = objmyDAl.otwfullview_DAL(ref DT);
            if (found != " ")
            {
                bool msc = true, ac = true, ok = false;
                for (int i = 0; i < DT.Tables.Count; i++)
                {

                    GridView SearchResultGrid = new GridView();
                    Label l = new Label();
                    Label lk;
                    if (DT.Tables[i].Columns.Count > 2)
                    {
                        if (DT.Tables[i].Columns[0].ToString() == "Show Name" && msc)
                        {
                            if (DT.Tables[i] != null)
                            {
                                if (DT.Tables[i].Rows.Count > 0)
                                {
                                    l.Text = "Shows";
                                    l.Attributes.Add("style", "font-size:30px; color:Black; font-weight:bold;");
                                    pl.Controls.Add(l);
                                    pl.Controls.Add(new LiteralControl("<br/>"));

                                    pl.Controls.Add(new LiteralControl("<br/>"));
                                    for (int k = 0; k < DT.Tables[i].Rows.Count; k++)
                                    {

                                        for (int p = 0; p < DT.Tables[i].Columns.Count; p++)
                                        {
                                            lk = new Label();
                                            lk.Text = DT.Tables[i].Rows[k][p].ToString();
                                            pl.Controls.Add(lk);
                                            pl.Controls.Add(new LiteralControl("<br/>"));

                                            pl.Controls.Add(new LiteralControl("<br/>"));

                                        }
                                        pl.Controls.Add(new LiteralControl("<hr/>"));



                                    } ok = true;
                                }
                            }
                        }
                    }
                    if (DT.Tables[i].Columns.Count > 0)
                    {

                        if (DT.Tables[i].Columns[0].ToString() == "Movie Name" && ac)
                        {
                            if (DT.Tables[i] != null)
                            {
                                if (DT.Tables[i].Rows.Count > 0)
                                {

                                    l.Text = "Movies";
                                    l.Attributes.Add("style", "font-size:30px; color:Black; font-weight:bold;");
                                        
                                    pl.Controls.Add(l);
                                    pl.Controls.Add(new LiteralControl("<br/>"));

                                    pl.Controls.Add(new LiteralControl("<br/>"));
                                    for (int k = 0; k < DT.Tables[i].Rows.Count; k++)
                                    {

                                        for (int p = 0; p < DT.Tables[i].Columns.Count; p++)
                                        {
                                            lk = new Label();
                                            lk.Text = DT.Tables[i].Rows[k][p].ToString();
                                            pl.Controls.Add(lk);
                                            pl.Controls.Add(new LiteralControl("<br/>"));

                                            pl.Controls.Add(new LiteralControl("<br/>"));

                                        }
                                        pl.Controls.Add(new LiteralControl("<hr/>"));



                                    } ok = true;
                                }

                            }
                        }
                    }
                    pl.Controls.Add(SearchResultGrid);
                    if (ok)
                    {
                        pl.Controls.Add(new LiteralControl("<hr/>"));
                        ok = false;

                    }
                    Session["search"] = null;

                }
            }
            else
            {
                Label l = new Label();
                l.Text = found;
                pl.Controls.Add(l);
                Session["search"] = null;

            }

        }
        protected void loginAccount_Click(object sender, EventArgs e)
        {
            myDAL objmyDAl = new myDAL();
            //String InputName = Name.Text;
            String InputEmail = Request.Form["Email"];
            String InputPassword = Request.Form["Password"];

            string found;
            found = objmyDAl.loginAccount_DAL(InputEmail, InputPassword);
            if (found != "User already Logged In" && found != "Invalid Password" && found != "Invalid Email")
            {
                Session["username"] = found;
                Response.Redirect("WebForm3.aspx");
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Alert", "ShowError();", true);
                // Session["error"] = 
                Er.Text = found;
                //Response.Redirect("WebForm4.aspx");

            }
        }
    
    }
}