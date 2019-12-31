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
    public partial class dmovies : System.Web.UI.Page
    {

       protected void AddWL(object sender, EventArgs e) {
       //     Response.Redirect("AWL.aspx");
           myDAL objmyDAl = new myDAL();
           Button b = (Button)sender;
           Session["option"] = b.ID.ToString();
           Response.Redirect("AWL.aspx");
        }

        protected void Page_Load(object sender, EventArgs e)
        {

      
            myDAL objmyDAl = new myDAL();
            string found;
            DataSet DT = null;
            found = objmyDAl.dmovies_DAL(ref DT);
            if (found != "No Result Found") {
                int i = 0;
                 for (int j = 0; j < DT.Tables[i].Rows.Count; j++)
                {
                    Label lk;
                    Button lb;
                    lb = new Button();
                    lb.Click += new System.EventHandler(AddWL);

                    for (int k = 1; k < DT.Tables[i].Columns.Count; k++)
                    {

                        lk = new Label();
                        lk.Text = "<h2>"+DT.Tables[i].Columns[k].ToString() + " : "+"</h2>";
                        pl.Controls.Add(lk);

                        lk = new Label();
                        lk.Text = DT.Tables[i].Rows[j][k].ToString();
                        pl.Controls.Add(lk);
                        pl.Controls.Add(new LiteralControl("<br/>"));

                        pl.Controls.Add(new LiteralControl("<br/>"));
                    }
                    pl.Controls.Add(new LiteralControl("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"));//11 spaces

                    if (Session["username"] != null)
                    {
                        if (Session["username"].ToString() != "")
                        {
                            lb.CssClass = "bb2";
                            lb.Text = "Add to Watchlist";
                            lb.ID = DT.Tables[i].Rows[j][1].ToString();

                            pl.Controls.Add(lb);
                        }
                    }
                    pl.Controls.Add(new LiteralControl("<br/>"));

                    pl.Controls.Add(new LiteralControl("<br/>"));
                   
                    pl.Controls.Add(new LiteralControl("<hr />"));
                    }

                }
      


            else
            {
                Label l = new Label();
                l.Text = found;
                pl.Controls.Add(l);

            }

        }
            
           
        
    }
}