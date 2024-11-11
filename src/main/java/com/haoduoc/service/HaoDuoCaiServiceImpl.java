package com.haoduoc.service;

import com.haoduoc.dao.HaoDuoCaiMapper;
import com.haoduoc.pojo.HaoDuoCais;

import java.util.List;
import java.util.Map;

public class HaoDuoCaiServiceImpl implements HaoDuoCaiService {

    private HaoDuoCaiMapper haoDuoCaiMapper;

    public void setHaoDuoCaiMapper(HaoDuoCaiMapper haoDuoCaiMapper) {
        this.haoDuoCaiMapper = haoDuoCaiMapper;
    }

    @Override
    public int addHaoDuoCai(HaoDuoCais haoDuoCais) {
        return haoDuoCaiMapper.addHaoDuoCai(haoDuoCais);
    }

    @Override
    public List<HaoDuoCais> queryAllHaoDuoCais() {
        return haoDuoCaiMapper.queryAllHaoDuoCais();
    }

    @Override
    public int updateHaoDuoCaisYmanage(String ymanage, int yid) {
        return haoDuoCaiMapper.updateHaoDuoCaisYmanage(ymanage,yid);
    }

    @Override
    public HaoDuoCais queryHaoDuoCaisById(int yid) {
        return haoDuoCaiMapper.queryHaoDuoCaisById(yid);
    }

    @Override
    public int updateHaoDuoCais(HaoDuoCais haoDuoCais) {
        return haoDuoCaiMapper.updateHaoDuoCais(haoDuoCais);
    }

    @Override
    public int deleteHaoDuoCaisById(int yid) {
        return haoDuoCaiMapper.deleteHaoDuoCaisById(yid);
    }

    @Override
    public List<HaoDuoCais> queryHaoDuoCaisRange(Map map) {
        return haoDuoCaiMapper.queryHaoDuoCaisRange(map);
    }

    @Override
    public List<HaoDuoCais> queryHaoDuoCaisType(String ytype) {
        return haoDuoCaiMapper.queryHaoDuoCaisType(ytype);
    }

    @Override
    public int addHaoDuoCaiYsale(int yid, int ysale) {
        return haoDuoCaiMapper.addHaoDuoCaiYsale(yid, ysale);
    }

    @Override
    public int addHaoDuoCaiInventory(int yid, int inventory) { return haoDuoCaiMapper.addHaoDuoCaiYsale(yid, inventory); }

    @Override
    public List<HaoDuoCais> queryHaoDuoCaisByName(String yname) {
        return haoDuoCaiMapper.queryHaoDuoCaisByName(yname);
    }

    @Override
    public List<HaoDuoCais> queryHaoDuoCaisSame(HaoDuoCais haoDuoCais) {
        return haoDuoCaiMapper.queryHaoDuoCaisSame(haoDuoCais);
    }

    @Override
    public List<HaoDuoCais> queryHaoDuoCaisBySale() {
        return haoDuoCaiMapper.queryHaoDuoCaisBySale();
    }


}
