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
    SqlDataAdapter da;
    DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {
        String webstr = ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString;
        con = new SqlConnection(webstr);
        con.Open();

        String id = Request.QueryString["id"];

        da = new SqlDataAdapter("select * from info where Id = '"+id+ "'",con);
        ds = new DataSet();
        da.Fill(ds);

        int i = da.Fill(ds);
        if (i > 0)
        {
            lbl.Text = "Your id  : " + ds.Tables[0].Rows[0][0].ToString()
                        + "<br> Your Username :" + ds.Tables[0].Rows[0][1].ToString();
        }
        else
        {
            lbl.Text = "Your id  is Not user Found "; 
        }
        
    }
}