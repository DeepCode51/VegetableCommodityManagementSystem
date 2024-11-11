package com.haoduoc.controller;
import com.haoduoc.pojo.*;
import com.haoduoc.service.RevenuereportService;
import com.haoduoc.service.HaoDuoCaiTypeService;
import com.haoduoc.service.HaoDuoCaiService;
import com.haoduoc.service.ManagerService;
import com.haoduoc.service.UserService;
import com.haoduoc.service.IndiscountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class ManagerController {

    @Autowired
    @Qualifier("ManagerServiceImpl")
    private ManagerService managerService;

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
    @Qualifier("HaoDuoCaiTypeServiceImpl")
    private HaoDuoCaiTypeService haoDuoCaiTypeService;
    @Autowired
    @Qualifier("RevenuereportServiceImpl")
    private RevenuereportService revenuereportService;
    //去管理员登入页面
    @RequestMapping("/manage/toMLogin")
    public String toLogin() {
        return "Manage/mLogin";
    }

    //去管理员首页
    @RequestMapping("/manage/toMIndex")
    public String toMIndex() {
        return "Manage/mIndex";
    }

    //去菜品管理
    @RequestMapping("/manage/toMHaoDuoCai")
    public String toMHaoDuoCai(Model model) {
        List<HaoDuoCais> list = haoDuoCaiService.queryAllHaoDuoCais();
        model.addAttribute("haoDuoCailist", list);
        return "Manage/mHdc";
    }
    //去查看报表
    @RequestMapping("/manage/toRevenuereport")
    public String toRevenuereport(Model model) {
        List<HaoDuoCais> list = haoDuoCaiService.queryAllHaoDuoCais();
        model.addAttribute("haoDuoCailist", list);
        return "Manage/mrevenuereport";
    }
    //去管理员登入验证
    @RequestMapping("/manage/login")
    public String login(String gmaccount,String gmpass,HttpSession session) {
        if(gmaccount!=null&&gmpass!=null){
            Manager manager = managerService.queryByGmaccount(gmaccount);
            if(gmpass.equals(manager.getGmpass())){
                session.setAttribute("Admin","true");
                return "redirect:/manage/toMHaoDuoCai";
            }
            else {
                return "redirect:/Manage/mLogin";
            }
        }
        else
            return "redirect:/Manage/mLogin";
    }

    //去用户管理页面
    @RequestMapping("/manage/toUser")
    public String toUser(Model model){
        List<User> userList = userService.queryAllUser();
        model.addAttribute("userlist",userList);
        return "Manage/mUser";
    }

    //去类型管理页面
    @RequestMapping("/manage/toType")
    public String toType(Model model){
        List<HaoDuoCaiType> haoDuoCaiType = haoDuoCaiTypeService.queryHaoDuoCaiType();
        model.addAttribute("haoDuoCaiType", haoDuoCaiType);
        return "Manage/mType";
    }
    //去优惠卷查看页面
    @RequestMapping("/manage/toIndiscount")
    public String IndiscountMapper(Model model){
        List<Indiscount> indiscount = indiscountService.queryYasaiIndiscount();
        model.addAttribute("indiscount",indiscount);
        System.out.println(indiscount);
        return "Manage/mindiscount";
    }
    //去修改优惠卷数量页面
    @RequestMapping("/manage/alterIndiscountByid/{disid}")
    public String toalterIndiscountByid(Model model,HttpSession session,@PathVariable("disid")  int disid) {
        Indiscount indiscount = indiscountService.queryIndiscountById(disid);
        model.addAttribute("indiscount",indiscount);
        System.out.println(indiscount);
        return "Manage/addindiscount";
    }


    //修改优惠卷
    @RequestMapping("/manage/toalterIndiscountByid")
    public String alterIndiscountByid(Indiscount indiscount,HttpSession session) {
        indiscountService.alterIndiscountByid(indiscount);
        System.out.println("当前"+indiscount);

        return "redirect:/manage/toIndiscount";
    }
}
