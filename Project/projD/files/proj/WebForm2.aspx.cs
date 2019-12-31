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
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["username"] == null){
            }
            else
            {
                Response.Redirect("WebForm3.aspx");
            }
            if (Session["username"] != null)
            {
                if (Session["username"].ToString() != "")
                { }
                else
                {
                    Response.Redirect("WebForm3.aspx");
                }
            }
            
            
        }

        protected void SignUp_Click(object sender, EventArgs e)
        {
            myDAL objmyDAl = new myDAL();
            //String InputName = Name.Text;
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
                Message.Text = "Please Enter User Name";

            }
            else if (InputName == "")
            {
                Message.Text = "Please Enter Name";

            }
            else if(InputEmail == "")
            {
                Message.Text = "Please Enter email"; 
            
            }
            else if (InputPassword == "")
            {
                Message.Text = "Please Enter Password";

            }     
            else if (InputCountry == "")
            {
                Message.Text = "Please Enter Country";

            }
            else if (InputGender == "")
            {
                Message.Text = "Please Enter Gender";

            }
            else if (InputAge == "")
            {
                Message.Text = "Please Enter Age";

            }
            else if (!(int.TryParse(InputAge, out value)))
            {
                Message.Text = "Please Enter Number for Age";

            }

            else
            {
                found = objmyDAl.SignUp_DAL(InputEmail, InputPassword, InputName, InputUsername, InputGender, InputCountry, InputAge);
                if (found != "Please enter a valid Email" && found != "Email Id is Already Present" && found != "Length Of Password Should Be Less Than 15" && found != " Gender Should Be Either M or F" && found != " User Name is Already Present" && found != "Age Should Be Greater Than 13")
                {
                    Message.Text = found + ". Move to Homepage to Login";
                }
                else
                {
                    Message.Text = "Error is " + found;

                }
            }
        }

    }
}