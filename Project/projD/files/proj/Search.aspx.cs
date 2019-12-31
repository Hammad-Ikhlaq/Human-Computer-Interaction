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
    public partial class about : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["search"] != null)
            {
                myDAL objmyDAl = new myDAL();
                //String InputName = Name.Text;
                String Input = Session["search"].ToString();
                string found;
                DataSet DT = null;

                String a = Input;
                found = objmyDAl.Search_DAL(Input, ref DT);
                if (found != "No Result Found")
                {
                    bool msc = true, ac = true, ok = false;
                    for (int i = 0; i < DT.Tables.Count; i++)
                    {
                        string id1 = null, id2;
                        if(DT.Tables[i].Rows.Count> 0)
                            id1 = DT.Tables[i].Rows[0][0].ToString();                                          

                 //       GridView SearchResultGrid = new GridView();
                        Label l = new Label();
                        Label lk;
                   //     SearchResultGrid.DataSource = DT.Tables[i];
                     //   SearchResultGrid.DataBind();
                        if (DT.Tables[i].Columns.Count > 0)
                        {
//                            if (DT.Tables[i].Columns[2].ToString() == "rating" && msc)
  //                          {
                            if (DT.Tables[i] != null)
                                {

                                    if (DT.Tables[i].Rows.Count > 0)
                                    {
                                        for (int k = 0; k < DT.Tables[i].Rows.Count; k++)
                                        {

                                                for (int p = 1; p < DT.Tables[i].Columns.Count; p++)
                                                {
                                                    l = new Label();
                                                    l.Text = DT.Tables[i].Columns[p].ToString();
                                                    l.Attributes.Add("style", "font-size:30px; color:Black; font-weight:bold;");
                                                    pl.Controls.Add(l);
                                                    pl.Controls.Add(new LiteralControl("<br/>"));
                                                    pl.Controls.Add(new LiteralControl("<br/>"));
                                     
                                                    lk = new Label();
                                                   lk.Text = DT.Tables[i].Rows[k][p].ToString();
                                                    pl.Controls.Add(lk);
                                                    pl.Controls.Add(new LiteralControl("<br/>"));

                                                    pl.Controls.Add(new LiteralControl("<br/>"));

                                                }
                                                id2 = DT.Tables[i].Rows[k][0].ToString();
                                                if (id1 != id2)
                                                {
                                                    pl.Controls.Add(new LiteralControl("<hr/>"));
                                                    id1 = id2;
                                                }
                    

                                        }

                                        ok = true;
                                    }
                                }
    //                        }
                        }
                  /*      if (DT.Tables[i].Columns.Count > 0)
                        {

//                            if (DT.Tables[i].Columns[1].ToString() == "gender" && ac)
  //                          {
                                if (DT.Tables[i] != null)
                                {
                                    if (DT.Tables[i].Rows.Count > 0)
                                    {

                                        l.Text = "Actors,Directors,Writers,Producers";
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

                    }

                

                                        
                                        ok = true;
                                    }

                                }
                            }
    //                    }*/
                     //   pl.Controls.Add(SearchResultGrid);
              /*          if (ok)
                        {
                            pl.Controls.Add(new LiteralControl("<hr/>"));
                            ok = false;

                        }
                */        Session["search"] = null;
         
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