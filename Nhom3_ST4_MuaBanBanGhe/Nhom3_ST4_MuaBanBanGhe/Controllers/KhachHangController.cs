using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Nhom3_ST4_MuaBanBanGhe.Models;


namespace Nhom3_ST4_MuaBanBanGhe.Controllers
{
    public class KhachHangController : Controller
    {
        //
        // GET: /KhachHang/
        QLBanGheDataContext db = new QLBanGheDataContext();
        public ActionResult DangKy()
        {
            return View();
        }
        public ActionResult DangNhap()
        {
            return View();
        }

        
        public ActionResult DangXuat()
        {
            Session["TaiKhoan"] = null;
            
            return RedirectToAction("hienthiSanPham","Home");
        }

        public ActionResult ThongTinKhachHang(string ma)
        {
            TaiKhoan tk = db.TaiKhoans.FirstOrDefault(t => t.idTaiKhoan == ma);
            
            return View(tk);
        }
        public bool kiemtratontai(string tentk)
        {
            TaiKhoan kh = db.TaiKhoans.FirstOrDefault(t => t.userName == tentk);
            if (kh == null)
                return true;
            return false;
        }

        [HttpPost]
        public ActionResult XLDangKy(FormCollection c , TaiKhoan kh)
        {
            if (c["txtMatKhau"] != c["txtReMatKhau"])
            {
                ViewBag.ThongBao2 = "Mật khẩu nhập lại không chính xác";
                return RedirectToAction("DangKy","KhachHang");
            }
            if (!kiemtratontai(c["txtDangNhap"]))
            {
                ViewBag.ThongBao1 = "Đã tồn tại user này";
                return RedirectToAction("DangKy", "KhachHang");
            }
                
            kh.idTaiKhoan = (db.TaiKhoans.Count()+1).ToString(); 
            kh.name = c["txtTen"];
            kh.userName = c["txtDangNhap"];
            kh.pass = c["txtMatKhau"];
            kh.GioiTinh = c["GioiTinh"];
            kh.Diachi = c["txtDiaChi"];
            kh.Phone = c["txtDienThoat"];       
            kh.Email = c["txtEmail"];
            kh.NgaySinh = DateTime.Parse(String.Format("{0:dd/mm/yyyy}", c["txtNgaySinh"]));
            db.TaiKhoans.InsertOnSubmit(kh);
            db.SubmitChanges();
            return RedirectToAction("DangNhap");  
        }
        [HttpPost]
        public ActionResult XLDangNhap(FormCollection c)
        {
            var tentk = c["txtTK"];
            var mk = c["txtMK"];

            TaiKhoan kh = db.TaiKhoans.FirstOrDefault(t => t.userName == tentk && t.pass == mk);
            if (kh == null)
            {
                Admin am = db.Admins.FirstOrDefault(t => t.Admin1 == tentk && t.pass == mk);
                if (am == null)
                    return RedirectToAction("DangNhap", "KhachHang");
                else
                {
                    Session["admin"] = am;
                    return RedirectToAction("QuanLy", "Admin");
                }
            }
            else
            {
                Session["TaiKhoan"] = kh;
                return RedirectToAction("hienthiSanPham", "Home");
            }
        }
    }
}
