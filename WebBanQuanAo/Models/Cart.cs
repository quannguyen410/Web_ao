using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebBanQuanAo.Models
{
    //dinh nghia phan tu cua gio hang
    public class CartItem
    {
        public int Id { set; get; }
        public string Name { set; get; }
        public string Picture { set; get; }
        public double Price { set; get; }
        public int Quantity { set; get; }

        public double SubTotal
        {
            get { return Quantity * Price; }
        }
    }

    //dinh nghia gio hang
    public class Cart
    {
        private List<CartItem> _items;
        public List<CartItem> Items { get { return _items; } }
        //dinh nghia cac phuong thuc
        public Cart()
        {
            _items = new List<CartItem>();
        }
        public void AddItem(CartItem item)
        {
            var p = _items.Where(x => x.Id == item.Id).FirstOrDefault();
            if (p != null)
            {
                p.Quantity++;
            }
            else
            {
                _items.Add(item);
            }
        }
        public void UpdateQuantity(int id, int soluong)
        {
            var p = _items.Where(x => x.Id == id).FirstOrDefault();
            if(p!=null)
            {
               if (soluong > 0)
                    p.Quantity = soluong;
                else
                  _items.Remove(p);
            }    
            
        }
        public void DeleteItem(int id)
        {
            var p = _items.Where(x => x.Id == id).FirstOrDefault();
            if (p != null)
            {
                _items.Remove(p);
            }  
        }

        public double Total {          
            get {
                double s = _items.Sum(x=>x.Price*x.Quantity);               
                return s;            
            }
        }
        public double SumQuantity
        {
            get
            {
                double s = _items.Sum(x => x.Quantity);
                return s;
            }
        }
    }
}