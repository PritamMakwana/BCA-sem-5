using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class index : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataAdapter da;
   

    protected void Page_Load(object sender, EventArgs e)
    {
        con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=D:\Practical\ASP\unit 3\add_city_DB\App_Data\City.mdf;Integrated Security=True");
        con.Open();
        if(!IsPostBack){
         getCity();
        }
           
    }
    protected void btn_Click(object sender, EventArgs e)
    {
        if (txtcity.Text == "")
        {
            Response.Write("please record insert ");
        }
        else
        {
            String cInsert = "insert into city_table values (@city)";
            cmd = new SqlCommand(cInsert, con);
            cmd.Parameters.AddWithValue("@city", txtcity.Text);
            int a = cmd.ExecuteNonQuery();
            if (a > 0)
            {
                Response.Write("add city");
                getCity();
                txtcity.Text = "";
            }
            else
            {
                Response.Write("not add city");
            }
        }
    }


    public void getCity()
    {
       String cSelect = "select * from city_table";
       da = new SqlDataAdapter(cSelect, con);
       DataSet ds = new DataSet();
       da.Fill(ds);

       ddcity.DataSource = ds;
       ddcity.DataTextField = "city";
       ddcity.DataValueField = "id";
       ddcity.DataBind();
    }


}