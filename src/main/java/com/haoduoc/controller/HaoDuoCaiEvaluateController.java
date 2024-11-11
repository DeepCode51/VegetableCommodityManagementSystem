package com.haoduoc.controller;

import com.haoduoc.pojo.HaoDuoCaiEvaluate;
import com.haoduoc.pojo.HaoDuoCaiOrder;
import com.haoduoc.service.HaoDuoCaiEvaluateService;
import com.haoduoc.service.HaoDuoCaiOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class HaoDuoCaiEvaluateController {

    @Autowired
    @Qualifier("HaoDuoCaiEvaluateServiceImpl")
    private HaoDuoCaiEvaluateService haoDuoCaiEvaluateService;

    @Autowired
    @Qualifier("HaoDuoCaiOrderServiceImpl")
    private HaoDuoCaiOrderService haoDuoCaiOrderService;

    //去评论订单页面
    @RequestMapping("/evaluate/toHaoDuoCaiOrderEvaluate/{yoid}")
    public String toHaoDuoCaiOrderEvaluate(@PathVariable("yoid")String yoid, Model model){
        model.addAttribute("yoid",yoid);
        return "Haoduocaievaluate/addHdcEvaluate";
    }

    //用户提交评价
    @RequestMapping("/evaluate/addOrderEvaluate")
    public String addOrderEvaluate(HaoDuoCaiEvaluate haoDuoCaiEvaluate, MultipartFile musicRsc) throws IOException {
        System.out.println(haoDuoCaiEvaluate);
        HaoDuoCaiOrder haoDuoCaiOrder = haoDuoCaiOrderService.queryOrderByYoid(haoDuoCaiEvaluate.getYoid());

        //提交评价时间
        Date day=new Date();
        //格式化成yyyyMMdd格式，注意大小写
        SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String yedate=format.format(day);

        haoDuoCaiEvaluate.setYid(haoDuoCaiOrder.getYid());
        haoDuoCaiEvaluate.setUid(haoDuoCaiOrder.getUid());
        haoDuoCaiEvaluate.setYedate(yedate);

        String filePath = "E:\\bs\\haoduocaiSale\\web\\statics\\haoDuoCaiEvaluate";//保存图片的路径
        String originalFilename = musicRsc.getOriginalFilename();
        if (originalFilename.equals("")||originalFilename==null){

        }else {
            File targetFile = new File(filePath,originalFilename);
            if (!targetFile.exists()){
                //把本地文件上传到封装上传文件位置的全路径
                musicRsc.transferTo(targetFile);
                System.out.println("originalFilename="+originalFilename);
            }
            haoDuoCaiEvaluate.setYeimage("/statics/haoDuoCaiEvaluate/"+originalFilename);
        }
        System.out.println(haoDuoCaiEvaluate);
        haoDuoCaiEvaluateService.addHaoDuoCaiEvaluate(haoDuoCaiEvaluate);
        haoDuoCaiOrderService.updateIsevaluate(haoDuoCaiEvaluate.getYoid());
        return "redirect:/order/toUserOrder";
    }

    //用户查看评价
    @RequestMapping("/evaluate/showUserEvaluate/{yoid}")
    public String showUserEvaluate(@PathVariable("yoid")String yoid, Model model){
        HaoDuoCaiEvaluate haoDuoCaiEvaluate = haoDuoCaiEvaluateService.queryEvaluateByYoid(yoid);
        model.addAttribute("haoDuoCaiEvaluate", haoDuoCaiEvaluate);
        return "Haoduocaievaluate/showUserEvaluate";
    }

    //用户删除评价
    @RequestMapping("/evaluate/deleteUserEvaluate/{yoid}")
    public String deleteUserEvaluate(@PathVariable("yoid")String yoid, Model model){
        haoDuoCaiEvaluateService.deleteEvaluateByYoid(yoid);
        HaoDuoCaiEvaluate haoDuoCaiEvaluate = haoDuoCaiEvaluateService.queryEvaluateByYoid(yoid);
        model.addAttribute("haoDuoCaiEvaluate", haoDuoCaiEvaluate);
        return "Haoduocaievaluate/showUserEvaluate";
    }

    //管理员查看所有评论
    @RequestMapping("/evaluate/toMEvaluate")
    public String toMEvaluate( Model model){
        List<HaoDuoCaiEvaluate> haoDuoCaiEvaluates = haoDuoCaiEvaluateService.queryAllEvaluate();
        model.addAttribute("haoDuoCaiEvaluates", haoDuoCaiEvaluates);
        System.out.println(haoDuoCaiEvaluates);
        return "Manage/mEvaluate";
    }

    //管理员删除评价
    @RequestMapping("/evaluate/mDeleteUserEvaluate")
    public String mDeleteUserEvaluate(String yoid, Model model){
        haoDuoCaiEvaluateService.deleteEvaluateByYoid(yoid);
        List<HaoDuoCaiEvaluate> haoDuoCaiEvaluates = haoDuoCaiEvaluateService.queryAllEvaluate();
        model.addAttribute("haoDuoCaiEvaluates", haoDuoCaiEvaluates);
        return "redirect:/evaluate/toMEvaluate";
    }
}
