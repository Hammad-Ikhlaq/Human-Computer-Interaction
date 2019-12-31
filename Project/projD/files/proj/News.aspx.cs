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
    public partial class News : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            myDAL objmyDAl = new myDAL();
            string found;
            DataSet DT = null;
            found = objmyDAl.ShowNews_DAL(ref DT);
            if (found != " ")
            {
                int i = 0;
                Label lk;
                string p1, p2;
                for (int j = 0; j < DT.Tables.Count; j++)
                {
                    lk = new Label();
                    lk.Attributes.Add("style", "font-size:30px; color:Black; font-weight:bold;");

                    if (DT.Tables[j].Columns[0].ToString() == "Movie_Name")
                        lk.Text = "Movies";
                    if (DT.Tables[j].Columns[0].ToString() == "Actor_Name")
                        lk.Text = "Actors";
                    if (DT.Tables[j].Columns[0].ToString() == "Director_Name")
                        lk.Text = "Directors";
                    if (DT.Tables[j].Columns[0].ToString() == "Writer_Name")
                        lk.Text = "Writers";
                    if (DT.Tables[j].Columns[0].ToString() == "Production_Name")
                        lk.Text = "Producers";
                    if (DT.Tables[j].Columns[0].ToString() == "Show_Name")
                        lk.Text = "Shows";
                    pl.Controls.Add(lk);
                    pl.Controls.Add(new LiteralControl("<br/>"));

                    pl.Controls.Add(new LiteralControl("<br/>"));

                    for (int k = 0; k < DT.Tables[j].Rows.Count; k++)
                    {
                        
                        for (int p = 0; p < DT.Tables[j].Columns.Count; p++)
                        {
                            lk = new Label();
                           lk.Text = DT.Tables[j].Rows[k][p].ToString();
                            pl.Controls.Add(lk);
                            pl.Controls.Add(new LiteralControl("<br/>"));

                            pl.Controls.Add(new LiteralControl("<br/>"));

                        }
                        pl.Controls.Add(new LiteralControl("<hr/>"));

                    }

                }

            }
            else
            {
                Label l = new Label();
                l.Text = found;
                pl.Controls.Add(l);

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