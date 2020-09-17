using System.Web;
using System.Web.Mvc;

namespace Nhom3_ST4_MuaBanBanGhe
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}