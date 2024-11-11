package com.haoduoc.service;

import com.haoduoc.dao.HaoDuoCaiEvaluateMapper;
import com.haoduoc.pojo.HaoDuoCaiEvaluate;

import java.util.List;

public class HaoDuoCaiEvaluateServiceImpl implements HaoDuoCaiEvaluateService {

    private HaoDuoCaiEvaluateMapper haoDuoCaiEvaluateMapper;

    public void setHaoDuoCaiEvaluateMapper(HaoDuoCaiEvaluateMapper haoDuoCaiEvaluateMapper) {
        this.haoDuoCaiEvaluateMapper = haoDuoCaiEvaluateMapper;
    }

    @Override
    public int addHaoDuoCaiEvaluate(HaoDuoCaiEvaluate haoDuoCaiEvaluate) {
        return haoDuoCaiEvaluateMapper.addHaoDuoCaiEvaluate(haoDuoCaiEvaluate);
    }

    @Override
    public HaoDuoCaiEvaluate queryEvaluateByYoid(String yoid) {
        return haoDuoCaiEvaluateMapper.queryEvaluateByYoid(yoid);
    }

    @Override
    public int deleteEvaluateByYoid(String yoid) {
        return haoDuoCaiEvaluateMapper.deleteEvaluateByYoid(yoid);
    }

    @Override
    public List<HaoDuoCaiEvaluate> queryAllEvaluate() {
        return haoDuoCaiEvaluateMapper.queryAllEvaluate();
    }

    @Override
    public int queryEvaluateCount() {
        return haoDuoCaiEvaluateMapper.queryEvaluateCount();
    }

    @Override
    public List<HaoDuoCaiEvaluate> queryHaoDuoCaiEvaluate(int yid) {
        return haoDuoCaiEvaluateMapper.queryHaoDuoCaiEvaluate(yid);
    }
}
