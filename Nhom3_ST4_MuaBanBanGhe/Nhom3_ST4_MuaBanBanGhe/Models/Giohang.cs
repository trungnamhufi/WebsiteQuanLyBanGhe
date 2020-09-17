using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Nhom3_ST4_MuaBanBanGhe.Models
{
    public class Giohang
    {
        QLBanGheDataContext db = new QLBanGheDataContext();
        public string iMasanpham { set; get; }
        public string sTensanpham { set; get; }
        public string sAnhbia { set; get; }
        public double dDongia { set; get; }
        public int iSoluong { set; get; }
       
        public Double dThanhtien
        {
            get { return iSoluong * dDongia; }
        }
        public Giohang(string Masanpham)
        {
            iMasanpham = Masanpham;
            SanPham sanpham = db.SanPhams.FirstOrDefault(n => n.idSanPham == iMasanpham);
            
            sTensanpham = sanpham.Name;
            sAnhbia = sanpham.Hinh;
            if (sanpham.KhuyenMai != null)
                dDongia = double.Parse(sanpham.Gia.ToString()) - (double.Parse(sanpham.Gia.ToString()) * double.Parse(sanpham.KhuyenMai.ToString()));
            else
                dDongia = double.Parse(sanpham.Gia.ToString());
            iSoluong = 1;
        }

       


    }
}