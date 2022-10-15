using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Add_Category : System.Web.UI.Page
{
    SqlConnection conn;
    SqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {
         String webStr = ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString;
       conn = new SqlConnection(webStr);
       conn.Open();
        if (Session["uname"] == null)
        {
            Response.Redirect("login.aspx");
        }
    }
    protected void btn_add_cate_Click(object sender, EventArgs e)
    {
        String ADD_cate = "INSERT INTO food_category VALUES(@cate_name,@items)";
        cmd = new SqlCommand(ADD_cate, conn);
        cmd.Parameters.AddWithValue("@cate_name", txt_cate_name.Text);
        cmd.Parameters.AddWithValue("@items",0);
        int a = cmd.ExecuteNonQuery();
        if (a > 0)
        {
            Response.Redirect("Categories.aspx");
        }
        else
        {
            lbl_mess.Text = "Category is not Add"; 
        }
    }
}