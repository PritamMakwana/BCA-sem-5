﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["uname"] == null)
        {
            Response.Redirect("login.aspx");
        }
    }
    protected void btn_logout_Click(object sender, EventArgs e)
    {
        Session.RemoveAll();
        Response.Redirect("login.aspx");
    }
}
