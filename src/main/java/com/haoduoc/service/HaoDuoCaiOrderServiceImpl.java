package com.haoduoc.service;

import com.haoduoc.dao.HaoDuoCaiOrderMapper;
import com.haoduoc.pojo.HaoDuoCaiOrder;

import java.util.List;
import java.util.Map;

public class HaoDuoCaiOrderServiceImpl implements HaoDuoCaiOrderService {

    private HaoDuoCaiOrderMapper haoDuoCaiOrderMapper;

    public void setHaoDuoCaiOrderMapper(HaoDuoCaiOrderMapper haoDuoCaiOrderMapper) {
        this.haoDuoCaiOrderMapper = haoDuoCaiOrderMapper;
    }

    @Override
    public int addHaoDuoCaiOrder(HaoDuoCaiOrder haoDuoCaiOrder) {
        return haoDuoCaiOrderMapper.addHaoDuoCaiOrder(haoDuoCaiOrder);
    }

    @Override
    public int queryOrderCount() {
        return haoDuoCaiOrderMapper.queryOrderCount();
    }

    @Override
    public List<HaoDuoCaiOrder> queryUserOrder(Map map) {
        return haoDuoCaiOrderMapper.queryUserOrder(map);
    }

    @Override
    public int updateIsreceive(String yoid) {
        return haoDuoCaiOrderMapper.updateIsreceive(yoid);
    }

    @Override
    public HaoDuoCaiOrder queryOrderByYoid(String yoid) {
        return haoDuoCaiOrderMapper.queryOrderByYoid(yoid);
    }

    @Override
    public int updateIsevaluate(String yoid) {
        return haoDuoCaiOrderMapper.updateIsevaluate(yoid);
    }

    @Override
    public int updateIsrefundprocess(String yoid) {
        return haoDuoCaiOrderMapper.updateIsrefundprocess(yoid);
    }

    @Override
    public List<HaoDuoCaiOrder> queryAllOrder(int startPlace, int pageSize) {
        return haoDuoCaiOrderMapper.queryAllOrder(startPlace, pageSize);
    }


    @Override
    public int updateYastatus(String yoid) {
        return haoDuoCaiOrderMapper.updateYastatus(yoid);
    }

    @Override
    public int deleteOrderById(String yoid) {
        return haoDuoCaiOrderMapper.deleteOrderById(yoid);
    }
}
