using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class userprofile : System.Web.UI.Page
{
    SqlConnection con;
    SqlDataAdapter da;
    DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {
        string conn = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        con = new SqlConnection(conn);
        con.Open();
        getdata();
    }
    public void getdata()
    {
        //string x=Request.QueryString["id"];
        //string sel = "select * from userinfo where id='"+x+"'";
        string sel = "select * from userinfo";
        da = new SqlDataAdapter(sel, con);
        ds = new DataSet();
        da.Fill(ds);
        rpt_show.DataSource = ds;
        rpt_show.DataBind();
    }
 
}