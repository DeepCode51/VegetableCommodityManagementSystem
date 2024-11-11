package com.haoduoc.controller;

import com.haoduoc.pojo.HaoDuoCais;
import com.haoduoc.pojo.User;
import com.haoduoc.service.HaoDuoCaiService;
import com.haoduoc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.haoduoc.pojo.Useindiscount;
import com.haoduoc.pojo.Indiscount;
import com.haoduoc.service.UseindiscountService;
import com.haoduoc.service.IndiscountService;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller
public class UserController {

    @Autowired
    @Qualifier("UserServiceImpl")
    private UserService userService;

    @Autowired
    @Qualifier("HaoDuoCaiServiceImpl")
    private HaoDuoCaiService haoDuoCaiService;

    @Autowired
    @Qualifier("UseindiscountServiceImpl")
    private UseindiscountService useindiscountService;

    @Autowired
    @Qualifier("IndiscountServiceImpl")
    private IndiscountService indiscountService;

    //去登入页面
    @RequestMapping("/user/toLogin")
    public String toLogin() {
        return "User/login";
    }

    //去注册页面
    @RequestMapping("/user/toReg")
    public String toReg() {
        return "User/reg";
    }

    //去注册页面
    @RequestMapping("/user/toReg2")
    public String toReg2(Model model,@RequestParam(value="fail",required=true) String fail) {
        model.addAttribute("fail",fail);
        return "User/reg";
    }

    //去网站主页
    @RequestMapping("/user/toHomePage")
    public String toHomePage(Model model) {
        List<HaoDuoCais> haoDuoCaisList = haoDuoCaiService.queryHaoDuoCaisBySale();
        model.addAttribute("haoDuoCaisList", haoDuoCaisList);
        return "User/homePage";
    }

    //去个人中心
    @RequestMapping("/user/toUserCenter")
    public String toUserCenter(Model model,HttpSession session) {
        int uid = (int) session.getAttribute("uid");
        User user = userService.queryUserById(uid);
        model.addAttribute("user",user);
        return "User/userCenter";
    }

    //登入判断
    @RequestMapping("/user/loginToHomePage")
    public String add(String uaccount, String upass, HttpSession session) {
        User user = userService.queryByUaccount(uaccount);
        if(user.getUpass().equals(upass)){
            session.setAttribute("uid",user.getUid());
            session.setAttribute("User",user);
            return "redirect:/user/toHomePage";
        }
        else {
            return "redirect:/user/toLogin";
        }
    }

    //用户注册
    @RequestMapping("/user/reg")
    public String reg(User user, Model model) {
        System.out.println(user);
        if(userService.queryByUaccount(user.getUaccount())==null){
            user.setUheadphoto("/statics/headImage/1.jpg");
            user.setNname("请重新命名");
            userService.addUser(user);
            return "redirect:/user/toLogin";
        }
        else {
            System.out.println("123123124");
            model.addAttribute("fail","该账号已注册");
            return "redirect:/user/toReg2";
        }
    }

    //ajax登入验证
    @RequestMapping("/user/loginAjax")
    @ResponseBody
    public String ajax3(String uaccount,String upass){
        String msg = "";
        User user = userService.queryByUaccount(uaccount);
        if (uaccount!=null&&upass==null){
            if(user!=null){
                if (uaccount.equals(user.getUaccount())){
                    msg = "OK";
                }
            }
            else {
                msg = "用户名输入错误";
            }
        }
        if (upass!=null){
            if(user!=null){
                if (upass.equals(user.getUpass())){
                    msg = "OK";
                }
                else {
                    msg = "密码输入有误";
                }
            }
        }
        return msg; //由于@RestController注解，将msg转成json格式返回
    }

    //去修改昵称
    @RequestMapping("/user/toAlterNname")
    public String toAlterNname(Model model,HttpSession session) {
        int uid = (int) session.getAttribute("uid");
        User user = userService.queryUserById(uid);
        model.addAttribute("user",user);
        return "User/alterNname";
    }

    //修改昵称
    @RequestMapping("/user/alterNname")
    public String alterNname(String nname,HttpSession session) {
        int uid = (int) session.getAttribute("uid");
        User user = userService.queryUserById(uid);
        user.setNname(nname);
        userService.alterNnameById(user);
        return "redirect:/user/toUserCenter";
    }

    //去修改个人信息
    @RequestMapping("/user/toAlterUserInfo")
    public String toAlterUserInfo(Model model,HttpSession session) {
        int uid = (int) session.getAttribute("uid");
        User user = userService.queryUserById(uid);
        model.addAttribute("user",user);
        return "User/alterUserInfo";
    }

    //修改个人信息
    @RequestMapping("/user/alterUserInfo")
    public String alterUserInfo(User user, MultipartFile musicRsc) throws IOException {
        System.out.println("修改的用户信息:"+user);
        String filePath = "E:\\bs\\haoduocaiSale\\web\\statics\\headImage";//保存图片的路径
        String originalFilename = musicRsc.getOriginalFilename();
        if (originalFilename.equals("")||originalFilename==null){

        }else {
            File targetFile = new File(filePath,originalFilename);
            if (!targetFile.exists()){
                //把本地文件上传到封装上传文件位置的全路径
                musicRsc.transferTo(targetFile);
                System.out.println("originalFilename="+originalFilename);
            }
            user.setUheadphoto("/statics/headImage/"+originalFilename);
        }
        userService.alterUserInfo(user);
        return "redirect:/user/toUserCenter";
    }

    //删除用户通过id
    @RequestMapping("/user/deleteUserById/{uid}")
    public String deleteUserById(@PathVariable("uid") int uid){
        if(!"".equals(uid)){
            userService.deleteUserById(uid);
        }
        return "redirect:/manage/toUser";
    }

    //添加用户收货地址
    @RequestMapping("/user/addUaddress")
    public String addUaddress(Model model,HttpSession session,String uaddress) {
        int uid = (int) session.getAttribute("uid");
        userService.addUserAddress(uaddress,uid);
        return "redirect:/cart/makeSureCart";
    }
    //退出登入
    @RequestMapping("/user/userLogOut")
    public String userLogOut(Model model,HttpSession session,String uaddress) {
        session.setAttribute("uid",null);
        session.setAttribute("cart",null);
        return "redirect:/user/toHomePage";
//        return "User/login";
    }
    //去领取优惠券页面
    @RequestMapping("/user/toAllIndiscount")
    public String toAllIndiscount(Model model) {
        List<Indiscount> indiscount = indiscountService.queryYasaiIndiscount();
        model.addAttribute("indiscount",indiscount);
        return "User/allDiscount";
    }
    //用户查看自己拥有的优惠券
    @RequestMapping("/user/toDiscountUserOwn")
    public String toDiscountUserOwn(Model model,HttpSession session) {
        int uid = (int) session.getAttribute("uid");
        System.out.println("uid="+uid);
        List<Useindiscount> useindiscount = useindiscountService.queryUseindiscount(uid);
        System.out.println("useindiscount"+useindiscount);
        model.addAttribute("useindiscount",useindiscount);
        return "User/shpuIndiscount";
    }

    //用户领取优惠券
    @RequestMapping("/user/addDiscountUserFirst/{disid}")
    public String addDiscountUserFirst(Model model, @PathVariable("disid") int disid, HttpSession session, Useindiscount useindiscount) {
        int uid = (int) session.getAttribute("uid");
        useindiscount.setUid(uid);
        useindiscount.setDisid(disid);
        System.out.println("1111111111111");
        System.out.println("disid="+disid);
        if(useindiscountService.queryUseindiscountHas(uid,disid)==null){
            useindiscountService.addUseindiscountFirst(useindiscount);
        }
        else {
            useindiscountService.addUseindiscount(useindiscount);
        }
        indiscountService.reduceIndiscount(disid);
        return "redirect:/user/toAllIndiscount";
    }
}
