using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class input : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {
        String wbstr = ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString;
        con = new SqlConnection(wbstr);
        con.Open();
        if (Session["email"] != null)
        {
            Response.Redirect("index.aspx");
        }
    }
    protected void create_btn_Click(object sender, EventArgs e)
    {
        String mInsert = "insert into info values(@fullname,@email,@pwd,@mob,@dob)";
        cmd = new SqlCommand(mInsert, con);
        cmd.Parameters.AddWithValue("@fullname", txtfullname.Text);
        cmd.Parameters.AddWithValue("@email", txtemail.Text);
        cmd.Parameters.AddWithValue("@pwd", txtpass.Text);
        cmd.Parameters.AddWithValue("@mob", txtmobile.Text);
        cmd.Parameters.AddWithValue("@dob", txtDOB.Text);
        int a = cmd.ExecuteNonQuery();
        if (a > 0)
        {
            Response.Write("Insert Data");
        }
        else
        {
            Response.Write("Insert Not Data");
        }
    }
    protected void log_in_Click(object sender, EventArgs e)
    {
        Response.Redirect("login.aspx");
    }
}