using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class addData : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataAdapter da;
    DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {
        string webstr = ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString;
        con = new SqlConnection(webstr);
        con.Open();
        if (!IsPostBack)
        {
            gridGet();
        }
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        String mInsert = "insert into resData values(@cate,@price)";
        cmd = new SqlCommand(mInsert, con);
        cmd.Parameters.AddWithValue("@cate", txtcategory.Text);
        cmd.Parameters.AddWithValue("@price", txtprice.Text);
        int a = cmd.ExecuteNonQuery();
        if (a > 0)
        {
            Response.Write("Insert Data");
            gridGet();
        }
        else
        {
            Response.Write("Insert Not Data");
        }
    }
    protected void gdvShow_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gdvShow.PageIndex = e.NewPageIndex;
        this.gridGet();
    }
    protected void gdvShow_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gdvShow.EditIndex = e.NewEditIndex;
        this.gridGet();
    }
    protected void gdvShow_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int kid = Convert.ToInt32(gdvShow.DataKeys[e.RowIndex].Values[0]);
        String strdel = "delete from resData where Id = " + kid + "";
        cmd = new SqlCommand(strdel, con);
        int i = cmd.ExecuteNonQuery();
        if (i > 0)
        {
            gridGet();
        }
        else
        {
            Response.Write("record not delete");
        }
    }
    protected void gdvShow_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gdvShow.EditIndex = -1;
        this.gridGet();
    }

    public void gridGet()
    {
        String mSelect = "SELECT * FROM resData";
        da = new SqlDataAdapter(mSelect, con);
        ds = new DataSet();
        da.Fill(ds);
        gdvShow.DataSource = ds;
        gdvShow.DataBind();
    }
    protected void gdvShow_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int uid = Convert.ToInt32(gdvShow.DataKeys[e.RowIndex].Values[0]);
        GridViewRow grd = (GridViewRow)gdvShow.Rows[e.RowIndex];
        TextBox txtname = (TextBox)grd.Cells[1].Controls[0];
        TextBox txtphone = (TextBox)grd.Cells[2].Controls[0];
        String stredit = "UPDATE resData SET category = @cate ,price = @price  where Id = " + uid + "";
        cmd = new SqlCommand(stredit, con);
        cmd.Parameters.Add("@cate", txtname.Text);
        cmd.Parameters.Add("@price", txtphone.Text);
        int i = cmd.ExecuteNonQuery();
        if (i > 0)
        {
            gdvShow.EditIndex = -1;
            gridGet();
        }
        else
        {
            Response.Write("Record not updated");
        }
    }
}