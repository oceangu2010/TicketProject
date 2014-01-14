using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Configuration;

namespace Ufinity.ArtBankCMSServer.WebUI
{

    public class languageResource : Page
    {

        //资源文件类名
        public static readonly string languageClassName = "language";

        /// <summary>
        /// 返回资源标签对应的国际化名称
        /// </summary>
        /// <param name="resourceName">标签名称</param>
        /// <returns></returns>
        public static string GetResourceName(string resourceName)
        {
            return (string)HttpContext.GetGlobalResourceObject(languageClassName, resourceName);
        }

        /// <summary>
        /// 返回处理页里的标签的名称
        /// </summary>
        /// <param name="resourceName">标签名称</param>
        /// <returns></returns>
        public static string GetHandlerResourceName(string resourceName)
        {
            string culture = string.IsNullOrEmpty(ConfigurationManager.AppSettings["language"]) ? "zh-cn" : ConfigurationManager.AppSettings["language"].ToString();
            return (string)HttpContext.GetGlobalResourceObject(languageClassName, resourceName, new System.Globalization.CultureInfo(culture));
        }
    }

}
