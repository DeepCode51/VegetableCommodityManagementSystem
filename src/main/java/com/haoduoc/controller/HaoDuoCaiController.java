package com.haoduoc.controller;

import com.haoduoc.pojo.HaoDuoCaiEvaluate;
import com.haoduoc.pojo.HaoDuoCaiType;
import com.haoduoc.pojo.HaoDuoCais;
import com.haoduoc.service.HaoDuoCaiEvaluateService;
import com.haoduoc.service.HaoDuoCaiTypeService;
import com.haoduoc.service.HaoDuoCaiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

@Controller
public class HaoDuoCaiController {
    @Autowired
    @Qualifier("HaoDuoCaiServiceImpl")
    private HaoDuoCaiService haoDuoCaiService;

    @Autowired
    @Qualifier("HaoDuoCaiTypeServiceImpl")
    private HaoDuoCaiTypeService haoDuoCaiTypeService;

    @Autowired
    @Qualifier("HaoDuoCaiEvaluateServiceImpl")
    private HaoDuoCaiEvaluateService haoDuoCaiEvaluateService;

    //去上传菜品页面
    @RequestMapping("/haoDuoCai/toMHaoDuoCaiUpload")
    public String toMHaoDuoCaiUpload(Model model) {
        List<HaoDuoCaiType> haoDuoCaiType = haoDuoCaiTypeService.queryHaoDuoCaiType();
        model.addAttribute("haoDuoCaiType", haoDuoCaiType);
        return "Manage/mHdcUpload";
    }
    //上传新的菜品
    @RequestMapping("/haoDuoCai/mHaoDuoCaiUpload")
    public String mHaoDuoCaiUpload(List<MultipartFile> image, HaoDuoCais haoDuoCais) throws IOException {
        String filePathImage1 = "E:\\bs\\haoduocaiSale\\web\\statics\\haoDuoCaiImage\\image1";//保存图片的路径
        System.out.println(haoDuoCais);

        if (image.get(0).getOriginalFilename()!=""&&image.get(0).getOriginalFilename()!=null) {
            if (image.size() == 1) {
                String originalFilename1 = image.get(0).getOriginalFilename();
                File targetFile = new File(filePathImage1, originalFilename1);
                if (!targetFile.exists()) {
                    //把本地文件上传到封装上传文件位置的全路径
                    image.get(0).transferTo(targetFile);
                    System.out.println("originalFilename=" + originalFilename1);
                }
                haoDuoCais.setYimage1("/statics/haoDuoCaiImage/image1/" + originalFilename1);
            }
        }

        haoDuoCaiService.addHaoDuoCai(haoDuoCais);
        System.out.println("添加后"+ haoDuoCais);
        return "redirect:/manage/toMHaoDuoCai";
    }

    //上架商品
    @RequestMapping("/haoDuoCai/mHaoDuoCaiManageChange/{ymanage}/{yid}")
    public String mHaoDuoCaiManageChange(@PathVariable("ymanage") String ymanage,@PathVariable("yid") int yid){
        if(ymanage!=null){
            haoDuoCaiService.updateHaoDuoCaisYmanage(ymanage,yid);
        }
        return "redirect:/manage/toMHaoDuoCai";
    }

    //去更新菜品页面
    @RequestMapping("/haoDuoCai/toMHaoDuoCaiUpdate/{yid}")
    public String toMHaoDuoCaiUpdate(@PathVariable("yid") int yid , Model model){
        List<HaoDuoCaiType> haoDuoCaiType = haoDuoCaiTypeService.queryHaoDuoCaiType();
        model.addAttribute("haoDuoCaiType", haoDuoCaiType);
        HaoDuoCais haoDuoCais = haoDuoCaiService.queryHaoDuoCaisById(yid);
        model.addAttribute("haoDuoCais", haoDuoCais);
        return "Manage/mHdcUpdate";
    }

    //去更新菜品
    @RequestMapping("/haoDuoCai/mHaoDuoCaiUpdate")
    public String mHaoDuoCaiUpdate(HaoDuoCais haoDuoCais, MultipartFile image1) throws IOException {
        String filePathImage1 = "E:\\bs\\haoduocaiSale\\web\\statics\\haoDuoCaiImage\\image1";//保存图片的路径

        //获取原始图片的拓展名
        String originalFilename1 = image1.getOriginalFilename();
        if (originalFilename1.equals("")||originalFilename1==null){

        }else {
            File targetFile1 = new File(filePathImage1,originalFilename1);
            if (!targetFile1.exists()){
                //把本地文件上传到封装上传文件位置的全路径
                image1.transferTo(targetFile1);
                System.out.println("originalFilename1="+originalFilename1);
            }
            haoDuoCais.setYimage1("/statics/haoDuoCaiImage/image1/"+originalFilename1);
        }


        System.out.println(haoDuoCais);
        haoDuoCaiService.updateHaoDuoCais(haoDuoCais);
        return "redirect:/manage/toMHaoDuoCai";
    }

    //删除菜品通过id
    @RequestMapping("/haoDuoCai/mHaoDuoCaiDelete/{yid}")
    public String mHaoDuoCaiDelete(@PathVariable("yid") int yid){
        if(!"".equals(yid)){
            haoDuoCaiService.deleteHaoDuoCaisById(yid);
        }
        return "redirect:/manage/toMHaoDuoCai";
    }

    //去肉类或蔬菜分类页面
    @RequestMapping("/haoDuoCai/toHaoDuoCaiRange/{yrange}")
    public String toHaoDuoCaiRange(@PathVariable("yrange") String yrange,Model model){
        List<HaoDuoCaiType> haoDuoCaiType = haoDuoCaiTypeService.queryHaoDuoCaiType();
        model.addAttribute("haoDuoCaiType", haoDuoCaiType);

        HashMap map = new HashMap();
        map.put("yrange",yrange);
        List<HaoDuoCais> haoDuoCailist = haoDuoCaiService.queryHaoDuoCaisRange(map);
        model.addAttribute("haoDuoCailist",haoDuoCailist);
        model.addAttribute("map",map);
        return "Haoduocais/hdcRange";
    }

    //前往类型分类页面
    @RequestMapping("/haoDuoCai/toHaoDuoCaiType/{ytype}/{yrange}")
    public String toHaoDuoCaiType(@PathVariable("ytype")String ytype,@PathVariable("yrange") String yrange, Model model){
        HashMap map = new HashMap();
        map.put("ytype",ytype);
        map.put("yrange",yrange);
        model.addAttribute("map",map);
        List<HaoDuoCais> haoDuoCailist = haoDuoCaiService.queryHaoDuoCaisRange(map);
        model.addAttribute("haoDuoCailist",haoDuoCailist);
        List<HaoDuoCaiType> haoDuoCaiType = haoDuoCaiTypeService.queryHaoDuoCaiType();
        model.addAttribute("haoDuoCaiType", haoDuoCaiType);
        return "Haoduocais/hdcType";
    }

    //去页面销售降序
    @RequestMapping("/haoDuoCai/toHaoDuoCaiRank/{yrange}/{rank}")
    public String toHaoDuoCaiRank(@PathVariable("yrange") String yrange,@PathVariable("rank") String rank,Model model){
        HashMap map = new HashMap();
        if(rank.equals("ysale")){
            map.put("ysale","ysale");
        }
        else if(rank.equals("asc")){
            map.put("asc","asc");
        }
        else if(rank.equals("desc")){
            map.put("desc","desc");
        }
        List<HaoDuoCaiType> haoDuoCaiType = haoDuoCaiTypeService.queryHaoDuoCaiType();
        model.addAttribute("haoDuoCaiType", haoDuoCaiType);
        map.put("yrange",yrange);
        List<HaoDuoCais> haoDuoCailist = haoDuoCaiService.queryHaoDuoCaisRange(map);
        model.addAttribute("haoDuoCailist",haoDuoCailist);
        model.addAttribute("map",map);
        return "Haoduocais/hdcRange";
    }

    //前往类型分类页面
    @RequestMapping("/haoDuoCai/toHaoDuoCaiTypeRank/{ytype}/{yrange}/{rank}")
    public String toHaoDuoCaiTypeRank(@PathVariable("ytype")String ytype,@PathVariable("yrange") String yrange,@PathVariable("rank") String rank, Model model){
        HashMap map = new HashMap();
        if(rank.equals("ysale")){
            map.put("ysale","ysale");
        }
        else if(rank.equals("asc")){
            map.put("asc","asc");
        }
        else if(rank.equals("desc")){
            map.put("desc","desc");
        }
        map.put("ytype",ytype);
        map.put("yrange",yrange);
        model.addAttribute("map",map);
        List<HaoDuoCais> haoDuoCailist = haoDuoCaiService.queryHaoDuoCaisRange(map);
        model.addAttribute("haoDuoCailist",haoDuoCailist);
        List<HaoDuoCaiType> haoDuoCaiType = haoDuoCaiTypeService.queryHaoDuoCaiType();
        model.addAttribute("haoDuoCaiType", haoDuoCaiType);
        return "Haoduocais/hdcType";
    }

    //去菜品详情页面
    @RequestMapping("/haoDuoCai/toHaoDuoCaiInfo/{yid}")
    public String toHaoDuoCaiInfo(@PathVariable("yid")int yid,Model model){
        //通过yid查询该菜品信息
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

    //用户搜索菜品
    @RequestMapping("/haoDuoCai/searchHaoDuoCais")
    public String searchHaoDuoCais(String yname,Model model){
        List<HaoDuoCais> haoDuoCailist = haoDuoCaiService.queryHaoDuoCaisByName(yname);
        model.addAttribute("haoDuoCailist",haoDuoCailist);
        return "Haoduocais/hdcSearch";
    }

}
