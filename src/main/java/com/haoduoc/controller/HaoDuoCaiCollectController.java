package com.haoduoc.controller;

import com.haoduoc.pojo.HaoDuoCaiCollect;
import com.haoduoc.pojo.HaoDuoCaiEvaluate;
import com.haoduoc.pojo.HaoDuoCais;
import com.haoduoc.service.HaoDuoCaiCollectService;
import com.haoduoc.service.HaoDuoCaiEvaluateService;
import com.haoduoc.service.HaoDuoCaiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class HaoDuoCaiCollectController {
    @Autowired
    @Qualifier("HaoDuoCaiCollectServiceImpl")
    private HaoDuoCaiCollectService haoDuoCaiCollectService;

    @Autowired
    @Qualifier("HaoDuoCaiServiceImpl")
    private HaoDuoCaiService haoDuoCaiService;

    @Autowired
    @Qualifier("HaoDuoCaiEvaluateServiceImpl")
    private HaoDuoCaiEvaluateService haoDuoCaiEvaluateService;

    //去个人收藏页面
    @RequestMapping("/collect/toUserCollect")
    public String toUserCollect(HttpSession session, Model model){
        int uid = (int) session.getAttribute("uid");
        HaoDuoCaiCollect haoDuoCaiCollect = haoDuoCaiCollectService.queryUserCollect(uid);
        System.out.println(haoDuoCaiCollect);
        model.addAttribute("haoDuoCaiCollect", haoDuoCaiCollect);
        return "User/userCollect";
    }

    //收藏商品
    @RequestMapping("/collect/addHaoDuoCaiCollect/{yid}")
    public String addHaoDuoCaiCollect(HttpSession session, Model model, @PathVariable("yid") int yid){
        int uid = (int) session.getAttribute("uid");
        System.out.println(haoDuoCaiCollectService.queryCollect(uid,yid));
        if(haoDuoCaiCollectService.queryCollect(uid,yid)==null){
            //添加收藏
            haoDuoCaiCollectService.addHaoDuoCaiCollect(uid,yid);
        }
        //查询这个yid的菜品信息，要返回到菜品详情页面
        HaoDuoCais haoDuoCais = haoDuoCaiService.queryHaoDuoCaisById(yid);
        model.addAttribute("haoDuoCais", haoDuoCais);
        //通过该菜品信息，查询和他相似的菜品，类型相同
        List<HaoDuoCais> haoDuoCaisList = haoDuoCaiService.queryHaoDuoCaisSame(haoDuoCais);
        model.addAttribute("haoDuoCaisList", haoDuoCaisList);
        //查看该菜品的评论,取前五条
        List<HaoDuoCaiEvaluate> haoDuoCaiEvaluates = haoDuoCaiEvaluateService.queryHaoDuoCaiEvaluate(yid);
        model.addAttribute("haoDuoCaiEvaluates", haoDuoCaiEvaluates);
        return "Haoduocais/hdcInfo";
    }

    //取消收藏
    @RequestMapping("/collect/deleteHaoDuoCaiCollect/{yid}")
    public String deleteHaoDuoCaiCollect( @PathVariable("yid") int yid,HttpSession session, Model model){
        int uid = (int) session.getAttribute("uid");
        //取消收藏
        haoDuoCaiCollectService.deleteHaoDuoCaiCollect(uid,yid);
        //回到个人收藏页面
        HaoDuoCaiCollect haoDuoCaiCollect = haoDuoCaiCollectService.queryUserCollect(uid);
        System.out.println(haoDuoCaiCollect);
        model.addAttribute("haoDuoCaiCollect", haoDuoCaiCollect);
        return "User/userCollect";
    }


}
