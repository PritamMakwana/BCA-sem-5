using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnsave_Click(object sender, EventArgs e)
    {
        String em = email.Text;
        String pass = password.Text;
        if (em == "admin@gmail.com" && pass == "admin@123")
        {
            Response.Write("your user email & password is ok");
        }
        else
        {
            Response.Write("enter correct user and password");
        }
    }
}