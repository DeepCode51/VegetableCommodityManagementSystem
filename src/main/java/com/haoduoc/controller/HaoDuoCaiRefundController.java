package com.haoduoc.controller;

import com.haoduoc.pojo.HaoDuoCaiRefund;
import com.haoduoc.service.HaoDuoCaiOrderService;
import com.haoduoc.service.HaoDuoCaiRefundService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class HaoDuoCaiRefundController {
    @Autowired
    @Qualifier("HaoDuoCaiRefundServiceImpl")
    private HaoDuoCaiRefundService haoDuoCaiRefundService;

    @Autowired
    @Qualifier("HaoDuoCaiOrderServiceImpl")
    private HaoDuoCaiOrderService haoDuoCaiOrderService;

    //去用户申请处理页面
    @RequestMapping("/refund/toAddHaoDuoCaiRefund/{yoid}")
    public String toAddHaoDuoCaiRefund(@PathVariable("yoid") String yoid, Model model){
        HaoDuoCaiRefund yasairefund = haoDuoCaiRefundService.queryRefundByYoid(yoid);
        if(yasairefund!=null){
            model.addAttribute("haveRefund","申请已提交");
        }
        model.addAttribute("yoid",yoid);
        return "HaoduocaiRefund/addHdcRefund";
    }

    //用户提交处理
    @RequestMapping("/refund/addHaoDuoCaiRefund")
    public String addHaoDuoCaiRefund(HaoDuoCaiRefund yasairefund, MultipartFile musicRsc) throws IOException {

        System.out.println(yasairefund);
        //提交评价时间
        Date day=new Date();
        //格式化成yyyyMMdd格式，注意大小写
        SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String yrdate=format.format(day);

        yasairefund.setYrdate(yrdate);

        String filePath = "E:\\bs\\haoduocaiSale\\web\\statics\\yasairefund";//保存图片的路径
        String originalFilename = musicRsc.getOriginalFilename();
        if (originalFilename.equals("")||originalFilename==null){

        }else {
            File targetFile = new File(filePath,originalFilename);
            if (!targetFile.exists()){
                //把本地文件上传到封装上传文件位置的全路径
                musicRsc.transferTo(targetFile);
                System.out.println("originalFilename="+originalFilename);
            }
            yasairefund.setYrimage("/statics/yasairefund/"+originalFilename);
        }

        System.out.println(yasairefund);
        haoDuoCaiRefundService.addHaoDuoCaiRefund(yasairefund);
        return "redirect:/order/toUserOrder";
    }

    //管理员去查看所有退款申请
    @RequestMapping("/refund/toMRefund")
    public String toMRefund(Model model, HttpSession session){
        List<HaoDuoCaiRefund> yasairefunds = haoDuoCaiRefundService.queryAllRefund();
        model.addAttribute("yasairefunds",yasairefunds);
        System.out.println(yasairefunds);
        return "Manage/mRefund";
    }

    //管理员同意处理
    @RequestMapping("/refund/agreeRefund/{yoid}")
    public String agreeRefund(@PathVariable("yoid")String yoid){
        haoDuoCaiOrderService.updateIsrefundprocess(yoid);

        haoDuoCaiRefundService.deleteRefund(yoid);
        return "redirect:/refund/toMRefund";
    }

    //管理员取消处理
    @RequestMapping("/refund/disagreeRefund/{yoid}")
    public String disagreeRefund(@PathVariable("yoid")String yoid){
        haoDuoCaiRefundService.deleteRefund(yoid);
        return "redirect:/refund/toMRefund";
    }
}
