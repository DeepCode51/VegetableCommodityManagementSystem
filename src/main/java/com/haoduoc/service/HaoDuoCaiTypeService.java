package com.haoduoc.service;

import com.haoduoc.pojo.HaoDuoCaiType;

import java.util.List;

public interface HaoDuoCaiTypeService {
    //查看所有菜品的类型
    List<HaoDuoCaiType> queryHaoDuoCaiType();
    //通过名字查询类型
    HaoDuoCaiType queryHaoDuoCaiTypeByName(String tname);
    //新增类型
    int addType(HaoDuoCaiType haoDuoCaiType);
    //删除类型
    int deleteType(int tid);
    //通过id查找类型
    HaoDuoCaiType queryTypeById(int tid);
    //更新类型
    int updateType(HaoDuoCaiType haoDuoCaiType);
}
