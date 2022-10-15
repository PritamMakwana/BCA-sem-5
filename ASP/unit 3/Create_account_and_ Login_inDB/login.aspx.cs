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
    SqlCommand cmd;
    SqlDataAdapter da;
    DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {
        string webstr = ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString;
        con = new SqlConnection(webstr);
        con.Open();
    }
    protected void link_page_Click(object sender, EventArgs e)
    {
        Response.Redirect("index.aspx");
    }
    protected void btn_submit_Click(object sender, EventArgs e)
    {
        String mSelect = "Select * from info where uname =  '" + txtUname.Text + "' AND pwd = '" + txtpwd.Text + "'  ";
        da = new SqlDataAdapter(mSelect, con);
        ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
       {
            gridView();
       }
        else
       {
            Response.Write("Invalid Username or Password");
       }
    }

    protected void gdvstu_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gdvstu.PageIndex = e.NewPageIndex;
        this.gridView();
    }

    public void gridView()
    {
        String mSelect = "Select * from info ";
        da = new SqlDataAdapter(mSelect, con);
        ds = new DataSet();
        da.Fill(ds);
        gdvstu.DataSource = ds;
        gdvstu.DataBind();
    }
    protected void gdvstu_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int kid = Convert.ToInt32(gdvstu.DataKeys[e.RowIndex].Values[0]);
        String strdel = "delete from info where Id = " + kid + "";
        cmd = new SqlCommand(strdel, con);
        int i = cmd.ExecuteNonQuery();
        if (i > 0)
        {
            gridView();
        }
        else
        {
            Response.Write("record not delete");
        }
    }
    protected void gdvstu_RowEditing(object sender, GridViewEditEventArgs e)
    {

        gdvstu.EditIndex = e.NewEditIndex;
        this.gridView();
    }
    protected void gdvstu_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {

        gdvstu.EditIndex = -1;
        this.gridView();
    }
    protected void gdvstu_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int id = Convert.ToInt32(gdvstu.DataKeys[e.RowIndex].Values[0]);
        Response.Write(id);
        GridViewRow grd = (GridViewRow)gdvstu.Rows[e.RowIndex];
        TextBox txtfname = (TextBox)grd.Cells[1].Controls[0];
        TextBox txtlname = (TextBox)grd.Cells[2].Controls[0];
        TextBox txtuname = (TextBox)grd.Cells[3].Controls[0];
        TextBox txtpwd = (TextBox)grd.Cells[4].Controls[0];
        TextBox txtphone = (TextBox)grd.Cells[5].Controls[0];
       
        String stredit = "UPDATE info SET fname = @fname,lname = @lname,uname = @uname ,pwd = @pwd ,mobile = @mobile  where Id = " + id + "";
        cmd = new SqlCommand(stredit, con);
        cmd.Parameters.AddWithValue("@fname", txtfname.Text);
        cmd.Parameters.AddWithValue("@lname", txtlname.Text);
        cmd.Parameters.AddWithValue("@uname", txtuname.Text);
        cmd.Parameters.AddWithValue("@pwd", txtpwd.Text);
        cmd.Parameters.AddWithValue("@mobile", txtphone.Text);
        int i = cmd.ExecuteNonQuery();
        if (i > 0)
        {
            gdvstu.EditIndex = -1;
            gridView();
        }
        else
        {
            Response.Write("Record not updated");
        }
    }
}