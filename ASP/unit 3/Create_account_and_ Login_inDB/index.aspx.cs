using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class index : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;

    protected void Page_Load(object sender, EventArgs e)
    {
        string webstr = ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString;
        con = new SqlConnection(webstr);
        con.Open();
    }
    protected void link_page_Click(object sender, EventArgs e)
    {
        Response.Redirect("login.aspx");
    }
 
    protected void btn_submit_Click1(object sender, EventArgs e)
    {
        String imgName = fuimg.FileName.ToString();
        String imgPath = Server.MapPath("~/uploads/" + imgName);
        fuimg.SaveAs(imgPath);
        String SInsert = "INSERT INTO info VALUES(@fname,@lname,@uname,@pwd,@mobile,@dob,@img)";
        cmd = new SqlCommand(SInsert, con);
        cmd.Parameters.AddWithValue("@fname",txtFname.Text);
        cmd.Parameters.AddWithValue("@lname", txtLname.Text);
        cmd.Parameters.AddWithValue("@uname", txtUname.Text);
        cmd.Parameters.AddWithValue("@pwd", txtpwd.Text);
        cmd.Parameters.AddWithValue("@mobile", txtmoblie.Text);
        cmd.Parameters.AddWithValue("@dob", txtdob.Text);
        cmd.Parameters.AddWithValue("@img", "~/uploads/" + imgName);
        int a = cmd.ExecuteNonQuery();
        if (a > 0)
        {
            Response.Write("insert data");
        }
        else
        {
            Response.Write("insert not data");
        } 
        
    }
}