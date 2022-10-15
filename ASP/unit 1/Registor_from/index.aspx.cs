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
    protected void btnSave_Click(object sender, EventArgs e)
    {
        String gender = "";
        if (RadioButton1.Checked)
        {
            gender = RadioButton1.Text;
        }
        else gender = RadioButton2.Text;


        var message = "";
        if (CheckBox1.Checked)
        {
            message = CheckBox1.Text + " ";
        }
        if (CheckBox2.Checked)
        {
            message += CheckBox2.Text + " ";
        }
        if (CheckBox3.Checked)
        {
            message += CheckBox3.Text + " ";
        }

        String city;

        if (ddcity.SelectedValue == "")
        {
            city = "Please Select a City";
        }
        else
            city = ddcity.SelectedValue;

        Response.Write("<Table border='2px' ><td>" + Lfname.Text + "</td><td>" + fname.Text + "</td>");
        Response.Write("<tr><td>" + Llastname.Text + "</td><td>" + lastname.Text + "</td>");
        Response.Write("<tr><td>" + Lsname.Text + "</td><td>" + sname.Text + "</td>");
        Response.Write("<tr><td>" + Lage.Text + "</td><td>" + age.Text + "</td>");
        Response.Write("<tr><td>" + Lbod.Text + "</td><td>" + dob.Text + "</td>");
        Response.Write("<tr><td>" + Ladd.Text + "</td><td>" + add.Text + "</td>");
        Response.Write("<tr><td>" + Lemail.Text + "</td><td>" + email.Text + "</td>");
        Response.Write("<tr><td>" + Lgen.Text + "</td><td>" + gender + "</td>");
        Response.Write("<tr><td>" + Lhobby.Text + "</td><td>" + message + "</td>");
        Response.Write("<tr><td>" + Lcity.Text + "</td><td>" + city + "</td></Table>");
    }
}