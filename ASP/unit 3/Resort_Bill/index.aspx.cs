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
            GetCate();
            DataShow();
        }
    }



    protected void btnTotal_Click(object sender, EventArgs e)
    {

        String mInsert = "insert into resSave values(@name,@phone,@dob,@cate,@per,@tot)";
        cmd = new SqlCommand(mInsert, con);
        cmd.Parameters.Add("@name", txtname.Text);
        cmd.Parameters.Add("@phone", txtcusnub.Text);
        cmd.Parameters.Add("@dob", txtdob.Text);
        cmd.Parameters.Add("@cate", ddcategory.SelectedItem.ToString());
        cmd.Parameters.Add("@per", txtprice.Text);
        cmd.Parameters.Add("@tot", txttot.Text);
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

    public void GetCate()
    {
       
        string ssql = "select * from resData";
        da = new SqlDataAdapter(ssql, con);
        ds = new DataSet();
        da.Fill(ds);

        ddcategory.DataSource = ds;
        ddcategory.DataTextField = "category";
        ddcategory.DataValueField = "Id";
        ddcategory.DataBind();

        txtprice.Text = ds.Tables[0].Rows[0][2].ToString();
      

    }
    public void DataShow()
    {
        string ssql = "select * from resData where Id = " + ddcategory.SelectedValue + "";
        da = new SqlDataAdapter(ssql, con);
        ds = new DataSet();
        da.Fill(ds);

        txtprice.Text = ds.Tables[0].Rows[0][2].ToString();

        int tot = Convert.ToInt32(txtprice.Text) * Convert.ToInt32(txtcusqty.Text);
        txttot.Text = tot.ToString();
    }
    public void gridGet()
    {
        String mSelect = "SELECT * FROM resSave";
        da = new SqlDataAdapter(mSelect, con);
        ds = new DataSet();
        da.Fill(ds);
        gdvShow.DataSource = ds;
        gdvShow.DataBind();
    }
    protected void ddcategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataShow(); 
    }
    protected void txtprice_TextChanged(object sender, EventArgs e)
    {      
          
    }
    protected void txtcusqty_TextChanged(object sender, EventArgs e)
    {
        DataShow(); 

    }
    protected void txttot_TextChanged(object sender, EventArgs e)
    {

    }
    protected void gdvShow_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gdvShow.PageIndex = e.NewPageIndex;
        this.gridGet();
    }
    protected void gdvShow_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int kid = Convert.ToInt32(gdvShow.DataKeys[e.RowIndex].Values[0]);
        String strdel = "delete from resSave where Id = " + kid + "";
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

    protected void gdvShow_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gdvShow.EditIndex = e.NewEditIndex;
        this.gridGet();
    }
    protected void gdvShow_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gdvShow.EditIndex = -1;
        this.gridGet();
    }
    protected void gdvShow_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

        int uid = Convert.ToInt32(gdvShow.DataKeys[e.RowIndex].Values[0]);
        GridViewRow grd = (GridViewRow)gdvShow.Rows[e.RowIndex];
        TextBox txtname = (TextBox)grd.Cells[1].Controls[0];
        TextBox txtphone = (TextBox)grd.Cells[2].Controls[0];
        TextBox txtdob = (TextBox)grd.Cells[3].Controls[0];
        TextBox txtper = (TextBox)grd.Cells[5].Controls[0];
        TextBox txttot = (TextBox)grd.Cells[6].Controls[0];
       
        String stredit = "UPDATE resSave SET unname = @name ,mobile = @phone ,dob = @dob,persons = @per,total =@tot  where Id = " + uid + "";
        cmd = new SqlCommand(stredit, con);
        cmd.Parameters.Add("@name", txtname.Text);
        cmd.Parameters.Add("@phone", txtphone.Text);
        cmd.Parameters.Add("@dob", txtdob.Text);
        cmd.Parameters.Add("@per", txtper.Text);
        cmd.Parameters.Add("@tot", txttot.Text);
        int i = cmd.ExecuteNonQuery();
        if (i > 0)
        {
            gdvShow.EditIndex = -1;
            gridGet();
            Response.Write("Record updated");
        }
        else
        {
            Response.Write("Record not updated");
        }
    }
}