package com.haoduoc.service;

import com.haoduoc.pojo.HaoDuoCaiEvaluate;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface HaoDuoCaiEvaluateService {

    //评价该订单
    int addHaoDuoCaiEvaluate(HaoDuoCaiEvaluate haoDuoCaiEvaluate);
    //通过yoid查询该评论信息
    HaoDuoCaiEvaluate queryEvaluateByYoid(String yoid);
    //通过yoid删除评价信息
    int deleteEvaluateByYoid(String yoid);
    //管理员查看所有评论
    List<HaoDuoCaiEvaluate> queryAllEvaluate();
    //管理员查看评论总数
    int queryEvaluateCount();
    //用户查看商品评论
    List<HaoDuoCaiEvaluate> queryHaoDuoCaiEvaluate(int yid);
}
