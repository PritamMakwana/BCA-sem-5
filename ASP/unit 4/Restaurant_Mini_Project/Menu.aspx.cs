using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Menu : System.Web.UI.Page
{
    SqlConnection conn;
    SqlDataAdapter da;
    DataSet ds;
    SqlCommand cmd;
    SqlCommand cmdup;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["uname"] == null)
        {
            Response.Redirect("login.aspx");
        }
        String webStr = ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString;
        conn = new SqlConnection(webStr);
        conn.Open();
        if (Session["uname"] == null)
        {
            Response.Redirect("login.aspx");
        }
        if (!IsPostBack)
        {
            getCategory();
           Items_GridView();
        }
    }
    public void Items_GridView()
    {
        String All_Select = "Select * from items ";
        showItems(All_Select);
    }


    protected void add_Items_Click(object sender, EventArgs e)
    {
        Response.Redirect("Add-Item.aspx");
    }
    protected void btn_all_show_Click(object sender, EventArgs e)
    {
        Items_GridView();
    }
    protected void gdv_itemshow_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gdv_itemshow.PageIndex = e.NewPageIndex;
        this.Items_GridView();
    }
    protected void gdv_itemshow_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gdv_itemshow.EditIndex = -1;
        this.Items_GridView();
    }
    protected void gdv_itemshow_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int kid = Convert.ToInt32(gdv_itemshow.DataKeys[e.RowIndex].Values[0]);

        string Selectcate = "select * from items where item_id = '" + kid + "' ";
        da = new SqlDataAdapter(Selectcate, conn);
        DataSet ds = new DataSet();
        da.Fill(ds);
        int cateid = Convert.ToInt32(ds.Tables[0].Rows[0][5].ToString());

        String up_food_category = "UPDATE food_category SET items = items - 1 WHERE cate_id ='" + cateid + "'";
        cmdup = new SqlCommand(up_food_category, conn);
        cmdup.ExecuteNonQuery();

        
        String strdel = "delete from items where item_id = " + kid + "";
        cmd = new SqlCommand(strdel, conn);
        int i = cmd.ExecuteNonQuery();
        if (i > 0)
        {
            Items_GridView();
        }
        else
        {
            Response.Write("record not delete");
        }
    }
    protected void gdv_itemshow_RowEditing(object sender, GridViewEditEventArgs e)
    {
        //int id = Convert.ToInt32(gdv_itemshow.DataKeys[e.NewEditIndex].Values[0]);
        //Response.Redirect("Update-Item.aspx?id=" + id);
        gdv_itemshow.EditIndex = e.NewEditIndex;
        this.Items_GridView();
    }
    protected void dd_category_SelectedIndexChanged(object sender, EventArgs e)
    {
        int cateid = Convert.ToInt16(dd_category.SelectedValue);

        String mcate_wise_Select = "Select * from items where food_category = '" + cateid + "' ";
        showItems(mcate_wise_Select);
    }

    public void showItems(String query)
    {
        da = new SqlDataAdapter(query, conn);
        ds = new DataSet();
        da.Fill(ds);
        gdv_itemshow.DataSource = ds;
        gdv_itemshow.DataBind();
    }
    public void getCategory()
    {
        String cSelect = "select * from food_category";
        da = new SqlDataAdapter(cSelect, conn);
        DataSet ds = new DataSet();
        da.Fill(ds);
        dd_category.DataSource = ds;
        dd_category.DataTextField = "cate_name";
        dd_category.DataValueField = "cate_id";
        dd_category.DataBind();
    }

    protected void gdv_itemshow_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int uid = Convert.ToInt32(gdv_itemshow.DataKeys[e.RowIndex].Values[0]);

        GridViewRow grd = (GridViewRow)gdv_itemshow.Rows[e.RowIndex];

        TextBox name = (TextBox)grd.Cells[2].Controls[0];
        TextBox price = (TextBox)grd.Cells[3].Controls[0];
        TextBox desc = (TextBox)grd.Cells[4].Controls[0];

        string update_item = "UPDATE items SET item_title = @title ,item_price = @price ,item_desc= @desc where item_id = " + uid;
        cmd = new SqlCommand(update_item, conn);
        cmd.Parameters.AddWithValue("@title", name.Text);
        cmd.Parameters.AddWithValue("@price", price.Text);
        cmd.Parameters.AddWithValue("@desc", desc.Text);

        int a = cmd.ExecuteNonQuery();
        if (a > 0)
        {
            gdv_itemshow.EditIndex = -1;
            getCategory();
            Items_GridView();
        }
        else
        {
            Response.Write("not update becuase server side problem");
        } 
    }
}