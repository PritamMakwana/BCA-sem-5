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

    protected void btnsavecity_Click(object sender, EventArgs e)
    {
        if (textbox1.Text != "")
        {
            ddlcity.Items.Add(textbox1.Text);
            textbox1.Text = "";
        }
        else
        {
            lbl.Text= "valid input please";
        }
    }
    protected void btnshowcity_Click(object sender, EventArgs e)
    {
        if (ddlcity.SelectedValue != "0")
        {
              lbl.Text= ddlcity.SelectedItem.Text;
        }
        else
        {
              lbl.Text="Please Select Any Value";
        }
    }
}