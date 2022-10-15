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
    DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {
        con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename='D:\Practical\ASP\unit 3\grid_view_demo\App_Data\Database.mdf';Integrated Security=True");
        con.Open();
        if (!IsPostBack)
        {
            gridGet();
        }
    }
    protected void btn_Click(object sender, EventArgs e)
    {
        String imgName = fuimg.FileName.ToString();
        String imgPath = Server.MapPath("~/uploads/" + imgName);
        fuimg.SaveAs(imgPath);
        String mInsert = "insert into student values(@name,@phone,@pwd,@img)";
        cmd = new SqlCommand(mInsert, con);
        cmd.Parameters.AddWithValue("@name", name.Text);
        cmd.Parameters.AddWithValue("@phone", phone.Text);
        cmd.Parameters.AddWithValue("@pwd", pwd.Text);
        cmd.Parameters.AddWithValue("@img", "~/uploads/" + imgName);
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

    public void gridGet()
    {
        String mSelect = "SELECT * FROM student";
        da = new SqlDataAdapter(mSelect, con);
        ds = new DataSet();
        da.Fill(ds);
        gdvShow.DataSource = ds;
        gdvShow.DataBind();
    }



    protected void gdvShow_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gdvShow.PageIndex = e.NewPageIndex;
        this.gridGet();
    }
    protected void gdvShow_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int kid = Convert.ToInt32(gdvShow.DataKeys[e.RowIndex].Values[0]);
        String strdel = "delete from student where Id = " + kid + "";
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
        GridViewRow grd = (GridViewRow) gdvShow.Rows[e.RowIndex];
        TextBox txtname = (TextBox) grd.Cells[1].Controls[0];
        TextBox txtphone = (TextBox) grd.Cells[2].Controls[0];
        TextBox txtpwd = (TextBox) grd.Cells[3].Controls[0];
        String stredit = "UPDATE student SET name = @name ,phone = @phone ,pwd = @pwd  where Id = " + uid +"";
        cmd = new SqlCommand(stredit, con);
        cmd.Parameters.Add("@name", txtname.Text);
        cmd.Parameters.Add("@phone", txtphone.Text);
        cmd.Parameters.Add("@pwd", txtpwd.Text);
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