package com.haoduoc.controller;

import com.haoduoc.pojo.HaoDuoCais;
import com.haoduoc.pojo.CartManager;
import com.haoduoc.pojo.ItemBean;
import com.haoduoc.pojo.User;
import com.haoduoc.service.HaoDuoCaiService;
import com.haoduoc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;

@Controller
public class CartController {

    @Autowired
    @Qualifier("HaoDuoCaiServiceImpl")
    private HaoDuoCaiService haoDuoCaiService;

    @Autowired
    @Qualifier("UserServiceImpl")
    private UserService userService;

    //去购物车页面
    @RequestMapping("/cart/toCart")
    public String toCart(){
        return "Cart/cart";
    }

    //将商品加入购物车
    @RequestMapping("/cart/addToCart/{yid}")
    public String addToCart(@PathVariable("yid") int yid,  HttpSession session){
        HaoDuoCais haoDuoCais = haoDuoCaiService.queryHaoDuoCaisById(yid);

        CartManager cartManager=new CartManager();
        ArrayList cart=(ArrayList)session.getAttribute("cart");
        cartManager.setCart(cart);
        cartManager.addToCart(haoDuoCais,1);
        session.setAttribute("cart",cartManager.getCart());
        return "Cart/cart";
    }

    //处理购物车里的商品
    @RequestMapping("/cart/processCart")
    public String processCart(HttpSession session,String action,int yid,int quantity){
        CartManager cartManager=new CartManager();
        ArrayList cart=(ArrayList)session.getAttribute("cart");
        cartManager.setCart(cart);
        if("修改".equals(action)){
            cartManager.update(yid,quantity);
        }else{
            cartManager.delete(yid);
        }
        session.setAttribute("cart",cartManager.getCart());
        return "Cart/cart";
    }

    //清空购物车
    @RequestMapping("/cart/clearCart")
    public String clearCart(HttpSession session){
        session.setAttribute("cart",null);
        return "Cart/cart";
    }

    //去购物车信息确认页面
    @RequestMapping("/cart/makeSureCart")
    public String makeSureCart(HttpSession session,Model model){
        int uid = (int) session.getAttribute("uid");
        User user = userService.queryUserById(uid);
        String uaddress = userService.queryUserAddress(uid);
        if(null==uaddress){
            return "User/userAddress";
        }
        ArrayList cart=(ArrayList)session.getAttribute("cart");
        Object items[]=cart.toArray();
        int sum=0;
        for(int j=0;j<items.length;j++){
            ItemBean temp=(ItemBean)items[j];
            int goodprice= (int) temp.getHaoDuoCais().getYprice();
            int goodnumber=temp.getQuantity();
            sum=sum+goodprice*goodnumber;
            //答辩的后续，此为库存不足是会拒绝购买，并跳转提示。
           if(temp.getHaoDuoCais().getInventory()<temp.getQuantity())
           {System.out.println("剩余库存不足，购买失败！"+"\n"+"剩余库存数为"+temp.getHaoDuoCais().getInventory());
                return "User/NO";
           }
        }

        model.addAttribute("user",user);
        model.addAttribute("sum",sum);
        return "Cart/cartMakeSure";
    }

}
