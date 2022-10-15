using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class index : System.Web.UI.Page
{
    SqlConnection con;
    SqlDataAdapter da;
    DataSet ds;
    string sel;
    protected void Page_Load(object sender, EventArgs e)
    {
        string conn = ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString;
        con = new SqlConnection(conn);
        con.Open();
        if (Session["email"] == null)
        {
            Response.Redirect("login.aspx");
        }
        else
        {
            //txtfullname.Text = Session["fullname"].ToString();
            //txtemail.Text = Session["email"].ToString();
            //txtpass.Text = Session["pwd"].ToString();
            //txtmobile.Text = Session["mob"].ToString();
            //txtDOB.Text = Session["dob"].ToString();    
            if (Session["fullname"].ToString() == "admin")
            {
                sel = "select * from info";
                getData(sel);
            }else{
                 sel = "select * from info where email = '"+Session["email"]+"' ";
                 getData(sel);
            }
         
        }
    }
    protected void logout_btn_Click(object sender, EventArgs e)
    {
        Session.RemoveAll();
        Response.Redirect("login.aspx");
    }

    public void getData(string q)
    {
        
        da = new SqlDataAdapter(q, con);
        ds = new DataSet();
        da.Fill(ds);
        rpt.DataSource = ds;
        rpt.DataBind();

    }
}