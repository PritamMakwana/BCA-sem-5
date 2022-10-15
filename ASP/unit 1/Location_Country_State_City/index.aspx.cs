using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class index : System.Web.UI.Page
{
    String[] con = { "India", "United States", "China" };


    String[] St_Con1 = { "gujarat", "mp", "up" };
    String[] St_Con2 = { "Alabama", "Alaska", "Arizona" };
    String[] St_Con3 = { "Hubei", "Hunan", "Jiangsu" };


    String[] city_St1_Con1 = { "duv", "rajkot", "Amreli" };
    String[] city_St2_Con1 = { "mp 1", "mp 2", "mp 3" };
    String[] city_St3_Con1 = { "up 1", "up 2", "up 3" };

    String[] city_St1_Con2 = { "Alabama 1", "Alabama 2", "Alabama 3" };
    String[] city_St2_Con2 = { "Alaska 1", "Alaska 2", "Alaska 3" };
    String[] city_St3_Con2 = { "Arizona 1", "Arizona 2", "Arizona 3" };

    String[] city_St1_Con3 = { "Hubei 1", "Hubei 2", "Hubei 3" };
    String[] city_St2_Con3 = { "Hunan 1", "Hunan 2", "Hunan 3" };
    String[] city_St3_Con3 = { "Jiangsu 1", "Jiangsu 2", "Jiangsu 3" };
    protected void Page_Load(object sender, EventArgs e)
    {   
        if (!IsPostBack)
        {
            countryAdd(con);
            stateAdd(St_Con1);
            cityAdd(city_St1_Con1);
        } 
    }

    protected void ddCountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        switch (ddCountry.SelectedIndex)
        {
            case 0:
                stateAdd(St_Con1);
                cityAdd(city_St1_Con1);
                break;
            case 1:
                stateAdd(St_Con2);
                cityAdd(city_St1_Con2);
                break;
            case 2:
                stateAdd(St_Con3);
                cityAdd(city_St1_Con3);
                break;
            default:
                stateAdd(St_Con1);
                break;
        }
    }

    protected void ddState_SelectedIndexChanged(object sender, EventArgs e)
    {
        switch (ddCountry.SelectedIndex)
        {
            case 0:
                switch (ddState.SelectedIndex)
                {
                    case 0:
                        cityAdd(city_St1_Con1);
                        break;
                    case 1:
                        cityAdd(city_St2_Con1);
                        break;
                    case 2:
                        cityAdd(city_St3_Con1);
                        break;
                    default:
                        cityAdd(city_St1_Con1);
                        break;
                }
                break;
            case 1:
                switch (ddState.SelectedIndex)
                {
                    case 0:
                        cityAdd(city_St1_Con2);
                        break;
                    case 1:
                        cityAdd(city_St2_Con2);
                        break;
                    case 2:
                        cityAdd(city_St3_Con2);
                        break;
                    default:
                        cityAdd(city_St1_Con2);
                        break;
                }
                break;
            case 2:
                switch (ddState.SelectedIndex)
                {
                    case 0:
                        cityAdd(city_St1_Con3);
                        break;
                    case 1:
                        cityAdd(city_St2_Con3);
                        break;
                    case 2:
                        cityAdd(city_St3_Con3);
                        break;
                    default:
                        cityAdd(city_St1_Con3);
                        break;
                }
                break;
            default:
                cityAdd(city_St1_Con1);
                break;
        }


    }

    protected void ddCity_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    public void countryAdd(String[] i)
    {
        ddCountry.Items.Clear();
        ddCountry.Items.Add(i[0]);
        ddCountry.Items.Add(i[1]);
        ddCountry.Items.Add(i[2]);
    }
    public void stateAdd(String[] i)
    {
        ddState.Items.Clear();
        ddState.Items.Add(i[0]);
        ddState.Items.Add(i[1]);
        ddState.Items.Add(i[2]);

    }

    public void cityAdd(String[] i)
    {
        ddCity.Items.Clear();
        ddCity.Items.Add(i[0]);
        ddCity.Items.Add(i[1]);
        ddCity.Items.Add(i[2]);

    }
}