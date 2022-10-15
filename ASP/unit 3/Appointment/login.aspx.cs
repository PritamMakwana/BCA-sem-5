using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class login : System.Web.UI.Page

{
    SqlConnection con;
    SqlDataAdapter da;
    DataSet ds;
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

    protected void login_btn_Click(object sender, EventArgs e)
    {
        String mSelect = "SELECT * FROM info where  email = '" +txtemail.Text+"' and pwd = '" +txtpass.Text+"'";
        da = new SqlDataAdapter(mSelect, con);
        ds = new DataSet();
        da.Fill(ds);
        int a = da.Fill(ds);
        if (a > 0 )
        {
            Session["fullname"] = ds.Tables[0].Rows[0][1].ToString();
            Session["email"] = ds.Tables[0].Rows[0][2].ToString();
            Session["pwd"] = ds.Tables[0].Rows[0][3].ToString();
            Session["mob"] = ds.Tables[0].Rows[0][4].ToString();
            Session["dob"] = ds.Tables[0].Rows[0][5].ToString();

            Response.Redirect("index.aspx");
        }
        else
        {
            Response.Write("Email or Password is wrong ! " );
        }

    }
    protected void create_btn_Click(object sender, EventArgs e)
    {
        Response.Redirect("input.aspx");
    }
}