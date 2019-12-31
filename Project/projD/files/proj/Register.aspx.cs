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
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void loginAccount_Click(object sender, EventArgs e)
        {

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            
            
        }

        public void SignUp_Click(object sender, EventArgs e)//object sender, EventArgs e
        {

            String InputEmail = Request.Form["Email"];
            String InputPassword = Request.Form["Password"];
            String InputName = Request.Form["Name"];
            String InputAge = Request.Form["Age"];
            String InputGender = Request.Form["Gender"];
            String InputCountry = Request.Form["Country"];
            String InputUsername = Request.Form["Username"];
            int value;
                    
            DataTable DT = new DataTable();
            string found;
            if (InputUsername == "")
            {
                Er.Text = "Please Enter User Name";

            }
            else if (InputName == "")
            {
                Er.Text = "Please Enter Name";

            }
            else if(InputEmail == "")
            {
                Er.Text = "Please Enter email"; 
            
            }
            else if (InputPassword == "")
            {
                Message.Text = "Please Enter Password";

            }     
            else if (InputCountry == "")
            {
                Er.Text = "Please Enter Country";

            }
            else if (InputGender == "")
            {
                Er.Text = "Please Enter Gender";

            }
            else if (InputAge == "")
            {
                Er.Text = "Please Enter Age";

            }
            else if (!(int.TryParse(InputAge, out value)))
            {
                Er.Text = "Please Enter Number for Age";

            }

            else
            {
                Response.Redirect("LoggedIn.aspx");
            }
        }

    }
}