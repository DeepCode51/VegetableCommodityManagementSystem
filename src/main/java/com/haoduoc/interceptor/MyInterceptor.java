package com.haoduoc.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class MyInterceptor implements HandlerInterceptor {
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws ServletException, IOException {
        HttpSession session = request.getSession();
        // 如果用户已登陆也放行
        System.out.println(session.getAttribute("uid"));
        System.out.println(session.getAttribute("User"));
        if(session.getAttribute("uid") != null) {
            return true;
        }
// 如果管理员已登陆也放行
        if(session.getAttribute("Admin") != null) {
            return true;
        }
        if (request.getRequestURI().contains("haoDuoCai/toHaoDuoCaiInfo")|| request.getRequestURI().contains("user/toLogin")
                || request.getRequestURI().contains("user/toHomePage")|| request.getRequestURI().contains("user/loginToHomePage")
                || request.getRequestURI().contains("haoDuoCai/toHaoDuoCaiRange")|| request.getRequestURI().contains("user/loginToHomePage")
                || request.getRequestURI().contains("user/loginToHomePage")|| request.getRequestURI().contains("manage/toMLogin")
                || request.getRequestURI().contains("manage/toMHaoDuoCai")|| request.getRequestURI().contains("manage/login")
                || request.getRequestURI().contains("user/toReg") || request.getRequestURI().contains("user/toReg2")
                || request.getRequestURI().contains("user/toLogin")
        ){
            return true;
        }
        if (request.getRequestURI().contains("cart/toCart")|| request.getRequestURI().contains("user/toUserCenter")
                || request.getRequestURI().contains("cart/addToCart")|| request.getRequestURI().contains("collect/addHaoDuoCaiCollect")
        ){
            request.getRequestDispatcher("/WEB-INF/jsp/User/login.jsp").forward(request, response);
        }
        if (!request.getRequestURI().contains("haoDuoCai/toHaoDuoCaiInfo")){
            request.getRequestDispatcher("/WEB-INF/jsp/User/homePage.jsp").forward(request, response);
        }
// 如果是以下页面则放行
        System.out.println("uri: " + request.getRequestURI());
//        if (request.getRequestURI().contains("login") || request.getRequestURI().contains("toindex")
//                || request.getRequestURI().contains("register")|| request.getRequestURI().contains("Userlogout")
////                || request.getRequestURI().contains("/haoduocaiSale_war_exploded/")|| request.getRequestURI().contains("haoduocaiSale_war_exploded")
////                || request.getRequestURI().contains("haoduocaiSale_war_exploded/")|| request.getRequestURI().contains("/haoduocaiSale_war_exploded")
//
//        ) {
//            return true;
//        }
// 用户没有登陆跳转到登陆页面homePage   /haoduocaiSale_war_exploded/
        System.out.println(request.getRequestURI());
        request.getRequestDispatcher("/WEB-INF/jsp/User/login.jsp").forward(request, response);
        return false;
    }
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
