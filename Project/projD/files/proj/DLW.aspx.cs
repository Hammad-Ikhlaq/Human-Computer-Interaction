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
    public partial class DLW : System.Web.UI.Page
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

                    myDAL objmyDAl = new myDAL();
                    string found;
                    DataSet DT = null;
                    String username = Session["username"].ToString();
                    found = objmyDAl.ShowList_DAL(username, ref DT);
                    if (found != " ")
                    {
                        int i = 0;
                        Button l;
                        Label lk;
                        string p1, p2;
                        for (int j = 0; j < DT.Tables[i].Rows.Count; j++)
                        {
                            lk = new Label();
                            p1 = DT.Tables[i].Rows[j]["List Name"].ToString();
                            lk.Text = DT.Tables[i].Rows[j]["List Name"].ToString();
                            pl1.Controls.Add(lk);
                            pl1.Controls.Add(new LiteralControl("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"));//11 spaces
                            l = new Button();
                            l.CssClass = "bb2";
                            l.Text = "Delete List";
                            l.ID = p1;

                            l.Click += new System.EventHandler(DelWL);
                            pl1.Controls.Add(l);

                            pl1.Controls.Add(new LiteralControl("<br/>"));

                            pl1.Controls.Add(new LiteralControl("<br/>"));

                        }

                    }
                    else
                    {
                        Label l = new Label();
                        l.Text = found;
                        pl1.Controls.Add(l);

                    }
                }
            }

        }
        protected void DelWL(object sender, EventArgs e)
        {
            myDAL objmyDAl = new myDAL();
            Button b = (Button)sender;
            string lname = b.ID;
            String username = Session["username"].ToString();
            String er = objmyDAl.DelWL_DAL(lname,username);
            if (er == null)
                pl1.Controls.Clear();
            Response.Redirect("DLW.aspx");
        }
        protected void ShowWL(object sender, EventArgs e)
        {
            Response.Redirect("WatchList.aspx");
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
        
    }
}