using Nhom3_ST4_MuaBanBanGhe.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Nhom3_ST4_MuaBanBanGhe.Controllers
{
    public class GiohangController : Controller
    {
        
        QLBanGheDataContext db = new QLBanGheDataContext();
        //
        // GET: /Giohang/
        public List<Giohang> Laygiohang()
        {
            List<Giohang> lsGiohang = Session["Giohang"] as List<Giohang>;
            if (lsGiohang == null)
            {
                

                lsGiohang = new List<Giohang>();
                Session["Giohang"] = lsGiohang;
            }
            return lsGiohang;
        }

        public ActionResult Themgiohang(string ma)
        {
            
            List<Giohang> lsGiohang = Laygiohang();
            Giohang sanpham = lsGiohang.FirstOrDefault(n => n.iMasanpham == ma);
            if (sanpham == null)
            {
                sanpham = new Giohang(ma);
                
                lsGiohang.Add(sanpham);
                return RedirectToAction("HienThiGioHang", "Giohang");
            }
            else
            {
                sanpham.iSoluong++;
                return RedirectToAction("HienThiGioHang", "Giohang");
            }
        }


        private int TongSoLuong()
        {
            int iTongSoLuong = 0;
            List<Giohang> lsGiohang = Session["Giohang"] as List<Giohang>;
            if (lsGiohang != null)
            {
                iTongSoLuong = lsGiohang.Sum(n => n.iSoluong);
            }
            return iTongSoLuong;
        }

        private double TongTien()
        {
            double dTongtien = 0;
            List<Giohang> lsGiohang = Session["Giohang"] as List<Giohang>;
            if (lsGiohang != null)
            {
                dTongtien = lsGiohang.Sum(n => n.dThanhtien);
            }
            return dTongtien;
        }

        public ActionResult HienThiGioHang()
        {
            List<Giohang> lsGiohang = Laygiohang();
            if (lsGiohang.Count == 0)
            {
                return RedirectToAction("hienthiSanPham", "Home");
            }
            ViewBag.Tongsoluong = TongSoLuong();
            ViewBag.Tongtien = TongTien();
            return View(lsGiohang);
        }

        public ActionResult CapnhatGiohang(string iMaSP, FormCollection f)
        {
            
            List<Giohang> lsGiohang = Laygiohang();
            Giohang sanpham = lsGiohang.SingleOrDefault(n => n.iMasanpham == iMaSP);
            if (sanpham != null)
            {
                sanpham.iSoluong = int.Parse(f["txtSoluong"].ToString());
            }
            return RedirectToAction("GioHang","Giohang");
        }


        public ActionResult XoaGiohang(string iMaSp)
        {
            List<Giohang> lsGiohang = Laygiohang();
            Giohang sanpham = lsGiohang.SingleOrDefault(n => n.iMasanpham == iMaSp);
            if (sanpham != null)
            {
                lsGiohang.RemoveAll(n => n.iMasanpham == iMaSp);
                return RedirectToAction("HienThiGioHang");
            }
            return RedirectToAction("HienThiGioHang");
        }

        public ActionResult SoLuongGioHang()
        {
            List<Giohang> lstGiohang = Laygiohang();
            ViewBag.Soluong = lstGiohang.Count();
            return PartialView();
        }

        public ActionResult XoaTatcaGiohang()
        {
            List<Giohang> lstGiohang = Laygiohang();
            lstGiohang.Clear();
            return RedirectToAction("hienthiSanPham", "Home");
        }

        public ActionResult Dathang()
        {
            
            if (Session["Taikhoan"] == null || Session["Taikhoan"].ToString() == "")
            {
                return RedirectToAction("Dangnhap", "KhachHang");
            }
            
            List<Giohang> lstGiohang = Laygiohang();
            if (lstGiohang.Count == 0) 
            {
                return RedirectToAction("hienthiSanPham","Home");
            }
            
            ViewBag.Tongsoluong = TongSoLuong();
            ViewBag.Tongtien = TongTien();
            return View(lstGiohang);
        }

        
        [HttpPost]
        public ActionResult Dathang(FormCollection collection)
        {
            
            HoaDon HD = new HoaDon();
            TaiKhoan kh = (TaiKhoan)Session["Taikhoan"];
            List<HoaDon> lsthd = db.HoaDons.ToList();
            List<ChiTietHD> lstchitiet = db.ChiTietHDs.ToList();
            List<Giohang> lstGiohang = Laygiohang().ToList();
            HD.idHoaDon = kh.idTaiKhoan + (lsthd.Count + 1);
            HD.idTaiKhoan = kh.idTaiKhoan;
            HD.NgayLap = DateTime.Now.Date;
            HD.DiaChiGiao = kh.Diachi;
            var ngaygiao = String.Format("{0:dd/MM/yyyy}", collection["Ngaygiao"]);
          
            HD.NgayGiao = DateTime.Parse(ngaygiao).Date;
            if (HD.NgayGiao < HD.NgayLap)
            {
                return RedirectToAction("HienThiGioHang");
            }
            HD.ThanhTien = decimal.Parse(TongTien().ToString());
            HD.TinhTrang = "Đang Giao";
            HD.DaThanhToan = "Chưa Thanh Toán";
            db.HoaDons.InsertOnSubmit(HD);
 
            db.SubmitChanges();

            int dem = 0;
            foreach (var item in lstGiohang)
            {
                ChiTietHD ctdh = new ChiTietHD();
                ctdh.idChiTiet = HD.idHoaDon + (dem + 1);
                ctdh.idHoaDon = HD.idHoaDon;
                ctdh.idSanPham = item.iMasanpham;
                ctdh.Soluong = item.iSoluong;
                ctdh.ThanhTien = decimal.Parse(item.dDongia.ToString());
                dem++;
                db.ChiTietHDs.InsertOnSubmit(ctdh);
            }
            db.SubmitChanges();
            Session["Giohang"] = null;
            return RedirectToAction("Xacnhandonhang", "Giohang");
        }
        public ActionResult Xacnhandonhang()
        {
            return View();
        }
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult hienthiHoaDon(string ma)
        {
            List<HoaDon> hd = db.HoaDons.Where(t => t.idTaiKhoan == ma).ToList();
            return PartialView(hd);
        }
        public ActionResult hienthiChiTiet(string ma)
        {
            List<ChiTietHD> cthd = db.ChiTietHDs.Where(t => t.idHoaDon == ma).ToList();
            List<Giohang> lstgh = new List<Giohang>();
            foreach (var item in cthd)
            {
                Giohang gh = new Giohang(item.idSanPham);
                lstgh.Add(gh);
            } 
            ViewBag.Tongsoluong = TongSoLuong();
            ViewBag.Tongtien = TongTien();
            return View(lstgh);
        }
    }
}
