package com.haoduoc.controller;

import com.haoduoc.pojo.HaoDuoCaiOrder;
import com.haoduoc.pojo.ItemBean;
import com.haoduoc.pojo.User;
import com.haoduoc.pojo.Indiscount;
import com.haoduoc.pojo.Useindiscount;
import com.haoduoc.service.HaoDuoCaiOrderService;
import com.haoduoc.service.HaoDuoCaiService;
import com.haoduoc.service.IndiscountService;
import com.haoduoc.service.UserService;
import com.haoduoc.service.UseindiscountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@Controller
public class HaoDuoCaiOrderController {
    @Autowired
    @Qualifier("HaoDuoCaiOrderServiceImpl")
    private HaoDuoCaiOrderService haoDuoCaiOrderService;

    @Autowired
    @Qualifier("HaoDuoCaiServiceImpl")
    private HaoDuoCaiService haoDuoCaiService;

    @Autowired
    @Qualifier("UserServiceImpl")
    private UserService userService;

    @Autowired
    @Qualifier("IndiscountServiceImpl")
    private IndiscountService indiscountService;
    @Autowired
    @Qualifier("UseindiscountServiceImpl")
    private UseindiscountService useindiscountService;
    //去订单支付页面
    @RequestMapping("/order/toOrderPay")
    public String toOrderPay(String sum, Model model, HttpSession session, User user){
        int uid = (int) session.getAttribute("uid");
        List<Useindiscount> useindiscount = useindiscountService.queryUseindiscount(uid);
        model.addAttribute("useindiscount",useindiscount);
        model.addAttribute("orderInfo",user);
        model.addAttribute("sum",sum);
        System.out.println(useindiscount);
        return "HaoduocaiOrder/orderInfo";
    }

    //支付订单
    @RequestMapping("/order/orderPay")
    public String orderPay(HaoDuoCaiOrder haoDuoCaiOrder, Model model, HttpSession session, Useindiscount useindiscount){
        Date day=new Date();
        //格式化成yyyyMMdd格式，注意大小写
        SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String yadate=format.format(day);
        String now=(String)(yadate.toString());  //当前的日期时间

        int count = haoDuoCaiOrderService.queryOrderCount();
        String str_i=String.valueOf(count); //转成字符串格式
        while(str_i.length()<3){	//格式化成三位的字符串
            str_i="0"+str_i;
        }
        String orderid=now+str_i;
        orderid=orderid.replace("-","");	//将日期格式中的特别符号（空格等）除去
        orderid=orderid.replace(" ","");
        orderid=orderid.replace(":","");
        System.out.println(orderid);

        //给订单设置值
        haoDuoCaiOrder.setIsevaluate("false");
        haoDuoCaiOrder.setIsreceive("false");
        haoDuoCaiOrder.setIsrefundprocess("false");
        haoDuoCaiOrder.setYadate(yadate);
        haoDuoCaiOrder.setYastatus("未发货");
        haoDuoCaiOrder.setUid((int) session.getAttribute("uid"));

        int qsum=0;
        String yoid="";
        ArrayList cart=(ArrayList)session.getAttribute("cart");
        Object items[]=cart.toArray();
        for(int j=0;j<items.length;j++){
            ItemBean temp=(ItemBean)items[j];
            yoid=orderid+j;
            haoDuoCaiOrder.setYoid(yoid);
            haoDuoCaiOrder.setYid(temp.getHaoDuoCais().getYid());
            haoDuoCaiOrder.setYacount(temp.getQuantity());
            haoDuoCaiOrder.setYasum((int) (temp.getQuantity()*temp.getHaoDuoCais().getYprice()));
            qsum+= haoDuoCaiOrder.getYasum();
            System.out.println(yoid);
            System.out.println(haoDuoCaiOrder);
            haoDuoCaiOrderService.addHaoDuoCaiOrder(haoDuoCaiOrder);
            haoDuoCaiService.addHaoDuoCaiYsale(temp.getHaoDuoCais().getYid(),temp.getQuantity());
//            haoDuoCaiService.addHaoDuoCaiInventory(temp.getHaoDuoCais().getYid(),temp.getQuantity());
            System.out.println("111111111111111111112"+temp.getHaoDuoCais().getYid());
        }

        if(useindiscount!=null){
            int uid = (int) session.getAttribute("uid");
            System.out.println("useindiscount:"+useindiscount);
            Indiscount indiscount = indiscountService.queryIndiscountById(useindiscount.getDisid());
            if(indiscount!=null){
                qsum-=indiscount.getQuota();
            }
            useindiscount.setUid(uid);
            useindiscountService.reduceUseindiscount(useindiscount);
        }

        session.setAttribute("cart",null);
        return "redirect:/user/toUserCenter";
    }
    //去我的测试优惠卷页面
    @RequestMapping("/order/toText1")
    public String toText1()
    {
        return "HaoduocaiOrder/testo";
    }
    //去我的订单页面
    @RequestMapping("/order/toUserOrder")
    public String toUserOrder(Model model, HttpSession session, String vcheck){
        HashMap map = new HashMap();
        if("1".equals(vcheck)){
            System.out.println("vcheck="+vcheck);
            map.put("isreceive","false");
        }
        else if("2".equals(vcheck)){
            System.out.println("vcheck="+vcheck);
            map.put("isevaluate","false");
            map.put("isreceive","true");
        }
        else if("3".equals(vcheck)){
            System.out.println("vcheck="+vcheck);
            map.put("isevaluate","true");
        }
        System.out.println(vcheck);
        int uid = (int) session.getAttribute("uid");
        map.put("uid",uid);
        List<HaoDuoCaiOrder> haoDuoCaiOrders = haoDuoCaiOrderService.queryUserOrder(map);
        System.out.println(haoDuoCaiOrders);
        model.addAttribute("haoDuoCaiOrders", haoDuoCaiOrders);
        model.addAttribute("vcheck",vcheck);
        return "HaoduocaiOrder/orderUser";
    }

    //确认收货
    @RequestMapping("/order/receiveMakeSure/{yoid}")
    public String receiveMakeSure(@PathVariable("yoid") String yoid){
        System.out.println(yoid);
        haoDuoCaiOrderService.updateIsreceive(yoid);
        return "redirect:/order/toUserOrder";
    }

    //去管理员查看所有订单
    @RequestMapping("/order/toMOrder")
    public String toMOrder(Model model,int startPlace){
        int pageSize=10;
        int evaluateCount= haoDuoCaiOrderService.queryOrderCount();


        int allPage=0;
        System.out.println(evaluateCount%pageSize);
        //计算所有页码
        if(evaluateCount%pageSize==0){
            allPage=evaluateCount/pageSize;
        }
        else if(evaluateCount%pageSize!=0){
            allPage=(evaluateCount/pageSize)+1;
        }

        if(startPlace<=0){
            startPlace=0;
        }
        else if(startPlace>=evaluateCount){
            startPlace=allPage*pageSize-2;
        }

        int nowPage=(startPlace/pageSize)+1;
        List<HaoDuoCaiOrder> haoDuoCaiOrders = haoDuoCaiOrderService.queryAllOrder(startPlace,pageSize);

        model.addAttribute("haoDuoCaiOrders", haoDuoCaiOrders);
        model.addAttribute("nowPage",nowPage);
        model.addAttribute("allPage",allPage);
        model.addAttribute("pageSize",pageSize);
        System.out.println("evaluateCount"+evaluateCount);
        System.out.println("startplace="+startPlace);
        System.out.println("nowPage"+nowPage);
        System.out.println("allPage"+allPage);
        return "Manage/mOrder";
    }

    //去管理员确认发货订单
    @RequestMapping("/order/delieverOrder")
    public String delieverOrder(String yoid, Model model,int nowPage,int allPage,int pageSize){
        int evaluateCount= haoDuoCaiOrderService.queryOrderCount();
        System.out.println("evaluateCount"+evaluateCount);
        haoDuoCaiOrderService.updateYastatus(yoid);
        List<HaoDuoCaiOrder> haoDuoCaiOrders = haoDuoCaiOrderService.queryAllOrder((nowPage-1)*pageSize,pageSize);
        model.addAttribute("haoDuoCaiOrders", haoDuoCaiOrders);


        model.addAttribute("nowPage",nowPage);
        model.addAttribute("allPage",allPage);
        model.addAttribute("pageSize",pageSize);
        return "Manage/mOrder";
    }
}
