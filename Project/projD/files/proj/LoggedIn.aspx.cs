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
using System.Net;
using System.Net.Mail;
using System.IO;

namespace proj
{
    public partial class LoggedIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("INDEX.aspx");
            }
            else
            {
                if (Session["username"].ToString()==""){
                    Response.Redirect("INDEX.aspx");

                }
                else
                {
                }
            }
        }
        protected void nletter_click(object sender, EventArgs e)
        {

            String InputEmail = Request.Form["emailn"];
            if (InputEmail == "")
            {
                Message1.Text = "Enter Email";
                Message1.CssClass = "newc";
            } 
                else{
                    using (MailMessage mm = new MailMessage(ConfigurationManager.AppSettings["SMTPuser"], InputEmail))
            {
                mm.Subject = "Newsletter";
                mm.IsBodyHtml = true;
                mm.Body = EmailTemplate();
                SmtpClient client = new SmtpClient();
                SmtpClient c = new SmtpClient();
                c.Host = ConfigurationManager.AppSettings["Host"];
                c.EnableSsl = Convert.ToBoolean(ConfigurationManager.AppSettings["EnableSSL"]);
                NetworkCredential nc = new NetworkCredential(ConfigurationManager.AppSettings["SMTPuser"], ConfigurationManager.AppSettings["SMTPpassword"]);
                c.UseDefaultCredentials = true;
                c.Credentials = nc;
                c.Port = int.Parse(ConfigurationManager.AppSettings["Port"]);
                c.Send(mm);
            }
            }

        }
        public string EmailTemplate()
        {
            string body = "";

            myDAL objmyDAl = new myDAL();
            string found;
            DataSet DT = null;
            found = objmyDAl.ShowNews_DAL(ref DT);
            if (found != "No Result Found")
            {
                Label lk;
                lk = new Label();
                lk.Attributes.Add("style", "font-size:50px; color:Black; font-weight:bold;");
                lk.Text = "NEWSLETTER";
                body += "<h1> " + lk.Text.ToString() + "</h1>";
                body += "<br/>";
                body += "<br/>";
                body += "<br/>";
                body += "<br/>";

                int i = 0;
                string p1, p2;
                for (int j = 0; j < DT.Tables.Count; j++)
                {
                    lk = new Label();
                    lk.Attributes.Add("style", "font-size:30px; color:Black; font-weight:bold;");

                    if (DT.Tables[j].Columns[0].ToString() == "Movie_Name")
                        lk.Text = "Movies:";
                    if (DT.Tables[j].Columns[0].ToString() == "Actor_Name")
                        lk.Text = "Actors:";
                    if (DT.Tables[j].Columns[0].ToString() == "Director_Name")
                        lk.Text = "Directors:";
                    if (DT.Tables[j].Columns[0].ToString() == "Writer_Name")
                        lk.Text = "Writers:";
                    if (DT.Tables[j].Columns[0].ToString() == "Production_Name")
                        lk.Text = "Producers:";
                    if (DT.Tables[j].Columns[0].ToString() == "Show_Name")
                        lk.Text = "Shows:";
                    //pl.Controls.Add(lk);
                    //pl.Controls.Add(new LiteralControl("<br/>"));
                    body += "<h2> " + lk.Text.ToString() + "</h2>";
                    body += "<br/>";
                    body += "<br/>";
                    //pl.Controls.Add(new LiteralControl("<br/>"));

                    for (int k = 0; k < DT.Tables[j].Rows.Count; k++)
                    {

                        for (int p = 0; p < DT.Tables[j].Columns.Count; p++)
                        {
                            lk = new Label();
                            lk.Text = DT.Tables[j].Rows[k][p].ToString();
                            // pl.Controls.Add(lk);
                            // pl.Controls.Add(new LiteralControl("<br/>"));

                            //pl.Controls.Add(new LiteralControl("<br/>"));
                            body += lk.Text.ToString();
                            body += "<br/>";
                            body += "<br/>";

                        }
                        //         pl.Controls.Add(new LiteralControl("<hr/>"));
                        body += "<hr/>";

                    }
                }

            }
            else
            {
                Label l = new Label();
                l.Text = found;
                //  pl.Controls.Add(l);
                body += found;
            }
            return body;
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
                    Message1.Text = "Error is " + found;

                }
            
        }
        //END HERE

        protected void Search_click(object sender, EventArgs e)
        {
            String Input = Request.Form["ser"];

            if (Input == null || Input == "")
            {
                Label l = new Label();
                l.Text = "Please Provide Input";

                pl.Controls.Add(l);

            }
            else
            {
                Session["search"] = Request.Form["ser"];
                Response.Redirect("Search.aspx");
            }
        }
    }
}