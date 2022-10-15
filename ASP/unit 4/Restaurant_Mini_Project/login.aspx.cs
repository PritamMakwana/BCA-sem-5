using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class login : System.Web.UI.Page
{
    SqlConnection conn;
    SqlDataAdapter da;
    DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {
    
       String webStr = ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString;
       conn = new SqlConnection(webStr);
       conn.Open();
       if (Session["uname"] != null)
       {
           Response.Redirect("Menu.aspx");
       }
    }
    protected void btn_login_Click(object sender, EventArgs e)
    {
        String mSelect = "select * from login where uname = '" + txtnm.Text + "' AND pwd = '" + txtpwd.Text+ "' ";
        da = new SqlDataAdapter(mSelect, conn);
        ds = new DataSet();
        da.Fill(ds);

        if (ds.Tables[0].Rows.Count > 0)
        {
            Session["uname"] = txtnm.Text;
            Response.Redirect("Menu.aspx"); 
        }
        else
        {
            lbl_err_msg.Text = "Invalid Username or Password";
        }
    }
}