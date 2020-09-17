using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Nhom3_ST4_MuaBanBanGhe.Models;

namespace Nhom3_ST4_MuaBanBanGhe.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Home/
        QLBanGheDataContext db = new QLBanGheDataContext();
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult HomePage()
        {
            return View();
        }
        public ActionResult hienthiTinTuc()
        {
            TinTuc[] tt = db.TinTucs.ToArray();
            tt = tt.OrderByDescending(t => t.Ngay).ToArray();
            return PartialView(tt);
        }
        public ActionResult hienthiSanPham( string ma)
        {
            List<SanPham> lst = new List<SanPham>();
            if (ma != null)
                foreach (var item in db.SanPhams.ToList())
                {
                    if (item.idLoai.Equals(ma))
                        lst.Add(item);
                }
            else
                lst = db.SanPhams.ToList();
            
            
            return View(lst);
        }
        public ActionResult hienthiSPTheoGia(string ma)
        {
            List<SanPham> lst = db.SanPhams.ToList();
            if (ma == "1") 
                lst = lst.Where(t => float.Parse(t.Gia.ToString()) < 200000).ToList();
            else if(ma == "2")
                lst = lst.Where(t => float.Parse(t.Gia.ToString()) >= 200000 && float.Parse(t.Gia.ToString()) < 500000).ToList();
            else if(ma == "3")
                lst = lst.Where(t => float.Parse(t.Gia.ToString()) >= 500000 && float.Parse(t.Gia.ToString()) < 1000000).ToList();
            else
                lst = lst.Where(t => float.Parse(t.Gia.ToString()) > 1000000).ToList();
            return View(lst);
        }
        
        public ActionResult hienThiNhom()
        {
            List<NhomSP> lst = db.NhomSPs.ToList();
            return PartialView(lst);
        }
        [HttpGet]
        public ActionResult hienThiLoai(string ma)
        {
            int m = int.Parse(ma);
            List<Loai> lst = new List<Loai>();
            foreach (Loai item in db.Loais.ToList())
            {
                if (item.idNhom == ma)
                    lst.Add(item);
            }            
            return PartialView(lst);
        }
        public ActionResult hienthiSPMoiNhat()
        {
            SanPham[] array = db.SanPhams.ToArray();
            array = array.OrderByDescending(t => t.NgayNhap).ToArray();
            return PartialView(array); 
        }
        public float tinhKhuyehMai(float gia, float khuyenmai)
        {
            return gia - (gia * khuyenmai);
        }
        public ActionResult hienthiChiTiet(string ma)
        {
            SanPham sp = db.SanPhams.FirstOrDefault(t => t.idSanPham == ma);
            
            return View(sp);
        }

    }
}
