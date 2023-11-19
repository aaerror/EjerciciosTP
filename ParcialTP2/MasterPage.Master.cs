using System;
using System.IO;

namespace ParcialTP2
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string path = MapPath(".") + "/Users";
            Directory.CreateDirectory(path);

            lblYear.Text = DateTime.Today.Year.ToString();
        }
    }
}