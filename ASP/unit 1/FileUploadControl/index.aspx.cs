using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        if (fuimg.HasFile)
        {
            String contect = fuimg.PostedFile.ContentType;
            String fsize = fuimg.PostedFile.ContentLength.ToString(); 
            String fname = fuimg.FileName.ToString();
            String filePath = Server.MapPath("~/imgUpload/");
            fuimg.SaveAs(filePath + fname);
            lblshow.Text = "type : " + contect + "<br>  file size : " + fsize + " <br> file name : " + fname;
            String imgurl = filePath + fname;
            imgshow.ImageUrl = imgurl;

        }
        else
        {
            lblshow.Text = "No File Found";
        }
    }
}