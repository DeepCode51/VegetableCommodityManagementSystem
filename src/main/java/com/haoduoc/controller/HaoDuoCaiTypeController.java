package com.haoduoc.controller;

import com.haoduoc.pojo.HaoDuoCaiType;
import com.haoduoc.service.HaoDuoCaiTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HaoDuoCaiTypeController {
    @Autowired
    @Qualifier("HaoDuoCaiTypeServiceImpl")
    private HaoDuoCaiTypeService haoDuoCaiTypeService;

    //去新增类型页面
    @RequestMapping("/type/toAddType")
    public String toAddType(){
        return "Manage/mTypeAdd";
    }

    //去新增类型页面2 已有类型名 重新新增
    @RequestMapping("/type/toAddType2")
    public String toAddType2(Model model,@RequestParam(value="type",required=true) String type){
        model.addAttribute("type",type);
        return "Manage/mTypeAdd";
    }

    //新增类型
    @RequestMapping("/type/addType")
    public String addType(HaoDuoCaiType haoDuoCaiType, Model model){
        if(haoDuoCaiType !=null){
            if(haoDuoCaiTypeService.queryHaoDuoCaiTypeByName(haoDuoCaiType.getTname())==null){
                haoDuoCaiTypeService.addType(haoDuoCaiType);
                return "redirect:/manage/toType";
            }
            else {
                model.addAttribute("type","已有该类型");
                return "redirect:/type/toAddType2";
            }
        }
        return "redirect:/type/toAddType";
    }

    //去更新类型页面
    @RequestMapping("/type/toUpdateType/{tid}")
    public String toUpdateType(Model model, @PathVariable("tid") int tid){
        HaoDuoCaiType haoDuoCaiType = haoDuoCaiTypeService.queryTypeById(tid);
        model.addAttribute("haoDuoCaiType", haoDuoCaiType);
        return "Manage/mTypeUpdate";
    }

    //更新类型
    @RequestMapping("/type/updateType")
    public String updateType(HaoDuoCaiType haoDuoCaiType, String tnameupdate, Model model){
        if(haoDuoCaiType.getTname().equals(tnameupdate)){
            return "redirect:/manage/toType";
        }
        else {
            if(haoDuoCaiTypeService.queryHaoDuoCaiTypeByName(tnameupdate)==null){
                haoDuoCaiType.setTname(tnameupdate);
                haoDuoCaiTypeService.updateType(haoDuoCaiType);
                return "redirect:/manage/toType";
            }
            else {
                model.addAttribute("haoDuoCaiType", haoDuoCaiType);
                model.addAttribute("failAddType","该类型已存在");
                return "Manage/mTypeUpdate";
            }
        }
    }

    //删除类型
    @RequestMapping("/type/deleteType/{tid}")
    public String deleteType( @PathVariable("tid") int tid){
        haoDuoCaiTypeService.deleteType(tid);
        return "redirect:/manage/toType";
    }



}
