using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;

namespace BusReservation.BasePage
{
    public class BassPage : System.Web.UI.Page
    {
        protected override void InitializeCulture()
        {
            string culture = string.IsNullOrEmpty(ConfigurationManager.AppSettings["language"]) ? "zh-cn" : ConfigurationManager.AppSettings["language"].ToString();
            //Session["Culture"] = culture;
            System.Threading.Thread.CurrentThread.CurrentUICulture = new System.Globalization.CultureInfo(culture);
            System.Threading.Thread.CurrentThread.CurrentCulture = System.Globalization.CultureInfo.CreateSpecificCulture(culture);
        }

        protected override void OnPreLoad(EventArgs e)
        {
            if (Session["BackStageUserInfo"] == null)
            {
                //没有权限访问
                Response.Redirect("Login.aspx");
                Response.End();
            }
            else { 
            
            
            }
        }

    }
}