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
    public partial class WebForm8 : System.Web.UI.Page
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

                Label ln = new Label();

                protected void DelP(object sender, EventArgs e)
                {
                    myDAL objmyDAl = new myDAL();
                    Button b = (Button)sender;
                    string pid = b.CommandArgument;
                    String er = objmyDAl.DelP_DAL(pid);
                    if (er == null)
                        pl.Controls.Clear();
                    Response.Redirect("VotePoll.aspx");
                }

        protected void btnClick(object sender, EventArgs e) {
            myDAL objmyDAl = new myDAL();
            Button b = (Button)sender;
            string op = b.CommandName;
            string pid = b.CommandArgument;
            String uname = Session["username"].ToString();
            String uid;
            uid = objmyDAl.getU_DAL(uname);
            String op_id = objmyDAl.opID_DAL(pid,op);
            String er = objmyDAl.Vote_DAL(pid, uid,op_id);
            if (er != "") {
                ln.Text = er;
                
            }
        }
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
                    pl.Controls.Add(ln);
                    pl.Controls.Add(new LiteralControl("<br/>"));

                    pl.Controls.Add(new LiteralControl("<br/>"));
                    myDAL objmyDAl = new myDAL();
                    string found;
                    DataSet DT = null;
                    found = objmyDAl.ShowPoll_DAL(ref DT);
                    if (found != "No Result Found")
                    {
                        int i = 0;
                        Button l;
                        Label lk;
                        string p1, p2;
                        for (int j = 0; j < DT.Tables[i].Rows.Count; j++)
                        {
                            lk = new Label();
                            p1 = DT.Tables[i].Rows[j]["p_id"].ToString();
                            lk.Text = DT.Tables[i].Rows[j]["Poll Name"].ToString();
                            pl.Controls.Add(lk);
                            pl.Controls.Add(new LiteralControl("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"));//11 spaces
                            string id = objmyDAl.getC_DAL(p1);
                            string uid = objmyDAl.getU_DAL("lkl");
                            if (id == uid)
                            {
                                l = new Button();
                                l.CssClass = "bb2";
                                l.Text = "Delete Poll";
                                l.CommandArgument = p1;

                                //l.Attributes.Add("OnClientClick", "btnClick");
                                l.Click += new System.EventHandler(DelP);
                                pl.Controls.Add(l);
                            }
                            pl.Controls.Add(new LiteralControl("<br/>"));

                            pl.Controls.Add(new LiteralControl("<br/>"));
                            int m = 0;

                            for (int k = 0; k < DT.Tables[i + 1].Rows.Count; k++)
                            {

                                p2 = DT.Tables[i + 1].Rows[k]["p_id"].ToString();
                                if (p1 == p2)
                                {
                                    lk = new Label();
                                    lk.Text = "Option No" + (m + 1).ToString() + " : ";
                                    pl.Controls.Add(lk);

                                    m++;
                                    l = new Button();
                                    l.CssClass = "bb2";
                                    l.Text = DT.Tables[i + 1].Rows[k]["option"].ToString();
                                    l.CommandArgument = p1;
                                    l.CommandName = l.Text;
                                    l.Click += new System.EventHandler(btnClick);
                                    pl.Controls.Add(l);
                                    pl.Controls.Add(new LiteralControl("<br/>"));

                                    pl.Controls.Add(new LiteralControl("<br/>"));
                                }
                            }
                            pl.Controls.Add(new LiteralControl("<hr/>"));

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
    }
}