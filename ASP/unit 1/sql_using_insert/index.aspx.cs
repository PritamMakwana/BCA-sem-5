using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=D:\pritam\sql_using_insert\App_Data\studentDB.mdf;Integrated Security=True");
        con.Open();
        string mInsert = "INSERT INTO student VALUES (@s_name,@s_mobile,@s_pwd)";
        SqlCommand cmd = new SqlCommand(mInsert,con);
        cmd.Parameters.AddWithValue("@s_name",txtname.Text);
        cmd.Parameters.AddWithValue("@s_mobile", txtmobile.Text);
        cmd.Parameters.AddWithValue("@s_pwd", txtpwd.Text);
        int a = cmd.ExecuteNonQuery();
        if (a > 0)
        {
            Response.Write("Insert Record");
            txtname.Text = "";
            txtmobile.Text = "";
            txtpwd.Text = "";
        }
        else
        {
            Response.Write("Insert Not Record");
        }
    }
}