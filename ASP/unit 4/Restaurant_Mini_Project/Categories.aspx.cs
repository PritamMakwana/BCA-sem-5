using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Categories : System.Web.UI.Page
{
    SqlConnection conn;
    SqlDataAdapter da;
    DataSet ds;
    SqlCommand cmd;
    SqlCommand cmditem;

    protected void Page_Load(object sender, EventArgs e)
    {

        String webStr = ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString;
        conn = new SqlConnection(webStr);
        conn.Open();
        if (Session["uname"] == null)
        {
            Response.Redirect("login.aspx");
        }
        if (!IsPostBack)
        {
            Category_GridView();
        }
    }
    protected void add_category_Click(object sender, EventArgs e)
    {
        Response.Redirect("Add-Category.aspx");
    }
    protected void gdv_categoryShow_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gdv_categoryShow.PageIndex = e.NewPageIndex;
        this.Category_GridView();
    }
    protected void gdv_categoryShow_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gdv_categoryShow.EditIndex = -1;
        this.Category_GridView();
    }
 
    protected void gdv_categoryShow_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gdv_categoryShow.EditIndex = e.NewEditIndex;
        this.Category_GridView();
    }
    protected void gdv_categoryShow_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int uid = Convert.ToInt32(gdv_categoryShow.DataKeys[e.RowIndex].Values[0]);
        GridViewRow grd = (GridViewRow)gdv_categoryShow.Rows[e.RowIndex];
        TextBox txt_Category = (TextBox)grd.Cells[1].Controls[0];
        String stredit = "UPDATE food_category SET cate_name = @cate  where cate_id = " + uid + "";
        cmd = new SqlCommand(stredit, conn);
        cmd.Parameters.Add("@cate", txt_Category.Text);
        int i = cmd.ExecuteNonQuery();
        if (i > 0)
        {
            gdv_categoryShow.EditIndex = -1;
            Category_GridView();
        }
        else
        {
            Response.Write("<script>alert('record is not update');<script>");
        }
    }
    protected void gdv_categoryShow_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int kid = Convert.ToInt32(gdv_categoryShow.DataKeys[e.RowIndex].Values[0]);

        String itemsDelete = "delete from items where food_category = " + kid + "";
        cmditem = new SqlCommand(itemsDelete, conn);
        cmditem.ExecuteNonQuery();


        String strdel = "delete from food_category where cate_id = " + kid + "";
        cmd = new SqlCommand(strdel, conn);
        int i = cmd.ExecuteNonQuery();
        if (i > 0)
        {
            Category_GridView();
        }
        else
        {
            Response.Write("<script>alert('record not delete');<script>");
        }

    }
     public void Category_GridView(){
         string category_select = "Select * FROM food_category";
         da = new SqlDataAdapter(category_select, conn);
         ds = new DataSet();
         da.Fill(ds);
         gdv_categoryShow.DataSource = ds;
         gdv_categoryShow.DataBind();
     }
}