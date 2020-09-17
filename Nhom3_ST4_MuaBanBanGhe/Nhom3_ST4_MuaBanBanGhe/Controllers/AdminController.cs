using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Nhom3_ST4_MuaBanBanGhe.Models;
using System.IO;

namespace Nhom3_ST4_MuaBanBanGhe.Controllers
{
    public class AdminController : Controller
    {
        //
        // GET: /Admin/
        QLBanGheDataContext db = new QLBanGheDataContext();
        public ActionResult QuanLy()
        {
            return View();
        }
        public ActionResult QuanLyNhom()
        {
            List<NhomSP> lst = db.NhomSPs.ToList();
            return View(lst);

        }
        public ActionResult QuanLyLoai(string ma)
        {
            List<Loai> lst = db.Loais.Where(t => t.idNhom == ma).ToList();
            return PartialView(lst);

        }
        public ActionResult QuanLySanPham(string ma)
        {
            List<SanPham> lst = db.SanPhams.Where(t => t.idLoai == ma).ToList();
            return View(lst);
        }

        [HttpPost]
        public ActionResult XLThemNhom(FormCollection c)
        {
            List<NhomSP> lst = db.NhomSPs.ToList();

            NhomSP newnhom = new NhomSP();
            newnhom.idNhom = (lst.Count() + 1).ToString();
            newnhom.tenNhom = c["txtTen"];
            db.NhomSPs.InsertOnSubmit(newnhom);
            db.SubmitChanges();
            return RedirectToAction("QuanLyNhom", "Admin");
        }
        [HttpPost]
        public ActionResult XLThemLoai(FormCollection c, string ma)
        {
            List<Loai> lst = db.Loais.ToList();
            Loai newloai = new Loai();
            newloai.idLoai = (lst.Count() + 1).ToString();
            newloai.idNhom = ma;
            newloai.TenLoai = c["txtTenLoai"];
            db.Loais.InsertOnSubmit(newloai);
            db.SubmitChanges();
            return RedirectToAction("QuanLyNhom", "Admin");

        }
        public ActionResult ThemSanPham(string ma)
        {
            Loai loai = db.Loais.FirstOrDefault(t => t.idLoai == ma);
            return View(loai);
        }
        [HttpPost]
        public ActionResult XLThemSP(FormCollection c, string ma , HttpPostedFileBase file)
        {
            
            List<SanPham> lst = db.SanPhams.ToList();
            SanPham sp = new SanPham();
            sp.idSanPham = (lst.Count() + 1).ToString();
            sp.idLoai = ma;
            sp.Name = c["txtTenSP"];
            sp.Gia = decimal.Parse(c["txtGiaSP"]);
            sp.MoTa = c["txtMoTa"];
            sp.NgayNhap = DateTime.Now;
            sp.SoLuotXem = 0;
            sp.Hinh = file.FileName;
            var tenh = Server.MapPath("~/Content/Hinh/") + file.FileName + ".jpg";
            file.SaveAs(tenh);

            db.SanPhams.InsertOnSubmit(sp);
            db.SubmitChanges();
            return RedirectToAction("QuanLySanPham", "Admin", new { ma = ma});
        }

        public ActionResult XoaSanPham(string masp)
        {
            SanPham sp = db.SanPhams.FirstOrDefault(t => t.idSanPham == masp);
            if (sp == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(sp);
        }
        public ActionResult XLXoaSP(string masp)
        {
            SanPham sp = db.SanPhams.FirstOrDefault(t => t.idSanPham == masp);
            db.SanPhams.DeleteOnSubmit(sp);
            db.SubmitChanges();
            return RedirectToAction("QuanLyNhom");
        }
        public ActionResult XoaLoai(string ma)
        {
            List<SanPham> sanpham = db.SanPhams.Where(t => t.idLoai == ma).ToList();
            foreach (var item in sanpham)
            {
                db.SanPhams.DeleteOnSubmit(item);
            }
            Loai loai = db.Loais.FirstOrDefault(t => t.idLoai == ma);
            db.Loais.DeleteOnSubmit(loai);
            db.SubmitChanges();
            return RedirectToAction("QuanLyNhom");
        }
        public ActionResult XoaNhom(string ma)
        {
            List<Loai> loai = db.Loais.Where(t => t.idNhom == ma).ToList();
        
            foreach (var item in loai)
            {
                List<SanPham> sanpham = db.SanPhams.Where(t => t.idLoai == item.idLoai).ToList();
                foreach (var i in sanpham)
                {
                    db.SanPhams.DeleteOnSubmit(i);
                }
                db.Loais.DeleteOnSubmit(item);
            }

            NhomSP nhom = db.NhomSPs.FirstOrDefault(t => t.idNhom == ma);
            db.NhomSPs.DeleteOnSubmit(nhom);  
            db.SubmitChanges();
            return RedirectToAction("QuanLyNhom");
        }
        public ActionResult XemTinTuc()
        {
            List<TinTuc> tt = db.TinTucs.ToList();
            return View(tt);
        }
        public ActionResult XoaTinTuc(string ma)
        {
            TinTuc tt = db.TinTucs.FirstOrDefault(t => t.MaTin == ma);
            db.TinTucs.DeleteOnSubmit(tt);
            db.SubmitChanges();
            return RedirectToAction("XemTinTuc", "Admin");
        }
        public ActionResult ThemTinTuc(string ma)
        {
            return View();
        }
        [HttpPost]
        public ActionResult XLThemTT(FormCollection c, HttpPostedFileBase file)
        {
            List<TinTuc> lst = db.TinTucs.ToList();
            TinTuc tt = new TinTuc();
            tt.MaTin = (lst.Count() + 1).ToString();       
            tt.TieuDe = c["txtTieuDe"];
            tt.NoiDung = c["txtMoTa"];
            tt.HinhAnh = file.FileName;
            var tenh = Server.MapPath("~/Content/Hinh/") + file.FileName + ".jpg";
            file.SaveAs(tenh);
            db.TinTucs.InsertOnSubmit(tt);
            db.SubmitChanges();
            return RedirectToAction("XemTinTuc", "Admin");
        }
        public ActionResult QuanLyHoaDon()
        {
            List<HoaDon> lst = db.HoaDons.ToList();
            return View(lst);
        }
        public ActionResult ChiTietHoaDon(string ma)
        {
            List<ChiTietHD> lst = db.ChiTietHDs.Where(t => t.idHoaDon == ma).ToList();
            return View(lst);
        }
        public ActionResult QuanLyTaiKhoan()
        {
            List<TaiKhoan> lst = db.TaiKhoans.ToList();
            return View(lst);
        }
        public ActionResult DangXuat()
        {
            Session["admin"] = null;
            return RedirectToAction("HomePage","Home");
        }
    }
}
