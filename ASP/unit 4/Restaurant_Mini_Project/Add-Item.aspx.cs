using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Add_Item : System.Web.UI.Page
{
    SqlConnection conn;
    SqlCommand cmd;
    SqlCommand cmdup;
    SqlDataAdapter da;
    DataSet ds;
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
            getCategory();
        }
    }
    protected void btn_add_item_Click(object sender, EventArgs e)
    {
        String imgName = txtItem_img.FileName.ToString();
        String imgPath = Server.MapPath("~/uploads/" + imgName);
        txtItem_img.SaveAs(imgPath);
        String SInsert = "INSERT INTO items VALUES(@title,@img,@price,@desc,@category)";
        int cateid = Convert.ToInt16(dd_category.SelectedValue);
        cmd = new SqlCommand(SInsert, conn);
        cmd.Parameters.AddWithValue("@title",txtItem_name.Text);
        cmd.Parameters.AddWithValue("@img", "~/uploads/" + imgName);
        cmd.Parameters.AddWithValue("@price", txtItem_price.Text);
        cmd.Parameters.AddWithValue("@desc", txtItem_desc.Text);
        cmd.Parameters.AddWithValue("@category", cateid);

        String up_food_category = "UPDATE food_category SET items = items + 1 WHERE cate_id ='"+ cateid+"'";
        cmdup = new SqlCommand(up_food_category, conn);
        cmdup.ExecuteNonQuery();
        
        int a = cmd.ExecuteNonQuery();
        if (a > 0)
        {
            Response.Redirect("Menu.aspx");
        }
        else
        {
            lbl_mess.Text = "insert not data";
        } 
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
}